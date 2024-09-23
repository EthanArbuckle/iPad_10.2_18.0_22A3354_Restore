@implementation SearchUIButtonBackgroundView

- (void)setColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    -[SearchUIButtonBackgroundView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    v5 = v6;
  }

}

- (void)setUseHierarchicalColorRendering:(BOOL)a3
{
  if (self->_useHierarchicalColorRendering != a3)
  {
    self->_useHierarchicalColorRendering = a3;
    -[SearchUIButtonBackgroundView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIButtonBackgroundView;
  -[TLKProminenceView tlk_updateForAppearance:](&v12, sel_tlk_updateForAppearance_, v4);
  -[SearchUIButtonBackgroundView color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v4, "disableAppearanceForView:", self);
  -[SearchUIButtonBackgroundView color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SearchUIButtonBackgroundView useHierarchicalColorRendering](self, "useHierarchicalColorRendering");
  v8 = 0.15;
  if (!v7)
    v8 = 1.0;
  objc_msgSend(v6, "colorWithAlphaComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    if ((objc_msgSend(v4, "isVibrant") & 1) != 0)
      objc_msgSend(v4, "quaternaryColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  -[SearchUIButtonBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v10);

}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)useHierarchicalColorRendering
{
  return self->_useHierarchicalColorRendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
