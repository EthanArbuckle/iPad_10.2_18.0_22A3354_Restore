@implementation SXDataTableComponentSizerFactory

- (SXDataTableComponentSizerFactory)initWithDOMObjectProvider:(id)a3 textComponentLayoutHosting:(id)a4 textSourceFactory:(id)a5 recordValueTransformerFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXDataTableComponentSizerFactory *v15;
  SXDataTableComponentSizerFactory *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXDataTableComponentSizerFactory;
  v15 = -[SXDataTableComponentSizerFactory init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v16->_textComponentLayoutHosting, a4);
    objc_storeStrong((id *)&v16->_textSourceFactory, a5);
    objc_storeStrong((id *)&v16->_recordValueTransformerFactory, a6);
  }

  return v16;
}

- (NSString)type
{
  return (NSString *)CFSTR("data_table");
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
  SXDataTableComponentSizer *v15;
  void *v16;
  void *v17;
  void *v18;
  SXDataTableComponentSizer *v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "componentStyleForComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [SXDataTableComponentSizer alloc];
  -[SXDataTableComponentSizerFactory textComponentLayoutHosting](self, "textComponentLayoutHosting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentSizerFactory textSourceFactory](self, "textSourceFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentSizerFactory recordValueTransformerFactory](self, "recordValueTransformerFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SXDataTableComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:textComponentLayoutHosting:textSourceFactory:recordValueTransformerFactory:](v15, "initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:textComponentLayoutHosting:textSourceFactory:recordValueTransformerFactory:", v13, v12, v14, v10, v11, v16, v17, v18);

  return v19;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return self->_textComponentLayoutHosting;
}

- (SXDataTableTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (SXDataRecordValueTransformerFactory)recordValueTransformerFactory
{
  return self->_recordValueTransformerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordValueTransformerFactory, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
