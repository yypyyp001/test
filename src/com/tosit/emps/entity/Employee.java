package com.tosit.emps.entity;

import com.tosit.emps.common.util.DateUtil;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable{
   private  Integer id;
   private  int empno;
   private  String ename;
   private  String job;
   private  int mgr;
   private  Date hiredate;
   private  String hiredateStr;
   private  double sal;
   private  double comm;
   private  int deptno;

    public Employee() {
    }

    public Employee(Integer id, int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno) {
        this.id = id;
        this.empno = empno;
        this.ename = ename;
        this.job = job;
        this.mgr = mgr;
        this.hiredate = hiredate;
        this.sal = sal;
        this.comm = comm;
        this.deptno = deptno;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getMgr() {
        return mgr;
    }

    public void setMgr(int mgr) {
        this.mgr = mgr;
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public double getSal() {
        return sal;
    }

    public void setSal(double sal) {
        this.sal = sal;
    }

    public double getComm() {
        return comm;
    }

    public void setComm(double comm) {
        this.comm = comm;
    }

    public int getDeptno() {
        return deptno;
    }

    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }


    public String getHiredateStr() {
        if(this.getHiredate()!=null){
            return DateUtil.FormatDate4Pattern1(this.getHiredate());
        }
        return null;
    }

    public String getAbc() {//
        return "ABCABC";
    }
    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", empno=" + empno +
                ", ename='" + ename + '\'' +
                ", job='" + job + '\'' +
                ", mgr=" + mgr +
                ", hiredate=" + hiredate +
                ", sal=" + sal +
                ", comm=" + comm +
                ", deptno=" + deptno +
                '}';
    }
}
