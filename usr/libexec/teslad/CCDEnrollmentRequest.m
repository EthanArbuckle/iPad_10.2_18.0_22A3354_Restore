@implementation CCDEnrollmentRequest

- (id)_enrollmentURL
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest enrollmentURLString](self, "enrollmentURLString"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  return v5;
}

- (CCDEnrollmentRequest)requestWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest requestPayload](self, "requestPayload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest _enrollmentURL](self, "_enrollmentURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest privateKey](self, "privateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest clientCertificates](self, "clientCertificates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceIdentitySupport requestWithPayload:URL:privateKey:clientCertificates:outError:](CCDDeviceIdentitySupport, "requestWithPayload:URL:privateKey:clientCertificates:outError:", v5, v6, v7, v8, a3));

  return (CCDEnrollmentRequest *)v9;
}

- (NSString)enrollmentURLString
{
  return self->_enrollmentURLString;
}

- (CCDRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (id)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
  objc_storeStrong(&self->_privateKey, a3);
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_clientCertificates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong(&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_requestPayload, 0);
  objc_storeStrong((id *)&self->_enrollmentURLString, 0);
}

@end
