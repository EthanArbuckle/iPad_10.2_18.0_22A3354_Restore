@implementation MapsApp

- (void)userDefaultsDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", off_1014B1450, self);

}

- (id)_keyWindowForScreen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "_userInterfaceIdiom") == (id)3)
  {
    if (objc_msgSend((id)objc_opt_class(self), "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionRoleCarPlay))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeCarPlayBannerViewController"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

      if (v10)
      {
        v6 = v10;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));

      }
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MapsApp;
    v7 = -[MapsApp _keyWindowForScreen:](&v13, "_keyWindowForScreen:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (void)_maps_callPhoneNumber:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc_init((Class)TUCallProviderManager);
    v8 = objc_alloc((Class)TUDialRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultProvider"));
    v10 = objc_msgSend(v8, "initWithProvider:", v9);

    v11 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", 2, v5);
    objc_msgSend(v10, "setHandle:", v11);
    objc_msgSend(v10, "setShowUIPrompt:", 0);
    v12 = objc_msgSend(objc_alloc((Class)TUCallCenter), "initWithQueue:", 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10075FF18;
    v13[3] = &unk_1011AE218;
    v14 = v6;
    objc_msgSend(v12, "launchAppForDialRequest:completion:", v10, v13);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

@end
