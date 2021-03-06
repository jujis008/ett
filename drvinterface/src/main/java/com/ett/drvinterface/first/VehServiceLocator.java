/**
 * VehServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ett.drvinterface.first;

public class VehServiceLocator extends org.apache.axis.client.Service implements com.ett.drvinterface.first.VehService {

    public VehServiceLocator() {
    }


    public VehServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public VehServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for Veh
    private java.lang.String Veh_address = "http://59.41.46.245:9080/servweb/services/Veh";

    public java.lang.String getVehAddress() {
        return Veh_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String VehWSDDServiceName = "Veh";

    public java.lang.String getVehWSDDServiceName() {
        return VehWSDDServiceName;
    }

    public void setVehWSDDServiceName(java.lang.String name) {
        VehWSDDServiceName = name;
    }

    public com.ett.drvinterface.first.Veh getVeh() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(Veh_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getVeh(endpoint);
    }

    public com.ett.drvinterface.first.Veh getVeh(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.ett.drvinterface.first.VehSoapBindingStub _stub = new com.ett.drvinterface.first.VehSoapBindingStub(portAddress, this);
            _stub.setPortName(getVehWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setVehEndpointAddress(java.lang.String address) {
        Veh_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.ett.drvinterface.first.Veh.class.isAssignableFrom(serviceEndpointInterface)) {
                com.ett.drvinterface.first.VehSoapBindingStub _stub = new com.ett.drvinterface.first.VehSoapBindingStub(new java.net.URL(Veh_address), this);
                _stub.setPortName(getVehWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("Veh".equals(inputPortName)) {
            return getVeh();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://service.ws.tmri.com", "VehService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://service.ws.tmri.com", "Veh"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("Veh".equals(portName)) {
            setVehEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
