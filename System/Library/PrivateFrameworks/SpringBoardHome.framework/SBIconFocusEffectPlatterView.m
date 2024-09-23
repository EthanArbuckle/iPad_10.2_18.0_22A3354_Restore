@implementation SBIconFocusEffectPlatterView

- (SBIconFocusEffectPlatterView)initWithFrame:(CGRect)a3
{
  SBIconFocusEffectPlatterView *v3;
  SBIconFocusEffectPlatterView *v4;
  void *v5;
  uint64_t v6;
  MTMaterialView *materialView;
  void *v8;
  uint64_t v9;
  UIView *vibrantFillView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBIconFocusEffectPlatterView;
  v3 = -[SBIconFocusEffectPlatterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBIconFocusEffectPlatterView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

    -[SBIconFocusEffectPlatterView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", MTMaterialRecipeForUIBlurEffectStyle());
    v6 = objc_claimAutoreleasedReturnValue();
    materialView = v4->_materialView;
    v4->_materialView = (MTMaterialView *)v6;

    -[SBIconFocusEffectPlatterView addSubview:](v4, "addSubview:", v4->_materialView);
    -[MTMaterialView visualStylingProviderForCategory:](v4->_materialView, "visualStylingProviderForCategory:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "newAutomaticallyUpdatingViewWithStyle:", 0);
    vibrantFillView = v4->_vibrantFillView;
    v4->_vibrantFillView = (UIView *)v9;

    -[SBIconFocusEffectPlatterView addSubview:](v4, "addSubview:", v4->_vibrantFillView);
  }
  return v4;
}

- (void)layoutSubviews
{
  MTMaterialView *materialView;
  UIView *vibrantFillView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconFocusEffectPlatterView;
  -[SBIconFocusEffectPlatterView layoutSubviews](&v5, sel_layoutSubviews);
  materialView = self->_materialView;
  -[SBIconFocusEffectPlatterView bounds](self, "bounds");
  -[MTMaterialView setFrame:](materialView, "setFrame:");
  vibrantFillView = self->_vibrantFillView;
  -[SBIconFocusEffectPlatterView bounds](self, "bounds");
  -[UIView setFrame:](vibrantFillView, "setFrame:");
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (UIView)vibrantFillView
{
  return self->_vibrantFillView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantFillView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
