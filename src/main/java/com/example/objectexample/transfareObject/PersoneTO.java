package com.example.objectexample.transfareObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PersoneTO implements Serializable {
    private String name;
    private Address address;
    private int age;
    List<String> phones = new ArrayList<>();

    public PersoneTO(){}
    public PersoneTO(String name, Address address, int age, List<String> phones){
        this.address = address;
        this.age = age;
        this.phones = phones;
        this.name = name;
    }

    public void setPhones(List<String> phones) {
        this.phones = phones;
    }

    public void setPhone(String phone){
        if(!phones.contains(phone)){
            phones.add(phone);
        }
    }

    public List<String> getPhones() {
        return phones;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Address getAddress() {
        return address;
    }

    public int hashCode(){
        int a = 7;
        a = 7 * a + name.hashCode();
        a = 7 * a + address.hashCode();
        a = 7 * a + age;
        a = 7 * a + phones.hashCode();
        return a;
    }

    @Override
    public boolean equals(Object obj) {
        if( obj == null){
            return false;
        }if(obj == this){
            return true;
        }if(!(obj instanceof PersoneTO)){
            return false;
        }
        PersoneTO personeTO = (PersoneTO) obj;
        return personeTO.age == this.age && personeTO.address.equals(this.address) && personeTO.name.equals(this.name) && personeTO.phones.equals(personeTO.phones);
    }
}
