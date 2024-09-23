@implementation UIKeyboardEmojiCollectionViewCell

- (id)accessibilityIdentifier
{
  return -[UIKeyboardEmoji emojiString](self->_emoji, "emojiString");
}

- (UIKeyboardEmojiCollectionViewCell)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiCollectionViewCell *v3;
  UIKeyboardEmojiDraggableView *v4;
  uint64_t v5;
  UIKeyboardEmojiDraggableView *emojiLabel;
  void *v7;
  uint64_t v8;
  UIKeyboardEmoji *emoji;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiCollectionViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIKeyboardEmojiDraggableView alloc];
    -[UIView bounds](v3, "bounds");
    v5 = -[UIKeyboardEmojiDraggableView initWithFrame:](v4, "initWithFrame:");
    emojiLabel = v3->_emojiLabel;
    v3->_emojiLabel = (UIKeyboardEmojiDraggableView *)v5;

    +[UIColor clearColor](UIColor, "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_emojiLabel, "setBackgroundColor:", v7);

    +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    emoji = v3->_emoji;
    v3->_emoji = (UIKeyboardEmoji *)v8;

    v3->_highlightPadding = 2.0;
    -[UICollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_emojiLabel);

  }
  return v3;
}

- (void)setCellBeingTouched:(BOOL)a3
{
  self->_cellBeingTouched = a3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiCollectionViewCell;
  -[UICollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_emojiLabel, "setFrame:");
}

- (void)setEmoji:(id)a3
{
  UIKeyboardEmojiDraggableView *emojiLabel;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (self->_noResultsCell)
    -[UIKeyboardEmojiCollectionViewCell setNoResultsCell:](self, "setNoResultsCell:", 0);
  objc_storeStrong((id *)&self->_emoji, a3);
  emojiLabel = self->_emojiLabel;
  -[UIKeyboardEmoji emojiString](self->_emoji, "emojiString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiDraggableView setText:](emojiLabel, "setText:", v6);

  if (_os_feature_enabled_impl())
    v7 = -[UIKeyboardEmoji supportsSkinToneVariants](self->_emoji, "supportsSkinToneVariants") ^ 1;
  else
    v7 = 0;
  -[UIKeyboardEmojiDraggableView setDragEnabled:](self->_emojiLabel, "setDragEnabled:", v7);

}

- (void)setEmojiFontSize:(int64_t)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_1_14 != a3 || qword_1ECD79E80 == 0)
  {
    v6 = *MEMORY[0x1E0CA81D0];
    v10[0] = *(_QWORD *)off_1E167DBF0;
    v10[1] = v6;
    v11[0] = CFSTR("AppleColorEmoji");
    v11[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v8, (double)a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&qword_1ECD79E80, v9);
    _MergedGlobals_1_14 = a3;

  }
  else
  {
    v9 = qword_1ECD79E80;
  }
  -[UIKeyboardEmojiDraggableView setFont:](self->_emojiLabel, "setFont:", v9);

}

- (int64_t)emojiFontSize
{
  void *v2;
  double v3;
  int64_t v4;

  -[UIKeyboardEmojiDraggableView font](self->_emojiLabel, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = (uint64_t)v3;

  return v4;
}

- (void)setUnreleasedHighlight:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *v23;
  UILabel *unreleasedBanner;
  void *v25;
  void *v26;
  __int128 v27;
  UILabel *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      -[UIKeyboardEmojiCollectionViewCell unreleasedBanner](self, "unreleasedBanner");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v22 = [UILabel alloc];
        -[UIView bounds](self, "bounds");
        v23 = -[UILabel initWithFrame:](v22, "initWithFrame:");
        unreleasedBanner = self->_unreleasedBanner;
        self->_unreleasedBanner = v23;

        -[UILabel setText:](self->_unreleasedBanner, "setText:", CFSTR("PRERELEASE"));
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](self->_unreleasedBanner, "setTextColor:", v25);

        objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 6.0, *(double *)off_1E167DC50);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_unreleasedBanner, "setFont:", v26);

        -[UILabel setAdjustsFontSizeToFitWidth:](self->_unreleasedBanner, "setAdjustsFontSizeToFitWidth:", 1);
        -[UILabel setMinimumScaleFactor:](self->_unreleasedBanner, "setMinimumScaleFactor:", 0.5);
        v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v39.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v39.c = v27;
        *(_OWORD *)&v39.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        CGAffineTransformRotate(&v40, &v39, -0.785398163);
        v28 = self->_unreleasedBanner;
        v38 = v40;
        -[UIView setTransform:](v28, "setTransform:", &v38);
        -[UICollectionViewCell contentView](self, "contentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addSubview:", self->_unreleasedBanner);

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_unreleasedBanner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v30 = (void *)MEMORY[0x1E0D156E0];
        -[UIView centerXAnchor](self, "centerXAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_unreleasedBanner, "centerXAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v33;
        -[UIView centerYAnchor](self, "centerYAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_unreleasedBanner, "centerYAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "activateConstraints:", v37);

      }
    }
    -[UIKeyboardEmojiCollectionViewCell unreleasedBanner](self, "unreleasedBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowOffset:", 3.0, 0.0);

    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowRadius:", 3.0);

    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v8);

    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LODWORD(v12) = 0.5;
  }
  else
  {
    -[UIKeyboardEmojiCollectionViewCell unreleasedBanner](self, "unreleasedBanner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowOffset:", v14, v15);

    -[UIView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShadowRadius:", 0.0);

    +[UIColor clearColor](UIColor, "clearColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    -[UIView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowColor:", v19);

    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LODWORD(v12) = 1.0;
  }
  objc_msgSend(v10, "setShadowOpacity:", v12);

  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setNoResultsCell:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *v5;
  UILabel *noResultsLabel;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v3 = a3;
  v24[4] = *MEMORY[0x1E0C80C00];
  if (self->_noResultsCell != a3)
  {
    self->_noResultsCell = a3;
    if (a3 && !self->_noResultsLabel)
    {
      v5 = objc_alloc_init(UILabel);
      noResultsLabel = self->_noResultsLabel;
      self->_noResultsLabel = v5;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_noResultsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      _UILocalizedStringInSystemLanguage(CFSTR("No Results"), CFSTR("No Results"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_noResultsLabel, "setText:", v7);

      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleTitle3"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_noResultsLabel, "setFont:", v8);

      -[UILabel setTextAlignment:](self->_noResultsLabel, "setTextAlignment:", 1);
      +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_341);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_noResultsLabel, "setTextColor:", v9);

      -[UIView addSubview:](self, "addSubview:", self->_noResultsLabel);
      v18 = (void *)MEMORY[0x1E0D156E0];
      -[UIView topAnchor](self->_noResultsLabel, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      -[UIView leadingAnchor](self->_noResultsLabel, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v17;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_noResultsLabel, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v12;
      -[UIView trailingAnchor](self, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_noResultsLabel, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v16);

    }
  }
  -[UIView setHidden:](self->_noResultsLabel, "setHidden:", !v3);
}

id __54__UIKeyboardEmojiCollectionViewCell_setNoResultsCell___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.518, 0.553, 0.6, 1.0);
  else
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  _QWORD v33[5];

  v3 = a3;
  v33[4] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = objc_alloc_init(UIView);
    -[UIKeyboardEmojiCollectionViewCell setNavigationHighlightView:](self, "setNavigationHighlightView:", v8);

    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UICollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v32 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:below:", v11, self->_emojiLabel);

    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 5.0);

    v24 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](self, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, self->_highlightPadding);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, self->_highlightPadding);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v23;
    -[UIView topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, self->_highlightPadding);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v17;
    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, self->_highlightPadding);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

    if (v32)
      goto LABEL_3;
LABEL_5:
    -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", 0);
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

LABEL_6:
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardEmojiCollectionViewCell;
  -[UIView debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiCollectionViewCell emoji](self, "emoji");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emojiString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("emojiString = %@"), v5);

  return v3;
}

- (UILabel)unreleasedBanner
{
  return self->_unreleasedBanner;
}

- (void)setUnreleasedBanner:(id)a3
{
  objc_storeStrong((id *)&self->_unreleasedBanner, a3);
}

- (UIKeyboardEmoji)emoji
{
  return self->_emoji;
}

- (double)highlightPadding
{
  return self->_highlightPadding;
}

- (void)setHighlightPadding:(double)a3
{
  self->_highlightPadding = a3;
}

- (UIKeyboardEmojiDraggableView)emojiLabel
{
  return self->_emojiLabel;
}

- (BOOL)unreleasedHighlight
{
  return self->_unreleasedHighlight;
}

- (BOOL)noResultsCell
{
  return self->_noResultsCell;
}

- (UIView)navigationHighlightView
{
  return self->_navigationHighlightView;
}

- (void)setNavigationHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationHighlightView, a3);
}

- (UILabel)noResultsLabel
{
  return self->_noResultsLabel;
}

- (void)setNoResultsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noResultsLabel, a3);
}

- (BOOL)cellBeingTouched
{
  return self->_cellBeingTouched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
  objc_storeStrong((id *)&self->_navigationHighlightView, 0);
  objc_storeStrong((id *)&self->_emojiLabel, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_unreleasedBanner, 0);
}

@end
