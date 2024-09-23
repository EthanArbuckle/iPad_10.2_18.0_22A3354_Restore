@implementation SBKPushValueResponse

+ (id)responseWithResponse:(id)a3 transaction:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "responseWithResponse:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deserializeResponseBodyWithTransaction:", v6);

  return v7;
}

- (void)deserializeResponseBodyWithTransaction:(id)a3
{
  void *v3;
  void *v5;
  NSData *v6;
  NSData *conflictItemValuePayload;
  NSData *v8;
  void *v9;
  NSData *v10;
  void *v11;
  NSString *v12;
  NSString *domainVersion;
  id v14;

  v14 = a3;
  -[SBKResponse responseDictionary](self, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  conflictItemValuePayload = self->_conflictItemValuePayload;
  self->_conflictItemValuePayload = v6;

  v8 = self->_conflictItemValuePayload;
  if (v8)
  {
    objc_msgSend(v14, "requestItemPayloadPair");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "kvsKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong((id *)&self->_conflictItemKey, v9);
  if (v8)
  {

  }
  v10 = self->_conflictItemValuePayload;
  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)&self->_conflictItemVersionAnchor, v11);
  if (v10)

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domain-version"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  domainVersion = self->_domainVersion;
  self->_domainVersion = v12;

}

- (NSString)domainVersion
{
  return self->_domainVersion;
}

- (NSData)conflictItemValuePayload
{
  return self->_conflictItemValuePayload;
}

- (NSString)conflictItemKey
{
  return self->_conflictItemKey;
}

- (NSString)conflictItemVersionAnchor
{
  return self->_conflictItemVersionAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_conflictItemKey, 0);
  objc_storeStrong((id *)&self->_conflictItemValuePayload, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);
}

@end
