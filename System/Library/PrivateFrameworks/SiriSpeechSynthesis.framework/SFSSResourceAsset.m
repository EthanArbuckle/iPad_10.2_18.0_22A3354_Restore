@implementation SFSSResourceAsset

- (SFSSResourceAsset)initWithPath:(id)a3
{
  id v5;
  SFSSResourceAsset *v6;
  SFSSResourceAsset *v7;
  NSObject *v8;
  NSString *assetPath;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSSResourceAsset;
  v6 = -[SFSSResourceAsset init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetPath, a3);
    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      assetPath = v7->_assetPath;
      *(_DWORD *)buf = 138412290;
      v13 = assetPath;
      _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "Init ResourceAsset with assetPath=%@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)init:(id)a3 contentVersion:(int64_t)a4
{
  id v6;
  SFSSResourceAsset *v7;
  uint64_t v8;
  NSString *language;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSSResourceAsset;
  v7 = -[SFSSResourceAsset init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v8 = objc_claimAutoreleasedReturnValue();
    language = v7->_language;
    v7->_language = (NSString *)v8;

    v7->_contentVersion = a4;
  }
  SFSSGetLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[SFSSResourceAsset key](v7, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v11;
    _os_log_impl(&dword_21E284000, v10, OS_LOG_TYPE_INFO, "Init ResourceAsset with key=%@", buf, 0xCu);

  }
  return v7;
}

- (id)key
{
  void *v2;
  NSString *language;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  language = self->_language;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_contentVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), language, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
}

+ (id)generateResourceAssetFromResourceKeyString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = -[SFSSResourceAsset init:contentVersion:]([SFSSResourceAsset alloc], "init:contentVersion:", v4, v6);
  return v7;
}

@end
