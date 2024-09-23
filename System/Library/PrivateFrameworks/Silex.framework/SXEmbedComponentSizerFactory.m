@implementation SXEmbedComponentSizerFactory

- (SXEmbedComponentSizerFactory)initWithDOMObjectProvider:(id)a3 embedDataProvider:(id)a4
{
  id v7;
  id v8;
  SXEmbedComponentSizerFactory *v9;
  SXEmbedComponentSizerFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXEmbedComponentSizerFactory;
  v9 = -[SXEmbedComponentSizerFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_embedDataProvider, a4);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)CFSTR("embed");
}

- (int)role
{
  return 0;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SXEmbedComponentSizer *v15;
  void *v16;
  SXEmbedComponentSizer *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "componentStyleForComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [SXEmbedComponentSizer alloc];
  -[SXEmbedComponentSizerFactory embedDataProvider](self, "embedDataProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXEmbedComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:embedDataProvider:](v15, "initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:embedDataProvider:", v13, v12, v14, v10, v11, v16);

  return v17;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
