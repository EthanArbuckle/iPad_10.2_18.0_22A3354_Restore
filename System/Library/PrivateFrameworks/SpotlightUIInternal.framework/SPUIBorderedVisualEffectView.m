@implementation SPUIBorderedVisualEffectView

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
  v9.super_class = (Class)SPUIBorderedVisualEffectView;
  -[SPUIBorderedVisualEffectView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SPUIBorderedVisualEffectView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SPUIBorderedVisualEffectView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SPUIBorderedVisualEffectView traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)SPUIBorderedVisualEffectView;
  -[SPUIBorderedVisualEffectView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SPUIBorderedVisualEffectView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (SPUIBorderedVisualEffectView)initWithEffect:(id)a3
{
  SPUIBorderedVisualEffectView *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPUIBorderedVisualEffectView;
  v3 = -[SPUIBorderedVisualEffectView initWithEffect:](&v9, sel_initWithEffect_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.06);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[SPUIBorderedVisualEffectView contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v5);

  }
  return v3;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPUIBorderedVisualEffectView;
  v4 = a3;
  -[SPUIBorderedVisualEffectView tlk_updateForAppearance:](&v10, sel_tlk_updateForAppearance_, v4);
  v5 = objc_msgSend(v4, "isDark", v10.receiver, v10.super_class);

  v6 = 0.0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB4BC0], "pixelWidthForView:", self);
    v6 = v7;
  }
  -[SPUIBorderedVisualEffectView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", v6);

}

@end
