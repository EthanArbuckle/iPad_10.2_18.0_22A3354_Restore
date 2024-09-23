@implementation POMutableTokenConfigJWTBody

- (void)setUserName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("userName"));

}

- (void)setLoginUserName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("loginUserName"));

}

- (void)setUnlockData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("unlockData"));

}

- (void)setUnlockHash:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("unlockHash"));

}

- (void)setIdpTokenId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_POJWTBodyBase data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("idpTokenId"));

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
