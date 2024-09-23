@implementation TPSCapability

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (TPSCapability)initWithDictionary:(id)a3
{
  id v4;
  TPSCapability *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  id value;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSCapability;
  v5 = -[TPSCapability init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "TPSSafeObjectForKey:", CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v8;

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("joinType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AND")) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("OR")))
      {
LABEL_7:

        goto LABEL_8;
      }
      v11 = 1;
    }
    v5->_joinType = v11;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSCapability;
  -[TPSSerializableObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSCapability key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %@"), CFSTR("key"), v6);

  -[TPSCapability value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %@"), CFSTR("value"), v7);

  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %ld"), CFSTR("joinType"), -[TPSCapability joinType](self, "joinType"));
  return v5;
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
