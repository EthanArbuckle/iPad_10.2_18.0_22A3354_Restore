@implementation WCAFetchKeyValuesResponse

- (WCAFetchKeyValuesResponse)initWithKeyValues:(id)a3
{
  id v3;
  WCAFetchKeyValuesResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCAFetchKeyValuesResponse;
  v3 = a3;
  v4 = -[WCAFetchKeyValuesResponse init](&v6, sel_init);
  -[WCAFetchKeyValuesResponse setKeyValues:](v4, "setKeyValues:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("key/values: %@"), self->_keyValues);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCAFetchKeyValuesResponse;
  v4 = a3;
  -[WCAFetchResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyValues, CFSTR("_keyValues"), v5.receiver, v5.super_class);

}

- (WCAFetchKeyValuesResponse)initWithCoder:(id)a3
{
  id v4;
  WCAFetchKeyValuesResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *keyValues;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WCAFetchKeyValuesResponse;
  v5 = -[WCAFetchResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_keyValues"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyValues = v5->_keyValues;
    v5->_keyValues = (NSDictionary *)v10;

  }
  return v5;
}

- (NSDictionary)keyValues
{
  return self->_keyValues;
}

- (void)setKeyValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValues, 0);
}

@end
