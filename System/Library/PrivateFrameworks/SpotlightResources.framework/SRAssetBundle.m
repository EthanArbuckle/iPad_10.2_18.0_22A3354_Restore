@implementation SRAssetBundle

- (id)assetsWithContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

- (void)loadAssetsWithContentType:(id)a3 contentName:(id)a4 contentPath:(id)a5
{
  NSMutableDictionary *contents;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  contents = self->_contents;
  v9 = a5;
  v10 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](contents, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contents, "setObject:forKeyedSubscript:", v12, v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, v10);

}

- (SRAssetBundle)initWithLocale:(id)a3
{
  id v5;
  SRAssetBundle *v6;
  SRAssetBundle *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *contents;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRAssetBundle;
  v6 = -[SRAssetBundle init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    contents = v7->_contents;
    v7->_contents = v8;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

- (NSArray)contentTypes
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_contents, "allKeys");
}

- (NSLocale)locale
{
  return self->_locale;
}

@end
