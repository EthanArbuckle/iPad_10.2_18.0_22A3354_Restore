@implementation ICQQuotaAppDetailsResponse

- (ICQQuotaAppDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *apps;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ICQQuotaApp *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  ICQQuotaAppDetailsResponse *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)ICQQuotaAppDetailsResponse;
  v24 = -[AAResponse initWithHTTPResponse:data:](&v29, sel_initWithHTTPResponse_data_, a3, a4);
  if (v24)
  {
    -[AAResponse responseDictionary](v24, "responseDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("results"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
    apps = v24->_apps;
    v23 = 64;
    v24->_apps = (NSMutableArray *)v6;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12), v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(ICQQuotaApp);
          objc_msgSend(v13, "objectForKey:", CFSTR("bundle_id"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICQQuotaApp setBundleID:](v14, "setBundleID:", v15);

          objc_msgSend(v13, "objectForKey:", CFSTR("application_name"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICQQuotaApp setName:](v14, "setName:", v16);

          objc_msgSend(v13, "objectForKey:", CFSTR("localized_application_name"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICQQuotaApp setLocalizedName:](v14, "setLocalizedName:", v17);

          objc_msgSend(v13, "objectForKey:", CFSTR("icon_url"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICQQuotaApp setIconURL:](v14, "setIconURL:", v19);

          }
          objc_msgSend(v13, "objectForKey:", CFSTR("thumbnail_url"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICQQuotaApp setThumbnailURL:](v14, "setThumbnailURL:", v21);

          }
          objc_msgSend(*(id *)((char *)&v24->super.super.isa + v23), "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }

  }
  return v24;
}

- (void)addApps:(id)a3
{
  id v4;
  NSMutableArray *apps;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  apps = self->_apps;
  v8 = v4;
  if (!apps)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_apps;
    self->_apps = v6;

    v4 = v8;
    apps = self->_apps;
  }
  -[NSMutableArray addObjectsFromArray:](apps, "addObjectsFromArray:", v4);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ICQQuotaAppDetailsResponse apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p with apps: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)apps
{
  return &self->_apps->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
