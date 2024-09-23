@implementation PPLocationCache

- (PPLocationCache)initWithLocationStore:(id)a3
{
  id v5;
  PPLocationCache *v6;
  PPLocationCache *v7;
  uint64_t v8;
  NSMutableSet *homeOrWorkAddresses;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPLocationCache;
  v6 = -[PPLocationCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_valid = 0;
    objc_storeStrong((id *)&v6->_locationStore, a3);
    v8 = objc_opt_new();
    homeOrWorkAddresses = v7->_homeOrWorkAddresses;
    v7->_homeOrWorkAddresses = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)locationForHome
{
  if (!self->_valid)
    -[PPLocationCache _refresh](self, "_refresh");
  return self->_home;
}

- (id)locationForWork
{
  if (!self->_valid)
    -[PPLocationCache _refresh](self, "_refresh");
  return self->_work;
}

- (id)homeOrWorkAddresses
{
  if (!self->_valid)
    -[PPLocationCache _refresh](self, "_refresh");
  return self->_homeOrWorkAddresses;
}

- (void)_refresh
{
  void *v3;
  void *v4;
  PPLocation *v5;
  PPLocation *home;
  PPLocation **p_home;
  void *v8;
  void *v9;
  PPLocation *v10;
  PPLocation *work;
  PPLocation **p_work;
  void *v13;
  void *v14;
  void *v15;
  NSMutableSet *homeOrWorkAddresses;
  void *v17;
  NSMutableSet *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableSet *v22;
  void *v23;
  NSMutableSet *v24;
  void *v25;

  -[PPLocalLocationStore locationRecordOfCategory:](self->_locationStore, "locationRecordOfCategory:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "location");
    v5 = (PPLocation *)objc_claimAutoreleasedReturnValue();
    p_home = &self->_home;
    home = self->_home;
    self->_home = v5;
  }
  else
  {
    p_home = &self->_home;
    home = self->_home;
    self->_home = 0;
  }

  -[PPLocalLocationStore locationRecordOfCategory:](self->_locationStore, "locationRecordOfCategory:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "location");
    v10 = (PPLocation *)objc_claimAutoreleasedReturnValue();
    p_work = &self->_work;
    work = self->_work;
    self->_work = v10;
  }
  else
  {
    p_work = &self->_work;
    work = self->_work;
    self->_work = 0;
  }

  v13 = (void *)MEMORY[0x1C3BD6630]();
  -[NSMutableSet removeAllObjects](self->_homeOrWorkAddresses, "removeAllObjects");
  if (self->_home)
  {
    +[PPLocationSupport streetAddressOfLocation:](PPLocationSupport, "streetAddressOfLocation:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPLocationSupport fullAddressOfLocation:](PPLocationSupport, "fullAddressOfLocation:", *p_home);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      homeOrWorkAddresses = self->_homeOrWorkAddresses;
      objc_msgSend(v14, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](homeOrWorkAddresses, "addObject:", v17);

    }
    if (v15)
    {
      v18 = self->_homeOrWorkAddresses;
      objc_msgSend(v15, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v18, "addObject:", v19);

    }
  }
  if (*p_work)
  {
    +[PPLocationSupport streetAddressOfLocation:](PPLocationSupport, "streetAddressOfLocation:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPLocationSupport fullAddressOfLocation:](PPLocationSupport, "fullAddressOfLocation:", *p_work);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v22 = self->_homeOrWorkAddresses;
      objc_msgSend(v20, "lowercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v22, "addObject:", v23);

    }
    if (v21)
    {
      v24 = self->_homeOrWorkAddresses;
      objc_msgSend(v21, "lowercaseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v24, "addObject:", v25);

    }
  }
  objc_autoreleasePoolPop(v13);
  self->_valid = 1;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeOrWorkAddresses, 0);
  objc_storeStrong((id *)&self->_work, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
}

@end
