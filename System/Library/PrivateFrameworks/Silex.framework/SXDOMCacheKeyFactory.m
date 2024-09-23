@implementation SXDOMCacheKeyFactory

- (SXDOMCacheKeyFactory)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4
{
  id v7;
  id v8;
  SXDOMCacheKeyFactory *v9;
  SXDOMCacheKeyFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDOMCacheKeyFactory;
  v9 = -[SXDOMCacheKeyFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_hintsConfigurationOptionProvider, a4);
  }

  return v10;
}

- (id)createCacheKeyForLayoutOptions:(id)a3
{
  SXHintsConfigurationOptionProvider *hintsConfigurationOptionProvider;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  SXDOMCacheKey *v11;

  hintsConfigurationOptionProvider = self->_hintsConfigurationOptionProvider;
  v5 = a3;
  -[SXHintsConfigurationOptionProvider hints](hintsConfigurationOptionProvider, "hints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ignoreConditionHints");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[SXDocumentProviding document](self->_documentProvider, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[SXDOMCacheKey initWithLayoutOptions:hints:]([SXDOMCacheKey alloc], "initWithLayoutOptions:hints:", v5, v8);

  return v11;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider
{
  return self->_hintsConfigurationOptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintsConfigurationOptionProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end
