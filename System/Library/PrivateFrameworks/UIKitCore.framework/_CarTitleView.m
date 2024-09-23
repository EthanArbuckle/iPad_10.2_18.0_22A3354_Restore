@implementation _CarTitleView

- (void)setText:(id)a3
{
  id *p_text;
  void *v6;
  void *v7;
  UILabel *v8;
  UIView *v9;
  UIView *view;
  id v11;

  p_text = (id *)&self->_text;
  v11 = a3;
  if ((objc_msgSend(*p_text, "isEqualToString:") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0D156E0];
    -[_CarTitleView extraConstraints](self, "extraConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    -[_CarTitleView setExtraConstraints:](self, "setExtraConstraints:", 0);
    objc_storeStrong((id *)&self->_text, a3);
    if (*p_text)
    {
      v8 = [UILabel alloc];
      v9 = -[UILabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setText:](v9, "setText:", v11);
      -[UIView setAdjustsFontForContentSizeCategory:](v9, "setAdjustsFontForContentSizeCategory:", 1);
    }
    else
    {
      v9 = 0;
    }
    view = self->_view;
    self->_view = v9;

    -[_CarTitleView _updateText](self, "_updateText");
    -[_CarTitleView _updateLayout](self, "_updateLayout");
  }

}

- (void)setView:(id)a3
{
  UIView *v4;
  NSString *text;
  void *v6;
  void *v7;
  UIView *view;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = (UIView *)a3;
  text = self->_text;
  self->_text = 0;

  v6 = (void *)MEMORY[0x1E0D156E0];
  -[_CarTitleView extraConstraints](self, "extraConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v7);

  -[_CarTitleView setExtraConstraints:](self, "setExtraConstraints:", 0);
  view = self->_view;
  self->_view = v4;
  v9 = v4;

  -[UIView topAnchor](v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  -[UIView bottomAnchor](v9, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CarTitleView setExtraConstraints:](self, "setExtraConstraints:", v16);
  -[_CarTitleView _updateLayout](self, "_updateLayout");
}

- (void)setLargeText:(BOOL)a3
{
  if (self->_largeText != a3)
  {
    self->_largeText = a3;
    -[_CarTitleView _updateText](self, "_updateText");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_CarTitleView view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateText
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[_CarTitleView text](self, "text");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_CarTitleView view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[_CarTitleView view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CarTitleView extraConstraints](self, "extraConstraints");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v7, "firstBaselineAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self, "topAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintEqualToAnchor:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CarTitleView setExtraConstraints:](self, "setExtraConstraints:", v12);

      }
      if (-[_CarTitleView largeText](self, "largeText"))
      {
        objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:variant:", CFSTR("UICTFontTextStyleTitle1"), 1024);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFont:", v13);

        objc_msgSend(v7, "setTextAlignment:", 4);
        -[_CarTitleView extraConstraints](self, "extraConstraints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 32.0;
      }
      else
      {
        objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:variant:", CFSTR("UICTFontTextStyleCallout"), 1024);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFont:", v18);

        objc_msgSend(v7, "setTextAlignment:", 1);
        -[_CarTitleView extraConstraints](self, "extraConstraints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 28.0;
      }
      objc_msgSend(v15, "setConstant:", v17);

      objc_msgSend(v7, "sizeToFit");
    }
  }
}

- (void)_updateLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  -[_CarTitleView view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_CarTitleView view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_CarTitleView view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v10);

    -[_CarTitleView extraConstraints](self, "extraConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[UIView leadingAnchor](self->_view, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    -[UIView trailingAnchor](self->_view, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v19);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v12);
  }
}

- (UIView)view
{
  return self->_view;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)largeText
{
  return self->_largeText;
}

- (NSArray)extraConstraints
{
  return self->_extraConstraints;
}

- (void)setExtraConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_extraConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraConstraints, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
