@implementation SearchUISeparatorView

+ (id)separatorColorForAppearance:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "colorForProminence:", objc_msgSend((id)objc_opt_class(), "separatorProminenceForAppearance:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isVibrant");

  if (v5)
  {
    v9 = 0.0;
    objc_msgSend(v4, "getWhite:alpha:", 0, &v9);
    objc_msgSend(v4, "colorWithAlphaComponent:", v9 * 0.75);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

+ (unint64_t)separatorProminenceForAppearance:(id)a3
{
  if (objc_msgSend(a3, "isVibrant"))
    return 2;
  else
    return 3;
}

- (SearchUISeparatorView)init
{
  SearchUISeparatorView *v2;
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUISeparatorView;
  v2 = -[TLKProminenceView initWithProminence:](&v8, sel_initWithProminence_, 3);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    v6 = 1.0;
    if (!IsAccessibilityCategory)
      objc_msgSend(MEMORY[0x1E0DBDA48], "pixelWidthForView:", v2, 1.0);
    v2->_separatorHeight = v6;
  }
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  -[SearchUISeparatorView separatorHeight](self, "separatorHeight");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
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
  v9.super_class = (Class)SearchUISeparatorView;
  -[TLKProminenceView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUISeparatorView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUISeparatorView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUISeparatorView traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)SearchUISeparatorView;
  -[TLKProminenceView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUISeparatorView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUISeparatorView;
  v4 = a3;
  -[TLKProminenceView tlk_updateForAppearance:](&v6, sel_tlk_updateForAppearance_, v4);
  v5 = objc_msgSend((id)objc_opt_class(), "separatorProminenceForAppearance:", v4, v6.receiver, v6.super_class);

  -[TLKProminenceView setProminence:](self, "setProminence:", v5);
}

- (double)separatorHeight
{
  return self->_separatorHeight;
}

- (void)setSeparatorHeight:(double)a3
{
  self->_separatorHeight = a3;
}

@end
