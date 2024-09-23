@implementation POMutableKeyExchangeResponseJWTBody

- (void)setIat:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:", floor(v5));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_POJWTBodyBase data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("iat"));

}

- (void)setExp:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:", floor(v5));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_POJWTBodyBase data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("exp"));

}

- (void)setKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("key"));

}

- (void)setKey_context:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("key_context"));

}

- (void)addCustomClaims:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

@end
