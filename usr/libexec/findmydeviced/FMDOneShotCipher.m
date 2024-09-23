@implementation FMDOneShotCipher

- (FMDOneShotCipher)initWithDictionary:(id)a3
{
  id v4;
  FMDOneShotCipher *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDOneShotCipher;
  v5 = -[FMDOneShotCipher init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iv")));
    -[FMDOneShotCipher setInitializationVector:](v5, "setInitializationVector:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key")));
    -[FMDOneShotCipher setKey:](v5, "setKey:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tag")));
    -[FMDOneShotCipher setTag:](v5, "setTag:", v8);

  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOneShotCipher initializationVector](self, "initializationVector"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v4, CFSTR("iv"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOneShotCipher key](self, "key"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v5, CFSTR("key"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOneShotCipher tag](self, "tag"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v6, CFSTR("tag"));

  return (NSDictionary *)v3;
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
  objc_storeStrong((id *)&self->_initializationVector, a3);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
}

@end
