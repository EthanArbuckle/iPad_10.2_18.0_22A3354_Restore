@implementation CKKSSQLResult

- (id)init:(id)a3
{
  id v5;
  CKKSSQLResult *v6;
  CKKSSQLResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSSQLResult;
  v6 = -[CKKSSQLResult init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stringValue, a3);

  return v7;
}

- (BOOL)asBOOL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)asNSInteger
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (id)asNSNumberInteger
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)asISO8601Date
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));

  if (v3)
  {
    v4 = objc_alloc_init((Class)NSISO8601DateFormatter);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v5));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)asBase64DecodedData
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));

  if (v3)
  {
    v4 = objc_alloc((Class)NSData);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
    v6 = objc_msgSend(v4, "initWithBase64EncodedString:options:", v5, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
