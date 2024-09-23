@implementation RCPlaybackViewController

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  void *v8;

  v7.receiver = self;
  v7.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_opt_self(UITraitUserInterfaceStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = -[RCPlaybackViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

}

- (BOOL)supportsAppEntityInteraction
{
  return 0;
}

- (void)setCollectionViewEditingShouldDisableActionButtons:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v4, "setDisablesActionButtons:", v3);

}

- (BOOL)collectionViewEditingShouldDisableActionButtons
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  v3 = objc_msgSend(v2, "disablesActionButtons");

  return v3;
}

- (Class)_viewClass
{
  return (Class)objc_opt_class(RCPlaybackView, a2);
}

- (void)_classSpecificLoadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waveformViewController"));
  objc_msgSend(v4, "setIsPlayback:", 1);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waveformViewController"));
  objc_msgSend(v5, "setIsPlayback:", 1);

}

- (void)_reset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController _reset](&v4, "_reset");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v3, "reset");

  -[RCRecordingViewController setUUID:](self, "setUUID:", 0);
}

- (void)updateWithRecordingModel:(id)a3 requireMatchingUUID:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a4;
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController updateWithRecordingModel:requireMatchingUUID:](&v22, "updateWithRecordingModel:requireMatchingUUID:", v6, v4);
  if (!v4
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID")),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    if (v6)
      -[RCPlaybackViewController _setupToolbarWithButtonItemsIfNeeded](self, "_setupToolbarWithButtonItemsIfNeeded");
    -[RCPlaybackViewController setIsFavorite:](self, "setIsFavorite:", objc_msgSend(v6, "isFavorite"));
    v10 = objc_msgSend(v6, "isFavorite");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v12 = v11;
    if (v10)
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "favoriteImage"));
    else
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notFavoriteImage"));
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController favoriteButtonItem](self, "favoriteButtonItem"));
    objc_msgSend(v15, "setImage:", v14);

    v16 = objc_msgSend(v6, "isFavorite");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = v17;
    if (v16)
      v19 = CFSTR("AX_REMOVE_FROM_FAVORITES");
    else
      v19 = CFSTR("AX_ADD_TO_FAVORITES");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1001B2BC0, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController favoriteButtonItem](self, "favoriteButtonItem"));
    objc_msgSend(v21, "setAccessibilityLabel:", v20);

    -[RCPlaybackViewController _updateMoreOptionsMenu](self, "_updateMoreOptionsMenu");
  }

}

- (void)updateWithRecordingModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController updateWithRecordingModel:](&v29, "updateWithRecordingModel:", v4);
  -[RCPlaybackViewController setIsRecentlyDeleted:](self, "setIsRecentlyDeleted:", objc_msgSend(v4, "recentlyDeleted"));
  -[RCPlaybackViewController setIsFavorite:](self, "setIsFavorite:", objc_msgSend(v4, "isFavorite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v6, "setUserInteractionEnabled:", v5 != 0);

  v7 = objc_msgSend(v4, "isFavorite");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v9 = v8;
  if (v7)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "favoriteImage"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "notFavoriteImage"));
  v11 = (void *)v10;
  v12 = v5 != 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController favoriteButtonItem](self, "favoriteButtonItem"));
  objc_msgSend(v13, "setImage:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController favoriteButtonItem](self, "favoriteButtonItem"));
  objc_msgSend(v14, "setEnabled:", v5 != 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController shareButtonItem](self, "shareButtonItem"));
  objc_msgSend(v15, "setEnabled:", v5 != 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moveToFolderButtonItem](self, "moveToFolderButtonItem"));
  objc_msgSend(v16, "setEnabled:", v5 != 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moreOptionsButtonItem](self, "moreOptionsButtonItem"));
  objc_msgSend(v17, "setEnabled:", v5 != 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController deleteButtonItem](self, "deleteButtonItem"));
  objc_msgSend(v18, "setEnabled:", v5 != 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController eraseButtonItem](self, "eraseButtonItem"));
  objc_msgSend(v19, "setEnabled:", v5 != 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController recoverButtonItem](self, "recoverButtonItem"));
  objc_msgSend(v20, "setEnabled:", v5 != 0);

  v21 = v12 & ~objc_msgSend(v4, "recentlyDeleted");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController playbackSettingsButtonItem](self, "playbackSettingsButtonItem"));
  objc_msgSend(v22, "setEnabled:", v21);

  v23 = v12 & ~objc_msgSend(v4, "recentlyDeleted");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController transcriptionButtonItem](self, "transcriptionButtonItem"));
  objc_msgSend(v24, "setEnabled:", v23);

  v25 = objc_msgSend(v4, "recentlyDeleted") ^ 1;
  if (v5)
    v26 = v25;
  else
    v26 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v27, "setEnabled:", v26);

  if (v4)
    -[RCPlaybackViewController _updateToolbarItems](self, "_updateToolbarItems");
  else
    -[RCPlaybackViewController updateContentUnavailableViewState:](self, "updateContentUnavailableViewState:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  objc_msgSend(v28, "didUpdateWithRecordingModel:", v4);

}

- (void)didUpdateRecordingCenterContentViewState
{
  void *v3;
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController didUpdateRecordingCenterContentViewState](&v5, "didUpdateRecordingCenterContentViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  v4 = objc_msgSend(v3, "centerContentViewState") == (id)1;

  -[RCPlaybackViewController _updateTranscriptionButtonTint:](self, "_updateTranscriptionButtonTint:", v4);
}

- (void)updateWithPlaybackSettings:(id)a3
{
  -[RCPlaybackViewController _updatePlaybackSettingsButtonTint:](self, "_updatePlaybackSettingsButtonTint:", objc_msgSend(a3, "hasCustomizedPlaybackSettings"));
}

- (void)_updateToolbarItems
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];
  void *v27;
  void *v28;

  if (-[RCPlaybackViewController didSetupToolbarWithButtonItems](self, "didSetupToolbarWithButtonItems"))
  {
    if (-[RCPlaybackViewController isRecentlyDeleted](self, "isRecentlyDeleted"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController recoverButtonItem](self, "recoverButtonItem"));
      v28 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController eraseButtonItem](self, "eraseButtonItem"));
      v27 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      objc_msgSend(v3, "updateToolbarWithLeadingItems:trailingItems:", v5, v7);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController shareButtonItem](self, "shareButtonItem"));
      v26[0] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController favoriteButtonItem](self, "favoriteButtonItem"));
      v26[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moveToFolderButtonItem](self, "moveToFolderButtonItem"));
      v26[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController deleteButtonItem](self, "deleteButtonItem"));
      v26[3] = v11;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));

      if (-[RCPlaybackViewController _shouldCollapseToolbarButtons](self, "_shouldCollapseToolbarButtons"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moreOptionsButtonItem](self, "moreOptionsButtonItem"));
        v25[0] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController deleteButtonItem](self, "deleteButtonItem"));
        v25[1] = v13;
        v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

        v3 = (void *)v14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController playbackSettingsButtonItem](self, "playbackSettingsButtonItem"));
      v24[0] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController editButtonItem](self, "editButtonItem"));
      v24[1] = v16;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));

      if (!-[RCPlaybackViewController _shouldCollapseToolbarButtons](self, "_shouldCollapseToolbarButtons"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
        v18 = objc_msgSend(v17, "deviceIsSupported");

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController playbackSettingsButtonItem](self, "playbackSettingsButtonItem"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController transcriptionButtonItem](self, "transcriptionButtonItem", v19));
          v23[1] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController editButtonItem](self, "editButtonItem"));
          v23[2] = v21;
          v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));

          v4 = (void *)v22;
        }
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
      objc_msgSend(v5, "updateToolbarWithLeadingItems:trailingItems:", v3, v4);
    }

  }
}

- (void)_updatePlaybackSettingsButtonTint:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController playbackSettingsButtonItem](self, "playbackSettingsButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customView"));
  v8 = objc_opt_class(RCToggleButton, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController playbackSettingsButtonItem](self, "playbackSettingsButtonItem"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customView"));

    objc_msgSend(v11, "setIsToggled:", v3);
  }
}

- (void)_updateTranscriptionButtonTint:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController transcriptionButtonItem](self, "transcriptionButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customView"));
  v8 = objc_opt_class(RCToggleButton, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController transcriptionButtonItem](self, "transcriptionButtonItem"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customView"));

    objc_msgSend(v11, "setIsToggled:", v3);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackViewController;
  -[RCPlaybackViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[RCPlaybackViewController handleDarkmodeChange](self, "handleDarkmodeChange");
  -[RCPlaybackViewController _hideNavigationBarIfNeeded](self, "_hideNavigationBarIfNeeded");
}

- (void)_hideNavigationBarIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "presentsTitleAndAdditionalEditingControlsInPlaybackCard");

  if ((v4 & 1) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController navigationController](self, "navigationController"));
    objc_msgSend(v5, "setNavigationBarHidden:", 1);

  }
}

- (void)_setupToolbarWithButtonItemsIfNeeded
{
  unsigned int v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v44, "presentsTitleAndAdditionalEditingControlsInPlaybackCard");
  if (!-[RCPlaybackViewController didSetupToolbarWithButtonItems](self, "didSetupToolbarWithButtonItems") && v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController favoriteButtonItem](self, "favoriteButtonItem"));
    if (!v4)
    {
      v5 = objc_alloc((Class)UIBarButtonItem);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "notFavoriteImage"));
      v4 = objc_msgSend(v5, "initWithImage:style:target:action:", v6, 0, self, "_toggleFavorite");

      -[RCPlaybackViewController setFavoriteButtonItem:](self, "setFavoriteButtonItem:", v4);
    }
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController shareButtonItem](self, "shareButtonItem"));
    if (!v7)
    {
      v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "_doShare:");
      -[RCPlaybackViewController setShareButtonItem:](self, "setShareButtonItem:", v7);
    }
    v43 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController deleteButtonItem](self, "deleteButtonItem"));
    if (!v8)
    {
      v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 16, self, "_doDelete:");
      -[RCPlaybackViewController setDeleteButtonItem:](self, "setDeleteButtonItem:", v8);
    }
    v42 = v8;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController recoverButtonItem](self, "recoverButtonItem"));
    if (!v9)
    {
      v10 = objc_alloc((Class)UIBarButtonItem);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1001B2BC0, 0));
      v9 = objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, "_doRecover:");

      -[RCPlaybackViewController setRecoverButtonItem:](self, "setRecoverButtonItem:", v9);
    }
    v41 = v9;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController playbackSettingsButtonItem](self, "playbackSettingsButtonItem"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton playbackSettingsButton](RCToggleButton, "playbackSettingsButton"));
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "playbackViewToolbarImageSymbolConfiguration"));
      objc_msgSend(v14, "setImageSymbolConfiguration:", v15);

      objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "_doDisplayPlaybackSettings:", 64);
      v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v14);
      -[RCPlaybackViewController setPlaybackSettingsButtonItem:](self, "setPlaybackSettingsButtonItem:", v13);

    }
    v16 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController transcriptionButtonItem](self, "transcriptionButtonItem"));
    if (!v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton transcriptionButton](RCToggleButton, "transcriptionButton"));
      objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "playbackViewToolbarImageSymbolConfiguration"));
      objc_msgSend(v17, "setImageSymbolConfiguration:", v18);

      objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "_doShowTranscriptionView:", 64);
      v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v17);
      -[RCPlaybackViewController setTranscriptionButtonItem:](self, "setTranscriptionButtonItem:", v16);

    }
    v19 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController editButtonItem](self, "editButtonItem"));
    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[RCEditImageButton buttonWithType:](RCEditImageButton, "buttonWithType:", 1));
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v20, "addTarget:action:forControlEvents:", self, "_doEdit", 64);
      v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v20);
      -[RCPlaybackViewController setEditButtonItem:](self, "setEditButtonItem:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("AX_EDIT"), &stru_1001B2BC0, 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController editButtonItem](self, "editButtonItem"));
      objc_msgSend(v23, "setAccessibilityLabel:", v22);

    }
    v24 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController eraseButtonItem](self, "eraseButtonItem"));
    if (!v24)
    {
      v25 = objc_alloc((Class)UIBarButtonItem);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
      v24 = objc_msgSend(v25, "initWithTitle:style:target:action:", v27, 0, self, "_doErase:");

      -[RCPlaybackViewController setEraseButtonItem:](self, "setEraseButtonItem:", v24);
    }
    v28 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moveToFolderButtonItem](self, "moveToFolderButtonItem"));
    if (!v28)
    {
      v29 = objc_alloc((Class)UIBarButtonItem);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "moveToFolderImage"));
      v28 = objc_msgSend(v29, "initWithImage:style:target:action:", v30, 0, self, "_doMoveToFolder:");

      -[RCPlaybackViewController setMoveToFolderButtonItem:](self, "setMoveToFolderButtonItem:", v28);
    }
    v40 = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moreOptionsButtonItem](self, "moreOptionsButtonItem"));
    if (!v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
      v33 = objc_msgSend(v32, "deviceIsSupported");

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController _createMoreOptionsMenu:shouldShowTranscriptionOption:](self, "_createMoreOptionsMenu:shouldShowTranscriptionOption:", 0, v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis.circle")));
      v36 = v4;
      v37 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:menu:", v35, v34);
      -[RCPlaybackViewController setMoreOptionsButtonItem:](self, "setMoreOptionsButtonItem:", v37);

      v4 = v36;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
    v39 = v38 != 0;

    objc_msgSend(v43, "setEnabled:", v39);
    objc_msgSend(v42, "setEnabled:", v39);
    objc_msgSend(v19, "setEnabled:", v39);
    -[RCPlaybackViewController setDidSetupToolbarWithButtonItems:](self, "setDidSetupToolbarWithButtonItems:", 1);
    -[RCPlaybackViewController _updateToolbarItems](self, "_updateToolbarItems");

  }
}

- (void)_updateMoreOptionsMenu
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  v4 = objc_msgSend(v3, "deviceIsSupported");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController _createMoreOptionsMenu:shouldShowTranscriptionOption:](self, "_createMoreOptionsMenu:shouldShowTranscriptionOption:", -[RCPlaybackViewController isFavorite](self, "isFavorite"), v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController moreOptionsButtonItem](self, "moreOptionsButtonItem"));
  objc_msgSend(v5, "setMenu:", v6);

}

- (id)_createMoreOptionsMenu:(BOOL)a3 shouldShowTranscriptionOption:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v20;
  uint64_t v21;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[4];
  _QWORD v36[3];

  v24 = a4;
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareToolbarMenuImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARE_CURRENT_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10005E864;
  v32[3] = &unk_1001AC560;
  objc_copyWeak(&v33, &location);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v26, 0, v32));

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_FAVORITES"), &stru_1001B2BC0, 0));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "favoriteImage"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ADD_TO_FAVORITES"), &stru_1001B2BC0, 0));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notFavoriteImage"));
  }
  v11 = (void *)v9;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10005E8C4;
  v30[3] = &unk_1001AC560;
  objc_copyWeak(&v31, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v25, v11, 0, v30));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MOVE_TO_FOLDER"), &stru_1001B2BC0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "moveToFolderImage"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10005E8F0;
  v28[3] = &unk_1001AC560;
  objc_copyWeak(&v29, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v28));

  v36[0] = v27;
  v36[1] = v12;
  v36[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v17));

  if (v24)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController deferredTranscriptMenuElement](self, "deferredTranscriptMenuElement"));
    v35[0] = v27;
    v35[1] = v12;
    v35[2] = v16;
    v35[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    v21 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v20));

    v18 = (void *)v21;
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  return v18;
}

- (id)showTranscriptMenuElement
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  v4 = objc_msgSend(v3, "centerContentViewState") == (id)1;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
    v7 = CFSTR("SHOW_WAVEFORM");
  else
    v7 = CFSTR("VIEW_TRANSCRIPT");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1001B2BC0, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v10 = v9;
  if (v4)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transcriptionImage"));
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005EB68;
  v17[3] = &unk_1001AC560;
  objc_copyWeak(&v18, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, v11, 0, v17));
  v21 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1001B2BC0, v11, 0, 1, v13));

  v20 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v15;
}

- (id)deferredTranscriptMenuElement
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005EC68;
  v4[3] = &unk_1001AC588;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDeferredMenuElement elementWithUncachedProvider:](UIDeferredMenuElement, "elementWithUncachedProvider:", v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)_shouldCollapseToolbarButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v6, "width");
  v8 = v7;
  objc_msgSend(v5, "playbackViewWidthToCollapseToolbarButtons");
  v10 = v9;

  return v8 <= v10;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v6, "setCurrentUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));

  v8 = objc_msgSend(v5, "userInterfaceStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceStyle");

  if (v8 != v10)
  {
    -[RCPlaybackViewController handleDarkmodeChange](self, "handleDarkmodeChange");
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("RCTraitCollectionUserInterfaceStyleChangedNotification"), 0);

  }
}

- (BOOL)_supportsTimelineGeneration
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "applicationState");

  if (v9 != (id)2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005EF44;
    v10[3] = &unk_1001ABA08;
    v10[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);
  }

}

- (void)_toggleFavorite
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v4, "toggleFavoriteForUUID:", v3);

}

- (void)_doShare:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 29, v5, self, v4, 0.0);

}

- (void)_doDelete:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 14, v5, self, v4, 0.0);

}

- (void)_doRecover:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 20, v5, self, v4, 0.0);

}

- (void)_doErase:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 17, v5, self, v4, 0.0);

}

- (void)_doDisplayPlaybackSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 44, v5, self, v4, 0.0);

}

- (void)_doShowTranscriptionView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 45, v5, self, v4, 0.0);

}

- (void)_doEdit
{
  void *v3;
  id v4;

  -[RCRecordingViewController stopScrolling](self, "stopScrolling");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v4, "performAction:atPosition:forUUID:sourceController:source:", 23, v3, 0, 0, 0.0);

}

- (void)_doMoveToFolder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 42, v5, self, v4, 0.0);

}

- (void)enterEditMode
{
  -[RCPlaybackViewController _doEdit](self, "_doEdit");
}

- (void)enableWaveformScrolling:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waveformViewController"));
  objc_msgSend(v4, "enableWaveformScrolling:", v3);

}

- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RCAVWaveformViewController *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = -[RCAVWaveformViewController initWithWaveformDataSource:displayStyle:isOverview:delegate:]([RCAVWaveformViewController alloc], "initWithWaveformDataSource:displayStyle:isOverview:delegate:", v6, 0, v4, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController activeTimeController](self, "activeTimeController"));
  -[RCAVWaveformViewController setActiveTimeController:](v7, "setActiveTimeController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](v7, "waveformViewController"));
  objc_msgSend(v9, "setIsPlayback:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v10, "setDisplayStyle:", 3);

  return v7;
}

- (void)enablePlaybackWithComposition:(id)a3 displayModel:(id)a4 timeController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a4;
  v9 = a3;
  -[RCRecordingViewController setActiveTimeController:](self, "setActiveTimeController:", a5);
  -[RCRecordingViewController setComposition:](self, "setComposition:", v9);
  v17 = objc_msgSend(objc_alloc((Class)RCCompositionWaveformDataSource), "initWithComposition:", v9);

  -[RCRecordingViewController setWaveformDataSource:](self, "setWaveformDataSource:", v17);
  -[RCPlaybackViewController updateWithRecordingModel:](self, "updateWithRecordingModel:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waveformViewController"));
  objc_msgSend(v11, "setIsPlayback:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "waveformViewController"));
  objc_msgSend(v13, "resetZoomScale");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waveformViewController"));
  objc_msgSend(v15, "setIsPlayback:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v16, "setRecordingViewState:", 2 * (v8 != 0));
  -[RCRecordingViewController _beginFileTranscriptionIfNeeded](self, "_beginFileTranscriptionIfNeeded");

}

- (void)updateContentUnavailableViewState:(int64_t)a3
{
  -[RCPlaybackViewController setContentUnavailableState:](self, "setContentUnavailableState:", a3);
  -[RCPlaybackViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v4 = -[RCPlaybackViewController contentUnavailableState](self, "contentUnavailableState", a3);
  if (v4 == -1)
  {
    v10 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playbackContentUnavailableViewBackgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "background"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    if ((id)-[RCPlaybackViewController contentUnavailableState](self, "contentUnavailableState") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_CONTENT_NO_SELECTION_TITLE"), &stru_1001B2BC0, 0));
      objc_msgSend(v12, "setText:", v9);

    }
    v10 = v12;
  }
  v13 = v10;
  -[RCPlaybackViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v11, "updateUIForContentUnavailable:", v4 != -1);

}

- (void)handleDarkmodeChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v3, "updateColors");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](self, "view"));
  objc_msgSend(v4, "restyle");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waveformViewController"));
  objc_msgSend(v6, "updateColors");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waveformViewController"));
  objc_msgSend(v7, "updateColors");

}

- (void)deviceTranscriptionSupportDidChange:(BOOL)a3
{
  -[RCRecordingViewController _setupTranscriptViewDependenciesIfNeeded](self, "_setupTranscriptViewDependenciesIfNeeded", a3);
  -[RCPlaybackViewController _updateMoreOptionsMenu](self, "_updateMoreOptionsMenu");
  -[RCPlaybackViewController _updateToolbarItems](self, "_updateToolbarItems");
}

- (UISplitViewController)parentSplitViewController
{
  return (UISplitViewController *)objc_loadWeakRetained((id *)&self->_parentSplitViewController);
}

- (void)setParentSplitViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentSplitViewController, a3);
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (UIBarButtonItem)favoriteButtonItem
{
  return self->_favoriteButtonItem;
}

- (void)setFavoriteButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteButtonItem, a3);
}

- (UIBarButtonItem)shareButtonItem
{
  return self->_shareButtonItem;
}

- (void)setShareButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareButtonItem, a3);
}

- (UIBarButtonItem)deleteButtonItem
{
  return self->_deleteButtonItem;
}

- (void)setDeleteButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButtonItem, a3);
}

- (UIBarButtonItem)editButtonItem
{
  return self->_editButtonItem;
}

- (void)setEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_editButtonItem, a3);
}

- (UIBarButtonItem)recoverButtonItem
{
  return self->_recoverButtonItem;
}

- (void)setRecoverButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_recoverButtonItem, a3);
}

- (UIBarButtonItem)eraseButtonItem
{
  return self->_eraseButtonItem;
}

- (void)setEraseButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_eraseButtonItem, a3);
}

- (UIBarButtonItem)moveToFolderButtonItem
{
  return self->_moveToFolderButtonItem;
}

- (void)setMoveToFolderButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moveToFolderButtonItem, a3);
}

- (UIBarButtonItem)moreOptionsButtonItem
{
  return self->_moreOptionsButtonItem;
}

- (void)setMoreOptionsButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moreOptionsButtonItem, a3);
}

- (UIBarButtonItem)transcriptionButtonItem
{
  return self->_transcriptionButtonItem;
}

- (void)setTranscriptionButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionButtonItem, a3);
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)didSetupToolbarWithButtonItems
{
  return self->_didSetupToolbarWithButtonItems;
}

- (void)setDidSetupToolbarWithButtonItems:(BOOL)a3
{
  self->_didSetupToolbarWithButtonItems = a3;
}

- (int64_t)contentUnavailableState
{
  return self->_contentUnavailableState;
}

- (void)setContentUnavailableState:(int64_t)a3
{
  self->_contentUnavailableState = a3;
}

- (UIBarButtonItem)playbackSettingsButtonItem
{
  return self->_playbackSettingsButtonItem;
}

- (void)setPlaybackSettingsButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSettingsButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSettingsButtonItem, 0);
  objc_storeStrong((id *)&self->_transcriptionButtonItem, 0);
  objc_storeStrong((id *)&self->_moreOptionsButtonItem, 0);
  objc_storeStrong((id *)&self->_moveToFolderButtonItem, 0);
  objc_storeStrong((id *)&self->_eraseButtonItem, 0);
  objc_storeStrong((id *)&self->_recoverButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_shareButtonItem, 0);
  objc_storeStrong((id *)&self->_favoriteButtonItem, 0);
  objc_destroyWeak((id *)&self->_parentSplitViewController);
}

@end
