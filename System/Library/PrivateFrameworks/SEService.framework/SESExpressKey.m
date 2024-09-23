@implementation SESExpressKey

+ (id)withKeyIdentifier:(id)a3 appletIdentifier:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (_QWORD *)objc_opt_new();
  v11 = (void *)v10[1];
  v10[1] = v7;
  v12 = v7;

  v13 = (void *)v10[2];
  v10[2] = v8;
  v14 = v8;

  v15 = (void *)v10[3];
  v10[3] = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SESExpressKey keyIdentifier](self, "keyIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SESExpressKey keyIdentifier](self, "keyIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)keyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)appletIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
