@implementation PKPaymentPassRequest

- (PKPaymentPassRequest)initWithPassTypeID:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassRequest *v8;
  uint64_t v9;
  NSString *passTypeID;
  uint64_t v11;
  NSString *serialNumber;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    passTypeID = v8->_passTypeID;
    v8->_passTypeID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    serialNumber = v8->_serialNumber;
    v8->_serialNumber = (NSString *)v11;

  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  NSString *passTypeID;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  NSString *v15;
  NSString *serialNumber;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  passTypeID = self->_passTypeID;
  v14 = CFSTR("passes");
  v15 = passTypeID;
  serialNumber = self->_serialNumber;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v9, v10, 0, v8, v14, v15, serialNumber, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("GET"));
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (NSString)passTypeID
{
  return self->_passTypeID;
}

- (void)setPassTypeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeID, 0);
}

@end
