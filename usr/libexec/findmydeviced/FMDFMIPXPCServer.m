@implementation FMDFMIPXPCServer

- (void)getConnectedAccessoriesDiscoveryIds:(id)a3
{
  void (**v5)(id, id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  id v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;

  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[FMDFMIPXPCServer getConnectedAccessoriesDiscoveryIds:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryRegistry"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allAccessories"));
    v11 = objc_alloc_init((Class)NSMutableArray);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v17, "connectionState") == (id)1)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "address"));
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v5[2](v5, v11, 0);
    goto LABEL_18;
  }
  v19 = NSStringFromSelector(a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v20));

  v21 = sub_1000031B8();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v8));
    ((void (**)(id, id, void *))v5)[2](v5, 0, v9);
LABEL_18:

  }
}

- (BOOL)_hasClientAccessEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.aosnotification.aosnotifyd-access")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.icloud.findmydeviced.access")));

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

- (void)getFMIPStateUsingCallback:(id)a3
{
  void (**v5)(id, id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  char *v9;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;

  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[FMDFMIPXPCServer getFMIPStateUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = (char *)objc_msgSend(v8, "fmipState");

    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning FMIP state : %ld", buf, 0xCu);
    }

    if (v5)
      v5[2](v5, v9, 0);
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v14));
      ((void (**)(id, id, void *))v5)[2](v5, (id)4, v17);

    }
  }

}

- (void)setProtectedIDSManager:(id)a3
{
  objc_storeStrong((id *)&self->_protectedIDSManager, a3);
}

- (void)enableLostModeWithInfo:(id)a3 usingCallback:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  FMDFMIPXPCServer *v25;
  uint64_t v26;
  NSString *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v61[4];
  _QWORD v62[4];
  uint8_t buf[4];
  const char *v64;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v64 = "-[FMDFMIPXPCServer enableLostModeWithInfo:usingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (!-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v27 = NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v28));

    v30 = sub_1000031B8();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v8)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v29));
      v8[2](v8, v32);

    }
    goto LABEL_24;
  }
  if ((objc_msgSend(v7, "lostModeEnabled") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v12 = objc_msgSend(v11, "isPasscodeSet");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
      v14 = objc_msgSend(v13, "lostModeEnabled");

      if (!v14)
      {
        v62[0] = &__kCFBooleanTrue;
        v61[0] = CFSTR("lostModeEnabled");
        v61[1] = CFSTR("lostModeMessage");
        v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));
        v52 = (void *)v51;
        if (v51)
          v53 = (const __CFString *)v51;
        else
          v53 = &stru_1002CD590;
        v62[1] = v53;
        v61[2] = CFSTR("lostModeOwnerNumber");
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "phoneNumber"));
        v55 = (void *)v54;
        if (v54)
          v56 = (const __CFString *)v54;
        else
          v56 = &stru_1002CD590;
        v62[2] = v56;
        v61[3] = CFSTR("lostModeFacetimeCapable");
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "facetimeCapable")));
        v62[3] = v57;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 4));

        +[FMDPreferencesMgr setClientLostModeInfo:](FMDPreferencesMgr, "setClientLostModeInfo:", v29);
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance"));
        objc_msgSend(v58, "recalculateLostMode");

        v59 = SBSSpringBoardServerPort();
        SBLockDevice(v59, 1);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
        if (v8)
          v8[2](v8, 0);
        goto LABEL_24;
      }
      v15 = sub_1000031B8();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10022A5C8(v16, v17, v18, v19, v20, v21, v22, v23);

      if (v8)
      {
        v24 = CFSTR("Device is already in FMIP lost mode.");
        v25 = self;
        v26 = 8;
LABEL_23:
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v25, "_errorForCode:message:", v26, v24));
        v8[2](v8, v29);
LABEL_24:

      }
    }
    else
    {
      v42 = sub_1000031B8();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        sub_10022A638(v43, v44, v45, v46, v47, v48, v49, v50);

      if (v8)
      {
        v24 = CFSTR("Passcode is not set. Cannot enable lost mode.");
        v25 = self;
        v26 = 7;
        goto LABEL_23;
      }
    }
  }
  else
  {
    v33 = sub_1000031B8();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10022A6A8(v34, v35, v36, v37, v38, v39, v40, v41);

    if (v8)
    {
      v24 = CFSTR("You have passed in lostModeEnabled as NO. This is invalid");
      v25 = self;
      v26 = 1;
      goto LABEL_23;
    }
  }

}

- (void)disableLostModeUsingCallback:(id)a3
{
  void (**v5)(id, void *);
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;

  v5 = (void (**)(id, void *))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[FMDFMIPXPCServer disableLostModeUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (!-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v14));

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v15));
      v5[2](v5, v18);

    }
    goto LABEL_20;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v9 = objc_msgSend(v8, "isLocked");

  if (v9)
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10022A778();

    if (v5)
    {
      v12 = CFSTR("Keybag is still locked. Cannot disable lost mode");
LABEL_19:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 9, v12));
      v5[2](v5, v15);
LABEL_20:

    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lostModeInfo"));
    v21 = objc_msgSend(v20, "lostModeType");

    if (v21 != (id)5 && v21 != (id)3)
    {
      +[FMDPreferencesMgr setClientLostModeInfo:](FMDPreferencesMgr, "setClientLostModeInfo:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance"));
      objc_msgSend(v24, "recalculateLostMode");

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "locationTracker"));

      objc_msgSend(v15, "deleteLocationTrackingInfoAndStopTracking");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLostModeManager sharedInstance](FMDLostModeManager, "sharedInstance"));
      objc_msgSend(v26, "disableLostMode");

      if (v5)
        v5[2](v5, 0);
      goto LABEL_20;
    }
    v22 = sub_1000031B8();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10022A7A4();

    if (v5)
    {
      v12 = CFSTR("Device is in managed lost mode. Cannot disable lost mode");
      goto LABEL_19;
    }
  }

}

- (void)deviceActivationDidSucceedUsingCallback:(id)a3
{
  void (**v5)(id, _QWORD);
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;

  v5 = (void (**)(id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[FMDFMIPXPCServer deviceActivationDidSucceedUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    +[FMDPreferencesMgr setFMIPWipeLostModeInfo:](FMDPreferencesMgr, "setFMIPWipeLostModeInfo:", 0);
    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v9));

    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v10));
      ((void (**)(id, void *))v5)[2](v5, v13);

    }
  }

}

- (void)getLockdownShouldDisableDeviceRestoreUsingCallback:(id)a3
{
  void (**v5)(id, BOOL, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;

  v5 = (void (**)(id, BOOL, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FMDFMIPXPCServer getLockdownShouldDisableDeviceRestoreUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fmipACAccount"));

    if (v5)
      v5[2](v5, v9 != 0, 0);
  }
  else
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v11));

    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v9));
      ((void (**)(id, BOOL, void *))v5)[2](v5, 0, v14);

    }
  }

}

- (void)getLockdownShouldDisableDevicePairingUsingCallback:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;

  v5 = a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPXPCServer getLockdownShouldDisableDevicePairingUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    +[FMPreferencesUtil synchronizeDomain:](FMPreferencesUtil, "synchronizeDomain:", kFMDPostWipePrefDomain);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), kFMDPostWipePrefDomain));
    if (v8)
    {
      if (v5)
        (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
      goto LABEL_21;
    }
    +[FMPreferencesUtil synchronizeDomain:](FMPreferencesUtil, "synchronizeDomain:", kFMDPublicNotBackedUpPrefDomain);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPLostModeInfo"), kFMDPublicNotBackedUpPrefDomain));
    v13 = v14;
    if (v14
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lostModeEnabled"))),
          v16 = objc_msgSend(v15, "BOOLValue"),
          v15,
          (v16 & 1) != 0))
    {
      v17 = 1;
      if (!v5)
        goto LABEL_20;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("ClientLostModeInfo"), kFMDPublicNotBackedUpPrefDomain));
      v19 = v18;
      if (v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lostModeEnabled")));
        v17 = (uint64_t)objc_msgSend(v20, "BOOLValue");

      }
      else
      {
        v17 = 0;
      }

      if (!v5)
        goto LABEL_20;
    }
    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, v17, 0);
LABEL_20:

    goto LABEL_21;
  }
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v10));

  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v8));
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v13);
    goto LABEL_20;
  }
LABEL_21:

}

- (void)getFmipAccountUsingCallback:(id)a3
{
  void (**v5)(id, void *, void *, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;

  v5 = (void (**)(id, void *, void *, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FMDFMIPXPCServer getFmipAccountUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fmipACAccount"));

    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "username"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_personID"));
      v5[2](v5, v10, v11, 0);

LABEL_10:
    }
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v9));
      ((void (**)(id, void *, void *, void *))v5)[2](v5, 0, 0, v10);
      goto LABEL_10;
    }
  }

}

- (void)didChangeFMIPAccountInfo:(id)a3 usingCallback:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[FMDFMIPXPCServer didChangeFMIPAccountInfo:usingCallback:]";
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s with changeDesc %@", buf, 0x16u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    objc_msgSend(v11, "syncFMIPAccountInfo");

    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v8)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v14));
      ((void (**)(id, void *))v8)[2](v8, v17);

    }
  }

}

- (void)enableFMIPInContext:(unint64_t)a3 usingCallback:(id)a4
{
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  FMDFMIPAccount *v18;
  NSString *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  FMDFMIPXPCServer *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  unint64_t v38;

  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[FMDFMIPXPCServer enableFMIPInContext:usingCallback:]";
    v37 = 2048;
    v38 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s in context %lu", buf, 0x16u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iCloudACAccount"));

    if (v11)
    {
      v12 = kAccountDataclassDeviceLocator;
      if ((objc_msgSend(v11, "isProvisionedForDataclass:", kAccountDataclassDeviceLocator) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));

        if (v14
          && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dsid")),
              v17 = objc_msgSend(v15, "isEqualToString:", v16),
              v16,
              v15,
              v17))
        {
          objc_msgSend(v14, "applyPropertiesFromACAccount:", v11);
          v18 = (FMDFMIPAccount *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
          -[FMDFMIPAccount updateAccount:](v18, "updateAccount:", v14);
        }
        else
        {
          v18 = objc_alloc_init(FMDFMIPAccount);
          -[FMDFMIPAccount applyPropertiesFromACAccount:](v18, "applyPropertiesFromACAccount:", v11);
          -[FMDFMIPAccount setFmipEnableContext:](v18, "setFmipEnableContext:", a3);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          -[FMDAccount setAccountAddTime:](v18, "setAccountAddTime:", v31);

          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dsid"));
          -[FMDFMIPAccount setLastLoggedInDsid:](v18, "setLastLoggedInDsid:", v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
          objc_msgSend(v33, "addAccount:", v18);

        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[FMIPConfig sharedInstance](FMIPConfig, "sharedInstance"));
        objc_msgSend(v34, "enableFMIPLocationServices");

        if (v7)
          v7[2](v7, 0);
        goto LABEL_25;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The account %@ is not provisioned for %@"), v27, v12));

      v28 = sub_1000031B8();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10022A718();

      if (!v7)
        goto LABEL_25;
      v25 = self;
      v26 = 9;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No iCloud account found to enableFMIP")));
      v23 = sub_1000031B8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10022A718();

      if (!v7)
        goto LABEL_25;
      v25 = self;
      v26 = 5;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v25, "_errorForCode:message:", v26, v14));
    ((void (**)(id, void *))v7)[2](v7, v30);

LABEL_25:
    goto LABEL_26;
  }
  v19 = NSStringFromSelector(a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v20));

  v21 = sub_1000031B8();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v11));
    ((void (**)(id, void *))v7)[2](v7, v14);
    goto LABEL_25;
  }
LABEL_26:

}

- (void)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 usingCallback:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  FMDFMIPXPCServer *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  _QWORD *v37;
  unint64_t v38;
  _QWORD v39[4];
  _QWORD *v40;
  unint64_t v41;
  _QWORD v42[4];
  _QWORD *v43;
  _QWORD v44[4];
  _QWORD *v45;
  _QWORD v46[4];
  _QWORD *v47;
  _QWORD v48[4];
  _QWORD *v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  unint64_t v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  const char *v61;

  v9 = a3;
  v10 = a5;
  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "non-nil";
    v57 = "-[FMDFMIPXPCServer disableFMIPUsingToken:inContext:usingCallback:]";
    *(_DWORD *)buf = 136315650;
    if (!v9)
      v13 = "nil";
    v58 = 2048;
    v59 = a4;
    v60 = 2080;
    v61 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s in context %lu with %s token", buf, 0x20u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v15 = objc_msgSend(v14, "isBuddyDone");

    if ((v15 & 1) != 0)
    {
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1000732E4;
      v52[3] = &unk_1002C3EE0;
      v53 = v9;
      v55 = a4;
      v16 = v10;
      v54 = v16;
      v17 = objc_retainBlock(v52);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10007342C;
      v50[3] = &unk_1002C16D8;
      v50[4] = self;
      v51 = v16;
      v18 = objc_retainBlock(v50);
      if (!+[FMDRatchetManager isFeatureEnabled](FMDRatchetManager, "isFeatureEnabled"))
      {
        v31 = sub_10005334C();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Ratchet not enabled. Allowing disable FMIP.", buf, 2u);
        }

        ((void (*)(_QWORD *))v17[2])(v17);
        goto LABEL_28;
      }
      if (a4 == 4)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDOwnerAuthenticationManager ownerAuthenticationManagerEraseAllContentsAndSettings](FMDOwnerAuthenticationManager, "ownerAuthenticationManagerEraseAllContentsAndSettings"));
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100073528;
        v44[3] = &unk_1002C2060;
        v45 = v17;
        objc_msgSend(v19, "setPermittedOperationBlock:", v44);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100073534;
        v42[3] = &unk_1002C2060;
        v43 = v18;
        objc_msgSend(v19, "setDeniedOperationBlock:", v42);
        objc_msgSend(v19, "evaluateOperation");

        v20 = v45;
      }
      else
      {
        if (a4 != 2)
        {
          v33 = sub_10005334C();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v57 = (const char *)a4;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Checking ratchet for the context: %lu.", buf, 0xCu);
          }

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[FMDRatchetManager ratchetManagerTurnOffFMIP](FMDRatchetManager, "ratchetManagerTurnOffFMIP"));
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100073540;
          v39[3] = &unk_1002C3F08;
          v41 = a4;
          v40 = v17;
          objc_msgSend(v35, "setPermittedOperationBlock:", v39);
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_1000735F0;
          v36[3] = &unk_1002C3F08;
          v38 = a4;
          v37 = v18;
          objc_msgSend(v35, "setDeniedOperationBlock:", v36);
          objc_msgSend(v35, "evaluateOperation");

          goto LABEL_28;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDRatchetManager ratchetManageriCloudSignOut](FMDRatchetManager, "ratchetManageriCloudSignOut"));
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100073510;
        v48[3] = &unk_1002C2060;
        v49 = v17;
        objc_msgSend(v19, "setPermittedOperationBlock:", v48);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10007351C;
        v46[3] = &unk_1002C2060;
        v47 = v18;
        objc_msgSend(v19, "setDeniedOperationBlock:", v46);
        objc_msgSend(v19, "evaluateOperation");

        v20 = v49;
      }

LABEL_28:
      v23 = v53;
      goto LABEL_29;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMIP account cannot be removed till buddy is complete")));
    v28 = sub_1000031B8();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v10)
    {
      v26 = self;
      v27 = 9;
      goto LABEL_19;
    }
  }
  else
  {
    v21 = NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v22));

    v24 = sub_1000031B8();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v10)
    {
      v26 = self;
      v27 = 6;
LABEL_19:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v26, "_errorForCode:message:", v27, v23));
      (*((void (**)(id, void *))v10 + 2))(v10, v30);

    }
  }
LABEL_29:

}

- (void)disableFMIPUsingToken:(id)a3 forPairedDeviceWithUDID:(id)a4 usingCallback:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  NSString *v18;
  void *v19;
  id v20;
  NSObject *v21;
  FMDFMIPXPCServer *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "non-nil";
    v32 = "-[FMDFMIPXPCServer disableFMIPUsingToken:forPairedDeviceWithUDID:usingCallback:]";
    *(_DWORD *)buf = 136315650;
    if (!v9)
      v14 = "nil";
    v33 = 2112;
    v34 = v10;
    v35 = 2080;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@ with %s token", buf, 0x20u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v16 = objc_msgSend(v15, "isBuddyDone");

    if ((v16 & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007394C;
      block[3] = &unk_1002C2088;
      v28 = v9;
      v29 = v10;
      v30 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      v17 = v28;
      goto LABEL_17;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMIP account cannot be removed till buddy is complete")));
    v24 = sub_1000031B8();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v11)
    {
      v22 = self;
      v23 = 9;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v19));

    v20 = sub_1000031B8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v11)
    {
      v22 = self;
      v23 = 6;
LABEL_16:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v22, "_errorForCode:message:", v23, v17));
      (*((void (**)(id, void *))v11 + 2))(v11, v26);

    }
  }
LABEL_17:

}

- (void)disableFMIPForAccount:(id)a3 pairedDeviceWithUDID:(id)a4 usingCallback:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  NSString *v18;
  void *v19;
  id v20;
  NSObject *v21;
  FMDFMIPXPCServer *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "non-nil";
    v32 = "-[FMDFMIPXPCServer disableFMIPForAccount:pairedDeviceWithUDID:usingCallback:]";
    *(_DWORD *)buf = 136315650;
    if (!v9)
      v14 = "nil";
    v33 = 2112;
    v34 = v10;
    v35 = 2080;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@ with %s account", buf, 0x20u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v16 = objc_msgSend(v15, "isBuddyDone");

    if ((v16 & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100073C5C;
      block[3] = &unk_1002C2088;
      v28 = v9;
      v29 = v10;
      v30 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      v17 = v28;
      goto LABEL_17;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMIP account cannot be removed till buddy is complete")));
    v24 = sub_1000031B8();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v11)
    {
      v22 = self;
      v23 = 9;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v19));

    v20 = sub_1000031B8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v11)
    {
      v22 = self;
      v23 = 6;
LABEL_16:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v22, "_errorForCode:message:", v23, v17));
      (*((void (**)(id, void *))v11 + 2))(v11, v26);

    }
  }
LABEL_17:

}

- (void)markAsMissingSupportedForPairedDeviceWithUDID:(id)a3 usingCallback:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned __int8 v24;
  NSString *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;

  v7 = a3;
  v8 = a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[FMDFMIPXPCServer markAsMissingSupportedForPairedDeviceWithUDID:usingCallback:]";
    v48 = 2112;
    v49 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@", buf, 0x16u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getPairedDevices"));

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      v17 = NRDevicePropertyIsPaired;
      v18 = NRDevicePropertyUDID;
LABEL_6:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForProperty:", v17));
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v7)
        {
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForProperty:", v18));
            v24 = objc_msgSend(v7, "isEqualToString:", v23);

            if ((v24 & 1) != 0)
              break;
          }
        }
        if (v15 == (id)++v19)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          if (v15)
            goto LABEL_6;
          goto LABEL_14;
        }
      }
      v30 = v20;

      if (!v30)
        goto LABEL_21;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100074224;
      block[3] = &unk_1002C2038;
      v37 = v30;
      v8 = v35;
      v38 = v35;
      v29 = v30;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      v31 = v37;
      goto LABEL_25;
    }
LABEL_14:

LABEL_21:
    v32 = sub_1000031B8();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v8 = v35;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_10022A7D0();

    if (v35)
    {
      v34 = kFMDErrorDomain;
      v43 = NSLocalizedFailureReasonErrorKey;
      v44 = CFSTR("No paired device with this UDID");
      v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v34, 1, v29));
      ((void (**)(_QWORD, _QWORD, void *))v35)[2](v35, 0, v31);
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {
    v25 = NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v26));

    v27 = sub_1000031B8();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v8)
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v13));
      (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v29);
LABEL_26:

    }
  }

}

- (void)markPairedDeviceWithUDID:(id)a3 asMissingUsingToken:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const char *v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "non-nil";
    v26 = "-[FMDFMIPXPCServer markPairedDeviceWithUDID:asMissingUsingToken:callback:]";
    *(_DWORD *)buf = 136315650;
    if (!v10)
      v14 = "nil";
    v27 = 2112;
    v28 = v9;
    v29 = 2080;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@ with %s token", buf, 0x20u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074690;
    block[3] = &unk_1002C2088;
    v22 = v9;
    v23 = v10;
    v24 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v15 = v22;
  }
  else
  {
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v17));

    v18 = sub_1000031B8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v11)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v15));
      (*((void (**)(id, void *))v11 + 2))(v11, v20);

    }
  }

}

- (void)isActivationLockAllowedUsingCallback:(id)a3
{
  void (**v5)(id, id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;

  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FMDFMIPXPCServer isActivationLockAllowedUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v9 = objc_msgSend(v8, "allowsActivationLock");

    if (v5)
      v5[2](v5, v9, 0);
  }
  else
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v11));

    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v12));
      ((void (**)(id, id, void *))v5)[2](v5, 0, v15);

    }
  }

}

- (void)isActivationLockEnabledUsingCallback:(id)a3
{
  void (**v5)(id, id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;

  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[FMDFMIPXPCServer isActivationLockEnabledUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = objc_msgSend(v8, "fmipState");

    if ((unint64_t)v9 <= 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
      v11 = objc_msgSend(v10, "allowsActivationLock");

      if (!v5)
        goto LABEL_14;
      goto LABEL_13;
    }
    v11 = 0;
    if (v5)
LABEL_13:
      v5[2](v5, v11, 0);
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v14));
      ((void (**)(id, id, void *))v5)[2](v5, 0, v17);

    }
  }
LABEL_14:

}

- (void)isActivationLockedUsingCallback:(id)a3
{
  void (**v5)(id, id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;

  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FMDFMIPXPCServer isActivationLockedUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = objc_msgSend(v8, "isActivationLocked");
    if (v5)
      v5[2](v5, v9, 0);
  }
  else
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v11));

    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v8));
      ((void (**)(id, id, void *))v5)[2](v5, 0, v14);

    }
  }

}

- (void)enableActivationLockUsingCallback:(id)a3
{
  void (**v5)(id, void *);
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  void (**v10)(id, void *);
  NSString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  void (**v26)(id, void *);
  uint8_t buf[4];
  const char *v28;

  v5 = (void (**)(id, void *))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[FMDFMIPXPCServer enableActivationLockUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (!-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v10 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v12));

    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v10));
      v5[2](v5, v15);

    }
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v9 = objc_msgSend(v8, "allowsActivationLock");

  if ((v9 & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074E40;
    block[3] = &unk_1002C2060;
    v26 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v10 = v26;
LABEL_14:

    goto LABEL_15;
  }
  v16 = sub_1000031B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10022A830(v17, v18, v19, v20, v21, v22, v23, v24);

  if (v5)
  {
    v10 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 9, CFSTR("Activation lock is not allowed for this device")));
    v5[2](v5, v10);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)activationLockVersionWithCompletion:(id)a3
{
  uint64_t v3;
  void (**v4)(id, id, _QWORD);

  if (a3)
  {
    v3 = kFMDNotBackedUpPrefDomain;
    v4 = (void (**)(id, id, _QWORD))a3;
    v4[2](v4, +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("identityVersion"), v3), 0);

  }
}

- (void)didReceiveLostModeExitAuthToken:(id)a3 usingCallback:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  id v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  FMDFMIPXPCServer *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[FMDFMIPXPCServer didReceiveLostModeExitAuthToken:usingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fmipACAccount"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr lostModeExitAuthForPairedDeviceID](FMDPreferencesMgr, "lostModeExitAuthForPairedDeviceID"));
      if (v13)
      {
        +[FMDPreferencesMgr setLostModeExitAuthForPairedDeviceID:](FMDPreferencesMgr, "setLostModeExitAuthForPairedDeviceID:", 0);
        -[FMDFMIPXPCServer sendPairedDeviceLostModeExitAuthToken:deviceID:](self, "sendPairedDeviceLostModeExitAuthToken:deviceID:", v7, v13);
        if (!v8)
          goto LABEL_18;
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
        objc_msgSend(v22, "sendLostModeExitAuthWithToken:", v7);

        if (!v8)
        {
LABEL_18:

          goto LABEL_19;
        }
      }
      v21 = 0;
LABEL_17:
      v8[2](v8, v21);
      goto LABEL_18;
    }
    if (v8)
    {
      v20 = CFSTR("FMIP account not found");
      v18 = self;
      v19 = 5;
      goto LABEL_14;
    }
  }
  else
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v15));

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v8)
    {
      v18 = self;
      v19 = 6;
      v20 = v12;
LABEL_14:
      v21 = objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v18, "_errorForCode:message:", v19, v20));
      v13 = (void *)v21;
      goto LABEL_17;
    }
  }
LABEL_19:

}

- (void)initiateLostModeExitAuthForApp:(id)a3 idsDeviceID:(id)a4 usingCallback:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[FMDFMIPXPCServer initiateLostModeExitAuthForApp:idsDeviceID:usingCallback:]";
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for bundleID %@, idsDeviceID %@", buf, 0x20u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fmipACAccount"));

    if (!v11 || v15)
    {
      if (v10)
      {
        +[FMDPreferencesMgr setLostModeExitAuthForPairedDeviceID:](FMDPreferencesMgr, "setLostModeExitAuthForPairedDeviceID:", v10);
        v21 = CFSTR("FMW_RENEW_CREDENTIALS_APPLE_PAY");
      }
      else
      {
        v21 = CFSTR("FMIP_RENEW_CREDENTIALS_APPLE_PAY");
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "account"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString fmd_localizedString](v21, "fmd_localizedString"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "username"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24));

      +[FMDPreferencesMgr setNeedsLostModeExitAuth:](FMDPreferencesMgr, "setNeedsLostModeExitAuth:", 1);
      objc_initWeak((id *)buf, self);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100075548;
      v27[3] = &unk_1002C3F30;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v11;
      objc_msgSend(v26, "forceUserAuthForiCloudAccountForApp:message:really:withCompletion:", v9, v25, 1, v27);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 5, CFSTR("FMIP account not found")));
      (*((void (**)(id, void *))v11 + 2))(v11, v16);
    }
    goto LABEL_15;
  }
  v17 = NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v18));

  v19 = sub_1000031B8();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v15));
    (*((void (**)(id, void *))v11 + 2))(v11, v16);
LABEL_15:

  }
}

- (void)lowBatteryLocateEnabledUsingCallback:(id)a3
{
  void (**v5)(id, id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;

  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FMDFMIPXPCServer lowBatteryLocateEnabledUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));

    v10 = objc_msgSend(v9, "lowBatteryLocateEnabled");
    if (v5)
      v5[2](v5, v10, 0);
  }
  else
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v12));

    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v9));
      ((void (**)(id, id, void *))v5)[2](v5, 0, v15);

    }
  }

}

- (void)setLowBatteryLocateEnabled:(BOOL)a3 usingCallback:(id)a4
{
  _BOOL8 v4;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  FMDFMIPXPCServer *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;

  v4 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "NO";
    if (v4)
      v10 = "YES";
    *(_DWORD *)buf = 136315394;
    v33 = "-[FMDFMIPXPCServer setLowBatteryLocateEnabled:usingCallback:]";
    v34 = 2080;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s with enabled: %s", buf, 0x16u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "account"));

    if (v12)
    {
      -[__CFString setLowBatteryLocateEnabled:](v12, "setLowBatteryLocateEnabled:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountStore"));
      objc_msgSend(v14, "saveAccount:", v12);

      if (v7)
        v7[2](v7, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      objc_msgSend(v15, "registerDeviceWithCause:force:", CFSTR("LowBatteryLocateChange"), 0);
      goto LABEL_19;
    }
    v23 = sub_1000031B8();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10022A8A0(v24, v25, v26, v27, v28, v29, v30, v31);

    if (v7)
    {
      v22 = CFSTR("FMIP account not found");
      v20 = self;
      v21 = 5;
      goto LABEL_18;
    }
  }
  else
  {
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v17));

    v18 = sub_1000031B8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v7)
    {
      v20 = self;
      v21 = 6;
      v22 = v12;
LABEL_18:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v20, "_errorForCode:message:", v21, v22));
      ((void (**)(id, void *))v7)[2](v7, v15);
LABEL_19:

    }
  }

}

- (void)signatureHeadersWithData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  id v19;
  id v20;
  _QWORD *v21;
  NSString *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  __int128 *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint8_t v39[16];
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  FMDFMIPXPCServer *v43;
  id v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  __int128 *p_buf;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[3];
  char v64;
  _QWORD v65[3];
  char v66;
  __int128 buf;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;

  v7 = a3;
  v8 = a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[FMDFMIPXPCServer signatureHeadersWithData:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", (uint8_t *)&buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    v66 = 0;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v64 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v68 = 0x3032000000;
    v69 = sub_100075F6C;
    v70 = sub_100075F7C;
    v71 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = sub_100075F6C;
    v61[4] = sub_100075F7C;
    v62 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x3032000000;
    v59[3] = sub_100075F6C;
    v59[4] = sub_100075F7C;
    v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = sub_100075F6C;
    v57[4] = sub_100075F7C;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = sub_100075F6C;
    v55[4] = sub_100075F7C;
    v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_100075F6C;
    v53[4] = sub_100075F7C;
    v54 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100075F84;
    v40[3] = &unk_1002C3F80;
    v26 = dispatch_queue_create("FMDFMIPXPCServer.populateHeaders", 0);
    v41 = v26;
    v45 = v65;
    v46 = v63;
    v47 = v59;
    v48 = v53;
    p_buf = &buf;
    v50 = v61;
    v51 = v55;
    v52 = v57;
    v13 = v12;
    v42 = v13;
    v43 = self;
    v44 = v8;
    v14 = objc_retainBlock(v40);
    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "signatureHeadersWithData : Will attempt Absinth signing", v39, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000762EC;
    v33[3] = &unk_1002C3FA8;
    v35 = v59;
    v36 = &buf;
    v37 = v61;
    v38 = v65;
    v18 = v14;
    v34 = v18;
    objc_msgSend(v17, "signatureForData:requestUUID:mode:cause:completion:", v11, v13, 1, CFSTR("app"), v33);

    v19 = objc_msgSend(objc_alloc((Class)FMDIdentitySigningRequest), "initWithData:", v11);
    v20 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000765A4;
    v27[3] = &unk_1002C3FD0;
    v29 = v53;
    v30 = v55;
    v31 = v57;
    v32 = v63;
    v21 = v18;
    v28 = v21;
    objc_msgSend(v20, "baaIdentityAttestationForSigningRequest:completion:", v19, v27);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(v59, 8);

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(v65, 8);
    goto LABEL_11;
  }
  v22 = NSStringFromSelector(a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v23));

  v24 = sub_1000031B8();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v8)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v11));
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v13);
LABEL_11:

  }
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, id);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;

  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[FMDFMIPXPCServer getAccessoriesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryRegistry"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allAccessories"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100076918;
    v18[3] = &unk_1002C3FF8;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v19 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Returning Accessories : %@", buf, 0xCu);
    }

    if (v5)
      v5[2](v5, 0, v11);

    goto LABEL_13;
  }
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v15));

  v16 = sub_1000031B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v8));
    ((void (**)(id, void *, id))v5)[2](v5, v10, 0);
LABEL_13:

  }
}

- (void)fetchAccessoryConfigurations:(id)a3
{
  void (**v5)(id, uint64_t);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;

  v5 = (void (**)(id, uint64_t))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FMDFMIPXPCServer fetchAccessoryConfigurations:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configurations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));

    objc_msgSend(v8, "fetchSupportedAccessoryTypes");
    objc_msgSend(v8, "fetchConfigForAccessoryTypes:", v10);
    if (!v5)
    {
LABEL_11:

      goto LABEL_12;
    }
    v11 = 0;
LABEL_10:
    v5[2](v5, v11);
    goto LABEL_11;
  }
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

  v14 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v5)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v8));
    v10 = (void *)v11;
    goto LABEL_10;
  }
LABEL_12:

}

- (void)removeAccessoryWithDiscoveryId:(id)a3 completion:(id)a4
{
  char *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;

  v7 = (char *)a3;
  v8 = a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPXPCServer removeAccessoryWithDiscoveryId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = sub_1000530AC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "removeAccessoryWithDiscoveryId called for accessory with serialNumber %@", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryProxyForId:withDelegate:](FMDExtExtensionHelper, "getAccessoryProxyForId:withDelegate:", CFSTR("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FMDMagSafeExtension"), 0));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100076D54;
    v19[3] = &unk_1002C1598;
    v20 = v8;
    objc_msgSend(v13, "removeAccesoryWithSerialNumber:completion:", v7, v19);
    v14 = v20;
    goto LABEL_11;
  }
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v16));

  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v13));
    (*((void (**)(id, void *))v8 + 2))(v8, v14);
LABEL_11:

  }
}

- (void)setPhoneNumber:(id)a3 toAccessoryWithDiscoveryId:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[FMDFMIPXPCServer setPhoneNumber:toAccessoryWithDiscoveryId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v47 = v9;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "accessoryRegistry"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "allAccessories"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v52;
LABEL_6:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "address"));
        v21 = objc_msgSend(v20, "isEqualToString:", v10);

        if ((v21 & 1) != 0)
          break;
        if (v16 == (id)++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v16)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v28 = v19;

      if (!v28)
        goto LABEL_23;
      v30 = objc_opt_class(FMDExtAccessory, v29);
      if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0)
      {
        v31 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accessoryType"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "configForAccessoryType:", v33));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "flavorForFeature:", CFSTR("scd")));
        v36 = sub_1000530AC();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          sub_10022AA1C();

        if (v35)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", CFSTR("scd"), v35));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accessoryIdentifier"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringValue"));
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000772DC;
          v49[3] = &unk_1002C1598;
          v50 = v11;
          v9 = v47;
          objc_msgSend(v38, "setPhoneNumberForAccessoryId:phoneNumber:info:completion:", v40, v47, 0, v49);

          v28 = v31;
          goto LABEL_32;
        }

      }
      v44 = sub_1000031B8();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_10022A99C(v28, v45);

      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }
    else
    {
LABEL_12:

LABEL_23:
      v28 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Accesory not found with discovery id %@"), v10));
      v41 = sub_1000031B8();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        sub_10022A718();

      if (v11)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 14, v28));
        (*((void (**)(id, void *))v11 + 2))(v11, v43);

      }
    }
    v9 = v47;
LABEL_32:
    v27 = v46;

    v24 = v48;
    goto LABEL_33;
  }
  v22 = NSStringFromSelector(a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v23));

  v25 = sub_1000031B8();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v11)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v24));
    (*((void (**)(id, void *))v11 + 2))(v11, v27);
LABEL_33:

  }
}

- (void)registerDeviceForPairingLock:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, FMDPairingLockRegisterAction *, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  FMDPairingLockRegisterAction *v12;
  void *v13;
  id v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;

  v7 = a3;
  v8 = (void (**)(id, FMDPairingLockRegisterAction *, _QWORD))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPXPCServer registerDeviceForPairingLock:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v12 = -[FMDPairingLockRegisterAction initWithProvider:registerRequestInfo:]([FMDPairingLockRegisterAction alloc], "initWithProvider:registerRequestInfo:", v11, v7);
    -[FMDPairingLockRegisterAction performOnActionCompletion:](v12, "performOnActionCompletion:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v14 = objc_msgSend(v13, "enqueueAction:", v12);

LABEL_9:
    goto LABEL_10;
  }
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v16));

  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v8)
  {
    v12 = (FMDPairingLockRegisterAction *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v11));
    v8[2](v8, v12, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)updatePairingLockInfo:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  FMDPairingLockUpdateInfoAction *v12;
  void *v13;
  id v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPXPCServer updatePairingLockInfo:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v12 = -[FMDPairingLockUpdateInfoAction initWithProvider:updateRequestInfo:]([FMDPairingLockUpdateInfoAction alloc], "initWithProvider:updateRequestInfo:", v11, v7);
    v8[2](v8, 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100077704;
    v19[3] = &unk_1002C1690;
    v20 = v7;
    -[FMDPairingLockUpdateInfoAction performOnActionCompletion:](v12, "performOnActionCompletion:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v14 = objc_msgSend(v13, "enqueueAction:", v12);

LABEL_9:
    goto LABEL_10;
  }
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v16));

  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v8)
  {
    v12 = (FMDPairingLockUpdateInfoAction *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v11));
    ((void (**)(id, FMDPairingLockUpdateInfoAction *))v8)[2](v8, v12);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)pairingCheckWith:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, FMDPairingCheckCommandAction *, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  FMDPairingCheckCommandAction *v12;
  void *v13;
  id v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;

  v7 = a3;
  v8 = (void (**)(id, FMDPairingCheckCommandAction *, _QWORD))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPXPCServer pairingCheckWith:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v12 = -[FMDPairingCheckCommandAction initWithProvider:pairingCheckRequestInfo:]([FMDPairingCheckCommandAction alloc], "initWithProvider:pairingCheckRequestInfo:", v11, v7);
    -[FMDPairingCheckCommandAction performOnActionCompletion:](v12, "performOnActionCompletion:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v14 = objc_msgSend(v13, "enqueueAction:", v12);

LABEL_9:
    goto LABEL_10;
  }
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v16));

  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v8)
  {
    v12 = (FMDPairingCheckCommandAction *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v11));
    v8[2](v8, v12, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)soundStoppedForAccessoryIdentifier:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;

  v5 = a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FMDFMIPXPCServer soundStoppedForAccessoryIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryRegistry"));
    v10 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accessoryForIdentifier:](v9, "accessoryForIdentifier:", v10));
    -[NSObject updateAccessory:playbackChannels:](v9, "updateAccessory:playbackChannels:", v11, &__NSArray0__struct);

  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v14 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10022A718();
  }

}

- (void)playSoundWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  FMDMessage *v13;
  NSString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;

  v6 = (void (**)(id, _QWORD))a4;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPXPCServer playSoundWithOptions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v10 = objc_msgSend(v9, "lostModeIsActive");

    if (v10)
    {
      v11 = sub_1000031B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting a play sound message", buf, 2u);
      }

      v13 = objc_alloc_init(FMDMessage);
      -[FMDMessage setPlaySound:](v13, "setPlaySound:", 1);
      -[FMDMessage setSoundName:](v13, "setSoundName:", CFSTR("fmd_sound"));
      -[FMDMessage setSoundDuration:](v13, "setSoundDuration:", 120);
      -[FMDMessage setIsHighPrioritySound:](v13, "setIsHighPrioritySound:", 1);
      -[FMDMessage setIsFmipSound:](v13, "setIsFmipSound:", 1);
      -[FMDMessage setVibrate:](v13, "setVibrate:", 1);
      -[FMDMessage activate](v13, "activate");
      v6[2](v6, 0);
    }
    else
    {
      v13 = (FMDMessage *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 9, CFSTR("Cannot play sound while not in lost mode.")));
      ((void (**)(id, FMDMessage *))v6)[2](v6, v13);
    }
  }
  else
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v13 = (FMDMessage *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v15));

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v6)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v13));
      ((void (**)(id, void *))v6)[2](v6, v18);

    }
  }

}

- (void)clearData:(unint64_t)a3 completion:(id)a4
{
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  FMDAccessoryLocationStore *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;

  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPXPCServer clearData:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    if (a3 == 1)
    {
      v10 = objc_alloc_init(FMDAccessoryLocationStore);
      -[FMDAccessoryLocationStore clearAccessoryLocationStore](v10, "clearAccessoryLocationStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryLocationStore"));
      objc_msgSend(v12, "clearAccessoryLocationStore");

    }
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v14));

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v7)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v15));
      ((void (**)(id, void *))v7)[2](v7, v18);

    }
  }

}

- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (-[FMDFMIPXPCServer _hasRepairDeviceAccessEntitlement](self, "_hasRepairDeviceAccessEntitlement"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    objc_msgSend(v9, "deviceEligibleForRepairWithContext:completion:", v7, v8);

  }
  else
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v11));

    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v12));
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

  }
}

- (void)enableRepairWithContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _OWORD v18[2];

  v7 = a3;
  v8 = a4;
  if (-[FMDFMIPXPCServer _hasRepairDeviceAccessEntitlement](self, "_hasRepairDeviceAccessEntitlement"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v10 = v9;
    if (v9)
    {
      memset(v18, 0, sizeof(v18));
      objc_msgSend(v9, "auditToken");
      v11 = (void *)xpc_copy_code_signing_identity_for_token(v18);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
      free(v11);
    }
    else
    {
      v12 = CFSTR("unknown");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    objc_msgSend(v17, "enableRepairWithContext:callingClient:completion:", v7, v12, v8);

    v8 = v17;
  }
  else
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v14));

    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v10));
    (*((void (**)(id, _QWORD, __CFString *))v8 + 2))(v8, 0, v12);
  }

}

- (void)requireDisableLocationWithCompletion:(id)a3
{
  void (**v5)(id, uint64_t, void *);
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  unsigned int v30;

  v5 = (void (**)(id, uint64_t, void *))a3;
  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    if (objc_msgSend(v6, "isInternalBuild"))
    {
      v7 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("SimulateRequireDisableLocationFailure"), kFMDNotBackedUpPrefDomain);

      if (v7)
      {
        v8 = sub_1000532DC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "requireDisableLocationWithCompletion simulating failure.", buf, 2u);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 12, 0));
        v5[2](v5, -1, v10);
        goto LABEL_23;
      }
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v10 = v16;
    if (v16)
    {
      v17 = objc_msgSend(v16, "fmipState") == (id)1 || objc_msgSend(v10, "fmipState") == 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
      v22 = objc_msgSend(v21, "isFMIPLocationServicesEnabled");

      v23 = sub_1000532DC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v26 = v17 & v22;
        v27 = 1024;
        v28 = v17;
        v29 = 1024;
        v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "requireDisableLocationWithCompletion result %li, fmip: %i, locationService: %i.", buf, 0x18u);
      }

      v5[2](v5, v17 & v22, 0);
      goto LABEL_23;
    }
    v18 = sub_1000532DC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10022AA88();

    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 2, 0));
LABEL_18:
    v20 = (void *)v15;
    v5[2](v5, -1, (void *)v15);

    goto LABEL_23;
  }
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v12));

  v13 = sub_1000532DC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v5)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v10));
    goto LABEL_18;
  }
LABEL_23:

}

- (void)disableLocationDisplayWithCompletion:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  void (**v20)(id, void *);
  uint8_t buf[16];

  v5 = (void (**)(id, void *))a3;
  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    if (objc_msgSend(v6, "isInternalBuild"))
    {
      v7 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("SimulateDisableLocationDisplayFailure"), kFMDNotBackedUpPrefDomain);

      if (v7)
      {
        v8 = sub_1000532DC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "disableLocationDisplayWithCompletion simulating failure.", buf, 2u);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 12, 0));
        v5[2](v5, v10);
        goto LABEL_19;
      }
    }
    else
    {

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    if (v10)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000789F0;
      v19[3] = &unk_1002C1598;
      v20 = v5;
      objc_msgSend(v10, "disableLocationDisplayWithCompletion:", v19);
      v16 = v20;
LABEL_18:

      goto LABEL_19;
    }
    v17 = sub_1000532DC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10022AA88();

    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 2, 0));
LABEL_17:
    v16 = (void *)v15;
    v5[2](v5, (void *)v15);
    goto LABEL_18;
  }
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v12));

  v13 = sub_1000532DC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_10022A718();

  if (v5)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v10));
    goto LABEL_17;
  }
LABEL_19:

}

- (void)_forceFMWUpgradeAlertUsingCallback:(id)a3
{
  -[FMDFMIPXPCServer _forceUpgradeAlertForKey:UsingCallback:](self, "_forceUpgradeAlertForKey:UsingCallback:", CFSTR("ShowFMWUpgradeAlert"), a3);
}

- (void)_forceUpgradeAlertForKey:(id)a3 UsingCallback:(id)a4
{
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  char *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSString *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void (**v42)(id, _QWORD);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;

  v46 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[FMDFMIPXPCServer _forceUpgradeAlertForKey:UsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    v11 = objc_msgSend(v10, "isInternalBuild");

    if (v11)
    {
      v42 = v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getPairedDevices"));

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v50;
        v17 = NRDevicePropertyIsPaired;
        v45 = NRDevicePropertyPairingID;
        v44 = NRDevicePropertyLocalPairingDataStorePath;
        v43 = NRDevicePropertyUDID;
        do
        {
          v18 = 0;
          v47 = v15;
          do
          {
            if (*(_QWORD *)v50 != v16)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", v17));
            v21 = objc_msgSend(v20, "BOOLValue");

            if (v21)
            {
              v22 = v17;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", v45));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", v44));
              v25 = objc_alloc((Class)NPSDomainAccessor);
              v26 = objc_msgSend(v25, "initWithDomain:pairingID:pairingDataStore:", kFMDWatchNotBackedUpPrefDomain, v23, v24);
              v27 = objc_msgSend(v26, "synchronize");
              v28 = sub_1000031B8();
              v29 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", v43));
                *(_DWORD *)buf = 138412290;
                v56 = v30;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Forcing AL upgrade alert for device with udid %@", buf, 0xCu);

              }
              objc_msgSend(v26, "setBool:forKey:", 1, v46);
              v31 = objc_msgSend(v26, "synchronize");
              v32 = (void *)objc_opt_new(NPSManager);
              v33 = kFMDWatchNotBackedUpPrefDomain;
              v53 = v46;
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v34));
              objc_msgSend(v32, "synchronizeNanoDomain:keys:", v33, v35);

              v17 = v22;
              v15 = v47;
            }
            v18 = (char *)v18 + 1;
          }
          while (v15 != v18);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v15);
      }

      v7 = v42;
    }
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v36 = NSStringFromSelector(a2);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v37));

    v39 = sub_1000031B8();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (v7)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 6, v38));
      ((void (**)(id, void *))v7)[2](v7, v41);

    }
  }

}

- (void)setDailyLocateReportEnabled:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  int v8;
  const char *v9;

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[FMDFMIPXPCServer setDailyLocateReportEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v7 = objc_msgSend(v6, "isInternalBuild");

  if (v7)
    -[FMDFMIPXPCServer scheduleDailyLocateReportXPCActivity](self, "scheduleDailyLocateReportXPCActivity");
}

- (void)showDailyLocateReport
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)FMAlert);
  objc_msgSend(v5, "setCategory:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer locateStats](self, "locateStats"));
  objc_msgSend(v5, "setMsgText:", v3);

  objc_msgSend(v5, "setMsgTitle:", CFSTR("FMIP Daily Locate Report"));
  objc_msgSend(v5, "setShowMsgInLockScreen:", 1);
  objc_msgSend(v5, "setDismissMsgOnUnlock:", 0);
  objc_msgSend(v5, "setDismissMsgOnLock:", 0);
  objc_msgSend(v5, "setDefaultButtonTitle:", CFSTR("OK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v4, "activateAlert:", v5);

}

- (void)scheduleDailyLocateReportXPCActivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000791F8;
  handler[3] = &unk_1002C4040;
  handler[4] = self;
  xpc_activity_register((const char *)objc_msgSend(CFSTR("com.apple.icloud.findmydeviced.dailyReportSchedule"), "cStringUsingEncoding:", 4), v3, handler);

}

- (id)locateStats
{
  FMDEventLoggerFacilityOnDiskStats *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  __CFString *v20;

  v2 = objc_alloc_init(FMDEventLoggerFacilityOnDiskStats);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100075F6C;
  v19 = sub_100075F7C;
  v20 = &stru_1002CD590;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1002CD590, "stringByAppendingString:", CFSTR("Locates during the past 3 days\n")));
  v4 = (void *)v16[5];
  v16[5] = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats loggedEventsForEventName:](v2, "loggedEventsForEventName:", CFSTR("FMDLocatorLocateEvent")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  v9 = 0;
  for (i = 3; i; --i)
  {
    v11 = v9 + 1;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100079514;
    v14[3] = &unk_1002C4068;
    *(double *)&v14[5] = v8 - (double)(v9 + 1) * 86400.0;
    *(double *)&v14[6] = v8 - (double)v9 * 86400.0;
    v14[4] = &v15;
    v14[7] = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
    v9 = v11;
  }
  v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (id)_deviceIdentifiersForSignature
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v31;
  uint8_t buf[4];
  void *v33;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internationalMobileEquipmentIdentity"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("imei"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mobileEquipmentIdentifier"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("meid"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "escrowHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hexString"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("escrowHash"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ecid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), objc_msgSend(v13, "longLongValue")));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("ecid"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chipId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), objc_msgSend(v16, "longLongValue")));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("chipId"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "wifiMacAddress"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("wifiMac"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "btMacAddress"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("btMac"), v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
  v31 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "inFieldCollectionReceipt:", &v31));
  v24 = v31;
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("ifcReceipt"), v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fm_commaSeparatedString"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("collectionError"), v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  LODWORD(v23) = objc_msgSend(v26, "isInternalBuild");

  if ((_DWORD)v23)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description"));
    objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("collectionErrorDetail"), v27);

  }
  v28 = sub_1000031B8();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v2;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Generated device identifiers %@", buf, 0xCu);
  }

  return v2;
}

- (BOOL)_hasRepairDeviceAccessEntitlement
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.icloud.FindMyDevice.RepairDevice.access")));

  if (v3)
    v4 = objc_msgSend(&__kCFBooleanTrue, "isEqual:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasAuthAccessEntitlement
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.icloud.findmydeviced.access.auth")));

  if (v3)
    v4 = objc_msgSend(&__kCFBooleanTrue, "isEqual:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_errorForCode:(int)a3 message:(id)a4
{
  __CFString *v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  id v10;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v5 = (__CFString *)a4;
  v6 = objc_alloc((Class)NSError);
  v7 = kFMDErrorDomain;
  if (v5)
    v8 = v5;
  else
    v8 = &stru_1002CD590;
  v12 = NSLocalizedFailureReasonErrorKey;
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v10 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, a3, v9);

  return v10;
}

- (void)sendPairedDeviceLostModeExitAuthToken:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  FMDNanoSupportProtoLostModeExitAuth *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preparing to send exit lost mode token to ids device.", buf, 2u);
  }

  v10 = objc_alloc_init(FMDNanoSupportProtoLostModeExitAuth);
  -[FMDNanoSupportProtoLostModeExitAuth setLostModeExitAuthToken:](v10, "setLostModeExitAuthToken:", v7);

  v11 = objc_alloc((Class)IDSProtobuf);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoLostModeExitAuth data](v10, "data"));
  v13 = objc_msgSend(v11, "initWithProtobufData:type:isResponse:", v12, 6, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer protectedIDSManager](self, "protectedIDSManager"));
  objc_msgSend(v14, "sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:deviceID:requestAcceptedHandler:responseHandler:", v13, 0, 0, 1, v6, &stru_1002C40A8, 60.0, 0);

}

- (void)activationLockInfoFromDeviceWithCompletion:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - activationLockInfoWithCompletion", buf, 2u);
  }

  if (!-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v10));

    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    goto LABEL_9;
  }
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    objc_msgSend(v8, "activationLockInfoWithCompletion:", v5);
LABEL_9:

  }
}

- (void)activationLockAuthInfoWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  FMDFMIPXPCServer *v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v5 = (void (**)(id, _QWORD, void *))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - activationLockAuthInfo", buf, 2u);
  }

  if (!-[FMDFMIPXPCServer _hasAuthAccessEntitlement](self, "_hasAuthAccessEntitlement"))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v11));

    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022A718();

    if (!v5)
      goto LABEL_15;
    v14 = self;
    v15 = 6;
    v16 = v9;
    goto LABEL_14;
  }
  if (v5)
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v9 = v8;
    if (v8)
    {
      -[__CFString activationLockAuthInfo:](v8, "activationLockAuthInfo:", v5);
LABEL_15:

      goto LABEL_16;
    }
    v17 = sub_1000031B8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No Active Service Provider - cannot provide auth info", v20, 2u);
    }

    v16 = CFSTR("No Active FMDServiceProvider");
    v14 = self;
    v15 = 12;
LABEL_14:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](v14, "_errorForCode:message:", v15, v16));
    v5[2](v5, 0, v19);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)updateMaskedAppleIDWith:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DAEMON API - updateMaskedAppleID %@", buf, 0xCu);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    if (v7 && objc_msgSend(v7, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
      objc_msgSend(v11, "updateMaskedAppleID:", v7);

      if (v8)
        v8[2](v8, 0);
    }
    else if (v8)
    {
      v17 = NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No maskedAppleID specified %@"), v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPXPCServer _errorForCode:message:](self, "_errorForCode:message:", 1, v19));
      ((void (**)(id, void *))v8)[2](v8, v20);

    }
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10022A718();

  }
}

- (void)clearMaskedAppleIDWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[16];

  v5 = (void (**)(id, _QWORD))a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - clearMaskedAppleID", buf, 2u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    objc_msgSend(v8, "clearMaskedAppleIDValue");

    v5[2](v5, 0);
  }
  else
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v10));

    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022A718();

  }
}

- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DAEMON API - storeOfflineFindingInfo", buf, 2u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    objc_msgSend(v11, "storeOfflineFindingInfo:completion:", v7, v8);
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v13));

    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10022A718();

  }
}

- (void)fetchOfflineFindingInfoWithCompletion:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - fetchOfflineFindingInfo", buf, 2u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    objc_msgSend(v8, "fetchOfflineFindingInfoWithCompletion:", v5);
  }
  else
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v10));

    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10022A718();

  }
}

- (void)clearOfflineFindingInfoWithCompletion:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - clearOfflineFindingInfo", buf, 2u);
  }

  if (-[FMDFMIPXPCServer _hasClientAccessEntitlement](self, "_hasClientAccessEntitlement"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    objc_msgSend(v8, "clearOfflineFindingInfoWithCompletion:", v5);
  }
  else
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entitlement not found for %@"), v10));

    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10022A718();

  }
}

- (void)fetchAPNSTokenWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAEMON API - fetchAPNSToken", v8, 2u);
  }

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "apsToken"));
    v3[2](v3, v7, 0);

  }
}

- (void)startLocationMonitoring:(id)a3
{
  void (**v3)(id, _QWORD);
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void (**)(id, _QWORD))a3;
  v4 = sub_10005318C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAEMON API - startLocationMonitoring", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationMonitor"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationMonitor"));
    objc_msgSend(v8, "startLocationMonitor:", v3);

  }
  else
  {
    v9 = sub_10005318C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while starting. Calling completion immediately", v11, 2u);
    }

    v3[2](v3, 0);
  }

}

- (void)stopLocationMonitoring:(id)a3
{
  void (**v3)(id, _QWORD);
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void (**)(id, _QWORD))a3;
  v4 = sub_10005318C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAEMON API - stopLocationMonitoring", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationMonitor"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationMonitor"));
    objc_msgSend(v8, "stopLocationMonitor:", v3);

  }
  else
  {
    v9 = sub_10005318C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while stopping. Calling completion immediately", v11, 2u);
    }

    v3[2](v3, 0);
  }

}

- (void)updatedConfigReceived:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAEMON API - updatedConfigReceived", v11, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationMonitor"));
  objc_msgSend(v10, "updateMonitorConfig:", v6);

  v5[2](v5, 0);
}

- (void)startLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = sub_10005318C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAEMON API - startLocationMonitoringWithContext %@", (uint8_t *)&v14, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationMonitor"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationMonitor"));
    objc_msgSend(v11, "startLocationMonitorWithContext:completion:", v5, v6);

  }
  else
  {
    v12 = sub_10005318C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while starting with policy. Calling completion immediately", (uint8_t *)&v14, 2u);
    }

    v6[2](v6, 0);
  }

}

- (void)startLocationMonitoringWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = sub_10005318C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DAEMON API - startLocationMonitoringWithContext %@", (uint8_t *)&v16, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "locationMonitor"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "locationMonitor"));
    objc_msgSend(v13, "startLocationMonitorWithContext:forcePublish:completion:", v7, v6, v8);

  }
  else
  {
    v14 = sub_10005318C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while starting with policy. Calling completion immediately", (uint8_t *)&v16, 2u);
    }

    v8[2](v8, 0);
  }

}

- (void)stopLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = sub_10005318C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAEMON API - stopLocationMonitorWithContext %@", (uint8_t *)&v14, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationMonitor"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationMonitor"));
    objc_msgSend(v11, "stopLocationMonitorWithContext:completion:", v5, v6);

  }
  else
  {
    v12 = sub_10005318C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while stopping with context. Calling completion immediately", (uint8_t *)&v14, 2u);
    }

    v6[2](v6, 0);
  }

}

- (void)didAddLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a4;
  v6 = a3;
  v7 = sub_10005318C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAEMON API - didAddLocalFindableAccessory", v10, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  objc_msgSend(v9, "registerAccessory:completion:", v6, v5);

}

- (void)didRemoveLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a4;
  v6 = a3;
  v7 = sub_10005318C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAEMON API - didRemoveLocalFindableAccessory", v10, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  objc_msgSend(v9, "unregisterAccessory:completion:", v6, v5);

}

- (FMNanoIDSManager)protectedIDSManager
{
  return self->_protectedIDSManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedIDSManager, 0);
}

@end
