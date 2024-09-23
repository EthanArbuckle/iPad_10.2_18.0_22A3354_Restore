@implementation TTRIUIDividedGridViewTableViewCell

- (TTRIUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 cellBackgroundColor:(id)a7
{
  id v12;
  id v13;
  TTRIUIDividedGridViewTableViewCell *v14;
  TTRIDividedGridViewController *v15;
  TTRIDividedGridViewController *gridViewController;
  objc_super v18;

  v12 = a6;
  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TTRIUIDividedGridViewTableViewCell;
  v14 = -[TTRIUIDividedGridViewTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v14)
  {
    v15 = -[TTRIDividedGridViewController initWithType:buttonTitles:cellBackgroundColor:]([TTRIDividedGridViewController alloc], "initWithType:buttonTitles:cellBackgroundColor:", a5, v12, v13);
    gridViewController = v14->_gridViewController;
    v14->_gridViewController = v15;

    -[TTRIUIDividedGridViewTableViewCell commonInit](v14, "commonInit");
  }

  return v14;
}

- (TTRIUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 buttonAccessibilityLabels:(id)a7 cellBackgroundColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  TTRIUIDividedGridViewTableViewCell *v17;
  TTRIDividedGridViewController *v18;
  TTRIDividedGridViewController *gridViewController;
  objc_super v21;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)TTRIUIDividedGridViewTableViewCell;
  v17 = -[TTRIUIDividedGridViewTableViewCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v17)
  {
    v18 = -[TTRIDividedGridViewController initWithType:buttonTitles:buttonAccessibilityLabels:cellBackgroundColor:]([TTRIDividedGridViewController alloc], "initWithType:buttonTitles:buttonAccessibilityLabels:cellBackgroundColor:", a5, v14, v15, v16);
    gridViewController = v17->_gridViewController;
    v17->_gridViewController = v18;

    -[TTRIUIDividedGridViewTableViewCell commonInit](v17, "commonInit");
  }

  return v17;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  -[TTRIDividedGridViewController view](self->_gridViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TTRIUIDividedGridViewTableViewCell addSubview:](self, "addSubview:", v3);
  -[TTRIUIDividedGridViewTableViewCell safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell addConstraint:](self, "addConstraint:", v7);

  -[TTRIUIDividedGridViewTableViewCell safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v11;
  LODWORD(v12) = 1148829696;
  objc_msgSend(v11, "setPriority:", v12);
  -[TTRIUIDividedGridViewTableViewCell addConstraint:](self, "addConstraint:", v11);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 7, -1, 0, 0, 1.0, 100000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell addConstraint:](self, "addConstraint:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 1, v3, 8, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1148829696;
  objc_msgSend(v14, "setPriority:", v15);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 3, 0, v3, 3, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v14;
  v39[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell addConstraints:](self, "addConstraints:", v16);

  v17 = (void *)objc_opt_new();
  +[TTRIDividedGridViewController dividerColor](TTRIDividedGridViewController, "dividerColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TTRIUIDividedGridViewTableViewCell addSubview:](self, "addSubview:", v17);
  v19 = (void *)objc_opt_new();
  +[TTRIDividedGridViewController dividerColor](TTRIDividedGridViewController, "dividerColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TTRIUIDividedGridViewTableViewCell addSubview:](self, "addSubview:", v19);
  v37[0] = CFSTR("height");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");
  objc_msgSend(v21, "numberWithDouble:", 1.0 / v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = CFSTR("negativeHeight");
  v38[0] = v24;
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scale");
  objc_msgSend(v25, "numberWithDouble:", -1.0 / v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  _NSDictionaryOfVariableBindings(CFSTR("topDivider, bottomDivider, gridView"), v17, v19, v3, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[topDivider]|"), 0, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell addConstraints:](self, "addConstraints:", v31);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[bottomDivider]|"), 0, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell addConstraints:](self, "addConstraints:", v32);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[topDivider(==height)]-(negativeHeight)-[gridView]-(negativeHeight)-[bottomDivider(==height)]"), 0, v29, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell addConstraints:](self, "addConstraints:", v33);

  -[TTRIUIDividedGridViewTableViewCell setTopDivider:](self, "setTopDivider:", v17);
  -[TTRIUIDividedGridViewTableViewCell setBottomDivider:](self, "setBottomDivider:", v19);
  -[TTRIUIDividedGridViewTableViewCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIUIDividedGridViewTableViewCell sendSubviewToBack:](self, "sendSubviewToBack:", v34);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  _BOOL8 v8;
  void *v9;
  void *v10;
  double v11;
  CGRect v12;

  -[TTRIUIDividedGridViewTableViewCell safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  -[TTRIUIDividedGridViewTableViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v12);
  v8 = -[TTRIUIDividedGridViewTableViewCell _isWiderThanMaximum](self, "_isWiderThanMaximum");
  -[TTRIUIDividedGridViewTableViewCell gridViewController](self, "gridViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = 100000.0;
  else
    v11 = Width - v4 - v6;
  objc_msgSend(v9, "setPreferredWidth:", v11);

  -[TTRIUIDividedGridViewTableViewCell setDrawBottomDivider:](self, "setDrawBottomDivider:", v8);
}

- (BOOL)_isWiderThanMaximum
{
  CGRect v3;

  -[TTRIUIDividedGridViewTableViewCell bounds](self, "bounds");
  return CGRectGetWidth(v3) > 100000.0;
}

- (BOOL)drawBottomDivider
{
  void *v2;
  char v3;

  -[TTRIUIDividedGridViewTableViewCell bottomDivider](self, "bottomDivider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setDrawBottomDivider:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[TTRIUIDividedGridViewTableViewCell bottomDivider](self, "bottomDivider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)drawsTopDivider
{
  void *v2;
  char v3;

  -[TTRIUIDividedGridViewTableViewCell topDivider](self, "topDivider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setDrawsTopDivider:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[TTRIUIDividedGridViewTableViewCell topDivider](self, "topDivider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (CGRect)_separatorFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (TTRIDividedGridViewController)gridViewController
{
  return (TTRIDividedGridViewController *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setGridViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UIView)topDivider
{
  return self->_topDivider;
}

- (void)setTopDivider:(id)a3
{
  objc_storeStrong((id *)&self->_topDivider, a3);
}

- (UIView)bottomDivider
{
  return self->_bottomDivider;
}

- (void)setBottomDivider:(id)a3
{
  objc_storeStrong((id *)&self->_bottomDivider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomDivider, 0);
  objc_storeStrong((id *)&self->_topDivider, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);
}

@end
