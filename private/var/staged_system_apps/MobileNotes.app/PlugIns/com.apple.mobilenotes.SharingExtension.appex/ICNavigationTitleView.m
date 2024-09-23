@implementation ICNavigationTitleView

- (ICNavigationTitleView)init
{
  ICNavigationTitleView *v2;
  ICNavigationTitleView *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICNavigationTitleView;
  v2 = -[ICNavigationTitleView init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    -[ICNavigationTitleView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setTextAlignment:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_fontWithSingleLineA"));
    objc_msgSend(v4, "setFont:", v6);

    v7 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setTextAlignment:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_fontWithSingleLineA"));
    objc_msgSend(v7, "setFont:", v9);

    -[ICNavigationTitleView addSubview:](v3, "addSubview:", v4);
    -[ICNavigationTitleView addSubview:](v3, "addSubview:", v7);
    v10 = _NSDictionaryOfVariableBindings(CFSTR("titleLabel, subtitleLabel"), v4, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[titleLabel]-0-|"), 0, 0, v11));
    -[ICNavigationTitleView addConstraints:](v3, "addConstraints:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[subtitleLabel]-0-|"), 0, 0, v11));
    -[ICNavigationTitleView addConstraints:](v3, "addConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[titleLabel]-0-[subtitleLabel]-0-|"), 0, 0, v11));
    -[ICNavigationTitleView addConstraints:](v3, "addConstraints:", v14);

    -[ICNavigationTitleView setTitleLabel:](v3, "setTitleLabel:", v4);
    -[ICNavigationTitleView setSubtitleLabel:](v3, "setSubtitleLabel:", v7);
    -[ICNavigationTitleView setIsAccessibilityElement:](v3, "setIsAccessibilityElement:", 1);

  }
  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNavigationTitleView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNavigationTitleView subtitleLabel](self, "subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v6 = __ICAccessibilityStringForVariables(1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
