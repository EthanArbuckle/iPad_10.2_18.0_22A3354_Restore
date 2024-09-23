@implementation FooterToolBarView

- (FooterToolBarView)initWithFrame:(CGRect)a3
{
  double y;
  double width;
  double height;
  FooterToolBarView *v6;
  FooterToolBarView *v7;
  uint64_t v8;
  UIVisualEffectView *blurView;
  id v10;
  id v11;
  UIImage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[8];

  v45.receiver = self;
  v45.super_class = (Class)FooterToolBarView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v6 = -[FooterToolBarView initWithFrame:](&v45, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = v6;
  if (v6)
  {
    -[FooterToolBarView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("FooterToolBarView"));
    v8 = objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
    blurView = v7->_blurView;
    v7->_blurView = (UIVisualEffectView *)v8;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v7->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FooterToolBarView addSubview:](v7, "addSubview:", v7->_blurView);
    v10 = -[FooterToolBarView _maps_addHairlineAtTopWithMargin:](v7, "_maps_addHairlineAtTopWithMargin:", 0.0);
    v11 = objc_msgSend(objc_alloc((Class)UIToolbar), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v12 = objc_opt_new(UIImage);
    objc_msgSend(v11, "setBackgroundImage:forToolbarPosition:barMetrics:", v12, 0, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v11, "setBackgroundColor:", v13);

    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "setTranslucent:", 1);
    objc_msgSend(v11, "setTintAdjustmentMode:", 1);
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("FooterToolBar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView contentView](v7, "contentView"));
    objc_msgSend(v14, "addSubview:", v11);

    -[FooterToolBarView setToolBar:](v7, "setToolBar:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView safeAreaLayoutGuide](v7, "safeAreaLayoutGuide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));

    LODWORD(v19) = 1140457472;
    v20 = v18;
    v32 = v18;
    objc_msgSend(v18, "setPriority:", v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v7->_blurView, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView topAnchor](v7, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v46[0] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v7->_blurView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView bottomAnchor](v7, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v46[1] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v7->_blurView, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView leadingAnchor](v7, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v46[2] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v7->_blurView, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView trailingAnchor](v7, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
    v46[3] = v33;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView topAnchor](v7, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v46[4] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView leadingAnchor](v7, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    v46[5] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView trailingAnchor](v7, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v46[6] = v27;
    v46[7] = v20;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  }
  return v7;
}

- (id)contentView
{
  return -[UIVisualEffectView contentView](self->_blurView, "contentView");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FooterToolBarView;
  -[FooterToolBarView layoutSubviews](&v3, "layoutSubviews");
  if (-[FooterToolBarView canAdaptToWidth](self, "canAdaptToWidth"))
    -[FooterToolBarView _updateContent](self, "_updateContent");
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[FooterToolBarView setCanAdaptToWidth:](self, "setCanAdaptToWidth:", 0);
    -[FooterToolBarView _updateContent](self, "_updateContent");
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)canDeleteOnly
{
  return self->_canDeleteOnly;
}

- (void)setCanDeleteOnly:(BOOL)a3
{
  self->_canDeleteOnly = a3;
}

- (BOOL)canBeSaved
{
  return self->_canBeSaved;
}

- (void)setCanBeSaved:(BOOL)a3
{
  self->_canBeSaved = a3;
}

- (BOOL)canMove
{
  return self->_canMove;
}

- (void)setCanMove:(BOOL)a3
{
  self->_canMove = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)canAdaptToWidth
{
  return self->_canAdaptToWidth;
}

- (void)setCanAdaptToWidth:(BOOL)a3
{
  self->_canAdaptToWidth = a3;
}

- (UIToolbar)toolBar
{
  return self->_toolBar;
}

- (void)setToolBar:(id)a3
{
  objc_storeStrong((id *)&self->_toolBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolBar, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
