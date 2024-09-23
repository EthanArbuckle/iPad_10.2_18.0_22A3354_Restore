@implementation CHFriendsSetupViewController

- (CHFriendsSetupViewController)init
{
  CHFriendsSetupViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHFriendsSetupViewController;
  result = -[CHFriendsSetupViewController init](&v3, "init");
  if (result)
    result->_phase = 0;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id *v9;
  id v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  UILabel *v18;
  UILabel *currentDescriptionLabel;
  id v20;
  UILabel *v21;
  UILabel *nextDescriptionLabel;
  void *v23;
  void *v24;
  void *v25;
  UIButton *v26;
  UIButton *nextButton;
  OBPrivacyLinkController *v28;
  OBPrivacyLinkController *privacyLink;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  id location;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CHFriendsSetupViewController;
  -[CHFriendsSetupViewController viewDidLoad](&v41, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNavigationBarHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
  if (v8 <= 375.0)
    v9 = (id *)&UIContentSizeCategoryLarge;
  v10 = *v9;
  -[CHFriendsSetupViewController configurePlayer](self, "configurePlayer");
  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[UILabel setText:](self->_titleLabel, "setText:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleTitle0));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v16);

  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAccessibilityTraits:](self->_titleLabel, "setAccessibilityTraits:", UIAccessibilityTraitHeader);
  objc_msgSend(v4, "addSubview:", self->_titleLabel);
  v17 = sub_1000AF650();
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue(v17);
  currentDescriptionLabel = self->_currentDescriptionLabel;
  self->_currentDescriptionLabel = v18;

  objc_msgSend(v4, "addSubview:", self->_currentDescriptionLabel);
  v20 = sub_1000AF650();
  v21 = (UILabel *)objc_claimAutoreleasedReturnValue(v20);
  nextDescriptionLabel = self->_nextDescriptionLabel;
  self->_nextDescriptionLabel = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v23, "setButtonSize:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  objc_msgSend(v23, "setBaseBackgroundColor:", v24);

  objc_initWeak(&location, self);
  v35 = _NSConcreteStackBlock;
  v36 = 3221225472;
  v37 = sub_1000AF714;
  v38 = &unk_100778070;
  objc_copyWeak(&v39, &location);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v35));
  v26 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v23, v25, v35, v36, v37, v38));
  nextButton = self->_nextButton;
  self->_nextButton = v26;

  -[UIButton setMaximumContentSizeCategory:](self->_nextButton, "setMaximumContentSizeCategory:", v10);
  objc_msgSend(v4, "addSubview:", self->_nextButton);
  v28 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.activity")));
  privacyLink = self->_privacyLink;
  self->_privacyLink = v28;

  -[OBPrivacyLinkController setPresentedViewControllerShouldUseDarkMode:](self->_privacyLink, "setPresentedViewControllerShouldUseDarkMode:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v30, "setMaximumContentSizeCategory:", v10);

  -[CHFriendsSetupViewController addChildViewController:](self, "addChildViewController:", self->_privacyLink);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v31, "addSubview:", v32);

  -[CHFriendsSetupViewController setPhase:animated:](self, "setPhase:animated:", self->_phase, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v33, "addObserver:selector:name:object:", self, "_willEnterForeground", UIApplicationWillEnterForegroundNotification, 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v34, "addObserver:selector:name:object:", self, "_didEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

- (void)_willEnterForeground
{
  id v3;

  -[CHFriendsSetupViewController configurePlayer](self, "configurePlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[AVPlayerLayer player](self->_onboardingPlayerLayer, "player"));
  objc_msgSend(v3, "play");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double MidX;
  CGFloat Width;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MidY;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  UILabel *currentDescriptionLabel;
  UILabel *nextDescriptionLabel;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double Height;
  double v75;
  double y;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  _QWORD v82[2];
  _BYTE v83[128];
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v81.receiver = self;
  v81.super_class = (Class)CHFriendsSetupViewController;
  -[CHFriendsSetupViewController viewDidLayoutSubviews](&v81, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v84.origin.x = v5;
  v84.origin.y = v7;
  v84.size.width = v9;
  v84.size.height = v11;
  MidX = CGRectGetMidX(v84);
  v85.origin.x = v5;
  v85.origin.y = v7;
  v85.size.width = v9;
  v85.size.height = v11;
  Width = CGRectGetWidth(v85);
  v86.origin.x = v5;
  v86.origin.y = v7;
  v14 = Width;
  v86.size.width = v9;
  v15 = v9;
  v86.size.height = v11;
  Height = CGRectGetHeight(v86);
  v16 = sub_10008443C(MidX, v14 + -32.0);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  y = CGPointZero.y;
  -[AVPlayerLayer setBounds:](self->_onboardingPlayerLayer, "setBounds:");
  -[AVPlayerLayer setPosition:](self->_onboardingPlayerLayer, "setPosition:", v16, 183.0);
  +[CATransaction commit](CATransaction, "commit");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v17, "_scaledValueForValue:", 24.0);
  v19 = v18;

  -[AVPlayerLayer frame](self->_onboardingPlayerLayer, "frame");
  v20 = v19 + CGRectGetMaxY(v87);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  v75 = v20;
  -[UILabel _setFirstLineBaselineFrameOriginY:](self->_titleLabel, "_setFirstLineBaselineFrameOriginY:", v20);
  v21 = MidX;
  v22 = sub_10008443C(MidX, v14);
  -[UILabel frame](self->_titleLabel, "frame");
  MidY = CGRectGetMidY(v88);
  -[UILabel frame](self->_titleLabel, "frame");
  v24 = CGRectGetHeight(v89);
  v25 = sub_10008443C(MidY, v24);
  -[UILabel bounds](self->_titleLabel, "bounds");
  v73 = v14;
  -[UILabel setBounds:](self->_titleLabel, "setBounds:", 0.0, 0.0, v14, CGRectGetHeight(v90));
  -[UILabel setPosition:](self->_titleLabel, "setPosition:", v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  objc_msgSend(v26, "directionalLayoutMargins");
  v28 = v15 - v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  objc_msgSend(v29, "directionalLayoutMargins");
  v31 = v28 - v30;

  -[UIButton systemLayoutSizeFittingSize:](self->_nextButton, "systemLayoutSizeFittingSize:", v15, v11);
  v33 = v32;
  v34 = sub_10008443C(Height + -44.0 - v32 * 0.5, v32);
  v35 = sub_10008443C(MidX, v31);
  -[UIButton setBounds:](self->_nextButton, "setBounds:", 0.0, 0.0, v31, v33);
  -[UIButton setCenter:](self->_nextButton, "setCenter:", v35, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  objc_msgSend(v36, "directionalLayoutMargins");
  v38 = v15 - v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  objc_msgSend(v39, "directionalLayoutMargins");
  v41 = v38 - v40;

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  LODWORD(v43) = 1148846080;
  LODWORD(v44) = 1112014848;
  objc_msgSend(v42, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v41, 0.0, v43, v44);
  v46 = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v47, "setBounds:", 0.0, 0.0, v41, v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v48, "setPosition:", v21, Height + -44.0 - v33 + -30.0 - v46 * 0.5);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v49, "frameOrigin");
  v51 = v50;

  currentDescriptionLabel = self->_currentDescriptionLabel;
  nextDescriptionLabel = self->_nextDescriptionLabel;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v82[0] = currentDescriptionLabel;
  v82[1] = nextDescriptionLabel;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "font"));
        objc_msgSend(v60, "_scaledValueForValue:", 32.0);
        v62 = v61;

        v63 = v75 + v62;
        objc_msgSend(v59, "sizeThatFits:", v73 + -54.0, 1.79769313e308);
        v65 = v64;
        *(float *)&v64 = v66;
        *(float *)&v66 = v51 - v63;
        objc_msgSend(v59, "setBounds:", CGPointZero.x, y, v65, fminf(*(float *)&v64, *(float *)&v66));
        objc_msgSend(v59, "frame");
        v68 = v67;
        v70 = v69;
        v71 = sub_10008446C(v21, v65);
        objc_msgSend(v59, "_firstBaselineOffsetFromTop");
        objc_msgSend(v59, "setFrame:", v71, UIRoundToViewScale(0, v63 - v72), v68, v70);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v56);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendsSetupViewController;
  -[CHFriendsSetupViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  -[CHFriendsSetupViewController configurePlayer](self, "configurePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerLayer player](self->_onboardingPlayerLayer, "player"));
  objc_msgSend(v4, "play");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHFriendsSetupViewController;
  -[CHFriendsSetupViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[CHFriendsSetupViewController teardownPlayer](self, "teardownPlayer");
}

- (void)configurePlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AVPlayer *v7;
  AVPlayer *onboardingVideoPlayer;
  AVPlayerLayer *v9;
  AVPlayerLayer *onboardingPlayerLayer;
  void *v11;
  void *v12;
  id v13;

  if (!self->_onboardingVideoPlayer && !self->_onboardingPlayerLayer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("ActivitySharingOnboarding"), CFSTR("mov")));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v5));
    v7 = (AVPlayer *)objc_alloc_init((Class)AVPlayer);
    onboardingVideoPlayer = self->_onboardingVideoPlayer;
    self->_onboardingVideoPlayer = v7;

    -[AVPlayer _setParticipatesInAudioSession:](self->_onboardingVideoPlayer, "_setParticipatesInAudioSession:", 0);
    -[AVPlayer setPreventsDisplaySleepDuringVideoPlayback:](self->_onboardingVideoPlayer, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_onboardingVideoPlayer, "replaceCurrentItemWithPlayerItem:", v6);
    v9 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](AVPlayerLayer, "playerLayerWithPlayer:", self->_onboardingVideoPlayer));
    onboardingPlayerLayer = self->_onboardingPlayerLayer;
    self->_onboardingPlayerLayer = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    objc_msgSend(v12, "addSublayer:", self->_onboardingPlayerLayer);

  }
}

- (void)teardownPlayer
{
  AVPlayer *onboardingVideoPlayer;
  AVPlayerLayer *onboardingPlayerLayer;

  -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_onboardingVideoPlayer, "replaceCurrentItemWithPlayerItem:", 0);
  -[AVPlayerLayer setPlayer:](self->_onboardingPlayerLayer, "setPlayer:", 0);
  -[AVPlayerLayer removeFromSuperlayer](self->_onboardingPlayerLayer, "removeFromSuperlayer");
  onboardingVideoPlayer = self->_onboardingVideoPlayer;
  self->_onboardingVideoPlayer = 0;

  onboardingPlayerLayer = self->_onboardingPlayerLayer;
  self->_onboardingPlayerLayer = 0;

}

- (void)setPhase:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;

  v4 = a4;
  self->_phase = a3;
  if (!-[CHFriendsSetupViewController isViewLoaded](self, "isViewLoaded"))
    return;
  switch(a3)
  {
    case 0:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_PRIMARY_DESCRIPTION"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[UILabel setText:](self->_nextDescriptionLabel, "setText:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_PRIMARY_BUTTON_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
LABEL_15:

      break;
    case 1:
      v27 = 0;
      v14 = -[CHFriendsSetupViewController _isManagedAppleId:](self, "_isManagedAppleId:", &v27);
      v15 = v27;
      v13 = v15;
      if (v14)
      {
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_CLOUDKIT_DESCRIPTION_RESTRICTED"), &stru_1007AE1D0, CFSTR("Localizable")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v13));
          -[UILabel setText:](self->_nextDescriptionLabel, "setText:", v18);

LABEL_14:
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_CLOUDKIT_BUTTON_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));

          goto LABEL_15;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v19;
        v20 = CFSTR("SHARING_SETUP_CLOUDKIT_DESCRIPTION_RESTRICTED_NO_USERNAME");
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = v19;
        v20 = CFSTR("SHARING_SETUP_CLOUDKIT_DESCRIPTION");
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_1007AE1D0, CFSTR("Localizable")));
      -[UILabel setText:](self->_nextDescriptionLabel, "setText:", v17);
      goto LABEL_14;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_UPGRADE_WATCH_DESCRIPTION"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[UILabel setText:](self->_nextDescriptionLabel, "setText:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_UPGRADE_WATCH_BUTTON_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));

      break;
    default:
      v10 = 0;
      break;
  }
  -[UILabel setAlpha:](self->_nextDescriptionLabel, "setAlpha:", 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController view](self, "view"));
  objc_msgSend(v22, "insertSubview:below:", self->_nextDescriptionLabel, self->_currentDescriptionLabel);

  -[UIButton setTitle:forState:](self->_nextButton, "setTitle:forState:", v10, 0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000B03A4;
  v26[3] = &unk_100777E20;
  v26[4] = self;
  v23 = objc_retainBlock(v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000B03EC;
  v25[3] = &unk_100778DB0;
  v25[4] = self;
  v24 = objc_retainBlock(v25);
  if (v4)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v23, v24, 0.35);
  }
  else
  {
    ((void (*)(_QWORD *))v23[2])(v23);
    ((void (*)(_QWORD *, uint64_t))v24[2])(v24, 1);
  }

}

- (BOOL)_isManagedAppleId:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  uint8_t v11[16];

  v4 = objc_alloc_init((Class)ACAccountStore);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryAppleAccount"));
  v6 = v5;
  if (v5 && (v7 = objc_msgSend(v5, "aa_isManagedAppleID"), (_DWORD)v7))
  {
    ASLoggingInitialize(v7);
    v8 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Apple ID is a managed account, reverting to unsigned-in behavior", v11, 2u);
    }
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_nextButtonTapped
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController delegate](self, "delegate"));
  objc_msgSend(v3, "friendsSetupViewController:didCompletePhase:", self, self->_phase);

  if (!self->_phase)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController delegate](self, "delegate"));
    v5 = objc_msgSend(v4, "friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:", self);

    if (v5)
    {
      -[CHFriendsSetupViewController setPhase:animated:](self, "setPhase:animated:", 1, 1);
    }
    else
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendsSetupViewController delegate](self, "delegate"));
      objc_msgSend(v6, "friendsSetupViewControllerDidCompleteSetup:", self);

    }
  }
}

- (CHFriendsSetupViewControllerDelegate)delegate
{
  return (CHFriendsSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_onboardingPlayerLayer, 0);
  objc_storeStrong((id *)&self->_onboardingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_nextDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_currentDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
