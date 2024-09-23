@implementation SUAlertPresentationManager

+ (SUAlertPresentationManager)sharedInstance
{
  if (sharedInstance___once_1 != -1)
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_8);
  return (SUAlertPresentationManager *)(id)sharedInstance___instance_3;
}

void __44__SUAlertPresentationManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = v0;

}

- (SUAlertPresentationManager)init
{
  SUAlertPresentationManager *v2;
  uint64_t v3;
  NSMutableArray *alerts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUAlertPresentationManager;
  v2 = -[SUAlertPresentationManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    alerts = v2->_alerts;
    v2->_alerts = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)_presentedAlerts
{
  SUAlertPresentationManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2->_alerts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)_presentedAlertsOfClass:(Class)a3
{
  SUAlertPresentationManager *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3->_alerts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v9, (_QWORD)v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v3);
  return v4;
}

- (BOOL)_presentAlert:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SUAlertPresentationManager *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  SULogAlerts();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v6, CFSTR("[Alerts] Presenting alert: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = self;
  objc_sync_enter(v13);
  v14 = objc_msgSend(v5, "present");
  if (v14)
  {
    if ((-[NSMutableArray containsObject:](v13->_alerts, "containsObject:", v5) & 1) == 0)
      -[NSMutableArray addObject:](v13->_alerts, "addObject:", v5);
  }
  else
  {
    SULogAlerts();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v15, CFSTR("[Alerts] Failed presenting alert: %@"), v16, v17, v18, v19, v20, v21, (uint64_t)v5);

  }
  objc_sync_exit(v13);

  return v14;
}

- (void)_dismissAlert:(id)a3 animated:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  SULogAlerts();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v4, CFSTR("[Alerts] Dismissing alert: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v11);

  objc_msgSend(v11, "dismiss");
}

- (void)_dismissAlertsOfClass:(Class)a3 animated:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SUAlertPresentationManager *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  SULogAlerts();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v6, CFSTR("[Alerts] Dismissing alerts of class: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)a3);

  v13 = self;
  objc_sync_enter(v13);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v13->_alerts;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v18, "dismiss");
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)_dismissAllAlertsExcludingClasses:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SUAlertPresentationManager *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SUAlertPresentationManager *obj;
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
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SULogAlerts();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v6, CFSTR("[Alerts] Dismissing all alerts excluding classes: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = self;
  objc_sync_enter(v13);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v13;
  v14 = v13->_alerts;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v19 = v5;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v25;
          while (2)
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v19);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {

                goto LABEL_16;
              }
              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v20)
              continue;
            break;
          }
        }

        objc_msgSend(v18, "dismiss");
LABEL_16:
        ++v17;
      }
      while (v17 != v15);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v15);
  }

  objc_sync_exit(obj);
}

- (void)_updateAlert:(id)a3 animated:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  SULogAlerts();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v4, CFSTR("[Alerts] Updating alert: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v11);

  objc_msgSend(v11, "update");
}

- (void)_updateAllAlertLockState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  SUAlertPresentationManager *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  SULogAlerts();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  v13 = CFSTR("NO");
  if (v3)
    v13 = CFSTR("YES");
  SULogInfoForSubsystem(v5, CFSTR("[Alerts] Updating alert lock state to isUILocked: %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v13);

  v14 = self;
  objc_sync_enter(v14);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v14->_alerts;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v19, "setIsUILocked:", v3);
        objc_msgSend(v19, "update");
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  objc_sync_exit(v14);
}

- (BOOL)isPresentingAlertsOfClass:(Class)a3
{
  void *v3;
  BOOL v4;

  -[SUAlertPresentationManager presentedAlertsOfClass:](self, "presentedAlertsOfClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)dismissAllAlertsAnimated:(BOOL)a3
{
  -[SUAlertPresentationManager _dismissAllAlertsExcludingClasses:animated:](self, "_dismissAllAlertsExcludingClasses:animated:", 0, a3);
}

- (void)_noteAlertDeactivated:(id)a3
{
  SUAlertPresentationManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_alerts, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alerts, 0);
}

@end
