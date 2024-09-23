@implementation SBKPullValueResponse

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
  NSString *v4;
  NSString *itemKey;
  NSData *v6;
  NSData *itemValuePayload;
  NSString *v8;
  NSString *itemVersion;
  NSString *v10;
  NSString *domainVersion;
  id v12;

  -[SBKResponse responseDictionary](self, "responseDictionary", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("key"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  itemKey = self->_itemKey;
  self->_itemKey = v4;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  itemValuePayload = self->_itemValuePayload;
  self->_itemValuePayload = v6;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  itemVersion = self->_itemVersion;
  self->_itemVersion = v8;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("domain-version"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  domainVersion = self->_domainVersion;
  self->_domainVersion = v10;

}

- (NSString)itemKey
{
  return self->_itemKey;
}

- (NSString)itemVersion
{
  return self->_itemVersion;
}

- (NSData)itemValuePayload
{
  return self->_itemValuePayload;
}

- (NSString)domainVersion
{
  return self->_domainVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_itemValuePayload, 0);
  objc_storeStrong((id *)&self->_itemVersion, 0);
  objc_storeStrong((id *)&self->_itemKey, 0);
}

@end
