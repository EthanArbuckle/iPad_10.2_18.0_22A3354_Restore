@implementation TPSSingleTipViewController

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_attributedStringOperationQueue, "cancelAllOperations");
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "analyticsIncreaseCountForCurrentTip", 0);
  v3.receiver = self;
  v3.super_class = (Class)TPSSingleTipViewController;
  -[TPSSingleTipViewController dealloc](&v3, "dealloc");
}

- (TPSSingleTipViewController)initWithAppController:(id)a3
{
  return -[TPSSingleTipViewController initWithAppController:translucentBackground:](self, "initWithAppController:translucentBackground:", a3, 0);
}

- (TPSSingleTipViewController)initWithAppController:(id)a3 translucentBackground:(BOOL)a4
{
  id v7;
  TPSSingleTipViewController *v8;
  TPSSingleTipViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSSingleTipViewController;
  v8 = -[TPSSingleTipViewController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appController, a3);
    v9->_translucentBackground = a4;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  TPSTip *pendingTip;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSSingleTipViewController;
  -[TPSSingleTipViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v3, "setCategory:error:", AVAudioSessionCategoryAmbient, 0);

  -[TPSSingleTipViewController createViews](self, "createViews");
  pendingTip = self->_pendingTip;
  if (pendingTip)
  {
    objc_storeStrong((id *)&self->_tip, pendingTip);
    -[TPSSingleTipViewController updateAssetsConfiguration](self, "updateAssetsConfiguration");
  }
  if (self->_translucentBackground)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TPSVideoAssetView setDefaultBackgroundColor:](self->_heroAssetView, "setDefaultBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TPSVideoAssetView setNoImageBackgroundColor:](self->_heroAssetView, "setNoImageBackgroundColor:", v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultBackgroundColor](TPSAppearance, "defaultBackgroundColor"));
    -[TPSVideoAssetView setDefaultBackgroundColor:](self->_heroAssetView, "setDefaultBackgroundColor:", v6);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSSingleTipViewController;
  -[TPSSingleTipViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetsConfiguration](self, "assetsConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheIdentifierForType:", 0));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSImageAssetController dataCacheForIdentifier:](TPSImageAssetController, "dataCacheForIdentifier:", v5));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSImageAssetController getImageForIdentifier:](TPSImageAssetController, "getImageForIdentifier:", v5));
      -[TPSVideoAssetView setImage:](self->_heroAssetView, "setImage:", v7);

    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSSingleTipViewController;
  -[TPSSingleTipViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_viewDidAppeared = 1;
  -[TPSSingleTipViewController playVideo](self, "playVideo");
}

- (void)cancelConstellationContentParserOperation
{
  NSBlockOperation *contentTextOperation;

  -[NSBlockOperation cancel](self->_contentTextOperation, "cancel");
  contentTextOperation = self->_contentTextOperation;
  self->_contentTextOperation = 0;

}

- (BOOL)hasPlayerInProgress
{
  return -[TPSVideoAssetView videoInProgress](self->_heroAssetView, "videoInProgress");
}

- (void)playVideo
{
  if (self->_viewDidAppeared)
    -[TPSSingleTipViewController updateVideoAndPlayImmediately:](self, "updateVideoAndPlayImmediately:", 1);
}

- (void)setupForSnapshot
{
  -[TPSVideoAssetView removeVideoPlayerLayer](self->_heroAssetView, "removeVideoPlayerLayer");
  -[TPSVideoAssetView setImage:](self->_heroAssetView, "setImage:", 0);
}

- (void)createViews
{
  TPSVideoAssetView *v3;
  TPSVideoAssetView *heroAssetView;
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
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *heroAssetViewHeightConstraint;
  double v22;
  UILabel *v23;
  UILabel *titleLabel;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *titleLabelLeadingConstraint;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UITextView *v39;
  UITextView *bodyTextView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSAttributedStringKey v63;
  void *v64;

  if (!self->_heroAssetView)
  {
    v3 = (TPSVideoAssetView *)objc_alloc_init((Class)TPSVideoAssetView);
    heroAssetView = self->_heroAssetView;
    self->_heroAssetView = v3;

    -[TPSVideoAssetView setDelegate:](self->_heroAssetView, "setDelegate:", self);
    -[TPSVideoAssetView setVideoDelegate:](self->_heroAssetView, "setVideoDelegate:", self);
    -[TPSVideoAssetView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroAssetView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    objc_msgSend(v5, "addSubview:", self->_heroAssetView);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView leadingAnchor](self->_heroAssetView, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
    objc_msgSend(v9, "setActive:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView trailingAnchor](self->_heroAssetView, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    objc_msgSend(v13, "setActive:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView topAnchor](self->_heroAssetView, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    objc_msgSend(v17, "setActive:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView heightAnchor](self->_heroAssetView, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView widthAnchor](self->_heroAssetView, "widthAnchor"));
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    heroAssetViewHeightConstraint = self->_heroAssetViewHeightConstraint;
    self->_heroAssetViewHeightConstraint = v20;

    LODWORD(v22) = 1148829696;
    -[NSLayoutConstraint setPriority:](self->_heroAssetViewHeightConstraint, "setPriority:", v22);
    -[NSLayoutConstraint setActive:](self->_heroAssetViewHeightConstraint, "setActive:", 1);
  }
  if (!self->_titleLabel)
  {
    v23 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v23;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance titleLabelFont](TPSAppearance, "titleLabelFont"));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v25);

    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    LODWORD(v26) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    objc_msgSend(v27, "insertSubview:belowSubview:", self->_titleLabel, self->_heroAssetView);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
    titleLabelLeadingConstraint = self->_titleLabelLeadingConstraint;
    self->_titleLabelLeadingConstraint = v31;

    -[NSLayoutConstraint setActive:](self->_titleLabelLeadingConstraint, "setActive:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView trailingAnchor](self->_heroAssetView, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -30.0));
    objc_msgSend(v35, "setActive:", 1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView bottomAnchor](self->_heroAssetView, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v37, 1.2));
    objc_msgSend(v38, "setActive:", 1);

  }
  if (!self->_bodyTextView)
  {
    v39 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    bodyTextView = self->_bodyTextView;
    self->_bodyTextView = v39;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setScrollEnabled:](self->_bodyTextView, "setScrollEnabled:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_bodyTextView, "_setInteractiveTextSelectionDisabled:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_bodyTextView, "setBackgroundColor:", v41);

    -[UITextView setEditable:](self->_bodyTextView, "setEditable:", 0);
    -[UITextView setDataDetectorTypes:](self->_bodyTextView, "setDataDetectorTypes:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_bodyTextView, "textContainer"));
    objc_msgSend(v42, "setHeightTracksTextView:", 1);

    -[UITextView setDelegate:](self->_bodyTextView, "setDelegate:", self);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_bodyTextView, "textContainer"));
    objc_msgSend(v43, "setLineBreakMode:", 4);

    -[UITextView setTextContainerInset:](self->_bodyTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_bodyTextView, "textContainer"));
    objc_msgSend(v44, "setLineFragmentPadding:", 0.0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
    -[UITextView setTextColor:](self->_bodyTextView, "setTextColor:", v45);

    if (self->_supportInlineLinks)
    {
      v63 = NSForegroundColorAttributeName;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v64 = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
      -[UITextView setLinkTextAttributes:](self->_bodyTextView, "setLinkTextAttributes:", v47);

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    objc_msgSend(v48, "insertSubview:belowSubview:", self->_bodyTextView, self->_heroAssetView);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_bodyTextView, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, 30.0));
    objc_msgSend(v52, "setActive:", 1);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_bodyTextView, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
    objc_msgSend(v55, "setActive:", 1);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_bodyTextView, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, -12.0));
    objc_msgSend(v59, "setActive:", 1);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView firstBaselineAnchor](self->_bodyTextView, "firstBaselineAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v61, 1.2));
    objc_msgSend(v62, "setActive:", 1);

  }
}

- (void)analyticsIncreaseCountForCurrentTip
{
  TPSTip *tip;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "analyticsIncreaseCountForCurrentTip", 0);
  tip = self->_tip;
  if (tip)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](tip, "identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController collectionID](self, "collectionID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_tip, "correlationID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip clientConditionID](self->_tip, "clientConditionID"));
    v7 = TPSAnalyticsViewMethodNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController traitCollection](self, "traitCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:](TPSAnalyticsEventContentViewed, "analyticsViewModeForTraitCollection:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:](TPSAnalyticsEventContentViewed, "eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:", v12, v4, v5, v6, v7, v9));
    objc_msgSend(v10, "log");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "singleTipViewController:tipViewed:", self, self->_tip);

  }
}

- (void)setTip:(id)a3
{
  -[TPSSingleTipViewController setTip:visible:](self, "setTip:visible:", a3, 1);
}

- (void)setTip:(id)a3 visible:(BOOL)a4
{
  -[TPSSingleTipViewController setTip:visible:completionHandler:](self, "setTip:visible:completionHandler:", a3, a4, 0);
}

- (void)setTip:(id)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  int *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *heroAssetViewHeightRatioConstraint;
  void *v33;
  void *v34;
  id heroAssetFetchCompletionHandler;
  double v36;
  void *v37;
  TPSTip *pendingTip;
  _BOOL4 v39;
  _QWORD v40[4];
  id v41;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "language"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  objc_msgSend(v12, "setLanguage:", v11);

  if (self->_titleLabel)
  {
    v39 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](self->_tip, "identifier"));
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetSizes](self, "assetSizes"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tip"));

      v18 = (int *)&unk_10000D000;
      if (!v17)
        goto LABEL_8;
      v19 = +[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI") ^ 1;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetSizes](self, "assetSizes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tip"));
      objc_msgSend(v21, "heightToWidthRatioForViewMode:", v19);
      v23 = v22;

      v18 = (_DWORD *)&unk_10000D000;
      if (v23 > 0.0)
      {
        v24 = 0.0;
      }
      else
      {
LABEL_8:
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
        v26 = objc_msgSend(v25, "assetRatioType");
        if (+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI"))
        {
          v23 = dbl_1000055D0[v26 == (id)1];
          v24 = 0.0;
        }
        else
        {
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v18[489]), "setAspectFillAsset:", 1);
          v23 = 0.9644;
          v24 = 110.05;
        }

      }
      -[NSLayoutConstraint setActive:](self->_heroAssetViewHeightConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_heroAssetViewHeightRatioConstraint, "setActive:", 0);
      v27 = v18[489];
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v27), "heightAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
      v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:multiplier:constant:", v30, v23, -v24));
      heroAssetViewHeightRatioConstraint = self->_heroAssetViewHeightRatioConstraint;
      self->_heroAssetViewHeightRatioConstraint = v31;

      -[NSLayoutConstraint setActive:](self->_heroAssetViewHeightRatioConstraint, "setActive:", 1);
      objc_storeStrong((id *)&self->_tip, a3);
      -[TPSSingleTipViewController updateAssetsConfiguration](self, "updateAssetsConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "language"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance"));
      objc_msgSend(v34, "setLanguageCode:", v33);

      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v27), "cancel");
      heroAssetFetchCompletionHandler = self->_heroAssetFetchCompletionHandler;
      self->_heroAssetFetchCompletionHandler = 0;

      -[NSLayoutConstraint constant](self->_titleLabelLeadingConstraint, "constant");
      if (v36 == 0.0)
        -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:", 30.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip title](self->_tip, "title"));
      -[UILabel setText:](self->_titleLabel, "setText:", v37);

      -[TPSSingleTipViewController updateBodyText](self, "updateBodyText");
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000020D0;
      v40[3] = &unk_100008308;
      v41 = v10;
      -[TPSSingleTipViewController updateImageWithCompletionHandler:](self, "updateImageWithCompletionHandler:", v40);
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v27), "stopVideoPlayer");
      if (v39)
      {
        -[TPSSingleTipViewController updateVideoAndPlayImmediately:](self, "updateVideoAndPlayImmediately:", 0);
        -[TPSSingleTipViewController scheduleIncreaseViewCount](self, "scheduleIncreaseViewCount");
      }
      pendingTip = self->_pendingTip;
      self->_pendingTip = 0;

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingTip, a3);
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)updateAssetsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController appController](self, "appController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fullContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "language"));
  if (+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI"))
    v6 = 1;
  else
    v6 = 2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  v9 = objc_msgSend(v8, "userInterfaceStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetFileInfoManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetConfigurationForAssets:language:sizeClass:style:assetFileInfoManager:", v3, v5, v6, v9, v11));
  -[TPSSingleTipViewController setAssetsConfiguration:](self, "setAssetsConfiguration:", v12);

}

- (void)scheduleIncreaseViewCount
{
  -[TPSSingleTipViewController cancelScheduledIncreaseViewCount](self, "cancelScheduledIncreaseViewCount");
  if (self->_tip)
    -[TPSSingleTipViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "analyticsIncreaseCountForCurrentTip", 0, kTipsAnalyticsDelayedEventInterval);
}

- (void)cancelScheduledIncreaseViewCount
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "analyticsIncreaseCountForCurrentTip", 0);
}

- (BOOL)isOneLinerForText:(id)a3 maxWidth:(double)a4 font:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Height;
  double v19;
  double v20;
  NSAttributedStringKey v22;
  id v23;
  CGRect v24;

  if (!a5)
    return 0;
  v22 = NSFontAttributeName;
  v23 = a5;
  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v9, 0, a4, 1.79769313e308);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  Height = CGRectGetHeight(v24);
  objc_msgSend(v7, "lineHeight");
  v20 = v19;

  return Height == v20;
}

- (double)maxWidth
{
  void *v2;
  double Width;
  CGRect v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
  objc_msgSend(v2, "bounds");
  Width = CGRectGetWidth(v5);

  return Width;
}

- (void)updateBodyText
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSOperationQueue *v11;
  NSOperationQueue *attributedStringOperationQueue;
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
  NSBlockOperation *v23;
  NSBlockOperation *contentTextOperation;
  NSBlockOperation *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id from;
  id location;
  _QWORD v46[2];
  _QWORD v47[2];

  -[TPSSingleTipViewController cancelConstellationContentParserOperation](self, "cancelConstellationContentParserOperation");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultTextLabelFont](TPSAppearance, "defaultTextLabelFont"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
  v46[0] = NSFontAttributeName;
  v46[1] = NSForegroundColorAttributeName;
  v47[0] = v33;
  v47[1] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bodyText"));

  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v4, v31);
    v6 = (id)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController bodyTextView](self, "bodyTextView"));
    objc_msgSend(v6, "setAttributedText:", v5);
LABEL_7:

    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bodyContent"));

  if (v5)
  {
    v8 = objc_alloc_init((Class)TPSConstellationContentParser);
    objc_msgSend(v8, "setDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    objc_msgSend(v8, "setTraitCollection:", v10);

    objc_msgSend(v8, "setIgnoreLinks:", !self->_supportInlineLinks);
    if (!self->_attributedStringOperationQueue)
    {
      v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
      attributedStringOperationQueue = self->_attributedStringOperationQueue;
      self->_attributedStringOperationQueue = v11;

      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_attributedStringOperationQueue, "setMaxConcurrentOperationCount:", 4);
    }
    objc_initWeak(&location, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    objc_initWeak(&from, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "language"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fullContentAssets"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "baseURL"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "assetFileInfoManager"));

    v23 = (NSBlockOperation *)objc_alloc_init((Class)NSBlockOperation);
    contentTextOperation = self->_contentTextOperation;
    self->_contentTextOperation = v23;

    v25 = self->_contentTextOperation;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000028C4;
    v34[3] = &unk_100008358;
    v6 = v8;
    v35 = v6;
    v5 = v5;
    v36 = v5;
    v37 = v31;
    v28 = v29;
    v38 = v28;
    v30 = v17;
    v39 = v30;
    v26 = v20;
    v40 = v26;
    v27 = v22;
    v41 = v27;
    objc_copyWeak(&v42, &location);
    objc_copyWeak(&v43, &from);
    -[NSBlockOperation addExecutionBlock:](v25, "addExecutionBlock:", v34);
    -[NSOperationQueue addOperation:](self->_attributedStringOperationQueue, "addOperation:", self->_contentTextOperation);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v42);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateImageWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  TPSVideoAssetView *heroAssetView;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  id heroAssetFetchCompletionHandler;
  void (**v13)(id, _QWORD);

  v13 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetsConfiguration](self, "assetsConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v4, 0));

  heroAssetView = self->_heroAssetView;
  if (!v5)
  {
    -[TPSVideoAssetView cancel](heroAssetView, "cancel");
    -[TPSVideoAssetView setImage:](self->_heroAssetView, "setImage:", 0);
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView currentImagePath](heroAssetView, "currentImagePath"));
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
  {
LABEL_5:
    v13[2](v13, 0);
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetsConfiguration](self, "assetsConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cacheIdentifierForType:", 0));

  v11 = objc_msgSend(v13, "copy");
  heroAssetFetchCompletionHandler = self->_heroAssetFetchCompletionHandler;
  self->_heroAssetFetchCompletionHandler = v11;

  -[TPSVideoAssetView fetchImageWithIdentifier:path:](self->_heroAssetView, "fetchImageWithIdentifier:path:", v10, v5);
LABEL_6:

}

- (void)scrubVideoToFirstFrame
{
  -[TPSVideoAssetView scrubVideoToFirstFrame](self->_heroAssetView, "scrubVideoToFirstFrame");
}

- (void)replayVideo
{
  -[TPSVideoAssetView replayVideo](self->_heroAssetView, "replayVideo");
}

- (void)updateVideoAndPlayImmediately:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetsConfiguration](self, "assetsConfiguration"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheIdentifierForType:", 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController assetsConfiguration](self, "assetsConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v6, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView videoPath](self->_heroAssetView, "videoPath"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    if (!v3)
      goto LABEL_6;
  }
  else
  {
    -[TPSVideoAssetView setCacheVideoIdentifier:](self->_heroAssetView, "setCacheVideoIdentifier:", v10);
    -[TPSVideoAssetView setVideoPath:](self->_heroAssetView, "setVideoPath:", v7);
  }
  -[TPSVideoAssetView playVideo](self->_heroAssetView, "playVideo");
LABEL_6:

}

- (id)constellationContentParserBoldFont:(id)a3
{
  return +[TPSAppearance boldTextFont](TPSAppearance, "boldTextFont", a3);
}

- (id)constellationContentParserItalicFont:(id)a3
{
  return +[TPSAppearance italicTextFont](TPSAppearance, "italicTextFont", a3);
}

- (void)constellationContentParser:(id)a3 identifier:(id)a4 attributedStringUpdated:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController tip](self, "tip"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController bodyTextView](self, "bodyTextView"));
    objc_msgSend(v11, "setAttributedText:", v12);

  }
}

- (void)imageAssetViewImageUpdated:(id)a3
{
  TPSVideoAssetView *v4;
  void (**heroAssetFetchCompletionHandler)(id, BOOL);
  void *v6;
  id v7;
  TPSVideoAssetView *v8;

  v4 = (TPSVideoAssetView *)a3;
  heroAssetFetchCompletionHandler = (void (**)(id, BOOL))self->_heroAssetFetchCompletionHandler;
  if (heroAssetFetchCompletionHandler && self->_heroAssetView == v4)
  {
    v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSVideoAssetView image](v4, "image"));
    heroAssetFetchCompletionHandler[2](heroAssetFetchCompletionHandler, v6 != 0);

    v7 = self->_heroAssetFetchCompletionHandler;
    self->_heroAssetFetchCompletionHandler = 0;

    v4 = v8;
  }

}

- (BOOL)_textView:(id)a3 shouldHighlightForInteractionInRange:(_NSRange)a4
{
  return 0;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  return 0;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;

  v6 = a4;
  if (!objc_msgSend(v6, "contentType"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "singleTipViewController:handleURL:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "link"));
      objc_msgSend(v9, "singleTipViewController:handleURL:", self, v10);

    }
  }

  return 0;
}

- (TPSSingleTipViewControllerDelegate)delegate
{
  return (TPSSingleTipViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)supportInlineLinks
{
  return self->_supportInlineLinks;
}

- (void)setSupportInlineLinks:(BOOL)a3
{
  self->_supportInlineLinks = a3;
}

- (BOOL)translucentBackground
{
  return self->_translucentBackground;
}

- (void)setTranslucentBackground:(BOOL)a3
{
  self->_translucentBackground = a3;
}

- (TPSTip)tip
{
  return self->_tip;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_assetSizes, a3);
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTextView, a3);
}

- (TPSAssetsConfiguration)assetsConfiguration
{
  return self->_assetsConfiguration;
}

- (void)setAssetsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_assetsConfiguration, a3);
}

- (NSBlockOperation)contentTextOperation
{
  return self->_contentTextOperation;
}

- (void)setContentTextOperation:(id)a3
{
  objc_storeStrong((id *)&self->_contentTextOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTextOperation, 0);
  objc_storeStrong((id *)&self->_assetsConfiguration, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_tip, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heroAssetView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attributedStringOperationQueue, 0);
  objc_storeStrong((id *)&self->_heroAssetViewHeightRatioConstraint, 0);
  objc_storeStrong((id *)&self->_heroAssetViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_pendingTip, 0);
  objc_storeStrong(&self->_heroAssetFetchCompletionHandler, 0);
}

@end
