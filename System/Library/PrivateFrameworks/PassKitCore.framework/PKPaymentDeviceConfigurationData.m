@implementation PKPaymentDeviceConfigurationData

- (PKPaymentDeviceConfigurationData)initWithCoder:(id)a3
{
  id v4;
  PKPaymentDeviceConfigurationData *v5;
  uint64_t v6;
  NSString *secureElementIdentifier;
  uint64_t v8;
  NSNumber *primaryJSBLSequenceCounter;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentDeviceConfigurationData;
  v5 = -[PKPaymentDeviceConfigurationData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v6;

    v5->_devSigned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("devSigned"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jsblSequenceCounter"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryJSBLSequenceCounter = v5->_primaryJSBLSequenceCounter;
    v5->_primaryJSBLSequenceCounter = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaymentDeviceConfigurationData secureElementIdentifier](self, "secureElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("secureElementIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PKPaymentDeviceConfigurationData devSigned](self, "devSigned"), CFSTR("devSigned"));
  -[PKPaymentDeviceConfigurationData primaryJSBLSequenceCounter](self, "primaryJSBLSequenceCounter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("jsblSequenceCounter"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentDeviceConfigurationData *v5;
  uint64_t v6;
  NSString *secureElementIdentifier;

  v5 = -[PKPaymentDeviceConfigurationData init](+[PKPaymentDeviceConfigurationData allocWithZone:](PKPaymentDeviceConfigurationData, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_secureElementIdentifier, "copyWithZone:", a3);
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = (NSString *)v6;

  v5->_devSigned = self->_devSigned;
  objc_storeStrong((id *)&v5->_primaryJSBLSequenceCounter, self->_primaryJSBLSequenceCounter);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)primaryJSBLSequenceCounter
{
  return self->_primaryJSBLSequenceCounter;
}

- (void)setPrimaryJSBLSequenceCounter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryJSBLSequenceCounter, 0);
}

@end
