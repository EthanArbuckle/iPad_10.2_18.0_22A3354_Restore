@implementation POPodcastModelObject

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POPodcastModelObject title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[POPodcastModelObject indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[POPodcastModelObject uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p) title: %@, index path: %@, uuid, %@"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SAMPCollection)SAMPCollection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "SAMPClass"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "uriScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POPodcastModelObject uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://device/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v8);

  -[POPodcastModelObject title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v9);

  POLogInitIfNeeded();
  if (POLogContextCommand)
    v10 = POLogContextCommand;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_22FB0C000, v10, OS_LOG_TYPE_INFO, "Returning SAMPCollection %@", buf, 0xCu);
  }

  return (SAMPCollection *)v3;
}

+ (Class)SAMPClass
{
  return 0;
}

+ (id)uriScheme
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)feedUrl
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFeedUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSIndexPath)indexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
