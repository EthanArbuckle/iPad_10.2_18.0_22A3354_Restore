@implementation LocalSearchView

- (void)updateTheme
{
  UIButton *actionButton;
  void *v4;
  void *v5;
  id v6;

  if (sub_1002A8AA0(self) != 5)
  {
    actionButton = self->_actionButton;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlTintColor"));
    -[UIButton setTitleColor:forState:](actionButton, "setTitleColor:forState:", v5, 0);

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchView theme](self, "theme"));
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_loadingIndicatorView, "setActivityIndicatorViewStyle:", objc_msgSend(v6, "activityIndicatorStyle"));

}

- (LocalSearchView)initWithFrame:(CGRect)a3
{
  LocalSearchView *v3;
  LocalSearchView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LocalSearchView;
  v3 = -[LocalSearchView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[LocalSearchView customInit](v3, "customInit");
    v4->_state = 0;
  }
  return v4;
}

- (void)customInit
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *contentView;
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
  NSLayoutConstraint *v19;
  NSLayoutConstraint *heightConstraint;
  UIButton *v21;
  UIButton *actionButton;
  UIActivityIndicatorView *v23;
  UIActivityIndicatorView *loadingIndicatorView;
  UILabel *v25;
  UILabel *loadingLabel;
  UILabel *v27;
  UILabel *errorLabel;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];

  -[LocalSearchView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LocalSearchView addSubview:](self, "addSubview:", self->_contentView);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView leadingAnchor](self, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v34[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView trailingAnchor](self, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v34[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView topAnchor](self, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v34[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v34[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView heightAnchor](self, "heightAnchor"));
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v19;

  v21 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  actionButton = self->_actionButton;
  self->_actionButton = v21;

  -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", CFSTR("ActionButton"));
  -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, "actionButtonTapped:", 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  loadingIndicatorView = self->_loadingIndicatorView;
  self->_loadingIndicatorView = v23;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v25;

  -[UILabel setAccessibilityIdentifier:](self->_loadingLabel, "setAccessibilityIdentifier:", CFSTR("LoadingLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  errorLabel = self->_errorLabel;
  self->_errorLabel = v27;

  -[UILabel setAccessibilityIdentifier:](self->_errorLabel, "setAccessibilityIdentifier:", CFSTR("ErrorLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
  -[LocalSearchView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, "actionButtonTapped:");
  -[LocalSearchView _updateFontsAndAppearance](self, "_updateFontsAndAppearance");
}

- (void)_updateFontsAndAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int IsEnabled_SearchAndDiscovery;
  UIButton *actionButton;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (sub_1002A8AA0(self) == 5)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011AFB50));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 16.0, UIFontWeightLight));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignRounded));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
    objc_msgSend(v7, "setFont:", v6);

    IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(v8);
    actionButton = self->_actionButton;
    if (IsEnabled_SearchAndDiscovery)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView tintColor](self, "tintColor"));
      -[UIButton setTitleColor:forState:](actionButton, "setTitleColor:forState:", v11, 0);
    }
    else
    {
      -[UIButton setTitleColor:forState:](self->_actionButton, "setTitleColor:forState:", v14, 0);
      -[UIButton setTintColor:](self->_actionButton, "setTintColor:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 2));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.clockwise"), v13));

      -[UIButton setImage:forState:](self->_actionButton, "setImage:forState:", v11, 0);
    }

    -[UILabel setTextColor:](self->_loadingLabel, "setTextColor:", v14);
    -[UILabel setTextColor:](self->_errorLabel, "setTextColor:", v14);
    -[UILabel setFont:](self->_loadingLabel, "setFont:", v6);
    -[UILabel setFont:](self->_errorLabel, "setFont:", v6);
    -[UIButton setImageEdgeInsets:](self->_actionButton, "setImageEdgeInsets:", 0.0, -10.0, 0.0, 0.0);
    -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, -2.0);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_loadingLabel, "setTextColor:", v12);

    v14 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_errorLabel, "setTextColor:", v14);
  }

}

- (double)contentHeight
{
  double v3;

  -[LocalSearchView _localSearchViewHeight](self, "_localSearchViewHeight");
  return v3 + self->_bottomInset;
}

- (void)setText:(id)a3 forState:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a3;
  switch(a4)
  {
    case 4uLL:
      v7 = 32;
LABEL_7:
      v8 = v6;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v7), "setText:", v6);
      goto LABEL_8;
    case 3uLL:
      v7 = 40;
      goto LABEL_7;
    case 1uLL:
      v8 = v6;
      -[UIButton setTitle:forState:](self->_actionButton, "setTitle:forState:", v6, 0);
LABEL_8:
      v6 = v8;
      break;
  }

}

- (id)textForState:(unint64_t)a3
{
  void *v3;
  uint64_t v4;

  switch(a3)
  {
    case 4uLL:
      v4 = 32;
LABEL_7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v4), "text"));
      return v3;
    case 3uLL:
      v4 = 40;
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleForState:](self->_actionButton, "titleForState:", 0));
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)actionButtonTapped:(id)a3
{
  -[LocalSearchView executeAction](self, "executeAction", a3);
}

- (void)executeAction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSearchViewSelected:", self);

}

- (void)setState:(unint64_t)a3
{
  id v4;
  unsigned int v5;
  id WeakRetained;

  if (self->_state != a3)
  {
    self->_state = a3;
    if (!MapsFeature_IsEnabled_SearchAndDiscovery(self))
      goto LABEL_6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "shouldShowRefreshFooter") & 1) == 0)
    {

      return;
    }
    v4 = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(v4, "shouldShowRefreshFooter");

    if (v5)
LABEL_6:
      -[LocalSearchView configureStateAnimated:](self, "configureStateAnimated:", 1);
  }
}

- (void)setBottomInset:(double)a3
{
  double bottomInset;
  double v6;

  if (self->_bottomInset != a3)
  {
    -[NSLayoutConstraint constant](self->_heightConstraint, "constant");
    bottomInset = self->_bottomInset;
    self->_bottomInset = a3;
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v6 - bottomInset + a3);
  }
}

- (void)configureStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  UIButton *v7;
  UIButton *v8;
  _QWORD *v9;
  _QWORD *v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _BOOL4 v20;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  LocalSearchViewDelegate **p_delegate;
  id WeakRetained;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  UIButton *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  _QWORD *v37;
  BOOL v38;
  _QWORD v39[5];
  _QWORD *v40;
  _QWORD v41[6];
  BOOL v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[2];

  v3 = a3;
  -[LocalSearchView _localSearchViewHeight](self, "_localSearchViewHeight");
  v6 = v5;
  -[UIActivityIndicatorView stopAnimating](self->_loadingIndicatorView, "stopAnimating");
  switch(self->_state)
  {
    case 0uLL:
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1002B6F00;
      v53[3] = &unk_1011AC860;
      v53[4] = self;
      v35 = objc_retainBlock(v53);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1002B6F70;
      v52[3] = &unk_1011AE8F8;
      v52[4] = self;
      v34 = objc_retainBlock(v52);
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v6 = 0.0;
      break;
    case 1uLL:
      v7 = self->_actionButton;
      v8 = self->_actionButton;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1002B6FEC;
      v51[3] = &unk_1011AC860;
      v51[4] = self;
      v9 = objc_retainBlock(v51);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1002B724C;
      v50[3] = &unk_1011AC860;
      v50[4] = self;
      v35 = objc_retainBlock(v50);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1002B72BC;
      v49[3] = &unk_1011AE8F8;
      v49[4] = self;
      v10 = v49;
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      v7 = self->_loadingIndicatorView;
      v8 = self->_loadingLabel;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1002B732C;
      v48[3] = &unk_1011AC860;
      v48[4] = self;
      v9 = objc_retainBlock(v48);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1002B75C4;
      v47[3] = &unk_1011AC860;
      v47[4] = self;
      v35 = objc_retainBlock(v47);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1002B7634;
      v46[3] = &unk_1011AE8F8;
      v46[4] = self;
      v10 = v46;
      goto LABEL_7;
    case 4uLL:
      v7 = self->_errorLabel;
      v8 = self->_errorLabel;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1002B76D8;
      v45[3] = &unk_1011AC860;
      v45[4] = self;
      v9 = objc_retainBlock(v45);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1002B783C;
      v44[3] = &unk_1011AC860;
      v44[4] = self;
      v35 = objc_retainBlock(v44);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1002B78AC;
      v43[3] = &unk_1011AE8F8;
      v43[4] = self;
      v10 = v43;
LABEL_7:
      v34 = objc_retainBlock(v10);
      break;
    default:
      v34 = 0;
      v35 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      break;
  }
  -[NSLayoutConstraint constant](self->_heightConstraint, "constant");
  v12 = v11;
  v13 = v6 + self->_bottomInset;
  v14 = v11 != v13;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1002B791C;
  v41[3] = &unk_1011AFB78;
  v42 = v11 != v13;
  v41[4] = self;
  *(double *)&v41[5] = v6;
  v15 = objc_retainBlock(v41);
  if (v9)
  {
    ((void (*)(_QWORD *))v9[2])(v9);
    if (self->_buttonMode && v7 && v8)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v7, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView leadingAnchor](self, "leadingAnchor"));
      v33 = v7;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 16.0));
      v54[0] = v30;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v8, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView trailingAnchor](self, "trailingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -16.0));
      v54[1] = v18;
      v19 = v9;
      v20 = v3;
      v21 = v8;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

      v8 = v21;
      v3 = v20;
      v9 = v19;

      v7 = v33;
    }
    -[LocalSearchView layoutIfNeeded](self, "layoutIfNeeded");
  }
  ((void (*)(_QWORD *))v15[2])(v15);
  if (v3)
  {
    -[LocalSearchView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1002B7950;
    v39[3] = &unk_1011ACAD0;
    v23 = v35;
    v39[4] = self;
    v40 = v35;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1002B7980;
    v36[3] = &unk_1011AFBA0;
    v24 = v34;
    v38 = v14;
    v36[4] = self;
    v37 = v34;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v39, v36, 0.25);

    v25 = v40;
LABEL_16:

    goto LABEL_25;
  }
  v26 = -[LocalSearchView layoutIfNeeded](self, "layoutIfNeeded");
  v23 = v35;
  if (v35)
    v26 = (id)((uint64_t (*)(_QWORD *))v35[2])(v35);
  v24 = v34;
  if (v34)
    v26 = (id)((uint64_t (*)(_QWORD *, uint64_t))v34[2])(v34, 1);
  if (v12 != v13 && (MapsFeature_IsEnabled_SearchAndDiscovery(v26) & 1) == 0)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v29 = objc_opt_respondsToSelector(WeakRetained, "localSearchViewContentSizeChanged");

    if ((v29 & 1) != 0)
    {
      v25 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v25, "localSearchViewContentSizeChanged");
      goto LABEL_16;
    }
  }
LABEL_25:

}

- (double)_localSearchViewHeight
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 49.0;
  if (v2 == 5)
    return 24.0;
  return result;
}

- (LocalSearchViewDelegate)delegate
{
  return (LocalSearchViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)buttonMode
{
  return self->_buttonMode;
}

- (void)setButtonMode:(BOOL)a3
{
  self->_buttonMode = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonImageView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
