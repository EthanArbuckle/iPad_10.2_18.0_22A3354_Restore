@implementation RCPlaybackSettingsCollectionViewController

- (RCPlaybackSettingsCollectionViewController)init
{
  void *v3;
  RCPlaybackSettingsCollectionViewController *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _createCollectionViewLayout](self, "_createCollectionViewLayout"));
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackSettingsCollectionViewController;
  v4 = -[RCPlaybackSettingsCollectionViewController initWithCollectionViewLayout:](&v6, "initWithCollectionViewLayout:", v3);

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCPlaybackSettingsCollectionViewController;
  -[RCPlaybackSettingsCollectionViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setAllowsSelection:", 0);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(UICollectionViewListCell, v4), UICollectionElementKindSectionHeader, CFSTR("kPlaybackSettingSpeedSectionHeaderCellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RCPlaybackSettingSliderCell, v5), CFSTR("kPlaybackSettingSpeedCellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RCPlaybackSettingSwitchCell, v6), CFSTR("kPlaybackSettingEnhanceCellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RCPlaybackSettingSwitchCell, v7), CFSTR("kPlaybackSettingRemoveSilenceCellIdentifier"));

}

- (void)setPlaybackSettings:(id)a3
{
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
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_storeStrong((id *)&self->_playbackSettings, a3);
  if (-[RCPlaybackSettingsCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForEnhancedSwitch](self, "_indexPathForEnhancedSwitch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

    LODWORD(v7) = objc_msgSend(v8, "isSwitchON");
    if ((_DWORD)v7 != objc_msgSend(v19, "enhanced"))
      objc_msgSend(v5, "addObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForRemoveSilenceSwitch](self, "_indexPathForRemoveSilenceSwitch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v9));

    LODWORD(v10) = objc_msgSend(v11, "isSwitchON");
    if ((_DWORD)v10 != objc_msgSend(v19, "silenceRemoved"))
      objc_msgSend(v5, "addObject:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForPlaybackSpeedSlider](self, "_indexPathForPlaybackSpeedSlider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForItemAtIndexPath:", v12));

    objc_msgSend(v14, "sliderValue");
    v16 = v15;
    objc_msgSend(v19, "playbackSpeed");
    if (v16 != v17)
      objc_msgSend(v5, "addObject:", v12);
    if (objc_msgSend(v5, "count"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v18, "reloadItemsAtIndexPaths:", v5);

    }
  }

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return 2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "section");
  if (!v6 || v7 == (id)1)
  {
    if (!v6)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _cellForPlaybackSpeedSectionAtIndexPath:](self, "_cellForPlaybackSpeedSectionAtIndexPath:", v5));
      goto LABEL_8;
    }
  }
  else
  {
    v8 = OSLogForCategory(kVMLogCategoryDefault);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10010ACEC(v5, v9);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _cellForGeneralSettingsSectionAtIndexPath:](self, "_cellForGeneralSettingsSectionAtIndexPath:", v5));
LABEL_8:
  v11 = (void *)v10;

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", UICollectionElementKindSectionHeader) & 1) == 0)
  {
    v10 = OSLogForCategory(kVMLogCategoryDefault);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10010AD88();

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, CFSTR("kPlaybackSettingSpeedSectionHeaderCellIdentifier"), v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_SPEED"), &stru_1001B2BC0, 0));
  objc_msgSend(v13, "setText:", v15);

  objc_msgSend(v12, "setContentConfiguration:", v13);
  return v12;
}

- (id)_cellForPlaybackSpeedSectionAtIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForPlaybackSpeedSlider](self, "_indexPathForPlaybackSpeedSlider"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForRemoveSilenceSwitch](self, "_indexPathForRemoveSilenceSwitch"));
  if (v5 != v4 && v6 != v4)
  {
    v7 = OSLogForCategory(kVMLogCategoryDefault);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10010ADF4();

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
  v10 = v9;
  if (v5 == v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kPlaybackSettingSpeedCellIdentifier"), v4));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController playbackSettings](self, "playbackSettings"));
    objc_msgSend(v14, "playbackSpeed");
    objc_msgSend(v11, "setSliderValue:");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kPlaybackSettingRemoveSilenceCellIdentifier"), v4));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SKIP_SILENCE_SETTING"), &stru_1001B2BC0, 0));
    objc_msgSend(v11, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController playbackSettings](self, "playbackSettings"));
    objc_msgSend(v11, "setSwitchState:", objc_msgSend(v14, "silenceRemoved"));
  }

  objc_msgSend(v11, "setCellActionsDelegate:", self);
  return v11;
}

- (id)_cellForGeneralSettingsSectionAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "item"))
  {
    v5 = OSLogForCategory(kVMLogCategoryDefault);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10010AE60();

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kPlaybackSettingEnhanceCellIdentifier"), v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ENHANCE_RECORDING_SETTING"), &stru_1001B2BC0, 0));
  objc_msgSend(v8, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController playbackSettings](self, "playbackSettings"));
  objc_msgSend(v8, "setSwitchState:", objc_msgSend(v11, "enhanced"));

  v12 = v8;
  objc_msgSend(v12, "setCellActionsDelegate:", self);

  return v12;
}

- (id)_createCollectionViewLayout
{
  return objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", &stru_1001AB990);
}

- (void)didToggleSwitch:(id)a3 toState:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a4;
  v20 = a3;
  v7 = objc_opt_class(RCPlaybackSettingSwitchCell, v6);
  isKindOfClass = objc_opt_isKindOfClass(v20, v7);
  v9 = v20;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v20;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathForCell:", v10));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForEnhancedSwitch](self, "_indexPathForEnhancedSwitch"));
    v14 = objc_msgSend(v13, "isEqual:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForRemoveSilenceSwitch](self, "_indexPathForRemoveSilenceSwitch"));
    v16 = objc_msgSend(v15, "isEqual:", v12);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController playbackSettings](self, "playbackSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid"));

    if (v14)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController delegate](self, "delegate"));
      objc_msgSend(v19, "setEnhanced:forUUID:", v4, v18);
    }
    else
    {
      if (!v16)
      {
LABEL_7:

        v9 = v20;
        goto LABEL_8;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController delegate](self, "delegate"));
      objc_msgSend(v19, "setRemoveSilence:forUUID:", v4, v18);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)didUpdateSlider:(id)a3 toValue:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = objc_opt_class(RCPlaybackSettingSliderCell, v6);
  isKindOfClass = objc_opt_isKindOfClass(v18, v7);
  v9 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v18;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathForCell:", v10));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController _indexPathForPlaybackSpeedSlider](self, "_indexPathForPlaybackSpeedSlider"));
    v14 = objc_msgSend(v13, "isEqual:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController playbackSettings](self, "playbackSettings"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));

    if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController delegate](self, "delegate"));
      objc_msgSend(v17, "setPlaybackSpeed:forUUID:", v16, a4);

    }
    v9 = v18;
  }

}

- (id)_indexPathForPlaybackSpeedSlider
{
  return +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0);
}

- (id)_indexPathForRemoveSilenceSwitch
{
  return +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 1, 0);
}

- (id)_indexPathForEnhancedSwitch
{
  return +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 1);
}

- (RCPlaybackSettingsDelegate)delegate
{
  return (RCPlaybackSettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RCPlaybackSettings)playbackSettings
{
  return self->_playbackSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
