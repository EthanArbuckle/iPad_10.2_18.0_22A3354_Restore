@implementation UGCRatingCategoryLikeDislikeView

- (UGCRatingCategoryLikeDislikeView)initWithCurrentState:(int64_t)a3
{
  UGCRatingCategoryLikeDislikeView *v4;
  UGCRatingCategoryLikeDislikeView *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCRatingCategoryLikeDislikeView;
  v4 = -[UGCRatingCategoryLikeDislikeView initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UGCRatingCategoryLikeDislikeView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[UGCRatingCategoryLikeDislikeView _setupSubviews](v5, "_setupSubviews");
    -[UGCRatingCategoryLikeDislikeView _setupConstraints](v5, "_setupConstraints");
    -[UGCRatingCategoryLikeDislikeView setCurrentState:animated:](v5, "setCurrentState:animated:", a3, 0);
  }
  return v5;
}

- (void)_setupSubviews
{
  UGCGlyphButtonView *v3;
  UGCGlyphButtonView *likeButton;
  UGCGlyphButtonView *v5;
  UGCGlyphButtonView *dislikeButton;
  UGCGlyphButtonView *v7;
  UGCRatingCategoryLikeDislikeView *v8;

  v3 = (UGCGlyphButtonView *)objc_claimAutoreleasedReturnValue(+[UGCGlyphButtonView likeButtonView](UGCGlyphButtonView, "likeButtonView"));
  likeButton = self->_likeButton;
  self->_likeButton = v3;

  -[UGCGlyphButtonView setAccessibilityIdentifier:](self->_likeButton, "setAccessibilityIdentifier:", CFSTR("LikeButton"));
  -[UGCGlyphButtonView setDelegate:](self->_likeButton, "setDelegate:", self);
  v5 = (UGCGlyphButtonView *)objc_claimAutoreleasedReturnValue(+[UGCGlyphButtonView dislikeButtonView](UGCGlyphButtonView, "dislikeButtonView"));
  dislikeButton = self->_dislikeButton;
  self->_dislikeButton = v5;

  -[UGCGlyphButtonView setAccessibilityIdentifier:](self->_dislikeButton, "setAccessibilityIdentifier:", CFSTR("DislikeButton"));
  -[UGCGlyphButtonView setDelegate:](self->_dislikeButton, "setDelegate:", self);
  v7 = self->_likeButton;
  v8 = self;
  -[UGCRatingCategoryLikeDislikeView addSubview:](v8, "addSubview:", v7);
  -[UGCRatingCategoryLikeDislikeView addSubview:](v8, "addSubview:", self->_dislikeButton);

}

- (void)_setupConstraints
{
  id v3;
  UGCGlyphButtonView *dislikeButton;
  void *v5;
  _QWORD v6[2];

  v3 = objc_msgSend(objc_alloc((Class)MUStackLayout), "initWithContainer:axis:", self, 0);
  dislikeButton = self->_dislikeButton;
  v6[0] = self->_likeButton;
  v6[1] = dislikeButton;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  objc_msgSend(v3, "setArrangedLayoutItems:", v5);

  objc_msgSend(v3, "setSpacing:", 8.0);
  objc_msgSend(v3, "activate");

}

- (void)_likeButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "likeDislikeViewDidSelectLike:", self);

}

- (void)_dislikeButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "likeDislikeViewDidSelectDislike:", self);

}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    -[UGCRatingCategoryLikeDislikeView _updateAppearance:](self, "_updateAppearance:", a4);
  }
}

- (BOOL)enabled
{
  return -[UGCGlyphButtonView isEnabled](self->_likeButton, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UGCRatingCategoryLikeDislikeView enabled](self, "enabled") != a3)
  {
    -[UGCGlyphButtonView setEnabled:](self->_likeButton, "setEnabled:", v3);
    -[UGCGlyphButtonView setEnabled:](self->_dislikeButton, "setEnabled:", v3);
  }
}

- (void)_updateAppearance:(BOOL)a3
{
  _BOOL8 v3;
  int64_t currentState;

  v3 = a3;
  currentState = self->_currentState;
  -[UGCGlyphButtonView setMuted:](self->_likeButton, "setMuted:", currentState == 1);
  -[UGCGlyphButtonView setMuted:](self->_dislikeButton, "setMuted:", currentState == 2);
  if ((currentState == 2) != -[UGCGlyphButtonView isSelected](self->_likeButton, "isSelected"))
    -[UGCGlyphButtonView setSelected:animated:](self->_likeButton, "setSelected:animated:", currentState == 2, v3);
  if ((currentState == 1) != -[UGCGlyphButtonView isSelected](self->_dislikeButton, "isSelected"))
    -[UGCGlyphButtonView setSelected:animated:](self->_dislikeButton, "setSelected:animated:", currentState == 1, v3);
}

- (void)didTapOnGlyphView:(id)a3
{
  UGCGlyphButtonView *v4;
  UGCGlyphButtonView *v5;

  v4 = (UGCGlyphButtonView *)a3;
  if (self->_likeButton == v4)
  {
    v5 = v4;
    -[UGCRatingCategoryLikeDislikeView _likeButtonPressed](self, "_likeButtonPressed");
    goto LABEL_5;
  }
  if (self->_dislikeButton == v4)
  {
    v5 = v4;
    -[UGCRatingCategoryLikeDislikeView _dislikeButtonPressed](self, "_dislikeButtonPressed");
LABEL_5:
    v4 = v5;
  }

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (UGCRatingCategoryLikeDislikeViewDelegate)delegate
{
  return (UGCRatingCategoryLikeDislikeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_likeDislikeHorizontalSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_dislikeButton, 0);
  objc_storeStrong((id *)&self->_likeButton, 0);
}

@end
