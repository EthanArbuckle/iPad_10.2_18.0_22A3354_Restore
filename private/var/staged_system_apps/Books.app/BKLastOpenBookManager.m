@implementation BKLastOpenBookManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A930;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F5108 != -1)
    dispatch_once(&qword_1009F5108, block);
  return (id)qword_1009F5110;
}

- (void)javascriptConfiguration:(id)a3 updatedKeys:(id)a4
{
  -[BKLastOpenBookManager _clearCurrentBookIfNecessary](self, "_clearCurrentBookIfNecessary", a3, a4);
}

- (void)_clearCurrentBookIfNecessary
{
  if ((char *)-[BKLastOpenBookManager _currentBookOpenBehavior](self, "_currentBookOpenBehavior") - 1 <= (char *)1)
    +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "clearLastKnownSuccessfullyOpenBookID");
}

- (unint64_t)_currentBookOpenBehavior
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateSinceLastActiveOverride"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("BKApplicationDidEnterBackgroundTimeKey")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenBookID"));
  v10 = objc_msgSend(v9, "length");

  objc_msgSend(v3, "timeIntervalSinceDate:", v7);
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager config](self, "config"));
  objc_msgSend(v13, "openBookDefaultBehaviorOverride");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager config](self, "config"));
  objc_msgSend(v16, "openBookOpenBehaviorOverride");
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager config](self, "config"));
  objc_msgSend(v19, "openBookClosedSpreadBehaviorOverride");
  v21 = v20;

  if (v7)
  {
    v22 = v12 / 86400.0;
    if (v12 / 86400.0 <= v15)
    {
      v23 = 0;
    }
    else if (v10 && v22 <= v21)
    {
      v23 = 3;
    }
    else if (v22 > v15 && v22 <= v18 && v10 == 0)
    {
      v23 = 1;
    }
    else
    {
      v23 = 2;
    }
  }
  else if (v10)
  {
    v23 = 3;
  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (BCJSConfiguration)config
{
  return self->_config;
}

- (void)removeSucessfullyOpenedBookAssetIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("BKMainViewControllerLastBook")));
  if (objc_msgSend(v5, "length") && objc_msgSend(v9, "containsObject:", v5))
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("BKMainViewControllerSuccessfullyOpenedBook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  objc_msgSend(v6, "removeObjectsForKeys:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("BKSuccessfullyOpenedBookForAssetIDMappings"));

  objc_msgSend(v4, "synchronize");
}

- (NSMutableDictionary)sucessfullyOpenedBookForAssetID
{
  return self->_sucessfullyOpenedBookForAssetID;
}

- (void)prewarmAppState
{
  -[BKLastOpenBookManager _clearCurrentBookIfNecessary](self, "_clearCurrentBookIfNecessary");
}

- (id)_lastKnownSuccessfullyOpenedBookForAssetIDMappings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("BKSuccessfullyOpenedBookForAssetIDMappings")));
  v4 = v3;
  if (!v3)
    v3 = &__NSDictionary0__struct;
  v5 = v3;

  return v5;
}

- (id)_initWithConfiguration:(id)a3
{
  id v5;
  BKLastOpenBookManager *v6;
  BKLastOpenBookManager *v7;
  BKRecentBookOpenResultTracker *v8;
  BKRecentBookOpenResultTracker *openResultTracker;
  NSMutableArray *v10;
  NSMutableArray *lastOpenedBookAssetIDs;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *sucessfullyOpenedBookForAssetID;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKLastOpenBookManager;
  v6 = -[BKLastOpenBookManager init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    objc_msgSend(v5, "addObserver:", v7);
    v8 = objc_opt_new(BKRecentBookOpenResultTracker);
    openResultTracker = v7->_openResultTracker;
    v7->_openResultTracker = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    lastOpenedBookAssetIDs = v7->_lastOpenedBookAssetIDs;
    v7->_lastOpenedBookAssetIDs = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager _lastKnownSuccessfullyOpenedBookForAssetIDMappings](v7, "_lastKnownSuccessfullyOpenedBookForAssetIDMappings"));
    v13 = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
    sucessfullyOpenedBookForAssetID = v7->_sucessfullyOpenedBookForAssetID;
    v7->_sucessfullyOpenedBookForAssetID = v13;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager config](self, "config"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKLastOpenBookManager;
  -[BKLastOpenBookManager dealloc](&v4, "dealloc");
}

- (void)saveCurrentBookState
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("BKApplicationDidEnterBackgroundTimeKey"));

}

- (BOOL)_lastEngagedDateConsideredActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager config](self, "config"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateRequiredForActiveBook"));
    v8 = objc_msgSend(v7, "compare:", v4) != (id)1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_backgroundTimeKey
{
  return CFSTR("BKApplicationDidEnterBackgroundTimeKey");
}

- (id)_computeLastSuccessfullyOpenedBookAssetID
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager lastOpenedBookAssetIDs](self, "lastOpenedBookAssetIDs", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
        {
          v13 = v9;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_computeAssetIDForSavingToUserDataLastBookKey
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager _computeLastSuccessfullyOpenedBookAssetID](self, "_computeLastSuccessfullyOpenedBookAssetID"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager lastOpenedBookAssetIDs](self, "lastOpenedBookAssetIDs"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  }
  return v3;
}

- (void)_updateLastOpenBookUserData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;

  v3 = objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager _computeAssetIDForSavingToUserDataLastBookKey](self, "_computeAssetIDForSavingToUserDataLastBookKey"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }
  v8 = BCSceneLog(v3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v4;
    v15 = 1024;
    v16 = (int)v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scene update last open book ID to %{public}@, successful? %d", (uint8_t *)&v13, 0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = v10;
  if (v4)
  {
    objc_msgSend(v10, "setObject:forKey:", v4, CFSTR("BKMainViewControllerLastBook"));
    objc_msgSend(v11, "setBool:forKey:", v7, CFSTR("BKMainViewControllerSuccessfullyOpenedBook"));
  }
  else
  {
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("BKMainViewControllerLastBook"));
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("BKMainViewControllerSuccessfullyOpenedBook"));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("BKSuccessfullyOpenedBookForAssetIDMappings"));

  objc_msgSend(v11, "synchronize");
}

- (void)updateLastOpenBookByRemovingAssetID:(id)a3 addingAssetID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = BCSceneLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scene removing last open book ID=%{public}@, adding ID=%{public}@", (uint8_t *)&v15, 0x16u);
  }

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager lastOpenedBookAssetIDs](self, "lastOpenedBookAssetIDs"));
    objc_msgSend(v10, "removeObject:", v6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
    objc_msgSend(v11, "removeObjectForKey:", v6);

  }
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager lastOpenedBookAssetIDs](self, "lastOpenedBookAssetIDs"));
    v13 = objc_msgSend(v12, "containsObject:", v7);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager lastOpenedBookAssetIDs](self, "lastOpenedBookAssetIDs"));
      objc_msgSend(v14, "addObject:", v7);

    }
  }
  -[BKLastOpenBookManager _updateLastOpenBookUserData](self, "_updateLastOpenBookUserData");

}

- (void)updateSuccessfullyOpenedBookForAssetID:(id)a3 successfullyOpenedBook:(BOOL)a4
{
  _BOOL8 v4;
  BKRecentBookOpenResultTracker *openResultTracker;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    openResultTracker = self->_openResultTracker;
    if (v4)
      -[BKRecentBookOpenResultTracker openDidFinishForAsset:](openResultTracker, "openDidFinishForAsset:", v9);
    else
      -[BKRecentBookOpenResultTracker openDidStartForAsset:](openResultTracker, "openDidStartForAsset:", v9);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager sucessfullyOpenedBookForAssetID](self, "sucessfullyOpenedBookForAssetID"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  -[BKLastOpenBookManager _updateLastOpenBookUserData](self, "_updateLastOpenBookUserData");
}

- (BOOL)shouldAutoOpenAsset:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v7[2];

  v3 = -[BKRecentBookOpenResultTracker shouldAutoOpenAsset:](self->_openResultTracker, "shouldAutoOpenAsset:", a3);
  v4 = BCCurrentBookLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "auto-open logic said open? %d.", (uint8_t *)v7, 8u);
  }

  return v3;
}

- (BOOL)lastKnownSuccessfullyOpenedBookForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager _lastKnownSuccessfullyOpenedBookForAssetIDMappings](self, "_lastKnownSuccessfullyOpenedBookForAssetIDMappings"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearAllLastOpenBooks
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = BCSceneLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing all known last open books", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLastOpenBookManager lastOpenedBookAssetIDs](self, "lastOpenedBookAssetIDs"));
  objc_msgSend(v5, "removeAllObjects");

  -[BKLastOpenBookManager _updateLastOpenBookUserData](self, "_updateLastOpenBookUserData");
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (BKRecentBookOpenResultTracker)openResultTracker
{
  return self->_openResultTracker;
}

- (void)setOpenResultTracker:(id)a3
{
  objc_storeStrong((id *)&self->_openResultTracker, a3);
}

- (NSMutableArray)lastOpenedBookAssetIDs
{
  return self->_lastOpenedBookAssetIDs;
}

- (void)setLastOpenedBookAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_lastOpenedBookAssetIDs, a3);
}

- (void)setSucessfullyOpenedBookForAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_sucessfullyOpenedBookForAssetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sucessfullyOpenedBookForAssetID, 0);
  objc_storeStrong((id *)&self->_lastOpenedBookAssetIDs, 0);
  objc_storeStrong((id *)&self->_openResultTracker, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
