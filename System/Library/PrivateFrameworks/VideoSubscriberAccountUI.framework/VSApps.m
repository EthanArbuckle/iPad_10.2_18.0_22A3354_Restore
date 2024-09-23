@implementation VSApps

- (VSApps)init
{
  VSApps *v2;
  NSArray *v3;
  NSArray *nonChannelApps;
  NSArray *v5;
  NSArray *availableApps;
  NSArray *v7;
  NSArray *subscribedApps;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSApps;
  v2 = -[VSApps init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    nonChannelApps = v2->_nonChannelApps;
    v2->_nonChannelApps = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    availableApps = v2->_availableApps;
    v2->_availableApps = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    subscribedApps = v2->_subscribedApps;
    v2->_subscribedApps = v7;

  }
  return v2;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApps nonChannelApps](self, "nonChannelApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VSApps availableApps](self, "availableApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VSApps subscribedApps](self, "subscribedApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "vs_yesNoStringValueFromBool:", -[VSApps hasUserChannelList](self, "hasUserChannelList"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "vs_yesNoStringValueFromBool:", -[VSApps hasChannelApps](self, "hasChannelApps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@ %p %@=%@, %@=%@, %@=%@, %@=%@, %@=%@>"), v18, self, CFSTR("nonChannelApps"), v17, CFSTR("availableApps"), v7, CFSTR("subscribedApps"), v10, CFSTR("hasUserChannelList"), v11, CFSTR("hasChannelApps"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v6)

  if (!v4)
  return v13;
}

- (NSArray)nonChannelApps
{
  return self->_nonChannelApps;
}

- (void)setNonChannelApps:(id)a3
{
  objc_storeStrong((id *)&self->_nonChannelApps, a3);
}

- (NSArray)availableApps
{
  return self->_availableApps;
}

- (void)setAvailableApps:(id)a3
{
  objc_storeStrong((id *)&self->_availableApps, a3);
}

- (NSArray)subscribedApps
{
  return self->_subscribedApps;
}

- (void)setSubscribedApps:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedApps, a3);
}

- (BOOL)hasUserChannelList
{
  return self->_hasUserChannelList;
}

- (void)setHasUserChannelList:(BOOL)a3
{
  self->_hasUserChannelList = a3;
}

- (BOOL)hasChannelApps
{
  return self->_hasChannelApps;
}

- (void)setHasChannelApps:(BOOL)a3
{
  self->_hasChannelApps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedApps, 0);
  objc_storeStrong((id *)&self->_availableApps, 0);
  objc_storeStrong((id *)&self->_nonChannelApps, 0);
}

@end
