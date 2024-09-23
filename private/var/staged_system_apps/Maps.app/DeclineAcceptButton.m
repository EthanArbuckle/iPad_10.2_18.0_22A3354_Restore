@implementation DeclineAcceptButton

- (DeclineAcceptButton)initWithAccept:(BOOL)a3
{
  _BOOL8 v3;
  DeclineAcceptButton *v4;
  DeclineAcceptButton *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DeclineAcceptButton;
  v4 = -[DeclineAcceptButton init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[DeclineAcceptButton setAccept:](v4, "setAccept:", v3);
    -[DeclineAcceptButton _commontInit](v5, "_commontInit");
  }
  return v5;
}

- (void)_commontInit
{
  void *v3;

  -[DeclineAcceptButton _setVibrantView](self, "_setVibrantView");
  -[DeclineAcceptButton _accessibilitySetInterfaceStyleIntent:](self, "_accessibilitySetInterfaceStyleIntent:", 1);
  -[DeclineAcceptButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 5.0, 10.0, 5.0, 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setNumberOfLines:", 2);

  -[DeclineAcceptButton updateButtonWithHighlighted:](self, "updateButtonWithHighlighted:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  -[DeclineAcceptButton updateButtonWithHighlighted:](self, "updateButtonWithHighlighted:", a3);
}

- (void)updateButtonWithHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = -[DeclineAcceptButton accept](self, "accept");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton mk_theme](self, "mk_theme"));
  v11 = v6;
  if (!v3)
  {
    if (v5)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tintColor"));
      goto LABEL_6;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonNormalColor"));
LABEL_9:
    v8 = (void *)v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView contentView](self->_vibrantView, "contentView"));
    objc_msgSend(v10, "setBackgroundColor:", v8);

    goto LABEL_10;
  }
  if (!v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonHighlightedColor"));
    goto LABEL_9;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerPrimaryButtonHighlightedColor"));
LABEL_6:
  v8 = (void *)v7;
  -[DeclineAcceptButton setBackgroundColor:](self, "setBackgroundColor:", v7);
LABEL_10:

}

- (void)_setVibrantView
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  MKVibrantView *v8;
  MKVibrantView *vibrantView;
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
  id v23;
  id v24;
  _QWORD v25[4];

  if (-[DeclineAcceptButton accept](self, "accept"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton layer](self, "layer"));
    objc_msgSend(v3, "setCornerRadius:", 8.0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton layer](self, "layer"));
    objc_msgSend(v4, "setCornerCurve:", kCACornerCurveContinuous);

    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.200000003)));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton layer](self, "layer"));
    objc_msgSend(v7, "setBorderColor:", v6);

    v23 = (id)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton layer](self, "layer"));
    objc_msgSend(v23, "setBorderWidth:", 1.0);

  }
  else
  {
    v8 = (MKVibrantView *)objc_msgSend(objc_alloc((Class)MKVibrantView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    vibrantView = self->_vibrantView;
    self->_vibrantView = v8;

    -[MKVibrantView setTranslatesAutoresizingMaskIntoConstraints:](self->_vibrantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MKVibrantView setBackgroundColor:](self->_vibrantView, "setBackgroundColor:", v10);

    -[MKVibrantView setUserInteractionEnabled:](self->_vibrantView, "setUserInteractionEnabled:", 0);
    -[MKVibrantView setContinuousCornerRadius:](self->_vibrantView, "setContinuousCornerRadius:", 8.0);
    -[DeclineAcceptButton addSubview:](self, "addSubview:", self->_vibrantView);
    v24 = (id)objc_claimAutoreleasedReturnValue(-[MKVibrantView topAnchor](self->_vibrantView, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton topAnchor](self, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v22));
    v25[0] = v21;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView bottomAnchor](self->_vibrantView, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton bottomAnchor](self, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v25[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView leadingAnchor](self->_vibrantView, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton leadingAnchor](self, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v25[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView trailingAnchor](self->_vibrantView, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton trailingAnchor](self, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v25[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  }
}

- (BOOL)accept
{
  return self->_accept;
}

- (void)setAccept:(BOOL)a3
{
  self->_accept = a3;
}

- (MKVibrantView)vibrantView
{
  return self->_vibrantView;
}

- (void)setVibrantView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantView, 0);
}

@end
