package com.tosit.emps.servlet;

import com.tosit.emps.annotation.RequestPath;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DispatcherServlet extends HttpServlet {
    String[] scanPackage = null;
    ClassLoader contextClassLoader = null;
    List<String> scanClassNames = new ArrayList<>();
    Map<String,PathMapEntity> pathMapping= new HashMap<>();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        System.out.println(uri);
        //
        if(uri.indexOf(".")!=-1){
            uri = uri.substring(0,uri.indexOf("."));
        }
        PathMapEntity pathMapEntity = pathMapping.get(uri);
        try {
            Object obj = pathMapEntity.getClazz().newInstance();
            String rs = (String) (pathMapEntity.getMethod().invoke(obj,request,response));
            if(rs!=null){
                request.getRequestDispatcher("/"+rs+".jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void init() throws ServletException {
        String allPackage = this.getServletConfig().getInitParameter("scan-package");//
        contextClassLoader = Thread.currentThread().getContextClassLoader();
        //1  读取配置的路径
        if (allPackage == null) {
            //System.out.println("见鬼了");
            throw new MVCException("scan-package not Found!");
        } else {
            scanPackage = allPackage.split(",");//2
        }
        //根据路径找出所有的类名!!
        if (scanPackage != null && scanPackage.length > 0) {
            for (String eachPackage :
                    scanPackage) {
                String packName = eachPackage.trim();
                String packPath = packName.replaceAll("\\.", "/");
                URL resource = contextClassLoader.getResource(packPath);//com.tosit.emps.action
                String filepath = resource.getPath();
                File classDir = new File(filepath);
                File[] allCalssFile = classDir.listFiles();
                for (File f :
                        allCalssFile) {
                    String className = packName+"."+f.getName().substring(0,f.getName().indexOf("."));
                    scanClassNames.add(className);
                }
            }
        }

        // 解释类,得到路径映射的实体 Map
        for (String className:scanClassNames  ) {
            try {
                Class clazz  = Class.forName(className);
                String nameSpaceStr = "";
                RequestPath nameSpace = (RequestPath) clazz.getAnnotation(RequestPath.class);
                if(nameSpace!=null){
                    nameSpaceStr = nameSpace.value();
                }

                Method[] methods = clazz.getMethods();
                for (Method eachMethod :
                        methods) {
                    RequestPath path = (RequestPath) eachMethod.getAnnotation(RequestPath.class);
                    if(path!=null){
                        String value =path.value();
                        String urlpath =  nameSpaceStr+value;
                        PathMapEntity pathMapEntity = new PathMapEntity(urlpath, clazz, eachMethod);
                        pathMapping.put(pathMapEntity.getPath(),pathMapEntity);
                    }
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }


}