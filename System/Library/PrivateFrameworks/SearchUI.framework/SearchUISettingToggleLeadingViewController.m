@implementation SearchUISettingToggleLeadingViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = a3;
  +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:](SearchUIShortcutsUtilities, "commandForSettingTogglesFromRowModel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v5, "thumbnail"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v5, "thumbnail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "biomeStreamIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v8, "symbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)setupView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUISettingToggleLeadingViewController;
  -[SearchUIThumbnailViewController setupView](&v8, sel_setupView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47498], "staticMaterialViewWithRecipe:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISettingToggleLeadingViewController setBackgroundView:](self, "setBackgroundView:", v4);

  -[SearchUISettingToggleLeadingViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:atIndex:", v5, 0);

  -[SearchUISettingToggleLeadingViewController backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setProminence:", 0);
  return v3;
}

- (double)symbolFontSize
{
  double v2;
  double v3;

  -[SearchUISettingToggleLeadingViewController thumbnailSize](self, "thumbnailSize");
  if (v2 >= v3)
    v2 = v3;
  return v2 * 0.415;
}

- (CGSize)thumbnailSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSizeIsCompactWidth:", -[SearchUILeadingViewController usesCompactWidth](self, "usesCompactWidth"));
  v4 = v3;
  -[SearchUILeadingViewController rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "useCompactVersionOfUI"))
  {
    +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
    v4 = v6;
    v8 = v7;
  }
  else
  {
    v8 = v4;
  }

  v9 = v4;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SearchUISettingToggleLeadingViewController;
  -[SearchUIThumbnailViewController updateWithRowModel:](&v19, sel_updateWithRowModel_, a3);
  -[SearchUILeadingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumLayoutSize");
  v6 = v5;

  -[SearchUILeadingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maximumLayoutSize");
  v9 = v8;

  if (v6 >= v9)
    v10 = v9;
  else
    v10 = v6;
  v11 = v10 * 0.5;
  -[SearchUILeadingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v11);

  -[SearchUILeadingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClipsToBounds:", 1);

  -[SearchUILeadingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_cornerRadius");
  v17 = v16;
  -[SearchUISettingToggleLeadingViewController backgroundView](self, "backgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setCornerRadius:", v17);

}

- (id)imageForRowModel:(id)a3 appearance:(id)a4
{
  void *v5;
  void *v6;
  SearchUISymbolImage *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SearchUISymbolImage initWithSFImage:]([SearchUISymbolImage alloc], "initWithSFImage:", v6);
  -[SearchUISettingToggleLeadingViewController symbolFontSize](self, "symbolFontSize");
  -[SearchUISymbolImage setPreferredSymbolFontSize:](v7, "setPreferredSymbolFontSize:");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISymbolImage setCustomBackgroundColor:](v7, "setCustomBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISymbolImage setCustomForegroundColor:](v7, "setCustomForegroundColor:", v9);

  -[SearchUISettingToggleLeadingViewController thumbnailSize](self, "thumbnailSize");
  -[SearchUISymbolImage setSize:](v7, "setSize:");

  return v7;
}

- (unint64_t)type
{
  return 5;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIVisualEffectView)enabledBackgroundView
{
  return self->_enabledBackgroundView;
}

- (void)setEnabledBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_enabledBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
