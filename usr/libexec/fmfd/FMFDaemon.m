@implementation FMFDaemon

- (void)didReceiveAPSMessage:(id)a3 onTopic:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received APS message (topic: %@) : \n%@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cloudKitPushTopic"));
  v12 = objc_msgSend(v6, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001ED3C;
    v15[3] = &unk_1000995E8;
    v16 = v5;
    objc_msgSend(v13, "fetchChangesWithCompletion:", v15);

    v14 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isEqualToString:", off_1000B3008) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    objc_msgSend(v14, "refreshDueToTapWithMessage:", v5);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  FMFClientSession *v6;
  uint64_t v7;
  FMFClientSession *v8;
  __objc2_prot *v9;
  __objc2_prot *v10;
  uint64_t v11;
  FMFClientSession *v12;
  __objc2_prot *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  FMFClientSession *v18;
  uint64_t v19;
  NSSet *v20;
  uint64_t v21;
  NSSet *v22;
  NSSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  NSObject *v53;
  void *v54;
  BOOL v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  FMFClientSession *v61;
  __objc2_prot *v63;
  void *v64;
  void *v65;
  id v67;
  void *v68;
  __objc2_prot *v69;
  uint8_t v70[16];
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  uint8_t buf[4];
  FMFClientSession *v76;
  __int16 v77;
  unsigned int v78;
  __int16 v79;
  __CFString *v80;

  v67 = a3;
  v5 = a4;
  v6 = (FMFClientSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.icloud.fmfd.access")));
  v69 = (__objc2_prot *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.contactsui")));
  if (v6 && (v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = v6;
    v9 = v69;
    v10 = v69;
  }
  else
  {
    v9 = v69;
    if (!v69 || (v11 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v69, v11) & 1) == 0))
    {
      v57 = sub_100011D0C();
      v58 = objc_claimAutoreleasedReturnValue(v57);
      v56 = v58;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        sub_100063940(v5, v58);
        v55 = 0;
        v56 = v58;
      }
      else
      {
        v55 = 0;
      }
      goto LABEL_28;
    }
    v12 = v6;
    v13 = v69;
    if (!v6)
    {
LABEL_9:
      if (-[__objc2_prot BOOLValue](v9, "BOOLValue"))
        goto LABEL_10;
      goto LABEL_25;
    }
  }
  if ((-[FMFClientSession BOOLValue](v6, "BOOLValue") & 1) != 0)
  {
LABEL_10:
    if (-[FMFClientSession BOOLValue](v6, "BOOLValue"))
      v14 = CFSTR("com.apple.icloud.fmfd.access");
    else
      v14 = CFSTR("com.apple.private.contactsui");
    v15 = v14;
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (FMFClientSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
      *(_DWORD *)buf = 138412802;
      v76 = v18;
      v77 = 1024;
      v78 = objc_msgSend(v5, "processIdentifier");
      v79 = 2112;
      v80 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Allowing client %@(%d) to connect(entitlement name: %@ value: 1)", buf, 0x1Cu);

    }
    v69 = &OBJC_PROTOCOL___FMFXPCInternalServerProtocol;
    v63 = &OBJC_PROTOCOL___FMFXPCInternalClientProtocol;
    v19 = objc_opt_class(NSSet);
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, objc_opt_class(FMFHandle), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v21 = objc_opt_class(NSSet);
    v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(NSString), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v24 = objc_opt_class(NSSet);
    v25 = objc_opt_class(FMFHandle);
    v26 = objc_opt_class(FMFFence);
    v27 = objc_opt_class(FMFPlacemark);
    v28 = objc_opt_class(CLLocation);
    v29 = objc_opt_class(NSString);
    v30 = objc_opt_class(NSNumber);
    v31 = objc_opt_class(NSArray);
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, v25, v26, v27, v28, v29, v30, v31, objc_opt_class(NSDate), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v6 = -[FMFClientSession initWithConnection:]([FMFClientSession alloc], "initWithConnection:", v5);
    v34 = sub_100011D0C();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v6;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "📩 Connection established from: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v6);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10001E754;
    v73[3] = &unk_100099BC8;
    objc_copyWeak(&v74, (id *)buf);
    objc_msgSend(v5, "setInterruptionHandler:", v73);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10001E880;
    v71[3] = &unk_100099BC8;
    objc_copyWeak(&v72, (id *)buf);
    objc_msgSend(v5, "setInvalidationHandler:", v71);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", v69));
    objc_msgSend(v5, "setExportedInterface:", v36);

    objc_msgSend(v5, "setExportedObject:", v6);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v68, "addFriendHandles:", 0, 0);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v68, "removeFriendHandles:", 0, 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v65, "setDebugContext:", 0, 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v68, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", 0, 0);

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v68, "stopSharingMyLocationWithHandles:groupId:callerId:completion:", 0, 0);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v68, "fetchLocationForHandles:callerId:priority:completion:", 0, 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v64, "invalidateMappingPackets:completion:", 0, 0);

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v68, "canOfferToHandles:completion:", 0, 0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v68, "fencesForHandles:completion:", 0, 0);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v33, "addFence:completion:", 0, 0);

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v33, "deleteFence:completion:", 0, 0);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v68, "addFavorite:completion:", 0, 0);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
    objc_msgSend(v49, "setClasses:forSelector:argumentIndex:ofReply:", v68, "removeFavorite:completion:", 0, 0);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", v63));
    objc_msgSend(v5, "setRemoteObjectInterface:", v50);

    if (!-[FMFDaemon cachesWarmedUp](self, "cachesWarmedUp"))
    {
      v51 = +[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance");
      -[FMFDaemon setCachesWarmedUp:](self, "setCachesWarmedUp:", 1);
      v52 = sub_100011D0C();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v70 = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Caches warmed up", v70, 2u);
      }

    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    objc_msgSend(v54, "addClientSession:", v6);

    objc_msgSend(v5, "resume");
    objc_destroyWeak(&v72);
    objc_destroyWeak(&v74);
    objc_destroyWeak((id *)buf);

    v55 = 1;
    v56 = v63;
    goto LABEL_28;
  }
  if (v9)
    goto LABEL_9;
LABEL_25:
  v59 = sub_100011D0C();
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = (FMFClientSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
    *(_DWORD *)buf = 138412802;
    v76 = v61;
    v77 = 1024;
    v78 = objc_msgSend(v5, "processIdentifier");
    v79 = 1024;
    LODWORD(v80) = -[FMFClientSession BOOLValue](v6, "BOOLValue");
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Refusing client %@(%d) to connect(entitlement value: %d)", buf, 0x18u);

  }
  v55 = 0;
  v56 = v6;
LABEL_28:

  return v55;
}

- (BOOL)cachesWarmedUp
{
  return self->_cachesWarmedUp;
}

- (id)_parseExcludedFacilitiesFromString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11));

        if (objc_msgSend(v12, "length"))
          objc_msgSend(v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  return v13;
}

- (id)machServiceName
{
  return CFSTR("com.apple.icloud.fmfd");
}

- (void)_postAliveNotification
{
  id v2;
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting FMFD launched darwin notification(com.apple.icloud.fmfd.launched)", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, CFSTR("com.apple.icloud.fmfd.launched"), 0, 0, 0);
}

- (void)_localeChanged:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Exiting due to language changes, notification: %@", (uint8_t *)&v6, 0xCu);
  }

  xpc_transaction_exit_clean();
}

- (void)startup
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;

  -[FMFDaemon _registerUnlockRefresh](self, "_registerUnlockRefresh");
  -[FMFDaemon setCachesWarmedUp:](self, "setCachesWarmedUp:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v3, "setLaunchOnRebootActivity:keepAliveActivity:", CFSTR("com.apple.icloud.fmfd.launch-on-reboot"), CFSTR("com.apple.icloud.fmfd.keep-alive-on-dirty"));

  if (-[Daemon isInternalBuild](self, "isInternalBuild"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon _verifyLaunchEventsConfiguration](self, "_verifyLaunchEventsConfiguration"));
    if (v4)
    {
      v5 = sub_100011D0C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Bug in fmfd configuration. Please raise a radar with this message - %@", buf, 0xCu);
      }

    }
  }
  v30.receiver = self;
  v30.super_class = (Class)FMFDaemon;
  -[Daemon startup](&v30, "startup");
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "\n************************************************************************\n  FMF Daemon Starting...\n************************************************************************", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));

  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Environment:\n%@", buf, 0xCu);
  }

  +[KeychainUtil migrateLegacyKeychainItems](KeychainUtil, "migrateLegacyKeychainItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  objc_msgSend(v13, "updateAccountInfo");

  v14 = sub_100011D0C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
    *(_DWORD *)buf = 138412290;
    v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Account : %@", buf, 0xCu);

  }
  v18 = sub_100011D0C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Registering for APS token", buf, 2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "account"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "apsEnvironment"));
  v23 = (void *)v22;
  v24 = off_1000B3010;
  if (v22)
    v24 = (__CFString *)v22;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAPSHandler instanceForEnvironment:](FMFAPSHandler, "instanceForEnvironment:", v25));
  -[FMFDaemon setApsHandler:](self, "setApsHandler:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAPSHandler instanceForEnvironment:](FMFAPSHandler, "instanceForEnvironment:", v25));
  -[FMFDaemon setCloudKitAPSHandler:](self, "setCloudKitAPSHandler:", v27);

  -[FMFDaemon registerWithAPS](self, "registerWithAPS");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHeartbeatManager sharedInstance](FMFHeartbeatManager, "sharedInstance"));
  objc_msgSend(v28, "checkin");

  v29 = +[FMFNetworkObserver sharedInstance](FMFNetworkObserver, "sharedInstance");
  -[FMFDaemon _postAliveNotification](self, "_postAliveNotification");

}

- (void)addObservers
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = off_1000B2FA8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v6 = objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, &stru_100099B80);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v8 = off_1000B2FB0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v10 = objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, v9, &stru_100099BA0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "accountWasAdded", off_1000B2FC8, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "accountWasRemoved", off_1000B2FC0, 0);

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_localeChanged:", NSCurrentLocaleDidChangeNotification, 0);

}

- (id)xpcDarwinEventHandlers
{
  id v2;
  void *v3;
  uint64_t v5;
  id v6;

  v5 = ACDAccountStoreDidChangeNotification;
  v2 = objc_msgSend(&stru_100099BE8, "copy");
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (void)registerWithAPS
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "registering with APS", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon apsHandler](self, "apsHandler"));
  objc_msgSend(v5, "registerDelegate:forTopic:", self, off_1000B3000);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon cloudKitAPSHandler](self, "cloudKitAPSHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudKitPushTopic"));
  objc_msgSend(v6, "registerDelegate:forTopic:", self, v8);

  +[FMFAPSHandler startupComplete](FMFAPSHandler, "startupComplete");
}

- (void)deregisterWithAPS
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "deregistering with APS", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon apsHandler](self, "apsHandler"));
  objc_msgSend(v5, "deregisterDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon cloudKitAPSHandler](self, "cloudKitAPSHandler"));
  objc_msgSend(v6, "deregisterDelegate:", self);

}

- (void)accountWasAdded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "accountWasAdded", v5, 2u);
  }

  -[FMFDaemon registerWithAPS](self, "registerWithAPS");
}

- (void)accountWasRemoved
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "accountWasRemoved", v5, 2u);
  }

  -[FMFDaemon deregisterWithAPS](self, "deregisterWithAPS");
  -[FMFDaemon removeStoredAPSToken](self, "removeStoredAPSToken");
}

- (void)didReceiveAPSToken:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  int v18;

  v4 = a3;
  v5 = -[FMFDaemon hashedAPSTokenMatchesStoredToken:](self, "hashedAPSTokenMatchesStoredToken:", v4);
  if ((v5 & 1) != 0)
  {
    v6 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v15) = 0;
    v8 = "didReceiveAPSToken: saved token does match new token, not refreshing";
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon hashForToken:](self, "hashForToken:", v4));
    -[FMFDaemon storeSavedAPSToken:](self, "storeSavedAPSToken:", v9);

    v10 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v15) = 0;
    v8 = "didReceiveAPSToken: saved token doesn't match new token, will force refresh";
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 2u);
LABEL_7:

  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v4;
    v17 = 1024;
    v18 = v5 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received APS token - %@. APS token differs from saved: %d", (uint8_t *)&v15, 0x12u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v14 = v13;
  if ((v5 & 1) != 0)
    objc_msgSend(v13, "sendInitWithLazyCheckForSession:withReason:completion:", 0, 5, 0);
  else
    objc_msgSend(v13, "refreshForSession:withReason:withCompletion:", 0, 5, 0);

}

- (BOOL)hashedAPSTokenMatchesStoredToken:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon hashForToken:](self, "hashForToken:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDaemon apsTokenData](self, "apsTokenData"));
  if (v5)
    v6 = objc_msgSend(v4, "isEqualToData:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)hashForToken:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 md[20];

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4)));
  CC_SHA1(objc_msgSend(v3, "bytes"), (CC_LONG)objc_msgSend(v3, "length"), md);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20));

  return v4;
}

- (NSData)apsTokenData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("apsTokenStorageKey")));

  return (NSData *)v3;
}

- (void)storeSavedAPSToken:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("apsTokenStorageKey"));

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "synchronize");

}

- (void)removeStoredAPSToken
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("apsTokenStorageKey"));

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "synchronize");

}

- (void)_registerUnlockRefresh
{
  _QWORD handler[4];
  int v3;
  int out_token;

  if ((int)MKBDeviceUnlockedSinceBoot(self, a2) <= 0)
  {
    out_token = -1;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001F1C8;
    handler[3] = &unk_100099C28;
    v3 = -1;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)setApsTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_apsTokenData, a3);
}

- (FMFAPSHandler)apsHandler
{
  return self->_apsHandler;
}

- (void)setApsHandler:(id)a3
{
  objc_storeStrong((id *)&self->_apsHandler, a3);
}

- (FMFAPSHandler)cloudKitAPSHandler
{
  return self->_cloudKitAPSHandler;
}

- (void)setCloudKitAPSHandler:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitAPSHandler, a3);
}

- (void)setCachesWarmedUp:(BOOL)a3
{
  self->_cachesWarmedUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitAPSHandler, 0);
  objc_storeStrong((id *)&self->_apsHandler, 0);
  objc_storeStrong((id *)&self->_apsTokenData, 0);
}

@end
