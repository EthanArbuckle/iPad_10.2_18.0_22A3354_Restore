@implementation _TVUISearchBar

+ (id)_tvmlKitBundle
{
  if (_tvmlKitBundle_onceToken != -1)
    dispatch_once(&_tvmlKitBundle_onceToken, &__block_literal_global_40);
  return (id)_tvmlKitBundle_bundle;
}

+ (id)_clearGlyph
{
  if (_clearGlyph_onceToken != -1)
    dispatch_once(&_clearGlyph_onceToken, &__block_literal_global_2_0);
  return (id)_clearGlyph_clearGlpyh;
}

+ (id)_searchGlyph
{
  if (_searchGlyph_onceToken != -1)
    dispatch_once(&_searchGlyph_onceToken, &__block_literal_global_8);
  return (id)_searchGlyph_searchGlyph;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int IsAccessibilityContentSizeCategory;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_TVUISearchBar;
  -[_TVUISearchBar traitCollectionDidChange:](&v16, sel_traitCollectionDidChange_, a3);
  -[_TVUISearchBar searchField](self, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_placeholderLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRoundedRectBackgroundCornerRadius:", 6.0);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  v9 = (_QWORD *)MEMORY[0x24BDF7850];
  if (IsAccessibilityContentSizeCategory)
    v9 = (_QWORD *)MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v10);
  objc_msgSend(v5, "setFont:", v10);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v11);

  objc_msgSend((id)objc_opt_class(), "_clearGlyph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_searchGlyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVUISearchBar setImage:forSearchBarIcon:state:](self, "setImage:forSearchBarIcon:state:", v12, 1, 0);
  -[_TVUISearchBar setPositionAdjustment:forSearchBarIcon:](self, "setPositionAdjustment:forSearchBarIcon:", 1, -4.0, 0.0);
  -[_TVUISearchBar searchField](self, "searchField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v13);
  objc_msgSend(v14, "setLeftView:", v15);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)_TVUISearchBar;
  -[_TVUISearchBar layoutSubviews](&v8, sel_layoutSubviews);
  -[_TVUISearchBar searchField](self, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  -[_TVUISearchBar bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:", v5, 0.0, v7, CGRectGetHeight(v9));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  int IsAccessibilityContentSizeCategory;
  _QWORD *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  v15.receiver = self;
  v15.super_class = (Class)_TVUISearchBar;
  -[_TVUISearchBar sizeThatFits:](&v15, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  v8 = (_QWORD *)MEMORY[0x24BDF7850];
  if (IsAccessibilityContentSizeCategory)
  {
    v8 = (_QWORD *)MEMORY[0x24BDF77B0];
    v9 = 33.0;
  }
  else
  {
    v9 = 44.0;
  }
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", v9);
  v12 = round(v11);

  v13 = v4;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(&unk_24EBCD4D8, "containsObject:", v6))
    v7 = 4;
  else
    v7 = 3;
  v8.receiver = self;
  v8.super_class = (Class)_TVUISearchBar;
  -[_TVUISearchBar setSemanticContentAttribute:](&v8, sel_setSemanticContentAttribute_, v7);

}

@end
