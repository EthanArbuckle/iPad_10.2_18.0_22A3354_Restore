@implementation BKLibraryBookshelfWantToReadBookCell

- (BKLibraryBookshelfWantToReadBookCell)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfWantToReadBookCell *v3;
  void *v4;
  BKLibraryBookshelfCoverView *v5;
  BKLibraryBookshelfCoverView *coverView;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  UIImageView *v13;
  UIImageView *checkmarkView;
  void *v15;
  BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *v16;
  void *v17;
  void *v18;
  UIImageView *cloudView;
  BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *v20;
  void *v21;
  IMRadialProgressButton *v22;
  IMRadialProgressButton *downloadProgressButton;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  UILabel *v28;
  UILabel *titleLabel;
  UILabel *v30;
  unint64_t v31;
  UILabel *v32;
  UILabel *authorLabel;
  void *v34;
  void *v35;
  BKLibraryStarRating *v36;
  BKLibraryStarRating *starRating;
  void *v38;
  UILabel *v39;
  UILabel *starRatingCountLabel;
  void *v41;
  uint64_t v42;
  IMTouchInsetsButton *moreButton;
  void *v44;
  BCBuyGetTwoStateButton *v45;
  BCBuyGetTwoStateButton *readBuyButton;
  void *v47;
  void *v48;
  void *v49;
  UILabel *v50;
  UILabel *bookDescription;
  void *v52;
  UIImageView *v53;
  UIImageView *dragBarView;
  void *v55;
  uint64_t v56;
  CAShapeLayer *separatorline;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v3->_isRTL = objc_msgSend(v4, "userInterfaceLayoutDirection") == (id)1;

    v5 = objc_alloc_init(BKLibraryBookshelfCoverView);
    coverView = v3->_coverView;
    v3->_coverView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverView coverLayer](v3->_coverView, "coverLayer"));
    objc_msgSend(v7, "setBottomAligned:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v8, "addSubview:", v3->_coverView);

    v9 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v15, "addSubview:", v3->_checkmarkView);

    v16 = -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize initWithFrame:]([BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Not downloaded"), &stru_10091C438, 0));
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityLabel:](v16, "setAccessibilityLabel:", v18);

    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityTraits:](v16, "setAccessibilityTraits:", (unint64_t)-[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityTraits](v16, "accessibilityTraits") & ~UIAccessibilityTraitImage);
    cloudView = v3->_cloudView;
    v3->_cloudView = &v16->super;
    v20 = v16;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v21, "addSubview:", v3->_cloudView);

    v22 = (IMRadialProgressButton *)objc_msgSend(objc_alloc((Class)IMRadialProgressButton), "initWithFrame:", 0.0, 0.0, 17.0, 17.0);
    downloadProgressButton = v3->_downloadProgressButton;
    v3->_downloadProgressButton = v22;

    -[IMRadialProgressButton setCenterImageNormal:](v3->_downloadProgressButton, "setCenterImageNormal:", 0);
    -[IMRadialProgressButton setCenterImageSelected:](v3->_downloadProgressButton, "setCenterImageSelected:", 0);
    -[IMRadialProgressButton setInscribeProgress:](v3->_downloadProgressButton, "setInscribeProgress:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    -[IMRadialProgressButton setProgressColor:](v3->_downloadProgressButton, "setProgressColor:", v24);

    -[IMRadialProgressButton setProgressLineCap:](v3->_downloadProgressButton, "setProgressLineCap:", 1);
    -[IMRadialProgressButton setProgressThickness:](v3->_downloadProgressButton, "setProgressThickness:", 2.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
    -[IMRadialProgressButton setTrackColor:](v3->_downloadProgressButton, "setTrackColor:", v25);

    -[IMRadialProgressButton setTrackDiameter:](v3->_downloadProgressButton, "setTrackDiameter:", 17.0);
    -[IMRadialProgressButton setTrackThickness:](v3->_downloadProgressButton, "setTrackThickness:", 2.0);
    -[IMRadialProgressButton setTouchInsets:](v3->_downloadProgressButton, "setTouchInsets:", -13.5, -13.5, -13.5, -13.5);
    -[IMRadialProgressButton addTarget:action:forControlEvents:](v3->_downloadProgressButton, "addTarget:action:forControlEvents:", v3, "_cancelDownload:", 64);
    -[BKLibraryDownloadStatus progressValue](v3->_libraryDownloadStatus, "progressValue");
    *(float *)&v26 = v26;
    -[IMRadialProgressButton setProgress:](v3->_downloadProgressButton, "setProgress:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v27, "addSubview:", v3->_downloadProgressButton);

    v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v28;

    v30 = v3->_titleLabel;
    v31 = (unint64_t)-[UILabel accessibilityTraits](v30, "accessibilityTraits");
    -[UILabel setAccessibilityTraits:](v30, "setAccessibilityTraits:", UIAccessibilityTraitHeader | v31);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4);
    v32 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    authorLabel = v3->_authorLabel;
    v3->_authorLabel = v32;

    -[UILabel setLineBreakMode:](v3->_authorLabel, "setLineBreakMode:", 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v34, "addSubview:", v3->_titleLabel);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v35, "addSubview:", v3->_authorLabel);

    v36 = -[BKLibraryStarRating initWithFrame:]([BKLibraryStarRating alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    starRating = v3->_starRating;
    v3->_starRating = v36;

    -[BKLibraryStarRating setDelegate:](v3->_starRating, "setDelegate:", v3);
    -[BKLibraryStarRating setEnabled:](v3->_starRating, "setEnabled:", 0);
    -[BKLibraryStarRating setIsRTL:](v3->_starRating, "setIsRTL:", v3->_isRTL);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v38, "addSubview:", v3->_starRating);

    v39 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    starRatingCountLabel = v3->_starRatingCountLabel;
    v3->_starRatingCountLabel = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v41, "addSubview:", v3->_starRatingCountLabel);

    v42 = objc_claimAutoreleasedReturnValue(+[IMTouchInsetsButton buttonWithType:](IMTouchInsetsButton, "buttonWithType:", 0));
    moreButton = v3->_moreButton;
    v3->_moreButton = (IMTouchInsetsButton *)v42;

    -[IMTouchInsetsButton setTouchInsets:](v3->_moreButton, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v44, "addSubview:", v3->_moreButton);

    v45 = (BCBuyGetTwoStateButton *)objc_alloc_init((Class)BCBuyGetTwoStateButton);
    readBuyButton = v3->_readBuyButton;
    v3->_readBuyButton = v45;

    -[BCBuyGetTwoStateButton setClipsToBounds:](v3->_readBuyButton, "setClipsToBounds:", 1);
    -[BCBuyGetTwoStateButton setDelegate:](v3->_readBuyButton, "setDelegate:", v3);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton titleLabel](v3->_readBuyButton, "titleLabel"));
    objc_msgSend(v47, "setAdjustsFontSizeToFitWidth:", 1);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton titleLabel](v3->_readBuyButton, "titleLabel"));
    objc_msgSend(v48, "setBaselineAdjustment:", 1);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v49, "addSubview:", v3->_readBuyButton);

    v50 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bookDescription = v3->_bookDescription;
    v3->_bookDescription = v50;

    -[UILabel setTextAlignment:](v3->_bookDescription, "setTextAlignment:", 4);
    -[UILabel setUserInteractionEnabled:](v3->_bookDescription, "setUserInteractionEnabled:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v52, "addSubview:", v3->_bookDescription);

    v53 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dragBarView = v3->_dragBarView;
    v3->_dragBarView = v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell contentView](v3, "contentView"));
    objc_msgSend(v55, "addSubview:", v3->_dragBarView);

    v56 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    separatorline = v3->_separatorline;
    v3->_separatorline = (CAShapeLayer *)v56;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v58, "scale");
    -[CAShapeLayer setLineWidth:](v3->_separatorline, "setLineWidth:", 1.0 / v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell layer](v3, "layer"));
    objc_msgSend(v60, "addSublayer:", v3->_separatorline);

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v61, "addObserver:selector:name:object:", v3, "reachabilityChanged:", CFSTR("kNetworkReachabilityChangedNotification"), 0);

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
    -[BKLibraryBookshelfCollectionViewCell setHighlightBackgroundColor:](v3, "setHighlightBackgroundColor:", v62);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  BKLibraryAsset *libraryAsset;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("kNetworkReachabilityChangedNotification"), 0);

  -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](self->_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CAE08);
  -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](self->_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009CAE10);
  libraryAsset = self->_libraryAsset;
  if (libraryAsset && (-[BKLibraryAsset isContainer](libraryAsset, "isContainer") & 1) == 0)
  {
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CAE18);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1009CAE20);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009CAE20);
  }
  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CAE28);
  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), off_1009CAE30);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfCollectionViewCell dealloc](&v5, "dealloc");
}

- (id)coverLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverView](self, "coverView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coverLayer"));

  return v3;
}

- (void)cleanupCell
{
  -[BKLibraryBookshelfWantToReadBookCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", 0);
  -[BKLibraryBookshelfWantToReadBookCell setLibraryAsset:](self, "setLibraryAsset:", 0);
  -[BKLibraryBookshelfWantToReadBookCell setAudiobookStatus:](self, "setAudiobookStatus:", 0);
}

- (void)prepareForReuse
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[BKLibraryBookshelfWantToReadBookCell cleanupCell](self, "cleanupCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
    -[BKLibraryBookshelfWantToReadBookCell setCoverHidden:](self, "setCoverHidden:", 0);
  +[CATransaction commit](CATransaction, "commit");
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coverEffectsEnvironment"));

  return (BCUCoverEffectsEnvironment *)v3;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v5, "setCoverEffectsEnvironment:", v4);

}

- (void)handleTapWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v7, "resetButtonState");

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell actionHandler](self, "actionHandler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell indexPath](self, "indexPath"));
  objc_msgSend(v9, "bookTapped:completion:", v8, v4);

}

- (id)dragPreview
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIDragPreview);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverView](self, "coverView"));
  v5 = objc_msgSend(v3, "initWithView:", v4);

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollectionByModifyingTraits:", &stru_1008EB8F8));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6));
  objc_msgSend(v4, "setBackgroundColor:", v8);

  return v4;
}

- (void)setCoverHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverView](self, "coverView"));
  objc_msgSend(v5, "setHidden:", v3);

  +[CATransaction commit](CATransaction, "commit");
}

- (id)coverImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return v3;
}

- (BKLibraryBookshelfCoverView)coverView
{
  return self->_coverView;
}

- (CGRect)coverFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v4, "coverBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v3, "convertRect:fromLayer:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)coverContainerFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGRect v10;

  -[BKLibraryBookshelfWantToReadBookCell coverArea](self, "coverArea");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[BKLibraryBookshelfWantToReadBookCell frame](self, "frame");
  v10.origin.y = v9 * 0.5 - v8 * 0.5;
  v10.origin.x = v4;
  v10.size.width = v6;
  v10.size.height = v8;
  return CGRectIntegral(v10);
}

- (CGRect)coverArea
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL8 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  -[BKLibraryBookshelfWantToReadBookCell bounds](self, "bounds");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v5, "margins");
  v7 = v6;
  -[BKLibraryBookshelfWantToReadBookCell bookCoverLeftMargin](self, "bookCoverLeftMargin");
  v9 = v8;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
    objc_msgSend(v10, "editModeMargin");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "image"));
    objc_msgSend(v14, "size");
    v16 = v12 + v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
    objc_msgSend(v17, "checkMarkSpacing");
    v19 = v16 + v18;

  }
  else
  {
    v19 = v7 + v9;
  }
  -[BKLibraryBookshelfWantToReadBookCell bookCoverSize](self, "bookCoverSize");
  v21 = v20;
  v23 = v22;
  v24 = -[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL");
  -[BKLibraryBookshelfWantToReadBookCell bounds](self, "bounds");
  v29 = IMRectFlippedForRTL(v24, v19, v4, v21, v23, v25, v26, v27, v28);
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  _QWORD *v14;
  _QWORD *v15;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  if (off_1009CAE18 == a6)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001204C4;
    v25[3] = &unk_1008E74F0;
    v25[4] = self;
    v13 = &v26;
    objc_copyWeak(&v26, &location);
    v14 = v25;
LABEL_12:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    objc_destroyWeak(v13);
    goto LABEL_13;
  }
  if (off_1009CAE28 == a6)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100120514;
    v23[3] = &unk_1008E74C8;
    v13 = &v24;
    objc_copyWeak(&v24, &location);
    v14 = v23;
    goto LABEL_12;
  }
  if (off_1009CAE30 == a6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100120590;
    v21[3] = &unk_1008E74C8;
    v13 = &v22;
    objc_copyWeak(&v22, &location);
    v14 = v21;
    goto LABEL_12;
  }
  if (off_1009CAE20 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100120614;
    block[3] = &unk_1008E74C8;
    v13 = &v20;
    objc_copyWeak(&v20, &location);
    v14 = block;
    goto LABEL_12;
  }
  if (off_1009CAE08 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100120660;
    v18[3] = &unk_1008E72C0;
    v18[4] = self;
    v15 = v18;
LABEL_16:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    goto LABEL_13;
  }
  if (off_1009CAE10 == a6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100120668;
    v17[3] = &unk_1008E72C0;
    v17[4] = self;
    v15 = v17;
    goto LABEL_16;
  }
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfWantToReadBookCell observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_13:
  objc_destroyWeak(&location);

}

- (void)reachabilityChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120728;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)nightModeChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfCollectionViewCell nightModeChanged](&v3, "nightModeChanged");
  -[BKLibraryBookshelfWantToReadBookCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)buyButton:(id)a3 initialBuy:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = objc_msgSend(v11, "length");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell actionHandler](self, "actionHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell indexPath](self, "indexPath"));
  if (v8)
  {
    objc_msgSend(v9, "directBuyTapped:buyParameters:completion:", v10, v11, v7);

  }
  else
  {
    objc_msgSend(v9, "bookTapped:", v10);

    v9 = objc_retainBlock(v7);
    if (v9)
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

- (BOOL)isStore
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = objc_msgSend(v2, "isStore");

  return v3;
}

- (BOOL)isDownloading
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  if ((objc_msgSend(v3, "isDownloading") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    v4 = objc_msgSend(v5, "isDownloadingSupplementalContent");

  }
  return v4;
}

- (BOOL)isLocal
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = objc_msgSend(v2, "isLocal");

  return v3;
}

- (BOOL)isCloud
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = objc_msgSend(v2, "isCloud");

  return v3;
}

- (BOOL)isSample
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = objc_msgSend(v2, "isSample");

  return v3;
}

- (BOOL)isAudiobook
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  if ((objc_msgSend(v3, "isAudiobook") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "isStoreAudiobook"));
    v4 = objc_msgSend(v6, "BOOLValue");

  }
  return v4;
}

- (BOOL)canPreorder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell asset](self, "asset"));
  v3 = objc_msgSend(v2, "isPreorder");

  return v3;
}

- (BOOL)wasPreordered
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = objc_msgSend(v2, "isPreorderBook");

  return v3;
}

- (BOOL)storeReachable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
  v3 = objc_msgSend(v2, "storeReachable");

  return v3;
}

- (BOOL)shouldShowCloud
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  if (objc_msgSend(v3, "isCloud"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    v5 = objc_msgSend(v4, "isPreorderBook") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v7 = objc_msgSend(v6, "isAudiobook");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v9 = objc_msgSend(v8, "isBook");

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    LOBYTE(v10) = 0;
  }
  else if (((v9 | v7) & v5 & 1) != 0)
  {
    return !-[BKLibraryBookshelfWantToReadBookCell isDownloading](self, "isDownloading");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    if (objc_msgSend(v11, "isNonLocalSample"))
      v10 = !-[BKLibraryBookshelfWantToReadBookCell isDownloading](self, "isDownloading");
    else
      LOBYTE(v10) = 0;

  }
  return v10;
}

- (BOOL)shouldShowDownloadProgressButton
{
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    return 0;
  else
    return -[BKLibraryBookshelfWantToReadBookCell isDownloading](self, "isDownloading");
}

- (BOOL)shouldShowMoreButton
{
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    return 0;
  else
    return !-[BKLibraryBookshelfWantToReadBookCell isDownloading](self, "isDownloading");
}

- (void)layoutCoverView
{
  void *v2;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  __int128 v21;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  void *v27;
  CGFloat v28;
  void *v29;
  void *v30;
  double v31;
  unsigned int v32;
  double v33;
  float v34;
  void *v35;
  double v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  _OWORD v40[3];
  CGRect v41;
  CGRect v42;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[BKLibraryBookshelfWantToReadBookCell coverArea](self, "coverArea");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[BKLibraryBookshelfWantToReadBookCell frame](self, "frame");
  v41.origin.y = v15 * 0.5 - v14 * 0.5;
  v41.origin.x = v10;
  v41.size.width = v12;
  v41.size.height = v14;
  v42 = CGRectIntegral(v41);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v40[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v40[1] = v21;
  v40[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v20, "setAffineTransform:", v40);

  if (v6 != CGSizeZero.width || v8 != CGSizeZero.height)
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverView](self, "coverView"));
  objc_msgSend(v23, "setFrame:", x, y, width, height);

  if (-[BKLibraryBookshelfWantToReadBookCell isSelected](self, "isSelected"))
  {
    memset(&v39, 0, sizeof(v39));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
    objc_msgSend(v24, "shrinkAmount");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
    objc_msgSend(v27, "shrinkAmount");
    CGAffineTransformMakeScale(&v39, v26, v28);

    v38 = v39;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
    v37 = v38;
    objc_msgSend(v29, "setAffineTransform:", &v37);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
    LODWORD(v31) = 1.0;
    objc_msgSend(v30, "setOpacity:", v31);

  }
  else
  {
    v32 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
    if (v32)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
      objc_msgSend(v2, "shrinkAlpha");
      v34 = v33;
    }
    else
    {
      v34 = 1.0;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
    *(float *)&v36 = v34;
    objc_msgSend(v35, "setOpacity:", v36);

    if (v32)
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  unsigned __int8 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  _BOOL8 v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  id v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  BOOL v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  CGFloat v145;
  unsigned int v146;
  double v147;
  void *v148;
  double v149;
  void *v150;
  double v151;
  double v152;
  double MinY;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  void *v164;
  double v165;
  double v166;
  double MaxY;
  double v168;
  CGFloat v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  double v178;
  void *v179;
  unsigned __int8 v180;
  void *v181;
  unsigned int v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  double v188;
  double v189;
  double v190;
  double v191;
  int v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  _BOOL8 v201;
  void *v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  void *v210;
  CGFloat v211;
  double v212;
  double v213;
  double v214;
  double v215;
  CGFloat v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  void *v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  void *v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  void *v256;
  void *v257;
  uint64_t v258;
  double v259;
  double v260;
  CGFloat v261;
  double v262;
  unsigned int v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  void *v273;
  void *v274;
  void *v275;
  double v276;
  double MidY;
  void *v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  void *v287;
  double v288;
  double v289;
  double v290;
  double v291;
  void *v292;
  double v293;
  double v294;
  double v295;
  double v296;
  void *v297;
  double v298;
  double v299;
  double v300;
  double v301;
  void *v302;
  double v303;
  double v304;
  double v305;
  double v306;
  void *v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  void *v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  void *v329;
  void *v330;
  void *v331;
  double v332;
  double v333;
  double v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  double v346;
  double v347;
  void *v348;
  double v349;
  CGFloat v350;
  CGFloat v351;
  void *v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  double v358;
  double v359;
  double v360;
  double v361;
  void *v362;
  void *v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  void *v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  void *v386;
  double v387;
  double v388;
  CGFloat v389;
  unsigned int v390;
  double v391;
  double v392;
  double v393;
  double v394;
  CGFloat v395;
  void *v396;
  double v397;
  double v398;
  double v399;
  double v400;
  void *v401;
  void *v402;
  double v403;
  double v404;
  double v405;
  double v406;
  void *v407;
  void *v408;
  double v409;
  double v410;
  double v411;
  double v412;
  void *v413;
  void *v414;
  double v415;
  double v416;
  double v417;
  double v418;
  void *v419;
  CGFloat v420;
  void *v421;
  double v422;
  double v423;
  double v424;
  double v425;
  double v426;
  double v427;
  void *v428;
  void *v429;
  double v430;
  double v431;
  double v432;
  double v433;
  void *v434;
  void *v435;
  double v436;
  double v437;
  double v438;
  CGFloat v439;
  void *v440;
  double v441;
  void *v442;
  double v443;
  double v444;
  double v445;
  double v446;
  void *v447;
  double v448;
  _BOOL8 v449;
  double v450;
  double v451;
  double v452;
  double v453;
  double v454;
  double v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  double v464;
  void *v465;
  void *v466;
  void *v467;
  double v468;
  double v469;
  double MinX;
  CGFloat v471;
  CGFloat v472;
  CGFloat v473;
  double v474;
  void *v475;
  id v476;
  void *v477;
  void *v478;
  id v479;
  id v480;
  void *v481;
  void *v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  double v490;
  double v491;
  double v492;
  double v493;
  double v494;
  double v495;
  double v496;
  double v497;
  double v498;
  void *v499;
  CGFloat v500;
  CGFloat v501;
  double v502;
  CGFloat height;
  CGFloat width;
  CGFloat v505;
  CGFloat y;
  CGFloat v507;
  CGFloat x;
  double v509;
  CGFloat v510;
  double v511;
  double v512;
  CGFloat v513;
  CGFloat v514;
  CGFloat v515;
  double v516;
  uint64_t v517;
  double v518;
  double v519;
  double MaxX;
  double v521;
  double v522;
  CGFloat v523;
  CGFloat v524;
  CGFloat v525;
  CGFloat v526;
  double v527;
  double v528;
  double v529;
  double v530;
  double v531;
  double v532;
  CGFloat v533;
  CGFloat v534;
  double v535;
  CGFloat v536;
  double v537;
  double v538;
  double v539;
  double v540;
  double v541;
  CGFloat rect;
  double rect_8;
  double rect_16;
  CGRect rect_24;
  _QWORD v546[13];
  _QWORD v547[17];
  _QWORD v548[5];
  _QWORD v549[5];
  char v550;
  objc_super v551;
  CGRect v552;
  CGRect v553;
  CGRect v554;
  CGRect v555;
  CGRect v556;
  CGRect v557;
  CGRect v558;
  CGRect v559;
  CGRect v560;
  CGRect v561;
  CGRect v562;
  CGRect v563;
  CGRect v564;
  CGRect v565;
  CGRect v566;
  CGRect v567;
  CGRect v568;
  CGRect v569;
  CGRect v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;
  CGRect v575;
  CGRect v576;
  CGRect v577;
  CGRect v578;
  CGRect v579;
  CGRect v580;
  CGRect v581;
  CGRect v582;
  CGRect v583;
  CGRect v584;
  CGRect v585;
  CGRect v586;
  CGRect v587;
  CGRect v588;
  CGRect v589;
  CGRect v590;
  CGRect v591;
  CGRect v592;
  CGRect v593;
  CGRect v594;
  CGRect v595;
  CGRect v596;
  CGRect v597;
  CGRect v598;
  CGRect v599;
  CGRect v600;
  CGRect v601;
  CGRect v602;
  CGRect v603;
  CGRect v604;
  CGRect v605;
  CGRect v606;

  v551.receiver = self;
  v551.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfWantToReadBookCell layoutSubviews](&v551, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  -[BKLibraryBookshelfWantToReadBookCell updateBuyReadButton](self, "updateBuyReadButton");
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    objc_msgSend(v3, "editModeMargin");
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v6, "margins");
    v5 = v7;

  }
  -[BKLibraryBookshelfWantToReadBookCell bounds](self, "bounds");
  rect_24.origin.x = v8;
  v10 = v9;
  v12 = v11;
  rect_24.size.height = v13;
  -[BKLibraryBookshelfWantToReadBookCell coverArea](self, "coverArea");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[BKLibraryBookshelfWantToReadBookCell frame](self, "frame");
  v552.origin.y = v22 * 0.5 - v21 * 0.5;
  rect = v15;
  v552.origin.x = v15;
  v552.size.width = v19;
  v552.size.height = v21;
  v553 = CGRectIntegral(v552);
  y = v553.origin.y;
  x = v553.origin.x;
  height = v553.size.height;
  width = v553.size.width;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v24 = objc_msgSend(v23, "isStore");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dragBarView](self, "dragBarView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "image"));
  objc_msgSend(v26, "size");
  v511 = v27;
  v502 = v28;

  if (v24)
    v29 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
  else
    v29 = 1;
  v30 = v24 ^ 1;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  objc_msgSend(v31, "setHidden:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
  objc_msgSend(v32, "setHidden:", v30);

  +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  v532 = v5;
  if (v33 != 0.0)
  {
    v34 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
    v35 = 0.0;
    if ((v34 & 1) == 0)
    {
      +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
      v35 = v36 + -0.08;
    }
    v549[0] = _NSConcreteStackBlock;
    v549[1] = 3221225472;
    v549[2] = sub_100122CB0;
    v549[3] = &unk_1008E83C0;
    v549[4] = self;
    v550 = v29;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v549, 0, 0.08, v35);
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    {
      v37 = 0.18;
    }
    else
    {
      +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
      v37 = v57 + -0.26;
    }
    v548[0] = _NSConcreteStackBlock;
    v548[1] = 3221225472;
    v548[2] = sub_100122DF4;
    v548[3] = &unk_1008E72C0;
    v548[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v548, 0, 0.08, v37);
    if ((v29 & 1) != 0)
      goto LABEL_37;
LABEL_34:
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "text"));
    v56 = objc_msgSend(v55, "length") != 0;

    goto LABEL_38;
  }
  if (v29)
    v38 = 0.0;
  else
    v38 = 1.0;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
  objc_msgSend(v39, "setAlpha:", v38);

  if (-[BKLibraryBookshelfWantToReadBookCell shouldShowCloud](self, "shouldShowCloud"))
    v40 = 1.0;
  else
    v40 = 0.0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
  objc_msgSend(v41, "setAlpha:", v40);

  v42 = -[BKLibraryBookshelfWantToReadBookCell shouldShowCloud](self, "shouldShowCloud");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
  objc_msgSend(v43, "setIsAccessibilityElement:", v42);

  if (-[BKLibraryBookshelfWantToReadBookCell shouldShowDownloadProgressButton](self, "shouldShowDownloadProgressButton"))
  {
    v44 = 1.0;
  }
  else
  {
    v44 = 0.0;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell downloadProgressButton](self, "downloadProgressButton"));
  objc_msgSend(v45, "setAlpha:", v44);

  if (-[BKLibraryBookshelfWantToReadBookCell shouldShowMoreButton](self, "shouldShowMoreButton"))
    v46 = 1.0;
  else
    v46 = 0.0;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  objc_msgSend(v47, "setAlpha:", v46);

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    v48 = 0.0;
  else
    v48 = 1.0;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  objc_msgSend(v49, "setAlpha:", v48);

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    v50 = 1.0;
  else
    v50 = 0.0;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
  objc_msgSend(v51, "setAlpha:", v50);

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    v52 = 1.0;
  else
    v52 = 0.0;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dragBarView](self, "dragBarView"));
  objc_msgSend(v53, "setAlpha:", v52);

  if ((v29 & 1) == 0)
    goto LABEL_34;
LABEL_37:
  v56 = 0;
LABEL_38:
  -[BKLibraryBookshelfWantToReadBookCell layoutCoverView](self, "layoutCoverView");
  -[BKLibraryBookshelfWantToReadBookCell bookCoverLeftMargin](self, "bookCoverLeftMargin");
  v59 = v5 + v58;
  v554.origin.x = rect;
  v554.origin.y = v17;
  v554.size.width = v19;
  v554.size.height = v21;
  v60 = v59 + CGRectGetWidth(v554);
  objc_msgSend(v3, "lockupMargin");
  v62 = v60 + v61;
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "image"));
    objc_msgSend(v64, "size");
    v66 = v65;
    objc_msgSend(v3, "checkMarkSpacing");
    v62 = v62 + v66 + v67;

  }
  rect_8 = v62;
  v555.origin.x = rect_24.origin.x;
  v555.origin.y = v10;
  v555.size.width = v12;
  v555.size.height = rect_24.size.height;
  v68 = CGRectGetWidth(v555) - (v5 + v62);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  objc_msgSend(v69, "alignmentSizeThatFits:", 1.79769313e308, 1.79769313e308);
  v71 = v70;
  v73 = v72;

  rect_24.origin.y = v10;
  rect_24.size.width = v12;
  rect_16 = v68;
  v523 = v21;
  v524 = v19;
  if ((_os_feature_enabled_impl("UIKit", "ui_consistency") & 1) != 0)
  {
    v529 = v73;
    if (v71 > v68)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "configuration"));
      v76 = objc_msgSend(v75, "copy");

      objc_msgSend(v76, "contentInsets");
      v77 = v71;
      v79 = v78;
      objc_msgSend(v76, "contentInsets");
      v81 = v79 + v80;
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "image"));
      objc_msgSend(v82, "size");
      v84 = v81 + v83;
      objc_msgSend(v76, "imagePadding");
      v86 = v85 + v84;

      v87 = v68 - v86;
      v88 = v77 + v86;
      v89 = 1.0;
      if (v77 > v87)
      {
        if (v88 <= rect_16 || v88 == 0.0)
          v89 = 1.0;
        else
          v89 = rect_16 / v88;
      }
      objc_msgSend(v76, "contentInsets");
      objc_msgSend(v76, "setContentInsets:", v89 * v91, v89 * v92, v89 * v93, v89 * v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v95, "setConfiguration:", v76);

      v529 = ceil(v529 * fmax(v89, 0.75));
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v96, "setButtonShrinkFactor:", v89);

      v97 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "buttonFont"));

      objc_msgSend(v98, "pointSize");
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "fontWithSize:", ceil(v89 * v99)));

      v101 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v101, "setButtonFont:", v100);

      v71 = v86 + ceil(v88 * v89);
      v68 = rect_16;
    }
  }
  else
  {
    v102 = v17;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v103, "titleEdgeInsets");
    v104 = v71;
    v106 = v105;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v107, "titleEdgeInsets");
    v109 = v106 + v108;

    v110 = 1.0;
    if (v104 > v68 - v109)
    {
      v111 = v104 + v109;
      v112 = v104 + v109 <= v68 || v111 == 0.0;
      v113 = v68 / v111;
      if (v112)
        v110 = 1.0;
      else
        v110 = v113;
    }
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v114, "setButtonShrinkFactor:", v110);

    v115 = ceil(v104 * v110);
    v529 = ceil(v73 * v110);
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v116, "titleEdgeInsets");
    v118 = v117;
    v120 = v119;
    v122 = v121;
    v124 = v123;

    v125 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v125, "setTitleEdgeInsets:", v110 * v118, v110 * v120, v110 * v122, v110 * v124);

    v126 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v126, "contentEdgeInsets");
    v128 = v127;
    v130 = v129;
    v132 = v131;
    v134 = v133;

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    v136 = v110 * v130;
    v68 = rect_16;
    objc_msgSend(v135, "setContentEdgeInsets:", v110 * v128, v136, v110 * v132, v110 * v134);

    v71 = v115 + floor(v109 * v110);
    v12 = rect_24.size.width;
    v17 = v102;
    v21 = v523;
    v19 = v524;
  }
  v137 = v68;
  if (!-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
  {
    objc_msgSend(v3, "readBuyLeadingEdgeSpacing");
    v137 = v68 - (v71 + v138);
  }
  v527 = v71;
  if (-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout")
    || -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    {
      v556.origin.x = rect_24.origin.x;
      v556.origin.y = rect_24.origin.y;
      v556.size.width = v12;
      v556.size.height = rect_24.size.height;
      v139 = CGRectGetWidth(v556);
      objc_msgSend(v3, "dragHandleHorizontalSpacing");
      v141 = v511 + rect_8 + v140;
      v142 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell columnMetrics](self, "columnMetrics"));
      objc_msgSend(v142, "margins");
      rect_16 = v139 - (v141 + v143);

    }
  }
  else
  {
    objc_msgSend(v3, "readBuyLeadingEdgeSpacing");
    rect_16 = rect_16 - (v71 + v144);
  }
  v145 = v17;
  v540 = v137;
  v146 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
  v557.origin.x = rect_24.origin.x;
  v557.origin.y = rect_24.origin.y;
  v557.size.width = v12;
  v557.size.height = rect_24.size.height;
  MaxX = CGRectGetMaxX(v557);
  v147 = v532;
  if (v146)
  {
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v148, "margins");
    v147 = v149;

  }
  v516 = v147;
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v150, "sizeThatFits:", rect_16, 1.79769313e308);
  v152 = v151;
  v534 = v151;

  v558.origin.x = rect;
  v558.origin.y = v145;
  v515 = v145;
  v558.size.width = v19;
  v558.size.height = v21;
  MinY = CGRectGetMinY(v558);
  objc_msgSend(v3, "titleSpacing");
  v155 = MinY + v154;
  v156 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), rect_8, v155, rect_16, v152, rect_24.origin.x, rect_24.origin.y, v12, rect_24.size.height);
  v158 = v157;
  v160 = v159;
  v162 = v161;
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v163, "setFrame:", v156, v158, v160, v162);

  v164 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v164, "sizeThatFits:", rect_16, 1.79769313e308);
  v166 = v165;

  v559.origin.x = rect_8;
  v559.origin.y = v155;
  v559.size.width = rect_16;
  v559.size.height = v534;
  MaxY = CGRectGetMaxY(v559);
  objc_msgSend(v3, "authorSpacing");
  v169 = MaxY + v168;
  v170 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), rect_8, MaxY + v168, rect_16, v166, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v172 = v171;
  v174 = v173;
  v176 = v175;
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v177, "setFrame:", v170, v172, v174, v176);

  v560.origin.x = rect_8;
  v500 = v169;
  v501 = v166;
  v560.origin.y = v169;
  v560.size.width = rect_16;
  v560.size.height = v166;
  v178 = CGRectGetMaxY(v560);
  v179 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  v180 = objc_msgSend(v179, "isHidden");

  v181 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  v182 = objc_msgSend(v181, "isHidden");

  objc_msgSend(v3, "ratingWidth");
  v184 = v183;
  objc_msgSend(v3, "ratingHorizontalSpacing");
  v186 = rect_16 - (v184 + v185);
  v187 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
  objc_msgSend(v187, "sizeThatFits:", v186, 1.79769313e308);
  v189 = v188;
  v191 = v190;

  v535 = v186;
  if (v189 > v186)
    v192 = 1;
  else
    v192 = v182;
  objc_msgSend(v3, "ratingSpacing");
  v194 = v178 + v193;
  if ((v192 & 1) == 0)
  {
    objc_msgSend(v3, "ratingHeight");
    if (v191 > v195)
    {
      objc_msgSend(v3, "ratingHeight");
      v194 = v194 + (v191 - v196) * 0.5;
    }
  }
  v530 = v191;
  v538 = v178;
  v197 = 0.0;
  v198 = 0.0;
  if ((v180 & 1) == 0)
  {
    objc_msgSend(v3, "ratingWidth");
    v197 = v199;
    objc_msgSend(v3, "ratingHeight");
    v198 = v200;
  }
  v201 = -[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL");
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  objc_msgSend(v202, "setIsRTL:", v201);

  v203 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), rect_8, v194, v197, v198, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v205 = v204;
  v207 = v206;
  v209 = v208;
  v210 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  objc_msgSend(v210, "setFrame:", v203, v205, v207, v209);

  v561.origin.x = rect_8;
  v561.origin.y = v194;
  v525 = v197;
  v561.size.width = v197;
  v211 = v198;
  v561.size.height = v198;
  v212 = CGRectGetMaxX(v561);
  objc_msgSend(v3, "ratingHorizontalSpacing");
  v214 = v212 + v213;
  v513 = v194;
  v215 = v194 + (v198 - v530) * 0.5;
  v216 = v214;
  v217 = floor(v215);
  if (v192)
    v218 = CGSizeZero.height;
  else
    v218 = v530;
  if (v192)
    v219 = CGSizeZero.width;
  else
    v219 = v535;
  v536 = v217;
  v220 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL", CGSizeZero.width), v214, v217, v219, v218, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v222 = v221;
  v224 = v223;
  v226 = v225;
  v227 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
  v228 = v220;
  v229 = rect_8;
  objc_msgSend(v227, "setFrame:", v228, v222, v224, v226);

  v230 = v538;
  if ((v180 & 1) == 0)
  {
    v562.origin.x = rect_8;
    v562.origin.y = v513;
    v562.size.width = v525;
    v562.size.height = v211;
    v230 = CGRectGetMaxY(v562);
    v563.origin.x = v216;
    v563.origin.y = v536;
    v563.size.width = v219;
    v563.size.height = v218;
    v231 = CGRectGetMaxY(v563);
    if (v230 < v231)
      v230 = v231;
  }
  objc_msgSend(v3, "descriptionLeftMargin");
  v233 = v540 - v232;
  objc_msgSend(v3, "descriptionRightMargin");
  v235 = v233 - v234;
  v236 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
  objc_msgSend(v236, "sizeThatFits:", v235, 1.79769313e308);
  v238 = v237;

  objc_msgSend(v3, "descriptionTopMargin");
  v240 = v238 + v239;
  objc_msgSend(v3, "descriptionBottomMargin");
  v242 = v240 + v241;
  objc_msgSend(v3, "descriptionSpacing");
  v244 = v230 + v243;
  objc_msgSend(v3, "descriptionLeftMargin");
  v539 = rect_8 + v245;
  objc_msgSend(v3, "descriptionTopMargin");
  v537 = v244 + v246;
  v247 = rect_8;
  v248 = v244;
  v249 = v540;
  v250 = v242;
  if (v56)
  {
    v251 = CGRectGetMaxY(*(CGRect *)&v247);
  }
  else
  {
    v252 = CGRectGetMinY(*(CGRect *)&v247);
    objc_msgSend(v3, "descriptionSpacing");
    v251 = v252 + v253;
  }
  v531 = v251;
  v254 = MaxX - v516;
  v564.origin.y = v537;
  v564.origin.x = v539;
  v564.size.width = v235;
  v514 = v238;
  v564.size.height = v238;
  v255 = CGRectGetMinY(v564);
  v541 = MaxX - v516;
  v526 = v235;
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v256 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
    v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "image"));
    objc_msgSend(v257, "size");
    v517 = v258;
    v260 = v259;

    v565.origin.x = x;
    v565.origin.y = y;
    v565.size.width = width;
    v565.size.height = height;
    v521 = v255;
    v261 = CGRectGetMidY(v565) - v260 * 0.5;
    v566.origin.x = x;
    v566.origin.y = y;
    v566.size.width = width;
    v566.size.height = height;
    v547[0] = _NSConcreteStackBlock;
    v547[1] = 3221225472;
    v547[2] = sub_100122E88;
    v547[3] = &unk_1008EB920;
    v547[4] = self;
    *(double *)&v547[5] = v532;
    *(CGFloat *)&v547[6] = v261;
    v255 = v521;
    v547[7] = v517;
    *(double *)&v547[8] = v260;
    v229 = rect_8;
    v547[9] = *(_QWORD *)&rect_24.origin.x;
    v547[10] = *(_QWORD *)&rect_24.origin.y;
    v547[11] = *(_QWORD *)&rect_24.size.width;
    v547[12] = *(_QWORD *)&rect_24.size.height;
    *(double *)&v547[13] = v541 - v511;
    v547[14] = round(CGRectGetMidY(v566) - v502 * 0.5);
    v254 = v541;
    *(double *)&v547[15] = v511;
    *(double *)&v547[16] = v502;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v547);
  }
  if (rect_16 >= v527)
    v262 = v527;
  else
    v262 = rect_16;
  v263 = -[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout");
  if (v263)
    v264 = v531;
  else
    v264 = v255;
  if (v263)
    v265 = v229;
  else
    v265 = v254 - v527;
  v533 = v265;
  v266 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL", v254 - v527), v265, v264, v262, v529, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v268 = v267;
  v270 = v269;
  v272 = v271;
  v273 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  objc_msgSend(v273, "setAlignmentFrame:", v266, v268, v270, v272);

  if ((_os_feature_enabled_impl("UIKit", "ui_consistency") & 1) == 0)
  {
    v274 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "layer"));
    objc_msgSend(v275, "setCornerRadius:", v529 * 0.5);

  }
  v567.origin.x = v533;
  v567.origin.y = v264;
  v567.size.width = v262;
  v567.size.height = v529;
  v276 = CGRectGetMaxY(v567);
  if (-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
  {
    v568.origin.x = v533;
    v568.origin.y = v264;
    v568.size.width = v262;
    v568.size.height = v529;
    v531 = CGRectGetMaxY(v568);
  }
  v569.origin.x = v533;
  v569.origin.y = v264;
  v569.size.width = v262;
  v569.size.height = v529;
  MidY = CGRectGetMidY(v569);
  v278 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  objc_msgSend(v278, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v280 = v279;

  objc_msgSend(v3, "moreHeight");
  v528 = v281;
  v505 = v264;
  v507 = v262;
  v509 = MidY;
  if (-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
  {
    v570.origin.x = v533;
    v570.origin.y = v264;
    v570.size.width = v262;
    v570.size.height = v529;
    v282 = CGRectGetMaxX(v570);
    objc_msgSend(v3, "stackedButtonHorizontalSpacing");
    v522 = v282 + v283;
    v284 = floor(MidY + v528 * -0.5);
  }
  else
  {
    v522 = v254 - v280;
    objc_msgSend(v3, "moreSpacing");
    v284 = v276 + v285;
  }
  v518 = v284;
  v286 = v280;
  v287 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  objc_msgSend(v287, "moreSpacing");
  v289 = v288;
  v290 = -v288;

  if (v289 >= 10.0)
    v291 = v290;
  else
    v291 = -10.0;
  v292 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  objc_msgSend(v292, "stackedButtonHorizontalSpacing");
  v294 = v293;
  v295 = -v293;

  if (v294 >= 10.0)
    v296 = v295;
  else
    v296 = -10.0;
  v297 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  objc_msgSend(v297, "cloudSpacing");
  v299 = v298;
  v300 = -v298;

  if (v299 >= 10.0)
    v301 = v300;
  else
    v301 = -10.0;
  v302 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  objc_msgSend(v302, "stackedButtonHorizontalSpacing");
  v304 = v303;
  v305 = -v303;

  if (v304 >= 10.0)
    v306 = v305;
  else
    v306 = -10.0;
  v307 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  objc_msgSend(v307, "setTouchInsets:", v291, v296, v301, v306);

  v308 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), v522, v518, v286, v528, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v310 = v309;
  v312 = v311;
  v314 = v313;
  v315 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  objc_msgSend(v315, "setFrame:", v308, v310, v312, v314);

  v571.origin.x = v522;
  v571.origin.y = v518;
  v512 = v286;
  v571.size.width = v286;
  v571.size.height = v528;
  v316 = CGRectGetMaxY(v571);
  if (-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
  {
    v572.origin.x = v533;
    v572.origin.y = v264;
    v572.size.width = v507;
    v572.size.height = v529;
    v317 = CGRectGetMaxX(v572);
    objc_msgSend(v3, "stackedButtonHorizontalSpacing");
    v319 = v317 + v318;
    v320 = floor(v509 + -8.5);
  }
  else
  {
    v319 = v541 + -17.0;
    objc_msgSend(v3, "cloudSpacing");
    v320 = v316 + v321;
  }
  v322 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), v319, v320, 17.0, 17.0, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v324 = v323;
  v326 = v325;
  v328 = v327;
  v329 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell downloadProgressButton](self, "downloadProgressButton"));
  objc_msgSend(v329, "setFrame:", v322, v324, v326, v328);

  v330 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
  v331 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v330, "image"));
  objc_msgSend(v331, "size");
  v333 = v332;
  v335 = v334;

  if (-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
  {
    v573.origin.y = v518;
    v573.origin.x = v522;
    v573.size.width = v286;
    v573.size.height = v528;
    v336 = CGRectGetMaxX(v573);
    objc_msgSend(v3, "stackedButtonHorizontalSpacing");
    v338 = v336 + v337;
    v339 = floor(v509 + v335 * -0.5);
  }
  else
  {
    v338 = v541 - v333;
    objc_msgSend(v3, "cloudSpacing");
    v339 = v316 + v340;
  }
  v519 = v333;
  v341 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), v338, v339, v333, v335, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
  v343 = v342;
  v345 = v344;
  v347 = v346;
  v348 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
  objc_msgSend(v348, "setFrame:", v341, v343, v345, v347);

  if (-[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
  {
    v574.origin.x = v338;
    v574.origin.y = v339;
    v574.size.width = v519;
    v574.size.height = v335;
    v349 = CGRectGetMaxX(v574);
    v350 = rect_24.origin.x;
    v351 = rect_24.origin.y;
    if (v349 > CGRectGetWidth(rect_24))
    {
      v352 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
      objc_msgSend(v352, "moreSpacing");
      v354 = v531 + v353;
      v510 = v531 + v353;

      v355 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), rect_8, v354, v512, v528, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
      v357 = v356;
      v359 = v358;
      v361 = v360;
      v362 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
      objc_msgSend(v362, "setFrame:", v355, v357, v359, v361);

      v363 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
      objc_msgSend(v363, "moreSpacing");
      v365 = v531 + v364;

      v366 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), rect_8, v365, 17.0, 17.0, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
      v368 = v367;
      v370 = v369;
      v372 = v371;
      v373 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell downloadProgressButton](self, "downloadProgressButton"));
      objc_msgSend(v373, "setFrame:", v366, v368, v370, v372);

      v575.origin.x = rect_8;
      v575.origin.y = v510;
      v575.size.width = v512;
      v575.size.height = v528;
      v374 = CGRectGetMidY(v575);
      v576.origin.x = rect_8;
      v576.origin.y = v510;
      v576.size.width = v512;
      v576.size.height = v528;
      v375 = CGRectGetMaxX(v576);
      objc_msgSend(v3, "stackedButtonHorizontalSpacing");
      v377 = v375 + v376;
      v378 = floor(v374 + v335 * -0.5);
      v379 = IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), v377, v378, v519, v335, rect_24.origin.x, rect_24.origin.y, rect_24.size.width, rect_24.size.height);
      v381 = v380;
      v383 = v382;
      v385 = v384;
      v386 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
      v387 = v383;
      v388 = v385;
      v350 = rect_24.origin.x;
      v351 = rect_24.origin.y;
      objc_msgSend(v386, "setFrame:", v379, v381, v387, v388);

      v577.origin.x = v377;
      v577.origin.y = v378;
      v577.size.width = v519;
      v577.size.height = v335;
      v531 = CGRectGetMaxY(v577);
    }
  }
  else
  {
    v350 = rect_24.origin.x;
    v351 = rect_24.origin.y;
  }
  v389 = v526;
  v390 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
  -[BKLibraryBookshelfWantToReadBookCell frame](self, "frame");
  v391 = CGRectGetHeight(v578);
  if (v390)
  {
    v392 = v391 * 0.5;
    v579.origin.x = rect_8;
    v579.origin.y = v500;
    v579.size.height = v501;
    v579.size.width = rect_16;
    v393 = floor((v392 - CGRectGetMinY(v579)) / 1.5);
    v394 = 0.0;
  }
  else
  {
    v393 = floor((v391 - v531) * 0.5);
    if (v56 || -[BKLibraryBookshelfWantToReadBookCell stackedLayout](self, "stackedLayout"))
    {
      v394 = v393;
    }
    else
    {
      -[BKLibraryBookshelfWantToReadBookCell frame](self, "frame");
      v395 = CGRectGetHeight(v580) * 0.5;
      v581.origin.x = v533;
      v581.origin.y = v505;
      v581.size.width = v507;
      v581.size.height = v529;
      v394 = floor(v395 - CGRectGetMaxY(v581));
    }
  }
  if (v393 == 0.0)
  {
    v420 = v514;
  }
  else
  {
    v396 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v396, "frame");
    v583 = CGRectOffset(v582, 0.0, v393);
    v397 = v583.origin.x;
    v398 = v583.origin.y;
    v399 = v583.size.width;
    v400 = v583.size.height;
    v401 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v401, "setFrame:", v397, v398, v399, v400);

    v402 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
    objc_msgSend(v402, "frame");
    v585 = CGRectOffset(v584, 0.0, v393);
    v403 = v585.origin.x;
    v404 = v585.origin.y;
    v405 = v585.size.width;
    v406 = v585.size.height;
    v407 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
    objc_msgSend(v407, "setFrame:", v403, v404, v405, v406);

    v408 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    objc_msgSend(v408, "frame");
    v587 = CGRectOffset(v586, 0.0, v393);
    v409 = v587.origin.x;
    v410 = v587.origin.y;
    v411 = v587.size.width;
    v412 = v587.size.height;
    v413 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    objc_msgSend(v413, "setFrame:", v409, v410, v411, v412);

    v414 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
    objc_msgSend(v414, "frame");
    v589 = CGRectOffset(v588, 0.0, v393);
    v415 = v589.origin.x;
    v416 = v589.origin.y;
    v417 = v589.size.width;
    v418 = v589.size.height;
    v419 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
    objc_msgSend(v419, "setFrame:", v415, v416, v417, v418);

    v590.origin.y = v537;
    v590.origin.x = v539;
    v590.size.width = v526;
    v590.size.height = v514;
    v591 = CGRectOffset(v590, 0.0, v393);
    v537 = v591.origin.y;
    v539 = v591.origin.x;
    v389 = v591.size.width;
    v420 = v591.size.height;
  }
  if (v394 != 0.0)
  {
    v421 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v421, "frame");
    v593 = CGRectOffset(v592, 0.0, v394);
    v422 = v593.origin.x;
    v423 = v593.origin.y;
    v424 = v593.size.width;
    v425 = v350;
    v426 = v420;
    v427 = v593.size.height;
    v428 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v428, "setFrame:", v422, v423, v424, v427);

    v429 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
    objc_msgSend(v429, "frame");
    v595 = CGRectOffset(v594, 0.0, v394);
    v430 = v595.origin.x;
    v431 = v595.origin.y;
    v432 = v595.size.width;
    v433 = v595.size.height;
    v434 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
    objc_msgSend(v434, "setFrame:", v430, v431, v432, v433);

    v435 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell downloadProgressButton](self, "downloadProgressButton"));
    objc_msgSend(v435, "frame");
    v597 = CGRectOffset(v596, 0.0, v394);
    v436 = v597.origin.x;
    v437 = v597.origin.y;
    v438 = v597.size.width;
    v439 = v597.size.height;
    v440 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell downloadProgressButton](self, "downloadProgressButton"));
    v441 = v439;
    v420 = v426;
    v350 = v425;
    v351 = rect_24.origin.y;
    objc_msgSend(v440, "setFrame:", v436, v437, v438, v441);

    v442 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
    objc_msgSend(v442, "frame");
    v599 = CGRectOffset(v598, 0.0, v394);
    v443 = v599.origin.x;
    v444 = v599.origin.y;
    v445 = v599.size.width;
    v446 = v599.size.height;
    v447 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
    objc_msgSend(v447, "setFrame:", v443, v444, v445, v446);

  }
  +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  if (v448 == 0.0)
  {
    v449 = -[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL");
    v451 = v537;
    v450 = v539;
    v452 = v389;
    v453 = v420;
    v454 = v350;
    v455 = v351;
    v456 = rect_24.size.width;
    v457 = rect_24.size.height;
  }
  else
  {
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
      goto LABEL_143;
    v546[0] = _NSConcreteStackBlock;
    v546[1] = 3221225472;
    v546[2] = sub_100122F64;
    v546[3] = &unk_1008E8450;
    v546[4] = self;
    *(double *)&v546[5] = v539;
    *(double *)&v546[6] = v537;
    *(CGFloat *)&v546[7] = v389;
    *(CGFloat *)&v546[8] = v420;
    *(CGFloat *)&v546[9] = v350;
    *(CGFloat *)&v546[10] = v351;
    v546[11] = *(_QWORD *)&rect_24.size.width;
    v546[12] = *(_QWORD *)&rect_24.size.height;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v546);
    v449 = -[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL");
    v450 = v539;
    v451 = v537;
    v452 = v389;
    v453 = v420;
    v454 = v350;
    v455 = v351;
    v456 = rect_24.size.width;
    v457 = rect_24.size.height;
  }
  v458 = IMRectFlippedForRTL(v449, v450, v451, v452, v453, v454, v455, v456, v457);
  v460 = v459;
  v462 = v461;
  v464 = v463;
  v465 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
  objc_msgSend(v465, "setFrame:", v458, v460, v462, v464);

LABEL_143:
  v466 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v467 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell separatorline](self, "separatorline"));
  objc_msgSend(v467, "lineWidth");
  v469 = v468 * -0.5 + 1.0;

  v600.origin.x = rect;
  v600.origin.y = v515;
  v600.size.width = v524;
  v600.size.height = v523;
  MinX = CGRectGetMinX(v600);
  if (-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"))
  {
    v601.origin.x = rect;
    v601.origin.y = v515;
    v601.size.width = v524;
    v601.size.height = v523;
    MinX = CGRectGetMaxX(v601);
    v471 = v350;
    v602.origin.x = v350;
    v602.origin.y = v351;
    v473 = rect_24.size.width;
    v472 = rect_24.size.height;
    v602.size.width = rect_24.size.width;
    v602.size.height = rect_24.size.height;
    v474 = CGRectGetMaxX(v602) - v541;
  }
  else
  {
    v474 = v541;
    v471 = v350;
    v473 = rect_24.size.width;
    v472 = rect_24.size.height;
  }
  v603.origin.x = v471;
  v603.origin.y = v351;
  v603.size.width = v473;
  v603.size.height = v472;
  objc_msgSend(v466, "moveToPoint:", MinX, CGRectGetMaxY(v603) - v469);
  v604.origin.x = v471;
  v604.origin.y = v351;
  v604.size.width = v473;
  v604.size.height = v472;
  objc_msgSend(v466, "addLineToPoint:", v474, CGRectGetMaxY(v604) - v469);
  v475 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("path")));
  v476 = objc_retainAutorelease(v466);
  objc_msgSend(v475, "setToValue:", objc_msgSend(v476, "CGPath"));
  +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  objc_msgSend(v475, "setDuration:");
  v477 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v475, "setTimingFunction:", v477);

  objc_msgSend(v475, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v475, "setRemovedOnCompletion:", 0);
  v478 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell separatorline](self, "separatorline"));
  objc_msgSend(v478, "addAnimation:forKey:", v475, 0);

  v479 = objc_retainAutorelease(v476);
  v480 = objc_msgSend(v479, "CGPath");
  v481 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell separatorline](self, "separatorline"));
  objc_msgSend(v481, "setPath:", v480);

  v482 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
  if (v482)
  {
    objc_msgSend(v3, "audiobookControlMargin");
    v484 = v483;
    objc_msgSend(v482, "frame");
    v486 = v485;
    v488 = v487;
    -[BKLibraryBookshelfWantToReadBookCell coverFrame](self, "coverFrame");
    v490 = v489;
    v492 = v491;
    v494 = v493;
    v496 = v495;
    v497 = v484 + v489;
    v498 = v491 + v495 - v488 - v484;
    objc_msgSend(v482, "frame");
    v606.origin.x = v497;
    v606.origin.y = v498;
    v606.size.width = v486;
    v606.size.height = v488;
    if (!CGRectEqualToRect(v605, v606))
      objc_msgSend(v482, "setFrame:", IMRectFlippedForRTL(-[BKLibraryBookshelfWantToReadBookCell isRTL](self, "isRTL"), v497, v498, v486, v488, v490, v492, v494, v496));
  }
  v499 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  objc_msgSend(v499, "updateButton");

}

- (void)_updateTintedImages
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "moreTintColor"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dragBarImageWithTintColor:", v23));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dragBarView](self, "dragBarView"));
      objc_msgSend(v9, "setImage:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedCheckmarkImageForSelectedState:", -[BKLibraryBookshelfWantToReadBookCell isSelected](self, "isSelected")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
      objc_msgSend(v12, "setImage:", v11);

      if (-[BKLibraryBookshelfWantToReadBookCell isSelected](self, "isSelected"))
        v13 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
      else
        v13 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor"));
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
      objc_msgSend(v15, "setTintColor:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMenuImageWithTintColor:", v23));
      objc_msgSend(v16, "setImage:forState:", v18, 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "templateCloudImageForCloudState:", 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
      objc_msgSend(v21, "setImage:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
      objc_msgSend(v22, "setTintColor:", v23);

    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  id v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  dispatch_time_t v50;
  BKLibraryAsset *libraryAsset;
  double v52;
  double v53;
  void *v54;
  void *v55;
  _QWORD block[5];
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  v4 = a3;
  -[BKLibraryBookshelfCollectionViewCell applyLayoutAttributes:](&v57, "applyLayoutAttributes:", v4);
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));

  -[BKLibraryBookshelfWantToReadBookCell setIndexPath:](self, "setIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[BKLibraryBookshelfWantToReadBookCell setIsRTL:](self, "setIsRTL:", objc_msgSend(v9, "userInterfaceLayoutDirection") == (id)1);

  -[BKLibraryBookshelfWantToReadBookCell setLayoutDebugMode:](self, "setLayoutDebugMode:", objc_msgSend(v7, "layoutDebugMode"));
  if (objc_msgSend(v7, "layoutDebugMode"))
  {
    -[BKLibraryBookshelfWantToReadBookCell configureDebugLayout](self, "configureDebugLayout");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell layer](self, "layer"));
    objc_msgSend(v10, "setBorderWidth:", 0.0);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  -[BKLibraryBookshelfWantToReadBookCell setMetrics:](self, "setMetrics:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetrics"));
  -[BKLibraryBookshelfWantToReadBookCell setColumnMetrics:](self, "setColumnMetrics:", v12);

  v13 = objc_msgSend(v7, "lastItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell separatorline](self, "separatorline"));
  objc_msgSend(v14, "setHidden:", v13);

  v15 = objc_opt_class(BKLibraryBookshelfCellMetrics_WantToRead);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  if (v18 != v19)
  {
    -[BKLibraryBookshelfWantToReadBookCell setWantToReadMetrics:](self, "setWantToReadMetrics:", v18);
    -[BKLibraryBookshelfWantToReadBookCell setMetrics:](self, "setMetrics:", v18);
    objc_msgSend(v18, "bookCoverSize");
    -[BKLibraryBookshelfWantToReadBookCell setBookCoverSize:](self, "setBookCoverSize:");
    objc_msgSend(v18, "bookCoverLeftMargin");
    -[BKLibraryBookshelfWantToReadBookCell setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
    -[BKLibraryBookshelfWantToReadBookCell setStackedLayout:](self, "setStackedLayout:", objc_msgSend(v18, "stackedLayout"));
    objc_msgSend(v18, "titleMaxLines");
    v21 = (uint64_t)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v22, "setNumberOfLines:", v21);

    v23 = objc_msgSend(v18, "descriptionVisibleRows");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
    objc_msgSend(v24, "setNumberOfLines:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "frameColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ratingFrameColor"));

    if (v26 != v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ratingFrameColor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
      objc_msgSend(v29, "setFrameColor:", v28);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "fillColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ratingFillColor"));

    if (v31 != v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ratingFillColor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
      objc_msgSend(v34, "setFillColor:", v33);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "emptyColor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ratingEmptyColor"));

    if (v36 != v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ratingEmptyColor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
      objc_msgSend(v39, "setEmptyColor:", v38);

    }
    objc_msgSend(v18, "editMargin");
    -[BKLibraryBookshelfWantToReadBookCell setEditMargin:](self, "setEditMargin:");
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cellSeparatorColor")));
    v41 = objc_msgSend(v40, "CGColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell separatorline](self, "separatorline"));
    objc_msgSend(v42, "setStrokeColor:", v41);

    -[BKLibraryBookshelfWantToReadBookCell updateTextForProductProfile](self, "updateTextForProductProfile");
    -[BKLibraryBookshelfWantToReadBookCell updateStarRatingProductProfile](self, "updateStarRatingProductProfile");
    -[BKLibraryBookshelfWantToReadBookCell _updateTintedImages](self, "_updateTintedImages");
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));

  if (v43)
  {
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverView](self, "coverView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "coverLayer"));
    if (v45 == 0.0)
    {
      libraryAsset = self->_libraryAsset;
      -[BKLibraryBookshelfWantToReadBookCell coverArea](self, "coverArea");
      objc_msgSend(v47, "setLibraryAsset:size:", libraryAsset, v52, v53);

    }
    else
    {
      -[BKLibraryBookshelfWantToReadBookCell coverArea](self, "coverArea");
      objc_msgSend(v47, "preloadCoverImageAtSize:", v48, v49);

      v50 = dispatch_time(0, (uint64_t)(v45 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001237A4;
      block[3] = &unk_1008E72C0;
      block[4] = self;
      dispatch_after(v50, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverView](self, "coverView"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "coverLayer"));
    objc_msgSend(v55, "setAnimateFrameChange:", 1);

    -[BKLibraryBookshelfWantToReadBookCell layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)setSelected:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfWantToReadBookCell setSelected:](&v7, "setSelected:");
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001238E4;
    v5[3] = &unk_1008E83C0;
    v5[4] = self;
    v6 = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.2);
  }
}

- (void)setLibraryAsset:(id)a3
{
  BKLibraryAsset *v5;
  BKLibraryAsset **p_libraryAsset;
  BKLibraryAsset *libraryAsset;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BKLibraryAsset *v17;

  v5 = (BKLibraryAsset *)a3;
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  if (libraryAsset != v5)
  {
    v17 = v5;
    if (libraryAsset && (-[BKLibraryAsset isContainer](libraryAsset, "isContainer") & 1) == 0)
    {
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CAE18);
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1009CAE20);
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009CAE20);
    }
    objc_storeStrong((id *)&self->_libraryAsset, a3);
    if (*p_libraryAsset)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permanentOrTemporaryAssetID](*p_libraryAsset, "permanentOrTemporaryAssetID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusForAssetID:", v9));
      -[BKLibraryBookshelfWantToReadBookCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", v10);

    }
    else
    {
      -[BKLibraryBookshelfWantToReadBookCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", 0);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell asset](self, "asset"));
    -[BKLibraryBookshelfWantToReadBookCell setAsset:](self, "setAsset:", 0);
    if (*p_libraryAsset && (-[BKLibraryAsset isContainer](*p_libraryAsset, "isContainer") & 1) == 0)
    {
      -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("combinedState"), 0, off_1009CAE18);
      -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 0, off_1009CAE20);
      -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("author"), 0, off_1009CAE20);
    }
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v12, "resetButtonState");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
      -[BKLibraryBookshelfWantToReadBookCell coverArea](self, "coverArea");
      objc_msgSend(v14, "setLibraryAsset:size:", v13, v15, v16);

      -[BKLibraryBookshelfWantToReadBookCell _updateAssetStrings](self, "_updateAssetStrings");
      -[BKLibraryBookshelfWantToReadBookCell setNeedsLayout](self, "setNeedsLayout");
    }

    v5 = v17;
  }

}

- (void)setLibraryDownloadStatus:(id)a3
{
  BKLibraryDownloadStatus *v5;
  BKLibraryDownloadStatus **p_libraryDownloadStatus;
  BKLibraryDownloadStatus *libraryDownloadStatus;
  BKLibraryDownloadStatus *v8;

  v5 = (BKLibraryDownloadStatus *)a3;
  p_libraryDownloadStatus = &self->_libraryDownloadStatus;
  libraryDownloadStatus = self->_libraryDownloadStatus;
  if (libraryDownloadStatus != v5)
  {
    v8 = v5;
    -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CAE08);
    -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](*p_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009CAE10);
    objc_storeStrong((id *)&self->_libraryDownloadStatus, a3);
    -[BKLibraryDownloadStatus addObserver:forKeyPath:options:context:](*p_libraryDownloadStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("combinedState"), 0, off_1009CAE08);
    -[BKLibraryDownloadStatus addObserver:forKeyPath:options:context:](*p_libraryDownloadStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("progressValue"), 0, off_1009CAE10);
    v5 = v8;
  }

}

- (void)_updateAssetStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleFontAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v3, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setAttributedText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayAuthor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authorFontAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v8, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v12, "setAttributedText:", v11);

}

- (void)setInitialAsset:(id)a3
{
  id v4;

  -[BKLibraryBookshelfWantToReadBookCell setAsset:](self, "setAsset:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  objc_msgSend(v4, "resetButtonState");

}

- (void)setAsset:(id)a3
{
  BFMAsset *v5;
  id *p_asset;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  BFMAsset *v16;

  v5 = (BFMAsset *)a3;
  p_asset = (id *)&self->_asset;
  if (self->_asset != v5)
  {
    v16 = v5;
    if (!v5)
      goto LABEL_4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset id](v5, "id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    v5 = v16;
    if (v10)
    {
LABEL_4:
      objc_storeStrong((id *)&self->_asset, a3);
      v11 = *p_asset;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v12, "setAsset:", v11);

      objc_msgSend(*p_asset, "averageRating");
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
      objc_msgSend(v15, "setRating:", v14);

      -[BKLibraryBookshelfWantToReadBookCell updateTextForProductProfile](self, "updateTextForProductProfile");
      -[BKLibraryBookshelfWantToReadBookCell updateStarRatingProductProfile](self, "updateStarRatingProductProfile");
      v5 = v16;
    }
  }

}

- (void)updateTextForProductProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset name](self->_asset, "name"));
  v4 = v3;
  if (!v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleFontAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v4, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setAttributedText:", v7);

  if (!v3)
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset artistName](self->_asset, "artistName"));
  v10 = v9;
  if (!v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayAuthor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authorFontAttributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v10, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v14, "setAttributedText:", v13);

  if (!v9)
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCMAssetWrapper htmlStrippedStandardNotesForAsset:](BCMAssetWrapper, "htmlStrippedStandardNotesForAsset:", self->_asset));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[BCMAssetWrapper htmlStrippedStandardDescriptionForAsset:](BCMAssetWrapper, "htmlStrippedStandardDescriptionForAsset:", self->_asset));
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "descriptionFontAttributes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v18, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
  objc_msgSend(v22, "setAttributedText:", v21);

  -[BKLibraryBookshelfWantToReadBookCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateStarRatingProductProfile
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell asset](self, "asset"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "starRatingCountLabel"));
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, -[BFMAsset ratingCount](self->_asset, "ratingCount")));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "starRatingCountFontAttributes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v16, v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
      objc_msgSend(v11, "setAttributedText:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "starRatingCountAccessibilityLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, -[BFMAsset ratingCount](self->_asset, "ratingCount")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
      objc_msgSend(v15, "setAccessibilityLabel:", v14);

      -[BKLibraryBookshelfWantToReadBookCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setDataSource:(id)a3
{
  void *v4;
  void *v5;

  objc_storeWeak((id *)&self->_dataSource, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "moreButtonAccessibilityLabel"));
  -[IMTouchInsetsButton setAccessibilityLabel:](self->_moreButton, "setAccessibilityLabel:", v5);

  -[BKLibraryBookshelfWantToReadBookCell _updateTintedImages](self, "_updateTintedImages");
  -[BKLibraryBookshelfWantToReadBookCell updateStarRatingProductProfile](self, "updateStarRatingProductProfile");
  -[BKLibraryBookshelfWantToReadBookCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAudiobookStatus:(id)a3
{
  AEAssetAudiobookStatus *v5;
  AEAssetAudiobookStatus **p_audiobookStatus;
  AEAssetAudiobookStatus *audiobookStatus;
  void *v8;
  AEAssetAudiobookStatus *v9;

  v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  audiobookStatus = self->_audiobookStatus;
  if (audiobookStatus != v5)
  {
    v9 = v5;
    if (audiobookStatus)
    {
      -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CAE28);
      -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](*p_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), off_1009CAE30);
    }
    objc_storeStrong((id *)&self->_audiobookStatus, a3);
    if (*p_audiobookStatus)
    {
      -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), 0, off_1009CAE28);
      -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), 0, off_1009CAE30);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
    objc_msgSend(v8, "audiobookControlDiameter");
    -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", v9);

    v5 = v9;
  }

}

- (void)updateBuyReadButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
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
  void *v45;
  void *v46;
  id v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));

  if (v3)
  {
    v47 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell wantToReadMetrics](self, "wantToReadMetrics"));
    if (!-[BKLibraryBookshelfWantToReadBookCell isCloud](self, "isCloud")
      && !-[BKLibraryBookshelfWantToReadBookCell isLocal](self, "isLocal")
      && !-[BKLibraryBookshelfWantToReadBookCell isDownloading](self, "isDownloading")
      && -[BKLibraryBookshelfWantToReadBookCell isStore](self, "isStore")
      || -[BKLibraryBookshelfWantToReadBookCell isSample](self, "isSample")
      || -[BKLibraryBookshelfWantToReadBookCell canPreorder](self, "canPreorder")
      || -[BKLibraryBookshelfWantToReadBookCell wasPreordered](self, "wasPreordered"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreFontAttributes"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v6, "setButtonFont:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreTextColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v8, "setTextColor:", v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreFillColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v10, "setBackgroundFillColor:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreTextHilightColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v12, "setTextHilightColor:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreFillHilightColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v14, "setBackgroundFillHighlightColor:", v13);

      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreFrameColor"));
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyFontAttributes"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "font"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v38, "setButtonFont:", v37);

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyTextColor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v40, "setTextColor:", v39);

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyFillColor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v42, "setBackgroundFillColor:", v41);

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyTextHilightColor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v44, "setTextHilightColor:", v43);

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyFillHilightColor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v46, "setBackgroundFillHighlightColor:", v45);

      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyFrameColor"));
    }
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v17, "setFrameColor:", v16);

    objc_msgSend(v47, "readBuyFrameWidth");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v20, "setFrameWidth:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "readBuyStoreTextDisabledColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v22, "setDisabledTextColor:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "buyStateBackgroundFillColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v24, "setBuyStateBackgroundFillColor:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "configuration"));
    v27 = objc_msgSend(v26, "copy");

    objc_msgSend(v27, "setContentInsets:", 6.0, 20.0, 6.0, 20.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v28, "setConfiguration:", v27);

    if ((_os_feature_enabled_impl("UIKit", "ui_consistency") & 1) == 0)
    {
      objc_msgSend(v47, "readBuyTitleInset");
      v30 = v29;
      objc_msgSend(v47, "readBuyTitleInset");
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v33, "setTitleEdgeInsets:", 0.0, v30, 0.0, v32);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
      objc_msgSend(v34, "setContentEdgeInsets:", 6.0, 0.0, 6.0, 0.0);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
    objc_msgSend(v35, "updateButton");

  }
}

- (void)_cancelDownload:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;

  if (-[BKLibraryBookshelfWantToReadBookCell isDownloading](self, "isDownloading", a3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell actionHandler](self, "actionHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell libraryAsset](self, "libraryAsset"));
    objc_msgSend(v7, "bookCancelDownload:", v4);

  }
  else
  {
    v5 = BKLibraryUILog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10069FF9C(v6);

  }
}

- (void)configureDebugLayout
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.2)));
  v5 = objc_msgSend(v4, "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell layer](self, "layer"));
  objc_msgSend(v6, "setBorderColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell layer](self, "layer"));
  objc_msgSend(v7, "setBorderWidth:", 0.5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.2)));
  v10 = objc_msgSend(v9, "CGColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v11, "setBorderColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v12, "setBorderWidth:", 0.5);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "colorWithAlphaComponent:", 0.2)));
  v15 = objc_msgSend(v14, "CGColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
  objc_msgSend(v17, "setBorderColor:", v15);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell checkmarkView](self, "checkmarkView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v19, "setBorderWidth:", 0.5);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "colorWithAlphaComponent:", 0.2)));
  v22 = objc_msgSend(v21, "CGColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  objc_msgSend(v24, "setBorderColor:", v22);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell cloudView](self, "cloudView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
  objc_msgSend(v26, "setBorderWidth:", 0.5);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "colorWithAlphaComponent:", 0.2)));
  v29 = objc_msgSend(v28, "CGColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layer"));
  objc_msgSend(v31, "setBorderColor:", v29);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layer"));
  objc_msgSend(v33, "setBorderWidth:", 0.5);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "colorWithAlphaComponent:", 0.2)));
  v36 = objc_msgSend(v35, "CGColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layer"));
  objc_msgSend(v38, "setBorderColor:", v36);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  objc_msgSend(v40, "setBorderWidth:", 0.5);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "colorWithAlphaComponent:", 0.2)));
  v43 = objc_msgSend(v42, "CGColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
  objc_msgSend(v45, "setBorderColor:", v43);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
  objc_msgSend(v47, "setBorderWidth:", 0.5);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "colorWithAlphaComponent:", 0.2)));
  v50 = objc_msgSend(v49, "CGColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "layer"));
  objc_msgSend(v52, "setBorderColor:", v50);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
  objc_msgSend(v54, "setBorderWidth:", 0.5);

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "colorWithAlphaComponent:", 0.2)));
  v57 = objc_msgSend(v56, "CGColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "layer"));
  objc_msgSend(v59, "setBorderColor:", v57);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRatingCountLabel](self, "starRatingCountLabel"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "layer"));
  objc_msgSend(v61, "setBorderWidth:", 0.5);

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "colorWithAlphaComponent:", 0.2)));
  v64 = objc_msgSend(v63, "CGColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "layer"));
  objc_msgSend(v66, "setBorderColor:", v64);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell readBuyButton](self, "readBuyButton"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "layer"));
  objc_msgSend(v68, "setBorderWidth:", 0.5);

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "colorWithAlphaComponent:", 0.2)));
  v71 = objc_msgSend(v70, "CGColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "layer"));
  objc_msgSend(v73, "setBorderColor:", v71);

  v75 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell bookDescription](self, "bookDescription"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "layer"));
  objc_msgSend(v74, "setBorderWidth:", 0.5);

}

- (BOOL)shouldDragWithTouch:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v13;
  CGPoint v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dragBarView](self, "dragBarView"));
  objc_msgSend(v8, "frame");
  v17 = CGRectInset(v16, -20.0, -20.0);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;

  v13 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
  if (v13)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v15.x = v5;
    v15.y = v7;
    LOBYTE(v13) = CGRectContainsPoint(v18, v15);
  }
  return v13;
}

- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collection"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "analyticsAssetPropertyProviderForLibraryAsset:fromSourceView:inCollection:", v7, v8, v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tracker"));
  objc_msgSend(v11, "setupAppAnalyticsReportingUsingTracker:withPropertyProvider:", v12, v19);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  objc_msgSend(v13, "setShowsMenuAsPrimaryAction:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell dataSource](self, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "menuWithLibraryAsset:sourceView:collection:", v7, v14, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell moreButton](self, "moreButton"));
  objc_msgSend(v18, "setMenu:", v17);

}

- (void)togglePlayPause:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell audiobookStatus](self, "audiobookStatus", a3));
  objc_msgSend(v3, "assetAudiobookStatusTogglePlayPause");

}

- (BOOL)needsAsset
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  return -[BKLibraryBookshelfWantToReadBookCell isAccessibilityElement](&v4, "isAccessibilityElement");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_authorLabel, "text"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell authorLabel](self, "authorLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));

  return v12;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell titleLabel](self, "titleLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    objc_msgSend(v3, "addObject:", v8);

  }
  return v3;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    -[BKLibraryBookshelfWantToReadBookCell setSelected:](self, "setSelected:", -[BKLibraryBookshelfWantToReadBookCell isSelected](self, "isSelected") ^ 1);
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
    return -[BKLibraryBookshelfWantToReadBookCell accessibilityActivate](&v4, "accessibilityActivate");
  }
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell starRating](self, "starRating"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v6, v8));
    objc_msgSend(v3, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Ratings"), &stru_10091C438, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfWantToReadBookCell asset](self, "asset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%lu"), objc_msgSend(v12, "ratingCount")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v11, v13));
    objc_msgSend(v3, "addObject:", v14);

  }
  return v3;
}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_columnMetrics, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (BKLibraryBookshelfStorageProvider)storageProvider
{
  return (BKLibraryBookshelfStorageProvider *)objc_loadWeakRetained((id *)&self->_storageProvider);
}

- (void)setStorageProvider:(id)a3
{
  objc_storeWeak((id *)&self->_storageProvider, a3);
}

- (BKLibraryBookshelfLayoutManager)layoutManager
{
  return (BKLibraryBookshelfLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (BKLibraryActionHandler)actionHandler
{
  return (BKLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (int)layoutDebugMode
{
  return self->_layoutDebugMode;
}

- (void)setLayoutDebugMode:(int)a3
{
  self->_layoutDebugMode = a3;
}

- (BKLibraryBookshelfCellMetrics_WantToRead)wantToReadMetrics
{
  return self->_wantToReadMetrics;
}

- (void)setWantToReadMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_wantToReadMetrics, a3);
}

- (CGSize)bookCoverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bookCoverSize.width;
  height = self->_bookCoverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (BOOL)stackedLayout
{
  return self->_stackedLayout;
}

- (void)setStackedLayout:(BOOL)a3
{
  self->_stackedLayout = a3;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (UIImageView)cloudView
{
  return self->_cloudView;
}

- (void)setCloudView:(id)a3
{
  objc_storeStrong((id *)&self->_cloudView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_authorLabel, a3);
}

- (IMTouchInsetsButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (BKLibraryStarRating)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(id)a3
{
  objc_storeStrong((id *)&self->_starRating, a3);
}

- (UILabel)starRatingCountLabel
{
  return self->_starRatingCountLabel;
}

- (void)setStarRatingCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_starRatingCountLabel, a3);
}

- (BCBuyGetTwoStateButton)readBuyButton
{
  return self->_readBuyButton;
}

- (void)setReadBuyButton:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyButton, a3);
}

- (UILabel)bookDescription
{
  return self->_bookDescription;
}

- (void)setBookDescription:(id)a3
{
  objc_storeStrong((id *)&self->_bookDescription, a3);
}

- (double)editMargin
{
  return self->_editMargin;
}

- (void)setEditMargin:(double)a3
{
  self->_editMargin = a3;
}

- (CAShapeLayer)separatorline
{
  return self->_separatorline;
}

- (void)setSeparatorline:(id)a3
{
  objc_storeStrong((id *)&self->_separatorline, a3);
}

- (UIImageView)dragBarView
{
  return self->_dragBarView;
}

- (void)setDragBarView:(id)a3
{
  objc_storeStrong((id *)&self->_dragBarView, a3);
}

- (IMRadialProgressButton)downloadProgressButton
{
  return self->_downloadProgressButton;
}

- (void)setDownloadProgressButton:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressButton, a3);
}

- (BKLibraryDownloadStatus)libraryDownloadStatus
{
  return self->_libraryDownloadStatus;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDownloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadProgressButton, 0);
  objc_storeStrong((id *)&self->_dragBarView, 0);
  objc_storeStrong((id *)&self->_separatorline, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_readBuyButton, 0);
  objc_storeStrong((id *)&self->_starRatingCountLabel, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cloudView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_wantToReadMetrics, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
}

@end
