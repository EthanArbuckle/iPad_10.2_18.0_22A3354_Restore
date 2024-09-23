@implementation WFSettingsDNS

+ (id)automaticConfig
{
  return -[WFSettingsDNS initWithServerAddresses:searchDomains:]([WFSettingsDNS alloc], "initWithServerAddresses:searchDomains:", 0, 0);
}

- (WFSettingsDNS)initWithDictionary:(id)a3
{
  id v5;
  WFSettingsDNS *v6;
  WFSettingsDNS *v7;
  uint64_t v8;
  NSArray *serverAddresses;
  uint64_t v10;
  void *searchDomains;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFSettingsDNS;
  v6 = -[WFSettingsDNS init](&v13, sel_init);
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_storeStrong((id *)&v6->_items, a3);
      -[NSDictionary objectForKey:](v7->_items, "objectForKey:", *MEMORY[0x24BDF5A90]);
      v8 = objc_claimAutoreleasedReturnValue();
      serverAddresses = v7->_serverAddresses;
      v7->_serverAddresses = (NSArray *)v8;

      -[NSDictionary objectForKey:](v7->_items, "objectForKey:", *MEMORY[0x24BDF5A88]);
      v10 = objc_claimAutoreleasedReturnValue();
      searchDomains = v7->_searchDomains;
      v7->_searchDomains = (NSArray *)v10;
    }
    else
    {
      searchDomains = 0;
    }
  }
  else
  {
    searchDomains = v6;
    v7 = 0;
  }

  return v7;
}

- (WFSettingsDNS)initWithServerAddresses:(id)a3 searchDomains:(id)a4
{
  id v7;
  id v8;
  WFSettingsDNS *v9;
  NSDictionary *v10;
  NSDictionary *items;
  NSDictionary *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFSettingsDNS;
  v9 = -[WFSettingsDNS init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_serverAddresses, a3);
    if (v7)
      -[NSDictionary setObject:forKey:](v10, "setObject:forKey:", v7, *MEMORY[0x24BDF5A90]);
    objc_storeStrong((id *)&v9->_searchDomains, a4);
    if (v8)
      -[NSDictionary setObject:forKey:](v10, "setObject:forKey:", v8, *MEMORY[0x24BDF5A88]);
    items = v9->_items;
    v9->_items = v10;
    v12 = v10;

  }
  return v9;
}

- (id)protocol
{
  return (id)*MEMORY[0x24BDF59D8];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@- "), v5);

  -[WFSettingsDNS serverAddresses](self, "serverAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    -[WFSettingsDNS searchDomains](self, "searchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v14 = CFSTR(" Automatic Config");
      goto LABEL_11;
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR("Sever Addresses: "));
  if (self->_serverAddresses)
  {
    -[WFSettingsDNS serverAddresses](self, "serverAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v10);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("(None) "));
  }
  objc_msgSend(v3, "appendString:", CFSTR("| Search Domains: "));
  -[WFSettingsDNS searchDomains](self, "searchDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v14 = CFSTR("(None) ");
LABEL_11:
    objc_msgSend(v3, "appendString:", v14);
    return (NSString *)v3;
  }
  -[WFSettingsDNS searchDomains](self, "searchDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v13);

  return (NSString *)v3;
}

- (NSArray)serverAddresses
{
  return self->_serverAddresses;
}

- (void)setServerAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_serverAddresses, a3);
}

- (NSArray)searchDomains
{
  return self->_searchDomains;
}

- (void)setSearchDomains:(id)a3
{
  objc_storeStrong((id *)&self->_searchDomains, a3);
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);
  objc_storeStrong((id *)&self->_serverAddresses, 0);
}

@end
