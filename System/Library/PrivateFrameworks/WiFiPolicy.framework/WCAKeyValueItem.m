@implementation WCAKeyValueItem

- (WCAKeyValueItem)initWithKey:(id)a3 value:(id)a4
{
  NSString *v6;
  id v7;
  WCAKeyValueItem *v8;
  NSString *key;
  NSString *v10;
  id value;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WCAKeyValueItem;
  v8 = -[WCAKeyValueItem init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  value = v8->_value;
  v8->_value = v7;

  return v8;
}

- (WCAKeyValueItem)initWithKey:(id)a3 error:(id)a4
{
  NSString *v6;
  id v7;
  WCAKeyValueItem *v8;
  NSString *key;
  NSString *v10;
  id value;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WCAKeyValueItem;
  v8 = -[WCAKeyValueItem init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  value = v8->_value;
  v8->_value = v7;

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("key: %@"), self->_key);
  objc_msgSend(self->_value, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", value: %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("_key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("_value"));

}

- (WCAKeyValueItem)initWithCoder:(id)a3
{
  id v3;
  WCAKeyValueItem *v4;
  uint64_t v5;
  NSString *key;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id value;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WCAKeyValueItem;
  v3 = a3;
  v4 = -[WCAKeyValueItem init](&v17, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_key"));
  v5 = objc_claimAutoreleasedReturnValue();
  key = v4->_key;
  v4->_key = (NSString *)v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0, v17.receiver, v17.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("_value"));
  v14 = objc_claimAutoreleasedReturnValue();

  value = v4->_value;
  v4->_value = (id)v14;

  return v4;
}

- (NSDictionary)dictionaryValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSDictionary"), self->_value);
  }
  return (NSDictionary *)self->_value;
}

- (NSArray)arrayValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSArray"), self->_value);
  }
  return (NSArray *)self->_value;
}

- (double)doubleValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  double result;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  objc_msgSend(self->_value, "doubleValue");
  return result;
}

- (float)floatValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  float result;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  objc_msgSend(self->_value, "floatValue");
  return result;
}

- (int)int32Value
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  return objc_msgSend(self->_value, "intValue");
}

- (int64_t)int64Value
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  return objc_msgSend(self->_value, "longLongValue");
}

- (unsigned)uint32Value
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  return objc_msgSend(self->_value, "unsignedIntValue");
}

- (unint64_t)uint64Value
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  return objc_msgSend(self->_value, "unsignedLongLongValue");
}

- (BOOL)BOOLValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSNumber"), self->_value);
  }
  return objc_msgSend(self->_value, "BOOLValue");
}

- (NSString)stringValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSString"), self->_value);
  }
  return (NSString *)self->_value;
}

- (NSData)bytesValue
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSData"), self->_value);
  }
  return (NSData *)self->_value;
}

- (NSError)error
{
  id value;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  value = self->_value;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = objc_claimAutoreleasedReturnValue();
  if (value == (id)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      NSLog(CFSTR("Failed to convert value \"%@\" to NSError"), self->_value);
  }
  return (NSError *)self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
