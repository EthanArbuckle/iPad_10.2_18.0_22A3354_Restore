@implementation PKServiceProviderPaymentRequest

- (PKServiceProviderPaymentRequest)initWithServiceProviderOrder:(id)a3
{
  return -[PKServiceProviderPaymentRequest initWithServiceProviderOrder:targetDeviceSerialNumber:](self, "initWithServiceProviderOrder:targetDeviceSerialNumber:", a3, 0);
}

- (PKServiceProviderPaymentRequest)initWithServiceProviderOrder:(id)a3 targetDeviceSerialNumber:(id)a4
{
  id v7;
  id v8;
  PKServiceProviderPaymentRequest *v9;
  PKServiceProviderPaymentRequest *v10;
  uint64_t v11;
  NSString *targetDeviceSerialNumber;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKServiceProviderPaymentRequest;
  v9 = -[PKPaymentRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProviderOrder, a3);
    v11 = objc_msgSend(v8, "copy");
    targetDeviceSerialNumber = v10->_targetDeviceSerialNumber;
    v10->_targetDeviceSerialNumber = (NSString *)v11;

    -[PKPaymentRequest setRequestType:](v10, "setRequestType:", 8);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PKServiceProviderOrder *serviceProviderOrder;
  uint64_t v6;
  void *v7;
  BOOL v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKServiceProviderPaymentRequest;
  if (-[PKPaymentRequest isEqual:](&v11, sel_isEqual_, v4))
  {
    serviceProviderOrder = self->_serviceProviderOrder;
    objc_msgSend(v4, "serviceProviderOrder");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (serviceProviderOrder)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
      v9 = serviceProviderOrder == (PKServiceProviderOrder *)v6;
    else
      v9 = -[PKServiceProviderOrder isEqual:](serviceProviderOrder, "isEqual:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKServiceProviderPaymentRequest *v5;
  uint64_t v6;
  PKServiceProviderOrder *serviceProviderOrder;
  uint64_t v8;
  NSString *targetDeviceSerialNumber;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKServiceProviderPaymentRequest;
  v5 = -[PKPaymentRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderOrder"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceProviderOrder = v5->_serviceProviderOrder;
    v5->_serviceProviderOrder = (PKServiceProviderOrder *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetDeviceSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetDeviceSerialNumber = v5->_targetDeviceSerialNumber;
    v5->_targetDeviceSerialNumber = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKServiceProviderPaymentRequest;
  v4 = a3;
  -[PKPaymentRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceProviderOrder, CFSTR("serviceProviderOrder"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetDeviceSerialNumber, CFSTR("targetDeviceSerialNumber"));

}

+ (id)availableNetworks
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PKServiceProviderPaymentRequest;
  objc_msgSendSuper2(&v5, sel_availableNetworks);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Barcode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)merchantIdentifier
{
  return -[PKServiceProviderOrder serviceProviderIdentifier](self->_serviceProviderOrder, "serviceProviderIdentifier");
}

- (PKServiceProviderOrder)serviceProviderOrder
{
  return self->_serviceProviderOrder;
}

- (NSString)targetDeviceSerialNumber
{
  return self->_targetDeviceSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_serviceProviderOrder, 0);
}

@end
