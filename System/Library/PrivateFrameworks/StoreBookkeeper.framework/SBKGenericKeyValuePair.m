@implementation SBKGenericKeyValuePair

- (SBKGenericKeyValuePair)initWithKVSKey:(id)a3 kvsPayload:(id)a4
{
  id v7;
  id v8;
  SBKGenericKeyValuePair *v9;
  SBKGenericKeyValuePair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBKGenericKeyValuePair;
  v9 = -[SBKGenericKeyValuePair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_kvsKey, a3);
    objc_storeStrong((id *)&v10->_kvsPayload, a4);
  }

  return v10;
}

- (SBKGenericKeyValuePair)initWithCoder:(id)a3
{
  id v4;
  SBKGenericKeyValuePair *v5;
  uint64_t v6;
  NSString *kvsKey;
  uint64_t v8;
  NSData *kvsPayload;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBKGenericKeyValuePair;
  v5 = -[SBKGenericKeyValuePair init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kvsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    kvsKey = v5->_kvsKey;
    v5->_kvsKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kvsPayload"));
    v8 = objc_claimAutoreleasedReturnValue();
    kvsPayload = v5->_kvsPayload;
    v5->_kvsPayload = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *kvsKey;
  id v5;

  kvsKey = self->_kvsKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", kvsKey, CFSTR("kvsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kvsPayload, CFSTR("kvsPayload"));

}

- (id)kvsValueDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SBKGenericKeyValuePair;
  -[SBKGenericKeyValuePair description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: key=%@, payload=%@"), v4, self->_kvsKey, self->_kvsPayload);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)timestamp
{
  return 0.0;
}

- (NSString)kvsKey
{
  return self->_kvsKey;
}

- (NSData)kvsPayload
{
  return self->_kvsPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvsPayload, 0);
  objc_storeStrong((id *)&self->_kvsKey, 0);
}

+ (id)pairWithKVSKey:(id)a3 kvsPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKVSKey:kvsPayload:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
