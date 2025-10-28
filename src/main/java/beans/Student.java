package beans;
public class Student {
    private String name;
    private String rollNo;
    private String gender;
    private String branch;
    private String yearSem;
    private String contactNo;

    public Student() {
    	super();
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getRollNo() {
        return rollNo;
    }
    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBranch() {
        return branch;
    }
    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getYearSem() {
        return yearSem;
    }
    public void setYearSem(String yearSem) {
        this.yearSem = yearSem;
    }

    public String getContactNo() {
        return contactNo;
    }
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
}
