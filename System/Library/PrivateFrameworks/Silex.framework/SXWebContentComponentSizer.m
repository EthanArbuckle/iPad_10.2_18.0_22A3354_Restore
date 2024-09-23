@implementation SXWebContentComponentSizer

- (SXWebContentComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 loadingPolicyProvider:(id)a8
{
  id v15;
  SXWebContentComponentSizer *v16;
  SXWebContentComponentSizer *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SXWebContentComponentSizer;
  v16 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v19, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_loadingPolicyProvider, a8);

  return v17;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;

  v5 = a4;
  -[SXWebContentComponentSizer loadingPolicyProvider](self, "loadingPolicyProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "loadingPolicy");

  v8 = 0.0;
  if (v7 != 2)
  {
    -[SXComponentSizer suggestedSize](self, "suggestedSize");
    if (v9 == 0.0)
    {
      -[SXComponentSizer componentLayout](self, "componentLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "suggestedHeight");
      v12 = v11;

      if (v12)
      {
        objc_msgSend(v5, "unitConverter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentSizer componentLayout](self, "componentLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "suggestedHeight");
        objc_msgSend(v13, "convertValueToPoints:", v15, v16);
        v18 = v17;

        if (v18 >= 20.0)
          v19 = v18;
        else
          v19 = 20.0;
        objc_msgSend(v5, "unitConverter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "convertValueToPoints:", 0x4059000000000000, 2);
        v8 = v21;

        if (v19 < v8)
          v8 = v19;
      }
      else
      {
        v8 = 300.0;
      }
    }
    else
    {
      -[SXComponentSizer suggestedSize](self, "suggestedSize");
      v8 = v22;
    }
  }

  return v8;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingPolicyProvider, 0);
}

@end
