@implementation CHFriendDetailCollectionViewController

- (CHFriendDetailCollectionViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4 friend:(id)a5 snapshot:(id)a6 snapshotDate:(id)a7 achievementsDataProvider:(id)a8 workoutDataProvider:(id)a9 workoutFormattingManager:(id)a10 formattingManager:(id)a11 badgeImageFactory:(id)a12 healthStore:(id)a13 fitnessAppContext:(id)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  CHFriendDetailCollectionViewController *v24;
  CHFriendDetailCollectionViewController *v25;
  id *p_friend;
  id *p_activitySnapshot;
  void *v28;
  id v29;
  uint64_t v30;
  NSDateComponents *snapshotDateComponents;
  uint64_t v32;
  NSArray *todaysFriendWorkouts;
  _HKWheelchairUseCharacteristicCache *v34;
  _HKWheelchairUseCharacteristicCache *wheelchairUseCharacteristicCache;
  ACHAchievementLocalizationProvider *v36;
  ACHAchievementLocalizationProvider *achievementLocProvider;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[8];
  objc_super v60;

  v58 = a3;
  v57 = a4;
  v56 = a5;
  v46 = a6;
  v19 = a6;
  v20 = a8;
  v55 = v19;
  v21 = a7;
  v54 = v20;
  v53 = a9;
  v52 = a10;
  v22 = v21;
  v51 = a11;
  v50 = a12;
  v23 = a13;
  v49 = a14;
  v60.receiver = self;
  v60.super_class = (Class)CHFriendDetailCollectionViewController;
  v24 = -[CHFriendDetailCollectionViewController init](&v60, "init");
  v25 = v24;
  if (v24)
  {
    v48 = v23;
    objc_storeStrong((id *)&v24->_friendListManager, a3);
    objc_storeStrong((id *)&v25->_friendManager, a4);
    p_friend = (id *)&v25->_friend;
    objc_storeStrong((id *)&v25->_friend, a5);
    objc_storeStrong((id *)&v25->_formattingManager, a11);
    objc_storeStrong((id *)&v25->_workoutFormattingManager, a10);
    objc_storeStrong((id *)&v25->_imageFactory, a12);
    objc_storeStrong((id *)&v25->_achievementsDataProvider, v20);
    p_activitySnapshot = (id *)&v25->_activitySnapshot;
    objc_storeStrong((id *)&v25->_activitySnapshot, v46);
    v28 = v22;
    if (!v22)
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_storeStrong((id *)&v25->_snapshotDate, v28);
    if (!v22)

    v29 = sub_10005CAA8((uint64_t)objc_msgSend(*p_activitySnapshot, "snapshotIndex"));
    v30 = objc_claimAutoreleasedReturnValue(v29);
    snapshotDateComponents = v25->_snapshotDateComponents;
    v25->_snapshotDateComponents = (NSDateComponents *)v30;

    v25->_isMe = objc_msgSend(*p_friend, "isMe");
    -[CHFriendDetailCollectionViewController _populateAchievements](v25, "_populateAchievements");
    v32 = objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _workoutsForFriend:snapshot:](v25, "_workoutsForFriend:snapshot:", *p_friend, *p_activitySnapshot));
    todaysFriendWorkouts = v25->_todaysFriendWorkouts;
    v25->_todaysFriendWorkouts = (NSArray *)v32;

    v25->_dataIsHidden = -[CHFriendDetailCollectionViewController _isDataHidden](v25, "_isDataHidden");
    objc_storeStrong((id *)&v25->_workoutDataProvider, a9);
    v25->_pairedWatchSupportsCompetitions = FIDeviceMeetsMinimumOSVersionGlory();
    v34 = (_HKWheelchairUseCharacteristicCache *)objc_msgSend(objc_alloc((Class)_HKWheelchairUseCharacteristicCache), "initWithHealthStore:", v48);
    wheelchairUseCharacteristicCache = v25->_wheelchairUseCharacteristicCache;
    v25->_wheelchairUseCharacteristicCache = v34;

    -[_HKWheelchairUseCharacteristicCache addObserver:](v25->_wheelchairUseCharacteristicCache, "addObserver:", v25);
    v25->_iAmWheelchairUser = -[_HKWheelchairUseCharacteristicCache isWheelchairUser](v25->_wheelchairUseCharacteristicCache, "isWheelchairUser");
    v25->_experienceType = FIExperienceTypeWithHealthStore(v48);
    objc_storeStrong((id *)&v25->_fitnessAppContext, a14);
    v36 = (ACHAchievementLocalizationProvider *)objc_alloc_init((Class)ACHAchievementLocalizationProvider);
    achievementLocProvider = v25->_achievementLocProvider;
    v25->_achievementLocProvider = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](v25->_formattingManager, "unitManager"));
    v39 = v38;
    if (v38)
    {
      v40 = objc_msgSend(v38, "conformsToProtocol:", &OBJC_PROTOCOL___ACHUnitManager);
      if ((_DWORD)v40)
      {
        -[ACHAchievementLocalizationProvider setAchUnitManager:](v25->_achievementLocProvider, "setAchUnitManager:", v39);
      }
      else
      {
        ASLoggingInitialize(v40);
        v41 = ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "FIUIUnitManager failed to conform to the ACHUnitManager protocol, template's canonical unit will be utilized", buf, 2u);
        }
      }
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_friend, "displayName"));
    -[ACHAchievementLocalizationProvider setName:](v25->_achievementLocProvider, "setName:", v42);

    if (v25->_isMe)
    {
      -[ACHAchievementLocalizationProvider setWheelchairUser:](v25->_achievementLocProvider, "setWheelchairUser:", v25->_iAmWheelchairUser);
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_friend, "currentSnapshot"));
      -[ACHAchievementLocalizationProvider setWheelchairUser:](v25->_achievementLocProvider, "setWheelchairUser:", objc_msgSend(v43, "wheelchairUse") == (id)2);

    }
    v23 = v48;

  }
  return v25;
}

- (CHFriendDetailCollectionViewController)init
{

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSString *v19;
  NSString *sharingInfoText;
  void *v21;
  UICollectionViewFlowLayout *v22;
  UICollectionViewFlowLayout *collectionViewLayout;
  UICollectionView *v24;
  UICollectionView *collectionView;
  void *v26;
  void *v27;
  UICollectionView *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  UICollectionView *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  UICollectionView *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint8_t buf[16];
  _QWORD handler[4];
  id v42;
  id location;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CHFriendDetailCollectionViewController;
  -[CHFriendDetailCollectionViewController viewDidLoad](&v44, "viewDidLoad");
  if (self->_isMe)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ME"), &stru_1007AE1D0, CFSTR("Localizable")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("•%@"), v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  -[CHFriendDetailCollectionViewController setTitle:](self, "setTitle:", v5);
  if (self->_isMe)
  {
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "_showShareOptions:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    objc_initWeak(&location, self);
    v10 = (const char *)kASGatewayStatusChangedNotificationKey;
    v11 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000C5A10;
    handler[3] = &unk_1007791B0;
    objc_copyWeak(&v42, &location);
    notify_register_dispatch(v10, &self->_activitySharingGatewayStatusChangedToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    ASLoggingInitialize(v12);
    v13 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registered a callback for Watch pairing changed notifications", buf, 2u);
    }
    -[CHFriendDetailCollectionViewController _updateSharingTextForMe](self, "_updateSharingTextForMe");
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    if ((id)+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) == (id)3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 4));
      objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "_infoButtonTapped:", 64);
      v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v14);
      objc_msgSend(v8, "addObject:", v15);

    }
    if (+[MFMessageComposeViewController canSendText](MFMessageComposeViewController, "canSendText"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("message")));
      v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v16, 0, self, "_sendMessageButtonTapped:");
      objc_msgSend(v8, "addObject:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v18, "setRightBarButtonItems:", v8);

    v19 = (NSString *)objc_claimAutoreleasedReturnValue(-[ASFriend as_detailedSharingDurationString](self->_friend, "as_detailedSharingDurationString"));
    sharingInfoText = self->_sharingInfoText;
    self->_sharingInfoText = v19;

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "_friendDataWasUpdated:", kASFriendListChangedNotificationKey, 0);
  -[CHFriendDetailCollectionViewController _setupNumberOfItemsInSection](self, "_setupNumberOfItemsInSection");
  -[CHFriendDetailCollectionViewController _setupCells](self, "_setupCells");
  -[CHFriendDetailCollectionViewController _setupCellSizes](self, "_setupCellSizes");
  v22 = (UICollectionViewFlowLayout *)objc_alloc_init((Class)UICollectionViewFlowLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v22;

  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewLayout, "setMinimumInteritemSpacing:", 0.0);
  v24 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  collectionView = self->_collectionView;
  self->_collectionView = v24;

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v26);

  -[UICollectionView setAllowsSelection:](self->_collectionView, "setAllowsSelection:", 1);
  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController view](self, "view"));
  objc_msgSend(v27, "addSubview:", self->_collectionView);

  v28 = self->_collectionView;
  *(_QWORD *)&v30 = objc_opt_class(UICollectionViewCell, v29).n128_u64[0];
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v28, "registerClass:forCellWithReuseIdentifier:", v31, CFSTR("Cell"), v30);
  v32 = self->_collectionView;
  *(_QWORD *)&v34 = objc_opt_class(UICollectionViewCell, v33).n128_u64[0];
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v32, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v35, UICollectionElementKindSectionHeader, CFSTR("Header"), v34);
  v36 = self->_collectionView;
  *(_QWORD *)&v38 = objc_opt_class(UICollectionReusableView, v37).n128_u64[0];
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v36, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v39, UICollectionElementKindSectionFooter, CFSTR("Footer"), v38);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHFriendDetailCollectionViewController;
  -[CHFriendDetailCollectionViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_activitySharingGatewayStatusChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)CHFriendDetailCollectionViewController;
  -[CHFriendDetailCollectionViewController dealloc](&v4, "dealloc");
}

- (void)_updateSharingTextForMe
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *sharingInfoText;
  id v7;
  _QWORD v8[5];

  if (FIDeviceMeetsMinimumOSVersionDaytona(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendManager activitySharingClient](self->_friendManager, "activitySharingClient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[_HKFitnessFriendActivitySnapshot snapshotIndex](self->_activitySnapshot, "snapshotIndex")));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000C5C8C;
    v8[3] = &unk_100778138;
    v8[4] = self;
    objc_msgSend(v3, "areMultipleDevicesSharingDataForSnapshotIndex:completion:", v4, v8);

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_UPGRADE_CURRENT_WATCH"), &stru_1007AE1D0, CFSTR("Localizable")));
    sharingInfoText = self->_sharingInfoText;
    self->_sharingInfoText = v5;

  }
}

- (BOOL)_isDataHidden
{
  ASFriend *v3;
  NSDate *v4;
  NSDate *snapshotDate;
  BOOL v6;

  v3 = self->_friend;
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(-[_HKFitnessFriendActivitySnapshot endDate](self->_activitySnapshot, "endDate"));
  snapshotDate = v4;
  if (!v4)
    snapshotDate = self->_snapshotDate;
  v6 = (-[ASFriend isActivityDataVisibleToMeForDate:](v3, "isActivityDataVisibleToMeForDate:", snapshotDate) & 1) == 0&& !self->_isMe;

  return v6;
}

- (void)_populateAchievements
{
  NSSet *v3;
  NSSet *todaysAchievements;
  void *v5;
  id v6;

  if (self->_isMe)
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue(-[AAUIAchievementsDataProvider achievementsForDateComponents:](self->_achievementsDataProvider, "achievementsForDateComponents:", self->_snapshotDateComponents));
  else
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _transformFriendAchievementsToACHAchievements](self, "_transformFriendAchievementsToACHAchievements"));
  todaysAchievements = self->_todaysAchievements;
  self->_todaysAchievements = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_todaysAchievements, "allObjects"));
  v6 = objc_msgSend(v5, "mutableCopy");

  AAUISortAchievementsByMostRecentEarnedDate(v6, 1);
  -[CHHorizontalScrollingAchievementsView setAchievements:](self->_achievementsCell, "setAchievements:", v6);

}

- (id)_transformFriendAchievementsToACHAchievements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  AAUIAchievementsDataProvider *achievementsDataProvider;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v28;
  CHFriendDetailCollectionViewController *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend friendAchievements](self->_friend, "friendAchievements"));
  v29 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[_HKFitnessFriendActivitySnapshot snapshotIndex](self->_activitySnapshot, "snapshotIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (!objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init((Class)NSSet);
    goto LABEL_20;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = v5;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (!v7)
    goto LABEL_18;
  v8 = v7;
  v9 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "templateUniqueName"));
      v13 = ASIsCompetitionVictoryTemplate();

      if (v13)
      {
        v14 = ASEphemeralCompetitionVictoryAchievementForFriendAchievement(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (!v15)
          goto LABEL_16;
      }
      else
      {
        achievementsDataProvider = v29->_achievementsDataProvider;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "templateUniqueName"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIAchievementsDataProvider achievementForTemplateUniqueName:](achievementsDataProvider, "achievementForTemplateUniqueName:", v17));

        if (!v15)
          goto LABEL_16;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hk_map:", &stru_10077A3C0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "template"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueName"));
      v21 = objc_msgSend(v18, "containsObject:", v20);

      if ((v21 & 1) != 0)
      {
        ASLoggingInitialize(v22);
        v23 = ASLogAchievements;
        if (os_log_type_enabled(ASLogAchievements, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Dropping duplicate achievement: %@", buf, 0xCu);
        }
      }
      else
      {
        v24 = ASEphemeralEarnedAchievementForFriendAchievement(v11, v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setByAddingObject:", v25));

        v6 = (id)v26;
      }

LABEL_16:
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  }
  while (v8);
LABEL_18:

  v5 = v28;
LABEL_20:

  return v6;
}

- (void)_setupCells
{
  CHFriendDetailThreeRingCell *v3;
  CHFriendDetailThreeRingCell *threeRingCell;
  _HKFitnessFriendActivitySnapshot *activitySnapshot;
  unsigned int v6;
  CHFriendDetailThreeRingCell *v7;
  void *v8;
  CHFriendDetailDateCell *v9;
  CHFriendDetailDateCell *dateCell;
  uint64_t v11;
  CHFriendDetailCollectionViewController *v12;
  CHFriendDetailDateCell *v13;
  void *v15;
  CHFriendDetailCompetitionScoreCell *competitionScoreCell;
  CHFriendDetailCompetitionScoreCell *v17;
  CHFriendDetailCompetitionScoreCell *v18;
  ASFriend *v19;
  void *v20;
  CHFriendDetailCompetitionGraphCell *v21;
  CHFriendDetailCompetitionGraphCell *competitionGraphCell;
  void *v23;
  CHFriendDetailCompetitionTotalWinsCell *competitionTotalWinsCell;
  CHFriendDetailCompetitionTotalWinsCell *v25;
  CHFriendDetailCompetitionTotalWinsCell *v26;
  ASFriend *v27;
  void *v28;
  CHFriendDetailGoalCell *moveCell;
  CHFriendDetailGoalCell *v30;
  CHFriendDetailGoalCell *v31;
  void *v32;
  void *v33;
  CHFriendDetailGoalCell *v34;
  void *v35;
  void *v36;
  CHFriendDetailGoalCell *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CHFriendDetailCollectionViewController *v42;
  FIUIFormattingManager *formattingManager;
  FIUIFormattingManager *v44;
  void *v45;
  CHFriendDetailGoalCell *exerciseCell;
  CHFriendDetailGoalCell *v47;
  CHFriendDetailGoalCell *v48;
  void *v49;
  void *v50;
  CHFriendDetailGoalCell *v51;
  void *v52;
  void *v53;
  CHFriendDetailGoalCell *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t iAmWheelchairUser;
  __CFString *v60;
  CHFriendDetailGoalCell *standCell;
  CHFriendDetailGoalCell *v62;
  CHFriendDetailGoalCell *v63;
  void *v64;
  void *v65;
  CHFriendDetailGoalCell *v66;
  void *v67;
  void *v68;
  void *v69;
  CHFriendDetailGoalCell *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  CHFriendDetailGoalCell *stepCell;
  CHFriendDetailGoalCell *v76;
  CHFriendDetailGoalCell *v77;
  void *v78;
  CHFriendDetailGoalCell *v79;
  void *v80;
  void *v81;
  void *v82;
  CHFriendDetailGoalCell *v83;
  _HKFitnessFriendActivitySnapshot *v84;
  void *v85;
  CHFriendDetailGoalCell *distanceCell;
  CHFriendDetailGoalCell *v87;
  CHFriendDetailGoalCell *v88;
  void *v89;
  CHFriendDetailGoalCell *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  CHFriendDetailCollectionViewController *v95;
  NSArray *v96;
  NSArray *v97;
  NSArray *v98;
  id v99;
  uint64_t v100;
  void *i;
  void *v102;
  CHWorkoutDataProvider *workoutDataProvider;
  void *v104;
  NSMutableArray *v105;
  NSMutableArray *workoutCellsArray;
  id v107;
  uint64_t v108;
  double y;
  double width;
  double height;
  void *j;
  void *v113;
  CHWorkoutCellImageLabelView *v114;
  CHFitnessAppContext *fitnessAppContext;
  CHWorkoutFormattingManager *workoutFormattingManager;
  void *v117;
  CHHorizontalScrollingAchievementsView *v118;
  double v119;
  double v120;
  double v121;
  CHHorizontalScrollingAchievementsView *v122;
  CHHorizontalScrollingAchievementsView *achievementsCell;
  void *v124;
  CHFriendDetailCollectionViewController *v125;
  id v126;
  id v127;
  NSString *sharingInfoText;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  id *p_sharingInfoSizingLabel;
  id v142;
  id *p_isa;
  id v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  CHFriendDetailActionListView *v161;
  CHFriendDetailActionListView *actionListCell;
  NSMutableArray *v163;
  NSMutableArray *itemsArray;
  NSMutableArray *v165;
  CHFriendDetailDateCell *v166;
  void *v167;
  NSMutableArray *v168;
  void *v169;
  NSMutableArray *v170;
  void *v171;
  NSMutableArray *v172;
  void *v173;
  NSMutableArray *v174;
  void *v175;
  NSMutableArray *v176;
  CHFriendDetailGoalCell *v177;
  void *v178;
  NSMutableArray *v179;
  CHFriendDetailGoalCell *v180;
  void *v181;
  NSMutableArray *v182;
  void *v183;
  NSMutableArray *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  __CFString *v191;
  void *v192;
  NSArray *obj;
  CHFriendDetailCollectionViewController *v194;
  _QWORD v195[4];
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  id location;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  CHFriendDetailActionListView *v206;
  CHHorizontalScrollingAchievementsView *v207;
  _QWORD v208[2];
  _QWORD v209[2];
  CHFriendDetailGoalCell *v210;
  CHFriendDetailCompetitionTotalWinsCell *v211;
  CHFriendDetailCompetitionGraphCell *v212;
  CHFriendDetailCompetitionScoreCell *v213;
  _QWORD v214[2];
  _QWORD v215[2];
  _QWORD v216[2];
  _QWORD v217[2];
  _QWORD v218[2];
  _BYTE v219[128];
  _BYTE v220[128];

  if (!self->_threeRingCell)
  {
    v3 = -[CHFriendDetailThreeRingCell initWithFrame:]([CHFriendDetailThreeRingCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    threeRingCell = self->_threeRingCell;
    self->_threeRingCell = v3;

  }
  v194 = self;
  v186 = (void *)objc_claimAutoreleasedReturnValue(-[_HKFitnessFriendActivitySnapshot activitySummary](self->_activitySnapshot, "activitySummary"));
  if (self->_dataIsHidden)
  {
    -[CHFriendDetailThreeRingCell setHidden:](self->_threeRingCell, "setHidden:", 1);
    goto LABEL_11;
  }
  activitySnapshot = self->_activitySnapshot;
  if (activitySnapshot)
  {
    v6 = -[_HKFitnessFriendActivitySnapshot hasCarriedForwardGoals](activitySnapshot, "hasCarriedForwardGoals");
    v7 = self->_threeRingCell;
    if (v6)
    {
      -[CHFriendDetailThreeRingCell setActivitySummary:animated:](v7, "setActivitySummary:animated:", 0, 1);
      -[CHFriendDetailThreeRingCell setIsStandalonePhoneFitnessMode:](self->_threeRingCell, "setIsStandalonePhoneFitnessMode:", objc_msgSend(v186, "_isStandalonePhoneSummary"));
      goto LABEL_11;
    }
    v8 = v186;
  }
  else
  {
    v7 = self->_threeRingCell;
    v8 = 0;
  }
  -[CHFriendDetailThreeRingCell setActivitySummary:animated:](v7, "setActivitySummary:animated:", v8, 1);
LABEL_11:
  if (!self->_dateCell)
  {
    v9 = -[CHFriendDetailDateCell initWithFrame:]([CHFriendDetailDateCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dateCell = self->_dateCell;
    self->_dateCell = v9;

  }
  v11 = objc_claimAutoreleasedReturnValue(-[ASFriend as_simpleHiddenFromString](self->_friend, "as_simpleHiddenFromString"));
  v190 = (void *)v11;
  v12 = self;
  v13 = self->_dateCell;
  if (!v194->_dataIsHidden || v11 == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIDateFormattingUtilities stringWithDayNameAndShortMonthFromDate:](FIUIDateFormattingUtilities, "stringWithDayNameAndShortMonthFromDate:", v194->_snapshotDate));
    -[CHFriendDetailDateCell setText:](v13, "setText:", v15);

    v12 = v194;
  }
  else
  {
    -[CHFriendDetailDateCell setText:](v194->_dateCell, "setText:");
  }
  competitionScoreCell = v12->_competitionScoreCell;
  if (!competitionScoreCell)
  {
    v17 = -[CHFriendDetailCompetitionScoreCell initWithFrame:]([CHFriendDetailCompetitionScoreCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v18 = v12->_competitionScoreCell;
    v12->_competitionScoreCell = v17;

    competitionScoreCell = v12->_competitionScoreCell;
  }
  v19 = v12->_friend;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend currentCompetition](v19, "currentCompetition"));
  -[CHFriendDetailCompetitionScoreCell setFriend:competition:](competitionScoreCell, "setFriend:competition:", v19, v20);

  if (!v194->_competitionGraphCell)
  {
    v21 = -[CHFriendDetailCompetitionGraphCell initWithFrame:]([CHFriendDetailCompetitionGraphCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    competitionGraphCell = v194->_competitionGraphCell;
    v194->_competitionGraphCell = v21;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend currentCompetition](v194->_friend, "currentCompetition"));
  -[CHFriendDetailCompetitionGraphCell setCompetition:](v194->_competitionGraphCell, "setCompetition:", v23);

  competitionTotalWinsCell = v194->_competitionTotalWinsCell;
  if (!competitionTotalWinsCell)
  {
    v25 = -[CHFriendDetailCompetitionTotalWinsCell initWithFrame:]([CHFriendDetailCompetitionTotalWinsCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v26 = v194->_competitionTotalWinsCell;
    v194->_competitionTotalWinsCell = v25;

    competitionTotalWinsCell = v194->_competitionTotalWinsCell;
  }
  v27 = v194->_friend;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend currentCompetition](v27, "currentCompetition"));
  -[CHFriendDetailCompetitionTotalWinsCell setFriend:competition:](competitionTotalWinsCell, "setFriend:competition:", v27, v28);

  moveCell = v194->_moveCell;
  if (!moveCell)
  {
    v30 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v31 = v194->_moveCell;
    v194->_moveCell = v30;

    moveCell = v194->_moveCell;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "nonGradientTextColor"));
  -[CHFriendDetailGoalCell setKeyColor:](moveCell, "setKeyColor:", v33);

  v34 = v194->_moveCell;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("MOVE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setTitle:](v34, "setTitle:", v36);

  if (-[_HKFitnessFriendActivitySnapshot isAmm](v194->_activitySnapshot, "isAmm"))
  {
    v37 = v194->_moveCell;
    -[_HKFitnessFriendActivitySnapshot mmv](v194->_activitySnapshot, "mmv");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[_HKFitnessFriendActivitySnapshot mmg](v194->_activitySnapshot, "mmg");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[CHFriendDetailGoalCell setCurrentValue:goalValue:unitString:](v37, "setCurrentValue:goalValue:unitString:", v38, v39, v41);

    v42 = v194;
  }
  else
  {
    formattingManager = v194->_formattingManager;
    -[_HKFitnessFriendActivitySnapshot energyBurned](v194->_activitySnapshot, "energyBurned");
    -[FIUIFormattingManager energyBurnedInUserUnitForCalories:](formattingManager, "energyBurnedInUserUnitForCalories:");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v44 = v194->_formattingManager;
    -[_HKFitnessFriendActivitySnapshot energyBurnedGoal](v194->_activitySnapshot, "energyBurnedGoal");
    -[FIUIFormattingManager energyBurnedInUserUnitForCalories:](v44, "energyBurnedInUserUnitForCalories:");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortActiveEnergyUnitString](v194->_formattingManager, "localizedShortActiveEnergyUnitString"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedUppercaseString"));

    v42 = v194;
    -[CHFriendDetailGoalCell setCurrentValue:goalValue:unitString:](v194->_moveCell, "setCurrentValue:goalValue:unitString:", v38, v39, v40);
  }

  exerciseCell = v42->_exerciseCell;
  if (!exerciseCell)
  {
    v47 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v48 = v42->_exerciseCell;
    v42->_exerciseCell = v47;

    exerciseCell = v42->_exerciseCell;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "nonGradientTextColor"));
  -[CHFriendDetailGoalCell setKeyColor:](exerciseCell, "setKeyColor:", v50);

  v51 = v194->_exerciseCell;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("EXERCISE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setTitle:](v51, "setTitle:", v53);

  v54 = v194->_exerciseCell;
  -[_HKFitnessFriendActivitySnapshot briskMinutes](v194->_activitySnapshot, "briskMinutes");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[_HKFitnessFriendActivitySnapshot briskMinutesGoal](v194->_activitySnapshot, "briskMinutesGoal");
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setCurrentValue:goalValue:unitString:](v54, "setCurrentValue:goalValue:unitString:", v55, v56, v58);

  if (v194->_isMe)
    iAmWheelchairUser = v194->_iAmWheelchairUser;
  else
    iAmWheelchairUser = FIUIIsWheelchairUserForWheelchairUse(-[_HKFitnessFriendActivitySnapshot wheelchairUse](v194->_activitySnapshot, "wheelchairUse"));
  v60 = CFSTR("_WHEELCHAIR");
  if (!(_DWORD)iAmWheelchairUser)
    v60 = &stru_1007AE1D0;
  v191 = v60;
  standCell = v194->_standCell;
  if (!standCell)
  {
    v62 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v63 = v194->_standCell;
    v194->_standCell = v62;

    standCell = v194->_standCell;
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors sedentaryColors](ARUIMetricColors, "sedentaryColors"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "nonGradientTextColor"));
  -[CHFriendDetailGoalCell setKeyColor:](standCell, "setKeyColor:", v65);

  v66 = v194->_standCell;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("STAND"), "stringByAppendingString:", v191));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", v68, &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setTitle:](v66, "setTitle:", v69);

  v70 = v194->_standCell;
  -[_HKFitnessFriendActivitySnapshot activeHours](v194->_activitySnapshot, "activeHours");
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[_HKFitnessFriendActivitySnapshot activeHoursGoal](v194->_activitySnapshot, "activeHoursGoal");
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("HRS"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setCurrentValue:goalValue:unitString:](v70, "setCurrentValue:goalValue:unitString:", v71, v72, v74);

  stepCell = v194->_stepCell;
  if (!stepCell)
  {
    v76 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v77 = v194->_stepCell;
    v194->_stepCell = v76;

    stepCell = v194->_stepCell;
  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  -[CHFriendDetailGoalCell setKeyColor:](stepCell, "setKeyColor:", v78);

  v79 = v194->_stepCell;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("STEPS_LABEL"), "stringByAppendingString:", v191));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", v81, &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setTitle:](v79, "setTitle:", v82);

  v83 = v194->_stepCell;
  v84 = v194->_activitySnapshot;
  if ((_DWORD)iAmWheelchairUser)
    -[_HKFitnessFriendActivitySnapshot pushCount](v84, "pushCount");
  else
    -[_HKFitnessFriendActivitySnapshot stepCount](v84, "stepCount");
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[CHFriendDetailGoalCell setCurrentValue:](v83, "setCurrentValue:", v85);

  distanceCell = v194->_distanceCell;
  if (!distanceCell)
  {
    v87 = -[CHFriendDetailGoalCell initWithFrame:]([CHFriendDetailGoalCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v88 = v194->_distanceCell;
    v194->_distanceCell = v87;

    distanceCell = v194->_distanceCell;
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  -[CHFriendDetailGoalCell setKeyColor:](distanceCell, "setKeyColor:", v89);

  v90 = v194->_distanceCell;
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("DISTANCE_LABEL"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHFriendDetailGoalCell setTitle:](v90, "setTitle:", v92);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](v194->_formattingManager, "unitManager"));
  -[_HKFitnessFriendActivitySnapshot walkingAndRunningDistance](v194->_activitySnapshot, "walkingAndRunningDistance");
  objc_msgSend(v93, "distanceInUserDistanceUnitForDistanceInMeters:distanceType:", 1);
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceType:](v194->_formattingManager, "localizedShortUnitStringForDistanceType:", 1));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "localizedUppercaseString"));

  -[CHFriendDetailGoalCell setCurrentValue:unitString:](v194->_distanceCell, "setCurrentValue:unitString:", v189, v188);
  -[CHFriendDetailGoalCell setHidden:](v194->_distanceCell, "setHidden:", iAmWheelchairUser);
  v95 = v194;
  v96 = v194->_todaysFriendWorkouts;
  v97 = v96;
  if (v194->_isMe)
  {
    v204 = 0u;
    v205 = 0u;
    v203 = 0u;
    v202 = 0u;
    v98 = v96;
    v99 = -[NSArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v202, v220, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v203;
      do
      {
        for (i = 0; i != v99; i = (char *)i + 1)
        {
          if (*(_QWORD *)v203 != v100)
            objc_enumerationMutation(v98);
          v102 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * (_QWORD)i);
          workoutDataProvider = v194->_workoutDataProvider;
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "UUID"));
          objc_msgSend(v102, "setIsWatchWorkout:", -[CHWorkoutDataProvider isWatchWorkout:](workoutDataProvider, "isWatchWorkout:", v104));

        }
        v99 = -[NSArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v202, v220, 16);
      }
      while (v99);
    }

    v95 = v194;
  }
  objc_initWeak(&location, v95);
  v105 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v97, "count"));
  workoutCellsArray = v194->_workoutCellsArray;
  v194->_workoutCellsArray = v105;

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  obj = v97;
  v107 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v197, v219, 16);
  if (v107)
  {
    v108 = *(_QWORD *)v198;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    do
    {
      for (j = 0; j != v107; j = (char *)j + 1)
      {
        if (*(_QWORD *)v198 != v108)
          objc_enumerationMutation(obj);
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v197 + 1) + 8 * (_QWORD)j), "hkWorkoutFromFriendWorkout"));
        v114 = -[CHWorkoutCellImageLabelView initWithFrame:]([CHWorkoutCellImageLabelView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
        fitnessAppContext = v194->_fitnessAppContext;
        workoutFormattingManager = v194->_workoutFormattingManager;
        v195[0] = _NSConcreteStackBlock;
        v195[1] = 3221225472;
        v195[2] = sub_1000C7A58;
        v195[3] = &unk_100777C80;
        objc_copyWeak(&v196, &location);
        -[CHWorkoutCellImageLabelView setWorkout:fitnessAppContext:formattingManager:achievementCount:completion:](v114, "setWorkout:fitnessAppContext:formattingManager:achievementCount:completion:", v113, fitnessAppContext, workoutFormattingManager, 0, v195);
        -[CHWorkoutCellImageLabelView setShowsSeparator:](v114, "setShowsSeparator:", 1);
        -[NSMutableArray addObject:](v194->_workoutCellsArray, "addObject:", v114);
        objc_destroyWeak(&v196);

      }
      v107 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v197, v219, 16);
    }
    while (v107);
  }

  v117 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v194->_workoutCellsArray, "lastObject"));
  objc_msgSend(v117, "setShowsSeparator:", 0);

  v118 = [CHHorizontalScrollingAchievementsView alloc];
  v119 = CGRectZero.origin.y;
  v120 = CGRectZero.size.width;
  v121 = CGRectZero.size.height;
  v122 = -[CHHorizontalScrollingAchievementsView initWithFrame:badgeImageFactory:locProvider:](v118, "initWithFrame:badgeImageFactory:locProvider:", v194->_imageFactory, v194->_achievementLocProvider, CGRectZero.origin.x, v119, v120, v121);
  achievementsCell = v194->_achievementsCell;
  v194->_achievementsCell = v122;

  -[CHHorizontalScrollingAchievementsView setDelegate:](v194->_achievementsCell, "setDelegate:", v194);
  -[CHHorizontalScrollingAchievementsView setScrollViewContentInset:](v194->_achievementsCell, "setScrollViewContentInset:", 0.0, 16.0, 0.0, 16.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v194->_todaysAchievements, "allObjects"));
  -[CHHorizontalScrollingAchievementsView setAchievements:](v194->_achievementsCell, "setAchievements:", v124);

  v125 = v194;
  v126 = objc_alloc_init((Class)NSMutableAttributedString);
  if (v194->_sharingInfoText)
  {
    v127 = objc_alloc((Class)NSAttributedString);
    sharingInfoText = v194->_sharingInfoText;
    v217[0] = NSFontAttributeName;
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
    v218[0] = v129;
    v217[1] = NSForegroundColorAttributeName;
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v218[1] = v130;
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v218, v217, 2));
    v132 = objc_msgSend(v127, "initWithString:attributes:", sharingInfoText, v131);
    objc_msgSend(v126, "appendAttributedString:", v132);

    v125 = v194;
  }
  if ((-[ASFriend hasPendingCompetitionRequestFromMe](v125->_friend, "hasPendingCompetitionRequestFromMe") & 1) != 0|| -[ASFriend isCompetitionActive](v125->_friend, "isCompetitionActive"))
  {
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionStatusBreadcrumbStringForExperienceType:](v125->_friend, "as_competitionStatusBreadcrumbStringForExperienceType:", v125->_experienceType));
    v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v133));
    v135 = objc_alloc((Class)NSAttributedString);
    v215[0] = NSFontAttributeName;
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
    v216[0] = v136;
    v215[1] = NSForegroundColorAttributeName;
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor as_darkCompetitionGold](UIColor, "as_darkCompetitionGold"));
    v216[1] = v137;
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v216, v215, 2));
    v139 = objc_msgSend(v135, "initWithString:attributes:", v134, v138);
    objc_msgSend(v126, "appendAttributedString:", v139);

    v125 = v194;
  }
  v140 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v119, v120, v121);
  p_sharingInfoSizingLabel = (id *)&v125->_sharingInfoSizingLabel;
  v142 = *p_sharingInfoSizingLabel;
  *p_sharingInfoSizingLabel = v140;

  objc_msgSend(*p_sharingInfoSizingLabel, "setAttributedText:", v126);
  p_isa = (id *)&v194->super.super.super.isa;
  -[UILabel setNumberOfLines:](v194->_sharingInfoSizingLabel, "setNumberOfLines:", 0);
  v144 = objc_alloc_init((Class)NSMutableArray);
  v145 = objc_alloc_init((Class)NSMutableArray);
  if (-[CHFriendDetailCollectionViewController _shouldShowCompetitionRequestAction](v194, "_shouldShowCompetitionRequestAction"))
  {
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_ACTION_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](v194->_friend, "displayName"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v147, v148));

    objc_msgSend(v144, "addObject:", &off_1007B3E00);
    objc_msgSend(v145, "addObject:", v149);
  }
  else if (-[CHFriendDetailCollectionViewController _shouldShowCompetitionAcceptAction](v194, "_shouldShowCompetitionAcceptAction"))
  {
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "localizedStringForKey:value:table:", CFSTR("COMPETITION_ACCEPT_ACTION_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));

    objc_msgSend(v144, "addObject:", &off_1007B3E18);
    objc_msgSend(v145, "addObject:", v149);
  }
  else
  {
    if (!-[CHFriendDetailCollectionViewController _shouldShowCompetitionRulesAction](v194, "_shouldShowCompetitionRulesAction"))goto LABEL_74;
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionLearnMoreDetailActionForExperienceType:](v194->_friend, "as_competitionLearnMoreDetailActionForExperienceType:", v194->_experienceType));
    objc_msgSend(v144, "addObject:", &off_1007B3E30);
    objc_msgSend(v145, "addObject:", v149);
  }

  p_isa = (id *)&v194->super.super.super.isa;
LABEL_74:
  if (objc_msgSend(p_isa, "_shouldShowMuteAction"))
  {
    if (objc_msgSend(p_isa[4], "isMuted"))
    {
      v151 = ((uint64_t (*)(void))ActivitySharingBundle)();
      v152 = (void *)objc_claimAutoreleasedReturnValue(v151);
      v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "localizedStringForKey:value:table:", CFSTR("UNMUTE_NOTIFICATIONS"), &stru_1007AE1D0, CFSTR("Localizable")));
    }
    else
    {
      v154 = ((uint64_t (*)(void))ActivitySharingBundle)();
      v152 = (void *)objc_claimAutoreleasedReturnValue(v154);
      v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "localizedStringForKey:value:table:", CFSTR("MUTE_NOTIFICATIONS"), &stru_1007AE1D0, CFSTR("Localizable")));
    }
    v155 = (void *)v153;

    objc_msgSend(v144, "addObject:", &off_1007B3E48);
    objc_msgSend(v145, "addObject:", v155);

    p_isa = (id *)&v194->super.super.super.isa;
  }
  if (objc_msgSend(p_isa[4], "canSeeMyActivityData"))
  {
    v156 = ((uint64_t (*)(void))ActivitySharingBundle)();
    v157 = (void *)objc_claimAutoreleasedReturnValue(v156);
    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_ACTIVITY"), &stru_1007AE1D0, CFSTR("Localizable")));
  }
  else
  {
    v158 = ((uint64_t (*)(void))ActivitySharingBundle)();
    v157 = (void *)objc_claimAutoreleasedReturnValue(v158);
    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "localizedStringForKey:value:table:", CFSTR("SHOW_MY_ACTIVITY"), &stru_1007AE1D0, CFSTR("Localizable")));
  }

  objc_msgSend(v144, "addObject:", &off_1007B3E60);
  v159 = ActivitySharingBundle(objc_msgSend(v145, "addObject:", v192));
  v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "localizedStringForKey:value:table:", CFSTR("REMOVE_FRIEND"), &stru_1007AE1D0, CFSTR("Localizable")));

  objc_msgSend(v144, "addObject:", &off_1007B3E78);
  objc_msgSend(v145, "addObject:", v187);
  v161 = -[CHFriendDetailActionListView initWithFrame:]([CHFriendDetailActionListView alloc], "initWithFrame:", CGRectZero.origin.x, v119, v120, v121);
  actionListCell = v194->_actionListCell;
  v194->_actionListCell = v161;

  -[CHFriendDetailActionListView setDelegate:](v194->_actionListCell, "setDelegate:", v194);
  -[CHFriendDetailActionListView configureWithActionTypes:labelTexts:footerText:](v194->_actionListCell, "configureWithActionTypes:labelTexts:footerText:", v144, v145, v126);
  v163 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
  itemsArray = v194->_itemsArray;
  v194->_itemsArray = v163;

  v165 = v194->_itemsArray;
  v166 = v194->_dateCell;
  v214[0] = v194->_threeRingCell;
  v214[1] = v166;
  v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v214, 2));
  -[NSMutableArray addObject:](v165, "addObject:", v167);

  v168 = v194->_itemsArray;
  v213 = v194->_competitionScoreCell;
  v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v213, 1));
  -[NSMutableArray addObject:](v168, "addObject:", v169);

  v170 = v194->_itemsArray;
  v212 = v194->_competitionGraphCell;
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v212, 1));
  -[NSMutableArray addObject:](v170, "addObject:", v171);

  v172 = v194->_itemsArray;
  v211 = v194->_competitionTotalWinsCell;
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v211, 1));
  -[NSMutableArray addObject:](v172, "addObject:", v173);

  v174 = v194->_itemsArray;
  v210 = v194->_moveCell;
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v210, 1));
  -[NSMutableArray addObject:](v174, "addObject:", v175);

  v176 = v194->_itemsArray;
  v177 = v194->_standCell;
  v209[0] = v194->_exerciseCell;
  v209[1] = v177;
  v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v209, 2));
  -[NSMutableArray addObject:](v176, "addObject:", v178);

  v179 = v194->_itemsArray;
  v180 = v194->_distanceCell;
  v208[0] = v194->_stepCell;
  v208[1] = v180;
  v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v208, 2));
  -[NSMutableArray addObject:](v179, "addObject:", v181);

  -[NSMutableArray addObject:](v194->_itemsArray, "addObject:", v194->_workoutCellsArray);
  v182 = v194->_itemsArray;
  v207 = v194->_achievementsCell;
  v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v207, 1));
  -[NSMutableArray addObject:](v182, "addObject:", v183);

  v184 = v194->_itemsArray;
  v206 = v194->_actionListCell;
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v206, 1));
  -[NSMutableArray addObject:](v184, "addObject:", v185);

  objc_destroyWeak(&location);
}

- (void)_setupNumberOfItemsInSection
{
  NSMutableArray *v3;
  NSMutableArray *numItemsInSectionArray;
  unsigned int v5;
  NSMutableArray *v6;
  void *v7;
  unsigned int v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  _BOOL8 v22;
  NSMutableArray *v23;
  void *v24;
  _BOOL8 v25;
  NSMutableArray *v26;
  id v27;

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
  numItemsInSectionArray = self->_numItemsInSectionArray;
  self->_numItemsInSectionArray = v3;

  -[NSMutableArray addObject:](self->_numItemsInSectionArray, "addObject:", &off_1007B3E90);
  v5 = -[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive");
  v6 = self->_numItemsInSectionArray;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
  -[NSMutableArray addObject:](v6, "addObject:", v7);

  v8 = -[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive");
  v9 = self->_numItemsInSectionArray;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  -[NSMutableArray addObject:](v9, "addObject:", v10);

  if ((-[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive") & 1) != 0)
    v11 = 1;
  else
    v11 = -[ASFriend hasCompetitionHistory](self->_friend, "hasCompetitionHistory");
  v12 = self->_numItemsInSectionArray;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  -[NSMutableArray addObject:](v12, "addObject:", v13);

  -[NSMutableArray addObject:](self->_numItemsInSectionArray, "addObject:", &off_1007B3EA8);
  if (-[CHFriendDetailCollectionViewController _shouldShowExerciseAndStandCells](self, "_shouldShowExerciseAndStandCells"))
  {
    v14 = 2;
  }
  else
  {
    v14 = 0;
  }
  v15 = self->_numItemsInSectionArray;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
  -[NSMutableArray addObject:](v15, "addObject:", v16);

  if (-[CHFriendDetailCollectionViewController _shouldShowStepsAndDistanceCells](self, "_shouldShowStepsAndDistanceCells"))
  {
    v17 = 2;
  }
  else
  {
    v17 = 0;
  }
  v18 = self->_numItemsInSectionArray;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
  -[NSMutableArray addObject:](v18, "addObject:", v19);

  v20 = self->_numItemsInSectionArray;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_todaysFriendWorkouts, "count")));
  -[NSMutableArray addObject:](v20, "addObject:", v21);

  v22 = -[NSSet count](self->_todaysAchievements, "count") != 0;
  v23 = self->_numItemsInSectionArray;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v22));
  -[NSMutableArray addObject:](v23, "addObject:", v24);

  v25 = !self->_isMe;
  v26 = self->_numItemsInSectionArray;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v25));
  -[NSMutableArray addObject:](v26, "addObject:", v27);

}

- (void)_setupCellSizes
{
  NSMutableArray *v3;
  NSMutableArray *sizesArray;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  NSMutableArray *v17;
  void *v18;
  double v19;
  uint64_t v20;
  NSMutableArray *v21;
  void *v22;
  double v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  double v27;
  uint64_t v28;
  NSMutableArray *v29;
  void *v30;
  double v31;
  uint64_t v32;
  NSMutableArray *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  NSMutableArray *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  NSMutableArray *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  NSMutableArray *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  NSMutableArray *v79;
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
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  void *v96;
  _BYTE v97[128];
  _QWORD v98[2];
  _QWORD v99[2];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[2];

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
  sizesArray = self->_sizesArray;
  self->_sizesArray = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController view](self, "view"));
  v9 = UIFloorToViewScale((v7 - (16.0 + 16.0)) * 0.5);

  -[CHFriendDetailThreeRingCell preferredWidth](self->_threeRingCell, "preferredWidth");
  v11 = v10;
  -[CHFriendDetailThreeRingCell preferredHeight](self->_threeRingCell, "preferredHeight");
  v13 = v12;
  v14 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v11, v12));
  -[CHFriendDetailThreeRingCell preferredWidth](self->_threeRingCell, "preferredWidth");
  v16 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7 - v15, v13));
  v17 = self->_sizesArray;
  v89 = (void *)v16;
  v90 = (void *)v14;
  v104[0] = v14;
  v104[1] = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 2));
  -[NSMutableArray addObject:](v17, "addObject:", v18);

  -[CHFriendDetailCompetitionScoreCell preferredHeightForFriend:](self->_competitionScoreCell, "preferredHeightForFriend:", self->_friend);
  v20 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", v7 - (16.0 + 16.0), v19));
  v21 = self->_sizesArray;
  v88 = (void *)v20;
  v103 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));
  -[NSMutableArray addObject:](v21, "addObject:", v22);

  -[CHFriendDetailCompetitionGraphCell preferredHeight](self->_competitionGraphCell, "preferredHeight");
  v24 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", v7 - (16.0 + 16.0), v23));
  v25 = self->_sizesArray;
  v87 = (void *)v24;
  v102 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v102, 1));
  -[NSMutableArray addObject:](v25, "addObject:", v26);

  -[CHFriendDetailCompetitionTotalWinsCell preferredHeightForFriend:](self->_competitionTotalWinsCell, "preferredHeightForFriend:", self->_friend);
  v28 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", v7 - (16.0 + 16.0), v27));
  v29 = self->_sizesArray;
  v86 = (void *)v28;
  v101 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v101, 1));
  -[NSMutableArray addObject:](v29, "addObject:", v30);

  +[CHFriendDetailGoalCell preferredHeight](CHFriendDetailGoalCell, "preferredHeight");
  v32 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7 - (16.0 + 16.0), v31));
  v33 = self->_sizesArray;
  v85 = (void *)v32;
  v100 = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
  -[NSMutableArray addObject:](v33, "addObject:", v34);

  -[CHFriendDetailCollectionViewController _sizeForGoalCell:withPreferredWidth:availableWidth:](self, "_sizeForGoalCell:withPreferredWidth:availableWidth:", self->_exerciseCell, v9, v7 - (16.0 + 16.0));
  v36 = v35;
  v38 = v37;
  v39 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
  v40 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v36, v38));
  v41 = self->_sizesArray;
  v83 = (void *)v40;
  v84 = (void *)v39;
  v99[0] = v39;
  v99[1] = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 2));
  -[NSMutableArray addObject:](v41, "addObject:", v42);

  -[CHFriendDetailCollectionViewController _sizeForGoalCell:withPreferredWidth:availableWidth:](self, "_sizeForGoalCell:withPreferredWidth:availableWidth:", self->_stepCell, v9, v7 - (16.0 + 16.0));
  v44 = v43;
  v46 = v45;
  -[CHFriendDetailCollectionViewController _sizeForGoalCell:withPreferredWidth:availableWidth:](self, "_sizeForGoalCell:withPreferredWidth:availableWidth:", self->_distanceCell, v9, v7 - (16.0 + 16.0));
  v48 = v47;
  v50 = v49;
  v51 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v44, v46));
  v52 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v48, v50));
  v53 = self->_sizesArray;
  v81 = (void *)v52;
  v82 = (void *)v51;
  v98[0] = v51;
  v98[1] = v52;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 2));
  -[NSMutableArray addObject:](v53, "addObject:", v54);

  v55 = -[NSMutableArray copy](self->_workoutCellsArray, "copy");
  v56 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v55, "count"));
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v57 = v55;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v92;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v92 != v60)
          objc_enumerationMutation(v57);
        objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v61), "preferredHeightForWidth:", v7 - (16.0 + 16.0));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7 - (16.0 + 16.0), v62));
        objc_msgSend(v56, "addObject:", v63);

        v61 = (char *)v61 + 1;
      }
      while (v59 != v61);
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    }
    while (v59);
  }

  -[NSMutableArray addObject:](self->_sizesArray, "addObject:", v56);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, 70.0));
  v65 = self->_sizesArray;
  v96 = v64;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
  -[NSMutableArray addObject:](v65, "addObject:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_sharingInfoSizingLabel, "text"));
  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController view](self, "view"));
    objc_msgSend(v68, "valueForSmallWidth:mediumWidth:largeWidth:", 32.0, 40.0, 40.0);
    v70 = v69;

    -[UILabel sizeThatFits:](self->_sharingInfoSizingLabel, "sizeThatFits:", v7 - v70 * 2.0, 1.79769313e308);
    v72 = v71;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_sharingInfoSizingLabel, "font"));
    objc_msgSend(v73, "_scaledValueForValue:", 12.0);
    v75 = v74;

    v76 = v72 + v75 * 2.0;
  }
  else
  {
    v76 = 0.0;
  }
  +[CHFriendDetailActionCell preferredCellHeight](CHFriendDetailActionCell, "preferredCellHeight");
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v76+ v77 * (double)-[CHFriendDetailActionListView actionCount](self->_actionListCell, "actionCount")+ 35.0));
  v79 = self->_sizesArray;
  v95 = v78;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
  -[NSMutableArray addObject:](v79, "addObject:", v80);

}

- (CGSize)_sizeForGoalCell:(id)a3 withPreferredWidth:(double)a4 availableWidth:(double)a5
{
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v7 = a3;
  objc_msgSend(v7, "sizeThatFits:", a5, 1.79769313e308);
  if (v9 <= a4)
    a5 = a4;
  objc_opt_class(v7, v8);
  v11 = v10;

  objc_msgSend(v11, "preferredHeight");
  v13 = v12;
  v14 = a5;
  result.height = v13;
  result.width = v14;
  return result;
}

- (id)_fontForSectionHeaderType:(int64_t)a3
{
  void *v3;
  void *v6;
  void *v7;

  if ((unint64_t)(a3 - 2) < 9 || a3 == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  }
  else if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 0x8000));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  }
  return v3;
}

- (void)_reloadData
{
  -[CHFriendDetailCollectionViewController _setupNumberOfItemsInSection](self, "_setupNumberOfItemsInSection");
  -[CHFriendDetailCollectionViewController _setupCells](self, "_setupCells");
  -[CHFriendDetailCollectionViewController _setupCellSizes](self, "_setupCellSizes");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)_infoButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  UINavigationController *v17;
  UINavigationController *contactNavigationController;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend contact](self->_friend, "contact", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "linkedContactStoreIdentifier"));

  if (v5)
  {
    v6 = objc_alloc_init((Class)CNContactStore);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend contact](self->_friend, "contact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "linkedContactStoreIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys", CNContactEmailAddressesKey, CNContactPhoneNumbersKey));
    v21[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v10, 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v11));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend contact](self->_friend, "contact"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primaryDestinationForMessaging"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:emailOrPhoneNumber:](CNContact, "contactWithDisplayName:emailOrPhoneNumber:", 0, v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v14));

  }
  objc_msgSend(v12, "setDelegate:", self);
  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_dismissContactInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
  objc_msgSend(v16, "setLeftBarButtonItem:", v15);

  v17 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v12);
  contactNavigationController = self->_contactNavigationController;
  self->_contactNavigationController = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_contactNavigationController, "view"));
  objc_msgSend(v20, "setTintColor:", v19);

  -[CHFriendDetailCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_contactNavigationController, 1, 0);
}

- (void)_dismissContactInfo
{
  -[UINavigationController dismissViewControllerAnimated:completion:](self->_contactNavigationController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_sendMessageButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  void *v9;

  ASLoggingInitialize(self);
  v4 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Send Message tapped on the phone. Launching to messages app.", v8, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend contact](self->_friend, "contact"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryDestinationForMessaging"));

  if (v6)
  {
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    ASLaunchToMessagesWithRecipients();

  }
}

- (void)_showShareOptions:(id)a3
{
  void *v4;
  id v5;
  UIImage *v6;
  id v7;
  NSString *v8;
  UIImage *sharingImage;
  UIImage *v10;
  NSString *sharingText;
  NSString *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HKFitnessFriendActivitySnapshot activitySummary](self->_activitySnapshot, "activitySummary", a3));
  v5 = sub_10005F930(v4, self->_snapshotDate, self->_iAmWheelchairUser);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue(v5);

  v7 = sub_10005FBF8(self->_snapshotDate);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  sharingImage = self->_sharingImage;
  self->_sharingImage = v6;
  v10 = v6;

  sharingText = self->_sharingText;
  self->_sharingText = v8;
  v12 = v8;

  v13 = objc_alloc((Class)UIActivityViewController);
  v18[0] = v10;
  v18[1] = v12;
  v18[2] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));

  v15 = objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v14, 0);
  v16 = sub_10005FD28();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v15, "setExcludedActivityTypes:", v17);

  -[CHFriendDetailCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
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
  id v5;
  NSData *v6;
  void *v7;
  id v8;

  if (self->_sharingImage && self->_sharingText)
  {
    v4 = objc_alloc_init((Class)LPLinkMetadata);
    objc_msgSend(v4, "setSummary:", self->_sharingText);
    v5 = objc_alloc((Class)LPImage);
    v6 = UIImagePNGRepresentation(self->_sharingImage);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v5, "initWithData:MIMEType:", v7, CFSTR("image/png"));
    objc_msgSend(v4, "setImage:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  _HKFitnessFriendActivitySnapshot *activitySnapshot;
  _BOOL4 dataIsHidden;
  void *v8;
  id v9;
  BOOL v10;

  activitySnapshot = self->_activitySnapshot;
  dataIsHidden = self->_dataIsHidden;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_numItemsInSectionArray, "objectAtIndexedSubscript:", a4));
  v9 = objc_msgSend(v8, "integerValue");

  v10 = dataIsHidden || activitySnapshot == 0;
  if (v10
    && !-[CHFriendDetailCollectionViewController _shouldShowWhileDataIsHiddenForSection:](self, "_shouldShowWhileDataIsHiddenForSection:", a4))
  {
    return 0;
  }
  return (int64_t)v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13), "removeFromSuperview");
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_itemsArray, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  objc_msgSend(v7, "bounds");
  objc_msgSend(v15, "setFrame:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
  objc_msgSend(v16, "addSubview:", v15);

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double MaxY;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double Height;
  double v41;
  void *v42;
  double v43;
  CGFloat v44;
  void *v45;
  void *v46;
  void *v47;
  CHFriendDetailCollectionViewController *v48;
  uint64_t v49;
  id v50;
  CGFloat v51;
  void *v52;
  _BOOL4 v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  CGFloat v68;
  void *v69;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(a4, "isEqualToString:", UICollectionElementKindSectionHeader))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionFooter, CFSTR("Footer"), v9));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subviews", 0));
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v72 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v30);
    }

    v33 = -[CHFriendDetailCollectionViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, 8);
    v34 = -[CHFriendDetailCollectionViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, 7);
    if (objc_msgSend(v9, "section") == (id)8
      || v33 <= 0 && (objc_msgSend(v9, "section") == (id)7 || v34 <= 0 && objc_msgSend(v9, "section") == (id)6)
      || objc_msgSend(v9, "section") == (id)9)
    {
      v35 = 0.0;
    }
    else
    {
      v35 = 16.0;
    }
    v50 = objc_alloc((Class)UIView);
    objc_msgSend(v10, "bounds");
    v51 = CGRectGetWidth(v89) - v35;
    objc_msgSend(v10, "bounds");
    v17 = objc_msgSend(v50, "initWithFrame:", v35, 0.0, v51, CGRectGetHeight(v90));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    objc_msgSend(v17, "setBackgroundColor:", v52);

    v53 = v34 > 0 && v33 < 1;
    v54 = v34 > 0 || v33 > 0;
    if ((v33 < 1 || objc_msgSend(v9, "section") != (id)8)
      && (!v53 || objc_msgSend(v9, "section") != (id)7)
      && (v54 || objc_msgSend(v9, "section") != (id)6)
      && objc_msgSend(v9, "section") != (id)9
      && (objc_msgSend(v9, "section") != (id)1
       || (-[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive") & 1) == 0))
    {
      objc_msgSend(v10, "addSubview:", v17);
    }
    goto LABEL_58;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, CFSTR("Header"), v9));
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subviews"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v76 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j), "removeFromSuperview");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v9, "section") == (id)7)
  {
    v17 = objc_alloc_init((Class)UILabel);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("WORKOUTS"), &stru_1007AE1D0, CFSTR("Localizable")));
    objc_msgSend(v17, "setText:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v17, "setTextColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _fontForSectionHeaderType:](self, "_fontForSectionHeaderType:", 7));
    objc_msgSend(v17, "setFont:", v21);

    objc_msgSend(v17, "sizeToFit");
    objc_msgSend(v10, "bounds");
    MaxY = CGRectGetMaxY(v81);
    objc_msgSend(v17, "bounds");
    v23 = MaxY - CGRectGetHeight(v82);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
    objc_msgSend(v24, "descender");
    v26 = v23 - v25;
    objc_msgSend(v8, "bounds");
    v27 = CGRectGetWidth(v83) - 16.0 - 16.0;
    objc_msgSend(v17, "bounds");
    objc_msgSend(v17, "setFrame:", 16.0, v26, v27, CGRectGetHeight(v84));

LABEL_57:
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
    objc_msgSend(v69, "addSubview:", v17);

LABEL_58:
    goto LABEL_59;
  }
  if (objc_msgSend(v9, "section") == (id)8)
  {
    v17 = objc_alloc_init((Class)UILabel);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("AWARDS"), &stru_1007AE1D0, CFSTR("Localizable")));
    objc_msgSend(v17, "setText:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(v17, "setTextColor:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _fontForSectionHeaderType:](self, "_fontForSectionHeaderType:", 8));
    objc_msgSend(v17, "setFont:", v39);

    objc_msgSend(v17, "sizeToFit");
    objc_msgSend(v10, "bounds");
    Height = CGRectGetHeight(v85);
    objc_msgSend(v17, "bounds");
    v41 = (Height - CGRectGetHeight(v86)) * 0.5;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController view](self, "view"));
    v43 = UIRoundToViewScale(v42, v41);

    objc_msgSend(v8, "bounds");
    v44 = CGRectGetWidth(v87) - 16.0 - 16.0;
    objc_msgSend(v17, "bounds");
    objc_msgSend(v17, "setFrame:", 16.0, v43, v44, CGRectGetHeight(v88));
    goto LABEL_57;
  }
  if (objc_msgSend(v9, "section") == (id)4)
  {
    if ((-[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive") & 1) != 0
      || -[ASFriend hasCompetitionHistory](self->_friend, "hasCompetitionHistory"))
    {
      v17 = objc_alloc_init((Class)UILabel);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("FRIEND_DETAIL_ACTIVITY_HEADER"), &stru_1007AE1D0, CFSTR("Localizable")));
      objc_msgSend(v17, "setText:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v17, "setTextColor:", v47);

      v48 = self;
      v49 = 4;
LABEL_56:
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _fontForSectionHeaderType:](v48, "_fontForSectionHeaderType:", v49));
      objc_msgSend(v17, "setFont:", v64);

      objc_msgSend(v17, "sizeToFit");
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
      objc_msgSend(v65, "_scaledValueForValue:", 30.0);
      v67 = v66;

      objc_msgSend(v8, "bounds");
      v68 = CGRectGetWidth(v91) + 16.0 * -2.0;
      objc_msgSend(v17, "bounds");
      objc_msgSend(v17, "setFrame:", 16.0, 0.0, v68, CGRectGetHeight(v92));
      objc_msgSend(v17, "_setFirstLineBaselineFrameOriginY:", v67);
      goto LABEL_57;
    }
  }
  else
  {
    if (objc_msgSend(v9, "section") == (id)1)
    {
      v17 = objc_alloc_init((Class)UILabel);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SCORE_HEADER"), &stru_1007AE1D0, CFSTR("Localizable")));
      objc_msgSend(v17, "setText:", v56);

      v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v17, "setTextColor:", v57);

      v48 = self;
      v49 = 1;
      goto LABEL_56;
    }
    if (objc_msgSend(v9, "section") == (id)3)
    {
      v17 = objc_alloc_init((Class)UILabel);
      v58 = -[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive");
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v60 = v59;
      if (v58)
        v61 = CFSTR("COMPETITION_TOTAL_WINS_HEADER_ACTIVE");
      else
        v61 = CFSTR("COMPETITION_TOTAL_WINS_HEADER_INACTIVE");
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", v61, &stru_1007AE1D0, CFSTR("Localizable")));
      objc_msgSend(v17, "setText:", v62);

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v17, "setTextColor:", v63);

      v48 = self;
      v49 = 3;
      goto LABEL_56;
    }
  }
LABEL_59:

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == (id)7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a4;
  v5 = objc_msgSend(v11, "section") == (id)7;
  v6 = v11;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_todaysFriendWorkouts, "objectAtIndexedSubscript:", objc_msgSend(v11, "row")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hkWorkoutFromFriendWorkout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](self->_fitnessAppContext, "seymourCatalogItemDataProvider"));
    v10 = objc_msgSend(v9, "isSeymourWorkout:", v8);

    if (v10)
      -[CHFitnessAppContext navigateToWorkout:](self->_fitnessAppContext, "navigateToWorkout:", v8);

    v6 = v11;
  }

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  CGFloat left;
  CGFloat top;
  CGFloat bottom;
  CGFloat right;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    if (self->_dataIsHidden)
    {
LABEL_7:
      bottom = 30.0;
      top = 0.0;
      left = 0.0;
      right = 0.0;
      goto LABEL_9;
    }
LABEL_8:
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    goto LABEL_9;
  }
  if (a5 == 9)
    goto LABEL_8;
  if (a5 == 8 && -[NSSet count](self->_todaysAchievements, "count"))
    goto LABEL_7;
  left = 16.0;
  top = 0.0;
  bottom = 0.0;
  right = 16.0;
LABEL_9:

  v14 = top;
  v15 = left;
  v16 = bottom;
  v17 = right;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  NSMutableArray *sizesArray;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  sizesArray = self->_sizesArray;
  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](sizesArray, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  v8 = objc_msgSend(v6, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  objc_msgSend(v9, "CGSizeValue");
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  void *v8;
  CGFloat height;
  double v10;
  double v11;
  CGFloat width;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _fontForSectionHeaderType:](self, "_fontForSectionHeaderType:", a5));
  if (!self->_dataIsHidden
    || (height = 0.0,
        -[CHFriendDetailCollectionViewController _shouldShowWhileDataIsHiddenForSection:](self, "_shouldShowWhileDataIsHiddenForSection:", a5)))
  {
    v10 = 24.0;
    switch(a5)
    {
      case 1:
        v10 = 30.0;
        if ((-[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive") & 1) != 0)
          goto LABEL_13;
        goto LABEL_15;
      case 3:
        v10 = 30.0;
        if ((-[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive") & 1) == 0
          && (-[ASFriend hasCompetitionHistory](self->_friend, "hasCompetitionHistory") & 1) == 0)
        {
          goto LABEL_15;
        }
        goto LABEL_13;
      case 4:
        goto LABEL_13;
      case 7:
        v10 = 28.0;
        if (!-[NSArray count](self->_todaysFriendWorkouts, "count"))
          goto LABEL_15;
        goto LABEL_13;
      case 8:
        if (!-[NSSet count](self->_todaysAchievements, "count"))
          goto LABEL_15;
        v10 = 44.0;
LABEL_13:
        objc_msgSend(v8, "_scaledValueForValue:", v10);
        height = v11;
        break;
      default:
LABEL_15:
        width = CGSizeZero.width;
        height = CGSizeZero.height;
        goto LABEL_16;
    }
  }
  objc_msgSend(v7, "bounds");
  width = CGRectGetWidth(v16);
LABEL_16:

  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v6;
  int64_t v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat width;
  CGFloat *p_height;
  CGFloat v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  v6 = a3;
  v7 = a5 + 1;
  do
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "numberOfSections");
    if (v8 >= (uint64_t)v9)
      break;
    v10 = (uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", v8);
    v7 = v8 + 1;
  }
  while (v10 < 1);
  if (a5 == 2
    || (v11 = (uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", a5), v8 >= (uint64_t)v9)
    || a5 < 1
    || v11 < 1)
  {
    p_height = &CGSizeZero.height;
    width = CGSizeZero.width;
  }
  else
  {
    objc_msgSend(v6, "bounds");
    width = CGRectGetWidth(v18);
    if (qword_10083E128 != -1)
      dispatch_once(&qword_10083E128, &stru_10077A510);
    p_height = (CGFloat *)&qword_10083E120;
  }
  v14 = *p_height;

  v15 = width;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)_workoutsForFriend:(id)a3 snapshot:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "friendWorkouts"));
  v7 = objc_msgSend(v5, "snapshotIndex");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", &stru_10077A400));

  return v11;
}

- (void)_friendDataWasUpdated:(id)a3
{
  ASFriend *v4;
  ASFriend *v5;
  ASFriend *v6;
  ASFriend *v7;
  NSString *v8;
  NSString *sharingInfoText;
  void *v10;
  void *v11;
  void *v12;
  ASFriend *v13;
  void *v14;
  _HKFitnessFriendActivitySnapshot *v15;
  _HKFitnessFriendActivitySnapshot *activitySnapshot;
  NSArray *v17;
  NSArray *todaysFriendWorkouts;
  void *v19;
  id v20;
  NSSet *todaysAchievements;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSSet *v27;
  NSSet *v28;
  id v29;
  id v30;
  _QWORD v31[5];

  v29 = a3;
  if (self->_isMe)
  {
    v4 = (ASFriend *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager me](self->_friendListManager, "me", v29));
    v5 = self->_friend;
    self->_friend = v4;
  }
  else
  {
    v5 = (ASFriend *)objc_claimAutoreleasedReturnValue(-[ASFriend UUID](self->_friend, "UUID", v29));
    v6 = (ASFriend *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager friendWithUUID:](self->_friendListManager, "friendWithUUID:", v5));
    v7 = self->_friend;
    self->_friend = v6;

    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[ASFriend as_detailedSharingDurationString](self->_friend, "as_detailedSharingDurationString"));
    sharingInfoText = self->_sharingInfoText;
    self->_sharingInfoText = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v11, "setTitle:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
    -[CHFriendDetailCollectionViewController setTitle:](self, "setTitle:", v12);

  }
  v13 = self->_friend;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[_HKFitnessFriendActivitySnapshot snapshotIndex](self->_activitySnapshot, "snapshotIndex")));
  v15 = (_HKFitnessFriendActivitySnapshot *)objc_claimAutoreleasedReturnValue(-[ASFriend snapshotWithGoalsCarriedForwardForSnapshotIndex:](v13, "snapshotWithGoalsCarriedForwardForSnapshotIndex:", v14));
  activitySnapshot = self->_activitySnapshot;
  self->_activitySnapshot = v15;

  v17 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController _workoutsForFriend:snapshot:](self, "_workoutsForFriend:snapshot:", self->_friend, self->_activitySnapshot));
  todaysFriendWorkouts = self->_todaysFriendWorkouts;
  self->_todaysFriendWorkouts = v17;

  if (self->_isMe)
  {
    if (self->_todaysAchievements)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend friendAchievements](self->_friend, "friendAchievements"));
      v20 = objc_msgSend(v19, "mutableCopy");

      todaysAchievements = self->_todaysAchievements;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000C9EF4;
      v31[3] = &unk_10077A428;
      v31[4] = self;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet hk_map:](todaysAchievements, "hk_map:", v31));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[_HKFitnessFriendActivitySnapshot snapshotIndex](self->_activitySnapshot, "snapshotIndex")));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v23);

      -[ASFriend setFriendAchievements:](self->_friend, "setFriendAchievements:", v20);
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend friendAchievements](self->_friend, "friendAchievements"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[_HKFitnessFriendActivitySnapshot snapshotIndex](self->_activitySnapshot, "snapshotIndex")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v25));
    v27 = (NSSet *)objc_msgSend(v26, "mutableCopy");
    v28 = self->_todaysAchievements;
    self->_todaysAchievements = v27;

    self->_dataIsHidden = -[CHFriendDetailCollectionViewController _isDataHidden](self, "_isDataHidden");
  }
  -[CHFriendDetailCollectionViewController _populateAchievements](self, "_populateAchievements");
  -[CHFriendDetailCollectionViewController _reloadData](self, "_reloadData");

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationController](self, "navigationController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topViewController"));

  if (v7 == v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationController](self, "navigationController"));
    v8 = objc_msgSend(v9, "popViewControllerAnimated:", 1);

  }
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CHFriendDetailCollectionViewController _logMessageComposeResult:messageComposeViewController:](self, "_logMessageComposeResult:messageComposeViewController:", a4, v6);

  -[CHFriendInboxTableViewController addFriendViewControllerDidDismiss:]_0();
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AAUIAchievementDetailTransitionAnimator *v16;

  v8 = a5;
  v9 = a6;
  v11 = objc_opt_class(CHAchievementDetailViewController, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0
    || (v13 = objc_opt_class(CHAchievementDetailViewController, v12),
        (objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    && (v15 = objc_opt_class(self, v14), (objc_opt_isKindOfClass(v9, v15) & 1) != 0))
  {
    v16 = self->_achievementTransitionAnimator;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationController](self, "navigationController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  objc_opt_class(CHAchievementDetailViewController, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  return (isKindOfClass & 1) == 0;
}

- (void)achievementsView:(id)a3 didTapAchievement:(id)a4 cell:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  CHAchievementDetailViewController *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  AAUIAchievementDetailTransitionAnimator *v24;
  AAUIAchievementDetailTransitionAnimator *achievementTransitionAnimator;
  void *v26;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = sub_10005C8E8(v8, self->_snapshotDateComponents);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = -[CHAchievementDetailViewController initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:]([CHAchievementDetailViewController alloc], "initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:", v11, self->_achievementLocProvider, !self->_isMe, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = objc_alloc((Class)AAUIAchievementDetailTransitionAnimator);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000CA4B4;
  v32[3] = &unk_100777E20;
  v33 = v7;
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1000CA4C0;
  v30 = &unk_100777E20;
  v31 = v33;
  v23 = v33;
  v24 = (AAUIAchievementDetailTransitionAnimator *)objc_msgSend(v22, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:didStartAnimationBlock:didFinishAnimationBlock:", self, v12, 1, v23, v32, &v27, v15, v17, v19, v21);
  achievementTransitionAnimator = self->_achievementTransitionAnimator;
  self->_achievementTransitionAnimator = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendDetailCollectionViewController navigationController](self, "navigationController", v27, v28, v29, v30));
  objc_msgSend(v26, "pushViewController:animated:", v12, 1);

}

- (void)friendDetailActionListView:(id)a3 didSelectActionType:(int64_t)a4
{
  ASFriend *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id inited;
  NSObject *v16;
  void *v17;
  ASFriend *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  CHFriendManager *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
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
  CHFriendManager *friendManager;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void (**v87)(_QWORD, _QWORD);
  void *v88;
  id v89;
  id v90;
  _QWORD v91[5];
  _QWORD v92[5];
  id v93;
  id v94;
  _QWORD v95[5];
  id v96;
  id v97;
  id location;
  _QWORD v99[4];
  id v100;
  char v101;
  _QWORD v102[5];
  _QWORD v103[4];
  id v104;
  char v105;
  uint8_t buf[4];
  _BYTE v107[24];

  v90 = a3;
  v6 = self->_friend;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](v6, "displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v7));

  switch(a4)
  {
    case 0:
      v9 = -[ASFriend isMuted](v6, "isMuted");
      v10 = (int)v9;
      ASLoggingInitialize(v9);
      v11 = (void *)ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend UUID](v6, "UUID"));
        v14 = v10 ^ 1u;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v107 = v10 ^ 1;
        *(_WORD *)&v107[4] = 2114;
        *(_QWORD *)&v107[6] = v13;
        *(_WORD *)&v107[14] = 2112;
        *(_QWORD *)&v107[16] = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting mute status to %d for friend: %{public}@ - %@", buf, 0x1Cu);

      }
      else
      {
        v14 = v10 ^ 1u;
      }
      friendManager = self->_friendManager;
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_1000CB104;
      v103[3] = &unk_10077A478;
      v105 = v10;
      v104 = v8;
      -[CHFriendManager setMuteEnabled:forFriend:completion:](friendManager, "setMuteEnabled:forFriend:completion:", v14, v6, v103);

      goto LABEL_23;
    case 1:
      v37 = -[ASFriend isMyActivityDataCurrentlyHidden](v6, "isMyActivityDataCurrentlyHidden");
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_1000CB3FC;
      v102[3] = &unk_10077A4A0;
      v102[4] = self;
      v38 = objc_retainBlock(v102);
      v87 = (void (**)(_QWORD, _QWORD))v38;
      if ((v37 & 1) != 0)
        goto LABEL_9;
      v67 = -[ASFriend isCompetitionActive](v6, "isCompetitionActive");
      if ((_DWORD)v67)
      {
        v68 = ActivitySharingBundle(v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("COMPETITION_IN_PROGRESS_HIDING_NOT_ALLOWED"), &stru_1007AE1D0, CFSTR("Localizable")));
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v70, v71, v72));

        ((void (**)(_QWORD, void *))v87)[2](v87, v43);
      }
      else
      {
        v38 = -[ASFriend hasPendingCompetitionRequestFromMe](self->_friend, "hasPendingCompetitionRequestFromMe");
        if ((_DWORD)v38)
        {
          v79 = ActivitySharingBundle(v38);
          v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SENT_HIDING_NOT_ALLOWED"), &stru_1007AE1D0, CFSTR("Localizable")));
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v81, v82, v83));

          ((void (**)(_QWORD, void *))v87)[2](v87, v43);
        }
        else
        {
LABEL_9:
          ASLoggingInitialize(v38);
          v39 = (void *)ASLogDefault;
          if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend UUID](v6, "UUID"));
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v107 = (_DWORD)v37;
            *(_WORD *)&v107[4] = 2114;
            *(_QWORD *)&v107[6] = v41;
            *(_WORD *)&v107[14] = 2112;
            *(_QWORD *)&v107[16] = v6;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Setting hiding status to %d for friend: %{public}@ - %@", buf, 0x1Cu);

          }
          v42 = self->_friendManager;
          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472;
          v99[2] = sub_1000CB5A8;
          v99[3] = &unk_10077A478;
          v101 = v37 ^ 1;
          v100 = v8;
          -[CHFriendManager setActivityDataVisible:toFriend:completion:](v42, "setActivityDataVisible:toFriend:completion:", v37, v6, v99);
          v43 = v100;
        }
      }

LABEL_23:
      return;
    case 2:
      inited = objc_initWeak(&location, self);
      ASLoggingInitialize(inited);
      v16 = ASLogDefault;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend UUID](self->_friend, "UUID"));
        v18 = self->_friend;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v107 = v17;
        *(_WORD *)&v107[8] = 2112;
        *(_QWORD *)&v107[10] = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Removing friend: %{public}@ - %@", buf, 0x16u);

      }
      v20 = ActivitySharingBundle(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("REMOVE_FRIEND"), &stru_1007AE1D0, CFSTR("Localizable")));
      v23 = ActivitySharingBundle(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REMOVE_FRIEND_CONFIRM"), &stru_1007AE1D0, CFSTR("Localizable")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v22, v25, 1));

      v28 = ActivitySharingBundle(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("REMOVE_FRIEND_CANCEL"), &stru_1007AE1D0, CFSTR("Localizable")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v30, 1, 0));
      objc_msgSend(v26, "addAction:", v31);

      v33 = ActivitySharingBundle(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("REMOVE_FRIEND_YES"), &stru_1007AE1D0, CFSTR("Localizable")));
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_1000CB894;
      v95[3] = &unk_10077A4C8;
      v95[4] = self;
      v96 = v8;
      objc_copyWeak(&v97, &location);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v35, 2, v95));
      objc_msgSend(v26, "addAction:", v36);

      -[CHFriendDetailCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);
      objc_destroyWeak(&v97);

      objc_destroyWeak(&location);
      goto LABEL_23;
    case 3:
      v44 = !self->_pairedWatchSupportsCompetitions;
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionSendConfirmationTitle](self->_friend, "as_competitionSendConfirmationTitle"));
      if (v44)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_UPGRADE_WATCH"), &stru_1007AE1D0, CFSTR("Localizable")));

        v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v88, v74, 1));
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1007AE1D0, CFSTR("Localizable")));
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v77, 0, 0));
        objc_msgSend(v75, "addAction:", v78);

        -[CHFriendDetailCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v75, 1, 0);
      }
      else
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionSendConfirmationMessageForExperienceType:](self->_friend, "as_competitionSendConfirmationMessageForExperienceType:", self->_experienceType));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", v86, &stru_1007AE1D0, CFSTR("Localizable")));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v47));

        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("SHARING_CANCEL"), &stru_1007AE1D0, CFSTR("Localizable")));
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v49, 1, 0));

        v51 = ActivitySharingBundle(v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_CONFIRMATION_SEND_ACTION"), &stru_1007AE1D0, CFSTR("Localizable")));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend displayName](self->_friend, "displayName"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v54));
        v92[0] = _NSConcreteStackBlock;
        v92[1] = 3221225472;
        v92[2] = sub_1000CBBF4;
        v92[3] = &unk_10077A4F0;
        v92[4] = self;
        v93 = v8;
        v94 = v88;
        v89 = v88;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v55, 0, v92));

        v57 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionLearnMorePopupAction](self->_friend, "as_competitionLearnMorePopupAction"));
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_1000CC448;
        v91[3] = &unk_100778E60;
        v91[4] = self;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v57, 0, v91));

        v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v89, v85, 1));
        objc_msgSend(v59, "addAction:", v84);
        objc_msgSend(v59, "addAction:", v56);
        objc_msgSend(v59, "addAction:", v58);
        objc_msgSend(v59, "setPreferredAction:", v56);
        -[CHFriendDetailCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v59, 1, 0);

      }
      goto LABEL_23;
    case 4:
      sub_1000A8C78(self, self->_friend, self->_friendManager, self->_experienceType);
      goto LABEL_23;
    case 5:
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionLearnMoreTitleForExperienceType:](self->_friend, "as_competitionLearnMoreTitleForExperienceType:", self->_experienceType));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend as_competitionLearnMoreFullDescriptionForExperienceType:](self->_friend, "as_competitionLearnMoreFullDescriptionForExperienceType:", self->_experienceType));
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v60, v61, 1));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1007AE1D0, CFSTR("Localizable")));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v64, 0, 0));
      objc_msgSend(v62, "addAction:", v65);

      -[CHFriendDetailCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v62, 1, 0);
      goto LABEL_23;
    default:
      goto LABEL_23;
  }
}

- (BOOL)_shouldShowExerciseAndStandCells
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HKFitnessFriendActivitySnapshot activitySummary](self->_activitySnapshot, "activitySummary"));
  v3 = objc_msgSend(v2, "_isStandalonePhoneSummary") ^ 1;

  return v3;
}

- (BOOL)_shouldShowStepsAndDistanceCells
{
  void *v3;
  unsigned __int8 v4;
  char iAmWheelchairUser;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HKFitnessFriendActivitySnapshot activitySummary](self->_activitySnapshot, "activitySummary"));
  v4 = objc_msgSend(v3, "_isStandalonePhoneSummary");

  if (self->_isMe)
    iAmWheelchairUser = self->_iAmWheelchairUser;
  else
    iAmWheelchairUser = FIUIIsWheelchairUserForWheelchairUse(-[_HKFitnessFriendActivitySnapshot wheelchairUse](self->_activitySnapshot, "wheelchairUse"));
  return v4 & iAmWheelchairUser ^ 1;
}

- (BOOL)_shouldShowMuteAction
{
  return !self->_isMe && !self->_dataIsHidden;
}

- (BOOL)_shouldShowCompetitionRequestAction
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (self->_isMe)
    return 0;
  if (self->_dataIsHidden)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend contact](self->_friend, "contact"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relationship"));
  v5 = objc_msgSend(v4, "supportsCompetitions");

  if (!v5 || !-[ASFriend supportsCompetitions](self->_friend, "supportsCompetitions"))
    return 0;
  else
    return -[ASFriend isEligibleToReceiveCompetitionRequest](self->_friend, "isEligibleToReceiveCompetitionRequest");
}

- (BOOL)_shouldShowCompetitionAcceptAction
{
  if (self->_isMe || self->_dataIsHidden)
    return 0;
  else
    return -[ASFriend isAwaitingCompetitionResponseFromMe](self->_friend, "isAwaitingCompetitionResponseFromMe");
}

- (BOOL)_shouldShowCompetitionRulesAction
{
  if (self->_isMe || self->_dataIsHidden)
    return 0;
  if ((-[ASFriend isCompetitionActive](self->_friend, "isCompetitionActive") & 1) != 0)
    return 1;
  return -[ASFriend hasPendingCompetitionRequestFromMe](self->_friend, "hasPendingCompetitionRequestFromMe");
}

- (BOOL)_shouldShowWhileDataIsHiddenForSection:(int64_t)a3
{
  return (unint64_t)a3 < 3 || a3 > 8;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  self->_iAmWheelchairUser = a4;
  -[CHFriendDetailCollectionViewController _reloadData](self, "_reloadData", a3);
}

- (void)_logMessageComposeResult:(int64_t)a3 messageComposeViewController:(id)a4
{
  void *v4;
  id v5;
  const __CFString *v6;

  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "recipients"));
    v5 = objc_msgSend(v4, "count");

    if (v5 == (id)1)
      v6 = CFSTR("single");
    else
      v6 = CFSTR("group");
    FIActivityAnalyticsSubmission(CFSTR("com.apple.Fitness.sharing"), CFSTR("message"), v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_achievementLocProvider, 0);
  objc_storeStrong((id *)&self->_achievementTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_sharingText, 0);
  objc_storeStrong((id *)&self->_sharingImage, 0);
  objc_storeStrong((id *)&self->_sharingInfoText, 0);
  objc_storeStrong((id *)&self->_numItemsInSectionArray, 0);
  objc_storeStrong((id *)&self->_sizesArray, 0);
  objc_storeStrong((id *)&self->_itemsArray, 0);
  objc_storeStrong((id *)&self->_sharingInfoSizingLabel, 0);
  objc_storeStrong((id *)&self->_actionListCell, 0);
  objc_storeStrong((id *)&self->_achievementsCell, 0);
  objc_storeStrong((id *)&self->_workoutCellsArray, 0);
  objc_storeStrong((id *)&self->_competitionTotalWinsCell, 0);
  objc_storeStrong((id *)&self->_competitionGraphCell, 0);
  objc_storeStrong((id *)&self->_competitionScoreCell, 0);
  objc_storeStrong((id *)&self->_distanceCell, 0);
  objc_storeStrong((id *)&self->_stepCell, 0);
  objc_storeStrong((id *)&self->_standCell, 0);
  objc_storeStrong((id *)&self->_exerciseCell, 0);
  objc_storeStrong((id *)&self->_moveCell, 0);
  objc_storeStrong((id *)&self->_dateCell, 0);
  objc_storeStrong((id *)&self->_threeRingCell, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_todaysAchievements, 0);
  objc_storeStrong((id *)&self->_todaysFriendWorkouts, 0);
  objc_storeStrong((id *)&self->_activitySnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotDateComponents, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end
