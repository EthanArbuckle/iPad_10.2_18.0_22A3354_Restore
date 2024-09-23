@implementation SPCBPeripheralKeyRequestParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyRequestParameters)initWithSessionKey:(id)a3 vendorIdentifierList:(id)a4
{
  id v6;
  id v7;
  SPCBPeripheralKeyRequestParameters *v8;
  uint64_t v9;
  SPCBPeripheralManagerSessionKey *sessionKey;
  uint64_t v11;
  NSArray *vendorIdentifierList;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralKeyRequestParameters;
  v8 = -[SPCBPeripheralKeyRequestParameters init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sessionKey = v8->_sessionKey;
    v8->_sessionKey = (SPCBPeripheralManagerSessionKey *)v9;

    v11 = objc_msgSend(v7, "copy");
    vendorIdentifierList = v8->_vendorIdentifierList;
    v8->_vendorIdentifierList = (NSArray *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPCBPeripheralKeyRequestParameters *v4;
  void *v5;
  void *v6;
  SPCBPeripheralKeyRequestParameters *v7;

  v4 = [SPCBPeripheralKeyRequestParameters alloc];
  -[SPCBPeripheralKeyRequestParameters sessionKey](self, "sessionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCBPeripheralKeyRequestParameters vendorIdentifierList](self, "vendorIdentifierList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPCBPeripheralKeyRequestParameters initWithSessionKey:vendorIdentifierList:](v4, "initWithSessionKey:vendorIdentifierList:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPCBPeripheralKeyRequestParameters sessionKey](self, "sessionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionKey"));

  -[SPCBPeripheralKeyRequestParameters vendorIdentifierList](self, "vendorIdentifierList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("vendorIdentifierList"));

}

- (SPCBPeripheralKeyRequestParameters)initWithCoder:(id)a3
{
  id v4;
  SPCBPeripheralManagerSessionKey *v5;
  SPCBPeripheralManagerSessionKey *sessionKey;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *vendorIdentifierList;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionKey"));
  v5 = (SPCBPeripheralManagerSessionKey *)objc_claimAutoreleasedReturnValue();
  sessionKey = self->_sessionKey;
  self->_sessionKey = v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("vendorIdentifierList"));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

  vendorIdentifierList = self->_vendorIdentifierList;
  self->_vendorIdentifierList = v10;

  return self;
}

- (SPCBPeripheralManagerSessionKey)sessionKey
{
  return self->_sessionKey;
}

- (NSArray)vendorIdentifierList
{
  return self->_vendorIdentifierList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifierList, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
}

@end
