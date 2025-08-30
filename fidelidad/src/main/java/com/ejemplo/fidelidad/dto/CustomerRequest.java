package com.ejemplo.fidelidad.dto;

public class CustomerRequest {
    private Long idTypeId;
    private String idNumber;
    private String firstName;
    private String lastName;
    private String birthDate;
    private String address;
    private Long cityId;
    private Long brandId;

    public Long getIdTypeId() { return idTypeId; }
    public void setIdTypeId(Long idTypeId) { this.idTypeId = idTypeId; }

    public String getIdNumber() { return idNumber; }
    public void setIdNumber(String idNumber) { this.idNumber = idNumber; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getBirthDate() { return birthDate; }
    public void setBirthDate(String birthDate) { this.birthDate = birthDate; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Long getCityId() { return cityId; }
    public void setCityId(Long cityId) { this.cityId = cityId; }

    public Long getBrandId() { return brandId; }
    public void setBrandId(Long brandId) { this.brandId = brandId; }
}

