@implementation BRCConfigValue

- (BRCConfigValue)initWithObject:(id)a3
{
  id v4;
  BRCConfigValue *v5;
  id object;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCConfigValue;
  v5 = -[BRCConfigValue init](&v8, "init");
  object = v5->_object;
  v5->_object = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BRCConfigValue *v4;
  uint64_t v5;
  BRCConfigValue *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = (BRCConfigValue *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v5 = objc_opt_class(BRCConfigValue);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](v6, "object"));
      if (v7
        && (v8 = (void *)v7,
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object")),
            v9,
            v8,
            v9)
        && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](v6, "object")),
            v11 = objc_opt_respondsToSelector(v10, "isEqual:"),
            v10,
            (v11 & 1) != 0))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](v6, "object"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
        v14 = objc_msgSend(v12, "isEqual:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "debugDescription"));

  return v3;
}

- (double)doubleValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (float)floatValue
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (int64_t)longLongValue
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "longLongValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (unint64_t)unsignedLongLongValue
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (int64_t)integerValue
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (BOOL)BOOLValue
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)unsignedIntegerValue
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue numberValue](self, "numberValue"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (NSString)stringValue
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  v4 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  if ((isKindOfClass & 1) == 0)
  {
    v7 = objc_opt_class(NSNumber);
    v8 = objc_opt_isKindOfClass(v6, v7);

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

    }
    else
    {
      v6 = 0;
    }
  }
  return (NSString *)v6;
}

- (NSNumber)numberValue
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  v4 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", v6));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
    v9 = objc_opt_class(NSNumber);
    v10 = objc_opt_isKindOfClass(v8, v9);

    if ((v10 & 1) != 0)
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
    else
      v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSArray)arrayValue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSArray *)v6;
}

- (NSDictionary)dictionaryValue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigValue object](self, "object"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSDictionary *)v6;
}

- (id)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
