@implementation ICActionSheetHeaderView

- (ICActionSheetHeaderView)initWithTitle:(id)a3 snippet:(id)a4 iconImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICActionSheetHeaderView *v11;
  ICActionSheetHeaderView *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICActionSheetHeaderView;
  v11 = -[ICActionSheetHeaderView init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[ICActionSheetHeaderView setIconImage:](v11, "setIconImage:", v10);
    -[ICActionSheetHeaderView setTitle:](v12, "setTitle:", v8);
    -[ICActionSheetHeaderView setSnippet:](v12, "setSnippet:", v9);
    -[ICActionSheetHeaderView initializeSubviews](v12, "initializeSubviews");
    -[ICActionSheetHeaderView setupConstraints](v12, "setupConstraints");
  }

  return v12;
}

- (void)initializeSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  NSAttributedStringKey v35;
  void *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  objc_msgSend(v4, "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = objc_alloc((Class)UIImageView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImage](self, "iconImage"));
  v8 = objc_msgSend(v6, "initWithImage:", v7);
  -[ICActionSheetHeaderView setIconImageView:](self, "setIconImageView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  objc_msgSend(v9, "setAccessibilityIgnoresInvertColors:", 1);

  v10 = objc_alloc_init((Class)UILabel);
  -[ICActionSheetHeaderView setTitleView:](self, "setTitleView:", v10);

  v11 = objc_alloc((Class)NSAttributedString);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView title](self, "title"));
  v35 = NSFontAttributeName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 21.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_fontWithSingleLineA"));
  v36 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  v16 = objc_msgSend(v11, "initWithString:attributes:", v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  objc_msgSend(v17, "setAttributedText:", v16);

  v18 = objc_alloc_init((Class)UILabel);
  -[ICActionSheetHeaderView setSnippetView:](self, "setSnippetView:", v18);

  v19 = objc_alloc((Class)NSAttributedString);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippet](self, "snippet"));
  v33[0] = NSFontAttributeName;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 16.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_fontWithSingleLineA"));
  v34[0] = v22;
  v33[1] = NSForegroundColorAttributeName;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.652, 0.667, 0.663, 1.0));
  v34[1] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
  v25 = objc_msgSend(v19, "initWithString:attributes:", v20, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  objc_msgSend(v26, "setAttributedText:", v25);

  -[ICActionSheetHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  -[ICActionSheetHeaderView addSubview:](self, "addSubview:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  -[ICActionSheetHeaderView addSubview:](self, "addSubview:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  -[ICActionSheetHeaderView addSubview:](self, "addSubview:", v32);

}

- (void)setupConstraints
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
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView activatedConstraints](self, "activatedConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView activatedConstraints](self, "activatedConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[ICActionSheetHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", 0);
  }
  v26 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 0, 1.0, 94.0));
  objc_msgSend(v26, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 10, 0, self, 10, 1.0, 0.0));
  objc_msgSend(v26, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 5, 0, self, 5, 1.0, 20.0));
  objc_msgSend(v26, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v11, 3, 1.0, 5.0));
  objc_msgSend(v26, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 4, 0, v14, 4, 1.0, -4.0));
  objc_msgSend(v26, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 5, 0, v17, 6, 1.0, 10.0));
  objc_msgSend(v26, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView iconImageView](self, "iconImageView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 5, 0, v20, 6, 1.0, 10.0));
  objc_msgSend(v26, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView titleView](self, "titleView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 6, -1, self, 6, 1.0, -20.0));
  objc_msgSend(v26, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICActionSheetHeaderView snippetView](self, "snippetView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 6, -1, self, 6, 1.0, -20.0));
  objc_msgSend(v26, "addObject:", v25);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);
  -[ICActionSheetHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", v26);

}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)snippet
{
  return self->_snippet;
}

- (void)setSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_snippet, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UILabel)snippetView
{
  return self->_snippetView;
}

- (void)setSnippetView:(id)a3
{
  objc_storeStrong((id *)&self->_snippetView, a3);
}

- (NSMutableArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_snippetView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end
