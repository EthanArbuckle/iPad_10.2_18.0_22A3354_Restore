@implementation SXIssueCoverComponentSizerFactory

- (SXIssueCoverComponentSizerFactory)initWithLayoutAttributesFactory:(id)a3
{
  id v5;
  SXIssueCoverComponentSizerFactory *v6;
  SXIssueCoverComponentSizerFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXIssueCoverComponentSizerFactory;
  v6 = -[SXIssueCoverComponentSizerFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layoutOptionsFactory, a3);

  return v7;
}

- (NSString)type
{
  return (NSString *)CFSTR("issue_cover");
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
  SXIssueCoverComponentSizer *v15;
  void *v16;
  SXIssueCoverComponentSizer *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "componentStyleForComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [SXIssueCoverComponentSizer alloc];
  -[SXIssueCoverComponentSizerFactory layoutOptionsFactory](self, "layoutOptionsFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXIssueCoverComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:layoutOptionsFactory:](v15, "initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:layoutOptionsFactory:", v13, v12, v14, v10, v11, v16);

  return v17;
}

- (SXIssueCoverLayoutAttributesFactory)layoutOptionsFactory
{
  return self->_layoutOptionsFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptionsFactory, 0);
}

@end
