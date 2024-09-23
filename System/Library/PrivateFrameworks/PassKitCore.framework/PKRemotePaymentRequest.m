@implementation PKRemotePaymentRequest

- (PKRemotePaymentRequest)initWithDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PKRemotePaymentRequest *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKRemotePaymentRequest initWithDevice:identifier:](self, "initWithDevice:identifier:", v5, v7);

  return v8;
}

- (PKRemotePaymentRequest)initWithDevice:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  PKRemotePaymentRequest *v9;
  PKRemotePaymentRequest *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKRemotePaymentRequest;
  v9 = -[PKRemotePaymentRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemotePaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKRemotePaymentRequest *v5;
  uint64_t v6;
  PKPaymentRequest *paymentRequest;
  uint64_t v8;
  PKRemoteDevice *device;
  uint64_t v10;
  NSString *selectedApplicationIdentifier;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRemotePaymentRequest;
  v5 = -[PKRemotePaymentRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentRequest = v5->_paymentRequest;
    v5->_paymentRequest = (PKPaymentRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v8 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (PKRemoteDevice *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedApplicationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    selectedApplicationIdentifier = v5->_selectedApplicationIdentifier;
    v5->_selectedApplicationIdentifier = (NSString *)v10;

    v5->_selectedPaymentMethodType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedPaymentMethodType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentRequest *paymentRequest;
  id v5;

  paymentRequest = self->_paymentRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paymentRequest, CFSTR("paymentRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_device, CFSTR("device"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedApplicationIdentifier, CFSTR("selectedApplicationIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectedPaymentMethodType, CFSTR("selectedPaymentMethodType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (BOOL)isEqual:(id)a3
{
  PKRemotePaymentRequest *v4;
  PKRemotePaymentRequest *v5;
  BOOL v6;

  v4 = (PKRemotePaymentRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemotePaymentRequest isEqualToRemoteRequest:](self, "isEqualToRemoteRequest:", v5);

  return v6;
}

- (BOOL)isEqualToRemoteRequest:(id)a3
{
  _QWORD *v4;
  PKRemoteDevice *device;
  PKRemoteDevice *v6;
  BOOL v7;
  char v8;
  NSString *identifier;
  NSString *v10;

  v4 = a3;
  device = self->_device;
  v6 = (PKRemoteDevice *)v4[1];
  if (device)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKRemoteDevice isEqual:](device, "isEqual:"))
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (device != v6)
    goto LABEL_7;
LABEL_9:
  identifier = self->_identifier;
  v10 = (NSString *)v4[4];
  if (identifier && v10)
    v8 = -[NSString isEqual:](identifier, "isEqual:");
  else
    v8 = identifier == v10;
LABEL_13:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  PKRemoteDevice *device;
  void *v6;
  unint64_t selectedPaymentMethodType;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@; "), self->_identifier);
  device = self->_device;
  if (device)
  {
    -[PKRemoteDevice deviceName](device, "deviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("device: %@; "), v6);

  }
  if (self->_selectedApplicationIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("selectedApplicationIdentifier: %@; "),
      self->_selectedApplicationIdentifier);
  selectedPaymentMethodType = self->_selectedPaymentMethodType;
  if (selectedPaymentMethodType)
  {
    PKPaymentMethodTypeToString(selectedPaymentMethodType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("selectedPaymentMethodType: %@; "), v8);

  }
  if (self->_paymentRequest)
    objc_msgSend(v4, "appendFormat:", CFSTR("paymentRequest: %@"), self->_paymentRequest);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (PKRemoteDevice)device
{
  return self->_device;
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRequest, a3);
}

- (NSString)selectedApplicationIdentifier
{
  return self->_selectedApplicationIdentifier;
}

- (void)setSelectedApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)selectedPaymentMethodType
{
  return self->_selectedPaymentMethodType;
}

- (void)setSelectedPaymentMethodType:(unint64_t)a3
{
  self->_selectedPaymentMethodType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_selectedApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
