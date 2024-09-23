@implementation SiriUIBackgroundBlurView

- (SiriUIBackgroundBlurView)initWithFrame:(CGRect)a3
{
  SiriUIBackgroundBlurView *v3;
  SiriUIBackgroundBlurView *v4;
  uint64_t v5;
  MTMaterialView *materialView;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUIBackgroundBlurView;
  v3 = -[SiriUIBackgroundBlurView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriUIBackgroundBlurView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipeNamed:inBundle:configuration:initialWeighting:scaleAdjustment:", CFSTR("knowledgeBackground"), 0, 1, &__block_literal_global_4, 1.0);
    v5 = objc_claimAutoreleasedReturnValue();
    materialView = v4->_materialView;
    v4->_materialView = (MTMaterialView *)v5;

    -[MTMaterialView layer](v4->_materialView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsHitTesting:", 0);

    -[MTMaterialView setOverrideUserInterfaceStyle:](v4->_materialView, "setOverrideUserInterfaceStyle:", 2);
    -[MTMaterialView setRecipeDynamic:](v4->_materialView, "setRecipeDynamic:", 0);
    -[MTMaterialView setShouldCrossfade:](v4->_materialView, "setShouldCrossfade:", 1);
    -[MTMaterialView setWeighting:](v4->_materialView, "setWeighting:", 0.0);
    -[SiriUIBackgroundBlurView addSubview:](v4, "addSubview:", v4->_materialView);
    -[SiriUIBackgroundBlurView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

  }
  return v4;
}

double __42__SiriUIBackgroundBlurView_initWithFrame___block_invoke()
{
  return 1.0;
}

- (void)setVisible:(BOOL)a3
{
  MTMaterialView *materialView;
  double v4;

  materialView = self->_materialView;
  v4 = 0.0;
  if (a3)
    v4 = 1.0;
  -[MTMaterialView setWeighting:](materialView, "setWeighting:", v4);
}

- (void)layoutSubviews
{
  MTMaterialView *materialView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIBackgroundBlurView;
  -[SiriUIBackgroundBlurView layoutSubviews](&v4, sel_layoutSubviews);
  materialView = self->_materialView;
  -[SiriUIBackgroundBlurView bounds](self, "bounds");
  -[MTMaterialView setFrame:](materialView, "setFrame:");
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
