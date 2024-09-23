@implementation BCAugmentedExperienceManager

+ (BOOL)endOfBookExperienceFeatureEnabled
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("BKEndOfBookExperienceDisabled")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(a1, "enabled");

  return v4;
}

+ (id)newAugmentedExperienceManager
{
  if (+[BCAugmentedExperienceManager endOfBookExperienceFeatureEnabled](BCAugmentedExperienceManager, "endOfBookExperienceFeatureEnabled"))
  {
    return objc_alloc_init(BCAugmentedExperienceManager);
  }
  else
  {
    return 0;
  }
}

+ (BOOL)enabled
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("endOfBookExperience.enabled")));
  v6 = BUDynamicCast(v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 1;

  return v8;
}

+ (BOOL)autoExpandAtEnd
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("endOfBookExperience.autoExpandAtEnd")));
  v6 = BUDynamicCast(v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 1;

  return v8;
}

+ (float)confidenceThreshold
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("endOfBookExperience.confidenceThreshold")));
  v6 = BUDynamicCast(v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (BCAugmentedExperienceManager)init
{
  return -[BCAugmentedExperienceManager initWithStateChangeCoalescingDelay:](self, "initWithStateChangeCoalescingDelay:", 0.2);
}

- (BCAugmentedExperienceManager)initWithStateChangeCoalescingDelay:(double)a3
{
  BCAugmentedExperienceManager *v4;
  uint64_t v5;
  NSMutableArray *augmentedExperiences;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  BUCoalescingCallBlock *v12;
  BUCoalescingCallBlock *stateChangeCoalescingCallBlock;
  uint64_t v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BCAugmentedExperienceManager;
  v4 = -[BCAugmentedExperienceManager init](&v18, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    augmentedExperiences = v4->_augmentedExperiences;
    v4->_augmentedExperiences = (NSMutableArray *)v5;

    if (a3 != 0.0)
    {
      objc_initWeak(&location, v4);
      v7 = objc_alloc((Class)BUCoalescingCallBlock);
      objc_copyWeak(&v16, &location);
      v8 = (objc_class *)objc_opt_class(v4);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ in %@"), CFSTR("stateChangeCoalescingCallBlock"), v10, _NSConcreteStackBlock, 3221225472, sub_1341C, &unk_28BD38));
      v12 = (BUCoalescingCallBlock *)objc_msgSend(v7, "initWithNotifyBlock:blockDescription:", &v15, v11);
      stateChangeCoalescingCallBlock = v4->_stateChangeCoalescingCallBlock;
      v4->_stateChangeCoalescingCallBlock = v12;

      -[BUCoalescingCallBlock setCoalescingDelay:](v4->_stateChangeCoalescingCallBlock, "setCoalescingDelay:", a3);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  return v4;
}

- (void)_currentBookIsFinished
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager presentationViewController](self, "presentationViewController"));
  v4 = objc_opt_respondsToSelector(v3, "setFinishedForAssetID:");

  if ((v4 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager presentationViewController](self, "presentationViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager storeID](self, "storeID"));
    objc_msgSend(v6, "setFinishedForAssetID:", v5);

  }
}

- (void)_handleStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager stateChangeCoalescingCallBlock](self, "stateChangeCoalescingCallBlock"));

  if (v5)
  {
    -[BCAugmentedExperienceManager setStateChangeBlock:](self, "setStateChangeBlock:", v4);

    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager stateChangeCoalescingCallBlock](self, "stateChangeCoalescingCallBlock"));
    objc_msgSend(v7, "signalWithCompletion:", &stru_28BD58);
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  v7 = (void (**)(_QWORD))objc_retainBlock(v4);

  v6 = v7;
  if (v7)
  {
    v7[2](v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)emitter:(id)a3 bookPositionChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = BCAugmentedExperienceLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1B3374((uint64_t)v7, v9, v10);

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_13778;
  v12[3] = &unk_28BD80;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  -[BCAugmentedExperienceManager _handleStateChange:](self, "_handleStateChange:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)emitter:(id)a3 bookMilestoneReached:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BCAugmentedExperienceManager *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = BCAugmentedExperienceLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1B3440(a4, v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager augmentedExperiences](self, "augmentedExperiences", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = a4 - 2;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "experience"));
        v16 = objc_msgSend(v15, "kind");

        if (!v16)
        {
          switch(v12)
          {
            case 0:
              goto LABEL_13;
            case 1:
              if (objc_msgSend(v14, "isPresented"))
                goto LABEL_19;
              objc_msgSend(v14, "setAutoExpand:", 1);
LABEL_13:
              objc_msgSend(v14, "setTriggeredLocation:", 1);
              -[BCAugmentedExperienceManager _processStateEvent:forExperience:](self, "_processStateEvent:forExperience:", 1, v14);
              v17 = self;
              v18 = 2;
LABEL_14:
              -[BCAugmentedExperienceManager _processStateEvent:forExperience:](v17, "_processStateEvent:forExperience:", v18, v14);
              break;
            case 5:
            case 6:
            case 8:
              v17 = self;
              v18 = 7;
              goto LABEL_14;
            case 7:
              if (objc_msgSend(v14, "isPresented")
                && objc_msgSend(v14, "isOnExperiencePage"))
              {
LABEL_19:
                -[BCAugmentedExperienceManager _expandExperience:](self, "_expandExperience:", v14);
              }
              break;
            default:
              break;
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v10 = v19;
    }
    while (v19);
  }

}

- (void)emitter:(id)a3 bookSectionChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BCAugmentedExperienceManager *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = BCAugmentedExperienceLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1B34D8((uint64_t)v7, v9, v10);

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_13C98;
  v12[3] = &unk_28BDA8;
  objc_copyWeak(&v15, &location);
  v11 = v7;
  v13 = v11;
  v14 = self;
  -[BCAugmentedExperienceManager _handleStateChange:](self, "_handleStateChange:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)presentingViewControllerDidChangeLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager augmentedExperiences](self, "augmentedExperiences", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "experience"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presenter"));
        objc_msgSend(v11, "bringExperienceViewToFront:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)removeExperienceOfType:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager augmentedExperiences](self, "augmentedExperiences", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "experience"));
        v12 = objc_msgSend(v11, "kind");

        if (v12 == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "experience"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presenter"));
          objc_msgSend(v14, "endPresentation:", 0);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager augmentedExperiences](self, "augmentedExperiences"));
          objc_msgSend(v15, "removeObject:", v10);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)addExperience:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  BKAugmentedExperienceData *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "location"));
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "location"));
  objc_msgSend(v6, "confidence");
  v8 = v7;
  +[BCAugmentedExperienceManager confidenceThreshold](BCAugmentedExperienceManager, "confidenceThreshold");
  v10 = v9;

  if (v8 >= v10)
  {
LABEL_3:
    v11 = objc_alloc_init(BKAugmentedExperienceData);
    -[BKAugmentedExperienceData setExperience:](v11, "setExperience:", v14);
    -[BKAugmentedExperienceData setTriggeredLocation:](v11, "setTriggeredLocation:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager augmentedExperiences](self, "augmentedExperiences"));
    objc_msgSend(v12, "addObject:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presenter"));
    objc_msgSend(v13, "setPresentingDelegate:", self);

  }
}

- (BOOL)_isExperienceViable:(id)a3
{
  return !+[BKReachability isOffline](BKReachability, "isOffline", a3);
}

- (void)_processStateEvent:(int64_t)a3 forExperience:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v6 = a4;
  v7 = BCAugmentedExperienceLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager _eventToString:](self, "_eventToString:", a3));
    v24 = 138412290;
    v25 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "processStateEvent %@", (uint8_t *)&v24, 0xCu);

  }
  v10 = objc_msgSend(v6, "state");
  switch((unint64_t)objc_msgSend(v6, "state"))
  {
    case 0uLL:
      if (a3 == 1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "experience"));
        v12 = -[BCAugmentedExperienceManager _isExperienceViable:](self, "_isExperienceViable:", v11);

        if (v12)
        {
          objc_msgSend(v6, "setState:", 4);
          -[BCAugmentedExperienceManager _preloadExperience:](self, "_preloadExperience:", v6);
        }
      }
      goto LABEL_41;
    case 1uLL:
      if (a3 != 7)
      {
        if (a3 == 6)
          goto LABEL_13;
        goto LABEL_29;
      }
      goto LABEL_41;
    case 2uLL:
      if (a3 == 7)
      {
        if (-[BCAugmentedExperienceManager _cancelShowExperience:](self, "_cancelShowExperience:", v6))
        {
          v13 = v6;
          v14 = 1;
          goto LABEL_40;
        }
      }
      else if (a3 == 6 && -[BCAugmentedExperienceManager _cancelShowExperience:](self, "_cancelShowExperience:", v6))
      {
LABEL_13:
        v13 = v6;
        v14 = 3;
        goto LABEL_40;
      }
      goto LABEL_41;
    case 3uLL:
      if (!a3)
      {
LABEL_30:
        v13 = v6;
        v14 = 0;
        goto LABEL_40;
      }
      goto LABEL_41;
    case 4uLL:
      switch(a3)
      {
        case 0:
          goto LABEL_32;
        case 2:
          v15 = v6;
          v16 = 6;
          goto LABEL_21;
        case 3:
          v13 = v6;
          v14 = 5;
          goto LABEL_40;
        case 4:
          goto LABEL_30;
        default:
          goto LABEL_41;
      }
      goto LABEL_41;
    case 5uLL:
      if (!a3)
        goto LABEL_32;
      if (a3 == 2)
      {
        v15 = v6;
        v16 = 7;
LABEL_21:
        objc_msgSend(v15, "setState:", v16);
        -[BCAugmentedExperienceManager _startDelayForExperience:](self, "_startDelayForExperience:", v6);
      }
      goto LABEL_41;
    case 6uLL:
      if (a3 == 5)
      {
        v13 = v6;
        v14 = 8;
        goto LABEL_40;
      }
      if (a3 == 3)
      {
        v13 = v6;
        v14 = 7;
LABEL_40:
        objc_msgSend(v13, "setState:", v14);
        goto LABEL_41;
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      {
        objc_msgSend(v6, "setState:", 0);
        -[BCAugmentedExperienceManager _cancelPreloadExperience:](self, "_cancelPreloadExperience:", v6);
        -[BCAugmentedExperienceManager _cancelDelayForExperience:](self, "_cancelDelayForExperience:", v6);
      }
LABEL_41:
      v17 = objc_msgSend(v6, "state");
      if (v10 != v17)
      {
        v18 = v17;
        v19 = BCAugmentedExperienceLog();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager _stateToString:](self, "_stateToString:", v10));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager _stateToString:](self, "_stateToString:", v18));
          v24 = 138412546;
          v25 = v21;
          v26 = 2112;
          v27 = v22;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "processStateEvent state change from %@ to %@", (uint8_t *)&v24, 0x16u);

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "experience"));
        -[BCAugmentedExperienceManager _stateChangedTo:forExperience:](self, "_stateChangedTo:forExperience:", v18, v23);

      }
      return;
    case 7uLL:
      if (a3 == 5)
        goto LABEL_29;
      if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      {
        objc_msgSend(v6, "setState:", 0);
        -[BCAugmentedExperienceManager _cancelDelayForExperience:](self, "_cancelDelayForExperience:", v6);
        goto LABEL_33;
      }
      goto LABEL_41;
    case 8uLL:
      if (a3 == 3)
      {
LABEL_29:
        objc_msgSend(v6, "setState:", 2);
        -[BCAugmentedExperienceManager _showExperience:](self, "_showExperience:", v6);
      }
      else if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      {
LABEL_32:
        objc_msgSend(v6, "setState:", 0);
LABEL_33:
        -[BCAugmentedExperienceManager _cancelPreloadExperience:](self, "_cancelPreloadExperience:", v6);
      }
      goto LABEL_41;
    default:
      goto LABEL_41;
  }
}

- (id)_eventToString:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 0;
  else
    return off_28BE40[a3];
}

- (id)_stateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return 0;
  else
    return off_28BE80[a3];
}

- (void)_preloadExperience:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "preloadExperience", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presenter"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager presentationViewController](self, "presentationViewController"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presenter"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
      v13 = objc_msgSend(v12, "pageProgressionIsRTL");
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_148BC;
      v16[3] = &unk_28BDF8;
      v16[4] = self;
      v17 = v4;
      objc_msgSend(v11, "preloadPresentationInVC:pageProgressionIsRTL:completion:", v9, v13, v16);

    }
  }
  else
  {
    v14 = BCAugmentedExperienceLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1B35A4(v15);

    -[BCAugmentedExperienceManager _processStateEvent:forExperience:](self, "_processStateEvent:forExperience:", 4, v4);
  }

}

- (void)_cancelPreloadExperience:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  v4 = BCAugmentedExperienceLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "cancelPreloadExperience", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experience"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presenter"));
  objc_msgSend(v7, "cancelPreloadPresentation");

}

- (void)_startDelayForExperience:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  BCAugmentedExperienceManager *v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "startDelayForExperience", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
  objc_msgSend(v7, "delay");
  v9 = v8;

  if (v9 <= 0.0)
  {
    -[BCAugmentedExperienceManager _delayCompletedForExperience:](self, "_delayCompletedForExperience:", v4);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
    objc_msgSend(v10, "delay");
    v12 = v11;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_14B34;
    v18 = &unk_28BE20;
    v13 = v4;
    v19 = v13;
    v20 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v15, v12));

    objc_msgSend(v13, "setDelayTimer:", v14, v15, v16, v17, v18);
  }

}

- (void)_delayCompletedForExperience:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "delayCompletedForExperience", buf, 2u);
  }

  -[BCAugmentedExperienceManager _delayCompleted](self, "_delayCompleted");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_14C38;
  v8[3] = &unk_28B808;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)_cancelDelayForExperience:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = BCAugmentedExperienceLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "cancelDelayForExperience", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delayTimer"));
  objc_msgSend(v6, "invalidate");

  objc_msgSend(v3, "setDelayTimer:", 0);
}

- (id)_detailsForExperience:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_2A93E0, CFSTR("BCAugmentedExperienceLocationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "triggeredLocation")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("BCAugmentedExperienceLocationVariantKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experience"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "version"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("BCAugmentedExperienceVariantVersionKey"));

  return v4;
}

- (void)_expandExperience:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "expandExperience", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager presentationViewController](self, "presentationViewController"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presenter"));
    objc_msgSend(v9, "expandInVC:", v7);

  }
}

- (void)_showExperience:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t v14[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "showExperience", v14, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager presentationViewController](self, "presentationViewController"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presenter"));
    v10 = objc_msgSend(v4, "autoExpand");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager _detailsForExperience:](self, "_detailsForExperience:", v4));
    objc_msgSend(v9, "presentInVC:autoExpanded:details:", v7, v10, v11);

    objc_msgSend(v4, "setIsPresented:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experience"));
    v13 = objc_msgSend(v12, "kind");

    if (!v13)
      -[BCAugmentedExperienceManager _currentBookIsFinished](self, "_currentBookIsFinished");
  }

}

- (void)_userClosedExperience:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "userClosedExperience", v7, 2u);
  }

  objc_msgSend(v4, "setIsPresented:", 0);
  -[BCAugmentedExperienceManager _processStateEvent:forExperience:](self, "_processStateEvent:forExperience:", 6, v4);

}

- (BOOL)_cancelShowExperience:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v3 = a3;
  v4 = BCAugmentedExperienceLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "cancelShowExperience", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experience"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presenter"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1512C;
  v11[3] = &unk_28B960;
  v12 = v3;
  v8 = v3;
  v9 = objc_msgSend(v7, "endPresentation:", v11);

  return v9;
}

- (void)presenterWantsToDismiss:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "User wants to dismiss the experience", buf, 2u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager augmentedExperiences](self, "augmentedExperiences", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "experience"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presenter"));

        if (v14 == v4)
          -[BCAugmentedExperienceManager _userClosedExperience:](self, "_userClosedExperience:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

}

- (void)presenterWantsToCloseAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD);
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  v8 = BCAugmentedExperienceLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Closing the current asset", v12, 2u);
  }

  -[BCAugmentedExperienceManager presenterWantsToDismiss:](self, "presenterWantsToDismiss:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceManager presentationViewController](self, "presentationViewController"));
  objc_msgSend(v10, "requestClose:", 1);

  v11 = (void (**)(_QWORD))objc_retainBlock(v6);
  if (v11)
    v11[2](v11);

}

- (BCAugmentedExperienceHosting)presentationViewController
{
  return (BCAugmentedExperienceHosting *)objc_loadWeakRetained((id *)&self->_presentationViewController);
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationViewController, a3);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)augmentedExperiences
{
  return self->_augmentedExperiences;
}

- (void)setAugmentedExperiences:(id)a3
{
  objc_storeStrong((id *)&self->_augmentedExperiences, a3);
}

- (BUCoalescingCallBlock)stateChangeCoalescingCallBlock
{
  return self->_stateChangeCoalescingCallBlock;
}

- (id)stateChangeBlock
{
  return self->_stateChangeBlock;
}

- (void)setStateChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_storeStrong((id *)&self->_stateChangeCoalescingCallBlock, 0);
  objc_storeStrong((id *)&self->_augmentedExperiences, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_destroyWeak((id *)&self->_presentationViewController);
}

@end
