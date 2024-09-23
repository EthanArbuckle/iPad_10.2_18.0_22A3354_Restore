@implementation SXTextComponentSizerFactory

- (SXTextComponentSizerFactory)initWithDOMObjectProvider:(id)a3 textComponentLayoutHosting:(id)a4 textSourceFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXTextComponentSizerFactory *v12;
  SXTextComponentSizerFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXTextComponentSizerFactory;
  v12 = -[SXTextComponentSizerFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v13->_textComponentLayoutHosting, a4);
    objc_storeStrong((id *)&v13->_textSourceFactory, a5);
  }

  return v13;
}

- (NSString)type
{
  return (NSString *)CFSTR("text");
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
  SXTextComponentSizer *v15;
  void *v16;
  void *v17;
  SXTextComponentSizer *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "componentStyleForComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [SXTextComponentSizer alloc];
  -[SXTextComponentSizerFactory textComponentLayoutHosting](self, "textComponentLayoutHosting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextComponentSizerFactory textSourceFactory](self, "textSourceFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SXTextComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:textComponentLayoutHosting:textSourceFactory:](v15, "initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:textComponentLayoutHosting:textSourceFactory:", v13, v12, v14, v10, v11, v16, v17);

  return v18;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return self->_textComponentLayoutHosting;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
