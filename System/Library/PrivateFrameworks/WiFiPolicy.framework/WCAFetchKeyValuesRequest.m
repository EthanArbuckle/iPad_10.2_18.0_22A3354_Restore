@implementation WCAFetchKeyValuesRequest

- (void)setKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCAFetchKeyValuesRequest;
  v4 = a3;
  -[WCAFetchRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keys, CFSTR("_keys"), v5.receiver, v5.super_class);

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

  objc_msgSend(v6, "appendFormat:", CFSTR("keys: %@"), self->_keys);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WCAFetchKeyValuesRequest)initWithCoder:(id)a3
{
  id v4;
  WCAFetchKeyValuesRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *keys;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WCAFetchKeyValuesRequest;
  v5 = -[WCAFetchRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_keys"));
    v9 = objc_claimAutoreleasedReturnValue();
    keys = v5->_keys;
    v5->_keys = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

@end
