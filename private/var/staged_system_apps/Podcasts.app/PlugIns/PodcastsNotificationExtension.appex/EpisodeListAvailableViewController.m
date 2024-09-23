@implementation EpisodeListAvailableViewController

- (EpisodeListAvailableViewController)initWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EpisodeListAvailableViewController *v8;
  uint64_t v9;
  EpisodeListAvailableStyle *style;
  EpisodeListAvailableViewController *v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_notificationEpisodes"));

  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)EpisodeListAvailableViewController;
    v8 = -[ContentAvailableViewController initWithNotification:](&v15, "initWithNotification:", v4);
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[EpisodeListAvailableStyle defaultStyle](EpisodeListAvailableStyle, "defaultStyle"));
      style = v8->_style;
      v8->_style = (EpisodeListAvailableStyle *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = _MTLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unexpected state encountered.  We should never have no episodes in a notification!", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EpisodeListAvailableViewController;
  -[EpisodeListAvailableViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[EpisodeListAvailableViewController updateDynamicConstraints](self, "updateDynamicConstraints");
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EpisodeListAvailableViewController;
  -[EpisodeListAvailableViewController updateViewConstraints](&v3, "updateViewConstraints");
  -[EpisodeListAvailableViewController updateDynamicConstraints](self, "updateDynamicConstraints");
}

- (void)revealMoreEpisodes
{
  -[EpisodeListAvailableViewController setNumberOfRevealedEpisodes:](self, "setNumberOfRevealedEpisodes:", (char *)-[EpisodeListAvailableViewController numberOfRevealedEpisodes](self, "numberOfRevealedEpisodes") + 24);
}

- (void)showEpisodeDetailsForEpisodeWithDataSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EpisodeListAvailableViewController _removeNotificationFromHistory](self, "_removeNotificationFromHistory");
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "openEpisodeDetailInAppURL"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v5, "openURL:completionHandler:", v6, 0);

  }
}

- (void)showPodcastDetails
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EpisodeListAvailableViewController _removeNotificationFromHistory](self, "_removeNotificationFromHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstEpisodePropertySource"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openPodcastDetailInAppURL"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v5, "openURL:completionHandler:", v4, 0);

  }
}

- (void)playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003D58;
  v3[3] = &unk_1000289E0;
  v3[4] = self;
  objc_msgSend(a3, "initiatePlaybackWithCompletion:", v3);
}

- (id)actionsWithDefaultActions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController", a3));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003F10;
  v12[3] = &unk_100028A08;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstEpisodePropertySource"));
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstEpisodePropertySourcePassingTest:", v12));

  if (objc_msgSend(v4, "requiresForegroundLaunch"))
    v6 = 4;
  else
    v6 = 0;
  v7 = objc_claimAutoreleasedReturnValue(+[UNNotificationAction mt_playMultipleEpisodesActionWithCount:options:](UNNotificationAction, "mt_playMultipleEpisodesActionWithCount:options:", objc_msgSend(v3, "countOfEpisodePropertySources"), v6));
  v8 = (void *)v7;
  if (v5)
  {
    v14 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }
  else
  {
    v15[0] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction mt_showOnePodcastMultipleEpisodesDetail](UNNotificationAction, "mt_showOnePodcastMultipleEpisodesDetail"));
    v15[1] = v10;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

  }
  return v9;
}

- (id)headerTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_EPISODE_N_AVAILABLE_HEADER_FORMAT"), &stru_1000292B8, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%u"), 0, objc_msgSend(v5, "countOfEpisodePropertySources")));

  return v6;
}

- (void)loadContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EpisodeListAvailableViewController;
  -[ContentAvailableViewController loadContentViews](&v3, "loadContentViews");
  -[EpisodeListAvailableViewController loadCollectionView](self, "loadCollectionView");
  -[EpisodeListAvailableViewController setNumberOfRevealedEpisodes:](self, "setNumberOfRevealedEpisodes:", 24);
}

- (void)loadCollectionView
{
  UICollectionViewFlowLayout *v3;
  UICollectionViewFlowLayout *flowLayout;
  double v5;
  double v6;
  UICollectionView *v7;
  UICollectionView *collectionView;
  void *v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  id v14;

  v3 = (UICollectionViewFlowLayout *)objc_alloc_init((Class)UICollectionViewFlowLayout);
  flowLayout = self->_flowLayout;
  self->_flowLayout = v3;

  +[EpisodeAvailableCell defaultHeight](EpisodeAvailableCell, "defaultHeight");
  v6 = v5;
  -[UICollectionViewFlowLayout setEstimatedItemSize:](self->_flowLayout, "setEstimatedItemSize:", UICollectionViewFlowLayoutAutomaticSize.width, v5);
  -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", UICollectionViewFlowLayoutAutomaticSize.width, v6);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_flowLayout, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setSectionInset:](self->_flowLayout, "setSectionInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[UICollectionViewFlowLayout setScrollDirection:](self->_flowLayout, "setScrollDirection:", 0);
  v7 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", self->_flowLayout, 0.0, 0.0, 0.0, 0.0);
  collectionView = self->_collectionView;
  self->_collectionView = v7;

  -[UICollectionView mt_registerCellClass:](self->_collectionView, "mt_registerCellClass:", objc_opt_class(EpisodeAvailableCell));
  -[UICollectionView mt_registerSupplementaryViewClass:forSupplementaryViewOfKind:](self->_collectionView, "mt_registerSupplementaryViewClass:forSupplementaryViewOfKind:", objc_opt_class(ShowMoreFooterView), UICollectionElementKindSectionFooter);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController headerTitleLabel](self, "headerTitleLabel"));
  objc_msgSend(v9, "contentCompressionResistancePriorityForAxis:", 1);
  v11 = v10;

  *(float *)&v12 = v11 + -1.0;
  -[UICollectionView setContentCompressionResistancePriority:forAxis:](self->_collectionView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](UIColor, "backgroundColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v13);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_collectionView);

}

- (void)loadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *collectionViewHeightConstraint;
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
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *installedConstraints;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[8];

  v45.receiver = self;
  v45.super_class = (Class)EpisodeListAvailableViewController;
  -[ContentAvailableViewController loadConstraints](&v45, "loadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController style](self, "style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController headerTitleLabel](self, "headerTitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "defaultMarginH");
  v8 = v7;
  objc_msgSend(v3, "defaultMarginH");
  objc_msgSend(v6, "setLayoutMargins:", 0.0, v8, 0.0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cell_container_To_mainHeaderBL"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mt_copyWithDynamicTypeConstant:", v13));

  v46[0] = v44;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  objc_msgSend(v3, "defaultMarginH");
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));

  v46[1] = v43;
  v42 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  objc_msgSend(v3, "defaultMarginH");
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -v18));

  v46[2] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  -[EpisodeListAvailableViewController _preferredCollectionViewHeight](self, "_preferredCollectionViewHeight");
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:"));
  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  self->_collectionViewHeightConstraint = v19;

  v46[3] = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cell_mainHeaderBL_To_collectionViewTop"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mt_copyWithDynamicTypeConstant:", v24));

  v46[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 0.0));

  v46[5] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 0.0));

  v46[6] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 0.0));

  v46[7] = v34;
  v35 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));
  installedConstraints = self->_installedConstraints;
  self->_installedConstraints = v35;

  LODWORD(v37) = 1112014848;
  objc_msgSend(v34, "setPriority:", v37);
  objc_msgSend(v6, "reloadData");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController installedConstraints](self, "installedConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

  -[EpisodeListAvailableViewController updateDynamicConstraints](self, "updateDynamicConstraints");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController view](self, "view"));
  objc_msgSend(v39, "invalidateIntrinsicContentSize");

}

- (void)updateDynamicConstraints
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController installedConstraints](self, "installedConstraints"));
  +[MTDynamicTypeConstant updateDynamicConstantInConstraints:](MTDynamicTypeConstant, "updateDynamicConstantInConstraints:", v3);

  -[EpisodeListAvailableViewController _preferredCollectionViewHeight](self, "_preferredCollectionViewHeight");
  v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint"));
  objc_msgSend(v6, "setConstant:", v5);

}

- (void)episodesPropertySourceControllerDidUpdatingNeedingFullReload:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v3, "reloadData");

}

- (void)episodesPropertySourceController:(id)a3 didUpdateEpisodePropertySourcesAtIndexes:(id)a4
{
  void *v5;
  id i;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  for (i = objc_msgSend(v9, "firstIndex");
        i < (id)-[EpisodeListAvailableViewController numberOfRevealedEpisodes](self, "numberOfRevealedEpisodes");
        i = objc_msgSend(v9, "indexGreaterThanIndex:", i))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, 0));
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "reloadItemsAtIndexPaths:", v5);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "mt_dequeueReusableCellClass:forIndexPath:", objc_opt_class(EpisodeAvailableCell), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController _episodeSourceAtIndexPath:](self, "_episodeSourceAtIndexPath:", v6));
  objc_msgSend(v9, "setEpisodePropertySource:", v10);
  v11 = !-[EpisodeListAvailableViewController shouldShowRevealMoreFooter](self, "shouldShowRevealMoreFooter")
     && -[EpisodeListAvailableViewController _isLastEpisodeRowForIndexPath:](self, "_isLastEpisodeRowForIndexPath:", v6);
  objc_msgSend(v9, "setSeparatorHidden:", v11);

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", v6));
  objc_msgSend(v7, "setHighlighted:", 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController _episodeSourceAtIndexPath:](self, "_episodeSourceAtIndexPath:", v6));
  -[EpisodeListAvailableViewController showEpisodeDetailsForEpisodeWithDataSource:](self, "showEpisodeDetailsForEpisodeWithDataSource:", v8);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a3;
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "frame");
  v12 = v11;

  v13 = v12 - (v8 + v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController flowLayout](self, "flowLayout"));
  objc_msgSend(v14, "itemSize");
  v16 = v15;

  v17 = v13;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "mt_dequeueReusableSupplementaryViewClass:supplementaryViewKind:forIndexPath:", objc_opt_class(ShowMoreFooterView), v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v12, "setActionHandler:", self);
  return v12;
}

- (void)handlePlayActionForEpisodeAvailableCell:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "episodePropertySource"));
  -[EpisodeListAvailableViewController playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:](self, "playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:", v4);

}

- (void)handleShowMoreEpisodesForFooterView:(id)a3
{
  -[EpisodeListAvailableViewController revealMoreEpisodes](self, "revealMoreEpisodes", a3);
}

- (BOOL)shouldShowRevealMoreFooter
{
  unint64_t v3;

  v3 = -[EpisodeListAvailableViewController numberOfRevealedEpisodes](self, "numberOfRevealedEpisodes");
  return v3 != -[EpisodeListAvailableViewController countOfAllEpisodes](self, "countOfAllEpisodes");
}

- (unint64_t)countOfAllEpisodes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  v3 = objc_msgSend(v2, "countOfEpisodePropertySources");

  return (unint64_t)v3;
}

- (void)setNumberOfRevealedEpisodes:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double width;
  double v12;
  CGFloat height;
  void *v14;
  void *v15;
  id v16;

  if (self->_numberOfRevealedEpisodes != a3)
  {
    v5 = -[EpisodeListAvailableViewController countOfAllEpisodes](self, "countOfAllEpisodes");
    if (v5 >= a3)
      v6 = a3;
    else
      v6 = v5;
    self->_numberOfRevealedEpisodes = v6;
    if (-[EpisodeListAvailableViewController shouldShowRevealMoreFooter](self, "shouldShowRevealMoreFooter"))
    {
      +[ShowMoreFooterView defaultHeight](ShowMoreFooterView, "defaultHeight");
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController flowLayout](self, "flowLayout"));
      v10 = v9;
      width = 0.0;
      v12 = v8;
    }
    else
    {
      height = CGSizeZero.height;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController flowLayout](self, "flowLayout"));
      v10 = v9;
      width = CGSizeZero.width;
      v12 = height;
    }
    objc_msgSend(v9, "setFooterReferenceSize:", width, v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController flowLayout](self, "flowLayout"));
    objc_msgSend(v14, "invalidateLayout");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController collectionView](self, "collectionView"));
    objc_msgSend(v15, "reloadData");

    v16 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController view](self, "view"));
    objc_msgSend(v16, "setNeedsUpdateConstraints");

  }
}

- (BOOL)_isLastEpisodeRowForIndexPath:(id)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(a3, "row");
  return v4 == (char *)-[EpisodeListAvailableViewController countOfAllEpisodes](self, "countOfAllEpisodes") - 1;
}

- (id)_loadedIndexPathForEpisodeWithUuid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004D98;
    v9[3] = &unk_100028A08;
    v10 = v4;
    v6 = objc_msgSend(v5, "indexOfPropertySourcePassingTest:", v9);

    if (v6 >= (id)-[EpisodeListAvailableViewController numberOfRevealedEpisodes](self, "numberOfRevealedEpisodes"))
      v7 = 0;
    else
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_episodeSourceAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 >= (id)-[EpisodeListAvailableViewController countOfAllEpisodes](self, "countOfAllEpisodes"))
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodePropertySourceAtIndex:", objc_msgSend(v4, "row")));

  }
  return v7;
}

- (double)_preferredCollectionViewHeight
{
  id v3;
  _QWORD *v4;
  double v5;
  double v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004F28;
  v8[3] = &unk_100028A30;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[EpisodeListAvailableViewController flowLayout](self, "flowLayout"));
  v3 = v9;
  v4 = objc_retainBlock(v8);
  v5 = ((double (*)(_QWORD *, unint64_t))v4[2])(v4, -[EpisodeListAvailableViewController numberOfRevealedEpisodes](self, "numberOfRevealedEpisodes"));
  v6 = ((double (*)(_QWORD *, uint64_t))v4[2])(v4, 100000);
  if (v5 >= v6)
    v5 = v6;

  return v5;
}

- (void)_removeNotificationFromHistory
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notification"));
  objc_msgSend(v2, "mt_removeFromUserNotificationCenter");

}

- (EpisodeListAvailableStyle)style
{
  return self->_style;
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionReusableView)showMoreFooterView
{
  return self->_showMoreFooterView;
}

- (NSArray)installedConstraints
{
  return self->_installedConstraints;
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (unint64_t)numberOfRevealedEpisodes
{
  return self->_numberOfRevealedEpisodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_installedConstraints, 0);
  objc_storeStrong((id *)&self->_showMoreFooterView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
