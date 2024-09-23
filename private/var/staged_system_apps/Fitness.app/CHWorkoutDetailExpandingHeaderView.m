@implementation CHWorkoutDetailExpandingHeaderView

+ (double)preferredHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleCallout));
  objc_msgSend(v2, "_scaledValueForValue:", 25.0);
  v4 = v3 + 14.0;

  return v4;
}

- (CHWorkoutDetailExpandingHeaderView)initWithFrame:(CGRect)a3
{
  CHWorkoutDetailExpandingHeaderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailExpandingHeaderView;
  v3 = -[CHWorkoutDetailExpandingHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[CHWorkoutDetailExpandingHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CHWorkoutDetailExpandingHeaderView _createContentView](v3, "_createContentView");
    -[CHWorkoutDetailExpandingHeaderView _createTitleLabel](v3, "_createTitleLabel");
    -[CHWorkoutDetailExpandingHeaderView _createExpandButton](v3, "_createExpandButton");
    -[CHWorkoutDetailExpandingHeaderView _createSeparator](v3, "_createSeparator");
  }
  return v3;
}

- (void)_createContentView
{
  id v3;
  UIView *v4;
  UIView *contentView;
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
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v3 = objc_alloc((Class)UIView);
  -[CHWorkoutDetailExpandingHeaderView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v6);

  -[CHWorkoutDetailExpandingHeaderView addSubview:](self, "addSubview:", self->_contentView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView leadingAnchor](self, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));

  v20[0] = v9;
  v20[1] = v12;
  v20[2] = v15;
  v20[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)_createTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_titleLabel);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView leadingAnchor](self, "leadingAnchor"));
  v10 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, sub_10005F11C());
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v15, "_scaledValueForValue:", 25.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14));

  v18[0] = v11;
  v18[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)_createExpandButton
{
  UIButton *v3;
  UIButton *expandButton;
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
  _QWORD v26[4];

  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  expandButton = self->_expandButton;
  self->_expandButton = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.down")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 17.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithSymbolConfiguration:", v6));

  -[UIButton setImage:forState:](self->_expandButton, "setImage:forState:", v7, 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_expandButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_expandButton, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
  -[UIButton sizeToFit](self->_expandButton, "sizeToFit");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  -[UIButton setTintColor:](self->_expandButton, "setTintColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_expandButton);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView expandButton](self, "expandButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView trailingAnchor](self, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -8.0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView expandButton](self, "expandButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstBaselineAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -3.0));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView expandButton](self, "expandButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 44.0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView expandButton](self, "expandButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 44.0));

  v26[0] = v13;
  v26[1] = v18;
  v26[2] = v21;
  v26[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

}

- (void)_createSeparator
{
  UIView *v3;
  UIView *separatorView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  _QWORD v29[4];

  v3 = (UIView *)objc_alloc_init((Class)UIView);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v5);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_separatorView);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView separatorView](self, "separatorView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "scale");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 1.0 / v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView separatorView](self, "separatorView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, sub_10005F11C());
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView separatorView](self, "separatorView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView separatorView](self, "separatorView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

  v29[0] = v11;
  v29[1] = v17;
  v29[2] = v22;
  v29[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)configureWithTitle:(id)a3 section:(int64_t)a4 expanded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  -[CHWorkoutDetailExpandingHeaderView setExpanded:](self, "setExpanded:", v5);
  -[CHWorkoutDetailExpandingHeaderView setSection:](self, "setSection:", a4);
  -[CHWorkoutDetailExpandingHeaderView setTitle:](self, "setTitle:", v8);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  v8 = objc_msgSend(v4, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setText:", v8);

}

- (void)_buttonTapped:(id)a3
{
  -[CHWorkoutDetailExpandingHeaderView setExpanded:](self, "setExpanded:", -[CHWorkoutDetailExpandingHeaderView expanded](self, "expanded", a3) ^ 1);
}

- (void)setExpanded:(BOOL)a3
{
  id v4;

  self->_expanded = a3;
  -[CHWorkoutDetailExpandingHeaderView _transformButtonForExpandedState:](self, "_transformButtonForExpandedState:");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailExpandingHeaderView delegate](self, "delegate"));
  objc_msgSend(v4, "expandingHeaderView:didChangeExpanded:", self, self->_expanded);

}

- (void)_transformButtonForExpandedState:(BOOL)a3
{
  __int128 v4;
  _QWORD v5[5];
  CGAffineTransform v6;
  CGAffineTransform v7;

  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    CGAffineTransformMakeScale(&v7, 1.0, -1.0);
  }
  else
  {
    v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v7.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v7.c = v4;
    *(_OWORD *)&v7.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v5[1] = 3221225472;
  v6 = v7;
  v5[0] = _NSConcreteStackBlock;
  v5[2] = sub_1000D5D34;
  v5[3] = &unk_10077A8A0;
  v5[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.15);
}

- (void)restoreExpandedState:(BOOL)a3
{
  self->_expanded = a3;
  -[CHWorkoutDetailExpandingHeaderView _transformButtonForExpandedState:](self, "_transformButtonForExpandedState:");
}

- (CHWorkoutDetailExpandingHeaderViewDelegate)delegate
{
  return (CHWorkoutDetailExpandingHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)expandButton
{
  return self->_expandButton;
}

- (void)setExpandButton:(id)a3
{
  objc_storeStrong((id *)&self->_expandButton, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
