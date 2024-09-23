@implementation POMutableIDTokenJWTBody

- (void)setAud:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("aud"));

}

- (void)setAudArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("aud"));

}

- (void)setAzp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("azp"));

}

- (void)setIss:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("iss"));

}

- (void)setSub:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sub"));

}

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

- (void)setNbf:(id)a3
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
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("nbf"));

}

- (void)setNonce:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("nonce"));

}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

}

- (void)setPreferred_username:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("preferred_username"));

}

- (void)setGroups:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("groups"));

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
