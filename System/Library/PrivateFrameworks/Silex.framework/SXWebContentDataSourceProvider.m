@implementation SXWebContentDataSourceProvider

- (SXWebContentDataSourceProvider)initWithDOMObjectProvider:(id)a3 resourceDataSourceProvider:(id)a4
{
  id v7;
  id v8;
  SXWebContentDataSourceProvider *v9;
  SXWebContentDataSourceProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentDataSourceProvider;
  v9 = -[SXWebContentDataSourceProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_resourceDataSourceProvider, a4);
  }

  return v10;
}

- (id)dataSourcesForReferences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  SXWebContentDataSourceProvider *v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __59__SXWebContentDataSourceProvider_dataSourcesForReferences___block_invoke;
    v12 = &unk_24D68D358;
    v13 = self;
    v6 = v5;
    v14 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __59__SXWebContentDataSourceProvider_dataSourcesForReferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "DOMObjectProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resourceForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resourceDataSourceProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "translateURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, v14);

}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
