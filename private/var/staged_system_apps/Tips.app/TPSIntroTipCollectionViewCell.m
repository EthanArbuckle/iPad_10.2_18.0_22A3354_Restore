@implementation TPSIntroTipCollectionViewCell

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSIntroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell commonInit](&v3, "commonInit");
  -[TPSBaseTipCollectionViewCell setHasBodyContent:](self, "setHasBodyContent:", 0);
}

- (void)setLoading:(BOOL)a3
{
  TPSLoadingView *loadingView;
  TPSLoadingView *v5;
  TPSLoadingView *v6;
  TPSLoadingView *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *loadingViewTopAnchorConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    loadingView = self->_loadingView;
    if (a3)
    {
      if (loadingView)
        return;
      v6 = (TPSLoadingView *)objc_alloc_init((Class)TPSLoadingView);
      v7 = self->_loadingView;
      self->_loadingView = v6;

      -[TPSLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v21 = (id)objc_claimAutoreleasedReturnValue(-[TPSIntroTipCollectionViewCell contentView](self, "contentView"));
      objc_msgSend(v21, "addSubview:", self->_loadingView);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView topAnchor](self->_loadingView, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
      v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      loadingViewTopAnchorConstraint = self->_loadingViewTopAnchorConstraint;
      self->_loadingViewTopAnchorConstraint = v10;

      -[NSLayoutConstraint setActive:](self->_loadingViewTopAnchorConstraint, "setActive:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView bottomAnchor](self->_loadingView, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      objc_msgSend(v14, "setActive:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView leadingAnchor](self->_loadingView, "leadingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      objc_msgSend(v17, "setActive:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView trailingAnchor](self->_loadingView, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
      objc_msgSend(v20, "setActive:", 1);

      v5 = (TPSLoadingView *)v21;
    }
    else
    {
      -[TPSLoadingView removeFromSuperview](loadingView, "removeFromSuperview");
      v5 = self->_loadingView;
      self->_loadingView = 0;
    }

  }
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TPSIntroTipCollectionViewCell;
  v5 = -[TPSBookendsCollectionViewCell setTip:withCellAppearance:](&v14, "setTip:withCellAppearance:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](self, "heroAssetView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cacheVideoIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataCacheForIdentifier:", v8));

  if (v9)
    v10 = 0.1;
  else
    v10 = kTPSVideoAssetViewDefaultStartTime;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](self, "heroAssetView"));
  objc_msgSend(v11, "setVideoDelayTime:", v10);

  if (v9)
    v12 = 0;
  else
    v12 = -[TPSBaseTipCollectionViewCell imageLoadingFinished](self, "imageLoadingFinished") ^ 1;
  -[TPSIntroTipCollectionViewCell setLoading:](self, "setLoading:", v12);
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSIntroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TPSIntroTipCollectionViewCell setLoading:](self, "setLoading:", 0);
}

- (void)updateLoadingStatus
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSIntroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell updateLoadingStatus](&v3, "updateLoadingStatus");
  if (-[TPSBaseTipCollectionViewCell videoLoadingFinished](self, "videoLoadingFinished")
    || -[TPSBaseTipCollectionViewCell imageLoadingFinished](self, "imageLoadingFinished"))
  {
    -[TPSIntroTipCollectionViewCell setLoading:](self, "setLoading:", 0);
  }
}

- (void)setImageLoadingFinished:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TPSIntroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell setImageLoadingFinished:](&v5, "setImageLoadingFinished:");
  if (v3)
    -[TPSIntroTipCollectionViewCell setLoading:](self, "setLoading:", 0);
}

- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3
{
  double top;
  objc_super v5;

  top = a3.top;
  v5.receiver = self;
  v5.super_class = (Class)TPSIntroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell setContentSafeAreaInsets:](&v5, "setContentSafeAreaInsets:", a3.top, a3.left, a3.bottom, a3.right);
  -[NSLayoutConstraint setConstant:](self->_loadingViewTopAnchorConstraint, "setConstant:", top);
}

- (BOOL)loading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
