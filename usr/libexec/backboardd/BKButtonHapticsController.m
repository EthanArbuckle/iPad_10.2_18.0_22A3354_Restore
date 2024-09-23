@implementation BKButtonHapticsController

- (BKButtonHapticsController)init
{
  void *v3;
  BKButtonHapticsController *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BRButtonResolverController sharedInstance](BRButtonResolverController, "sharedInstance"));
  v4 = -[BKButtonHapticsController initWithBHButtonHapticsController:](self, "initWithBHButtonHapticsController:", v3);

  return v4;
}

- (BKButtonHapticsController)initWithBHButtonHapticsController:(id)a3
{
  id v5;
  BKButtonHapticsController *v6;
  BKButtonHapticsController *v7;
  dispatch_group_t v8;
  OS_dispatch_group *controllerReadyGroup;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v12;
  BKSButtonHapticsDefinition *homeButtonDefinition;
  NSMutableArray *v14;
  NSMutableArray *clickStatesConfigured;
  NSMutableArray *v16;
  NSMutableArray *clickStatesPending;
  uint64_t i;
  void *v19;
  id v20;
  BRButtonResolverController *BRController;
  dispatch_queue_global_t global_queue;
  void *v23;
  BKButtonHapticsController *v24;
  void *v25;
  id v26;
  BKButtonHapticsController *v27;
  void *v28;
  _QWORD v30[4];
  BKButtonHapticsController *v31;
  _QWORD v32[4];
  BKButtonHapticsController *v33;
  objc_super v34;
  BKButtonHapticsController *v35;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BKButtonHapticsController;
  v6 = -[BKButtonHapticsController init](&v34, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_BRController, a3);
    v8 = dispatch_group_create();
    controllerReadyGroup = v7->_controllerReadyGroup;
    v7->_controllerReadyGroup = (OS_dispatch_group *)v8;

    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboardd.buttonHaptics"));
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)Serial;

    v12 = objc_claimAutoreleasedReturnValue(+[BKSButtonHapticsDefinition definitionForHomeButton](BKSButtonHapticsDefinition, "definitionForHomeButton"));
    homeButtonDefinition = v7->_homeButtonDefinition;
    v7->_homeButtonDefinition = (BKSButtonHapticsDefinition *)v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clickStatesConfigured = v7->_clickStatesConfigured;
    v7->_clickStatesConfigured = v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clickStatesPending = v7->_clickStatesPending;
    v7->_clickStatesPending = v16;

    for (i = 0; i != 17; ++i)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKButtonHapticsClickState clickStateWithState:](BKButtonHapticsClickState, "clickStateWithState:", i));
      -[NSMutableArray addObject:](v7->_clickStatesConfigured, "addObject:", v19);
      v20 = objc_msgSend(v19, "copy");
      -[NSMutableArray addObject:](v7->_clickStatesPending, "addObject:", v20);

    }
    dispatch_group_enter((dispatch_group_t)v7->_controllerReadyGroup);
    BRController = v7->_BRController;
    global_queue = dispatch_get_global_queue(21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100030814;
    v32[3] = &unk_1000ECDA8;
    v24 = v7;
    v33 = v24;
    -[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:](BRController, "scheduleReadyNotificationOnDispatchQueue:withBlock:", v23, v32);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
    v26 = objc_msgSend(v25, "homeButtonType");

    if (v26 == (id)2)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000308D0;
      v30[3] = &unk_1000EA230;
      v31 = v24;
      -[BKButtonHapticsController _configureAsyncWithBlock:](v31, "_configureAsyncWithBlock:", v30);
      v27 = v31;
    }
    else
    {
      v27 = (BKButtonHapticsController *)objc_claimAutoreleasedReturnValue(+[BKSButtonHapticsDefinition definitionForHomeButton](BKSButtonHapticsDefinition, "definitionForHomeButton"));
      -[BKButtonHapticsController setClickHapticAssetType:](v27, "setClickHapticAssetType:", 2);
      -[BKButtonHapticsController setMinimumMultiplePressTimeInterval:](v27, "setMinimumMultiplePressTimeInterval:", 2.0);
      -[BKButtonHapticsController setMaximumMultiplePressTimeInterval:](v27, "setMaximumMultiplePressTimeInterval:", 2.0);
      -[BKButtonHapticsController setMinimumLongPressTimeInterval:](v27, "setMinimumLongPressTimeInterval:", 6.0);
      -[BKButtonHapticsController setMaximumLongPressTimeInterval:](v27, "setMaximumLongPressTimeInterval:", 6.0);
      -[BKButtonHapticsController setMaximumPressCount:](v27, "setMaximumPressCount:", 3);
      -[BKButtonHapticsController setMaximumTapCount:](v27, "setMaximumTapCount:", 0);
      v35 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      -[BKButtonHapticsController applyDefinitions:](v24, "applyDefinitions:", v28);

    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  objc_msgSend(v3, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", self->_clickStatesPending, CFSTR("clickStatesPending"), CFSTR(" "), 0);
  objc_msgSend(v3, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", self->_clickStatesConfigured, CFSTR("clickStatesConfigured"), CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (void)_configureAsyncWithBlock:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000307DC;
  block[3] = &unk_1000EBEF8;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)_configureSyncWithBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000307A4;
  block[3] = &unk_1000EBEF8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)_queue_assetOfType:(int64_t)a3 parameters:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *assetCache;
  void *v9;
  void *v10;

  v6 = a4;
  if (a3)
  {
    if (!self->_assetCache)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      assetCache = self->_assetCache;
      self->_assetCache = v7;

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_assetCache, "objectForKey:", v9));
    if (!v10)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BRAsset withType:andParameters:](BRAsset, "withType:andParameters:", a3, v6));
      -[NSMutableDictionary setObject:forKey:](self->_assetCache, "setObject:forKey:", v10, v9);
    }

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BRAsset nullAsset](BRAsset, "nullAsset"));
  }

  return v10;
}

- (void)_queue_getSlowHapticType:(int64_t *)a3 getMediumHapticType:(int64_t *)a4 getFastHapticType:(int64_t *)a5 fromAssetType:(int64_t)a6 clickCount:(int64_t)a7
{
  unint64_t v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;

  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  if (a6)
    v13 = a6;
  else
    v13 = 2;
  if (v13 >= 4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 280, CFSTR("unexpected assetType"));

  }
  if ((unint64_t)(a7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 281, CFSTR("unexpected hapticClickCount"));

  }
  v14 = (uint64_t)-[BRButtonResolverController maxAssetSlots](self->_BRController, "maxAssetSlots");
  if (v14 >= 4)
  {
    v15 = &unk_1000B3B38;
    if ((unint64_t)v14 > 5)
      v15 = &unk_1000B3BC8;
    v16 = (int64_t)v15 + 72 * a7 + 8 * v13;
    *a3 = *(_QWORD *)(v16 - 80);
    *a4 = *(_QWORD *)(v16 - 56);
    *a5 = *(_QWORD *)(v16 - 32);
  }
}

- (void)_queue_addConfigsAndAssetsForClickState:(id)a3 toStates:(id)a4 configs:(id)a5 assets:(id)a6
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unsigned int v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  BKButtonHapticsController *v51;
  unint64_t v52;
  id v53;
  SEL v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[4];
  __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;

  v11 = a3;
  v55 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (unint64_t)objc_msgSend(v11, "clickState");
  v15 = objc_msgSend(v11, "shouldUseHaptic");
  v57 = 0;
  v58 = 0;
  v56 = 0;
  if (v14 == 16)
  {
    v57 = 100;
    v58 = 100;
    v56 = 100;
  }
  else
  {
    if (v15)
    {
      v16 = v14;
      v17 = objc_msgSend(v11, "hapticClickCount");
      v18 = objc_msgSend(v11, "assetType");
      v19 = v17;
      v14 = v16;
      -[BKButtonHapticsController _queue_getSlowHapticType:getMediumHapticType:getFastHapticType:fromAssetType:clickCount:](self, "_queue_getSlowHapticType:getMediumHapticType:getFastHapticType:fromAssetType:clickCount:", &v58, &v57, &v56, v18, v19);
    }
    if (v14 >= 0x11)
    {
      v43 = v14;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bhClickState < BRClickStateCount"));

      v14 = v43;
    }
    if (v58 < 0)
    {
      v45 = v14;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slowHapticType >= HAButtonHapticType_Default"));

      v14 = v45;
    }
    if (v57 < 0)
    {
      v47 = v14;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediumHapticType >= HAButtonHapticType_Default"));

      v14 = v47;
    }
    if (v56 < 0)
    {
      v49 = v14;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fastHapticType >= HAButtonHapticType_Default"));

      v14 = v49;
    }
  }
  v54 = a2;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKButtonHapticsController _queue_assetOfType:parameters:](self, "_queue_assetOfType:parameters:", v58, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKButtonHapticsController _queue_assetOfType:parameters:](self, "_queue_assetOfType:parameters:", v57, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKButtonHapticsController _queue_assetOfType:parameters:](self, "_queue_assetOfType:parameters:", v56, 0));
  v23 = sub_100059844();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v52 = v14;
    v53 = v12;
    v51 = self;
    if (v14 > 0x10)
      v25 = CFSTR("<unknown>");
    else
      v25 = off_1000EA328[v14];
    v26 = v25;
    v27 = sub_100030684(v58);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = sub_100030684(v57);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = sub_100030684(v56);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    *(_DWORD *)buf = 138544130;
    v60 = v26;
    v61 = 2114;
    v62 = v28;
    v63 = 2114;
    v64 = v30;
    v65 = 2114;
    v66 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "state:%{public}@ haptics: %{public}@,%{public}@,%{public}@", buf, 0x2Au);

    v14 = v52;
    v12 = v53;
    self = v51;
  }

  if (v20)
  {
    if (v21)
      goto LABEL_20;
LABEL_23:
    v39 = v14;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v54, self, CFSTR("BKButtonHapticsController.m"), 470, CFSTR("nope"));

    v14 = v39;
    if (v22)
      goto LABEL_21;
LABEL_24:
    v41 = v14;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v54, self, CFSTR("BKButtonHapticsController.m"), 471, CFSTR("nope"));

    v14 = v41;
    goto LABEL_21;
  }
  v37 = v14;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v54, self, CFSTR("BKButtonHapticsController.m"), 469, CFSTR("nope"));

  v14 = v37;
  if (!v21)
    goto LABEL_23;
LABEL_20:
  if (!v22)
    goto LABEL_24;
LABEL_21:
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "slowConfigDictionaryForHAButtonHapticType:", v58));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "normalConfigDictionaryForHAButtonHapticType:", v57));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fastConfigDictionaryForHAButtonHapticType:", v56));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
  objc_msgSend(v13, "addObject:", v36);
  objc_msgSend(v13, "addObject:", v36);
  objc_msgSend(v13, "addObject:", v36);

  objc_msgSend(v12, "addObject:", v33);
  objc_msgSend(v12, "addObject:", v34);
  objc_msgSend(v12, "addObject:", v35);

  objc_msgSend(v55, "addObject:", v20);
  objc_msgSend(v55, "addObject:", v21);
  objc_msgSend(v55, "addObject:", v22);

}

- (void)_queue_addChangesForPendingState:(id)a3 configuredState:(id)a4 toStates:(id)a5 configs:(id)a6 assets:(id)a7 enable:(id)a8 disable:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003056C;
  v25[3] = &unk_1000EA258;
  v27 = &v34;
  v28 = &v38;
  v22 = v15;
  v26 = v22;
  v29 = &v30;
  +[BKButtonHapticsClickState inspectChangesFromState:toState:withBlock:](BKButtonHapticsClickState, "inspectChangesFromState:toState:withBlock:", v16, v22, v25);
  if (objc_msgSend(v22, "isEnabled"))
  {
    if (*((_BYTE *)v39 + 24))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "clickState")));
      objc_msgSend(v21, "addObject:", v23);

LABEL_8:
      -[BKButtonHapticsController _queue_addConfigsAndAssetsForClickState:toStates:configs:assets:](self, "_queue_addConfigsAndAssetsForClickState:toStates:configs:assets:", v22, v17, v18, v19);
      goto LABEL_9;
    }
    if (*((_BYTE *)v31 + 24))
      goto LABEL_8;
    if (!*((_BYTE *)v35 + 24))
      goto LABEL_9;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "clickState")));
    objc_msgSend(v20, "addObject:", v24);
    goto LABEL_6;
  }
  if (*((_BYTE *)v35 + 24))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "clickState")));
    objc_msgSend(v21, "addObject:", v24);
LABEL_6:

  }
LABEL_9:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (void)_queue_applyConfigurationChanges
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  BRButtonResolverController *BRController;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  id v28;
  BRButtonResolverController *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  BRButtonResolverController *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = self->_clickStatesPending;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "clickState");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_clickStatesConfigured, "objectAtIndexedSubscript:", v11));
        -[BKButtonHapticsController _queue_addChangesForPendingState:configuredState:toStates:configs:assets:enable:disable:](self, "_queue_addChangesForPendingState:configuredState:toStates:configs:assets:enable:disable:", v10, v12, v4, v42, v3, v44, v43);
        if (objc_msgSend(v10, "isEnabled"))
        {
          v13 = objc_msgSend(v10, "copy");
          -[NSMutableArray setObject:atIndexedSubscript:](self->_clickStatesConfigured, "setObject:atIndexedSubscript:", v13, v11);
        }
        else
        {
          v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_clickStatesConfigured, "objectAtIndexedSubscript:", v11));
          objc_msgSend(v13, "setEnabled:", 0);
        }

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v43, "count"))
  {
    v14 = sub_100059844();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bs_map:", &stru_1000EA278));
      *(_DWORD *)buf = 138543362;
      v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "disabling states %{public}@", buf, 0xCu);

    }
    BRController = self->_BRController;
    v47 = 0;
    -[BRButtonResolverController disableStates:clearAsset:error:](BRController, "disableStates:clearAsset:error:", v43, 1, &v47);
    v18 = v47;
    if (v18)
    {
      v19 = sub_100059844();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v53 = v43;
        v54 = 2114;
        v55 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "error disabling states %{public}@:%{public}@", buf, 0x16u);
      }

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v21 = sub_100059844();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v4));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "array"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bs_map:", &stru_1000EA298));
      v26 = -[BRButtonResolverController unusedAssetSlots](self->_BRController, "unusedAssetSlots");
      *(_DWORD *)buf = 138543618;
      v53 = v25;
      v54 = 1024;
      LODWORD(v55) = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "configuring %{public}@ unusedAssetSlots:%d", buf, 0x12u);

    }
    v27 = objc_msgSend(v42, "count");
    if (v27 != objc_msgSend(v3, "count") || (v28 = objc_msgSend(v3, "count"), v28 != objc_msgSend(v4, "count")))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKButtonHapticsController.m"), 584, CFSTR("must have same length configs:%@ assets:%@ states:%@"), v42, v3, v4);

    }
    v29 = self->_BRController;
    v46 = 0;
    -[BRButtonResolverController setConfigs:withAssets:forStates:error:](v29, "setConfigs:withAssets:forStates:error:", v42, v3, v4, &v46);
    v30 = v46;
    if (v30)
    {
      v31 = sub_100059844();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        v54 = 2114;
        v55 = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "error configuring states:%{public}@ error:%{public}@", buf, 0x16u);
      }

    }
  }
  if (objc_msgSend(v44, "count"))
  {
    v33 = sub_100059844();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bs_map:", &stru_1000EA2B8));
      *(_DWORD *)buf = 138543362;
      v53 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "enabling states %{public}@", buf, 0xCu);

    }
    v36 = self->_BRController;
    v45 = 0;
    -[BRButtonResolverController enableStates:error:](v36, "enableStates:error:", v44, &v45);
    v37 = v45;
    if (v37)
    {
      v38 = sub_100059844();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v53 = v44;
        v54 = 2114;
        v55 = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "error enabling states %{public}@:%{public}@", buf, 0x16u);
      }

    }
  }

}

- (void)_queue_applyDefinitions:(id)a3
{
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  void *i;
  void *v10;
  BKSButtonHapticsDefinition *homeButtonDefinition;
  id v12;
  NSObject *v13;
  __int128 v14;
  _QWORD v15[7];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138543362;
    v14 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "representsHomeButton", v14) & 1) != 0)
        {
          homeButtonDefinition = self->_homeButtonDefinition;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10002FF8C;
          v15[3] = &unk_1000EA2E0;
          v15[4] = self;
          v15[5] = v10;
          v15[6] = &v20;
          -[BKSButtonHapticsDefinition updateFromDefinition:withChangeInspectorBlock:](homeButtonDefinition, "updateFromDefinition:withChangeInspectorBlock:", v10, v15);
        }
        else
        {
          v12 = sub_100059844();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v25 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ignoring definition for unsupported button:%{public}@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v6);
  }

  if (*((_BYTE *)v21 + 24))
    -[BKButtonHapticsController _queue_applyConfigurationChanges](self, "_queue_applyConfigurationChanges");
  _Block_object_dispose(&v20, 8);

}

- (void)applyDefinitions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v6 = objc_msgSend(v5, "homeButtonType");

  if (v6 == (id)2)
  {
    v7 = sub_100059844();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "not configuring SSHB because we don't have a real home button", buf, 2u);
    }

  }
  else
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002FF5C;
    v10[3] = &unk_1000ECD80;
    v10[4] = self;
    v11 = v4;
    dispatch_async(queue, v10);

  }
}

- (void)removeAllHaptics
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002FE60;
  v2[3] = &unk_1000EA230;
  v2[4] = self;
  -[BKButtonHapticsController _configureAsyncWithBlock:](self, "_configureAsyncWithBlock:", v2);
}

- (void)playHapticForClickState:(unint64_t)a3 clickSpeed:(unint64_t)a4
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002FC7C;
  v4[3] = &unk_1000EA308;
  v4[5] = a3;
  v4[6] = a4;
  v4[4] = self;
  -[BKButtonHapticsController _configureSyncWithBlock:](self, "_configureSyncWithBlock:", v4);
}

- (BKSButtonHapticsDefinition)homeButtonDefinition
{
  return self->_homeButtonDefinition;
}

- (void)setHomeButtonDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_homeButtonDefinition, a3);
}

- (BRButtonResolverController)BRController
{
  return self->_BRController;
}

- (void)setBRController:(id)a3
{
  objc_storeStrong((id *)&self->_BRController, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_group)controllerReadyGroup
{
  return self->_controllerReadyGroup;
}

- (void)setControllerReadyGroup:(id)a3
{
  objc_storeStrong((id *)&self->_controllerReadyGroup, a3);
}

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  self->_maximumPressCount = a3;
}

- (int64_t)maximumTapCount
{
  return self->_maximumTapCount;
}

- (void)setMaximumTapCount:(int64_t)a3
{
  self->_maximumTapCount = a3;
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

- (void)setMultiplePressTimeInterval:(double)a3
{
  self->_multiplePressTimeInterval = a3;
}

- (double)longPressTimeInterval
{
  return self->_longPressTimeInterval;
}

- (void)setLongPressTimeInterval:(double)a3
{
  self->_longPressTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerReadyGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_BRController, 0);
  objc_storeStrong((id *)&self->_homeButtonDefinition, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_clickStatesPending, 0);
  objc_storeStrong((id *)&self->_clickStatesConfigured, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030994;
  block[3] = &unk_1000EBC38;
  block[4] = a1;
  if (qword_100117250 != -1)
    dispatch_once(&qword_100117250, block);
  return (id)qword_100117258;
}

@end
