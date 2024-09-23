@implementation UIKBSplitImageView

- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor
{
  return 1;
}

- (void)setImage:(id)a3 cachedWidth:(double)a4 keyplane:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v8 = a5;
  objc_msgSend(a3, "_imageThatSuppressesAccessibilityHairlineThickening");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v24;
    if (objc_msgSend(v9, "hasFormatColor"))
    {
      objc_msgSend(v9, "imageWithRenderingMode:", 2);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = v9;
    }
  }
  else
  {
    v9 = 0;
  }
  -[UIView bounds](self, "bounds");
  v11 = v10;
  if (!objc_msgSend(v8, "isSplit") || v11 == a4)
  {
    -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", v24, 0, 0, 0);
    if (v9)
      objc_msgSend(v9, "formatColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_fullView, "setTintColor:", v12);
  }
  else
  {
    v12 = v24;
    objc_msgSend(v8, "frameForKeylayoutName:", CFSTR("split-left"));
    v14 = v13;
    objc_msgSend(v8, "frameForKeylayoutName:", CFSTR("split-right"));
    v16 = v15;
    objc_msgSend(v12, "size");
    if (v17 != a4)
    {
      v16 = v17 - v14 + -3.0;
      -[UIView bounds](self, "bounds");
    }
    objc_msgSend(v12, "_stretchableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "_resizableImageWithSubimageInsets:resizeInsets:", 0.0, 0.0, 0.0, v16 + 3.0, 0.0, 0.0, 0.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_resizableImageWithSubimageInsets:resizeInsets:", 0.0, v14 + 3.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", 0, v18, v19, v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v12;
      objc_msgSend(v20, "formatColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](self->_splitLeft, "setTintColor:", v21);

      objc_msgSend(v20, "formatColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](self->_splitLeft, "setTintColor:", v23);

      +[UIColor whiteColor](UIColor, "whiteColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIView setTintColor:](self->_splitRight, "setTintColor:", v22);

  }
}

- (void)setImage:(id)a3 splitLeft:(id)a4 splitRight:(id)a5 keyplane:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  NSLayoutConstraint *leftWidthConstraint;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *v18;
  double v19;
  double v20;
  NSLayoutConstraint *rightWidthConstraint;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *v24;
  id v25;

  v25 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10 && v11)
  {
    -[UIKBSplitImageView prepareForDisplay:](self, "prepareForDisplay:", 1);
    -[UIImageView setImage:](self->_splitLeft, "setImage:", v10);
    objc_msgSend(v12, "frameForKeylayoutName:", CFSTR("split-left"));
    v14 = v13;
    leftWidthConstraint = self->_leftWidthConstraint;
    if (!leftWidthConstraint)
    {
      -[UIView widthAnchor](self->_splitLeft, "widthAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToConstant:", v14);
      v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v18 = self->_leftWidthConstraint;
      self->_leftWidthConstraint = v17;

      -[NSLayoutConstraint setActive:](self->_leftWidthConstraint, "setActive:", 1);
      leftWidthConstraint = self->_leftWidthConstraint;
    }
    -[NSLayoutConstraint setConstant:](leftWidthConstraint, "setConstant:", v14);
    -[UIImageView setImage:](self->_splitRight, "setImage:", v11);
    objc_msgSend(v12, "frameForKeylayoutName:", CFSTR("split-right"));
    v20 = v19;
    rightWidthConstraint = self->_rightWidthConstraint;
    if (!rightWidthConstraint)
    {
      -[UIView widthAnchor](self->_splitRight, "widthAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToConstant:", v20);
      v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v24 = self->_rightWidthConstraint;
      self->_rightWidthConstraint = v23;

      -[NSLayoutConstraint setActive:](self->_rightWidthConstraint, "setActive:", 1);
      rightWidthConstraint = self->_rightWidthConstraint;
    }
    -[NSLayoutConstraint setConstant:](rightWidthConstraint, "setConstant:", v20);
  }
  else if (v25)
  {
    -[UIKBSplitImageView prepareForDisplay:](self, "prepareForDisplay:", 0);
    -[UIImageView setImage:](self->_fullView, "setImage:", v25);
  }
  else
  {
    -[UIImageView setHidden:](self->_fullView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_splitLeft, "setHidden:", 1);
    -[UIImageView setHidden:](self->_splitRight, "setHidden:", 1);
  }

}

- (void)setFilterType:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", self->_currentFilterType) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentFilterType, a3);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", v5 == 0);

    -[UIView layer](self->_fullView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v5);

    -[UIView layer](self->_splitLeft, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v5);

    -[UIView layer](self->_splitRight, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", v5);

  }
}

- (void)prepareForDisplay:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *v5;
  UIImageView *v6;
  UIImageView *splitLeft;
  id *p_splitRight;
  UIImageView *v9;
  uint64_t v10;
  id v11;
  UIImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *splitConstraints;
  int *v20;
  UIImageView *fullView;
  UIImageView *v22;
  UIImageView *v23;
  UIImageView *v24;
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

  v3 = a3;
  if (a3)
  {
    if (!self->_splitLeft)
    {
      v5 = [UIImageView alloc];
      v6 = -[UIImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      splitLeft = self->_splitLeft;
      self->_splitLeft = v6;

      -[UIView setUserInteractionEnabled:](self->_splitLeft, "setUserInteractionEnabled:", 0);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_splitLeft, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_splitLeft, self->_fullView != 0);
    }
    p_splitRight = (id *)&self->_splitRight;
    if (!self->_splitRight)
    {
      v9 = [UIImageView alloc];
      v10 = -[UIImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v11 = *p_splitRight;
      *p_splitRight = (id)v10;

      objc_msgSend(*p_splitRight, "setUserInteractionEnabled:", 0);
      objc_msgSend(*p_splitRight, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", *p_splitRight, self->_splitLeft);
    }
    v12 = self->_splitLeft;
    if (!self->_splitConstraints)
    {
      v30 = (void *)MEMORY[0x1E0C99D20];
      -[UIView topAnchor](v12, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_splitLeft, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_splitRight, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_splitLeft, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_splitRight, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_splitLeft, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](self->_splitLeft, "leftAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](self, "leftAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView rightAnchor](self, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_splitRight, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "arrayWithObjects:", v38, v37, v26, v13, v14, v17, 0);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      splitConstraints = self->_splitConstraints;
      self->_splitConstraints = v18;

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_splitConstraints);
      v12 = self->_splitLeft;
    }
    -[UIImageView setHidden:](v12, "setHidden:", 0);
    v20 = &OBJC_IVAR___UIKBSplitImageView__fullView;
  }
  else
  {
    fullView = self->_fullView;
    if (!fullView)
    {
      v22 = [UIImageView alloc];
      -[UIView bounds](self, "bounds");
      v23 = -[UIImageView initWithFrame:](v22, "initWithFrame:");
      v24 = self->_fullView;
      self->_fullView = v23;

      -[UIView setUserInteractionEnabled:](self->_fullView, "setUserInteractionEnabled:", 0);
      if (!self->_canStretchAsFullWidth)
        -[UIImageView setContentMode:](self->_fullView, "setContentMode:", 5);
      -[UIView setAutoresizingMask:](self->_fullView, "setAutoresizingMask:", 18);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_fullView, 0);
      fullView = self->_fullView;
    }
    -[UIImageView setHidden:](fullView, "setHidden:", 0);
    v20 = &OBJC_IVAR___UIKBSplitImageView__splitRight;
    p_splitRight = (id *)&self->_splitLeft;
  }
  objc_msgSend(*p_splitRight, "setHidden:", !v3);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v20), "setHidden:", 1);
}

- (UIKBSplitImageView)initWithFrame:(CGRect)a3 canStretchAsFullWidth:(BOOL)a4
{
  UIKBSplitImageView *v5;
  UIKBSplitImageView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBSplitImageView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_canStretchAsFullWidth = a4;
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  }
  return v6;
}

- (void)insertSubviewAtBottom:(id)a3
{
  if (self->_splitRight)
    -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", a3);
  else
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", a3);
}

- (void)addExtraFilters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13
    || (-[UIView layer](self, "layer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "filters"),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5 == v13))
  {
    v11 = self->_currentFilterType == 0;
    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupBlending:", v11);

    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 1);

    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 1);

    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v13;
  }
  objc_msgSend(v8, "setFilters:", v10);

}

- (void)setContentsMultiplyColor:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!-[UIView isHidden](self->_splitLeft, "isHidden"))
    -[UIView setTintColor:](self->_splitLeft, "setTintColor:", v4);
  if (!-[UIView isHidden](self->_splitRight, "isHidden"))
    -[UIView setTintColor:](self->_splitRight, "setTintColor:", v4);
  if (!-[UIView isHidden](self->_fullView, "isHidden"))
    -[UIView setTintColor:](self->_fullView, "setTintColor:", v4);

}

- (void)clearImages
{
  -[UIImageView setImage:](self->_fullView, "setImage:", 0);
  -[UIImageView setImage:](self->_splitLeft, "setImage:", 0);
  -[UIImageView setImage:](self->_splitRight, "setImage:", 0);
}

- (NSString)filterType
{
  return self->_currentFilterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leftWidthConstraint, 0);
  objc_storeStrong((id *)&self->_splitConstraints, 0);
  objc_storeStrong((id *)&self->_currentFilterType, 0);
  objc_storeStrong((id *)&self->_splitRight, 0);
  objc_storeStrong((id *)&self->_splitLeft, 0);
  objc_storeStrong((id *)&self->_fullView, 0);
}

@end
