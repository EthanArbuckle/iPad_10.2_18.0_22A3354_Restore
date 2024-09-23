@implementation POMutableLoginResponseJWTBody

- (void)setAud:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("aud"));

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

- (void)setToken_type:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("token_type"));

}

- (void)setExpires_in:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("expires_in"));

}

- (void)setRefresh_token_expires_in:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("refresh_token_expires_in"));

}

- (void)setExpires_on:(id)a3
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
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("expires_on"));

}

- (void)setRefresh_token:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("refresh_token"));

}

- (void)setId_token:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("id_token"));

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
