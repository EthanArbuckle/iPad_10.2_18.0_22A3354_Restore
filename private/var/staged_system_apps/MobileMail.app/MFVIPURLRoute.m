@implementation MFVIPURLRoute

- (MFVIPURLRoute)initWithScene:(id)a3
{
  id v4;
  MFVIPURLRoute *v5;
  MFVIPURLRoute *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFVIPURLRoute;
  v5 = -[MFVIPURLRoute init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v6->_priority = 0;
  }

  return v6;
}

- (BOOL)canRouteRequest:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  if ((objc_msgSend(v3, "ef_hasScheme:", EMAppleMailShowVIPMessagesURLScheme) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "ef_hasScheme:", EMAppleMailShowVIPSettingsURLScheme);

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  MFVIPURLRoute *v23;
  id v24;
  uint8_t buf[24];
  NSErrorUserInfoKey v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  if (objc_msgSend(v6, "ef_hasScheme:", EMAppleMailShowVIPMessagesURLScheme))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001C9B00;
    v21[3] = &unk_10051A960;
    v22 = v5;
    v23 = self;
    v24 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v7, "performBlock:", v21);

  }
  else if (objc_msgSend(v6, "ef_hasScheme:", EMAppleMailShowVIPSettingsURLScheme))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001C9B7C;
    v19[3] = &unk_10051A910;
    v19[4] = self;
    v20 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v8, "performBlock:", v19);

  }
  else
  {
    v26 = NSURLErrorKey;
    v27 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1000, v9));

    objc_msgSend(v5, "finishWithError:", v10);
    v11 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100394FEC(v12, buf, v11);
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C9C1C;
  v17[3] = &unk_100521AC0;
  v14 = v4;
  v18 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recover:", v17));

  return v15;
}

- (id)_routeVIPMessagesURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v18;
  id v19;
  NSErrorUserInfoKey v20;
  id v21;
  NSErrorUserInfoKey v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPURLRoute scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vipManager"));

  if ((objc_msgSend(v7, "hasVIPs") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceSpecifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("/")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_stringByTrimmingLeadingCharactersInSet:", v9));

    if (objc_msgSend(v10, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vipWithIdentifier:", v10));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForVIP:selected:](FavoriteItem, "itemForVIP:selected:", v11, 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxPickerController"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "favoriteItemSelectionTarget"));
        objc_msgSend(v14, "selectVIPMailboxWithItem:animated:", v12, 0);

        v15 = 0;
      }
      else
      {
        v18 = NSURLErrorKey;
        v19 = v4;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1008, v16));

      }
    }
    else
    {
      v20 = NSURLErrorKey;
      v21 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1000, v11));
    }

  }
  else
  {
    v22 = NSURLErrorKey;
    v23 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1008, v10));
  }

  return v15;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (int64_t)priority
{
  return self->_priority;
}

- (DaemonInterfaceProviding)scene
{
  return (DaemonInterfaceProviding *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
