@implementation _UIKeyboardPopoverAffordance

- (_UIKeyboardPopoverAffordance)initWithFrame:(CGRect)a3
{
  _UIKeyboardPopoverAffordance *v3;
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *pillView;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIView *v23;
  double v24;
  void *v25;
  UIView *v26;
  UIView *dragArea;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_UIKeyboardPopoverAffordance;
  v3 = -[UIView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    pillView = v3->_pillView;
    v3->_pillView = (UIView *)v9;

    -[UIView setUserInteractionEnabled:](v3->_pillView, "setUserInteractionEnabled:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_pillView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIKeyboardPopoverContainer pillColor](UIKeyboardPopoverContainer, "pillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_pillView, "setBackgroundColor:", v11);

    +[UIKeyboardPopoverContainer pillCornerRadius](UIKeyboardPopoverContainer, "pillCornerRadius");
    v13 = v12;
    -[UIView layer](v3->_pillView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", v13);

    +[UIKeyboardPopoverContainer pillSize](UIKeyboardPopoverContainer, "pillSize");
    v16 = v15;
    v18 = v17;
    -[UIView addSubview:](v3, "addSubview:", v3->_pillView);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_pillView, 7, 0, 0, 0, 1.0, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v19);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_pillView, 8, 0, 0, 0, 1.0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v20);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_pillView, 9, 0, v3, 9, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v21);

    v22 = (void *)MEMORY[0x1E0D156E0];
    v23 = v3->_pillView;
    +[UIKeyboardPopoverContainer pillDistanceToEdge](UIKeyboardPopoverContainer, "pillDistanceToEdge");
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 4, 0, v3, 4, 1.0, -v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v25);

    v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    dragArea = v3->_dragArea;
    v3->_dragArea = v26;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_dragArea, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_dragArea, "setBackgroundColor:", v28);

    -[UIView addSubview:](v3, "addSubview:", v3->_dragArea);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_dragArea, 1, 0, v3, 1, 1.0, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v29);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_dragArea, 2, 0, v3, 2, 1.0, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v30);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_dragArea, 3, 0, v3, 3, 1.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v31);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_dragArea, 4, 0, v3, 4, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v3, "addConstraint:", v32);

    -[UIView setUserInteractionEnabled:](v3->_dragArea, "setUserInteractionEnabled:", 1);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
  }
  return v3;
}

- (void)updateForBackdropStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;

  if (a3 == 3904)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 2)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.5;
    }
    else
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.2, 0.6451);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.8;
    }
    -[UIView setBackgroundColor:](self->_pillView, "setBackgroundColor:", v6);

    -[UIView setAlpha:](self->_pillView, "setAlpha:", v7);
    v11 = (uint64_t *)MEMORY[0x1E0CD2EA0];
    if (v5 != 2)
      v11 = (uint64_t *)MEMORY[0x1E0CD2E98];
    v12 = *v11;
    -[UIView layer](self->_pillView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v10 = v12;
  }
  else
  {
    +[UIKeyboardPopoverContainer pillColor](UIKeyboardPopoverContainer, "pillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_pillView, "setBackgroundColor:", v8);

    -[UIView setAlpha:](self->_pillView, "setAlpha:", 1.0);
    -[UIView layer](self->_pillView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v10 = 0;
  }
  objc_msgSend(v9, "setCompositingFilter:", v10);

}

- (UIView)dragArea
{
  return self->_dragArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_dragArea, 0);
}

@end
