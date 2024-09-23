@implementation PKPeerPaymentPaymentModeIdentifiers

- (PKPeerPaymentPaymentModeIdentifiers)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentPaymentModeIdentifiers *v5;
  void *v6;
  uint64_t v7;
  NSString *deviceTap;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentPaymentModeIdentifiers;
  v5 = -[PKPeerPaymentPaymentModeIdentifiers init](&v10, sel_init);
  if (v5)
  {
    PKPeerPaymentPaymentModeToString(2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    deviceTap = v5->_deviceTap;
    v5->_deviceTap = (NSString *)v7;

  }
  return v5;
}

- (id)identifierForPaymentMode:(unint64_t)a3
{
  if (a3 == 2)
    return self->_deviceTap;
  else
    return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPaymentModeIdentifiers)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPaymentModeIdentifiers *v5;
  uint64_t v6;
  NSString *deviceTap;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentPaymentModeIdentifiers;
  v5 = -[PKPeerPaymentPaymentModeIdentifiers init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceTap"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceTap = v5->_deviceTap;
    v5->_deviceTap = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_deviceTap, CFSTR("deviceTap"));
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_deviceTap);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *deviceTap;
  NSString *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    deviceTap = self->_deviceTap;
    v6 = (NSString *)v4[1];
    if (deviceTap && v6)
      v7 = -[NSString isEqual:](deviceTap, "isEqual:");
    else
      v7 = deviceTap == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceTap: '%@'; "), self->_deviceTap);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)deviceTap
{
  return self->_deviceTap;
}

- (void)setDeviceTap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceTap, 0);
}

@end
