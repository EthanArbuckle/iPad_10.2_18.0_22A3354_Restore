@implementation UGCSuggestionView

- (UGCSuggestionView)initWithFrame:(CGRect)a3
{
  UGCSuggestionView *v3;
  UGCSuggestionView *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UGCSuggestionView;
  v3 = -[UGCSuggestionView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UGCSuggestionView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "_suggestionTapped");
    -[UGCSuggestionView addGestureRecognizer:](v4, "addGestureRecognizer:", v5);
    -[UGCSuggestionView _setupSubviews](v4, "_setupSubviews");
    -[UGCSuggestionView _setupConstraints](v4, "_setupConstraints");

  }
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *imageView;
  void *v9;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  UILabel *v14;
  _QWORD *p_subtitleLabel;
  UILabel *subtitleLabel;
  void *v17;
  void *v18;
  TwoLinesContentView *v19;
  TwoLinesContentView *twoLinesContentView;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = self->_imageView;
    self->_imageView = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 16.0);

    -[UGCSuggestionView addSubview:](self, "addSubview:", self->_imageView);
    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v13);

    -[UGCSuggestionView addSubview:](self, "addSubview:", self->_titleLabel);
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    p_subtitleLabel = &self->_subtitleLabel;
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v14;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v18);

  }
  else
  {
    v19 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    p_subtitleLabel = &self->_twoLinesContentView;
    twoLinesContentView = self->_twoLinesContentView;
    self->_twoLinesContentView = v19;

    -[TwoLinesContentView setUserInteractionEnabled:](self->_twoLinesContentView, "setUserInteractionEnabled:", 0);
  }
  -[UGCSuggestionView addSubview:](self, "addSubview:", *p_subtitleLabel);
}

- (void)_setupConstraints
{
  MUSizeLayout *v3;
  MUSizeLayout *imageSizeLayout;
  id v5;
  void *v6;
  void *v7;
  MUCompositionalStackLayout *v8;
  MUCompositionalStackLayout *compositionalStackLayout;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (MUSizeLayout *)objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_imageView, 32.0, 32.0);
    imageSizeLayout = self->_imageSizeLayout;
    self->_imageSizeLayout = v3;

    objc_msgSend(v10, "addObject:", self->_imageSizeLayout);
  }
  v5 = objc_alloc((Class)MUCompositionalStackLayout);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView _contentLayoutGroup](self, "_contentLayoutGroup"));
  v8 = (MUCompositionalStackLayout *)objc_msgSend(v5, "initWithContainer:group:", v6, v7);
  compositionalStackLayout = self->_compositionalStackLayout;
  self->_compositionalStackLayout = v8;

  objc_msgSend(v10, "addObject:", self->_compositionalStackLayout);
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v10);

}

- (void)_updateConstraints
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView _contentLayoutGroup](self, "_contentLayoutGroup"));
  -[MUCompositionalStackLayout setGroup:](self->_compositionalStackLayout, "setGroup:", v3);

}

- (id)_contentLayoutGroup
{
  id v3;
  double v4;
  id v5;
  UILabel *subtitleLabel;
  void *v7;
  _QWORD v9[2];

  v3 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithIdentifier:axis:", CFSTR("content"), 0);
  objc_msgSend(v3, "setAlignment:", 2);
  objc_msgSend(v3, "setAlignmentBoundsContent:", 1);
  LODWORD(v4) = 1112276992;
  objc_msgSend(v3, "setAlignmentFittingSizePriority:", v4);
  if (sub_1002A8AA0(self) == 5)
  {
    objc_msgSend(v3, "addArrangedLayoutItem:", self->_imageView);
    v5 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithIdentifier:axis:", CFSTR("titles"), 1);
    subtitleLabel = self->_subtitleLabel;
    v9[0] = self->_titleLabel;
    v9[1] = subtitleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
    objc_msgSend(v5, "setArrangedLayoutItems:", v7);

    objc_msgSend(v3, "addArrangedLayoutItem:", v5);
    objc_msgSend(v3, "setPadding:forArrangedLayoutItem:", v5, 0.0, 8.0, 0.0, 0.0);

  }
  else
  {
    objc_msgSend(v3, "addArrangedLayoutItem:", self->_twoLinesContentView);
  }
  if (self->_likeDislikeView)
  {
    objc_msgSend(v3, "addArrangedLayoutItem:");
    objc_msgSend(v3, "setPadding:forArrangedLayoutItem:", self->_likeDislikeView, 0.0, 8.0, 0.0, 0.0);
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UGCSuggestionView;
  -[UGCSuggestionView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  if (sub_1002A8AA0(self) == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView traitCollection](self, "traitCollection"));
    objc_msgSend(v5, "_maps_displayScaleOrMainScreenScale");
    v7 = v6;
    objc_msgSend(v4, "_maps_displayScaleOrMainScreenScale");
    v9 = v8;

    if (v7 != v9)
      -[UGCSuggestionView _updateFromViewModel](self, "_updateFromViewModel");
  }

}

- (void)setViewModel:(id)a3
{
  UGCSuggestionViewModel *v5;
  UGCSuggestionViewModel *v6;
  unsigned __int8 v7;
  UGCSuggestionViewModel *v8;

  v5 = (UGCSuggestionViewModel *)a3;
  v6 = v5;
  if (self->_viewModel != v5)
  {
    v8 = v5;
    v7 = -[UGCSuggestionViewModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[UGCSuggestionView _updateFromViewModel](self, "_updateFromViewModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromViewModel
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  char *v12;
  UGCRatingCategoryLikeDislikeView *likeDislikeView;
  UGCRatingCategoryLikeDislikeView *v14;
  UGCRatingCategoryLikeDislikeView *v15;
  UGCRatingCategoryLikeDislikeView *v16;
  _QWORD v17[4];
  id v18[2];
  id location;

  v3 = -[UGCSuggestionViewModel contentType](self->_viewModel, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionViewModel visitDate](self->_viewModel, "visitDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForUGCSuggestionContentType:visitDate:](TwoLinesContentViewModelComposer, "cellModelForUGCSuggestionContentType:visitDate:", v3, v4));

  if (sub_1002A8AA0(self) == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleText"));
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitleText"));
    -[UILabel setText:](self->_subtitleLabel, "setText:", v7);

    v8 = (void *)(self->_imageFetchCount + 1);
    self->_imageFetchCount = (unint64_t)v8;
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView traitCollection](self, "traitCollection"));
    objc_msgSend(v9, "_maps_displayScaleOrMainScreenScale");
    v11 = v10;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100785A64;
    v17[3] = &unk_1011C64B8;
    objc_copyWeak(v18, &location);
    v18[1] = v8;
    objc_msgSend(v5, "fetchImageForScreenScale:withCompletionHandler:", v17, v11);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[TwoLinesContentView setViewModel:](self->_twoLinesContentView, "setViewModel:", v5);
  }
  v12 = (char *)-[UGCSuggestionViewModel contentType](self->_viewModel, "contentType") - 2;
  likeDislikeView = self->_likeDislikeView;
  if ((unint64_t)v12 > 3)
  {
    if (likeDislikeView)
    {
      -[UGCRatingCategoryLikeDislikeView removeFromSuperview](likeDislikeView, "removeFromSuperview");
      v16 = self->_likeDislikeView;
      self->_likeDislikeView = 0;

    }
  }
  else if (!likeDislikeView)
  {
    v14 = -[UGCRatingCategoryLikeDislikeView initWithCurrentState:]([UGCRatingCategoryLikeDislikeView alloc], "initWithCurrentState:", 0);
    v15 = self->_likeDislikeView;
    self->_likeDislikeView = v14;

    -[UGCRatingCategoryLikeDislikeView setDelegate:](self->_likeDislikeView, "setDelegate:", self);
    -[UGCSuggestionView addSubview:](self, "addSubview:", self->_likeDislikeView);
  }
  -[UGCSuggestionView _updateConstraints](self, "_updateConstraints");

}

- (void)_suggestionTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView delegate](self, "delegate"));
  objc_msgSend(v3, "didTapSuggestionView:", self);

}

- (void)likeDislikeViewDidSelectLike:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView delegate](self, "delegate", a3));
  objc_msgSend(v4, "suggestionViewDidTapLike:", self);

}

- (void)likeDislikeViewDidSelectDislike:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView delegate](self, "delegate", a3));
  objc_msgSend(v4, "suggestionViewDidTapDislike:", self);

}

- (UGCSuggestionViewModel)viewModel
{
  return self->_viewModel;
}

- (UGCSuggestionViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_compositionalStackLayout, 0);
  objc_storeStrong((id *)&self->_likeDislikeView, 0);
  objc_storeStrong((id *)&self->_imageSizeLayout, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
}

@end
