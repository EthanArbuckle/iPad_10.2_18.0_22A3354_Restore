@implementation UIKeyboardEmojiWellView

- (UIKeyboardEmojiWellView)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiWellView *v3;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardEmojiWellView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIKeyboardEmojiWellView setBackgroundView:](v3, "setBackgroundView:", v5);

    -[UIKeyboardEmojiWellView backgroundView](v3, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    -[UIKeyboardEmojiWellView backgroundView](v3, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 10.0);

    -[UIKeyboardEmojiWellView backgroundView](v3, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v10);

    -[UIKeyboardEmojiWellView fontUsingSilhouette:size:](v3, "fontUsingSilhouette:size:", 0, 32.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiWellView setLabelFont:](v3, "setLabelFont:", v11);

    -[UIKeyboardEmojiWellView setCompositeImageSize:](v3, "setCompositeImageSize:", 34.0, 34.0);
    -[UIKeyboardEmojiWellView setSelected:](v3, "setSelected:", 0);
  }
  return v3;
}

- (void)setWellContentView:(id)a3
{
  UIView *v5;
  UIView *wellContentView;
  UIView *v7;

  v5 = (UIView *)a3;
  wellContentView = self->_wellContentView;
  if (wellContentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](wellContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wellContentView, a3);
    -[UIView addSubview:](self, "addSubview:", self->_wellContentView);
    v5 = v7;
  }

}

- (void)setCompositeImageRepresentation:(id)a3
{
  id v5;
  _UIKBCompositeImageView *v6;
  _UIKBCompositeImageView *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UIImageView *v15;
  UIImageView *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_compositeImageRepresentation, a3);
  v6 = [_UIKBCompositeImageView alloc];
  v7 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = [UIImageView alloc];
        v16 = -[UIImageView initWithImage:](v15, "initWithImage:", v14, (_QWORD)v17);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[_UIKBCompositeImageView setImageViews:](v7, "setImageViews:", v8);
  -[UIKeyboardEmojiWellView compositeImageSize](self, "compositeImageSize");
  -[_UIKBCompositeImageView setImageSize:](v7, "setImageSize:");
  -[UIKeyboardEmojiWellView setWellContentView:](self, "setWellContentView:", v7);

}

- (void)setStringRepresentation:(id)a3
{
  -[UIKeyboardEmojiWellView setStringRepresentation:silhouette:](self, "setStringRepresentation:silhouette:", a3, 0);
}

- (void)setStringRepresentation:(id)a3 silhouette:(unint64_t)a4
{
  id v7;
  UIKeyboardEmojiDraggableView *v8;
  void *v9;
  void *v10;
  UIKeyboardEmojiDraggableView *v11;

  objc_storeStrong((id *)&self->_stringRepresentation, a3);
  v7 = a3;
  v8 = [UIKeyboardEmojiDraggableView alloc];
  v11 = -[UIKeyboardEmojiDraggableView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIKeyboardEmojiWellView labelFont](self, "labelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointSize");
  -[UIKeyboardEmojiWellView fontUsingSilhouette:size:](self, "fontUsingSilhouette:size:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiDraggableView setFont:](v11, "setFont:", v10);

  -[UIKeyboardEmojiDraggableView setText:](v11, "setText:", v7);
  -[UIKeyboardEmojiDraggableView setDragEnabled:](v11, "setDragEnabled:", a4 == 0);
  -[UIKeyboardEmojiDraggableView setDelegate:](v11, "setDelegate:", self);
  -[UIKeyboardEmojiWellView setWellContentView:](self, "setWellContentView:", v11);

}

- (id)fontUsingSilhouette:(unint64_t)a3 size:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v10 = *(_QWORD *)off_1E167DC18;
    v24[0] = *(_QWORD *)off_1E167DC20;
    v24[1] = v10;
    v25[0] = &unk_1E1A98CE8;
    v25[1] = &unk_1E1A98D00;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v26;
LABEL_7:
    objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a3 == 2)
  {
    v13 = *(_QWORD *)off_1E167DC18;
    v21[0] = *(_QWORD *)off_1E167DC20;
    v21[1] = v13;
    v22[0] = &unk_1E1A98CE8;
    v22[1] = &unk_1E1A98D18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v23;
    goto LABEL_7;
  }
  if (a3 != 3)
  {
LABEL_10:
    objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("AppleColorEmoji"), a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    return v17;
  }
  v6 = *(_QWORD *)off_1E167DC18;
  v29[0] = *(_QWORD *)off_1E167DC20;
  v5 = v29[0];
  v29[1] = v6;
  v30[0] = &unk_1E1A98CE8;
  v30[1] = &unk_1E1A98D00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v27[0] = v5;
  v27[1] = v6;
  v28[0] = &unk_1E1A98CE8;
  v28[1] = &unk_1E1A98D18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  if (!v9)
    goto LABEL_10;
  v14 = *(_QWORD *)off_1E167DBF0;
  v19[0] = *(_QWORD *)off_1E167DBE8;
  v19[1] = v14;
  v20[0] = v9;
  v20[1] = CFSTR("AppleColorEmoji");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setUnreleasedHighlight:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
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
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  if (a3 && os_variant_has_internal_diagnostics())
  {
    -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [UILabel alloc];
      -[UIView bounds](self, "bounds");
      v8 = -[UILabel initWithFrame:](v7, "initWithFrame:");
      -[UIKeyboardEmojiWellView setUnreleasedBanner:](self, "setUnreleasedBanner:", v8);

      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", CFSTR("PRERELEASE"));

      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextColor:", v10);

      objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 10.0, *(double *)off_1E167DC50);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v12);

      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMinimumScaleFactor:", 0.5);

      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v16);

      v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v40.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v40.c = v17;
      *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformRotate(&v41, &v40, -0.785398163);
      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v41;
      objc_msgSend(v18, "setTransform:", &v39);

      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v38 = (void *)MEMORY[0x1E0D156E0];
      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "centerXAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v23;
      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self, "centerYAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "activateConstraints:", v28);

    }
    -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHidden:", 0);

    -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v30);

    -[UIView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowOffset:", 3.0, 0.0);

    -[UIView layer](self, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setShadowRadius:", 3.0);

    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.3);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = objc_msgSend(v33, "CGColor");
    -[UIView layer](self, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setShadowColor:", v34);

    -[UIView layer](self, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = 0.5;
    objc_msgSend(v36, "setShadowOpacity:", v37);

  }
  else
  {
    -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIKeyboardEmojiWellView unreleasedBanner](self, "unreleasedBanner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[UIKeyboardEmojiWellView setUnreleasedBanner:](self, "setUnreleasedBanner:", 0);
    }
  }
}

- (void)setSelectionBackgroundColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_selectionBackgroundColor, a3);
  v5 = a3;
  -[UIKeyboardEmojiWellView backgroundView](self, "backgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_selected = a3;
  v3 = !a3;
  -[UIKeyboardEmojiWellView backgroundView](self, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setActiveSelection:(BOOL)a3
{
  void *v5;

  if (a3)
  {
    if (!self->_activeSelection)
    {
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiWellView setSelectionBackgroundColor:](self, "setSelectionBackgroundColor:", v5);

      -[UIKeyboardEmojiWellView setSelected:](self, "setSelected:", 1);
    }
  }
  else
  {
    -[UIKeyboardEmojiWellView setSelected:](self, "setSelected:");
  }
  self->_activeSelection = a3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  void *v40;
  double x;
  double y;
  double width;
  double height;
  void *v45;
  objc_super v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[2];
  CGRect v51;
  CGRect v52;

  v50[1] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)UIKeyboardEmojiWellView;
  -[UIView layoutSubviews](&v46, sel_layoutSubviews);
  -[UIKeyboardEmojiWellView wellContentView](self, "wellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v3;
    objc_msgSend(v12, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)off_1E1678D90;
    v14 = v49;
    objc_msgSend(v12, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeWithAttributes:", v16);
    v5 = v17;
    v7 = v18;

    objc_msgSend(v12, "text");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v47 = v14;
    objc_msgSend(v12, "font");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 8, v21, 0, 1.79769313e308, 1.79769313e308);
    v9 = v22;
    v11 = v23;

LABEL_5:
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v3;
    objc_msgSend(v19, "imageSize");
    v5 = v24;
    v7 = v25;
    objc_msgSend(v19, "imageSize");
    v9 = v26;
    v11 = v27;
    goto LABEL_5;
  }
LABEL_6:
  -[UIView bounds](self, "bounds");
  v30 = v29 + (v28 - v5) * 0.5;
  v33 = v32 + (v31 - v7) * 0.5;
  -[UIView bounds](self, "bounds");
  v36 = v35 + (v34 - v9) * 0.5;
  v39 = v38 + (v37 - v11) * 0.5;
  -[UIKeyboardEmojiWellView wellContentView](self, "wellContentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v30, v33, v5, v7);

  v51.origin.x = v36;
  v51.origin.y = v39;
  v51.size.width = v9;
  v51.size.height = v11;
  v52 = CGRectInset(v51, -4.0, -4.0);
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  -[UIKeyboardEmojiWellView backgroundView](self, "backgroundView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", x, y, width, height);

}

- (void)dragWillBegin:(id)a3
{
  -[UIKeyboardEmojiWellView setSelected:](self, "setSelected:", 0);
}

- (CGSize)compositeImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_compositeImageSize.width;
  height = self->_compositeImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCompositeImageSize:(CGSize)a3
{
  self->_compositeImageSize = a3;
}

- (NSArray)compositeImageRepresentation
{
  return self->_compositeImageRepresentation;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isActiveSelection
{
  return self->_activeSelection;
}

- (UIColor)selectionBackgroundColor
{
  return self->_selectionBackgroundColor;
}

- (NSIndexPath)associatedIndexPath
{
  return self->_associatedIndexPath;
}

- (void)setAssociatedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_associatedIndexPath, a3);
}

- (BOOL)unreleasedHighlight
{
  return self->_unreleasedHighlight;
}

- (UILabel)unreleasedBanner
{
  return self->_unreleasedBanner;
}

- (void)setUnreleasedBanner:(id)a3
{
  objc_storeStrong((id *)&self->_unreleasedBanner, a3);
}

- (UIView)wellContentView
{
  return self->_wellContentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_wellContentView, 0);
  objc_storeStrong((id *)&self->_unreleasedBanner, 0);
  objc_storeStrong((id *)&self->_associatedIndexPath, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_compositeImageRepresentation, 0);
}

@end
