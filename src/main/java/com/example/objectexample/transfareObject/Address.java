package com.example.objectexample.transfareObject;

public class Address {
    private String city;
    private String country;
    private int zipCode;

    public Address(String city, String country, int zipCode) {
        this.city = city;
        this.country = country;
        this.zipCode = zipCode;
    }

    public Address() {
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public int getZipCode() {
        return zipCode;
    }

    public int hashCode() {
        int a = 7;
        a = 7 * a + country.hashCode();
        a = 7 * a + city.hashCode();
        a = 7 * a + zipCode;
        return a;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        }
        if (o == this) {
            return true;
        }
        if (!(o instanceof Address)) {
            return false;
        }
        Address obj = (Address) o;
        return obj.city.equals(this.city) && obj.country.equals(this.country) && obj.zipCode == this.zipCode;
    }
}
