@implementation ActionButtonCollectionReusableView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (double)estimatedHeight
{
  return 52.0;
}

- (ActionButtonCollectionReusableView)initWithFrame:(CGRect)a3
{
  ActionButtonCollectionReusableView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ActionButtonCollectionReusableView;
  v3 = -[ActionButtonCollectionReusableView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ActionButtonCollectionReusableView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[ActionButtonCollectionReusableView setupSubviews](v3, "setupSubviews");
    -[ActionButtonCollectionReusableView updateFontsAndSizes](v3, "updateFontsAndSizes");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v3;
}

- (void)setupSubviews
{
  MKVibrantView *v3;
  MKVibrantView *vibrantView;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *button;
  UIButton *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *heightConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *leadingVibrantViewContraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *trailingVibrantViewContraint;
  NSLayoutConstraint *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[9];

  v3 = (MKVibrantView *)objc_msgSend(objc_alloc((Class)MKVibrantView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  vibrantView = self->_vibrantView;
  self->_vibrantView = v3;

  -[MKVibrantView setTranslatesAutoresizingMaskIntoConstraints:](self->_vibrantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKVibrantView _setContinuousCornerRadius:](self->_vibrantView, "_setContinuousCornerRadius:", 8.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView regularBackgroundColor](self, "regularBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView contentView](self->_vibrantView, "contentView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[ActionButtonCollectionReusableView addSubview:](self, "addSubview:", self->_vibrantView);
  -[ActionButtonCollectionReusableView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, "didTouchUp:");
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  button = self->_button;
  self->_button = v7;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = self->_button;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tintColor"));
  -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v11, 0);

  v12 = self->_button;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tintColor"));
  -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v14, 1);

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "didTouchUp:", 64);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "didTouchDown:", 1);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "didEndTouch:", 448);
  -[ActionButtonCollectionReusableView addSubview:](self, "addSubview:", self->_button);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView heightAnchor](self, "heightAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView leadingAnchor](self->_vibrantView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView leadingAnchor](self, "leadingAnchor"));
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  leadingVibrantViewContraint = self->_leadingVibrantViewContraint;
  self->_leadingVibrantViewContraint = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView trailingAnchor](self->_vibrantView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView trailingAnchor](self, "trailingAnchor"));
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  trailingVibrantViewContraint = self->_trailingVibrantViewContraint;
  self->_trailingVibrantViewContraint = v24;

  v26 = self->_trailingVibrantViewContraint;
  v47[0] = self->_leadingVibrantViewContraint;
  v47[1] = v26;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView topAnchor](self->_vibrantView, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView topAnchor](self, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v47[2] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView bottomAnchor](self->_vibrantView, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView bottomAnchor](self, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v47[3] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView leadingAnchor](self->_vibrantView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 4.0));
  v47[4] = v38;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView trailingAnchor](self->_vibrantView, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -4.0));
  v47[5] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_button, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView topAnchor](self->_vibrantView, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  v47[6] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView bottomAnchor](self->_vibrantView, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  v36 = self->_heightConstraint;
  v47[7] = v35;
  v47[8] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ActionButtonCollectionReusableView;
  -[ActionButtonCollectionReusableView prepareForReuse](&v7, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView regularBackgroundColor](self, "regularBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView vibrantView](self, "vibrantView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView button](self, "button"));
  objc_msgSend(v6, "setTitle:forState:", 0, 0);

  -[ActionButtonCollectionReusableView setCompletion:](self, "setCompletion:", 0);
}

- (void)updateFontsAndSizes
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubheadline, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubheadline, 0));
  objc_msgSend((id)objc_opt_class(self), "estimatedHeight");
  objc_msgSend(v8, "_mapkit_scaledValueForValue:");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView heightConstraint](self, "heightConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

}

- (id)regularBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonNormalColor"));

  return v3;
}

- (id)highlightedBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonHighlightedColor"));

  return v3;
}

- (void)didTouchUp:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView completion](self, "completion", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView completion](self, "completion"));
    v5[2]();

  }
}

- (void)didTouchDown:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView highlightedBackgroundColor](self, "highlightedBackgroundColor", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView vibrantView](self, "vibrantView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)didEndTouch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView regularBackgroundColor](self, "regularBackgroundColor", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView vibrantView](self, "vibrantView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)setTitle:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView button](self, "button"));
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

  -[ActionButtonCollectionReusableView setCompletion:](self, "setCompletion:", v8);
}

- (void)setLeadingPadding:(double)a3
{
  id v4;

  self->_leadingPadding = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView leadingVibrantViewContraint](self, "leadingVibrantViewContraint"));
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)setTrailingPadding:(double)a3
{
  double v3;
  id v4;

  self->_trailingPadding = a3;
  v3 = -a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ActionButtonCollectionReusableView trailingVibrantViewContraint](self, "trailingVibrantViewContraint"));
  objc_msgSend(v4, "setConstant:", v3);

}

- (double)leadingPadding
{
  return self->_leadingPadding;
}

- (double)trailingPadding
{
  return self->_trailingPadding;
}

- (MKVibrantView)vibrantView
{
  return self->_vibrantView;
}

- (void)setVibrantView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantView, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)leadingVibrantViewContraint
{
  return self->_leadingVibrantViewContraint;
}

- (void)setLeadingVibrantViewContraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingVibrantViewContraint, a3);
}

- (NSLayoutConstraint)trailingVibrantViewContraint
{
  return self->_trailingVibrantViewContraint;
}

- (void)setTrailingVibrantViewContraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingVibrantViewContraint, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_trailingVibrantViewContraint, 0);
  objc_storeStrong((id *)&self->_leadingVibrantViewContraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
}

@end
