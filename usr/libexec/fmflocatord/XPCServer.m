@implementation XPCServer

- (void)didChangeFMFAccountInfo:(id)a3 usingCallback:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = sub_10001C4E8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v27 = v12;
    v28 = 2112;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "FRAMEWORK API: %@ with changeDesc %@", buf, 0x16u);

  }
  if (-[XPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
    objc_msgSend(v13, "syncFMFAccountInfo");

    v8[2](v8, 0);
  }
  else
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v15));

    v17 = sub_10001C4E8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10003569C((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[XPCServer _errorForCode:message:](self, "_errorForCode:message:", 103, v16));
    ((void (**)(id, void *))v8)[2](v8, v25);

  }
}

- (void)willDeleteiCloudAccountUsingCallback:(id)a3
{
  void (**v5)(id, _QWORD);
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;

  v5 = (void (**)(id, _QWORD))a3;
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FRAMEWORK API: %@", buf, 0xCu);

  }
  if (-[XPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v5[2](v5, 0);
  }
  else
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v11));

    v13 = sub_10001C4E8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003569C((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[XPCServer _errorForCode:message:](self, "_errorForCode:message:", 103, v12));
    ((void (**)(id, void *))v5)[2](v5, v21);

  }
}

- (void)refreshMyLocationWithCallback:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v8, self));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v10, "beginTransaction:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accounts"));

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100029DB0;
  v16[3] = &unk_1000564B8;
  v18 = &v19;
  v16[4] = self;
  v13 = v4;
  v17 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);
  if (!*((_BYTE *)v20 + 24))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
    (*((void (**)(id, void *))v13 + 2))(v13, v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v15, "endTransaction:", v9);

  _Block_object_dispose(&v19, 8);
}

- (id)substituteStandardURLPlaceholders:(id)a3 withAccount:(id)a4 withServiceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostportOverride"));

  if (objc_msgSend(v11, "length"))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v11));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverHost"));

    if (!v13)
      goto LABEL_6;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverHost"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v14));

    v7 = (id)v14;
  }

  v7 = (id)v12;
LABEL_6:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "protocolSchemeOverride"));

  if (objc_msgSend(v16, "length"))
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v16));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverProtocolScheme"));

    if (!v18)
      goto LABEL_11;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverProtocolScheme"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v19));

    v7 = (id)v19;
  }

  v7 = (id)v17;
LABEL_11:
  if (v9)
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${service}"), v9));

    v7 = (id)v20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${dsid}"), v22));

    v7 = (id)v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceUDID"));

  if (v25)
  {
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${udid}"), v25));

    v7 = (id)v26;
  }

  return v7;
}

- (BOOL)_hasClientAccessEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.icloud.fmflocatord-access")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.icloud.fmfd.access")));

  if (v3 && (objc_msgSend(&__kCFBooleanTrue, "isEqual:", v3) & 1) != 0)
  {
    v6 = 1;
  }
  else if (v5)
  {
    v6 = objc_msgSend(&__kCFBooleanTrue, "isEqual:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_errorForCode:(int)a3 message:(id)a4
{
  __CFString *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v5 = (__CFString *)a4;
  v6 = objc_alloc((Class)NSError);
  if (v5)
    v7 = v5;
  else
    v7 = &stru_100057AE0;
  v11 = NSLocalizedFailureReasonErrorKey;
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v9 = objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmflocatord"), a3, v8);
  return v9;
}

@end
