@implementation BYAnalyticsLazyEvent

+ (id)eventWithName:(id)a3 withPayloadBlock:(id)a4 persist:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  BYAnalyticsLazyEvent *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(BYAnalyticsLazyEvent);
  -[BYAnalyticsLazyEvent setName:](v9, "setName:", v8);

  -[BYAnalyticsLazyEvent setPayloadBlock:](v9, "setPayloadBlock:", v7);
  -[BYAnalyticsLazyEvent setPersist:](v9, "setPersist:", v5);
  return v9;
}

- (id)description
{
  void (**v3)(void);
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BYAnalyticsLazyEvent payloadBlock](self, "payloadBlock");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BYAnalyticsLazyEvent persist](self, "persist"))
    v5 = CFSTR("persists");
  else
    v5 = CFSTR("does not persist");
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[BYAnalyticsLazyEvent name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v7, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)payloadBlock
{
  return self->_payloadBlock;
}

- (void)setPayloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_storeStrong(&self->_payloadBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
