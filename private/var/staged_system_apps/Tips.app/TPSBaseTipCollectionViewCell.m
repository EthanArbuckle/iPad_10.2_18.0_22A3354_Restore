@implementation TPSBaseTipCollectionViewCell

+ (id)attributedStringOperationQueue
{
  if (qword_1000B6C20 != -1)
    dispatch_once(&qword_1000B6C20, &stru_1000A28E8);
  return (id)qword_1000B6C28;
}

- (void)dealloc
{
  NSBlockOperation *contentTextOperation;
  NSString *contentTextOperationID;
  void *v5;
  objc_super v6;

  -[TPSBaseTipCollectionViewCell removeContentParser](self, "removeContentParser");
  -[NSBlockOperation cancel](self->_contentTextOperation, "cancel");
  contentTextOperation = self->_contentTextOperation;
  self->_contentTextOperation = 0;

  contentTextOperationID = self->_contentTextOperationID;
  self->_contentTextOperationID = 0;

  -[TPSKVOManager removeAllKVOObjects](self->_KVOManager, "removeAllKVOObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, self);

  v6.receiver = self;
  v6.super_class = (Class)TPSBaseTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell dealloc](&v6, "dealloc");
}

- (void)commonInit
{
  self->_hasBodyContent = 1;
  self->_imageParallaxMultiplier = 1.0;
}

- (TPSBaseTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  TPSBaseTipCollectionViewCell *v3;
  TPSBaseTipCollectionViewCell *v4;
  TPSKVOManager *v5;
  TPSKVOManager *KVOManager;
  void *v7;
  void *v8;
  __int128 v9;
  TPSVideoAssetView *v10;
  TPSVideoAssetView *heroAssetView;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  void *v16;
  UIScrollView *v17;
  UIScrollView *contentScrollView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  TPSTipContentLabel *v32;
  TPSTipContentLabel *contentLabel;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  TPSTipContentTextView *v38;
  TPSTipContentTextView *contentTextView;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)TPSBaseTipCollectionViewCell;
  v3 = -[TPSBaseTipCollectionViewCell initWithFrame:](&v47, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TPSBaseTipCollectionViewCell commonInit](v3, "commonInit");
    v5 = (TPSKVOManager *)objc_msgSend(objc_alloc((Class)TPSKVOManager), "initWithObserver:", v4);
    KVOManager = v4->_KVOManager;
    v4->_KVOManager = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "setClipsToBounds:", 1);
    v9 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v4->_contentSafeAreaInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v4->_contentSafeAreaInsets.bottom = v9;
    v4->_contentFinishedLoading = 0;
    v10 = (TPSVideoAssetView *)objc_alloc_init((Class)TPSVideoAssetView);
    heroAssetView = v4->_heroAssetView;
    v4->_heroAssetView = v10;

    -[TPSVideoAssetView setVideoDelegate:](v4->_heroAssetView, "setVideoDelegate:", v4);
    -[TPSVideoAssetView setDelegate:](v4->_heroAssetView, "setDelegate:", v4);
    -[TPSVideoAssetView setTranslatesAutoresizingMaskIntoConstraints:](v4->_heroAssetView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if ((+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI") & 1) == 0)
      -[TPSVideoAssetView setAspectFillAsset:](v4->_heroAssetView, "setAspectFillAsset:", 1);
    -[TPSBaseTipCollectionViewCell updateAssetViewBackground](v4, "updateAssetViewBackground");
    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setOpaque:](v4->_titleLabel, "setOpaque:", 1);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", v14);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleFont](v4, "titleFont"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v15);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v16);

    -[UILabel setLineBreakStrategy:](v4->_titleLabel, "setLineBreakStrategy:", 0);
    v17 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    contentScrollView = v4->_contentScrollView;
    v4->_contentScrollView = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIScrollView setBackgroundColor:](v4->_contentScrollView, "setBackgroundColor:", v19);

    -[UIScrollView setContentInsetAdjustmentBehavior:](v4->_contentScrollView, "setContentInsetAdjustmentBehavior:", 3);
    -[UIScrollView setDirectionalLockEnabled:](v4->_contentScrollView, "setDirectionalLockEnabled:", 1);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_contentScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", v4->_contentScrollView);
    -[UIScrollView addSubview:](v4->_contentScrollView, "addSubview:", v4->_heroAssetView);
    -[UIScrollView addSubview:](v4->_contentScrollView, "addSubview:", v4->_titleLabel);
    -[TPSKVOManager addKVOObject:forKeyPath:options:context:](v4->_KVOManager, "addKVOObject:forKeyPath:options:context:", v4->_contentScrollView, CFSTR("contentSize"), 3, "contentLayoutChanged:userInfo:");
    -[TPSKVOManager addKVOObject:forKeyPath:options:context:](v4->_KVOManager, "addKVOObject:forKeyPath:options:context:", v4->_contentScrollView, CFSTR("contentOffset"), 3, "contentLayoutChanged:userInfo:");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v4->_contentScrollView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v4->_contentScrollView, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    objc_msgSend(v25, "setActive:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v4->_contentScrollView, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    objc_msgSend(v28, "setActive:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v4->_contentScrollView, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
    objc_msgSend(v31, "setActive:", 1);

    if (v4->_hasBodyContent)
    {
      v32 = objc_alloc_init(TPSTipContentLabel);
      contentLabel = v4->_contentLabel;
      v4->_contentLabel = v32;

      -[TPSTipContentLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TPSTipContentLabel setAdjustsFontForContentSizeCategory:](v4->_contentLabel, "setAdjustsFontForContentSizeCategory:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
      -[TPSTipContentLabel setTextColor:](v4->_contentLabel, "setTextColor:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultTextLabelFont](TPSAppearance, "defaultTextLabelFont"));
      -[TPSTipContentLabel setFont:](v4->_contentLabel, "setFont:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[TPSTipContentLabel setBackgroundColor:](v4->_contentLabel, "setBackgroundColor:", v36);

      -[TPSTipContentLabel setNumberOfLines:](v4->_contentLabel, "setNumberOfLines:", 0);
      -[TPSTipContentLabel setLineBreakMode:](v4->_contentLabel, "setLineBreakMode:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
      -[TPSTipContentLabel setTextColor:](v4->_contentLabel, "setTextColor:", v37);

      -[UIScrollView addSubview:](v4->_contentScrollView, "addSubview:", v4->_contentLabel);
      v38 = objc_alloc_init(TPSTipContentTextView);
      contentTextView = v4->_contentTextView;
      v4->_contentTextView = v38;

      -[TPSTipContentTextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TPSTipContentTextView setScrollEnabled:](v4->_contentTextView, "setScrollEnabled:", 0);
      -[TPSTipContentTextView _setInteractiveTextSelectionDisabled:](v4->_contentTextView, "_setInteractiveTextSelectionDisabled:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[TPSTipContentTextView setBackgroundColor:](v4->_contentTextView, "setBackgroundColor:", v40);

      -[TPSTipContentTextView setEditable:](v4->_contentTextView, "setEditable:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultTextLabelFont](TPSAppearance, "defaultTextLabelFont"));
      -[TPSTipContentTextView setFont:](v4->_contentTextView, "setFont:", v41);

      -[TPSTipContentTextView setDataDetectorTypes:](v4->_contentTextView, "setDataDetectorTypes:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView textContainer](v4->_contentTextView, "textContainer"));
      objc_msgSend(v42, "setHeightTracksTextView:", 1);

      -[TPSTipContentTextView setDelegate:](v4->_contentTextView, "setDelegate:", v4);
      -[TPSTipContentTextView setOpaque:](v4->_contentTextView, "setOpaque:", 1);
      -[TPSTipContentTextView setHidden:](v4->_contentTextView, "setHidden:", 1);
      -[TPSTipContentTextView setTextContainerInset:](v4->_contentTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView textContainer](v4->_contentTextView, "textContainer"));
      objc_msgSend(v43, "setLineFragmentPadding:", 0.0);

      -[UIScrollView addSubview:](v4->_contentScrollView, "addSubview:", v4->_contentTextView);
    }

  }
  if (+[TPSCommonDefines isInternalBuild](TPSCommonDefines, "isInternalBuild"))
  {
    -[UIScrollView setUserInteractionEnabled:](v4->_contentScrollView, "setUserInteractionEnabled:", 1);
    v44 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "handleTripleTapInternalGesture:");
    objc_msgSend(v44, "setNumberOfTapsRequired:", 3);
    -[TPSTipContentLabel setUserInteractionEnabled:](v4->_contentLabel, "setUserInteractionEnabled:", 1);
    -[TPSTipContentLabel addGestureRecognizer:](v4->_contentLabel, "addGestureRecognizer:", v44);
    v45 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "handleTripleTapInternalGesture:");
    objc_msgSend(v45, "setNumberOfTapsRequired:", 3);
    -[TPSTipContentTextView setUserInteractionEnabled:](v4->_contentTextView, "setUserInteractionEnabled:", 1);
    -[TPSTipContentTextView addGestureRecognizer:](v4->_contentTextView, "addGestureRecognizer:", v45);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[TPSBaseTipCollectionViewCell resetVideoPlayer](self, "resetVideoPlayer");
  -[TPSBaseTipCollectionViewCell setParallaxOffset:](self, "setParallaxOffset:", CGPointZero.x, CGPointZero.y);
  v3.receiver = self;
  v3.super_class = (Class)TPSBaseTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
}

- (void)scrollToTop
{
  UIScrollView *contentScrollView;
  double v4;

  contentScrollView = self->_contentScrollView;
  if (contentScrollView)
  {
    if ((id)-[UIScrollView contentInsetAdjustmentBehavior](contentScrollView, "contentInsetAdjustmentBehavior") != (id)2)
    {
      -[TPSBaseTipCollectionViewCell contentSafeAreaInsets](self, "contentSafeAreaInsets");
      -[UIScrollView setContentOffset:](self->_contentScrollView, "setContentOffset:", 0.0, -v4);
    }
  }
}

- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3
{
  double v3;

  self->_contentSafeAreaInsets = a3;
  if (a3.bottom == 0.0)
    v3 = -30.0 - self->_additionalBottomOffset;
  else
    v3 = -20.0 - a3.bottom;
  if (self->_bottomPadding != v3)
  {
    self->_bottomPadding = v3;
    -[TPSBaseTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TPSTipContentTextView setTipID:](self->_contentTextView, "setTipID:", 0);
  -[TPSTipContentLabel setTipID:](self->_contentLabel, "setTipID:", 0);
  -[TPSTipContentLabel setAttributedText:](self->_contentLabel, "setAttributedText:", 0);
  -[TPSTipContentTextView setAttributedText:](self->_contentTextView, "setAttributedText:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v4, "updateAttributedString:forIdentifier:", 0, v6);

  -[TPSBaseTipCollectionViewCell updateFonts](self, "updateFonts");
  -[TPSBaseTipCollectionViewCell updateContentLabel](self, "updateContentLabel");
  -[TPSBaseTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setParallaxOffset:(CGPoint)a3
{
  if (self->_parallaxOffset.x != a3.x || self->_parallaxOffset.y != a3.y)
  {
    self->_parallaxOffset = a3;
    -[NSLayoutConstraint setConstant:](self->_assetViewLayoutGuideCenterXConstraint, "setConstant:", a3.x * self->_imageParallaxMultiplier);
  }
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v7;
  id v8;
  TPSTip **p_tip;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  _BOOL4 v27;
  void *v28;
  NSDate *v29;
  NSDate *animationInitialLoadTime;
  NSBlockOperation *contentTextOperation;
  NSString *contentTextOperationID;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  id v43;
  id v45;

  v7 = a3;
  v8 = a4;
  p_tip = &self->_tip;
  v10 = -[TPSTip isEqual:](self->_tip, "isEqual:", v7);
  objc_msgSend(v8, "size");
  v12 = v11;
  v14 = v13;
  width = self->_cacheCellSize.width;
  height = self->_cacheCellSize.height;
  objc_storeStrong((id *)&self->_cellAppearance, a4);
  objc_storeStrong((id *)&self->_tip, a3);
  if ((-[TPSTip hasImage](self->_tip, "hasImage") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView imageView](self->_heroAssetView, "imageView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));
    -[TPSBaseTipCollectionViewCell setHeroImageUpdated:](self, "setHeroImageUpdated:", v18 != 0);

  }
  else
  {
    -[TPSBaseTipCollectionViewCell setHeroImageUpdated:](self, "setHeroImageUpdated:", 1);
  }
  -[TPSBaseTipCollectionViewCell setBodyContentProcessingCount:](self, "setBodyContentProcessingCount:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip bodyText](*p_tip, "bodyText"));

  if (!v19)
  {
    v45 = v8;
    v20 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributedStringForIdentifier:", v23));

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip bodyContent](*p_tip, "bodyContent"));

      if (v25)
        -[TPSBaseTipCollectionViewCell setBodyContentProcessingCount:](self, "setBodyContentProcessingCount:", 1);
    }

    v7 = v20;
    v8 = v45;
  }
  -[TPSBaseTipCollectionViewCell updateAssetsConfiguration](self, "updateAssetsConfiguration");
  -[TPSBaseTipCollectionViewCell updateVideoPath](self, "updateVideoPath");
  -[TPSBaseTipCollectionViewCell updateAssetViewBackground](self, "updateAssetViewBackground");
  if (v12 == width)
    v26 = v10 ^ 1;
  else
    v26 = 1;
  if (v14 == height)
    v27 = v26;
  else
    v27 = 1;
  if (v27)
  {
    -[TPSBaseTipCollectionViewCell scrollToTop](self, "scrollToTop");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip title](*p_tip, "title"));
    -[UILabel setText:](self->_titleLabel, "setText:", v28);

    self->_hasNotifiedDelegateContentLoaded = 0;
    self->_contentFinishedLoading = 0;
    v29 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    animationInitialLoadTime = self->_animationInitialLoadTime;
    self->_animationInitialLoadTime = v29;

    -[NSBlockOperation cancel](self->_contentTextOperation, "cancel");
    contentTextOperation = self->_contentTextOperation;
    self->_contentTextOperation = 0;

    contentTextOperationID = self->_contentTextOperationID;
    self->_contentTextOperationID = 0;

    objc_msgSend(v8, "size");
    self->_cacheCellSize.width = v33;
    self->_cacheCellSize.height = v34;
    -[TPSBaseTipCollectionViewCell updateAssetIfAllowed](self, "updateAssetIfAllowed");
    if ((v10 & 1) == 0 && self->_hasBodyContent)
    {
      -[TPSTipContentTextView setTipID:](self->_contentTextView, "setTipID:", 0);
      -[TPSTipContentTextView setHidden:](self->_contentTextView, "setHidden:", 1);
      -[TPSTipContentTextView setAttributedText:](self->_contentTextView, "setAttributedText:", 0);
      -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
      -[TPSBaseTipCollectionViewCell setNeedsTextView:](self, "setNeedsTextView:", objc_msgSend(v7, "containsLinks"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bodyText"));

      if (v36)
      {
        -[TPSBaseTipCollectionViewCell updateContentLabel](self, "updateContentLabel");
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
        objc_msgSend(v37, "setTipID:", 0);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
        objc_msgSend(v38, "setText:", 0);

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
        objc_msgSend(v39, "setAttributedText:", 0);

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
        objc_msgSend(v40, "setHidden:", 1);

      }
    }
  }
  if (-[TPSBaseTipCollectionViewCell bodyContentProcessingCount](self, "bodyContentProcessingCount"))
    v41 = 0;
  else
    v41 = -[TPSBaseTipCollectionViewCell heroImageUpdated](self, "heroImageUpdated");
  -[TPSBaseTipCollectionViewCell setImageLoadingFinished:](self, "setImageLoadingFinished:", v41);
  if ((-[TPSTip hasVideo](*p_tip, "hasVideo") & 1) == 0)
  {
    -[TPSBaseTipCollectionViewCell setVideoLoadingFinished:](self, "setVideoLoadingFinished:", 1);
    if (!v27)
      goto LABEL_26;
LABEL_28:
    v43 = -[TPSTip hasVideo](*p_tip, "hasVideo");
    goto LABEL_29;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView downloadedVideoPath](self->_heroAssetView, "downloadedVideoPath"));
  -[TPSBaseTipCollectionViewCell setVideoLoadingFinished:](self, "setVideoLoadingFinished:", v42 != 0);

  if (v27)
    goto LABEL_28;
LABEL_26:
  v43 = 0;
LABEL_29:
  -[TPSBaseTipCollectionViewCell setShouldLogAnimationFinished:](self, "setShouldLogAnimationFinished:", v43);

  return v27;
}

- (id)imagePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetsConfiguration](self, "assetsConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v2, 0));

  return v3;
}

- (void)updateVideoPath
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetsConfiguration](self, "assetsConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheIdentifierForType:", 1));
  -[TPSVideoAssetView setCacheVideoIdentifier:](self->_heroAssetView, "setCacheVideoIdentifier:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetsConfiguration](self, "assetsConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v6, 1));
  -[TPSVideoAssetView setVideoPath:](self->_heroAssetView, "setVideoPath:", v5);

}

- (void)updateAssetViewBackground
{
  UIColor *noImageBackgroundColorOverride;
  UIColor *v4;
  UIColor *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultBackgroundColor](TPSAppearance, "defaultBackgroundColor"));
  noImageBackgroundColorOverride = self->_noImageBackgroundColorOverride;
  if (noImageBackgroundColorOverride)
    v4 = noImageBackgroundColorOverride;
  else
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue(+[TPSAppearance secondaryBackgroundColor](TPSAppearance, "secondaryBackgroundColor"));
  v5 = v4;
  -[TPSVideoAssetView setDefaultBackgroundColor:](self->_heroAssetView, "setDefaultBackgroundColor:", v6);
  -[TPSVideoAssetView setNoImageBackgroundColor:](self->_heroAssetView, "setNoImageBackgroundColor:", v5);

}

- (void)updateAssetIfAllowed
{
  id WeakRetained;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TPSVideoAssetView cancel](self->_heroAssetView, "cancel");
  -[TPSVideoAssetView setImage:](self->_heroAssetView, "setImage:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "tipCollectionViewCellCanDisplayAssets:", self);

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetsConfiguration](self, "assetsConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheIdentifierForType:", 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSImageAssetController imageFromMemoryCacheForIdentifier:](TPSImageAssetController, "imageFromMemoryCacheForIdentifier:", v6));
    if (v7)
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPSImageAssetController dataCacheForIdentifier:](TPSImageAssetController, "dataCacheForIdentifier:", v6));

      if (!v8)
        return;
    }
  }
  -[TPSBaseTipCollectionViewCell updateImageView](self, "updateImageView");
}

- (void)updateImageView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell imagePath](self, "imagePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetsConfiguration](self, "assetsConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheIdentifierForType:", 0));

  -[TPSVideoAssetView fetchImageWithIdentifier:path:](self->_heroAssetView, "fetchImageWithIdentifier:path:", v4, v5);
}

- (void)updateAssetsConfiguration
{
  unsigned int v3;
  TPSTipCellAppearance *cellAppearance;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = -[TPSTip isTip](self->_tip, "isTip");
  cellAppearance = self->_cellAppearance;
  if (v3)
    v5 = -[TPSTipCellAppearance isCompactLayout](cellAppearance, "isCompactLayout");
  else
    v5 = -[TPSTipCellAppearance isBookendsCompactLayout](cellAppearance, "isBookendsCompactLayout");
  if (v5)
    v6 = 1;
  else
    v6 = 2;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSUIAppController sharedInstance](TPSUIAppController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fullContentAssets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "language"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell cellAppearance](self, "cellAppearance"));
  v11 = objc_msgSend(v10, "userInterfaceStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetFileInfoManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetConfigurationForAssets:language:sizeClass:style:assetFileInfoManager:", v8, v9, v6, v11, v13));

  -[TPSBaseTipCollectionViewCell setAssetsConfiguration:](self, "setAssetsConfiguration:", v14);
}

- (void)updateFonts
{
  void *v3;
  _BOOL4 IsAccessibilityCategory;
  float *v5;
  NSString *category;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  category = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  v5 = (float *)&kTPSHyphenationFactorAccessibility;
  if (!IsAccessibilityCategory)
    v5 = (float *)&kTPSHyphenationFactorDefault;
  self->_labelHyphenationFactor = *v5;
  -[TPSBaseTipCollectionViewCell labelHyphenationFactor](self, "labelHyphenationFactor");
  -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:");

}

- (UIFont)titleFont
{
  return (UIFont *)+[TPSAppearance titleLabelFont](TPSAppearance, "titleLabelFont");
}

- (void)updateLoadingStatus
{
  id WeakRetained;

  if (!self->_hasNotifiedDelegateContentLoaded)
  {
    if (self->_imageLoadingFinished && self->_videoLoadingFinished)
    {
      self->_contentFinishedLoading = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "cellContentLoaded:", self);

      self->_hasNotifiedDelegateContentLoaded = 1;
    }
    -[TPSBaseTipCollectionViewCell updateHeroHeightConstraint](self, "updateHeroHeightConstraint");
  }
}

- (void)contentLayoutChanged:(id)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

  if (v6 != v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell delegate](self, "delegate"));
    objc_msgSend(v8, "tipCollectionViewCellContentLayoutChanged:", self);

  }
}

- (void)setNeedsTextView:(BOOL)a3
{
  _BOOL8 v4;
  int *v5;
  int *v6;
  void *v7;
  id v8;
  id v9;

  if (self->_hasBodyContent)
  {
    v4 = a3;
    self->_needsTextView = a3;
    -[NSLayoutConstraint setActive:](self->_actionButtonTextLabelTopConstraint, "setActive:", !a3);
    -[NSLayoutConstraint setActive:](self->_actionButtonTextViewTopConstraint, "setActive:", v4);
    v5 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentTextViewConstraints;
    if (v4)
      v6 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentLabelConstraints;
    else
      v6 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentTextViewConstraints;
    v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v6);
    if (!v4)
      v5 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentLabelConstraints;
    v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v5);
    v9 = v7;
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v9);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

  }
  else
  {
    self->_needsTextView = 0;
  }
}

- (void)loadContentIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView image](self->_heroAssetView, "image"));

  if (!v3)
    -[TPSBaseTipCollectionViewCell updateImageView](self, "updateImageView");
  -[TPSBaseTipCollectionViewCell playVideo](self, "playVideo");
}

- (void)logAnimationFinished
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[TPSBaseTipCollectionViewCell shouldLogAnimationFinished](self, "shouldLogAnimationFinished"))
  {
    if (self->_contentFinishedLoading)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v4 = -[TPSBaseTipCollectionViewCell videoHasFinished](self, "videoHasFinished");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell animationSource](self, "animationSource"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIdentifiers"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "correlationID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAnimationFinished eventWithTipID:animationFinished:animationSource:collectionID:correlationID:](TPSAnalyticsEventAnimationFinished, "eventWithTipID:animationFinished:animationSource:collectionID:correlationID:", v3, v4, v5, v8, v10));
      objc_msgSend(v11, "log");

      -[TPSBaseTipCollectionViewCell setShouldLogAnimationFinished:](self, "setShouldLogAnimationFinished:", 0);
    }
  }
}

- (void)updateAttributedStringWithCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *p_contentTextView;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedStringForIdentifier:", v5));

  if (v15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell uniqueIdentifierForCurrentTip](self, "uniqueIdentifierForCurrentTip"));
    if (-[TPSTip containsLinks](self->_tip, "containsLinks"))
    {
      p_contentTextView = (id *)&self->_contentTextView;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView tipID](self->_contentTextView, "tipID"));
      v9 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v9 & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentTextView](self, "contentTextView"));
        objc_msgSend(v10, "setAttributedText:", v15);

        objc_msgSend(*p_contentTextView, "setTipID:", v6);
      }
      if ((objc_msgSend(*p_contentTextView, "isHidden") & 1) == 0)
        goto LABEL_12;
    }
    else
    {
      p_contentTextView = (id *)&self->_contentLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentLabel tipID](self->_contentLabel, "tipID"));
      v12 = objc_msgSend(v11, "isEqualToString:", v6);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(*p_contentTextView, "setAttributedText:", v15);
        objc_msgSend(*p_contentTextView, "setTipID:", v6);
      }
      if (!objc_msgSend(*p_contentTextView, "isHidden"))
        goto LABEL_12;
    }
    v13 = *p_contentTextView;
    if (v13)
    {
      v14 = v13;
      -[TPSBaseTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      objc_msgSend(v14, "setHidden:", 0);
      objc_msgSend(v14, "setAlpha:", 1.0);

    }
LABEL_12:

  }
  -[TPSBaseTipCollectionViewCell updateActionButton](self, "updateActionButton");
  -[TPSBaseTipCollectionViewCell updateImageReadyStatus](self, "updateImageReadyStatus");

}

- (void)updateActionButton
{
  void *v3;
  id v4;
  UIButton *actionButton;
  UIButton *v6;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  char **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *actionButtonWidthConstraint;
  double v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *actionButtonHeightConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *actionButtonTextLabelTopConstraint;
  double v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *actionButtonBottomConstraint;
  double v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *actionButtonTextViewTopConstraint;
  double v42;
  void *v43;
  void *v44;
  _BOOL8 v45;

  if (self->_hasBodyContent)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip actions](self->_tip, "actions"));
    v4 = objc_msgSend(v3, "count");

    actionButton = self->_actionButton;
    if (v4)
    {
      if (!actionButton)
      {
        v6 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
        v7 = self->_actionButton;
        self->_actionButton = v6;

        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, "actionButtonTapped", 64);
        actionButton = self->_actionButton;
      }
      if (-[UIButton isHidden](actionButton, "isHidden"))
        -[UIButton setHidden:](self->_actionButton, "setHidden:", 0);
      -[UIButton setEnabled:](self->_actionButton, "setEnabled:", !self->_isSharedVariant);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_actionButton, "configuration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip actions](self->_tip, "actions"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
      v13 = objc_msgSend(v9, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
        -[TPSBaseTipCollectionViewCell setupActionButtonConfiguration](self, "setupActionButtonConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton superview](self->_actionButton, "superview"));

      v15 = &selRef_contentSizeCategoryDidChange_;
      if (!v14)
      {
        -[UIScrollView addSubview:](self->_contentScrollView, "addSubview:", self->_actionButton);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView frameLayoutGuide](self->_contentScrollView, "frameLayoutGuide"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->_actionButton, "centerXAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
        objc_msgSend(v19, "setActive:", 1);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_actionButton, "widthAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
        v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v21, 1.0, 0.0));
        actionButtonWidthConstraint = self->_actionButtonWidthConstraint;
        self->_actionButtonWidthConstraint = v22;

        LODWORD(v24) = 1148846080;
        -[UIButton setContentCompressionResistancePriority:forAxis:](self->_actionButton, "setContentCompressionResistancePriority:forAxis:", 1, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_actionButton, "heightAnchor"));
        v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToConstant:", 20.0));
        actionButtonHeightConstraint = self->_actionButtonHeightConstraint;
        self->_actionButtonHeightConstraint = v26;

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_actionButton, "topAnchor"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentLabel bottomAnchor](self->_contentLabel, "bottomAnchor"));
        v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 16.0));
        actionButtonTextLabelTopConstraint = self->_actionButtonTextLabelTopConstraint;
        self->_actionButtonTextLabelTopConstraint = v30;

        LODWORD(v32) = 1148829696;
        -[NSLayoutConstraint setPriority:](self->_actionButtonTextLabelTopConstraint, "setPriority:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_actionButton, "bottomAnchor"));
        v15 = &selRef_contentSizeCategoryDidChange_;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_contentScrollView, "bottomAnchor"));
        v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, self->_bottomPadding));
        actionButtonBottomConstraint = self->_actionButtonBottomConstraint;
        self->_actionButtonBottomConstraint = v35;

        LODWORD(v37) = 1148846080;
        -[NSLayoutConstraint setPriority:](self->_actionButtonBottomConstraint, "setPriority:", v37);

      }
      if (self->_contentTextView && !self->_actionButtonTextViewTopConstraint)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_actionButton, "topAnchor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView bottomAnchor](self->_contentTextView, "bottomAnchor"));
        v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 16.0));
        actionButtonTextViewTopConstraint = self->_actionButtonTextViewTopConstraint;
        self->_actionButtonTextViewTopConstraint = v40;

        LODWORD(v42) = 1148846080;
        -[NSLayoutConstraint setPriority:](self->_actionButtonTextViewTopConstraint, "setPriority:", v42);
      }
      -[NSLayoutConstraint setActive:](self->_actionButtonWidthConstraint, "setActive:", 1);
      -[NSLayoutConstraint setActive:](self->_actionButtonHeightConstraint, "setActive:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "footnoteContent"));
      if (v44)
        v45 = 0;
      else
        v45 = !self->_isSharedVariant;
      -[NSLayoutConstraint setActive:](self->_actionButtonBottomConstraint, "setActive:", v45);

      -[NSLayoutConstraint setActive:](self->_actionButtonTextLabelTopConstraint, "setActive:", -[TPSTipContentLabel isHidden](self->_contentLabel, "isHidden") ^ 1);
      -[NSLayoutConstraint setActive:](self->_actionButtonTextViewTopConstraint, "setActive:", -[NSLayoutConstraint isActive](self->_actionButtonTextLabelTopConstraint, "isActive") ^ 1);
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *((int *)v15 + 334)), "setNeedsLayout");
    }
    else
    {
      -[UIButton setHidden:](actionButton, "setHidden:", 1);
      -[NSLayoutConstraint setActive:](self->_actionButtonTextLabelTopConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_actionButtonTextViewTopConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_actionButtonWidthConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_actionButtonBottomConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_actionButtonHeightConstraint, "setActive:", 0);
    }
  }
}

- (void)actionButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip actions](self->_tip, "actions"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
  -[TPSBaseTipCollectionViewCell handleTipsURL:](self, "handleTipsURL:", v4);

}

- (BOOL)handleTipsURL:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  id v20;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Links tapped inside content %@", (uint8_t *)&v19, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tipCollectionViewCell:linkTappedForURL:", self, v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLActionComponents componentsWithURL:](TPSURLActionComponents, "componentsWithURL:", v4));
    v8 = objc_msgSend(v7, "actionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v11 = (void *)v10;
    switch((unint64_t)v8)
    {
      case 1uLL:
        if (v10)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          objc_msgSend(v14, "openApplicationWithBundleID:", v11);
          goto LABEL_19;
        }
        break;
      case 2uLL:
      case 3uLL:
      case 4uLL:
        if (v9)
        {
          v12 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v19 = 138412290;
            v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Open url with %@", (uint8_t *)&v19, 0xCu);
          }

          -[TPSBaseTipCollectionViewCell handleURL:](self, "handleURL:", v9);
        }
        break;
      case 5uLL:
      case 6uLL:
        if (v9)
        {
          v13 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v13, "tipCollectionViewCell:showSafariViewForURL:", self, v9);
          goto LABEL_21;
        }
        break;
      case 7uLL:
        if (v9)
        {
          v13 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v13, "tipCollectionViewCell:showVideoForURL:", self, v9);
          goto LABEL_21;
        }
        break;
      case 9uLL:
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        objc_msgSend(v13, "tipCollectionViewCell:showUserGuideWithIdentifier:topicId:", self, v15, v16);

        goto LABEL_21;
      case 0xBuLL:
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "tipCollectionViewCell:showTryItModeForURL:", self, v4);
LABEL_21:

        break;
      default:
        v17 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          v20 = v4;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Open safari for URL %@", (uint8_t *)&v19, 0xCu);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        objc_msgSend(v14, "openURL:options:completionHandler:", v4, &__NSDictionary0__struct, 0);
LABEL_19:

        break;
    }

  }
  return 0;
}

- (void)setupActionButtonConfiguration
{
  void *v3;
  id v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  UIButton *v14;
  UIButton *actionButton;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip actions](self->_tip, "actions"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (-[TPSTip isChecklistTip](self->_tip, "isChecklistTip")
    && (-[TPSTip isCompleted](self->_tip, "isCompleted") & 1) == 0)
  {
    actionButton = self->_actionButton;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip actions](self->_tip, "actions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setupActionButtonConfigurationWithTitle:foregroundColor:backgroundColor:](actionButton, "setupActionButtonConfigurationWithTitle:foregroundColor:backgroundColor:", v8, v16, v17);

    goto LABEL_8;
  }
  v4 = objc_msgSend(v18, "type");
  v5 = self->_actionButton;
  if (v4 == (id)11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setupActionButtonConfigurationWithTitle:foregroundColor:backgroundColor:symbolName:fontWeight:](v5, "setupActionButtonConfigurationWithTitle:foregroundColor:backgroundColor:symbolName:fontWeight:", v6, v7, v8, CFSTR("hand.draw.fill"), UIFontWeightSemibold);
LABEL_8:

    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_actionButton, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  v13 = v18;
  if ((v12 & 1) == 0)
  {
    v14 = self->_actionButton;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
    -[UIButton setupActionButtonConfigurationWithTitle:isEnabled:](v14, "setupActionButtonConfigurationWithTitle:isEnabled:", v6, -[UIButton isEnabled](self->_actionButton, "isEnabled"));
LABEL_9:

    v13 = v18;
  }

}

- (id)uniqueIdentifierForCurrentTip
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v6 == (id)2)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("-Dark")));

    v4 = (void *)v7;
  }
  return v4;
}

- (void)removeContentParser
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentParser](self, "contentParser"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentParser](self, "contentParser"));
  objc_msgSend(v4, "cancelAssetFetches");

  -[TPSBaseTipCollectionViewCell setContentParser:](self, "setContentParser:", 0);
}

- (void)updateContentLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSBlockOperation *contentTextOperation;
  NSBlockOperation *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSBlockOperation *v15;
  NSBlockOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSBlockOperation *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  id v36;
  id from;
  id location;
  _QWORD v39[2];
  _QWORD v40[2];

  if (self->_hasBodyContent)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedStringForIdentifier:", v5));

    if (v6)
    {
      -[TPSBaseTipCollectionViewCell updateAttributedStringWithCache](self, "updateAttributedStringWithCache");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell uniqueIdentifierForCurrentTip](self, "uniqueIdentifierForCurrentTip"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bodyContent"));

      if (v9)
      {
        if ((objc_msgSend(v7, "isEqualToString:", self->_contentTextOperationID) & 1) == 0)
        {
          contentTextOperation = self->_contentTextOperation;
          if (contentTextOperation)
          {
            -[NSBlockOperation cancel](contentTextOperation, "cancel");
            v11 = self->_contentTextOperation;
            self->_contentTextOperation = 0;

          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
          v13 = objc_msgSend(v12, "containsLinks");

          if (v13)
          {
            v14 = -[TPSBaseTipCollectionViewCell contentTextView](self, "contentTextView");
            -[TPSBaseTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
          }
          v15 = (NSBlockOperation *)objc_alloc_init((Class)NSBlockOperation);
          v16 = self->_contentTextOperation;
          self->_contentTextOperation = v15;

          objc_storeStrong((id *)&self->_contentTextOperationID, v7);
          objc_initWeak(&location, self);
          objc_initWeak(&from, v7);
          v39[0] = NSFontAttributeName;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultTextLabelFont](TPSAppearance, "defaultTextLabelFont"));
          v40[0] = v17;
          v39[1] = NSForegroundColorAttributeName;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
          v40[1] = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));

          -[TPSBaseTipCollectionViewCell removeContentParser](self, "removeContentParser");
          v20 = objc_alloc_init((Class)TPSConstellationContentParser);
          -[TPSBaseTipCollectionViewCell setContentParser:](self, "setContentParser:", v20);

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell traitCollection](self, "traitCollection"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentParser](self, "contentParser"));
          objc_msgSend(v22, "setTraitCollection:", v21);

          v23 = self->_contentTextOperation;
          v30 = _NSConcreteStackBlock;
          v31 = 3221225472;
          v32 = sub_10001D594;
          v33 = &unk_1000A2938;
          objc_copyWeak(&v35, &location);
          v24 = v19;
          v34 = v24;
          objc_copyWeak(&v36, &from);
          -[NSBlockOperation addExecutionBlock:](v23, "addExecutionBlock:", &v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[TPSBaseTipCollectionViewCell attributedStringOperationQueue](TPSBaseTipCollectionViewCell, "attributedStringOperationQueue", v30, v31, v32, v33));
          objc_msgSend(v25, "addOperation:", self->_contentTextOperation);

          objc_destroyWeak(&v36);
          objc_destroyWeak(&v35);

          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip bodyText](self->_tip, "bodyText"));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentLabel tipID](self->_contentLabel, "tipID"));
          v28 = objc_msgSend(v27, "isEqualToString:", v7);

          if ((v28 & 1) == 0)
          {
            -[TPSTipContentLabel setTipID:](self->_contentLabel, "setTipID:", v7);
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip bodyText](self->_tip, "bodyText"));
            -[TPSTipContentLabel setText:](self->_contentLabel, "setText:", v29);

          }
          if (-[TPSTipContentLabel isHidden](self->_contentLabel, "isHidden"))
            -[TPSTipContentLabel setHidden:](self->_contentLabel, "setHidden:", 0);
          -[TPSBaseTipCollectionViewCell updateActionButton](self, "updateActionButton");
        }
      }

    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double x;
  double y;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSBaseTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell applyLayoutAttributes:](&v9, "applyLayoutAttributes:", v4);
  v6 = objc_opt_class(TPSCollectionViewLayoutAttributes, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    objc_msgSend(v4, "parallaxOffset");
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  -[TPSBaseTipCollectionViewCell setParallaxOffset:](self, "setParallaxOffset:", x, y);

}

- (void)updateConstraints
{
  double v3;
  objc_super v4;

  -[TPSTipCellAppearance contentSidePadding](self->_cellAppearance, "contentSidePadding");
  -[NSLayoutConstraint setConstant:](self->_actionButtonWidthConstraint, "setConstant:", v3 * -2.0);
  if (!-[TPSBaseTipCollectionViewCell isSharedVariant](self, "isSharedVariant"))
    -[NSLayoutConstraint setConstant:](self->_actionButtonBottomConstraint, "setConstant:", self->_bottomPadding);
  -[TPSBaseTipCollectionViewCell updateHeroHeightConstraint](self, "updateHeroHeightConstraint");
  v4.receiver = self;
  v4.super_class = (Class)TPSBaseTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell updateConstraints](&v4, "updateConstraints");
}

- (void)updateHeroHeightConstraint
{
  double v3;
  double v4;
  TPSVideoAssetView *heroAssetView;
  void *v6;
  _BOOL4 isSharedVariant;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  double v15;

  -[TPSTipCellAppearance assetHeight](self->_cellAppearance, "assetHeight");
  v4 = v3;
  if (self->_cellAppearance)
  {
    heroAssetView = self->_heroAssetView;
    if (heroAssetView)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView image](heroAssetView, "image"));
      if (v6)
      {
        isSharedVariant = self->_isSharedVariant;

        if (isSharedVariant)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView image](self->_heroAssetView, "image"));
          objc_msgSend(v8, "size");
          v10 = v9;
          v12 = v11;

          if (v12 > 0.0)
          {
            v13 = v10 / v12;
            if (+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI"))
            {
              -[TPSBaseTipCollectionViewCell bounds](self, "bounds");
              v14 = 0;
              v4 = v15 / v13;
            }
            else
            {
              v14 = v13 >= 1.0;
            }
            -[TPSVideoAssetView setAspectFillAsset:](self->_heroAssetView, "setAspectFillAsset:", v14);
          }
        }
      }
    }
  }
  -[NSLayoutConstraint setConstant:](self->_assetViewHeightConstraint, "setConstant:", v4);
}

- (BOOL)videoHasFinished
{
  return -[TPSVideoAssetView videoPlaybackFinished](self->_heroAssetView, "videoPlaybackFinished");
}

- (void)scrubVideoToFirstFrame
{
  -[TPSBaseTipCollectionViewCell logAnimationFinished](self, "logAnimationFinished");
  -[TPSVideoAssetView scrubVideoToFirstFrame](self->_heroAssetView, "scrubVideoToFirstFrame");
}

- (void)continuePlayVideo
{
  -[TPSVideoAssetView continuePlayVideo](self->_heroAssetView, "continuePlayVideo");
  -[TPSBaseTipCollectionViewCell setShouldLogAnimationFinished:](self, "setShouldLogAnimationFinished:", 1);
}

- (void)resetVideoPlayer
{
  -[TPSVideoAssetView resetVideoPlayer](self->_heroAssetView, "resetVideoPlayer");
  -[TPSBaseTipCollectionViewCell logAnimationFinished](self, "logAnimationFinished");
}

- (void)playVideo
{
  -[TPSBaseTipCollectionViewCell setAnimationSource:](self, "setAnimationSource:", TPSAnimationSourceOrganic);
  -[TPSVideoAssetView playVideo](self->_heroAssetView, "playVideo");
}

- (void)replayVideo
{
  -[TPSBaseTipCollectionViewCell logAnimationFinished](self, "logAnimationFinished");
  -[TPSBaseTipCollectionViewCell setAnimationSource:](self, "setAnimationSource:", TPSAnimationSourceOther);
  -[TPSBaseTipCollectionViewCell setShouldLogAnimationFinished:](self, "setShouldLogAnimationFinished:", 1);
  -[TPSVideoAssetView replayVideo](self->_heroAssetView, "replayVideo");
}

- (void)replayButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TPSBaseTipCollectionViewCell setAnimationSource:](self, "setAnimationSource:", TPSAnimationSourceReplay);
  -[TPSBaseTipCollectionViewCell setShouldLogAnimationFinished:](self, "setShouldLogAnimationFinished:", 1);
  -[TPSVideoAssetView replayVideo](self->_heroAssetView, "replayVideo");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "correlationID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventReplayButtonTapped eventWithTipID:collectionID:correlationID:](TPSAnalyticsEventReplayButtonTapped, "eventWithTipID:collectionID:correlationID:", v3, v6, v8));
  objc_msgSend(v9, "log");

}

- (void)loadBodyContentIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bodyContent"));
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributedText"));
  if (objc_msgSend(v6, "length"))
  {

LABEL_4:
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentTextView](self, "contentTextView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributedText"));
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    -[TPSBaseTipCollectionViewCell updateContentLabel](self, "updateContentLabel");
}

- (void)stopVideoPlayer
{
  -[TPSVideoAssetView stopVideoPlayer](self->_heroAssetView, "stopVideoPlayer");
}

- (void)updateAssetPaths
{
  -[TPSBaseTipCollectionViewCell stopVideoPlayer](self, "stopVideoPlayer");
  -[TPSBaseTipCollectionViewCell updateAssetsConfiguration](self, "updateAssetsConfiguration");
  -[TPSBaseTipCollectionViewCell updateAssetIfAllowed](self, "updateAssetIfAllowed");
  -[TPSBaseTipCollectionViewCell updateVideoPath](self, "updateVideoPath");
  -[TPSBaseTipCollectionViewCell updateAssetViewBackground](self, "updateAssetViewBackground");
}

- (void)updateImageReadyStatus
{
  if (!-[TPSBaseTipCollectionViewCell bodyContentProcessingCount](self, "bodyContentProcessingCount"))
  {
    if (-[TPSBaseTipCollectionViewCell heroImageUpdated](self, "heroImageUpdated"))
    {
      -[TPSBaseTipCollectionViewCell setImageLoadingFinished:](self, "setImageLoadingFinished:", 1);
      -[TPSBaseTipCollectionViewCell updateLoadingStatus](self, "updateLoadingStatus");
    }
  }
}

- (void)imageAssetViewImageUpdated:(id)a3
{
  if (self->_heroAssetView == a3)
  {
    -[TPSBaseTipCollectionViewCell setHeroImageUpdated:](self, "setHeroImageUpdated:", 1);
    -[TPSBaseTipCollectionViewCell updateImageReadyStatus](self, "updateImageReadyStatus");
  }
}

- (BOOL)videoAssetViewCanDisplayAssets:(id)a3
{
  TPSBaseTipCollectionViewCell *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "tipCollectionViewCellCanDisplayAssets:", v3);

  return (char)v3;
}

- (void)videoAssetViewUpdateAssetLoadingFinished:(id)a3 error:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TPSBaseTipCollectionViewCell setVideoLoadingFinished:](self, "setVideoLoadingFinished:", 1);
  -[TPSBaseTipCollectionViewCell updateLoadingStatus](self, "updateLoadingStatus");
  if (!a4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v7, "timeIntervalSinceDate:", self->_animationInitialLoadTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAnimationLoadTime eventWithTipID:animationLoadTime:](TPSAnalyticsEventAnimationLoadTime, "eventWithTipID:animationLoadTime:", v6));
    objc_msgSend(v8, "log");

  }
}

- (void)constellationContentParserAttributedStringUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributedString"));
    objc_msgSend(v8, "updateAttributedString:forIdentifier:", v9, v4);

    -[TPSTipContentTextView setTipID:](self->_contentTextView, "setTipID:", 0);
    -[TPSTipContentLabel setTipID:](self->_contentLabel, "setTipID:", 0);
    -[TPSTipContentTextView setAttributedText:](self->_contentTextView, "setAttributedText:", 0);
    -[TPSTipContentLabel setAttributedText:](self->_contentLabel, "setAttributedText:", 0);
    -[TPSBaseTipCollectionViewCell setBodyContentProcessingCount:](self, "setBodyContentProcessingCount:", objc_msgSend(v10, "numOfActiveRemoteURLSessions"));
    -[TPSBaseTipCollectionViewCell updateAttributedStringWithCache](self, "updateAttributedStringWithCache");
  }

}

- (id)constellationContentParserBoldFont:(id)a3
{
  return +[TPSAppearance boldTextFont](TPSAppearance, "boldTextFont", a3);
}

- (id)constellationContentParserItalicFont:(id)a3
{
  return +[TPSAppearance italicTextFont](TPSAppearance, "italicTextFont", a3);
}

- (BOOL)_textView:(id)a3 shouldHighlightForInteractionInRange:(_NSRange)a4
{
  return a4.length > 1;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isSharedVariant)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v13 = objc_msgSend(v11, "hasLocalVariant:", v12);

    if (v13)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001E2A8;
      v19[3] = &unk_1000A2960;
      v19[4] = self;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v19));
      v15 = v10;
LABEL_6:

      goto LABEL_7;
    }
  }
  v14 = v10;
  if (!objc_msgSend(v9, "contentType"))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001E358;
    v17[3] = &unk_1000A2988;
    v17[4] = self;
    v18 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v17));

    v15 = v18;
    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (void)handleTripleTapInternalGesture:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tipCollectionViewCellHandleTripleTapInternalGesture:", self);

}

- (TPSBaseTipCollectionViewCellDelegate)delegate
{
  return (TPSBaseTipCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasBodyContent
{
  return self->_hasBodyContent;
}

- (void)setHasBodyContent:(BOOL)a3
{
  self->_hasBodyContent = a3;
}

- (BOOL)needsTextView
{
  return self->_needsTextView;
}

- (BOOL)hasNotifiedDelegateContentLoaded
{
  return self->_hasNotifiedDelegateContentLoaded;
}

- (void)setHasNotifiedDelegateContentLoaded:(BOOL)a3
{
  self->_hasNotifiedDelegateContentLoaded = a3;
}

- (BOOL)contentFinishedLoading
{
  return self->_contentFinishedLoading;
}

- (void)setContentFinishedLoading:(BOOL)a3
{
  self->_contentFinishedLoading = a3;
}

- (BOOL)showImageOnLoadFail
{
  return self->_showImageOnLoadFail;
}

- (void)setShowImageOnLoadFail:(BOOL)a3
{
  self->_showImageOnLoadFail = a3;
}

- (BOOL)canShowMedia
{
  return self->_canShowMedia;
}

- (void)setCanShowMedia:(BOOL)a3
{
  self->_canShowMedia = a3;
}

- (BOOL)imageLoadingFinished
{
  return self->_imageLoadingFinished;
}

- (void)setImageLoadingFinished:(BOOL)a3
{
  self->_imageLoadingFinished = a3;
}

- (BOOL)videoLoadingFinished
{
  return self->_videoLoadingFinished;
}

- (void)setVideoLoadingFinished:(BOOL)a3
{
  self->_videoLoadingFinished = a3;
}

- (double)imageParallaxMultiplier
{
  return self->_imageParallaxMultiplier;
}

- (void)setImageParallaxMultiplier:(double)a3
{
  self->_imageParallaxMultiplier = a3;
}

- (double)additionalBottomOffset
{
  return self->_additionalBottomOffset;
}

- (void)setAdditionalBottomOffset:(double)a3
{
  self->_additionalBottomOffset = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (float)labelHyphenationFactor
{
  return self->_labelHyphenationFactor;
}

- (void)setLabelHyphenationFactor:(float)a3
{
  self->_labelHyphenationFactor = a3;
}

- (CGSize)cacheCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cacheCellSize.width;
  height = self->_cacheCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCacheCellSize:(CGSize)a3
{
  self->_cacheCellSize = a3;
}

- (UIEdgeInsets)contentSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentSafeAreaInsets.top;
  left = self->_contentSafeAreaInsets.left;
  bottom = self->_contentSafeAreaInsets.bottom;
  right = self->_contentSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)parallaxOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_parallaxOffset.x;
  y = self->_parallaxOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIColor)noImageBackgroundColorOverride
{
  return self->_noImageBackgroundColorOverride;
}

- (void)setNoImageBackgroundColorOverride:(id)a3
{
  objc_storeStrong((id *)&self->_noImageBackgroundColorOverride, a3);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (NSLayoutConstraint)actionButtonBottomConstraint
{
  return self->_actionButtonBottomConstraint;
}

- (void)setActionButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonBottomConstraint, a3);
}

- (TPSTip)tip
{
  return self->_tip;
}

- (void)setTip:(id)a3
{
  objc_storeStrong((id *)&self->_tip, a3);
}

- (TPSVideoAssetView)heroAssetView
{
  return self->_heroAssetView;
}

- (void)setHeroAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_heroAssetView, a3);
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (TPSTipCellAppearance)cellAppearance
{
  return self->_cellAppearance;
}

- (void)setCellAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_cellAppearance, a3);
}

- (TPSTipContentLabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabel, a3);
}

- (TPSTipContentTextView)contentTextView
{
  return self->_contentTextView;
}

- (void)setContentTextView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTextView, a3);
}

- (NSLayoutConstraint)assetViewLayoutGuideCenterXConstraint
{
  return self->_assetViewLayoutGuideCenterXConstraint;
}

- (void)setAssetViewLayoutGuideCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_assetViewLayoutGuideCenterXConstraint, a3);
}

- (NSLayoutConstraint)assetViewHeightConstraint
{
  return self->_assetViewHeightConstraint;
}

- (void)setAssetViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_assetViewHeightConstraint, a3);
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_contentScrollView, a3);
}

- (NSArray)contentLabelConstraints
{
  return self->_contentLabelConstraints;
}

- (void)setContentLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabelConstraints, a3);
}

- (NSArray)contentTextViewConstraints
{
  return self->_contentTextViewConstraints;
}

- (void)setContentTextViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentTextViewConstraints, a3);
}

- (BOOL)isSharedVariant
{
  return self->_isSharedVariant;
}

- (void)setIsSharedVariant:(BOOL)a3
{
  self->_isSharedVariant = a3;
}

- (BOOL)heroImageUpdated
{
  return self->_heroImageUpdated;
}

- (void)setHeroImageUpdated:(BOOL)a3
{
  self->_heroImageUpdated = a3;
}

- (BOOL)shouldLogAnimationFinished
{
  return self->_shouldLogAnimationFinished;
}

- (void)setShouldLogAnimationFinished:(BOOL)a3
{
  self->_shouldLogAnimationFinished = a3;
}

- (NSString)animationSource
{
  return self->_animationSource;
}

- (void)setAnimationSource:(id)a3
{
  self->_animationSource = (NSString *)a3;
}

- (int64_t)bodyContentProcessingCount
{
  return self->_bodyContentProcessingCount;
}

- (void)setBodyContentProcessingCount:(int64_t)a3
{
  self->_bodyContentProcessingCount = a3;
}

- (NSBlockOperation)contentTextOperation
{
  return self->_contentTextOperation;
}

- (void)setContentTextOperation:(id)a3
{
  objc_storeStrong((id *)&self->_contentTextOperation, a3);
}

- (NSString)contentTextOperationID
{
  return self->_contentTextOperationID;
}

- (void)setContentTextOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_contentTextOperationID, a3);
}

- (NSDate)animationInitialLoadTime
{
  return self->_animationInitialLoadTime;
}

- (void)setAnimationInitialLoadTime:(id)a3
{
  objc_storeStrong((id *)&self->_animationInitialLoadTime, a3);
}

- (TPSAssetsConfiguration)assetsConfiguration
{
  return self->_assetsConfiguration;
}

- (void)setAssetsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_assetsConfiguration, a3);
}

- (TPSKVOManager)KVOManager
{
  return self->_KVOManager;
}

- (void)setKVOManager:(id)a3
{
  objc_storeStrong((id *)&self->_KVOManager, a3);
}

- (TPSConstellationContentParser)contentParser
{
  return self->_contentParser;
}

- (void)setContentParser:(id)a3
{
  objc_storeStrong((id *)&self->_contentParser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentParser, 0);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_assetsConfiguration, 0);
  objc_storeStrong((id *)&self->_animationInitialLoadTime, 0);
  objc_storeStrong((id *)&self->_contentTextOperationID, 0);
  objc_storeStrong((id *)&self->_contentTextOperation, 0);
  objc_storeStrong((id *)&self->_contentTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_contentLabelConstraints, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_assetViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_assetViewLayoutGuideCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_contentTextView, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_cellAppearance, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_heroAssetView, 0);
  objc_storeStrong((id *)&self->_tip, 0);
  objc_storeStrong((id *)&self->_actionButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_noImageBackgroundColorOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonTextViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonTextLabelTopConstraint, 0);
}

- (void)handleURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static TipsWorkspace.openSensitive(_:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
