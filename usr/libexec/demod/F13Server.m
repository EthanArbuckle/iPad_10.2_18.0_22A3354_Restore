@implementation F13Server

+ (id)sharedInstance
{
  if (qword_100175158 != -1)
    dispatch_once(&qword_100175158, &stru_10013D7F0);
  return (id)qword_100175150;
}

- (F13Server)init
{
  F13Server *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)F13Server;
  v2 = -[F13Server init](&v10, "init");
  if (v2)
  {
    v3 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing F13Server", v9, 2u);
    }

    -[F13Server setAppInstallationInProgress:](v2, "setAppInstallationInProgress:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    -[F13Server setWorkspace:](v2, "setWorkspace:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[F13Server setPOSDevice:](v2, "setPOSDevice:", objc_msgSend(v6, "isVerifiedPOSDevice"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[F13Server workspace](v2, "workspace"));
    objc_msgSend(v7, "addObserver:", v2);

    -[F13Server findExtension](v2, "findExtension");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[F13Server workspace](self, "workspace"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)F13Server;
  -[F13Server dealloc](&v4, "dealloc");
}

- (id)effectiveAppIdentifiers
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc_init((Class)NSMutableArray);
  if (-[F13Server isPOSDevice](self, "isPOSDevice"))
  {
    v4 = CFSTR("com.apple.ist.pierogi");
  }
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("com.retailtech.arkenstone"));
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.ist.windward"));
    v4 = CFSTR("com.apple.ist.DemoDiscoveryApp");
  }
  objc_msgSend(v3, "addObject:", v4);
  return v3;
}

- (id)effectiveExtensionIdentifiers
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc_init((Class)NSMutableArray);
  if (-[F13Server isPOSDevice](self, "isPOSDevice"))
  {
    v4 = CFSTR("com.apple.ist.pierogi.potato");
  }
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("com.retailtech.arkenstone.extension"));
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.ist.windward.Arizona"));
    v4 = CFSTR("com.apple.ist.DemoDiscoveryApp.Extension");
  }
  objc_msgSend(v3, "addObject:", v4);
  return v3;
}

- (id)effectiveExtensionAttributes
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[F13Server isPOSDevice](self, "isPOSDevice");
  v5 = NSExtensionIdentifierName;
  if (v4)
  {
    v21[0] = NSExtensionIdentifierName;
    v22[0] = CFSTR("com.apple.ist.pierogi.potato");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ENTITLEMENT:%@"), CFSTR("com.apple.ist.pierogi.potato")));
    v21[1] = v6;
    v22[1] = &__kCFBooleanTrue;
    v7 = v22;
    v8 = v21;
  }
  else
  {
    v19[0] = NSExtensionIdentifierName;
    v20[0] = CFSTR("com.retailtech.arkenstone.extension");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ENTITLEMENT:%@"), CFSTR("com.retailtech.arkenstone.extension")));
    v19[1] = v9;
    v20[1] = &__kCFBooleanTrue;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    objc_msgSend(v3, "addObject:", v10);

    v17[0] = v5;
    v18[0] = CFSTR("com.apple.ist.windward.Arizona");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ENTITLEMENT:%@"), CFSTR("com.apple.ist.windward.Arizona")));
    v17[1] = v11;
    v18[1] = &__kCFBooleanTrue;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    objc_msgSend(v3, "addObject:", v12);

    v16[0] = CFSTR("com.apple.ist.DemoDiscoveryApp.Extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ENTITLEMENT:%@"), CFSTR("com.apple.ist.DemoDiscoveryApp.Extension"), v5));
    v15[1] = v6;
    v16[1] = &__kCFBooleanTrue;
    v7 = v16;
    v8 = v15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v8, 2));
  objc_msgSend(v3, "addObject:", v13);

  return v3;
}

- (void)findExtension
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finding extension...", (uint8_t *)&v7, 2u);
  }

  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543874;
    v8 = CFSTR("com.retailtech.arkenstone.extension");
    v9 = 2114;
    v10 = CFSTR("com.apple.ist.windward.Arizona");
    v11 = 2114;
    v12 = CFSTR("com.apple.ist.DemoDiscoveryApp.Extension");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"ENTITLEMENT:%{public}@\" OR \"ENTITLEMENT:%{public}@\" OR \"ENTITLEMENT:%{public}@\", (uint8_t *)&v7, 0x20u);
  }

  -[F13Server verifyExtensionIsRunning](self, "verifyExtensionIsRunning");
  -[F13Server matchExtension](self, "matchExtension");
}

- (void)matchExtension
{
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  NSObject *v27;
  _BYTE v28[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[F13Server effectiveExtensionAttributes](self, "effectiveExtensionAttributes"));
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = *(NSObject **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v8 = sub_1000604F0();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "F13Server: Matching extension: %{public}@", buf, 0xCu);
        }

        v21 = 0;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension extensionsWithMatchingAttributes:error:](NSExtension, "extensionsWithMatchingAttributes:error:", v7, &v21));
        v11 = v21;
        if (!v11 && objc_msgSend(v10, "count"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
          -[F13Server setExtension:](self, "setExtension:", v16);

          v17 = sub_1000604F0();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "F13Server: Found extension!", buf, 2u);
          }

          v19 = (void *)os_transaction_create("Launching F13 extension");
          -[F13Server setTransaction:](self, "setTransaction:", v19);

          v15 = v2;
          goto LABEL_19;
        }
        v12 = sub_1000604F0();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "F13Server: Error matching extension: %{public}@", buf, 0xCu);
        }

      }
      v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v4)
        continue;
      break;
    }
  }

  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v2;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "F13Server: Failed to match extensions in: %{public}@", buf, 0xCu);
  }
LABEL_19:

}

- (void)verifyExtensionIsRunning
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 5000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005614;
  v3[3] = &unk_10013D840;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)resetExtension
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059B8;
  block[3] = &unk_10013D868;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)windwardAppInstallationStarted
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "F13Server: killing extension...", v5, 2u);
  }

  -[F13Server resetExtension](self, "resetExtension");
  -[F13Server setAppInstallationInProgress:](self, "setAppInstallationInProgress:", 1);
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  F13Server *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v21 = *(_QWORD *)v28;
    v22 = self;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[F13Server effectiveAppIdentifiers](self, "effectiveAppIdentifiers", v21));
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
              LODWORD(v16) = objc_msgSend(v17, "isEqualToString:", v16);

              if ((_DWORD)v16)
              {
                v18 = sub_1000604F0();
                v19 = objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
                  *(_DWORD *)buf = 138543362;
                  v32 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "F13Server: New %{public}@ app installation started, killing extension...", buf, 0xCu);

                }
                -[F13Server windwardAppInstallationStarted](v22, "windwardAppInstallationStarted");

                goto LABEL_20;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
            if (v13)
              continue;
            break;
          }
        }

        v7 = v21;
        self = v22;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v6);
  }
LABEL_20:

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  F13Server *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v21 = *(_QWORD *)v28;
    v22 = self;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[F13Server effectiveAppIdentifiers](self, "effectiveAppIdentifiers", v21));
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
              LODWORD(v16) = objc_msgSend(v17, "isEqualToString:", v16);

              if ((_DWORD)v16)
              {
                v18 = sub_1000604F0();
                v19 = objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
                  *(_DWORD *)buf = 138543362;
                  v32 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "F13Server: %{public}@ app installation finished", buf, 0xCu);

                }
                -[F13Server setAppInstallationInProgress:](v22, "setAppInstallationInProgress:", 0);
                -[F13Server matchExtension](v22, "matchExtension");

                goto LABEL_20;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
            if (v13)
              continue;
            break;
          }
        }

        v7 = v21;
        self = v22;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v6);
  }
LABEL_20:

}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (NSCopying)extensionContextIdentifier
{
  return self->_extensionContextIdentifier;
}

- (void)setExtensionContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContextIdentifier, a3);
}

- (BOOL)appInstallationInProgress
{
  return self->_appInstallationInProgress;
}

- (void)setAppInstallationInProgress:(BOOL)a3
{
  self->_appInstallationInProgress = a3;
}

- (BOOL)isPOSDevice
{
  return self->_POSDevice;
}

- (void)setPOSDevice:(BOOL)a3
{
  self->_POSDevice = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_extensionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
