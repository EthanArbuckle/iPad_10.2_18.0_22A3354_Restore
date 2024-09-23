@implementation MusicStoreFlowServiceViewController

- (MusicStoreFlowServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MusicStoreFlowServiceViewController *v4;
  MusicStoreFlowServiceViewController *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MusicStoreFlowServiceViewController;
  v4 = -[MusicStoreFlowServiceViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    do
    {
      v6 = __ldaxr(&qword_100011BC8);
      v7 = v6 + 1;
    }
    while (__stlxr(v7, &qword_100011BC8));
    v4->_instanceIndex = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
    objc_msgSend(v8, "registerStoreFlowServiceViewController:", v5);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
  objc_msgSend(v3, "unregisterStoreFlowServiceViewController:", self);

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowServiceViewController;
  -[MusicStoreFlowServiceViewController dealloc](&v4, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MusicStoreFlowServiceViewController)initWithCoder:(id)a3
{
  id v4;
  MusicStoreFlowServiceViewController *v5;
  id v6;
  uint64_t v7;
  SUStorePageViewController *storePageViewController;
  id v9;
  uint64_t v10;
  SKCloudServiceSetupReloadContext *activeCloudServiceSetupReloadContext;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicStoreFlowServiceViewController;
  v5 = -[MusicStoreFlowServiceViewController initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    v5->_instanceIndex = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MusicStoreFlowServiceInstanceIndex"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(SUStorePageViewController), CFSTR("MusicStoreFlowServiceStorePageViewController"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    storePageViewController = v5->_storePageViewController;
    v5->_storePageViewController = (SUStorePageViewController *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(SKCloudServiceSetupReloadContext), CFSTR("MusicStoreFlowServiceActiveCloudServiceContext"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    activeCloudServiceSetupReloadContext = v5->_activeCloudServiceSetupReloadContext;
    v5->_activeCloudServiceSetupReloadContext = (SKCloudServiceSetupReloadContext *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicStoreFlowServiceViewController;
  v4 = a3;
  -[MusicStoreFlowServiceViewController encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_instanceIndex, CFSTR("MusicStoreFlowServiceInstanceIndex"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_storePageViewController, CFSTR("MusicStoreFlowServiceStorePageViewController"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activeCloudServiceSetupReloadContext, CFSTR("MusicStoreFlowServiceActiveCloudServiceContext"));

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p [%ld]"), v5, self, self->_instanceIndex));

  if (self->_activeCloudServiceSetupReloadContext)
    objc_msgSend(v6, "appendFormat:", CFSTR("; activeCloudServiceSetupReloadContext = %@"),
      self->_activeCloudServiceSetupReloadContext);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowServiceViewController;
  -[MusicStoreFlowServiceViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
  objc_msgSend(v3, "storeFlowServiceViewControllerDidLoad:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicStoreFlowServiceViewController;
  -[MusicStoreFlowServiceViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
  objc_msgSend(v4, "storeFlowServiceViewControllerWillAppear:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicStoreFlowServiceViewController;
  -[MusicStoreFlowServiceViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
  objc_msgSend(v4, "storeFlowServiceViewControllerDidDisappear:", self);

}

+ (id)_exportedInterface
{
  return +[SKCloudServiceSetupExtension serviceInterface](SKCloudServiceSetupExtension, "serviceInterface");
}

+ (id)_remoteViewControllerInterface
{
  return +[SKCloudServiceSetupExtension clientInterface](SKCloudServiceSetupExtension, "clientInterface");
}

- (void)applyConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
  objc_msgSend(v5, "applyCloudServiceSetupConfiguration:", v4);

  LODWORD(v5) = objc_msgSend(v4, "targetsFinanceApplication");
  if ((_DWORD)v5)
    -[MusicStoreFlowServiceViewController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 0);
}

- (void)reloadWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  objc_storeStrong((id *)&self->_activeCloudServiceSetupReloadContext, v5);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000636C;
  v8[3] = &unk_10000C4D0;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[MusicStoreFlowServiceViewController _requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:](self, "_requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)handleSafariScriptURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", SUScriptInterfaceSafariViewControllerDataUpdate, v3);

}

- (void)storeFlowScriptingClientController:(id)a3 overrideCreditCardPresentationWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "overrideCreditCardPresentationWithCompletion:", v5);

}

- (void)storeFlowScriptingClientController:(id)a3 requestsDismissingViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a4;
  v9 = a6;
  v10 = objc_msgSend((id)objc_opt_class(self), "_rootViewControllerForViewController:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend((id)objc_opt_class(self), "_rootViewControllerForViewController:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v11 == v13)
    -[MusicStoreFlowServiceViewController _dismissCloudServiceSetupViewControllerAnimated:completion:](self, "_dismissCloudServiceSetupViewControllerAnimated:completion:", v7, v9);
  else
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", v7, v9);

}

- (BOOL)storeFlowScriptingClientController:(id)a3 requestsPresentingViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  MusicStoreFlowServiceViewController *v7;
  uint64_t v8;
  void *v9;
  MusicStoreFlowServiceViewController *v10;

  v6 = a4;
  v7 = self;
  v8 = objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController presentedViewController](v7, "presentedViewController"));
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      v10 = v9;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController presentedViewController](v10, "presentedViewController"));
      v7 = v10;
    }
    while (v9);
  }
  else
  {
    v10 = v7;
  }
  -[MusicStoreFlowServiceViewController presentViewController:animated:completion:](v10, "presentViewController:animated:completion:", v6, 1, 0);

  return 1;
}

- (void)storeFlowScriptingClientController:(id)a3 requestsDismissingSafariViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000669C;
  v10[3] = &unk_10000C4F8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "dismissSafariViewControllerAnimated:completion:", v5, v10);

}

- (void)storeFlowScriptingClientController:(id)a3 requestsPresentingSafariViewControllerWithURL:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006764;
  v13[3] = &unk_10000C4F8;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "presentSafariViewControllerWithURL:animated:completion:", v10, v6, v13);

}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  -[MusicStoreFlowServiceViewController _didFinishLoadingWithSuccess:error:](self, "_didFinishLoadingWithSuccess:error:", a4, 0);
}

+ (id)_cloudServiceSetupURLForAction:(id)a3 queryItems:(id)a4 bagDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  _BYTE v54[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", CFSTR("financeApp")));
  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    v12 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Music"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", CFSTR("FinanceApplicationScriptBaseURL")));
    if (objc_msgSend(v13, "length"))
    {
      v46 = v13;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("baseUrl")));
      v17 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v18 = v16;

        v13 = v18;
      }
      v46 = v13;

    }
    v19 = objc_alloc_init((Class)NSMutableDictionary);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("urlPath")));
    v21 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_100006C54;
      v52[3] = &unk_10000C520;
      v53 = v19;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v52);

    }
    if (v46)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v22));

      if (!v23)
        v23 = v7;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("https://finance-app.apple.com/"), v23));
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));

    }
    else
    {
      v15 = 0;
    }

    if (v15)
    {
      if (!objc_msgSend(v8, "count"))
      {
        v14 = v46;
        if (!v46)
          goto LABEL_38;
        goto LABEL_37;
      }
      v44 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v15, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "queryItems"));
      v26 = objc_msgSend(v25, "mutableCopy");
      v27 = v26;
      v45 = v15;
      if (v26)
        v28 = v26;
      else
        v28 = objc_alloc_init((Class)NSMutableArray);
      v29 = v28;

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v30 = v8;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v49 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_100006DD8;
            v47[3] = &unk_10000C548;
            v47[4] = v35;
            v36 = objc_msgSend(v29, "indexOfObjectPassingTest:", v47);
            if (v36 == (id)0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v29, "addObject:", v35);
            else
              objc_msgSend(v29, "replaceObjectAtIndex:withObject:", v36, v35);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v32);
      }

      objc_msgSend(v44, "setQueryItems:", v29);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "URL"));
      v38 = v37;
      if (v37)
      {
        v15 = v37;

        v14 = v46;
      }
      else
      {
        v14 = v46;
        v15 = v45;
      }

      if (v14)
      {
LABEL_37:
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
        v40 = objc_msgSend(v39, "mutableCopy");

        objc_msgSend(v40, "replaceCharactersInRange:withString:", 0, objc_msgSend(CFSTR("https://finance-app.apple.com/"), "length"), v14);
        v41 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v40));

        v15 = (id)v41;
      }
    }
    else
    {
      v14 = v46;
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
LABEL_38:
  v42 = v15;

  return v42;
}

+ (id)_rootViewControllerForViewController:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));
  v5 = v3;
  if (v4)
  {
    v6 = (void *)v4;
    v7 = v3;
    do
    {
      v5 = v6;

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentViewController"));
      v7 = v5;
    }
    while (v6);
  }

  return v5;
}

- (void)_didFinishLoadingWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (!v4)
    -[MusicStoreFlowServiceViewController _dismissCloudServiceSetupViewControllerAnimated:completion:](self, "_dismissCloudServiceSetupViewControllerAnimated:completion:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "didFinishLoadingWithSuccess:error:", v4, v7);

}

- (void)_dismissCloudServiceSetupViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006FC8;
    v8[3] = &unk_10000C4F8;
    v9 = v6;
    objc_msgSend(v7, "dismissCloudServiceSetupViewControllerAnimated:completion:", v4, v8);

  }
  else
  {
    -[MusicStoreFlowServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v6);
  }

}

- (void)_loadStorePageViewControllerWithCloudServiceSetupURL:(id)a3
{
  id v4;
  SUStorePageViewController *v5;
  SUStorePageViewController *storePageViewController;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  SUStorePageViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  SUStorePageViewController *v21;

  v4 = a3;
  v5 = (SUStorePageViewController *)objc_msgSend(objc_alloc((Class)SUAccountViewController), "initWithExternalAccountURL:", v4);

  storePageViewController = self->_storePageViewController;
  self->_storePageViewController = v5;

  v7 = -[SUStorePageViewController copyDefaultScriptProperties](self->_storePageViewController, "copyDefaultScriptProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUGradient gradientWithColor:](SUGradient, "gradientWithColor:", v9));
  objc_msgSend(v7, "setPlaceholderBackgroundGradient:", v10);

  objc_msgSend(v7, "setShouldLoadProgressively:", 0);
  objc_msgSend(v7, "setShouldShowFormAccessory:", 1);
  -[SUStorePageViewController setScriptProperties:](self->_storePageViewController, "setScriptProperties:", v7);
  v11 = objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext sourceApplicationBundleIdentifier](self->_activeCloudServiceSetupReloadContext, "sourceApplicationBundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext referrerURL](self->_activeCloudServiceSetupReloadContext, "referrerURL"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));

  if (v11 | v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUStorePageViewController URLRequestProperties](self->_storePageViewController, "URLRequestProperties"));
    v15 = objc_msgSend(v14, "mutableCopy");

    if (v11)
      objc_msgSend(v15, "setValue:forHTTPHeaderField:", v11, CFSTR("ref-user-agent"));
    if (v13)
      objc_msgSend(v15, "setValue:forHTTPHeaderField:", v13, CFSTR("referer"));
    -[SUStorePageViewController setURLRequestProperties:](self->_storePageViewController, "setURLRequestProperties:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext serializedUserInfo](self->_activeCloudServiceSetupReloadContext, "serializedUserInfo"));
  if (v16)
    -[SUStorePageViewController setScriptUserInfo:](self->_storePageViewController, "setScriptUserInfo:", v16);
  -[SUStorePageViewController setCanMoveToOverlay:](self->_storePageViewController, "setCanMoveToOverlay:", 0);
  v17 = self->_storePageViewController;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MusicStoreFlowScriptingClientController sharedScriptingClientController](MusicStoreFlowScriptingClientController, "sharedScriptingClientController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "clientInterface"));
  -[SUStorePageViewController setClientInterface:](v17, "setClientInterface:", v19);

  v21 = self->_storePageViewController;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  -[MusicStoreFlowServiceViewController setViewControllers:](self, "setViewControllers:", v20);

}

- (void)_reloadWithCloudServiceSetupURL:(id)a3 forReloadContext:(id)a4
{
  SKCloudServiceSetupReloadContext *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (SKCloudServiceSetupReloadContext *)a4;
  if (self->_activeCloudServiceSetupReloadContext == v6)
  {
    if (self->_storePageViewController)
    {
      v7 = objc_alloc_init((Class)SUWebScriptReloadContext);
      objc_msgSend(v7, "setURL:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext sourceApplicationBundleIdentifier](self->_activeCloudServiceSetupReloadContext, "sourceApplicationBundleIdentifier"));
      objc_msgSend(v7, "setReferringUserAgent:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext referrerURL](self->_activeCloudServiceSetupReloadContext, "referrerURL"));
      objc_msgSend(v7, "setReferrerURL:", v9);

      -[SUStorePageViewController requestWebScriptReloadWithContext:](self->_storePageViewController, "requestWebScriptReloadWithContext:", v7);
    }
    else
    {
      -[MusicStoreFlowServiceViewController _loadStorePageViewControllerWithCloudServiceSetupURL:](self, "_loadStorePageViewControllerWithCloudServiceSetupURL:", v10);
    }
    if ((-[SUStorePageViewController isSkLoaded](self->_storePageViewController, "isSkLoaded") & 1) == 0
      && (-[SUStorePageViewController isSkLoading](self->_storePageViewController, "isSkLoading") & 1) == 0)
    {
      -[SUStorePageViewController _reloadForAppearance:](self->_storePageViewController, "_reloadForAppearance:", 0);
    }
  }

}

- (void)_requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  SKCloudServiceSetupReloadContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  SKCloudServiceSetupReloadContext *v14;
  void (**v15)(id, void *, _QWORD);
  id v16;
  id location;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = self->_activeCloudServiceSetupReloadContext;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext cloudServiceSetupURL](v5, "cloudServiceSetupURL"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext cloudServiceSetupURL](v5, "cloudServiceSetupURL"));
    v4[2](v4, v7, 0);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKCloudServiceSetupReloadContext action](v5, "action"));
    if (v8)
    {
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagLoadingController sharedBagLoadingController](ISURLBagLoadingController, "sharedBagLoadingController"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000075B8;
      v12[3] = &unk_10000C598;
      objc_copyWeak(&v16, &location);
      v13 = v8;
      v14 = v5;
      v15 = v4;
      objc_msgSend(v9, "requestAccessToBagUsingBlock:", v12);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v18 = NSLocalizedDescriptionKey;
      v19 = CFSTR("Cloud service setup reload context needs to have at least a URL or an action.");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 0, v10));
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCloudServiceSetupReloadContext, 0);
  objc_storeStrong((id *)&self->_storePageViewController, 0);
}

@end
