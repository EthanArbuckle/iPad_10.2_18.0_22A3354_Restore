@implementation SXIssueCoverComponentSizer

- (SXIssueCoverComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 layoutOptionsFactory:(id)a8
{
  id v15;
  SXIssueCoverComponentSizer *v16;
  SXIssueCoverComponentSizer *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SXIssueCoverComponentSizer;
  v16 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v19, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_layoutOptionsFactory, a8);

  return v17;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  SXIssueCover *v6;
  void *v7;
  void *v8;
  SXIssueCover *v9;
  SXIssueCoverLayoutOptions *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v6 = [SXIssueCover alloc];
  -[SXComponentSizer component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "issueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXIssueCover initWithIssueIdentifier:](v6, "initWithIssueIdentifier:", v8);

  v10 = -[SXIssueCoverLayoutOptions initWithBoundingWidth:]([SXIssueCoverLayoutOptions alloc], "initWithBoundingWidth:", a3);
  -[SXIssueCoverComponentSizer layoutOptionsFactory](self, "layoutOptionsFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createAttributesWithIssueCover:options:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "frame");
  v14 = v13;

  return v14;
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
