@implementation SXButtonComponentSizerFactory

- (SXButtonComponentSizerFactory)initWithTextProvider:(id)a3 textSourceFactory:(id)a4
{
  id v7;
  id v8;
  SXButtonComponentSizerFactory *v9;
  SXButtonComponentSizerFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXButtonComponentSizerFactory;
  v9 = -[SXButtonComponentSizerFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textProvider, a3);
    objc_storeStrong((id *)&v10->_textSourceFactory, a4);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)CFSTR("button");
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
  SXButtonComponentSizer *v15;
  void *v16;
  void *v17;
  void *v18;
  SXButtonComponentSizer *v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "componentStyleForComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [SXButtonComponentSizer alloc];
  -[SXButtonComponentSizerFactory textProvider](self, "textProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentSizerFactory textComponentLayoutHosting](self, "textComponentLayoutHosting");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentSizerFactory textSourceFactory](self, "textSourceFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SXButtonComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:textProvider:textComponentLayoutHosting:textSourceFactory:](v15, "initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:textProvider:textComponentLayoutHosting:textSourceFactory:", v13, v12, v14, v10, v11, v16, v17, v18);

  return v19;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return self->_textComponentLayoutHosting;
}

- (void)setTextComponentLayoutHosting:(id)a3
{
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, a3);
}

- (SXButtonComponentTextProvider)textProvider
{
  return self->_textProvider;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, 0);
}

@end
