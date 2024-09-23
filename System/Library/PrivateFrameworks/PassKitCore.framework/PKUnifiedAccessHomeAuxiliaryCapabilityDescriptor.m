@implementation PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor

- (PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor)initWithReaderGroupIdentifier:(id)a3 readerGroupPublicKey:(id)a4
{
  id v7;
  id v8;
  PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor *v9;
  PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor;
  v9 = -[PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_readerGroupIdentifier, a3);
    objc_storeStrong((id *)&v10->_readerGroupPublicKey, a4);
  }

  return v10;
}

- (PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor *v5;
  uint64_t v6;
  NSData *readerGroupIdentifier;
  uint64_t v8;
  NSData *readerGroupPublicKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor;
  v5 = -[PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerGroupIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    readerGroupIdentifier = v5->_readerGroupIdentifier;
    v5->_readerGroupIdentifier = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerGroupPublicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    readerGroupPublicKey = v5->_readerGroupPublicKey;
    v5->_readerGroupPublicKey = (NSData *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *readerGroupIdentifier;
  id v5;

  readerGroupIdentifier = self->_readerGroupIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", readerGroupIdentifier, CFSTR("readerGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerGroupPublicKey, CFSTR("readerGroupPublicKey"));

}

- (NSData)readerGroupIdentifier
{
  return self->_readerGroupIdentifier;
}

- (NSData)readerGroupPublicKey
{
  return self->_readerGroupPublicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerGroupPublicKey, 0);
  objc_storeStrong((id *)&self->_readerGroupIdentifier, 0);
}

@end
