@implementation PKNFCTag

- (PKNFCTag)initWithNFTag:(id)a3
{
  id v5;
  PKNFCTag *v6;
  PKNFCTag *v7;
  uint64_t v8;
  NSData *tagIdentifier;
  uint64_t v10;
  NSData *manufacturerIdentifier;
  uint64_t v12;
  NSData *manufacturerParameter;
  uint64_t v14;
  NSData *systemCode;
  uint64_t v16;
  NSData *UID;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKNFCTag;
  v6 = -[PKNFCTag init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingTag, a3);
    v7->_technology = objc_msgSend(v5, "technology") & 0xF;
    objc_msgSend(v5, "tagID");
    v8 = objc_claimAutoreleasedReturnValue();
    tagIdentifier = v7->_tagIdentifier;
    v7->_tagIdentifier = (NSData *)v8;

    objc_msgSend(v5, "IDm");
    v10 = objc_claimAutoreleasedReturnValue();
    manufacturerIdentifier = v7->_manufacturerIdentifier;
    v7->_manufacturerIdentifier = (NSData *)v10;

    objc_msgSend(v5, "PMm");
    v12 = objc_claimAutoreleasedReturnValue();
    manufacturerParameter = v7->_manufacturerParameter;
    v7->_manufacturerParameter = (NSData *)v12;

    objc_msgSend(v5, "SystemCode");
    v14 = objc_claimAutoreleasedReturnValue();
    systemCode = v7->_systemCode;
    v7->_systemCode = (NSData *)v14;

    objc_msgSend(v5, "UID");
    v16 = objc_claimAutoreleasedReturnValue();
    UID = v7->_UID;
    v7->_UID = (NSData *)v16;

  }
  return v7;
}

- (unint64_t)technology
{
  return self->_technology;
}

- (void)setTechnology:(unint64_t)a3
{
  self->_technology = a3;
}

- (NSData)tagIdentifier
{
  return self->_tagIdentifier;
}

- (void)setTagIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (void)setManufacturerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)manufacturerParameter
{
  return self->_manufacturerParameter;
}

- (void)setManufacturerParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)systemCode
{
  return self->_systemCode;
}

- (void)setSystemCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)UID
{
  return self->_UID;
}

- (void)setUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UID, 0);
  objc_storeStrong((id *)&self->_systemCode, 0);
  objc_storeStrong((id *)&self->_manufacturerParameter, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
  objc_storeStrong((id *)&self->_underlyingTag, 0);
}

@end
