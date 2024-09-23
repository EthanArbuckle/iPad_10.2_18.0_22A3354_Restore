@implementation MTSettingsWithActionHeaderView

- (MTSettingsWithActionHeaderView)initWithReuseIdentifier:(id)a3
{
  MTSettingsWithActionHeaderView *v3;
  uint64_t v4;
  UIButton *actionButton;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTSettingsWithActionHeaderView;
  v3 = -[MTSettingsWithActionHeaderView initWithReuseIdentifier:](&v8, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v4;

    -[UIButton addTarget:action:forControlEvents:](v3->_actionButton, "addTarget:action:forControlEvents:", v3, "actionButtonTapped:", 64);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_actionButton);

  }
  return v3;
}

- (void)setAction:(id)a3
{
  MTSettingHeaderAction *v5;
  MTSettingHeaderAction *v6;

  v5 = (MTSettingHeaderAction *)a3;
  if (self->_action != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_action, a3);
    -[MTSettingsWithActionHeaderView _reloadActionButtonContent](self, "_reloadActionButtonContent");
    v5 = v6;
  }

}

- (void)actionButtonTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView action](self, "action", a3));
  objc_msgSend(v3, "performAction");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTSettingsWithActionHeaderView;
  -[MTSettingsWithActionHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[MTSettingsWithActionHeaderView setAction:](self, "setAction:", 0);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  -[MTSettingsWithActionHeaderView _updateButtonFontAndTextAlignment](self, "_updateButtonFontAndTextAlignment");
  -[MTSettingsWithActionHeaderView _contentViewLayoutRect](self, "_contentViewLayoutRect");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v7 = CGRectGetWidth(v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v8, "frame");
  -[MTSettingsWithActionHeaderView setMaxTitleWidth:](self, "setMaxTitleWidth:", v7 - CGRectGetWidth(v28) + -12.0);

  v26.receiver = self;
  v26.super_class = (Class)MTSettingsWithActionHeaderView;
  -[MTSettingsWithActionHeaderView layoutSubviews](&v26, "layoutSubviews");
  LODWORD(v8) = -[MTSettingsWithActionHeaderView mt_isRTL](self, "mt_isRTL");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v9, "frame");
  v14 = sub_10011A178((int)v8, 3, 3, v10, v11, v12, v13, x, y, width, height);
  v16 = v15;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView textLabel](self, "textLabel"));
  objc_msgSend(v19, "mt_baselineOriginY");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v22, "mt_firstBaselineOffsetFromTop");
  v24 = v21 - v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v25, "setFrame:", v14, v24, v16, v18);

}

- (void)_reloadActionButtonContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView action](self, "action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView _actionButtonDisplayTitleForActionTitle:](self, "_actionButtonDisplayTitleForActionTitle:", v5));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100081C14;
  v9[3] = &unk_1004A6640;
  v10 = v3;
  v11 = v6;
  v7 = v6;
  v8 = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
  -[MTSettingsWithActionHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateButtonFontAndTextAlignment
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  if (-[MTSettingsWithActionHeaderView mt_isRTL](self, "mt_isRTL"))
    v3 = 2;
  else
    v3 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v5, "setTextAlignment:", v3);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView textLabel](self, "textLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
      objc_msgSend(v11, "setFont:", v7);

      objc_msgSend(v12, "sizeToFit");
    }
  }

}

- (CGRect)_contentViewLayoutRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView contentView](self, "contentView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "layoutMargins");
  v12 = v11;
  v13 = objc_msgSend(v2, "layoutMargins");
  v15 = UIRectInset(v13, v4, v6, v8, v10, 0.0, v12, 0.0, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)_actionButtonDisplayTitleForActionTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseStringWithLocale:", v4));

  return v5;
}

- (MTSettingHeaderAction)action
{
  return self->_action;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
