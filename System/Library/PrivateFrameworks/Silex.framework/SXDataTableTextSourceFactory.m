@implementation SXDataTableTextSourceFactory

- (SXDataTableTextSourceFactory)initWithSmartFieldFactory:(id)a3 documentLanguageProvider:(id)a4 fontAttributesConstructor:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXDataTableTextSourceFactory *v12;
  SXDataTableTextSourceFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDataTableTextSourceFactory;
  v12 = -[SXDataTableTextSourceFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartFieldFactory, a3);
    objc_storeStrong((id *)&v13->_documentLanguageProvider, a4);
    objc_storeStrong((id *)&v13->_fontAttributesConstructor, a5);
  }

  return v13;
}

- (id)textSourceWithFormattedText:(id)a3 indexPath:(id)a4 dataSource:(id)a5
{
  unint64_t var1;
  unint64_t var0;
  id v9;
  id v10;
  SXDataTableTextSource *v11;
  void *v12;
  void *v13;
  void *v14;
  SXDataTableTextSource *v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  v11 = [SXDataTableTextSource alloc];
  -[SXDataTableTextSourceFactory smartFieldFactory](self, "smartFieldFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableTextSourceFactory documentLanguageProvider](self, "documentLanguageProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableTextSourceFactory fontAttributesConstructor](self, "fontAttributesConstructor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SXDataTableTextSource initWithFormattedText:indexPath:smartFieldFactory:dataSource:documentLangaugeProvider:fontAttributesConstructor:](v11, "initWithFormattedText:indexPath:smartFieldFactory:dataSource:documentLangaugeProvider:fontAttributesConstructor:", v10, var0, var1, v12, v9, v13, v14);

  return v15;
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
