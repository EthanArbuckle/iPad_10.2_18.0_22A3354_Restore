@implementation SCSharingReminderKVStoreValue

+ (id)defaultForKey:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return -[SCSharingReminderKVStoreValue initWithIntegerValue:]([SCSharingReminderKVStoreValue alloc], "initWithIntegerValue:", qword_2454CF228[a3]);
}

- (SCSharingReminderKVStoreValue)initWithData:(id)a3
{
  id v5;
  SCSharingReminderKVStoreValue *v6;
  SCSharingReminderKVStoreValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCSharingReminderKVStoreValue;
  v6 = -[SCSharingReminderKVStoreValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (SCSharingReminderKVStoreValue)initWithIntegerValue:(int64_t)a3
{
  void *v4;
  SCSharingReminderKVStoreValue *v5;
  int64_t v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCSharingReminderKVStoreValue initWithData:](self, "initWithData:", v4);

  return v5;
}

- (SCSharingReminderKVStoreValue)initWithBoolValue:(BOOL)a3
{
  void *v4;
  SCSharingReminderKVStoreValue *v5;
  BOOL v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCSharingReminderKVStoreValue initWithData:](self, "initWithData:", v4);

  return v5;
}

- (id)data
{
  return self->_data;
}

- (int64_t)integerValue
{
  id v3;
  void *v4;
  unint64_t v5;
  int64_t v6;

  -[SCSharingReminderKVStoreValue data](self, "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v6;
  }
  -[SCSharingReminderKVStoreValue data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 <= 8)
  {
    -[SCSharingReminderKVStoreValue data](self, "data");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = *(_QWORD *)objc_msgSend(v3, "bytes");
    goto LABEL_6;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)BOOLValue
{
  BOOL v3;
  SCSharingReminderKVStoreValue *v4;
  SCSharingReminderKVStoreValue *v5;

  v3 = 1;
  v4 = -[SCSharingReminderKVStoreValue initWithBoolValue:]([SCSharingReminderKVStoreValue alloc], "initWithBoolValue:", 1);
  v5 = -[SCSharingReminderKVStoreValue initWithIntegerValue:]([SCSharingReminderKVStoreValue alloc], "initWithIntegerValue:", 1);
  if (!-[SCSharingReminderKVStoreValue isEqual:](self, "isEqual:", v4))
    v3 = -[SCSharingReminderKVStoreValue isEqual:](self, "isEqual:", v5);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCSharingReminderKVStoreValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminderKVStoreValue classKey](self, "classKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (SCSharingReminderKVStoreValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SCSharingReminderKVStoreValue *v8;

  v4 = a3;
  v5 = objc_opt_class();
  -[SCSharingReminderKVStoreValue classKey](self, "classKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[SCSharingReminderKVStoreValue initWithData:](self, "initWithData:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)classKey
{
  return CFSTR("SCSharingReminderKVStoreValue");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SCSharingReminderKVStoreValue data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[SCSharingReminderKVStoreValue data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  const char *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SCSharingReminderKVStoreValue integerValue](self, "integerValue");
  v5 = -[SCSharingReminderKVStoreValue BOOLValue](self, "BOOLValue");
  v6 = "No";
  if (v5)
    v6 = "Yes";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("SCSharingReminderKVStoreValue int: {%ld} BOOL: %s"), v4, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
