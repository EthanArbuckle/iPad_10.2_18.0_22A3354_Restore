@implementation PKBarcodeEventMetadataRequest

- (PKBarcodeEventMetadataRequest)initWithBarcodeIdentifier:(id)a3 deviceAccountIdentifier:(id)a4
{
  id v7;
  id v8;
  PKBarcodeEventMetadataRequest *v9;
  PKBarcodeEventMetadataRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBarcodeEventMetadataRequest;
  v9 = -[PKBarcodeEventMetadataRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastUsedBarcodeIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceAccountIdentifier, a4);
  }

  return v10;
}

- (PKBarcodeEventMetadataRequest)initWithCoder:(id)a3
{
  id v4;
  PKBarcodeEventMetadataRequest *v5;
  uint64_t v6;
  NSString *lastUsedBarcodeIdentifier;
  uint64_t v8;
  NSString *deviceAccountIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodeEventMetadataRequest;
  v5 = -[PKBarcodeEventMetadataRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUsedBarcodeIdentifier = v5->_lastUsedBarcodeIdentifier;
    v5->_lastUsedBarcodeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAccountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *lastUsedBarcodeIdentifier;
  id v5;

  lastUsedBarcodeIdentifier = self->_lastUsedBarcodeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastUsedBarcodeIdentifier, CFSTR("barcodeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceAccountIdentifier, CFSTR("deviceAccountIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; lastUsedBarcodeIdentifier: %@; deviceAccountIdentifier: %@>"),
               objc_opt_class(),
               self,
               self->_lastUsedBarcodeIdentifier,
               self->_deviceAccountIdentifier);
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)lastUsedBarcodeIdentifier
{
  return self->_lastUsedBarcodeIdentifier;
}

- (void)setLastUsedBarcodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

@end
