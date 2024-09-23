@implementation SXDOMFactory

- (SXDOMFactory)initWithDocumentProvider:(id)a3
{
  id v5;
  SXDOMFactory *v6;
  SXDOMFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDOMFactory;
  v6 = -[SXDOMFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_documentProvider, a3);

  return v7;
}

- (id)createDOM
{
  void *v2;
  void *v3;
  SXComponents *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  SXDOM *v18;
  SXDOM *v19;
  void *v20;
  void *v21;
  void *v22;
  SXDOMAnalysis *v23;
  SXComponents *v24;

  -[SXDOMFactory documentProvider](self, "documentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [SXComponents alloc];
  objc_msgSend(v3, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NSArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SXComponents initWithArray:](v4, "initWithArray:", v6);

  v23 = objc_alloc_init(SXDOMAnalysis);
  v18 = [SXDOM alloc];
  objc_msgSend(v3, "componentLayouts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "NSDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentStyles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "NSDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentTextStyles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "NSDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStyles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "NSDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "NSDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autoplacement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SXDOM initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:](v18, "initWithComponents:componentLayouts:componentStyles:componentTextStyles:textStyles:resources:autoPlacement:documentStyle:analysis:metadata:", v24, v7, v8, v9, v10, v12, v13, v14, v23, v15);

  return v19;
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
