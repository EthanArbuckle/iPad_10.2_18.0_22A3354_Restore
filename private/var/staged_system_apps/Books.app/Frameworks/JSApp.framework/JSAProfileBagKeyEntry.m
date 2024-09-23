@implementation JSAProfileBagKeyEntry

- (JSAProfileBagKeyEntry)initWithKey:(id)a3 valueType:(unint64_t)a4
{
  id v6;
  JSAProfileBagKeyEntry *v7;
  NSString *v8;
  NSString *key;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JSAProfileBagKeyEntry;
  v7 = -[JSAProfileBagKeyEntry init](&v11, "init");
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    key = v7->_key;
    v7->_key = v8;

    v7->_valueType = a4;
  }

  return v7;
}

- (JSAProfileBagKeyEntry)initWithKeyValue:(id)a3 valueTypeValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  JSAProfileBagKeyEntry *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isString"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toString"));
  else
    v8 = 0;
  if (objc_msgSend(v7, "isString"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toString"));
  else
    v9 = 0;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Array")) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Bool")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Dictionary")) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Double")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Integer")) & 1) != 0)
  {
    v10 = 3;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("URL")))
  {
    v10 = 5;
  }
  else
  {
    v10 = 4;
  }
  v11 = -[JSAProfileBagKeyEntry initWithKey:valueType:](self, "initWithKey:valueType:", v8, v10);

  return v11;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSAProfileBagKeyEntry key](self, "key"));
  v7 = NSStringFromBagValueType(-[JSAProfileBagKeyEntry valueType](self, "valueType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p key=%@ valueType=%@>"), v5, self, v6, v8));

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
