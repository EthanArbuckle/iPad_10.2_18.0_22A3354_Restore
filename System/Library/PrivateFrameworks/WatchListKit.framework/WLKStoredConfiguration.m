@implementation WLKStoredConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WLKStoredConfiguration;
  -[WLKStoredConfiguration description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKStoredConfiguration requiredRequestKeyValuePairs](self, "requiredRequestKeyValuePairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WLKStoredConfiguration activeUser](self, "activeUser"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[WLKStoredConfiguration timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {rrkvp:%@ activeUser:%@ timestamp:%@}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)utsk
{
  void *v2;
  void *v3;
  void *v4;

  -[WLKStoredConfiguration requiredRequestKeyValuePairs](self, "requiredRequestKeyValuePairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("utsk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSDictionary)requiredRequestKeyValuePairs
{
  return self->_requiredRequestKeyValuePairs;
}

- (void)setRequiredRequestKeyValuePairs:(id)a3
{
  objc_storeStrong((id *)&self->_requiredRequestKeyValuePairs, a3);
}

- (BOOL)activeUser
{
  return self->_activeUser;
}

- (void)setActiveUser:(BOOL)a3
{
  self->_activeUser = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSString)utsc
{
  return self->_utsc;
}

- (void)setUtsc:(id)a3
{
  objc_storeStrong((id *)&self->_utsc, a3);
}

- (NSString)vppaState
{
  return self->_vppaState;
}

- (void)setVppaState:(id)a3
{
  objc_storeStrong((id *)&self->_vppaState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vppaState, 0);
  objc_storeStrong((id *)&self->_utsc, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_requiredRequestKeyValuePairs, 0);
}

@end
