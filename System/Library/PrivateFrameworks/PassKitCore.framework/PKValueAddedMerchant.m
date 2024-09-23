@implementation PKValueAddedMerchant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKValueAddedMerchant)initWithCoder:(id)a3
{
  id v4;
  PKValueAddedMerchant *v5;
  uint64_t v6;
  NSData *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKValueAddedMerchant;
  v5 = -[PKValueAddedMerchant init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKValueAddedMerchantIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    v5->_timesPresented = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKValueAddedMerchantTimesPresentedKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("PKValueAddedMerchantIdentifierKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_timesPresented, CFSTR("PKValueAddedMerchantTimesPresentedKey"));

}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)timesPresented
{
  return self->_timesPresented;
}

- (void)setTimesPresented:(int64_t)a3
{
  self->_timesPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
