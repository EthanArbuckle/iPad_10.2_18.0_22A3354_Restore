@implementation UIApplication

+ (id)sharedMapsDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return v3;
}

- (BOOL)screenIsLocked
{
  uint64_t v2;
  __int16 v4;

  v4 = 0;
  v2 = SBSSpringBoardServerPort(self, a2);
  if (SBGetScreenLockStatus(v2, (char *)&v4 + 1, &v4))
    NSLog(CFSTR("Can't determine device lock state"));
  return HIBYTE(v4) != 0;
}

- (void)getCanCallPhoneNumber:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10051A8D8;
    v10[3] = &unk_1011AE240;
    v11 = v5;
    v12 = v7;
    dispatch_async(v9, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)callPhoneNumber:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)TUCallProviderManager);
  v8 = objc_alloc((Class)TUDialRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultProvider"));
  v10 = objc_msgSend(v8, "initWithProvider:", v9);

  v11 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", 2, v6);
  objc_msgSend(v10, "setHandle:", v11);
  objc_msgSend(v10, "setShowUIPrompt:", 0);
  v12 = objc_msgSend(objc_alloc((Class)TUCallCenter), "initWithQueue:", 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10051ABC0;
  v14[3] = &unk_1011AE218;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v12, "launchAppForDialRequest:completion:", v10, v14);

}

- (void)_maps_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, id);
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v7 = (void (**)(id, id))a5;
  if (a3)
  {
    v8 = a4;
    v9 = a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v12 = 0;
    v11 = objc_msgSend(v10, "openSensitiveURL:withOptions:error:", v9, v8, &v12);

    if (v7)
      v7[2](v7, v11);
  }

}

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

- (void)_maps_openAppStoreForAdamId:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v9, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("itms-appss://apps.apple.com/app/id"), v9));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    -[UIApplication _maps_openURL:options:completionHandler:](self, "_maps_openURL:options:completionHandler:", v8, 0, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)__mapsEventRecorder_sendEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIApplication __mapsEventRecorder_sendEvent:](self, "__mapsEventRecorder_sendEvent:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MapsEventRecorder defaultRecorder](MapsEventRecorder, "defaultRecorder"));
  objc_msgSend(v5, "recordEvent:", v4);

}

+ (id)_maps_keyMapsWindowScene
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(UIWindowScene);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;
          if (objc_msgSend(v11, "_isKeyWindowScene"))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
            v13 = objc_opt_class(MapsSceneDelegate);
            isKindOfClass = objc_opt_isKindOfClass(v12, v13);

            if ((isKindOfClass & 1) != 0)
            {
              v15 = v11;

              v6 = v15;
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_maps_keyMapsWindow
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsWindowScene](UIApplication, "_maps_keyMapsWindowScene", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windows"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isKeyWindow"))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_maps_lockScreenSceneDelegate
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(UIWindowScene);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
          v13 = objc_opt_class(LockScreenSceneDelegate);
          isKindOfClass = objc_opt_isKindOfClass(v12, v13);

          if ((isKindOfClass & 1) != 0)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));

            v6 = (void *)v15;
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_maps_keyMapsSceneDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsWindowScene](UIApplication, "_maps_keyMapsWindowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return v3;
}

+ (BOOL)_maps_isAnySceneConnectedForRole:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "session"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "role"));
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (BOOL)_maps_isAnySceneForegroundForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedScenes"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(a1, "_maps_shouldIgnoreActivationStateForScene:", v11) & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "role"));
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            if ((unint64_t)objc_msgSend(v11, "activationState") < 2)
            {
              v15 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (BOOL)_maps_shouldIgnoreActivationStateForScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role")),
        v7 = objc_msgSend(v6, "isEqualToString:", BNWindowSceneSessionRoleBannerSource),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    v11 = objc_opt_class(CarSceneDelegate);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    if ((isKindOfClass & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
      v8 = objc_msgSend(v13, "shouldIgnoreActivationStateForBanner");

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)_maps_isCarPlayApplicationScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  BOOL v9;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate")),
        v6 = objc_opt_class(CarSceneDelegate),
        isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    v9 = objc_msgSend(v8, "sceneType") == (id)1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_maps_isCarPlayWidgetScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  unint64_t v9;
  unsigned int v10;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate")),
        v6 = objc_opt_class(CarSceneDelegate),
        isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    v9 = (unint64_t)objc_msgSend(v8, "sceneType");
    v10 = (v9 < 8) & (0xFDu >> v9);

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)_maps_isAnyApplicationOrCarPlayApplicationSceneConnected
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "role"));
        v12 = objc_msgSend(v11, "isEqualToString:", UIWindowSceneSessionRoleApplication);

        if ((v12 & 1) != 0
          || objc_msgSend(v9, "isCarScene")
          && (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v9) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

+ (BOOL)_maps_isAnyApplicationOrCarPlayApplicationSceneForeground
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v9, "activationState") <= 1)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "role"));
          v12 = objc_msgSend(v11, "isEqualToString:", UIWindowSceneSessionRoleApplication);

          if ((v12 & 1) != 0
            || objc_msgSend(v9, "isCarScene")
            && (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v9) & 1) != 0)
          {
            v13 = 1;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (BOOL)_maps_isAnyCarPlayApplicationSceneForeground
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v9, "activationState") <= 1
          && objc_msgSend(v9, "isCarScene")
          && (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v9) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

+ (BOOL)_maps_isAnySceneForeground
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "activationState") < 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (id)_maps_applicationScenes
{
  NSMutableArray *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "role"));
        v12 = objc_msgSend(v11, "isEqualToString:", UIWindowSceneSessionRoleApplication);

        if (v12)
          -[NSMutableArray addObject:](v2, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v2;
}

+ (unint64_t)_maps_numberOfApplicationScenes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_applicationScenes"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

+ (id)_maps_carPlayScenes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isCarScene"))
        {
          v10 = objc_opt_class(UIWindowScene);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
            v12 = objc_opt_class(CarSceneDelegate);
            isKindOfClass = objc_opt_isKindOfClass(v11, v12);

            if ((isKindOfClass & 1) != 0)
              objc_msgSend(v2, "addObject:", v9);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v2;
}

+ (id)_maps_carPlayApplicationSceneDelegate
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_carPlayScenes", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v8) & 1) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (void)_mapsCarPlay_connectApplicationSceneIfNeededForSession:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  uint8_t buf[16];

  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "role"));
  if (objc_msgSend(v7, "isEqualToString:", _UIWindowSceneSessionRoleCarPlay))
  {
    v8 = +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", UIWindowSceneSessionRoleApplication);

    if ((v8 & 1) == 0)
    {
      v9 = sub_100431A4C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Connecting Maps Application scene before handling CarPlay URL or user activity", buf, 2u);
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1007B7030;
      v11[3] = &unk_1011AE218;
      v12 = v6;
      objc_msgSend(a1, "_maps_openApplicationSceneSuspendedWithCompletion:", v11);

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v6)
    v6[2](v6);
LABEL_9:

}

+ (void)_maps_openApplicationSceneSuspendedWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v10 = FBSOpenApplicationOptionKeyActivateSuspended;
  v11 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v5));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007B71A8;
  v8[3] = &unk_1011BCA78;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.Maps"), v6, v8);

}

+ (void)_maps_unlockApplicationWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v14 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v15 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v5));

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = CFSTR("com.apple.Maps");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will attempt to open Maps application with bundle identifier (%@) for prompt to unlock", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007B7348;
  v10[3] = &unk_1011BCA78;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.Maps"), v6, v10);

}

+ (id)_maps_sceneForIdentifierString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_sceneIdentifier"));
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)_maps_sceneDelegateForIdentifierString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_sceneForIdentifierString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = objc_opt_class(MapsSceneDelegate);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  else
    v7 = 0;

  return v7;
}

@end
