@implementation CarMapsSuggestionsObserver_LowFuel

- (CarMapsSuggestionsObserver_LowFuel)init
{
  CarMapsSuggestionsObserver_LowFuel *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *shownFuelAlerts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarMapsSuggestionsObserver_LowFuel;
  v2 = -[CarMapsSuggestionsObserver_LowFuel init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    shownFuelAlerts = v2->_shownFuelAlerts;
    v2->_shownFuelAlerts = v3;

  }
  return v2;
}

- (void)removeAllShownFuelAlerts
{
  void *v3;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  objc_msgSend(v3, "removeAllObjects");

  objc_sync_exit(obj);
}

- (void)addShownFuelAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIdentifier"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  objc_sync_exit(v4);
}

- (BOOL)updateShownFuelAlerts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v11), "uniqueIdentifier"));
        objc_msgSend(v7, "removeObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v7;
  v14 = 0;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v18));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
          objc_msgSend(v21, "removeObjectForKey:", v18);

          v14 = 1;
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

  objc_sync_exit(obj);
  return v14 & 1;
}

- (id)unshownFuelAlerts:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
  objc_sync_enter(obj);
  v5 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel shownFuelAlerts](self, "shownFuelAlerts"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));
        v14 = v13 == 0;

        if (v14)
          -[NSMutableArray addObject:](v5, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_sync_exit(obj);
  return v5;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  __CFString *v16;

  if (self->_active != a3)
  {
    v3 = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_active)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      if (v3)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] LowFuel monitor _active=%{public}@ active=%{public}@", buf, 0x16u);

    }
    self->_active = v3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1008F887C;
    v11[3] = &unk_1011ACE58;
    v12 = v3;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (CarMapsSuggestionsController)controller
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapsSuggestionsController"));

  return (CarMapsSuggestionsController *)v3;
}

- (BOOL)hasLowFuelSuggestion
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel lowFuelSuggestions](self, "lowFuelSuggestions"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)lowFuelSuggestions
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel controller](self, "controller", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestions"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "type") == (id)10)
          -[NSMutableArray addObject:](v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)carMapsSuggestionControllerDidRefresh:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  unint64_t v31;

  v4 = a3;
  if (-[CarMapsSuggestionsObserver_LowFuel hasLowFuelSuggestion](self, "hasLowFuelSuggestion"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel controller](self, "controller"));
    v6 = objc_msgSend(v5, "allowLowFuelAlert");

    if ((v6 & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel lowFuelSuggestions](self, "lowFuelSuggestions"));
      if (-[CarMapsSuggestionsObserver_LowFuel updateShownFuelAlerts:](self, "updateShownFuelAlerts:", v7))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
        objc_msgSend(v8, "clearLowFuelAlertBulletin");

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel unshownFuelAlerts:](self, "unshownFuelAlerts:", v7));
      if (objc_msgSend(v9, "count"))
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        v11 = objc_msgSend(objc_alloc((Class)MSPLowFuelDetails), "initWithMapsSuggestionsEntry:", v10);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = v9;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              -[CarMapsSuggestionsObserver_LowFuel addShownFuelAlert:](self, "addShownFuelAlert:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16), (_QWORD)v25);
              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v14);
        }

        v17 = sub_10043364C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (unint64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Sending low fuel details to MSPMapsPushDaemon. Unshown Fuel Alert Details: %@", buf, 0xCu);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
        objc_msgSend(v19, "showLowFuelAlertBulletinForLowFuelDetails:", v11);

      }
      else
      {
        v24 = sub_10043364C();
        v10 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "There are no unshown fuel alerts to display", buf, 2u);
        }
      }

      objc_msgSend(v4, "setHoldProcessAssertion:", 0);
    }
    else
    {
      v22 = sub_10043364C();
      v7 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel controller](self, "controller"));
        *(_DWORD *)buf = 134217984;
        v31 = objc_msgSend(v23, "allowLowFuelAlert");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarMapsSuggestionController Did Refresh with allowLowFuelAlert as :%ld", buf, 0xCu);

      }
    }

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
    objc_msgSend(v20, "clearLowFuelAlertBulletin");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsObserver_LowFuel controller](self, "controller"));
    objc_msgSend(v21, "setAllowLowFuelAlert:", 1);

    -[CarMapsSuggestionsObserver_LowFuel removeAllShownFuelAlerts](self, "removeAllShownFuelAlerts");
  }

}

- (BOOL)active
{
  return self->_active;
}

- (id)dismissalBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)shownFuelAlerts
{
  return self->_shownFuelAlerts;
}

- (void)setShownFuelAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_shownFuelAlerts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shownFuelAlerts, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
}

@end
