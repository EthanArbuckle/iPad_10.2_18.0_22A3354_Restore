@implementation OBAnalyticsEvent

+ (id)eventWithName:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  OBAnalyticsEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(OBAnalyticsEvent);
  -[OBAnalyticsEvent setName:](v7, "setName:", v6);

  -[OBAnalyticsEvent setPayload:](v7, "setPayload:", v5);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[OBAnalyticsEvent name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnalyticsEvent payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
