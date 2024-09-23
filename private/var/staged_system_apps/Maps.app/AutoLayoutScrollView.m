@implementation AutoLayoutScrollView

- (void)_commonInit
{
  UIView *v3;
  UIView *contentView;

  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  contentView = self->_contentView;
  self->_contentView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AutoLayoutScrollView addSubview:](self, "addSubview:", self->_contentView);
  self->_horizontalCompressionPriority = 250.0;
  self->_verticalCompressionPriority = 250.0;
  -[AutoLayoutScrollView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (AutoLayoutScrollView)init
{
  AutoLayoutScrollView *v2;
  AutoLayoutScrollView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AutoLayoutScrollView;
  v2 = -[AutoLayoutScrollView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[AutoLayoutScrollView _commonInit](v2, "_commonInit");
  return v3;
}

- (AutoLayoutScrollView)initWithFrame:(CGRect)a3
{
  AutoLayoutScrollView *v3;
  AutoLayoutScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AutoLayoutScrollView;
  v3 = -[AutoLayoutScrollView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AutoLayoutScrollView _commonInit](v3, "_commonInit");
  return v4;
}

- (AutoLayoutScrollView)initWithCoder:(id)a3
{
  AutoLayoutScrollView *v3;
  AutoLayoutScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AutoLayoutScrollView;
  v3 = -[AutoLayoutScrollView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[AutoLayoutScrollView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *edgeConstraints;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *minimumWidthConstraint;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *minimumHeightConstraint;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *horizontalCompressionConstraint;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *verticalCompressionConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];

  v34.receiver = self;
  v34.super_class = (Class)AutoLayoutScrollView;
  -[AutoLayoutScrollView updateConstraints](&v34, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!self->_edgeConstraints)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView topAnchor](self, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v35[0] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView leadingAnchor](self, "leadingAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v35[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView trailingAnchor](self, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    v35[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView bottomAnchor](self, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    v35[3] = v10;
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    edgeConstraints = self->_edgeConstraints;
    self->_edgeConstraints = v11;

    objc_msgSend(v3, "addObjectsFromArray:", self->_edgeConstraints);
  }
  if (!self->_minimumWidthConstraint)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_contentView, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView widthAnchor](self, "widthAnchor"));
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14));
    minimumWidthConstraint = self->_minimumWidthConstraint;
    self->_minimumWidthConstraint = v15;

    objc_msgSend(v3, "addObject:", self->_minimumWidthConstraint);
  }
  if (!self->_minimumHeightConstraint)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentView, "heightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView heightAnchor](self, "heightAnchor"));
    v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18));
    minimumHeightConstraint = self->_minimumHeightConstraint;
    self->_minimumHeightConstraint = v19;

    objc_msgSend(v3, "addObject:", self->_minimumHeightConstraint);
  }
  if (!self->_horizontalCompressionConstraint)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_contentView, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView widthAnchor](self, "widthAnchor"));
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    horizontalCompressionConstraint = self->_horizontalCompressionConstraint;
    self->_horizontalCompressionConstraint = v23;

    -[AutoLayoutScrollView contentOverflowCompressionPriorityForAxis:](self, "contentOverflowCompressionPriorityForAxis:", 0);
    -[NSLayoutConstraint setPriority:](self->_horizontalCompressionConstraint, "setPriority:");
    objc_msgSend(v3, "addObject:", self->_horizontalCompressionConstraint);
  }
  if (!self->_verticalCompressionConstraint)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentView, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView widthAnchor](self, "widthAnchor"));
    v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    verticalCompressionConstraint = self->_verticalCompressionConstraint;
    self->_verticalCompressionConstraint = v27;

    -[AutoLayoutScrollView contentOverflowCompressionPriorityForAxis:](self, "contentOverflowCompressionPriorityForAxis:", 1);
    -[NSLayoutConstraint setPriority:](self->_verticalCompressionConstraint, "setPriority:");
    objc_msgSend(v3, "addObject:", self->_verticalCompressionConstraint);
  }
  -[AutoLayoutScrollView _updateConstraintConstants](self, "_updateConstraintConstants");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);

}

- (void)_updateConstraintConstants
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[AutoLayoutScrollView adjustedContentInset](self, "adjustedContentInset");
  v4 = v3;
  v6 = v5;
  v9 = -(v7 + v8);
  -[NSLayoutConstraint setConstant:](self->_minimumWidthConstraint, "setConstant:", v9);
  v10 = -(v4 + v6);
  -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:", v10);
  -[NSLayoutConstraint setConstant:](self->_horizontalCompressionConstraint, "setConstant:", v9);
  -[NSLayoutConstraint setConstant:](self->_verticalCompressionConstraint, "setConstant:", v10);
}

- (void)layoutSubviews
{
  objc_super v3;

  -[AutoLayoutScrollView _updateConstraintConstants](self, "_updateConstraintConstants");
  v3.receiver = self;
  v3.super_class = (Class)AutoLayoutScrollView;
  -[AutoLayoutScrollView layoutSubviews](&v3, "layoutSubviews");
}

- (float)contentOverflowCompressionPriorityForAxis:(int64_t)a3
{
  int *v3;
  float result;

  if (a3)
  {
    if (a3 != 1)
      return result;
    v3 = &OBJC_IVAR___AutoLayoutScrollView__verticalCompressionPriority;
  }
  else
  {
    v3 = &OBJC_IVAR___AutoLayoutScrollView__horizontalCompressionPriority;
  }
  return *(float *)((char *)&self->super.super.super.super.isa + *v3);
}

- (void)setContentOverflowCompressionPriority:(float)a3 forAxis:(int64_t)a4
{
  float v7;
  int *v8;
  uint64_t v9;
  void *v10;

  -[AutoLayoutScrollView contentOverflowCompressionPriorityForAxis:](self, "contentOverflowCompressionPriorityForAxis:");
  if (v7 != a3)
  {
    if (a4)
    {
      if (a4 != 1)
      {
LABEL_8:
        -[AutoLayoutScrollView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
        return;
      }
      v8 = &OBJC_IVAR___AutoLayoutScrollView__verticalCompressionPriority;
    }
    else
    {
      v8 = &OBJC_IVAR___AutoLayoutScrollView__horizontalCompressionPriority;
    }
    *(float *)((char *)&self->super.super.super.super.isa + *v8) = a3;
    v9 = v8[5];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "setActive:", 0);
    v10 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
    *(Class *)((char *)&self->super.super.super.super.isa + v9) = 0;

    goto LABEL_8;
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_verticalCompressionConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalCompressionConstraint, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_edgeConstraints, 0);
}

@end
