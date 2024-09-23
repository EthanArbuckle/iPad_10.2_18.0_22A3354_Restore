@implementation ProminentActionButton

+ (void)_setAttributesForProminentActionButton:(id)a3 inverted:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v18 = a3;
  objc_msgSend(v18, "setInverted:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 8.0);

  objc_msgSend(v18, "setClipsToBounds:", 1);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011E7C38);

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v18, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v8, "setBorderWidth:", 1.0);

    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tintColor")));
    v10 = objc_msgSend(v9, "CGColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v11, "setBorderColor:", v10);

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tintColor"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tintColor"));
    objc_msgSend(v18, "setBackgroundColor:", v13);

    v12 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  }
  v14 = (void *)v12;
  objc_msgSend(v18, "setTitleColor:forState:", v12, 0);

  objc_msgSend(v18, "setContentEdgeInsets:", 5.0, 15.0, 5.0, 15.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  objc_msgSend(v15, "setLineBreakMode:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  objc_msgSend(v16, "setTextAlignment:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  objc_msgSend(v17, "setNumberOfLines:", 0);

}

+ (id)button
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ProminentActionButton;
  v3 = objc_msgSendSuper2(&v6, "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(a1, "_setAttributesForProminentActionButton:inverted:", v4, 0);
  return v4;
}

+ (id)invertedButton
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ProminentActionButton;
  v3 = objc_msgSendSuper2(&v6, "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(a1, "_setAttributesForProminentActionButton:inverted:", v4, 1);
  return v4;
}

- (void)setSpinnerHidden:(BOOL)a3
{
  _BOOL4 v3;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *spinner;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (!self->_spinner)
  {
    v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v5;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    -[ProminentActionButton addSubview:](self, "addSubview:", self->_spinner);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView _maps_constraintsForCenteringInView:](self->_spinner, "_maps_constraintsForCenteringInView:", self));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  }
  if (v3)
  {
    -[ProminentActionButton setEnabled:](self, "setEnabled:", 1);
    if (-[ProminentActionButton inverted](self, "inverted"))
      v8 = objc_claimAutoreleasedReturnValue(-[ProminentActionButton tintColor](self, "tintColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v10 = (void *)v8;
    -[ProminentActionButton setTitleColor:forState:](self, "setTitleColor:forState:", v8, 0);

    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  }
  else
  {
    -[ProminentActionButton setEnabled:](self, "setEnabled:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ProminentActionButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 0);

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
}

- (void)tintColorDidChange
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ProminentActionButton;
  -[ProminentActionButton tintColorDidChange](&v9, "tintColorDidChange");
  v3 = -[ProminentActionButton inverted](self, "inverted");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton tintColor](self, "tintColor"));
  v5 = v4;
  if (v3)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton layer](self, "layer"));
    objc_msgSend(v8, "setBorderColor:", v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton tintColor](self, "tintColor"));
    -[ProminentActionButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);
  }
  else
  {
    -[ProminentActionButton setBackgroundColor:](self, "setBackgroundColor:", v4);
  }

}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProminentActionButton;
  -[ProminentActionButton awakeFromNib](&v3, "awakeFromNib");
  objc_msgSend((id)objc_opt_class(self), "_setAttributesForProminentActionButton:inverted:", self, 0);
}

- (void)updateTheme
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ProminentActionButton;
  -[MapsThemeButton updateTheme](&v10, "updateTheme");
  v3 = -[ProminentActionButton inverted](self, "inverted");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton theme](self, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
  v6 = v5;
  if (v3)
  {
    v7 = objc_retainAutorelease(v5);
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton layer](self, "layer"));
    objc_msgSend(v9, "setBorderColor:", v8);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProminentActionButton theme](self, "theme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
    -[ProminentActionButton setTitleColor:forState:](self, "setTitleColor:forState:", v6, 0);
  }
  else
  {
    -[ProminentActionButton setBackgroundColor:](self, "setBackgroundColor:", v5);
  }

}

- (BOOL)inverted
{
  return self->_inverted;
}

- (void)setInverted:(BOOL)a3
{
  self->_inverted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
