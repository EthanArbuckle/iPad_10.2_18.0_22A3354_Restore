@implementation MFMailboxURLRoute

- (MFMailboxURLRoute)initWithScene:(id)a3
{
  id v4;
  MFMailboxURLRoute *v5;
  MFMailboxURLRoute *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMailboxURLRoute;
  v5 = -[MFMailboxURLRoute init](&v8, "init");
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
  v4 = objc_msgSend(v3, "ef_hasScheme:", EMAppleMailboxURLScheme);

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v5, 0));
  if (-[MFMailboxURLRoute _isCombinedMailboxURL:](self, "_isCombinedMailboxURL:", v7))
    -[MFMailboxURLRoute _routeToCombinedMailbox:promise:](self, "_routeToCombinedMailbox:promise:", v4, v6);
  else
    -[MFMailboxURLRoute _routeToAccountMailbox:promise:](self, "_routeToAccountMailbox:promise:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "future"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016B968;
  v12[3] = &unk_10051B140;
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "addFailureBlock:", v12);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "future"));
  return v10;
}

- (id)_mailboxFromEmailAddress:(id)a3 mailboxPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxURLRoute scene](self, "scene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemonInterface"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountRepository"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "receivingAccounts"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10016BC70;
  v28[3] = &unk_1005213E8;
  v12 = v6;
  v29 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_firstObjectPassingTest:", v28));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("/")))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 1));

    v7 = (id)v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "representedObjectID"));

  if (!v13 || !v16)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1003942BC();
    goto LABEL_14;
  }
  v17 = objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v16));
  v18 = v17;
  if (!v17)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100394228((uint64_t)v16, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_13;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mailboxUidForRelativePath:create:](v17, "mailboxUidForRelativePath:create:", v7, 0));
  if (!v19)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100394290();
LABEL_13:

LABEL_14:
    v19 = 0;
  }

  return v19;
}

- (BOOL)_isCombinedMailboxURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));
  v7 = 0;
  if (!v6 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxURLRoute _combinedMailboxes](self, "_combinedMailboxes"));
    v7 = objc_msgSend(v8, "containsObject:", v5);

  }
  return v7;
}

- (void)_routeToCombinedMailbox:(id)a3 promise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v8, 0));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10016BEE0;
  v13[3] = &unk_10051A960;
  v13[4] = self;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "host"));
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v12, "performBlock:", v13);

}

- (void)_routeToAccountMailbox:(id)a3 promise:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  NSErrorUserInfoKey v30;
  void *v31;
  NSErrorUserInfoKey v32;
  void *v33;

  v6 = a3;
  v26 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v7, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@@%@"), v9, v10));

  v12 = objc_msgSend(objc_alloc((Class)ECEmailAddress), "initWithString:", v11);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxURLRoute _mailboxFromEmailAddress:mailboxPath:](self, "_mailboxFromEmailAddress:mailboxPath:", v12, v13));

    if (v14)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10016C424;
      v27[3] = &unk_10051A960;
      v27[4] = self;
      v15 = v14;
      v28 = v15;
      v29 = v26;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      objc_msgSend(v16, "performBlock:", v27);

      v14 = v15;
    }
    else
    {
      v32 = NSURLErrorKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
      v33 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1000, v22));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:](NSError, "mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:", v23, v6, 0));
      objc_msgSend(v26, "finishWithError:", v24);

      v25 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100394314();

    }
  }
  else
  {
    v30 = NSURLErrorKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
    v31 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1000, v18));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:](NSError, "mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:", v14, v6, 0));
    objc_msgSend(v26, "finishWithError:", v19);

    v20 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1003942E8();

  }
}

- (id)_combinedMailboxes
{
  if (qword_1005AA190 != -1)
    dispatch_once(&qword_1005AA190, &stru_100521408);
  return (id)qword_1005AA188;
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
