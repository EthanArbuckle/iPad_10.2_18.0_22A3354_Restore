@implementation SearchUIBackgroundView

- (SearchUIBackgroundView)init
{
  SearchUIBackgroundView *v2;
  SearchUIBackgroundView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIBackgroundView;
  v2 = -[SearchUIBackgroundView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SearchUIBackgroundView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  }
  return v3;
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  if (self->_shouldUseInsetRoundedSections != a3)
  {
    self->_shouldUseInsetRoundedSections = a3;
    -[SearchUIBackgroundView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIBackgroundView;
  -[SearchUIBackgroundView tlk_updateForAppearance:](&v12, sel_tlk_updateForAppearance_, v4);
  if (objc_msgSend(v4, "isVibrant")
    && -[SearchUIBackgroundView isInPreviewPlatter](self, "isInPreviewPlatter"))
  {
    -[SearchUIBackgroundView platterView](self, "platterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
        v6 = 53;
      else
        v6 = 12;
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:configuration:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGroupNameBase:", CFSTR("SearchUIPreviewPlatter"));
      -[SearchUIBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);
      +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v7);
      -[SearchUIBackgroundView setPlatterView:](self, "setPlatterView:", v7);

    }
    -[SearchUIBackgroundView platterView](self, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[SearchUIBackgroundView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  else
  {
    -[SearchUIBackgroundView platterView](self, "platterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    if (-[SearchUIBackgroundView isInPreviewPlatter](self, "isInPreviewPlatter"))
    {
      objc_msgSend(v4, "platterColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[SearchUIBackgroundView shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections"))
        objc_msgSend(v4, "groupedBackgroundColor");
      else
        objc_msgSend(v4, "backgroundColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    -[SearchUIBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v10);

  }
}

- (BOOL)isInPreviewPlatter
{
  return self->_inPreviewPlatter;
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (UIView)platterView
{
  return (UIView *)objc_getProperty(self, a2, 424, 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIBackgroundView;
  -[SearchUIBackgroundView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIBackgroundView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIBackgroundView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIBackgroundView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIBackgroundView;
  -[SearchUIBackgroundView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIBackgroundView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  if (self->_inPreviewPlatter != a3)
  {
    self->_inPreviewPlatter = a3;
    -[SearchUIBackgroundView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setPlatterView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
