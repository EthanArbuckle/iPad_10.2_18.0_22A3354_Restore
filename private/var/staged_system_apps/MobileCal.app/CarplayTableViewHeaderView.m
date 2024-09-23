@implementation CarplayTableViewHeaderView

+ (double)height
{
  double result;

  +[CarplayTableViewHeaderContentView height](CarplayTableViewHeaderContentView, "height");
  return result;
}

- (void)setHeaderText:(id)a3
{
  NSString **p_headerText;
  id v6;
  NSString *v7;
  id v8;

  p_headerText = &self->_headerText;
  objc_storeStrong((id *)&self->_headerText, a3);
  v6 = a3;
  v7 = *p_headerText;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView label](self->_contentView, "label"));
  objc_msgSend(v8, "setText:", v7);

}

- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3
{
  self->_anyCalendarsHiddenByFocus = a3;
  -[CarplayTableViewHeaderContentView setAnyCalendarsHiddenByFocus:](self->_contentView, "setAnyCalendarsHiddenByFocus:");
}

- (void)setFloating:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  _BOOL8 v22;
  void *v23;
  _BOOL8 v24;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)CarplayTableViewHeaderView;
  -[CarplayTableViewHeaderView setFloating:](&v25, "setFloating:");
  -[CarplayTableViewHeaderView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView superview](self, "superview"));
  -[CarplayTableViewHeaderView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  if (a3)
  {
    v22 = 1;
  }
  else
  {
    v26.origin.x = v15;
    v26.origin.y = v17;
    v26.size.width = v19;
    v26.size.height = v21;
    v22 = CGRectGetMinY(v26) == 0.0;
  }
  self->_headerFloatingOrAtTop = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView separator](self->_contentView, "separator"));
  objc_msgSend(v23, "setHidden:", v22);

  v24 = self->_anyCalendarsHiddenByFocus && self->_headerFloatingOrAtTop;
  -[CarplayTableViewHeaderContentView setAnyCalendarsHiddenByFocus:](self->_contentView, "setAnyCalendarsHiddenByFocus:", v24);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double Width;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  objc_super v32;
  CGRect v33;

  v32.receiver = self;
  v32.super_class = (Class)CarplayTableViewHeaderView;
  -[CarplayTableViewHeaderView layoutSubviews](&v32, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView tableView](self, "tableView"));
  objc_msgSend(v18, "bounds");
  Width = CGRectGetWidth(v33);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView backgroundView](self, "backgroundView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView tableView](self, "tableView"));
  objc_msgSend(v21, "convertRect:fromView:", v22, 0.0, v15, Width, v17);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

}

- (CarplayTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  CarplayTableViewHeaderView *v3;
  CarplayTableViewHeaderContentView *v4;
  CarplayTableViewHeaderContentView *contentView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v13.receiver = self;
  v13.super_class = (Class)CarplayTableViewHeaderView;
  v3 = -[CarplayTableViewHeaderView initWithReuseIdentifier:](&v13, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = objc_opt_new(CarplayTableViewHeaderContentView);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    -[CarplayTableViewHeaderContentView setAutoresizingMask:](v3->_contentView, "setAutoresizingMask:", 18);
    -[CarplayTableViewHeaderView addSubview:](v3, "addSubview:", v3->_contentView);
    v6 = objc_alloc_init((Class)UIVisualEffectView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.8));
    objc_msgSend(v6, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0));
    v14[0] = v9;
    v14[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    objc_msgSend(v6, "setBackgroundEffects:", v11);

    -[CarplayTableViewHeaderView setBackgroundView:](v3, "setBackgroundView:", v6);
  }
  return v3;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (BOOL)anyCalendarsHiddenByFocus
{
  return self->_anyCalendarsHiddenByFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
