@implementation SXDOMObjectProviderFactory

- (SXDOMObjectProviderFactory)initWithDocumentControllerProvider:(id)a3 componentStyleMerger:(id)a4 componentTextStyleMerger:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXDOMObjectProviderFactory *v12;
  SXDOMObjectProviderFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDOMObjectProviderFactory;
  v12 = -[SXDOMObjectProviderFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentControllerProvider, a3);
    objc_storeStrong((id *)&v13->_componentStyleMerger, a4);
    objc_storeStrong((id *)&v13->_componentTextStyleMerger, a5);
  }

  return v13;
}

- (id)createDOMObjectProvider
{
  SXDOMObjectProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  SXDOMObjectProvider *v7;

  v3 = [SXDOMObjectProvider alloc];
  -[SXDOMObjectProviderFactory documentControllerProvider](self, "documentControllerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMObjectProviderFactory componentStyleMerger](self, "componentStyleMerger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMObjectProviderFactory componentTextStyleMerger](self, "componentTextStyleMerger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SXDOMObjectProvider initWithDocumentControllerProvider:componentStyleMerger:componentTextStyleMerger:](v3, "initWithDocumentControllerProvider:componentStyleMerger:componentTextStyleMerger:", v4, v5, v6);

  return v7;
}

- (SXDocumentControllerProvider)documentControllerProvider
{
  return self->_documentControllerProvider;
}

- (SXJSONObjectMerger)componentStyleMerger
{
  return self->_componentStyleMerger;
}

- (SXJSONObjectMerger)componentTextStyleMerger
{
  return self->_componentTextStyleMerger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentTextStyleMerger, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
  objc_storeStrong((id *)&self->_documentControllerProvider, 0);
}

@end
