@implementation PHInCallUIUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024054;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3740 != -1)
    dispatch_once(&qword_1000A3740, block);
  return (id)qword_1000A3738;
}

- (PHInCallUIUtilities)init
{
  PHInCallUIUtilities *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  unsigned int (*v7)(_QWORD);
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v9.receiver = self;
  v9.super_class = (Class)PHInCallUIUtilities;
  v2 = -[PHInCallUIUtilities init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:](FBSDisplayLayoutMonitor, "sharedMonitorForDisplayType:", 0));
    v4 = (void *)objc_opt_class(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentLayout"));
    if ((objc_msgSend(v4, "layoutIsLocked:", v5) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v7 = (unsigned int (*)(_QWORD))off_1000A3778;
      v14 = off_1000A3778;
      if (!off_1000A3778)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100024EC4;
        v10[3] = &unk_100089D50;
        v10[4] = &v11;
        sub_100024EC4((uint64_t)v10);
        v7 = (unsigned int (*)(_QWORD))v12[3];
      }
      _Block_object_dispose(&v11, 8);
      if (!v7)
        sub_100054EA4();
      v6 = v7(0) != 0;
    }
    v2->_springBoardLocked = v6;

    objc_msgSend(v3, "addObserver:", v2);
  }
  return v2;
}

+ (id)telephonyClient
{
  if (qword_1000A3750 != -1)
    dispatch_once(&qword_1000A3750, &stru_100089CE8);
  return (id)qword_1000A3748;
}

+ (int64_t)interfaceOrientationForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

+ (int64_t)deviceOrientationForBSInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 1;
  else
    return qword_100066E98[a3 - 2];
}

+ (id)handleNavigationControllerIfNecessary:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

+ (BOOL)shouldRequestPasscodeUnlockForMMICode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  _BYTE v40[14];
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("*#06#")) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "telephonyClient"));
    v38 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSubscriptionInfoWithError:", &v38));
    v7 = v38;

    if (v7)
    {
      v8 = sub_10000E6C4();
      v32 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_100054F78();
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v32 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 2);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v14)
        {
          v15 = v14;
          v30 = v6;
          v31 = v4;
          v7 = 0;
          v16 = *(_QWORD *)v35;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v18, "isSimHidden", v30, v31) & 1) == 0)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "telephonyClient"));
                v33 = v7;
                v20 = objc_msgSend(v19, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v18, CFSTR("ShowIMEIsInLockScreen"), v32, &v33);
                v21 = v33;

                if (v21)
                {
                  v22 = sub_10000E6C4();
                  v23 = objc_claimAutoreleasedReturnValue(v22);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v40 = v21;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Received error: %@ while querying -copyCarrierBundleValueWithDefault", buf, 0xCu);
                  }

                }
                else
                {
                  if ((objc_opt_respondsToSelector(v20, "BOOLValue") & 1) != 0)
                    v24 = objc_msgSend(v20, "BOOLValue");
                  else
                    v24 = 0;
                  v25 = sub_10000E6C4();
                  v26 = objc_claimAutoreleasedReturnValue(v25);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uuid"));
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v40 = v24;
                    *(_WORD *)&v40[4] = 2112;
                    *(_QWORD *)&v40[6] = v20;
                    v41 = 2112;
                    v42 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received regionWantsPasscodeBypassForIMEI: %d from carrierBundleValue: %@ subscription: %@", buf, 0x1Cu);

                  }
                  if ((v24 & 1) != 0)
                  {

                    v9 = 0;
                    v7 = 0;
                    goto LABEL_34;
                  }
                }

                v7 = v21;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            if (v15)
              continue;
            break;
          }
          v9 = 1;
LABEL_34:
          v6 = v30;
          v4 = v31;
        }
        else
        {
          v7 = 0;
          v9 = 1;
        }

        goto LABEL_37;
      }
      v28 = sub_10000E6C4();
      v32 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_100054F18();
      v7 = 0;
    }
    v9 = 1;
LABEL_37:

    goto LABEL_38;
  }
  v10 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Code is not for IMEI, should request passcode unlock", buf, 2u);
  }
  v9 = 1;
LABEL_38:

  return v9;
}

+ (BOOL)isSpringBoardPasscodeLocked
{
  return MKBGetDeviceLockState(0, a2) - 1 < 2;
}

+ (BOOL)layoutIsLocked:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "elements", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = FBSDisplayLayoutElementLockScreenIdentifier;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "identifier"));
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)hasMultipleSenderIdentities
{
  void *v2;
  BOOL v3;

  if (qword_1000A3758 != -1)
    dispatch_once(&qword_1000A3758, &stru_100089D08);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000A3760, "prioritizedSenderIdentities"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

+ (id)fbsOrientationObserver
{
  if (qword_1000A3770 != -1)
    dispatch_once(&qword_1000A3770, &stru_100089D28);
  return (id)qword_1000A3768;
}

+ (BOOL)isExplicitTransferSupportedForSubscriptionLabelIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  BOOL v34;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "telephonyClient"));
  v44 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSubscriptionInfoWithError:", &v44));
  v7 = v44;

  if (v7)
  {
    v8 = sub_10000E6C4();
    v38 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_100055038();
    goto LABEL_30;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
  v10 = objc_msgSend(v9, "count");

  v11 = sub_10000E6C4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v10)
  {
    v38 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100054FD8();
    goto LABEL_29;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
    *(_DWORD *)buf = 138412290;
    v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: all the subscriptions are: %@", buf, 0xCu);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  v38 = v15;
  if (!v16)
  {
LABEL_29:
    v7 = 0;
LABEL_30:
    v34 = 0;
    goto LABEL_31;
  }
  v17 = v16;
  v37 = a1;
  v18 = 0;
  v19 = *(_QWORD *)v41;
  v36 = v4;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v41 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
      v22 = sub_10000E6C4();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: checking subscription: %@", buf, 0xCu);
      }

      if ((objc_msgSend(v21, "isSimHidden") & 1) == 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "labelID"));
        v25 = objc_msgSend(v24, "isEqualToString:", v4);

        if (v25)
        {
          v26 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "telephonyClient"));
          v39 = v18;
          v28 = objc_msgSend(v27, "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v21, &off_10008DCC8, v26, &v39);
          v7 = v39;

          v29 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0
            || (v30 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v28, v30) & 1) != 0))
          {
            v31 = objc_msgSend(v28, "BOOLValue");
          }
          else
          {
            v31 = 0;
          }
          v32 = sub_10000E6C4();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v46 = v28;
            v47 = 2112;
            v48 = v21;
            v49 = 2112;
            v50 = v7;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: retrieved ShowExplicitCallTransferButton value %@ for subscription %@ with error %@", buf, 0x20u);
          }

          if ((v31 & 1) != 0)
          {
            v34 = 1;
            v4 = v36;
            goto LABEL_31;
          }
          v18 = v7;
          v4 = v36;
          v15 = v38;
        }
      }
    }
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v17)
      continue;
    break;
  }
  v34 = 0;
  v7 = v18;
LABEL_31:

  return v34;
}

+ (int64_t)frontboardOrientation
{
  void *v2;
  char *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fbsOrientationObserver"));
  v3 = (char *)objc_msgSend(v2, "activeInterfaceOrientation");
  if ((unint64_t)(v3 - 1) > 3)
    v4 = 0;
  else
    v4 = qword_100066EB0[(_QWORD)(v3 - 1)];

  return v4;
}

- (BOOL)isSpringBoardLocked
{
  return self->_springBoardLocked;
}

- (void)setSpringBoardLocked:(BOOL)a3
{
  self->_springBoardLocked = a3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6;
  unsigned __int8 v7;
  _QWORD v8[5];
  unsigned __int8 v9;

  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(self), "layoutIsLocked:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024E44;
  v8[3] = &unk_100089908;
  v8[4] = self;
  v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

@end
