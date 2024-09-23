@implementation PKPaymentDevicePlatfomData

- (PKPaymentDevicePlatfomData)initWithCoder:(id)a3
{
  id v4;
  PKPaymentDevicePlatfomData *v5;
  uint64_t v6;
  NSData *platformData;
  uint64_t v8;
  NSData *platformDataSignature;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentDevicePlatfomData;
  v5 = -[PKPaymentDevicePlatfomData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformData"));
    v6 = objc_claimAutoreleasedReturnValue();
    platformData = v5->_platformData;
    v5->_platformData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformDataSignature"));
    v8 = objc_claimAutoreleasedReturnValue();
    platformDataSignature = v5->_platformDataSignature;
    v5->_platformDataSignature = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *platformData;
  id v5;

  platformData = self->_platformData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", platformData, CFSTR("platformData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformDataSignature, CFSTR("platformDataSignature"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentDevicePlatfomData *v5;
  uint64_t v6;
  NSData *platformData;
  uint64_t v8;
  NSData *platformDataSignature;

  v5 = -[PKPaymentDevicePlatfomData init](+[PKPaymentDevicePlatfomData allocWithZone:](PKPaymentDevicePlatfomData, "allocWithZone:"), "init");
  v6 = -[NSData copyWithZone:](self->_platformData, "copyWithZone:", a3);
  platformData = v5->_platformData;
  v5->_platformData = (NSData *)v6;

  v8 = -[NSData copyWithZone:](self->_platformDataSignature, "copyWithZone:", a3);
  platformDataSignature = v5->_platformDataSignature;
  v5->_platformDataSignature = (NSData *)v8;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)platformData
{
  return self->_platformData;
}

- (void)setPlatformData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)platformDataSignature
{
  return self->_platformDataSignature;
}

- (void)setPlatformDataSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformDataSignature, 0);
  objc_storeStrong((id *)&self->_platformData, 0);
}

@end
