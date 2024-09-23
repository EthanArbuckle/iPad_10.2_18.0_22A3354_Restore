@implementation UGCRatingCategoryCell

- (UGCRatingCategoryCell)initWithCurrentState:(int64_t)a3
{
  UGCRatingCategoryCell *v4;
  UGCRatingCategoryCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCRatingCategoryCell;
  v4 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UGCRatingCategoryCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[UGCRatingCategoryCell _setupSubviewsWithState:](v5, "_setupSubviewsWithState:", a3);
    -[UGCRatingCategoryCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)_setupSubviewsWithState:(int64_t)a3
{
  uint64_t v5;
  double v6;
  MUAppleRatingRowView *v7;
  MUAppleRatingRowView *categoryView;
  UGCRatingCategoryLikeDislikeView *v9;
  UGCRatingCategoryLikeDislikeView *likeDislikeView;

  self->_currentState = a3;
  v5 = sub_1002A8AA0(self);
  v6 = MUAppleRatingRowViewVerticalPadding;
  if (v5 == 5)
    v6 = 10.0;
  -[UGCRatingCategoryCell setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v6, 0.0, v6, 0.0);
  v7 = (MUAppleRatingRowView *)objc_msgSend(objc_alloc((Class)MUAppleRatingRowView), "initWithFrame:ratingsCountAnimationEnabled:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  categoryView = self->_categoryView;
  self->_categoryView = v7;

  -[MUAppleRatingRowView setBottomHairlineHidden:](self->_categoryView, "setBottomHairlineHidden:", 1);
  v9 = -[UGCRatingCategoryLikeDislikeView initWithCurrentState:]([UGCRatingCategoryLikeDislikeView alloc], "initWithCurrentState:", a3);
  likeDislikeView = self->_likeDislikeView;
  self->_likeDislikeView = v9;

  -[UGCRatingCategoryLikeDislikeView setDelegate:](self->_likeDislikeView, "setDelegate:", self);
  -[UGCRatingCategoryCell addSubview:](self, "addSubview:", self->_categoryView);
  -[UGCRatingCategoryCell addSubview:](self, "addSubview:", self->_likeDislikeView);
}

- (void)_setupConstraints
{
  id v3;
  void *v4;
  id v5;
  UGCRatingCategoryLikeDislikeView *likeDislikeView;
  void *v7;
  double v8;
  _QWORD v9[2];

  v3 = objc_alloc((Class)MUStackLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingCategoryCell layoutMarginsGuide](self, "layoutMarginsGuide"));
  v5 = objc_msgSend(v3, "initWithContainer:axis:", v4, 0);

  likeDislikeView = self->_likeDislikeView;
  v9[0] = self->_categoryView;
  v9[1] = likeDislikeView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  objc_msgSend(v5, "setArrangedLayoutItems:", v7);

  objc_msgSend(v5, "setSpacing:", 12.0);
  objc_msgSend(v5, "setAlignment:", 2);
  objc_msgSend(v5, "setAlignmentBoundsContent:", 1);
  LODWORD(v8) = 1112276992;
  objc_msgSend(v5, "setAlignmentFittingSizePriority:", v8);
  objc_msgSend(v5, "activate");

}

- (void)likeDislikeViewDidSelectLike:(id)a3
{
  id v4;
  int64_t currentState;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  v4 = a3;
  currentState = self->_currentState;
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingCategoryCell delegate](self, "delegate"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009A6254;
  v7[3] = &unk_1011B1C70;
  objc_copyWeak(v8, &location);
  v8[1] = (id)(2 * (currentState != 2));
  objc_msgSend(v6, "ratingCategoryCell:presentInformedConsentIfNeededWithCompletion:", self, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

- (void)likeDislikeViewDidSelectDislike:(id)a3
{
  id v4;
  int64_t currentState;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  v4 = a3;
  currentState = self->_currentState;
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingCategoryCell delegate](self, "delegate"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009A6394;
  v7[3] = &unk_1011B1C70;
  objc_copyWeak(v8, &location);
  v8[1] = (id)(currentState != 1);
  objc_msgSend(v6, "ratingCategoryCell:presentInformedConsentIfNeededWithCompletion:", self, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

- (void)_updateState:(int64_t)a3
{
  id WeakRetained;

  if (self->_currentState != a3)
  {
    -[UGCRatingCategoryCell setCurrentState:animated:](self, "setCurrentState:animated:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "ratingCategoryCellChangedState:forKey:", a3, self->_key);

  }
}

- (void)setCurrentState:(int64_t)a3
{
  -[UGCRatingCategoryCell setCurrentState:animated:](self, "setCurrentState:animated:", a3, 0);
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    -[UGCRatingCategoryLikeDislikeView setCurrentState:animated:](self->_likeDislikeView, "setCurrentState:animated:");
  }
}

- (void)setAppleRatingViewModel:(id)a3
{
  MURatingPercentageViewModel *v5;
  MURatingPercentageViewModel *appleRatingViewModel;
  unsigned __int8 v7;
  MURatingPercentageViewModel *v8;

  v5 = (MURatingPercentageViewModel *)a3;
  appleRatingViewModel = self->_appleRatingViewModel;
  if (appleRatingViewModel != v5)
  {
    v8 = v5;
    v7 = -[MURatingPercentageViewModel isEqual:](appleRatingViewModel, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_appleRatingViewModel, a3);
      -[MUAppleRatingRowView setViewModel:](self->_categoryView, "setViewModel:", self->_appleRatingViewModel);
      v5 = v8;
    }
  }

}

- (BOOL)enabled
{
  return -[UGCRatingCategoryLikeDislikeView enabled](self->_likeDislikeView, "enabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[UGCRatingCategoryLikeDislikeView setEnabled:](self->_likeDislikeView, "setEnabled:", a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (MURatingPercentageViewModel)appleRatingViewModel
{
  return self->_appleRatingViewModel;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (UGCRatingCategoryCellDelegate)delegate
{
  return (UGCRatingCategoryCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIFont)ratingLabelFont
{
  return self->_ratingLabelFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingLabelFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appleRatingViewModel, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_likeDislikeView, 0);
  objc_storeStrong((id *)&self->_categoryView, 0);
}

@end
