@implementation DMDiphoneOSAppLifeCycle

- (DMDiphoneOSAppLifeCycle)initWithBundleIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  id v36;
  void *v37;
  id v38;
  DMDiphoneOSAppLifeCycle *v39;
  uint64_t v40;
  NSProgress *proxyProgress;
  void *v42;
  uint64_t v44;
  void *v45;
  objc_super v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;

  v3 = a3;
  v5 = DMFAppLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initialize app life cycle with bundle identifier: %{public}@", buf, 0xCu);
  }

  v48 = 0;
  v7 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v48);
  v8 = v48;
  v10 = v8;
  if (!v7)
  {
    v11 = DMFAppLog(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10007248C((uint64_t)v3, (uint64_t)v10, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "compatibilityObject"));
  v15 = v13;
  if (v7 && v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appState"));
    v17 = objc_msgSend(v16, "isInstalled");

    v18 = (unint64_t)objc_msgSend(v15, "installType");
    if (v18 > 0xA)
    {
LABEL_25:
      v22 = 0;
    }
    else if (((1 << v18) & 0x45E) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "installProgress"));
      v21 = objc_msgSend(v20, "installState");

      switch((unint64_t)v21)
      {
        case 0uLL:
          if (v17)
            v22 = 5;
          else
            v22 = 1;
          break;
        case 1uLL:
          v28 = v17 == 0;
          v29 = 2;
          v30 = 6;
          goto LABEL_31;
        case 2uLL:
          v28 = v17 == 0;
          v29 = 3;
          v30 = 7;
LABEL_31:
          if (v28)
            v22 = v29;
          else
            v22 = v30;
          break;
        case 3uLL:
        case 4uLL:
          if (v17)
            v22 = 4;
          else
            v22 = 0;
          break;
        case 5uLL:
          v22 = 4;
          break;
        default:
          goto LABEL_25;
      }
    }
    else
    {
      v26 = 4;
      if (!v17)
        v26 = 0;
      v27 = 6;
      if (v18 != 5)
        v27 = 0;
      if (v18)
        v22 = v27;
      else
        v22 = v26;
    }
    v31 = DMFAppLog(v18, v19);
    v24 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", v22));
      if (v17)
        v33 = CFSTR("YES");
      else
        v33 = CFSTR("NO");
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appState", v33));
      v34 = v10;
      if (objc_msgSend(v45, "isPlaceholder"))
        v35 = CFSTR("YES");
      else
        v35 = CFSTR("NO");
      v36 = objc_msgSend(v15, "installType");
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "installProgress"));
      v38 = objc_msgSend(v37, "installState");
      *(_DWORD *)buf = 138544642;
      v50 = v3;
      v51 = 2114;
      v52 = v32;
      v53 = 2114;
      v54 = v44;
      v55 = 2114;
      v56 = v35;
      v10 = v34;
      v57 = 2048;
      v58 = v36;
      v59 = 2048;
      v60 = v38;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "App lifecycle for %{public}@\n\tcalculated install state:%{public}@\n\tis installed: %{public}@\n\tis placeholder: %{public}@\n\tinstall type: %lu\n\tinstall progress install state: %lu", buf, 0x3Eu);

    }
  }
  else
  {
    v23 = DMFAppLog(v13, v14);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 0));
      *(_DWORD *)buf = 138543618;
      v50 = v3;
      v51 = 2114;
      v52 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "App lifecycle for %{public}@ (no proxy)\n\tassumed install state:%{public}@", buf, 0x16u);

    }
    v22 = 0;
  }

  v47.receiver = self;
  v47.super_class = (Class)DMDiphoneOSAppLifeCycle;
  v39 = -[DMDAppLifeCycle initWithBundleIdentifier:currentState:](&v47, "initWithBundleIdentifier:currentState:", v3, v22);
  if (v39)
  {
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "installProgress"));
    proxyProgress = v39->_proxyProgress;
    v39->_proxyProgress = (NSProgress *)v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v42, "addObserver:", v39);

  }
  return v39;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DMDiphoneOSAppLifeCycle;
  -[DMDiphoneOSAppLifeCycle dealloc](&v4, "dealloc");
}

- (id)progress
{
  return -[DMDiphoneOSAppLifeCycle proxyProgress](self, "proxyProgress");
}

- (void)applicationsWillInstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022318;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidStart:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022538;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022974;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidPause:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022B98;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidResume:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022DBC;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022FE0;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidFailToInstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002320C;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidInstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023524;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsWillUninstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002391C;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023BC0;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidUninstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023D5C;
  v3[3] = &unk_1000BA4D8;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)_findProxyInProxies:(id)a3 andCallBlock:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppLifeCycle+iphoneOS.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle bundleIdentifier](self, "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v17)
        {
          v8[2](v8, v14);
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

}

- (NSProgress)proxyProgress
{
  return self->_proxyProgress;
}

- (void)setProxyProgress:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProgress, 0);
}

@end
