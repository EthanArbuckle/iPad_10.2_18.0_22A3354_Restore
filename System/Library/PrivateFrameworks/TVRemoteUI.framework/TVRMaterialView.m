@implementation TVRMaterialView

- (TVRMaterialView)initWithDarkMaterialView
{
  void *v3;
  TVRMaterialView *v4;

  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TVRMaterialView initWithMaterialView:](self, "initWithMaterialView:", v3);

  return v4;
}

- (TVRMaterialView)initWithMaterialView:(id)a3
{
  id v5;
  TVRMaterialView *v6;
  TVRMaterialView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMaterialView;
  v6 = -[TVRMaterialView init](&v9, sel_init);
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_materialView, a3);
    -[TVRMaterialView addSubview:](v7, "addSubview:", v7->_materialView);
  }

  return v7;
}

+ (id)trackpadMaterialView
{
  void *v2;
  TVRMaterialView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[TVRMaterialView initWithMaterialView:]([TVRMaterialView alloc], "initWithMaterialView:", v2);
  v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setAlpha:", 0.12);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v8);

  -[TVRMaterialView insertSubview:aboveSubview:](v3, "insertSubview:aboveSubview:", v4, v3->_materialView);
  return v3;
}

+ (id)seperatorMaterialView
{
  TVRMaterialView *v2;
  void *v3;

  v2 = -[TVRMaterialView initWithMaterialView:]([TVRMaterialView alloc], "initWithMaterialView:", 0);
  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForRecipe:andCategory:", 4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automaticallyUpdateView:withStyle:", v2, 0);

  return v2;
}

+ (id)backgroundMaterialViewWithWeighting:(double)a3
{
  void *v3;
  TVRMaterialView *v4;

  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:options:initialWeighting:", 20, 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TVRMaterialView initWithMaterialView:]([TVRMaterialView alloc], "initWithMaterialView:", v3);

  return v4;
}

- (void)layoutSubviews
{
  MTMaterialView *materialView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRMaterialView;
  -[TVRMaterialView layoutSubviews](&v4, sel_layoutSubviews);
  materialView = self->_materialView;
  -[TVRMaterialView bounds](self, "bounds");
  -[MTMaterialView setFrame:](materialView, "setFrame:");
}

- (void)setWeighting:(double)a3
{
  -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", a3);
}

- (double)weighting
{
  double result;

  -[MTMaterialView weighting](self->_materialView, "weighting");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
