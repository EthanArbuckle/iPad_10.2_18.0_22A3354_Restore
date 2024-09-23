@implementation UGCProactiveCallToActionButtonView

- (UGCProactiveCallToActionButtonView)initWithFrame:(CGRect)a3
{
  UGCProactiveCallToActionButtonView *v3;
  UGCProactiveCallToActionButtonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCProactiveCallToActionButtonView;
  v3 = -[UGCProactiveCallToActionButtonView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UGCProactiveCallToActionButtonView _setupButton](v3, "_setupButton");
  return v4;
}

- (void)_setupButton
{
  UIButton *v3;
  UIButton *button;
  UGCRatingCategoryLikeDislikeView *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  button = self->_button;
  self->_button = v3;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "_didTapOnButton", 64);
  -[UGCProactiveCallToActionButtonView addSubview:](self, "addSubview:", self->_button);
  v5 = -[UGCRatingCategoryLikeDislikeView initWithCurrentState:]([UGCRatingCategoryLikeDislikeView alloc], "initWithCurrentState:", 0);
  -[UGCRatingCategoryLikeDislikeView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  -[UIButton addSubview:](self->_button, "addSubview:", v5);
  v6 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", v5, self->_button);
  v7 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:insets:", self->_button, self, 0.0, 0.0, 0.0, 0.0);
  v9[0] = v6;
  v9[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v8);

}

- (void)_didTapOnButton
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UGCProactiveCallToActionButtonView delegate](self, "delegate"));
  objc_msgSend(v3, "proactiveCallToActionButtonViewTapped:", self);

}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (void)setLookupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lookupIdentifier, a3);
}

- (UGCProactiveCallToActionButtonViewDelegate)delegate
{
  return (UGCProactiveCallToActionButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
}

@end
