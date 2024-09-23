@implementation _UIStatusBarIndicatorQuietModeItem

+ (_UIStatusBarIdentifier)emphasizedQuietModeIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("emphasizedQuietModeIdentifier"));
}

- (_UIStatusBarImageView)emphasizedImageView
{
  _UIStatusBarImageView *emphasizedImageView;

  emphasizedImageView = self->_emphasizedImageView;
  if (!emphasizedImageView)
  {
    -[_UIStatusBarIndicatorQuietModeItem _create_emphasizedImageView](self, "_create_emphasizedImageView");
    emphasizedImageView = self->_emphasizedImageView;
  }
  return emphasizedImageView;
}

- (void)_create_emphasizedImageView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *emphasizedImageView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  emphasizedImageView = self->_emphasizedImageView;
  self->_emphasizedImageView = v4;

  -[_UIStatusBarImageView setFontStyle:](self->_emphasizedImageView, "setFontStyle:", 1);
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "emphasizedQuietModeIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarIndicatorQuietModeItem emphasizedImageView](self, "emphasizedImageView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarIndicatorQuietModeItem;
    -[_UIStatusBarIndicatorItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)imageViewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "emphasizedQuietModeIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarIndicatorQuietModeItem emphasizedImageView](self, "emphasizedImageView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarIndicatorQuietModeItem;
    -[_UIStatusBarIndicatorItem imageViewForIdentifier:](&v9, sel_imageViewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "emphasizedQuietModeIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIStatusBarIndicatorQuietModeItem;
    v6 = -[_UIStatusBarIndicatorItem shouldUpdateIndicatorForIdentifier:](&v8, sel_shouldUpdateIndicatorForIdentifier_, v4);
  }

  return v6;
}

- (id)indicatorEntryKey
{
  return CFSTR("quietModeEntry");
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quietModeEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("moon.fill");
  v7 = v5;

  return v7;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIStatusBarIndicatorQuietModeItem;
  -[_UIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v20, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataChanged"))
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quietModeEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = 0.3;
    if (v11)
      v12 = 1.0;
    objc_msgSend(v7, "setViewAlpha:", v12);
    v13 = v11 ^ 1u;
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarIndicatorQuietModeItem imageViewForIdentifier:](self, "imageViewForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUseDisabledAppearanceForAccessibilityHUD:", v13);

    objc_msgSend(v6, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "quietModeEntry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "focusName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarIndicatorQuietModeItem setFocusName:](self, "setFocusName:", v18);

  }
  return v8;
}

- (NSString)focusName
{
  return self->_focusName;
}

- (void)setFocusName:(id)a3
{
  objc_storeStrong((id *)&self->_focusName, a3);
}

- (void)setEmphasizedImageView:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedImageView, 0);
  objc_storeStrong((id *)&self->_focusName, 0);
}

@end
