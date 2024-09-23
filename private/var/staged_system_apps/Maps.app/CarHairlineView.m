@implementation CarHairlineView

+ (id)hairlineViewAlongAxis:(int64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithAxis:", a3);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)hairlineViewsInView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subviews"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004B34D8;
  v8[3] = &unk_1011B8A70;
  v8[4] = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

  return v6;
}

+ (void)removeHairlineViewsFromView:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(CarHairlineView);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
          objc_msgSend(v8, "removeFromSuperview");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (CarHairlineView)initWithAxis:(int64_t)a3
{
  CarHairlineView *v4;
  CarHairlineView *v5;
  void *v6;
  int64_t axis;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *constraint;

  v4 = -[CarHairlineView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_axis = a3;
    -[CarHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 0.5));
    -[CarHairlineView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    axis = v5->_axis;
    if (axis)
    {
      if (axis != 1)
      {
LABEL_7:
        -[CarHairlineView addConstraint:](v5, "addConstraint:", v5->_constraint);
        return v5;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView widthAnchor](v5, "widthAnchor"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView heightAnchor](v5, "heightAnchor"));
    }
    v9 = v8;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 1.0));
    constraint = v5->_constraint;
    v5->_constraint = (NSLayoutConstraint *)v10;

    goto LABEL_7;
  }
  return v5;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarHairlineView;
  -[CarHairlineView didMoveToWindow](&v8, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView traitCollection](self, "traitCollection"));
    objc_msgSend(v4, "displayScale");
    if (v5 <= 0.0)
    {
      -[NSLayoutConstraint setConstant:](self->_constraint, "setConstant:", 1.0);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView traitCollection](self, "traitCollection"));
      objc_msgSend(v6, "displayScale");
      -[NSLayoutConstraint setConstant:](self->_constraint, "setConstant:", 1.0 / v7);

    }
  }
}

- (CGSize)intrinsicContentSize
{
  CGFloat v2;
  int64_t axis;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  axis = self->_axis;
  if (axis)
  {
    if (axis == 1)
    {
      -[NSLayoutConstraint constant](self->_constraint, "constant");
      v4 = UIViewNoIntrinsicMetric;
      v2 = v5;
    }
    else
    {
      v4 = UIViewNoIntrinsicMetric;
    }
  }
  else
  {
    -[NSLayoutConstraint constant](self->_constraint, "constant");
    v4 = v6;
  }
  v7 = v2;
  result.height = v4;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraint, 0);
}

@end
