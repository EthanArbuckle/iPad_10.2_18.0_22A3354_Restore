@implementation BYAnalyticsEvent

+ (id)eventWithName:(id)a3 withPayload:(id)a4 persist:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  BYAnalyticsEvent *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(BYAnalyticsEvent);
  -[BYAnalyticsEvent setName:](v9, "setName:", v8);

  -[BYAnalyticsEvent setPayload:](v9, "setPayload:", v7);
  -[BYAnalyticsEvent setPersist:](v9, "setPersist:", v5);
  return v9;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BYAnalyticsEvent persist](self, "persist"))
    v3 = CFSTR("persists");
  else
    v3 = CFSTR("does not persist");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[BYAnalyticsEvent name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYAnalyticsEvent payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (BOOL)persist
{
  return self->_persist;
}

- (void)setPersist:(BOOL)a3
{
  self->_persist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
