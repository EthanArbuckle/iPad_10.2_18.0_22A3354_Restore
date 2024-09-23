@implementation EpisodeAvailableViewController

- (EpisodeAvailableViewController)initWithNotification:(id)a3
{
  EpisodeAvailableViewController *v3;
  EpisodeAvailableViewController *v4;
  NSArray *installedConstraints;
  uint64_t v6;
  EpisodeAvailableStyle *style;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EpisodeAvailableViewController;
  v3 = -[ContentAvailableViewController initWithNotification:](&v9, "initWithNotification:", a3);
  v4 = v3;
  if (v3)
  {
    installedConstraints = v3->_installedConstraints;
    v3->_installedConstraints = (NSArray *)&__NSArray0__struct;

    v6 = objc_claimAutoreleasedReturnValue(+[EpisodeAvailableStyle defaultStyle](EpisodeAvailableStyle, "defaultStyle"));
    style = v4->_style;
    v4->_style = (EpisodeAvailableStyle *)v6;

  }
  return v4;
}

- (id)episodePropertySource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstEpisodePropertySource"));

  return v3;
}

- (void)openAppShowingPodcastDetails
{
  void *v3;
  void *v4;
  id v5;

  -[EpisodeAvailableViewController _removeNotificationFromHistory](self, "_removeNotificationFromHistory");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodePropertySource](self, "episodePropertySource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController extensionContext](self, "extensionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "openPodcastDetailInAppURL"));
  objc_msgSend(v3, "openURL:completionHandler:", v4, 0);

}

- (void)openAppShowingEpisodeDetails
{
  void *v3;
  void *v4;
  id v5;

  -[EpisodeAvailableViewController _removeNotificationFromHistory](self, "_removeNotificationFromHistory");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodePropertySource](self, "episodePropertySource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController extensionContext](self, "extensionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "openEpisodeDetailInAppURL"));
  objc_msgSend(v3, "openURL:completionHandler:", v4, 0);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EpisodeAvailableViewController;
  -[ContentAvailableViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapOnTopLevelViewGestureRecognized:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController view](self, "view"));
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EpisodeAvailableViewController;
  -[EpisodeAvailableViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[EpisodeAvailableViewController updateDynamicConstraints](self, "updateDynamicConstraints");
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EpisodeAvailableViewController;
  -[EpisodeAvailableViewController updateViewConstraints](&v3, "updateViewConstraints");
  -[EpisodeAvailableViewController updateDynamicConstraints](self, "updateDynamicConstraints");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EpisodeAvailableViewController;
  -[EpisodeAvailableViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController lineCountLayoutGroup](self, "lineCountLayoutGroup"));
  objc_msgSend(v3, "layout");

}

- (id)actionsWithDefaultActions:(id)a3
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodePropertySource](self, "episodePropertySource", a3));
  v4 = objc_msgSend(v3, "requiresForegroundLaunch");

  if (v4)
    v5 = 4;
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction mt_playEpisodeActionWithOptions:](UNNotificationAction, "mt_playEpisodeActionWithOptions:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction mt_showOnePodcastOneEpisodeDetail](UNNotificationAction, "mt_showOnePodcastOneEpisodeDetail"));
  v10[0] = v6;
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

  return v8;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_EPISODE_AVAILABLE_HEADER"), &stru_1000292B8, 0));

  return v3;
}

- (void)loadContentViews
{
  void *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *artworkView;
  UILabel *v7;
  UILabel *fromLabel;
  void *v9;
  void *v10;
  double v11;
  double v12;
  UIButton *v13;
  UIButton *podcastTitleButton;
  UILabel *v15;
  UILabel *episodeDateLabel;
  void *v17;
  UILabel *v18;
  UILabel *episodeTitleLabel;
  UILabel *v20;
  UILabel *episodeSummaryLabel;
  UILabel *v22;
  UILabel *episodeMetadataLabel;
  void *v24;
  UIView *v25;
  UIView *dividerLine;
  void *v27;
  MTLineCountLayoutGroup *v28;
  MTLineCountLayoutGroup *lineCountLayoutGroup;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)EpisodeAvailableViewController;
  -[ContentAvailableViewController loadContentViews](&v30, "loadContentViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](UIColor, "backgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = -[EpisodeAvailableStyle newArtworkView](self->_style, "newArtworkView");
  artworkView = self->_artworkView;
  self->_artworkView = v5;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_artworkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_artworkView);
  v7 = -[ContentAvailableViewController newLabelWithTextStyle:traits:numberOfLines:](self, "newLabelWithTextStyle:traits:numberOfLines:", UIFontTextStyleBody, 0, 1);
  fromLabel = self->_fromLabel;
  self->_fromLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SHOW_TITLE_HEADER"), &stru_1000292B8, 0));
  -[UILabel setText:](self->_fromLabel, "setText:", v10);

  LODWORD(v11) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_fromLabel, "setContentHuggingPriority:forAxis:", 0, v11);
  LODWORD(v12) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_fromLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController buttonWithTitleTextStyle:](self, "buttonWithTitleTextStyle:", UIFontTextStyleBody));
  podcastTitleButton = self->_podcastTitleButton;
  self->_podcastTitleButton = v13;

  -[UIButton addTarget:action:forControlEvents:](self->_podcastTitleButton, "addTarget:action:forControlEvents:", self, "podcastTitleButtonTapped:", 64);
  v15 = -[ContentAvailableViewController newLabelWithTextStyle:traits:numberOfLines:](self, "newLabelWithTextStyle:traits:numberOfLines:", UIFontTextStyleSubheadline, 0, 1);
  episodeDateLabel = self->_episodeDateLabel;
  self->_episodeDateLabel = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSecondaryTextColor](UIColor, "cellSecondaryTextColor"));
  -[UILabel setTextColor:](self->_episodeDateLabel, "setTextColor:", v17);

  v18 = -[ContentAvailableViewController newLabelWithTextStyle:traits:numberOfLines:](self, "newLabelWithTextStyle:traits:numberOfLines:", UIFontTextStyleBody, 0, 2);
  episodeTitleLabel = self->_episodeTitleLabel;
  self->_episodeTitleLabel = v18;

  v20 = -[ContentAvailableViewController newLabelWithTextStyle:traits:numberOfLines:](self, "newLabelWithTextStyle:traits:numberOfLines:", UIFontTextStyleSubheadline, 0, 7);
  episodeSummaryLabel = self->_episodeSummaryLabel;
  self->_episodeSummaryLabel = v20;

  v22 = -[ContentAvailableViewController newLabelWithTextStyle:traits:numberOfLines:](self, "newLabelWithTextStyle:traits:numberOfLines:", UIFontTextStyleSubheadline, 0, 1);
  episodeMetadataLabel = self->_episodeMetadataLabel;
  self->_episodeMetadataLabel = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSecondaryTextColor](UIColor, "cellSecondaryTextColor"));
  -[UILabel setTextColor:](self->_episodeMetadataLabel, "setTextColor:", v24);

  v25 = objc_opt_new(UIView);
  dividerLine = self->_dividerLine;
  self->_dividerLine = v25;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dividerLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dividerColor](UIColor, "dividerColor"));
  -[UIView setBackgroundColor:](self->_dividerLine, "setBackgroundColor:", v27);

  objc_msgSend(v3, "addSubview:", self->_dividerLine);
  v28 = -[MTLineCountLayoutGroup initWithTotalLineCount:]([MTLineCountLayoutGroup alloc], "initWithTotalLineCount:", 8);
  lineCountLayoutGroup = self->_lineCountLayoutGroup;
  self->_lineCountLayoutGroup = v28;

  -[MTLineCountLayoutGroup addLabel:maxLineCount:sharingPriority:](self->_lineCountLayoutGroup, "addLabel:maxLineCount:sharingPriority:", self->_episodeTitleLabel, 3, 1000);
  -[MTLineCountLayoutGroup addLabel:maxLineCount:sharingPriority:](self->_lineCountLayoutGroup, "addLabel:maxLineCount:sharingPriority:", self->_episodeSummaryLabel, 7, 999);
  -[EpisodeAvailableViewController reloadContentPropertyValues](self, "reloadContentPropertyValues");

}

- (void)reloadContentPropertyValues
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
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodePropertySource](self, "episodePropertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController podcastTitleButton](self, "podcastTitleButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastTitle"));
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeDateLabel](self, "episodeDateLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDateString"));
  objc_msgSend(v7, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeTitleLabel](self, "episodeTitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  objc_msgSend(v9, "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeSummaryLabel](self, "episodeSummaryLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "summary"));
  objc_msgSend(v11, "setText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeMetadataLabel](self, "episodeMetadataLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDurationString"));
  objc_msgSend(v13, "setText:", v14);

  if (!-[EpisodeAvailableViewController hasLoadedCurrentImage](self, "hasLoadedCurrentImage"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preloadedImageWithSize:", (double)0x50uLL, (double)0x50uLL));
    if (v15)
    {
      -[EpisodeAvailableViewController applyImage:fromSource:](self, "applyImage:fromSource:", v15, v3);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      if (objc_msgSend(v4, "length"))
        objc_msgSend(v16, "addObject:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController artworkView](self, "artworkView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));

      if (!v18)
        objc_msgSend(v16, "addObject:", kMTLibraryDefaultImageKey);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100005EE4;
      v19[3] = &unk_100028A58;
      v19[4] = self;
      v20 = v3;
      -[EpisodeAvailableViewController _fetchImageWithSize:imageKeyWithFallbackKeys:completion:](self, "_fetchImageWithSize:imageKeyWithFallbackKeys:completion:", v16, v19, (double)0x50uLL, (double)0x50uLL);

    }
  }

}

- (void)applyImage:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005FA8;
  block[3] = &unk_100028A80;
  block[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)loadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
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
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
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
  double v93;
  void *v94;
  void *v95;
  void *v96;
  NSArray *v97;
  NSArray *installedConstraints;
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
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  objc_super v145;
  _QWORD v146[31];
  NSAttributedStringKey v147;
  void *v148;

  v145.receiver = self;
  v145.super_class = (Class)EpisodeAvailableViewController;
  -[ContentAvailableViewController loadConstraints](&v145, "loadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController style](self, "style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController headerTitleLabel](self, "headerTitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController artworkView](self, "artworkView"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController fromLabel](self, "fromLabel"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController podcastTitleButton](self, "podcastTitleButton"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeDateLabel](self, "episodeDateLabel"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeTitleLabel](self, "episodeTitleLabel"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController dividerLine](self, "dividerLine"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeSummaryLabel](self, "episodeSummaryLabel"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController episodeMetadataLabel](self, "episodeMetadataLabel"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  v147 = NSFontAttributeName;
  v148 = v134;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
  objc_msgSend(CFSTR(" "), "boundingRectWithSize:options:attributes:context:", 0, v7, 0, 1000.0, 1000.0);
  v9 = v8;

  LODWORD(v10) = 1148846080;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v10);
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToConstant:", (double)0x50uLL));
  v146[0] = v132;
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToConstant:", (double)0x50uLL));
  v146[1] = v130;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "container_To_artTop"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mt_copyWithDynamicTypeConstant:", v14));

  v146[2] = v129;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v144 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  objc_msgSend(v3, "defaultMarginH");
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v17));

  v146[3] = v128;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstBaselineAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artTop_To_mainHeaderBL"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mt_copyWithDynamicTypeConstant:", v21));

  v146[4] = v127;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  objc_msgSend(v3, "defaultMarginH");
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23));

  v146[5] = v126;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  objc_msgSend(v3, "defaultMarginH");
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -v26));

  v146[6] = v125;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "firstBaselineAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastBaselineAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainHeaderBL_To_showTitleBL"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mt_copyWithDynamicTypeConstant:", v30));

  v146[7] = v124;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 0.0));

  v146[8] = v123;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "firstBaselineAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "firstBaselineAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 0.0));

  v146[9] = v122;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "trailingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v9));

  v146[10] = v121;
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "trailingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  objc_msgSend(v3, "spacingBetweenTextAndArtwork");
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintLessThanOrEqualToAnchor:constant:", v119, -v37));
  v146[11] = v118;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "firstBaselineAnchor"));
  v135 = v6;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 0.0));
  LODWORD(v41) = 1144750080;
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mt_copyWithPriority:", v41));

  v146[12] = v117;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "firstBaselineAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:constant:", v43, 0.0));

  v146[13] = v116;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "firstBaselineAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "lastBaselineAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:", v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "showTitleBL_To_dateBaseline_Min"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mt_copyWithDynamicTypeConstant:", v47));

  v146[14] = v115;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, 0.0));

  v146[15] = v114;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "trailingAnchor"));
  v136 = v5;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 0.0));

  v146[16] = v113;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "firstBaselineAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "lastBaselineAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateBL_To_titleBL"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mt_copyWithDynamicTypeConstant:", v55));

  v146[17] = v112;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, 0.0));

  v146[18] = v111;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 0.0));

  v146[19] = v110;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "lastBaselineAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeTitleBL_To_divider"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "mt_copyWithDynamicTypeConstant:", v63));

  v146[20] = v109;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 0.0));

  v146[21] = v108;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 0.0));

  v146[22] = v107;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "heightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v68, "scale");
  v70 = v69;

  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToConstant:", 1.0 / v70));
  v146[23] = v105;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "firstBaselineAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v72));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "divider_To_summaryBL"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "mt_copyWithDynamicTypeConstant:", v74));

  v146[24] = v103;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "leadingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 0.0));

  v146[25] = v102;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "trailingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, 0.0));

  v146[26] = v101;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "firstBaselineAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "lastBaselineAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v80));
  v104 = v3;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "summaryBL_To_metadataBL"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "mt_copyWithDynamicTypeConstant:", v82));

  v146[27] = v83;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, 0.0));

  v146[28] = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, 0.0));

  v146[29] = v89;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "bottomAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "bottomAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v91));
  LODWORD(v93) = 1112014848;
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "mt_copyWithPriority:", v93));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "metadataBL_To_bottomBL"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "mt_copyWithDynamicTypeConstant:", v95));

  v146[30] = v96;
  v97 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v146, 31));
  installedConstraints = self->_installedConstraints;
  self->_installedConstraints = v97;

  -[EpisodeAvailableViewController updateDynamicConstraints](self, "updateDynamicConstraints");
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController installedConstraints](self, "installedConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v99);

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController view](self, "view"));
  objc_msgSend(v100, "invalidateIntrinsicContentSize");

}

- (void)updateDynamicConstraints
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeAvailableViewController installedConstraints](self, "installedConstraints"));
  +[MTDynamicTypeConstant updateDynamicConstantInConstraints:](MTDynamicTypeConstant, "updateDynamicConstantInConstraints:", v2);

}

- (void)podcastTitleButtonTapped:(id)a3
{
  -[EpisodeAvailableViewController openAppShowingPodcastDetails](self, "openAppShowingPodcastDetails", a3);
}

- (void)tapOnTopLevelViewGestureRecognized:(id)a3
{
  -[EpisodeAvailableViewController openAppShowingEpisodeDetails](self, "openAppShowingEpisodeDetails", a3);
}

- (void)_fetchImageWithSize:(CGSize)a3 imageKeyWithFallbackKeys:(id)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[3];
  id location;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      if (objc_msgSend(v11, "length"))
      {
        objc_initWeak(&location, self);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100007044;
        v14[3] = &unk_100028AD0;
        objc_copyWeak(v17, &location);
        v16 = v10;
        v13 = v12;
        v15 = v13;
        v17[1] = *(id *)&width;
        v17[2] = *(id *)&height;
        objc_msgSend(v13, "artworkPathForShow:size:completionHandler:", v11, v14, width, height);

        objc_destroyWeak(v17);
        objc_destroyWeak(&location);
      }
      else
      {
        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      }

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

- (void)_removeNotificationFromHistory
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notification"));
  objc_msgSend(v2, "mt_removeFromUserNotificationCenter");

}

- (EpisodeAvailableStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (MTLineCountLayoutGroup)lineCountLayoutGroup
{
  return self->_lineCountLayoutGroup;
}

- (void)setLineCountLayoutGroup:(id)a3
{
  objc_storeStrong((id *)&self->_lineCountLayoutGroup, a3);
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (UILabel)fromLabel
{
  return self->_fromLabel;
}

- (void)setFromLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fromLabel, a3);
}

- (UIButton)podcastTitleButton
{
  return self->_podcastTitleButton;
}

- (void)setPodcastTitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_podcastTitleButton, a3);
}

- (UILabel)episodeDateLabel
{
  return self->_episodeDateLabel;
}

- (void)setEpisodeDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_episodeDateLabel, a3);
}

- (UILabel)episodeTitleLabel
{
  return self->_episodeTitleLabel;
}

- (void)setEpisodeTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_episodeTitleLabel, a3);
}

- (UIView)dividerLine
{
  return self->_dividerLine;
}

- (void)setDividerLine:(id)a3
{
  objc_storeStrong((id *)&self->_dividerLine, a3);
}

- (UILabel)episodeSummaryLabel
{
  return self->_episodeSummaryLabel;
}

- (void)setEpisodeSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_episodeSummaryLabel, a3);
}

- (UILabel)episodeMetadataLabel
{
  return self->_episodeMetadataLabel;
}

- (void)setEpisodeMetadataLabel:(id)a3
{
  objc_storeStrong((id *)&self->_episodeMetadataLabel, a3);
}

- (NSArray)installedConstraints
{
  return self->_installedConstraints;
}

- (void)setInstalledConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_installedConstraints, a3);
}

- (BOOL)hasLoadedCurrentImage
{
  return self->_hasLoadedCurrentImage;
}

- (void)setHasLoadedCurrentImage:(BOOL)a3
{
  self->_hasLoadedCurrentImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedConstraints, 0);
  objc_storeStrong((id *)&self->_episodeMetadataLabel, 0);
  objc_storeStrong((id *)&self->_episodeSummaryLabel, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_episodeTitleLabel, 0);
  objc_storeStrong((id *)&self->_episodeDateLabel, 0);
  objc_storeStrong((id *)&self->_podcastTitleButton, 0);
  objc_storeStrong((id *)&self->_fromLabel, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_lineCountLayoutGroup, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
