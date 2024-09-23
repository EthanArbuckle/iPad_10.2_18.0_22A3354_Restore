@implementation SBUILegibilityShadowView

- (BOOL)_updateFilters
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBUILegibilityShadowView;
  v3 = -[SBUILegibilityContainerView _updateFilters](&v14, sel__updateFilters);
  v13.receiver = self;
  v13.super_class = (Class)SBUILegibilityShadowView;
  -[SBUILegibilityContainerView legibilitySettings](&v13, sel_legibilitySettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityShadowView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_5:
    objc_msgSend(v5, "compositingFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = (uint64_t *)MEMORY[0x1E0CD2E70];
    goto LABEL_8;
  }
  objc_msgSend(v4, "shadowSettings");
  if (v12 == 2)
  {
    objc_msgSend(v5, "compositingFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = (uint64_t *)MEMORY[0x1E0CD2DE0];
  }
  else
  {
    if (v12 != 1)
    {
      if (v12)
        goto LABEL_10;
      goto LABEL_5;
    }
    objc_msgSend(v5, "compositingFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = (uint64_t *)MEMORY[0x1E0CD2C30];
  }
LABEL_8:
  v9 = *v8;
  v10 = objc_msgSend(v6, "isEqual:", *v8);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v5, "setCompositingFilter:", v9);
    v3 = 1;
  }
LABEL_10:

  return v3;
}

- (void)setImage:(id)a3 strengthenedImage:(id)a4 strength:(double)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUILegibilityShadowView;
  -[SBUILegibilityContainerView setImage:strengthenedImage:strength:](&v5, sel_setImage_strengthenedImage_strength_, a3, a4, a5);
}

- (id)_contentColor
{
  void *v2;
  void *v3;

  -[SBUILegibilityContainerView legibilitySettings](self, "legibilitySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
