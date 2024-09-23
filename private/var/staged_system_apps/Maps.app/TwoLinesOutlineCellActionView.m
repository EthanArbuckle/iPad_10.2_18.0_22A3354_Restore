@implementation TwoLinesOutlineCellActionView

- (TwoLinesOutlineCellActionView)initWithFrame:(CGRect)a3 twoLinesOutlineCell:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  TwoLinesOutlineCellActionView *v10;
  TwoLinesOutlineCellActionView *v11;
  uint64_t v12;
  UIButton *button1;
  uint64_t v14;
  UIButton *button2;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TwoLinesOutlineCellActionView;
  v10 = -[TwoLinesOutlineCellActionView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_outlineCell, v9);
    v12 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    button1 = v11->_button1;
    v11->_button1 = (UIButton *)v12;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_button1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v11->_button1, "addTarget:action:forControlEvents:", v11, "_buttonTapped:", 64);
    -[TwoLinesOutlineCellActionView addSubview:](v11, "addSubview:", v11->_button1);
    v14 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    button2 = v11->_button2;
    v11->_button2 = (UIButton *)v14;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_button2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v11->_button2, "addTarget:action:forControlEvents:", v11, "_buttonTapped:", 64);
    -[TwoLinesOutlineCellActionView addSubview:](v11, "addSubview:", v11->_button2);
    -[TwoLinesOutlineCellActionView _updateConstraintsWithAxis:](v11, "_updateConstraintsWithAxis:", v11->_axis);
  }

  return v11;
}

- (void)_updateConstraintsWithAxis:(int64_t)a3
{
  NSArray *constraints;
  void *v6;
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
  NSArray *v18;
  NSArray *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  NSArray *v27;
  NSArray *v28;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[8];
  _QWORD v46[7];

  constraints = self->_constraints;
  if (!constraints || self->_axis != a3)
  {
    if (-[NSArray count](constraints, "count"))
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
    self->_axis = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_button1, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView topAnchor](self, "topAnchor"));
    v44 = v6;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v43));
    v42 = (void *)v7;
    if (a3 == 1)
    {
      v46[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_button2, "topAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button1, "bottomAnchor"));
      v41 = v8;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v40, 8.0));
      v46[1] = v39;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button2, "bottomAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView bottomAnchor](self, "bottomAnchor"));
      v38 = v9;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v37));
      v46[2] = v36;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button1, "leadingAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView leadingAnchor](self, "leadingAnchor"));
      v35 = v10;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v34));
      v46[3] = v33;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button1, "trailingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView trailingAnchor](self, "trailingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", -8.0));
      v46[4] = v31;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button2, "leadingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView leadingAnchor](self, "leadingAnchor"));
      v30 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      v46[5] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button2, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView trailingAnchor](self, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -8.0));
      v46[6] = v17;
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 7));
      v19 = self->_constraints;
      self->_constraints = v18;
    }
    else
    {
      v45[0] = v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button1, "bottomAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView bottomAnchor](self, "bottomAnchor"));
      v41 = v20;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v40));
      v45[1] = v39;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_button2, "topAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView topAnchor](self, "topAnchor"));
      v38 = v21;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v37));
      v45[2] = v36;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button2, "bottomAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView bottomAnchor](self, "bottomAnchor"));
      v35 = v22;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v34));
      v45[3] = v33;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button1, "leadingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView leadingAnchor](self, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:"));
      v45[4] = v31;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button2, "leadingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button1, "trailingAnchor"));
      v30 = v23;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v13, 10.0));
      v45[5] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button2, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView trailingAnchor](self, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v16, -8.0));
      v45[6] = v17;
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_button2, "widthAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_button1, "widthAnchor"));
      LODWORD(v25) = 1132134400;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray constraintEqualToAnchor:multiplier:priority:](v19, "constraintEqualToAnchor:multiplier:priority:", v24, 1.0, v25));
      v45[7] = v26;
      v27 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 8));
      v28 = self->_constraints;
      self->_constraints = v27;

      v11 = v29;
    }

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  -[UIButton intrinsicContentSize](self->_button1, "intrinsicContentSize");
  v4 = v3;
  -[UIButton intrinsicContentSize](self->_button2, "intrinsicContentSize");
  v6 = v4 + 10.0 + v5;
  -[TwoLinesOutlineCellActionView bounds](self, "bounds");
  -[TwoLinesOutlineCellActionView _updateConstraintsWithAxis:](self, "_updateConstraintsWithAxis:", v6 > v7);
  v8.receiver = self;
  v8.super_class = (Class)TwoLinesOutlineCellActionView;
  -[TwoLinesOutlineCellActionView layoutSubviews](&v8, "layoutSubviews");
}

- (void)setViewModel:(id)a3
{
  TwoLinesOutlineCellActionModel *v5;
  TwoLinesOutlineCellActionModel *viewModel;
  unsigned __int8 v7;
  TwoLinesOutlineCellActionModel *v8;

  v5 = (TwoLinesOutlineCellActionModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v8 = v5;
    v7 = -[TwoLinesOutlineCellActionModel isEqual:](viewModel, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[TwoLinesOutlineCellActionView _updateFromModel](self, "_updateFromModel");
      v5 = v8;
    }
  }

}

- (void)_updateFromModel
{
  UIButton *button1;
  void *v4;
  UIButton *button2;
  void *v6;

  button1 = self->_button1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionModel buttonTitle1](self->_viewModel, "buttonTitle1"));
  -[UIButton setTitle:forState:](button1, "setTitle:forState:", v4, 0);

  button2 = self->_button2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionModel buttonTitle2](self->_viewModel, "buttonTitle2"));
  -[UIButton setTitle:forState:](button2, "setTitle:forState:", v6, 0);

  -[TwoLinesOutlineCellActionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_buttonTapped:(id)a3
{
  TwoLinesOutlineCellActionModel *viewModel;
  UIButton *v5;
  id WeakRetained;
  _BOOL8 v7;
  id v8;

  viewModel = self->_viewModel;
  v5 = (UIButton *)a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionModel delegate](viewModel, "delegate"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_outlineCell);
  v7 = self->_button1 != v5;

  objc_msgSend(v8, "twoLinesOutlineCell:tappedActionButtonAtIndex:", WeakRetained, v7);
}

- (TwoLinesOutlineCell)outlineCell
{
  return (TwoLinesOutlineCell *)objc_loadWeakRetained((id *)&self->_outlineCell);
}

- (TwoLinesOutlineCellActionModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_outlineCell);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_button2, 0);
  objc_storeStrong((id *)&self->_button1, 0);
}

@end
