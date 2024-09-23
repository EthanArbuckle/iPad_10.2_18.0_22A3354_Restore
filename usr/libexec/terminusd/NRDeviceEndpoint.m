@implementation NRDeviceEndpoint

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("NRDeviceEndpoint["));
  v4 = v3;
  if (self->_name)
    objc_msgSend(v3, "appendFormat:", CFSTR("name:%@ "), self->_name);
  if (self->_model)
    objc_msgSend(v4, "appendFormat:", CFSTR("model:%@ "), self->_model);
  if (self->_serviceName)
    objc_msgSend(v4, "appendFormat:", CFSTR("svc:%@"), self->_serviceName);
  objc_msgSend(v4, "appendString:", CFSTR("]"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTypeToIntfName, 0);
  objc_storeStrong((id *)&self->_linkTypeToEndpoint, 0);
  objc_storeStrong((id *)&self->_rpIdentifier, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_cbUUID, 0);
  objc_storeStrong((id *)&self->_localToken, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
  objc_storeStrong((id *)&self->_localIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_remoteIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
