@implementation TUIKBKeyView

- (TUIKBKeyView)initWithKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  TUIKBKeyView *v8;
  uint64_t v9;
  UIKBTree *representedKey;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  objc_super v27;

  v5 = a3;
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingTree");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)TUIKBKeyView;
  v8 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v27, sel_initWithFrame_keyplane_key_, v6, v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  if (v8)
  {
    v8->_keyStyle = objc_msgSend(v5, "style");
    objc_storeStrong((id *)&v8->_backingKey, a3);
    if (objc_msgSend(v5, "style") == -1)
      v8->_keyStyle = 2;
    objc_msgSend(v5, "backingTree");
    v9 = objc_claimAutoreleasedReturnValue();
    representedKey = v8->_representedKey;
    v8->_representedKey = (UIKBTree *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "backingTree");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_key"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v14);

    if (objc_msgSend(v5, "layoutType") == 3)
    {
      v8->_layoutType = 3;
      if (objc_msgSend(v5, "layoutShape") == 2)
        v15 = objc_msgSend(v5, "layoutShape");
      else
        v15 = 0;
      v8->_layoutShape = v15;
      objc_msgSend(v5, "multiplier");
      if (v21 > 0.0)
      {
LABEL_23:
        objc_msgSend(v5, "multiplier");
        v8->_multiplier = v25;
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "layoutType") != 4)
    {
      if (objc_msgSend(v5, "layoutShape") == -1)
        v22 = 0;
      else
        v22 = objc_msgSend(v5, "layoutShape");
      v8->_layoutShape = v22;
      if (objc_msgSend(v5, "layoutType") == -1)
        v23 = 2;
      else
        v23 = objc_msgSend(v5, "layoutType");
      v8->_layoutType = v23;
      objc_msgSend(v5, "multiplier");
      if (v24 > 0.0 || !objc_msgSend(v5, "layoutType"))
        goto LABEL_23;
LABEL_22:
      v8->_multiplier = 1.0;
      goto LABEL_24;
    }
    v8->_layoutType = 4;
    objc_msgSend(v5, "multiplier");
    v17 = v16;
    v18 = 1.0;
    if (v17 > 0.0)
      objc_msgSend(v5, "multiplier", 1.0);
    v8->_multiplier = v18;
    v8->_layoutShape = 0;
    objc_msgSend(v5, "backingTree");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v20);

  }
LABEL_24:

  return v8;
}

- (id)shapeWhenMergedWithKey:(id)a3 insets:(UIEdgeInsets)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  double rect2;
  double v34;
  double MaxX;
  double v36;
  double MinX;
  double v38;
  double height;
  double width;
  double y;
  double x;
  double v43;
  double v44;
  double v45;
  double top;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  top = a4.top;
  v5 = a3;
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TUIKBKeyView frame](self, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  if (!CGRectIsEmpty(v47))
  {
    v48.origin.x = v15;
    v48.origin.y = v17;
    v48.size.width = v19;
    v48.size.height = v21;
    if (!CGRectIsEmpty(v48))
    {
      v49.origin.x = v7;
      v49.origin.y = v9;
      v49.size.width = v11;
      v49.size.height = v13;
      v57.origin.x = v15;
      v57.origin.y = v17;
      v57.size.width = v19;
      v57.size.height = v21;
      v50 = CGRectUnion(v49, v57);
      y = v50.origin.y;
      x = v50.origin.x;
      height = v50.size.height;
      width = v50.size.width;
      UIRectInset();
      v44 = v51.origin.x;
      v45 = v51.origin.y;
      v43 = v51.size.width;
      v38 = v51.size.height;
      v58.origin.x = v15;
      v58.origin.y = v17;
      v58.size.width = v19;
      v58.size.height = v21;
      if (!CGRectEqualToRect(v51, v58))
      {
        v52.origin.x = v7;
        v52.origin.y = v9;
        v52.size.width = v11;
        v52.size.height = v13;
        MinX = CGRectGetMinX(v52);
        v53.origin.x = v7;
        v53.origin.y = v9;
        v53.size.width = v11;
        v53.size.height = v13;
        MaxX = CGRectGetMaxX(v53);
        v54.origin.x = v15;
        v54.origin.y = v17;
        v54.size.width = v19;
        v54.size.height = v21;
        v36 = CGRectGetMinX(v54);
        v55.origin.x = v15;
        rect2 = v17;
        v55.origin.y = v17;
        v55.size.width = v19;
        v55.size.height = v21;
        v34 = CGRectGetMaxX(v55);
        objc_msgSend(MEMORY[0x1E0DC3918], "shape");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setFrame:", x, y, width, height);
        objc_msgSend(v24, "setPaddedFrame:", v44, v45, v43, v38);
        if (vabdd_f64(v36, MinX) >= 5.0 || vabdd_f64(v34, MaxX) >= 5.0)
        {
          v25 = objc_msgSend(v5, "rowNumber", *(_QWORD *)&v17);
          if (v25 < -[TUIKBKeyView rowNumber](self, "rowNumber"))
          {
            v26 = v36 - MinX;
            if (v36 - MinX <= 5.0)
            {
              v29 = 8;
              v30 = 0.0;
              v31 = 2;
              if (v34 - MaxX < -5.0)
                v30 = -(v34 - MaxX);
              else
                v31 = 0;
              if (v34 - MaxX > 5.0)
              {
                v32 = v34 - MaxX;
              }
              else
              {
                v29 = v31;
                v32 = v30;
              }
              if (v26 < -5.0)
                v27 = 1;
              else
                v27 = v29;
              if (v26 < -5.0)
                v26 = -v26;
              else
                v26 = v32;
            }
            else
            {
              v27 = 4;
            }
            objc_msgSend(v24, "setConcaveCorner:", v27);
            objc_msgSend(v24, "setConcaveCornerOffset:", v26, top + rect2 - v45);
            goto LABEL_27;
          }
        }
        else
        {
          v56.origin.x = v7;
          v56.origin.y = v9;
          v56.size.width = v11;
          v56.size.height = v13;
          v59.origin.x = v15;
          v59.origin.y = v17;
          v59.size.width = v19;
          v59.size.height = v21;
          if (!CGRectEqualToRect(v56, v59))
          {
LABEL_27:
            v28 = v24;
            goto LABEL_28;
          }
        }
        objc_msgSend(MEMORY[0x1E0DC3918], "shape", *(_QWORD *)&rect2);
        v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v22 = v28;

        goto LABEL_5;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3918], "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v22;
}

- (BOOL)translatesAutoresizingMaskIntoConstraints
{
  return 0;
}

- (int64_t)contentMode
{
  return 3;
}

- (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  -[TUIKBKeyView contentViewConstraints](self, "contentViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[TUIKBKeyView addContentView](self, "addContentView");
  v4.receiver = self;
  v4.super_class = (Class)TUIKBKeyView;
  -[TUIKBKeyView updateConstraints](&v4, sel_updateConstraints);
}

- (void)addContentView
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
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
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  -[UIKBContainerKeyView contentsKeyView](self, "contentsKeyView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TUIKBKeyView subviews](self, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) == 0)
    -[TUIKBKeyView addSubview:](self, "addSubview:", v3);
  -[TUIKBKeyView contentViewConstraints](self, "contentViewConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v3, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView topAnchor](self, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    objc_msgSend(v3, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView leadingAnchor](self, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v7;
    -[TUIKBKeyView bottomAnchor](self, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v10;
    -[TUIKBKeyView trailingAnchor](self, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView setContentViewConstraints:](self, "setContentViewConstraints:", v14);

  }
  -[TUIKBKeyView contentViewConstraints](self, "contentViewConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isActive");

  if ((v17 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKBKeyView contentViewConstraints](self, "contentViewConstraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v19);

  }
}

- (BOOL)isDynamicKey
{
  return 1;
}

- (void)updateStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_keyStyle != a3)
  {
    self->_keyStyle = a3;
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TUIKBKeyView splitFactoryForKeyStyle:](self, "splitFactoryForKeyStyle:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKBKeyView representedKey](self, "representedKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKBKeyView backingKey](self, "backingKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyplane");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "traitsForKey:onKeyplane:", v7, v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      -[TUIKBKeyView splitFactoryForKeyStyle:](self, "splitFactoryForKeyStyle:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKBKeyView representedKey](self, "representedKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayContentsForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIKBKeyView liveContentView](self, "liveContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateKeyStyle:", a3);

      -[TUIKBKeyView liveContentView](self, "liveContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateRenderTraits:displayContents:", v15, v12);

    }
    else
    {
      -[UIKBContainerKeyView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
}

- (void)dimKeyUsingOpacities:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)TUIKBKeyView;
    -[UIKBContainerKeyView dimContentKeyView:](&v5, sel_dimContentKeyView_, v4);
  }

}

- (void)updateStateFrom:(int)a3 to:(int)a4
{
  -[TUIKBKeyView _startStateTransitionAnimationsFrom:to:](self, "_startStateTransitionAnimationsFrom:to:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  -[UIKBContainerKeyView setNeedsDisplay](self, "setNeedsDisplay");
  -[UIKBContainerKeyView prepareForDisplay](self, "prepareForDisplay");
}

- (void)updateLabelWeight:(int64_t)a3
{
  void *v5;
  id v6;

  -[TUIKBKeyView liveContentView](self, "liveContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateLabelWeight:", a3);

  }
}

- (void)_startStateTransitionAnimationsFrom:(int)a3 to:(int)a4
{
  char v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a4;
  -[UIKBContainerKeyView renderConfig](self, "renderConfig", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "animatedBackground");

  if (v7)
  {
    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v4 & 4) != 0)
    {

      if (!v9)
        -[TUIKBKeyView addActiveKeyCapView](self, "addActiveKeyCapView");
    }
    else
    {
      objc_msgSend(v8, "removeFromSuperview");

      -[TUIKBKeyView setActiveKeyCap:](self, "setActiveKeyCap:", 0);
    }
  }
}

- (void)addActiveKeyCapView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  id v24;

  -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC38E8]);
    -[TUIKBKeyView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIKBContainerKeyView keyplane](self, "keyplane");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView key](self, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v4, "initWithFrame:keyplane:key:", v13, v14, v6, v8, v10, v12);
    -[TUIKBKeyView setActiveKeyCap:](self, "setActiveKeyCap:", v15);

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView addSubview:](self, "addSubview:", v16);

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBContainerKeyView factory](self, "factory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFactory:", v18);

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBContainerKeyView renderConfig](self, "renderConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRenderConfig:", v20);

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBContainerKeyView drawFrame](self, "drawFrame");
    objc_msgSend(v21, "setDrawFrame:");

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "changeBackgroundToActiveIfNecessary");

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNeedsDisplay");

    -[TUIKBKeyView activeKeyCap](self, "activeKeyCap");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "prepareForDisplay");

  }
}

- (UIKBRenderFactory)splitFactory
{
  UIKBRenderFactory *splitFactory;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UIKBRenderFactory *v9;
  UIKBRenderFactory *v10;
  void *v11;
  void *v12;

  splitFactory = self->_splitFactory;
  if (!splitFactory)
  {
    -[UIKBContainerKeyView keyplane](self, "keyplane");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visualStyling");

    v6 = (void *)MEMORY[0x1E0DC3900];
    -[UIKBContainerKeyView factory](self, "factory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "factoryForVisualStyle:renderingContext:", v5 | 0x80, v8);
    v9 = (UIKBRenderFactory *)objc_claimAutoreleasedReturnValue();
    v10 = self->_splitFactory;
    self->_splitFactory = v9;

    -[UIKBContainerKeyView factory](self, "factory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    -[UIKBRenderFactory setScale:](self->_splitFactory, "setScale:");

    -[UIKBContainerKeyView factory](self, "factory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stretchFactor");
    -[UIKBRenderFactory setStretchFactor:](self->_splitFactory, "setStretchFactor:");

    splitFactory = self->_splitFactory;
  }
  return splitFactory;
}

- (UIKBRenderFactory)unsplitFactory
{
  UIKBRenderFactory *unsplitFactory;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UIKBRenderFactory *v9;
  UIKBRenderFactory *v10;
  void *v11;
  void *v12;
  void *v13;

  unsplitFactory = self->_unsplitFactory;
  if (!unsplitFactory)
  {
    -[UIKBContainerKeyView keyplane](self, "keyplane");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visualStyling");

    v6 = (void *)MEMORY[0x1E0DC3900];
    -[UIKBContainerKeyView factory](self, "factory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "factoryForVisualStyle:renderingContext:", v5 & 0xFFFFFFFFFFFFFF3FLL | 0x40, v8);
    v9 = (UIKBRenderFactory *)objc_claimAutoreleasedReturnValue();
    v10 = self->_unsplitFactory;
    self->_unsplitFactory = v9;

    -[UIKBContainerKeyView factory](self, "factory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    -[UIKBRenderFactory setScale:](self->_unsplitFactory, "setScale:");

    -[UIKBContainerKeyView factory](self, "factory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stretchFactor");
    -[UIKBRenderFactory setStretchFactor:](self->_unsplitFactory, "setStretchFactor:");

    -[UIKBContainerKeyView factory](self, "factory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory setDynamicFactory:](self->_unsplitFactory, "setDynamicFactory:", objc_msgSend(v13, "dynamicFactory"));

    unsplitFactory = self->_unsplitFactory;
  }
  return unsplitFactory;
}

- (id)splitFactoryForKeyStyle:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[TUIKBKeyView unsplitFactory](self, "unsplitFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
      -[TUIKBKeyView splitFactory](self, "splitFactory");
    else
      -[UIKBContainerKeyView factory](self, "factory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)prepareForTransition
{
  void *v3;
  UIKBRenderFactory *unsplitFactory;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TUILiveKeyView *v14;
  void *v15;
  TUILiveKeyView *v16;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  -[UIKBContainerKeyView contentsKeyView](self, "contentsKeyView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  unsplitFactory = self->_unsplitFactory;
  self->_unsplitFactory = 0;

  -[TUIKBKeyView splitFactoryForKeyStyle:](self, "splitFactoryForKeyStyle:", -[TUIKBKeyView keyStyle](self, "keyStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKBKeyView representedKey](self, "representedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKBKeyView backingKey](self, "backingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyplane");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitsForKey:onKeyplane:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKBKeyView representedKey](self, "representedKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayContentsForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKBKeyView liveContentView](self, "liveContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateRenderTraits:displayContents:", v9, v11);

  }
  else
  {
    v14 = [TUILiveKeyView alloc];
    -[TUIKBKeyView backingKey](self, "backingKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TUILiveKeyView initWithKey:renderTraits:displayContents:](v14, "initWithKey:renderTraits:displayContents:", v15, v9, v11);
    -[TUIKBKeyView setLiveContentView:](self, "setLiveContentView:", v16);

    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView addSubview:](self, "addSubview:", v18);

    v31 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView topAnchor](self, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v35;
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView leadingAnchor](self, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v30;
    -[TUIKBKeyView bottomAnchor](self, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v19;
    -[TUIKBKeyView trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKBKeyView liveContentView](self, "liveContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v25);

    v11 = v23;
  }
  -[TUIKBKeyView liveContentView](self, "liveContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHidden:", 0);

}

- (void)finishTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKBContainerKeyView contentsKeyView](self, "contentsKeyView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[UIKBContainerKeyView contentsKeyView](self, "contentsKeyView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[TUIKBKeyView liveContentView](self, "liveContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[TUIKBKeyView liveContentView](self, "liveContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[TUIKBKeyView setLiveContentView:](self, "setLiveContentView:", 0);
}

- (double)multiplierForDisplayType:(int)a3
{
  double result;
  BOOL v4;
  double v5;
  BOOL v6;

  if (a3 <= 17)
  {
    result = 1.25;
    switch(a3)
    {
      case 0:
        result = 1.5;
        break;
      case 3:
LABEL_10:
        result = dbl_18C80CD90[-[TUIKBKeyView keyStyle](self, "keyStyle") == 1];
        break;
      case 4:
        goto LABEL_11;
      case 5:
        return result;
      case 13:
      case 14:
LABEL_6:
        v6 = -[TUIKBKeyView keyStyle](self, "keyStyle") == 1;
        result = 1.2;
        goto LABEL_12;
      default:
        return 1.0;
    }
  }
  else
  {
    if (a3 <= 50)
    {
      switch(a3)
      {
        case 18:
          goto LABEL_6;
        case 21:
          v4 = -[TUIKBKeyView keyStyle](self, "keyStyle") == 1;
          result = 1.75;
          v5 = 2.0;
          goto LABEL_18;
        case 23:
          v4 = -[TUIKBKeyView keyStyle](self, "keyStyle") == 1;
          result = 1.25;
          v5 = 1.5;
          goto LABEL_18;
        case 26:
          goto LABEL_10;
        default:
          return 1.0;
      }
    }
    if (a3 == 51)
    {
      v4 = -[TUIKBKeyView keyStyle](self, "keyStyle") == 1;
      result = 1.7;
      v5 = 1.0;
LABEL_18:
      if (v4)
        return v5;
    }
    else if (a3 == 52)
    {
LABEL_11:
      v6 = -[TUIKBKeyView keyStyle](self, "keyStyle", result) == 1;
      result = 1.1;
LABEL_12:
      if (!v6)
        return 1.0;
    }
    else
    {
      return 1.0;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  const __CFString *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUIKBKeyView key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKBKeyView frame](self, "frame");
  v8 = v7;
  -[TUIKBKeyView frame](self, "frame");
  v10 = v9;
  -[TUIKBKeyView frame](self, "frame");
  v12 = v11;
  -[TUIKBKeyView frame](self, "frame");
  v14 = v13;
  v15 = -[TUIKBKeyView keyStyle](self, "keyStyle");
  v16 = CFSTR("NO");
  if (v15 == 1)
    v16 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@; frame = (%0.f %0.f; %0.f %0.f); usesSmallKeys = %@>"),
    v4,
    self,
    v6,
    v8,
    v10,
    v12,
    v14,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)rowNumber
{
  return self->_rowNumber;
}

- (void)setRowNumber:(int64_t)a3
{
  self->_rowNumber = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (int64_t)layoutShape
{
  return self->_layoutShape;
}

- (void)setLayoutShape:(int64_t)a3
{
  self->_layoutShape = a3;
}

- (int64_t)keyStyle
{
  return self->_keyStyle;
}

- (void)setKeyStyle:(int64_t)a3
{
  self->_keyStyle = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (TUIKey)backingKey
{
  return self->_backingKey;
}

- (void)setBackingKey:(id)a3
{
  objc_storeStrong((id *)&self->_backingKey, a3);
}

- (UIKBTree)representedKey
{
  return self->_representedKey;
}

- (void)setRepresentedKey:(id)a3
{
  objc_storeStrong((id *)&self->_representedKey, a3);
}

- (UIKBBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (NSArray)contentViewConstraints
{
  return self->_contentViewConstraints;
}

- (void)setContentViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewConstraints, a3);
}

- (void)setSplitFactory:(id)a3
{
  objc_storeStrong((id *)&self->_splitFactory, a3);
}

- (void)setUnsplitFactory:(id)a3
{
  objc_storeStrong((id *)&self->_unsplitFactory, a3);
}

- (UIKBKeyView)activeKeyCap
{
  return self->_activeKeyCap;
}

- (void)setActiveKeyCap:(id)a3
{
  objc_storeStrong((id *)&self->_activeKeyCap, a3);
}

- (TUILiveKeyView)liveContentView
{
  return self->_liveContentView;
}

- (void)setLiveContentView:(id)a3
{
  objc_storeStrong((id *)&self->_liveContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveContentView, 0);
  objc_storeStrong((id *)&self->_activeKeyCap, 0);
  objc_storeStrong((id *)&self->_unsplitFactory, 0);
  objc_storeStrong((id *)&self->_splitFactory, 0);
  objc_storeStrong((id *)&self->_contentViewConstraints, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_representedKey, 0);
  objc_storeStrong((id *)&self->_backingKey, 0);
}

@end
