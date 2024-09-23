@implementation SPOfflineAdvertisingKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOfflineAdvertisingKeys)initWithInterval:(int64_t)a3 keys:(id)a4
{
  id v6;
  SPOfflineAdvertisingKeys *v7;
  SPOfflineAdvertisingKeys *v8;
  uint64_t v9;
  NSArray *keys;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPOfflineAdvertisingKeys;
  v7 = -[SPOfflineAdvertisingKeys init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_rotationInterval = a3;
    v9 = objc_msgSend(v6, "copy");
    keys = v8->_keys;
    v8->_keys = (NSArray *)v9;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPOfflineAdvertisingKeys rotationInterval](self, "rotationInterval"), CFSTR("interval"));
  -[SPOfflineAdvertisingKeys keys](self, "keys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keys"));

}

- (SPOfflineAdvertisingKeys)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *keys;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_rotationInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interval"));
  v5 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("keys"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  keys = self->_keys;
  self->_keys = v8;

  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[SPOfflineAdvertisingKeys rotationInterval](self, "rotationInterval");
  -[SPOfflineAdvertisingKeys keys](self, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p interval: %lu, keys: %lu]>"), v4, self, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0C976A8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SPOfflineAdvertisingKeys rotationInterval](self, "rotationInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0C976A0];
  -[SPOfflineAdvertisingKeys keys](self, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
