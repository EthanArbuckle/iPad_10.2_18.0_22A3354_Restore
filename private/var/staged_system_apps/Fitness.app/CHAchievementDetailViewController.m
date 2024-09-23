@implementation CHAchievementDetailViewController

+ (id)resourceProvider
{
  if (qword_10083DF78 != -1)
    dispatch_once(&qword_10083DF78, &stru_100778EC0);
  return (id)qword_10083DF70;
}

- (CHAchievementDetailViewController)initWithAchievement:(id)a3 locProvider:(id)a4 formatsForFriend:(BOOL)a5 forDayView:(BOOL)a6
{
  return -[CHAchievementDetailViewController initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:](self, "initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:", a3, a4, a5, a6, 0, 0);
}

- (CHAchievementDetailViewController)initWithAchievement:(id)a3 locProvider:(id)a4 formatsForFriend:(BOOL)a5 forDayView:(BOOL)a6 forModalPresentation:(BOOL)a7 shouldShowCelebration:(BOOL)a8
{
  _BOOL8 v11;
  id v15;
  id v16;
  CHAchievementDetailViewController *v17;
  CHAchievementDetailViewController *v18;
  AAUIAchievementFormatter *v19;
  AAUIAchievementFormatter *formatter;
  AAUIBadgeView *v21;
  AAUIBadgeView *badgeView;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v11 = a5;
  v15 = a3;
  v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CHAchievementDetailViewController;
  v17 = -[CHAchievementDetailViewController initWithNibName:bundle:](&v30, "initWithNibName:bundle:", 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_achievement, a3);
    v18->_earned = objc_msgSend(v15, "unearned") ^ 1;
    objc_storeStrong((id *)&v18->_locProvider, a4);
    v19 = (AAUIAchievementFormatter *)objc_msgSend(objc_alloc((Class)AAUIAchievementFormatter), "initWithStyle:achievement:achLocalizationProvider:", 1, v15, v18->_locProvider);
    formatter = v18->_formatter;
    v18->_formatter = v19;

    -[AAUIAchievementFormatter setFormatsForFriend:](v18->_formatter, "setFormatsForFriend:", v11);
    v18->_forDayView = a6;
    v18->_forModalPresentation = a7;
    v18->_shouldShowCelebration = a8;
    v21 = (AAUIBadgeView *)objc_msgSend(objc_alloc((Class)AAUIBadgeView), "initUsingEarnedShader:", v18->_earned);
    badgeView = v18->_badgeView;
    v18->_badgeView = v21;

    -[AAUIBadgeView setOpaque:](v18->_badgeView, "setOpaque:", 0);
    -[AAUIBadgeView setAutoresizingMask:](v18->_badgeView, "setAutoresizingMask:", 0);
    -[CHAchievementDetailViewController configureBadgeView](v18, "configureBadgeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v18, "textSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    if (!v11)
    {
      v24 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, v18, "shareTapped:");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController navigationItem](v18, "navigationItem"));
      objc_msgSend(v25, "setRightBarButtonItem:", v24);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v18, "appWillResignActive:", UIApplicationWillResignActiveNotification, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v18, "_willEnterForeground", UIApplicationWillEnterForegroundNotification, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v18, "_didEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  }
  return v18;
}

- (void)_willEnterForeground
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[CHAchievementDetailViewController setupCelebrationVideoIfNeeded](self, "setupCelebrationVideoIfNeeded");
  -[CHAchievementDetailViewController setDidAppear:](self, "setDidAppear:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayer](self, "avPlayer"));

  if (v3)
  {
    v4 = ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Playing achievement celebration video", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayer](self, "avPlayer"));
    objc_msgSend(v6, "play");

  }
  else if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation"))
  {
    -[CHAchievementDetailViewController animateModalBadgeViewIfNeeded](self, "animateModalBadgeViewIfNeeded");
  }
}

- (void)configureBadgeView
{
  id v3;
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
  _QWORD v17[4];
  id v18;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "resourceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "badgeConfigurationForAchievement:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController formatter](self, "formatter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedAttributedBacksideString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController formatter](self, "formatter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedAttributedShortenedBacksideString"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  objc_msgSend(v11, "setConfiguration:", v6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backSideIconImageForAchievement:", v13));
  objc_msgSend(v12, "setBadgeBacksideIcon:", v14);

  if (objc_msgSend(v8, "length"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v15, "setBadgeBacksideAttributedString:", v8);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100082490;
    v17[3] = &unk_100778EE8;
    v18 = v10;
    objc_msgSend(v16, "setShortenedBadgeBacksideStringProvider:", v17);

  }
}

- (void)placeBadgeViewInContainer
{
  void *v3;
  void *v4;
  double MidX;
  void *v6;
  double MidY;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  objc_msgSend(v3, "addSubview:", v4);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  objc_msgSend(v9, "bounds");
  MidX = CGRectGetMidX(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  objc_msgSend(v6, "bounds");
  MidY = CGRectGetMidY(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  objc_msgSend(v8, "setCenter:", MidX, MidY);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  objc_super v111;

  v111.receiver = self;
  v111.super_class = (Class)CHAchievementDetailViewController;
  -[CHAchievementDetailViewController viewDidLoad](&v111, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation"))
  {
    v6 = objc_alloc_init((Class)UIView);
    -[CHAchievementDetailViewController setCelebrationVideoContainer:](self, "setCelebrationVideoContainer:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
    objc_msgSend(v8, "addSubview:", v9);

  }
  v10 = objc_alloc_init((Class)UIView);
  -[CHAchievementDetailViewController setBadgeContainer:](self, "setBadgeContainer:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_alloc_init((Class)UILabel);
  -[CHAchievementDetailViewController setLabel:](self, "setLabel:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  objc_msgSend(v15, "setNumberOfLines:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  LODWORD(v17) = 1148846080;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  LODWORD(v19) = 1148846080;
  objc_msgSend(v18, "setContentHuggingPriority:forAxis:", 1, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  objc_msgSend(v21, "addSubview:", v22);

  LODWORD(v22) = -[CHAchievementDetailViewController forDayView](self, "forDayView");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController formatter](self, "formatter"));
  v24 = v23;
  if ((_DWORD)v22)
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedAttributedCombinedStringWithoutProgress"));
  else
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedAttributedCombinedString"));
  v26 = (void *)v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  objc_msgSend(v27, "setAttributedText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 16.0));
  objc_msgSend(v32, "setActive:", 1);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -16.0));
  objc_msgSend(v37, "setActive:", 1);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "lastBaselineAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "safeAreaLayoutGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  objc_msgSend(v43, "_scaledValueForValue:", -12.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v42));
  -[CHAchievementDetailViewController setTextBottomBaselineConstraint:](self, "setTextBottomBaselineConstraint:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController textBottomBaselineConstraint](self, "textBottomBaselineConstraint"));
  objc_msgSend(v45, "setActive:", 1);

  v46 = objc_alloc_init((Class)UILayoutGuide);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  objc_msgSend(v47, "addLayoutGuide:", v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, 16.0));
  objc_msgSend(v51, "setActive:", 1);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, -16.0));
  objc_msgSend(v55, "setActive:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "safeAreaLayoutGuide"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v59, 24.0));
  objc_msgSend(v60, "setActive:", 1);

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, -24.0));
  objc_msgSend(v64, "setActive:", 1);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "centerXAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "centerXAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
  objc_msgSend(v68, "setActive:", 1);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "centerYAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "centerYAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v71));
  objc_msgSend(v72, "setActive:", 1);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "widthAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "widthAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));

  LODWORD(v77) = 1144750080;
  objc_msgSend(v76, "setPriority:", v77);
  objc_msgSend(v76, "setActive:", 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "heightAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "widthAnchor"));
  +[AAUIBadgeView badgeAspectRatio](AAUIBadgeView, "badgeAspectRatio");
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:multiplier:", v81, 1.0 / v82));
  objc_msgSend(v83, "setActive:", 1);

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "heightAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "heightAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:multiplier:", v86, 1.0));
  objc_msgSend(v87, "setActive:", 1);

  if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation"))
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v91));
    objc_msgSend(v92, "setActive:", 1);

    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v96));
    objc_msgSend(v97, "setActive:", 1);

    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "trailingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v101));
    objc_msgSend(v102, "setActive:", 1);

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "bottomAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "safeAreaLayoutGuide"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "bottomAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v107));
    objc_msgSend(v108, "setActive:", 1);

    v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
    objc_msgSend(v110, "setBackgroundColor:", v109);

    -[CHAchievementDetailViewController placeBadgeViewInContainer](self, "placeBadgeViewInContainer");
    -[CHAchievementDetailViewController setupCelebrationVideoIfNeeded](self, "setupCelebrationVideoIfNeeded");
  }

}

- (void)setupCelebrationVideoIfNeeded
{
  void *v3;
  unsigned __int8 v4;

  if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation")
    && -[CHAchievementDetailViewController shouldShowCelebration](self, "shouldShowCelebration"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
    v4 = objc_msgSend(v3, "unearned");

    if ((v4 & 1) == 0)
      -[CHAchievementDetailViewController configurePlayer](self, "configurePlayer");
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CHAchievementDetailViewController;
  -[CHAchievementDetailViewController viewWillLayoutSubviews](&v17, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation"))
    {
      if (!self->_celebrationComplete)
      {
        self->_celebrationComplete = 1;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
        objc_msgSend(v16, "setAlpha:", 0.0);

      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHAchievementDetailViewController;
  -[CHAchievementDetailViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "detachPalette");

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double MidX;
  void *v18;
  double MidY;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)CHAchievementDetailViewController;
  -[CHAchievementDetailViewController viewDidLayoutSubviews](&v34, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
    objc_msgSend(v16, "bounds");
    MidX = CGRectGetMidX(v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
    objc_msgSend(v18, "bounds");
    MidY = CGRectGetMidY(v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v20, "setCenter:", MidX, MidY);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v21, "resizeBadgeForCurrentViewSize");

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v22, "setFixedBadgeAngle:", 0.0);

    -[CHAchievementDetailViewController setDidSetupBadgeView:](self, "setDidSetupBadgeView:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayerLayer](self, "avPlayerLayer"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
      objc_msgSend(v24, "bounds");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayerLayer](self, "avPlayerLayer"));
      objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    }
    else if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation"))
    {
      -[CHAchievementDetailViewController animateModalBadgeViewIfNeeded](self, "animateModalBadgeViewIfNeeded");
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHAchievementDetailViewController;
  -[CHAchievementDetailViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  -[CHAchievementDetailViewController setupCelebrationVideoIfNeeded](self, "setupCelebrationVideoIfNeeded");
  -[CHAchievementDetailViewController setDidAppear:](self, "setDidAppear:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayer](self, "avPlayer"));

  if (v4)
  {
    v5 = ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Playing achievement celebration video", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayer](self, "avPlayer"));
    objc_msgSend(v7, "play");

  }
  else if (-[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation"))
  {
    -[CHAchievementDetailViewController animateModalBadgeViewIfNeeded](self, "animateModalBadgeViewIfNeeded");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHAchievementDetailViewController;
  -[CHAchievementDetailViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[CHAchievementDetailViewController teardownPlayer](self, "teardownPlayer");
}

- (void)textSizeChanged:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  objc_msgSend(v4, "_scaledValueForValue:", -12.0);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController textBottomBaselineConstraint](self, "textBottomBaselineConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

  LODWORD(v7) = -[CHAchievementDetailViewController forDayView](self, "forDayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController formatter](self, "formatter"));
  v9 = v8;
  if ((_DWORD)v7)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedAttributedCombinedStringWithoutProgress"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedAttributedCombinedString"));
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController label](self, "label"));
  objc_msgSend(v12, "setAttributedText:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  objc_msgSend(v13, "setNeedsLayout");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController view](self, "view"));
  objc_msgSend(v14, "layoutIfNeeded");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  v25 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  objc_msgSend(v25, "resizeBadgeForCurrentViewSize");

}

- (CGRect)badgeFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeContainer](self, "badgeContainer"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)doneTapped:(id)a3
{
  -[CHAchievementDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)shareTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement", a3));
  v5 = sub_100092B54(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController locProvider](self, "locProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shareDescriptionForAchievement:", v8));

  if (v6 && v9)
  {
    -[CHAchievementDetailViewController setSharingImage:](self, "setSharingImage:", v6);
    -[CHAchievementDetailViewController setSharingText:](self, "setSharingText:", v9);
    v10 = objc_alloc((Class)UIActivityViewController);
    v20[0] = v9;
    v20[1] = v6;
    v20[2] = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
    v12 = objc_msgSend(v10, "initWithActivityItems:applicationActivities:", v11, 0);

    v13 = sub_10005FD28();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "setExcludedActivityTypes:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController navigationController](self, "navigationController"));
    if (v15)
    {
      -[CHAchievementDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windows"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootViewController"));

      objc_msgSend(v19, "presentViewController:animated:completion:", v12, 1, 0);
    }

  }
}

- (void)appWillResignActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayer](self, "avPlayer", a3));
  objc_msgSend(v4, "pause");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayerLayer](self, "avPlayerLayer"));
  objc_msgSend(v5, "removeFromSuperlayer");

  -[CHAchievementDetailViewController setAvPlayer:](self, "setAvPlayer:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
  objc_msgSend(v6, "removeFromSuperview");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  objc_msgSend(v7, "setAlpha:", 1.0);

}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1007AE1D0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  UIImage *v8;
  NSData *v9;
  void *v10;
  id v11;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController sharingImage](self, "sharingImage", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController sharingText](self, "sharingText"));

    if (v5)
    {
      v4 = objc_alloc_init((Class)LPLinkMetadata);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController sharingText](self, "sharingText"));
      objc_msgSend(v4, "setSummary:", v6);

      v7 = objc_alloc((Class)LPImage);
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController sharingImage](self, "sharingImage"));
      v9 = UIImagePNGRepresentation(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = objc_msgSend(v7, "initWithData:MIMEType:", v10, CFSTR("image/png"));
      objc_msgSend(v4, "setImage:", v11);

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)playerFinished:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayerLayer](self, "avPlayerLayer", a3));
  objc_msgSend(v4, "removeFromSuperlayer");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController celebrationVideoContainer](self, "celebrationVideoContainer"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[CHAchievementDetailViewController animateModalBadgeViewIfNeeded](self, "animateModalBadgeViewIfNeeded");
}

- (void)animateModalBadgeViewIfNeeded
{
  if (!-[CHAchievementDetailViewController modalBadgeFlipStarted](self, "modalBadgeFlipStarted")
    && -[CHAchievementDetailViewController forModalPresentation](self, "forModalPresentation")
    && -[CHAchievementDetailViewController didSetupBadgeView](self, "didSetupBadgeView"))
  {
    if (-[CHAchievementDetailViewController didAppear](self, "didAppear"))
    {
      -[CHAchievementDetailViewController animateModalBadgeView](self, "animateModalBadgeView");
      -[CHAchievementDetailViewController setModalBadgeFlipStarted:](self, "setModalBadgeFlipStarted:", 1);
    }
  }
}

- (void)animateModalBadgeView
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform buf;

  v3 = ACHLogDefault(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.a) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Animating modal badge view", (uint8_t *)&buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
  v6 = objc_msgSend(v5, "unearned");

  if ((v6 & 1) != 0)
  {
    v9 = 0.5;
    v10 = 0.75;
  }
  else
  {
    v11 = ACHLogDefault(v7, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Flipping in badge animation", (uint8_t *)&buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v13, "setPaused:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
    objc_msgSend(v14, "playFlipInAnimation");

    v9 = 1.0;
    v10 = 0.5;
  }
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v10, v10);
  v19 = buf;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController badgeView](self, "badgeView"));
  v18 = v19;
  objc_msgSend(v15, "setTransform:", &v18);

  v16[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100083C94;
  v17[3] = &unk_100777E20;
  v17[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100083D08;
  v16[3] = &unk_100778DB0;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v16, v9);
}

- (void)configurePlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  AVPlayer *v11;
  AVPlayer *avPlayer;
  AVPlayerLayer *v13;
  AVPlayerLayer *avPlayerLayer;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;

  if (!self->_avPlayer && !self->_avPlayerLayer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "template"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FICelebrationAssetURLProvider celebrationMovieURLForAchievementIdentifer:](FICelebrationAssetURLProvider, "celebrationMovieURLForAchievementIdentifer:", v5));

    if (v6)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v9));
      v11 = (AVPlayer *)objc_alloc_init((Class)AVPlayer);
      avPlayer = self->_avPlayer;
      self->_avPlayer = v11;

      -[AVPlayer _setParticipatesInAudioSession:](self->_avPlayer, "_setParticipatesInAudioSession:", 0);
      -[AVPlayer setActionAtItemEnd:](self->_avPlayer, "setActionAtItemEnd:", 1);
      -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_avPlayer, "replaceCurrentItemWithPlayerItem:", v10);
      v13 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](AVPlayerLayer, "playerLayerWithPlayer:", self->_avPlayer));
      avPlayerLayer = self->_avPlayerLayer;
      self->_avPlayerLayer = v13;

      -[AVPlayerLayer setVideoGravity:](self->_avPlayerLayer, "setVideoGravity:", AVLayerVideoGravityResizeAspectFill);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_celebrationVideoContainer, "layer"));
      objc_msgSend(v15, "addSublayer:", self->_avPlayerLayer);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController avPlayer](self, "avPlayer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentItem"));
      objc_msgSend(v16, "addObserver:selector:name:object:", self, "playerFinished:", AVPlayerItemDidPlayToEndTimeNotification, v18);

    }
    else
    {
      v19 = ACHLogDefault(v7, v8);
      v9 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementDetailViewController achievement](self, "achievement"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "template"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueName"));
        v23 = 138412290;
        v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No celebration asset for achievement: %@", (uint8_t *)&v23, 0xCu);

      }
    }

  }
}

- (void)teardownPlayer
{
  AVPlayer *avPlayer;
  AVPlayerLayer *avPlayerLayer;

  -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_avPlayer, "replaceCurrentItemWithPlayerItem:", 0);
  -[AVPlayerLayer setPlayer:](self->_avPlayerLayer, "setPlayer:", 0);
  -[AVPlayerLayer removeFromSuperlayer](self->_avPlayerLayer, "removeFromSuperlayer");
  avPlayer = self->_avPlayer;
  self->_avPlayer = 0;

  avPlayerLayer = self->_avPlayerLayer;
  self->_avPlayerLayer = 0;

}

- (AAUIBadgeView)badgeView
{
  return self->_badgeView;
}

- (UIView)badgeContainer
{
  return self->_badgeContainer;
}

- (void)setBadgeContainer:(id)a3
{
  objc_storeStrong((id *)&self->_badgeContainer, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIView)celebrationVideoContainer
{
  return self->_celebrationVideoContainer;
}

- (void)setCelebrationVideoContainer:(id)a3
{
  objc_storeStrong((id *)&self->_celebrationVideoContainer, a3);
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_achievement, a3);
}

- (BOOL)earned
{
  return self->_earned;
}

- (void)setEarned:(BOOL)a3
{
  self->_earned = a3;
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locProvider, a3);
}

- (AAUIAchievementFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (NSLayoutConstraint)textBottomBaselineConstraint
{
  return self->_textBottomBaselineConstraint;
}

- (void)setTextBottomBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textBottomBaselineConstraint, a3);
}

- (UIImage)sharingImage
{
  return self->_sharingImage;
}

- (void)setSharingImage:(id)a3
{
  objc_storeStrong((id *)&self->_sharingImage, a3);
}

- (NSString)sharingText
{
  return self->_sharingText;
}

- (void)setSharingText:(id)a3
{
  objc_storeStrong((id *)&self->_sharingText, a3);
}

- (BOOL)forDayView
{
  return self->_forDayView;
}

- (void)setForDayView:(BOOL)a3
{
  self->_forDayView = a3;
}

- (BOOL)forModalPresentation
{
  return self->_forModalPresentation;
}

- (void)setForModalPresentation:(BOOL)a3
{
  self->_forModalPresentation = a3;
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayer, a3);
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAvPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerLayer, a3);
}

- (BOOL)celebrationComplete
{
  return self->_celebrationComplete;
}

- (void)setCelebrationComplete:(BOOL)a3
{
  self->_celebrationComplete = a3;
}

- (BOOL)shouldShowCelebration
{
  return self->_shouldShowCelebration;
}

- (void)setShouldShowCelebration:(BOOL)a3
{
  self->_shouldShowCelebration = a3;
}

- (BOOL)modalBadgeFlipStarted
{
  return self->_modalBadgeFlipStarted;
}

- (void)setModalBadgeFlipStarted:(BOOL)a3
{
  self->_modalBadgeFlipStarted = a3;
}

- (BOOL)didSetupBadgeView
{
  return self->_didSetupBadgeView;
}

- (void)setDidSetupBadgeView:(BOOL)a3
{
  self->_didSetupBadgeView = a3;
}

- (BOOL)didAppear
{
  return self->_didAppear;
}

- (void)setDidAppear:(BOOL)a3
{
  self->_didAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_sharingText, 0);
  objc_storeStrong((id *)&self->_sharingImage, 0);
  objc_storeStrong((id *)&self->_textBottomBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
  objc_storeStrong((id *)&self->_celebrationVideoContainer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badgeContainer, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
