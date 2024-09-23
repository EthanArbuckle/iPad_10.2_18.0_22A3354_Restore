@implementation SXTextSourceFactory

- (SXTextSourceFactory)initWithSmartFieldFactory:(id)a3 documentLanguageProvider:(id)a4 fontAttributesConstructor:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXTextSourceFactory *v12;
  SXTextSourceFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXTextSourceFactory;
  v12 = -[SXTextSourceFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartFieldFactory, a3);
    objc_storeStrong((id *)&v13->_documentLanguageProvider, a4);
    objc_storeStrong((id *)&v13->_fontAttributesConstructor, a5);
  }

  return v13;
}

- (id)createTextSourceWithString:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  SXTextSource *v8;
  void *v9;
  void *v10;
  void *v11;
  SXTextSource *v12;

  v6 = a4;
  v7 = a3;
  v8 = [SXTextSource alloc];
  -[SXTextSourceFactory smartFieldFactory](self, "smartFieldFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextSourceFactory documentLanguageProvider](self, "documentLanguageProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextSourceFactory fontAttributesConstructor](self, "fontAttributesConstructor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SXTextSource initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:](v8, "initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:", v7, v9, v6, v10, v11);

  return v12;
}

- (SXSmartFieldFactory)smartFieldFactory
{
  return self->_smartFieldFactory;
}

- (SXDocumentLanguageProviding)documentLanguageProvider
{
  return self->_documentLanguageProvider;
}

- (SXFontAttributesConstructor)fontAttributesConstructor
{
  return self->_fontAttributesConstructor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributesConstructor, 0);
  objc_storeStrong((id *)&self->_documentLanguageProvider, 0);
  objc_storeStrong((id *)&self->_smartFieldFactory, 0);
}

@end
