@implementation SXDOMModificationContextFactory

- (SXDOMModificationContextFactory)initWithDocumentProvider:(id)a3
{
  id v5;
  SXDOMModificationContextFactory *v6;
  SXDOMModificationContextFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDOMModificationContextFactory;
  v6 = -[SXDOMModificationContextFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_documentProvider, a3);

  return v7;
}

- (id)createModificationContextWithLayoutOptions:(id)a3
{
  id v4;
  SXDOMModificationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  SXDOMModificationContext *v9;

  v4 = a3;
  v5 = [SXDOMModificationContext alloc];
  -[SXDOMModificationContextFactory documentProvider](self, "documentProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXDOMModificationContext initWithLayoutOptions:specVersion:](v5, "initWithLayoutOptions:specVersion:", v4, v8);

  return v9;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end
