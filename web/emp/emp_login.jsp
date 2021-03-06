<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/layout2_setup.css" />
    <link rel="stylesheet" type="text/css" href="../css/layout2_text.css" />
    <title></title>
</head>

<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<div class="page-container">


    <div class="header">

        <div class="header-middle">

            <a class="sitelogo" href="#" title="Go to Start page"></a>
            <div class="sitename">
                <h1><a href="index.html" title="Go to Start page">员工管理系统<span style="font-weight:normal;font-size:50%;">—教学案例</span></a></h1>
                <h2>足下教育</h2>
            </div>

        </div>

        <div class="header-bottom">

            <div class="nav2">

                <ul>
                    <li><a href="index.html">系统首页</a></li>
                </ul>

                <ul>
                    <li><a href="#">员工管理<!--[if IE 7]><!--></a><!--<![endif]-->
                        <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                            <li><a href="#">员工管理</a></li>
                            <li><a href="#">添加员工</a></li>
                        </ul>
                        <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                </ul>

            </div>
        </div>


        <div class="header-breadcrumbs">
            <ul>
                <li><a href="#">首页</a></li>
                <li><a href="#">用户登录</a></li>

            </ul>


        </div>
    </div>


    <div class="main">

        <div class="main-navigation">

            <div class="round-border-topright"></div>
            <h1 class="first">登录说明<br /></h1>
            <p>登录成功后跳转到 列表页面<br /></p>




        </div>

        <div class="main-content">

            <h1 class="pagetitle">用户登录</h1>




            <div class="column1-unit">
                <div class="contactform">
                    <form method="post" action="emp_list.html">
                        <input type="hidden" name="id" value=""/>
                        <fieldset><legend>&nbsp;基本信息&nbsp;</legend>
                            <p><label for="name" class="left">用户名:</label>
                                <input type="text" name="name" id="name" class="field" value="" tabindex="1" />
                            </p>

                            <p><label for="hire_date" class="left">密码:</label>
                                <input type="text" name="hireDate" id="hire_date" class="field" value="" tabindex="1" /></p>


                            <p><input type="submit" name="submit" id="submit" class="button" value="登录" tabindex="6" /></p>
                        </fieldset>

                    </form>
                </div>
            </div>

        </div>
    </div>


    <div class="footer">
        <p>Copyright &copy; 2010 员工管理系统—教学案例 | All Rights Reserved</p>
        <p class="credits"></p>
    </div>
</div>

</body>
</html>



