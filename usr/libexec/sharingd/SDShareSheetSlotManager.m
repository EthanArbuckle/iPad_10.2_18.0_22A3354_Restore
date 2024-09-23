@implementation SDShareSheetSlotManager

+ (id)sharedManager
{
  if (qword_1007C6A50 != -1)
    dispatch_once(&qword_1007C6A50, &stru_100718A50);
  return (id)qword_1007C6A48;
}

- (SDShareSheetSlotManager)init
{
  SDShareSheetSlotManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sessionIDToShareSheetSession;
  SDShareSheetAccessibilityCache *v5;
  SDShareSheetAccessibilityCache *accessibilityCache;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDShareSheetSlotManager;
  v2 = -[SDShareSheetSlotManager init](&v9, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    sessionIDToShareSheetSession = v2->_sessionIDToShareSheetSession;
    v2->_sessionIDToShareSheetSession = v3;

    v5 = objc_alloc_init(SDShareSheetAccessibilityCache);
    accessibilityCache = v2->_accessibilityCache;
    v2->_accessibilityCache = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "transferUpdated:", CFSTR("TransferUpdated"), 0);

    v2->_contextLock._os_unfair_lock_opaque = 0;
    +[SDSuggestionBrowser initializeCache](SDSuggestionBrowser, "initializeCache");
  }
  return v2;
}

- (id)_createShareSheetContext
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating new share sheet context", v9, 2u);
  }

  v10[0] = kCAContextIgnoresHitTest;
  v10[1] = kCAContextEnablePixelDoubling;
  v10[2] = kCAContextEnablePixelQuadrupling;
  v10[3] = kCAContextDisplayable;
  v11[2] = kCFBooleanTrue;
  v11[3] = kCFBooleanFalse;
  v11[0] = kCFBooleanTrue;
  v11[1] = kCFBooleanTrue;
  v10[4] = kCAContextDisableGroupOpacity;
  v11[4] = kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v4));
  if ((objc_msgSend(v5, "valid") & 1) == 0)
  {
    v6 = share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100160A8C();

  }
  return v5;
}

- (id)getShareSheetSessionForSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  objc_sync_exit(v5);

  return v6;
}

- (id)currentConnection
{
  SDShareSheetSlotManager *v2;
  NSXPCConnection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->__currentConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *currentConnection;
  SDShareSheetSlotManager *obj;

  v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentConnection = obj->__currentConnection;
  obj->__currentConnection = v4;

  objc_sync_exit(obj);
}

- (id)activeConnections
{
  SDShareSheetSlotManager *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSSet copy](v2->__activeConnections, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveConnections:(id)a3
{
  SDShareSheetSlotManager *v4;
  NSSet *v5;
  NSSet *activeConnections;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (NSSet *)objc_msgSend(v7, "copy");
  activeConnections = v4->__activeConnections;
  v4->__activeConnections = v5;

  objc_sync_exit(v4);
}

- (void)transferUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SessionID")));
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RealName")));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TransferText")));
        v11 = objc_msgSend(v10, "integerValue");

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TransferProgress")));
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "floatValue");
          v15 = v14;
        }
        else
        {
          v15 = 0.0;
        }
        -[SDShareSheetSlotManager sendAirDropUpdateForSessionWithID:realName:status:progress:](self, "sendAirDropUpdateForSessionWithID:realName:status:progress:", v7, v8, v11, v15);

      }
      else
      {
        v18 = share_sheet_log();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          sub_100160B78();

      }
    }
    else
    {
      v17 = share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        sub_100160B18();
    }

  }
  else
  {
    v16 = share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100160AB8();
  }

}

- (void)handleAirDropTransferUpdated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "realName"));
  v6 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "progress");
  v8 = v7;

  -[SDShareSheetSlotManager sendAirDropUpdateForSessionWithID:realName:status:progress:](self, "sendAirDropUpdateForSessionWithID:realName:status:progress:", v9, v5, v6, v8);
}

- (void)sendAirDropUpdateForSessionWithID:(id)a3 realName:(id)a4 status:(int64_t)a5 progress:(double)a6
{
  id v10;
  id v11;
  SDShareSheetSlotManager *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  NSObject *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[5];
  _QWORD block[5];
  _QWORD v77[5];
  _QWORD v78[5];
  uint8_t buf[24];

  v10 = a3;
  v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v10));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "airDropController"));
    v16 = objc_msgSend(v15, "hasActiveNearbySharingInteraction");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transferNodes"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v11));

    if (v18)
      v19 = 1;
    else
      v19 = v16;
    if ((v19 & 1) == 0)
    {
      v26 = share_sheet_log();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        sub_100160CA4();
      goto LABEL_39;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v20));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession secondaryLabelColorWithHostConfiguration:](SDShareSheetSession, "secondaryLabelColorWithHostConfiguration:", v21));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hostLocale"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayNameForLocale:](v18, "displayNameForLocale:", v23));

    v24 = objc_msgSend(v14, "lastTransferEvent") == (id)3 || objc_msgSend(v14, "lastTransferEvent") == (id)11;
    objc_msgSend(v14, "setLastTransferEvent:", a5);
    if ((a5 & 0xFFFFFFFFFFFFFFF7) == 3 && v24)
    {
      v27 = &stru_10072FE60;
LABEL_38:

LABEL_39:
      goto LABEL_40;
    }
    if (a5 == 15)
    {
      v30 = SFLocalizedStringForKey(CFSTR("CONVERTING_TEXT"), v28);
      v27 = objc_claimAutoreleasedReturnValue(v30);
      v31 = v72;

      v70 = CFSTR("Converting");
      v32 = 1;
    }
    else
    {
      if ((a5 & 0xFFFFFFFFFFFFFFF7) != 3)
      {
        v71 = 0;
        v27 = &stru_10072FE60;
        v70 = &stru_10072FE60;
        switch(a5)
        {
          case 4:
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "notificationHaptic"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10014CE9C;
            block[3] = &unk_1007146D8;
            block[4] = v36;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            v38 = SFLocalizedStringForKey(CFSTR("DECLINED_TEXT"), v37);
            v27 = objc_claimAutoreleasedReturnValue(v38);
            v39 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));

            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transferNodes"));
            objc_msgSend(v40, "removeObjectForKey:", v11);

            objc_msgSend(v14, "setFiredImpactHaptic:", 0);
            objc_msgSend(v14, "setTransferActive:", 0);

            v70 = CFSTR("Declined");
            v41 = 5;
            goto LABEL_48;
          case 5:
          case 6:
          case 8:
            break;
          case 7:
            if ((objc_msgSend(v14, "firedImpactHaptic") & 1) == 0)
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "impactHaptic"));
              v78[0] = _NSConcreteStackBlock;
              v78[1] = 3221225472;
              v78[2] = sub_10014CE88;
              v78[3] = &unk_1007146D8;
              v78[4] = v61;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, v78);
              objc_msgSend(v14, "setFiredImpactHaptic:", 1);

            }
            v62 = SFLocalizedStringForKey(CFSTR("SENDING_TEXT"), v60);
            v27 = objc_claimAutoreleasedReturnValue(v62);
            v31 = v72;

            v70 = CFSTR("Sending");
            v32 = 3;
            goto LABEL_22;
          case 9:
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "notificationHaptic"));
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472;
            v77[2] = sub_10014CE90;
            v77[3] = &unk_1007146D8;
            v77[4] = v56;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v77);
            v58 = SFLocalizedStringForKey(CFSTR("SENT_TEXT"), v57);
            v27 = objc_claimAutoreleasedReturnValue(v58);
            v39 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));

            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transferNodes"));
            objc_msgSend(v59, "removeObjectForKey:", v11);

            objc_msgSend(v14, "setFiredImpactHaptic:", 0);
            objc_msgSend(v14, "setTransferActive:", 0);

            v70 = CFSTR("Sent");
            v41 = 4;
            goto LABEL_48;
          case 10:
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "notificationHaptic"));
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = sub_10014CEA8;
            v75[3] = &unk_1007146D8;
            v75[4] = v63;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v75);
            v65 = SFLocalizedStringForKey(CFSTR("FAILED_TEXT"), v64);
            v27 = objc_claimAutoreleasedReturnValue(v65);
            v39 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));

            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transferNodes"));
            objc_msgSend(v66, "removeObjectForKey:", v11);

            objc_msgSend(v14, "setFiredImpactHaptic:", 0);
            objc_msgSend(v14, "setTransferActive:", 0);

            v70 = CFSTR("Failed");
            v41 = 6;
LABEL_48:
            v71 = v41;
            v74 = (void *)v39;
            break;
          default:
            v70 = &stru_10072FE60;
            break;
        }
LABEL_23:
        if ((v16 & 1) != 0)
        {
          v34 = 0;
          v35 = 0;
        }
        else if (objc_msgSend(v14, "skipSlotsRendering"))
        {
          v34 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithText:", v73);
          v35 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithText:", v27);
        }
        else
        {
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "xpcHelperCnx"));
          if (!v42)
          {
            v55 = share_sheet_log();
            v34 = objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              sub_100160C44();
            goto LABEL_37;
          }
          v68 = (void *)v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v43));

          +[CATransaction begin](CATransaction, "begin");
          memset(buf, 0, sizeof(buf));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration"));
          -[SDShareSheetSlotManager _createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:](v12, "_createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:", v73, v67, 1, 1, 0, v68, v44);

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration"));
          -[SDShareSheetSlotManager _createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:](v12, "_createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:", v27, v74, 1, 1, 1, v68, v45);

          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)buf));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v73, v46);

          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v27, v47);

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v12, "accessibilityCache"));
          objc_msgSend(v48, "addEntriesFromDictionary:", v69);

          +[CATransaction commit](CATransaction, "commit");
          +[CATransaction flush](CATransaction, "flush");
          v49 = objc_alloc((Class)SFProxyText);
          v34 = objc_msgSend(v49, "initWithSlotIdentifier:", *(unsigned int *)buf);
          v35 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithSlotIdentifier:", 0);

        }
        v50 = share_sheet_log();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v73;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v70;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Set status for %@ to %@", buf, 0x16u);
        }

        if ((v16 & 1) != 0)
        {
          v52 = 0;
        }
        else
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "realNameToNodeID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v11));

        }
        v54 = objc_msgSend(objc_alloc((Class)SFAirDropTransferChange), "initWithState:progress:proxyIdentifier:displayName:status:", v71, v52, v34, v35, a6);
        -[SDShareSheetSlotManager notifySession:withAirDropTransferChange:](v12, "notifySession:withAirDropTransferChange:", v14, v54);

LABEL_37:
        goto LABEL_38;
      }
      v33 = SFLocalizedStringForKey(CFSTR("WAITING_TEXT"), v28);
      v27 = objc_claimAutoreleasedReturnValue(v33);
      v31 = v72;

      v70 = CFSTR("Waiting");
      v32 = 2;
    }
LABEL_22:
    v71 = v32;
    v74 = v31;
    goto LABEL_23;
  }
  v25 = share_sheet_log();
  v18 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_100160BD8();
LABEL_40:

  objc_sync_exit(v12);
}

- (void)activate
{
  SDShareSheetSlotManager *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSXPCListener *v11;
  NSXPCListener *xpcListener;
  int v13;
  void *v14;

  v2 = self;
  v3 = objc_sync_enter(v2);
  if (v2->_activateCalled)
  {
    v4 = daemon_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100160D04();

  }
  else
  {
    v6 = daemon_log(v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager machServiceName](v2, "machServiceName"));
      v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v13, 0xCu);

    }
    v2->_activateCalled = 1;
    v9 = objc_alloc((Class)NSXPCListener);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager machServiceName](v2, "machServiceName"));
    v11 = (NSXPCListener *)objc_msgSend(v9, "initWithMachServiceName:", v10);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v11;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
    +[_UIActivityHelper registerContinuousExtensionsDiscoveryOnLaunch](_UIActivityHelper, "registerContinuousExtensionsDiscoveryOnLaunch");
  }
  objc_sync_exit(v2);

}

- (void)invalidate
{
  SDShareSheetSlotManager *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidateCalled)
  {
    v2->_invalidateCalled = 1;
    -[NSXPCListener invalidate](v2->_xpcListener, "invalidate");
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager activeConnections](v2, "activeConnections", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "invalidate");
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    v2->_invalidateDone = 1;
  }
  objc_sync_exit(v2);

}

- (id)_remoteObjectProxyForConnection:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  location = 0;
  objc_initWeak(&location, v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014D258;
  v6[3] = &unk_100718A78;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v6));
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)configurationForDataSourceUpdateWithSession:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UISDShareSheetSessionConfiguration *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  void *v38;
  _DWORD v39[2];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend(v4, "sharingExpanded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peopleNodes"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = objc_opt_new(NSMutableArray);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostConfiguration"));
      v10 = objc_msgSend(v9, "isCollaborative");

      if ((v10 & 1) == 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "airDropNodes"));
        -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v11);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peopleNodes"));
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isRestricted == NO")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](v8, "filteredArrayUsingPredicate:", v13));

    }
    else
    {
      v14 = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostShareActivityProxies"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isRestricted == NO")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v17));

  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  v18 = objc_alloc_init(UISDShareSheetSessionConfiguration);
  -[UISDShareSheetSessionConfiguration setPeopleProxies:](v18, "setPeopleProxies:", v14);
  -[UISDShareSheetSessionConfiguration setShareProxies:](v18, "setShareProxies:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostActionActivityProxies"));
  -[UISDShareSheetSessionConfiguration setActionProxies:](v18, "setActionProxies:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nearbyCountSlotID"));
  -[UISDShareSheetSessionConfiguration setNearbyCountSlotID:](v18, "setNearbyCountSlotID:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "nearbyCountBadge")));
  -[UISDShareSheetSessionConfiguration setNearbyCountBadge:](v18, "setNearbyCountBadge:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostConfiguration"));
  if (objc_msgSend(v22, "requestPeopleSuggestionsData"))
  {
    v23 = objc_msgSend(v4, "hideSuggestions");

    if ((v23 & 1) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connection"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForEntitlement:", CFSTR("com.apple.sharesheet.allow-suggestions")));

      if (v25
        && (v27 = objc_opt_class(NSNumber, v26), (objc_opt_isKindOfClass(v25, v27) & 1) != 0)
        && objc_msgSend(v25, "BOOLValue"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionBrowser"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "peopleSuggestions"));
        -[UISDShareSheetSessionConfiguration setPeopleSuggestions:](v18, "setPeopleSuggestions:", v29);

      }
      else
      {
        v30 = share_sheet_log();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connection"));
          v39[0] = 67109120;
          v39[1] = objc_msgSend(v38, "processIdentifier");
          _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "process %d tried to request people suggestions data, but it was not entitled!", (uint8_t *)v39, 8u);

        }
      }

    }
  }
  else
  {

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screenTimeMonitor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "restrictedActivityTypes"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connection"));
  v35 = -[SDShareSheetSlotManager _hasCollaborationEntitlementForConnection:](v5, "_hasCollaborationEntitlementForConnection:", v34);

  if ((v35 & 1) == 0)
  {
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "arrayByAddingObject:", CFSTR("com.apple.Collaboration.Internal")));

    v33 = (void *)v36;
  }
  -[UISDShareSheetSessionConfiguration setRestrictedActivityTypes:](v18, "setRestrictedActivityTypes:", v33);
  -[UISDShareSheetSessionConfiguration setShouldBlockPresentation:](v18, "setShouldBlockPresentation:", -[SDShareSheetSlotManager wantsToBlockPresentation](v5, "wantsToBlockPresentation"));

  objc_sync_exit(v5);
  return v18;
}

- (BOOL)_hasCollaborationEntitlementForConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;
  char v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.developer.shared-with-you.collaboration")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.developer.shared-with-you")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.sociallayer.highlights")));

  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    v10 = objc_msgSend(v4, "BOOLValue") ^ 1;
  else
    v10 = 1;
  v11 = objc_opt_class(NSNumber, v9);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
    v13 = objc_msgSend(v5, "BOOLValue");
  else
    v13 = 0;
  v14 = objc_opt_class(NSNumber, v12);
  if ((objc_opt_isKindOfClass(v6, v14) & 1) == 0)
  {
    v15 = 0;
    if (!v10)
      goto LABEL_9;
LABEL_11:
    v16 = v13 | v15;
    goto LABEL_12;
  }
  v15 = objc_msgSend(v6, "BOOLValue");
  if (v10)
    goto LABEL_11;
LABEL_9:
  v16 = 1;
LABEL_12:

  return v16;
}

- (void)dataSourceDidUpdateForSession:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SDShareSheetSlotManager *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  os_signpost_id_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
    v11 = NSStringFromBOOL(objc_msgSend(v6, "remoteShareSheet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v33 = 138412546;
    v34 = v10;
    v35 = 2112;
    v36 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "data source did update for sessionID:%@ isRemoteShareSheet:%@", (uint8_t *)&v33, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager configurationForDataSourceUpdateWithSession:](v7, "configurationForDataSourceUpdateWithSession:", v6));
  objc_msgSend(v13, "setWantsAnimation:", v4);
  if (objc_msgSend(v6, "remoteShareSheet"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uiServiceConnection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v7, "_remoteObjectProxyForConnection:", v14));

    if (v15)
    {
      v16 = share_sheet_log();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 138412290;
        v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "update remote share sheet with configuration:%@", (uint8_t *)&v33, 0xCu);
      }

      v18 = share_sheet_log();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = share_sheet_log();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = os_signpost_id_make_with_pointer(v21, v7);

      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        LOWORD(v33) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v22, "UpdateUIService", " enableTelemetry=YES ", (uint8_t *)&v33, 2u);
      }

      objc_msgSend(v15, "dataSourceUpdatedWithSessionConfiguration:", v13);
      v23 = share_sheet_log();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = share_sheet_log();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = os_signpost_id_make_with_pointer(v26, v7);

      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        LOWORD(v33) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v27, "UpdateUIService", " enableTelemetry=YES ", (uint8_t *)&v33, 2u);
      }
    }
    else
    {
      v31 = share_sheet_log();
      v24 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100160DC8();
    }
LABEL_21:

    goto LABEL_22;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v7, "_remoteObjectProxyForConnection:", v28));

  if (!v15)
  {
    v32 = share_sheet_log();
    v24 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100160DF4();
    goto LABEL_21;
  }
  v29 = share_sheet_log();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138412290;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "update host share sheet with configuration:%@", (uint8_t *)&v33, 0xCu);
  }

  objc_msgSend(v15, "dataSourceUpdatedWithSessionConfiguration:", v13);
LABEL_22:

  objc_sync_exit(v7);
}

- (void)notifySession:(id)a3 favoritesProxies:(id)a4 suggestionProxies:(id)a5 activityCategory:(int64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int64_t v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v22, "remoteShareSheet") & 1) != 0)
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uiServiceConnection"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "connection"));
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](self, "_remoteObjectProxyForConnection:", v12));
  if (a6 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "shareActivities"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", CFSTR("activityUUID")));
    v17 = v14;
    v18 = v10;
    v19 = v11;
    v20 = v16;
    v21 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "actionActivities"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", CFSTR("activityUUID")));
    v17 = v14;
    v18 = v10;
    v19 = v11;
    v20 = v16;
    v21 = a6;
  }
  objc_msgSend(v17, "performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:", v18, v19, v20, v21);

}

- (void)notifySession:(id)a3 activitySelected:(id)a4
{
  id v6;
  SDShareSheetSlotManager *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v7, "_remoteObjectProxyForConnection:", v8));

  v11 = objc_opt_class(SUIHostActivityProxy, v10);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityUUID"));
    objc_msgSend(v9, "performActivityInHostWithUUID:", v13);
LABEL_5:

    goto LABEL_6;
  }
  v14 = objc_opt_class(UIApplicationExtensionActivity, v12);
  if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
  {
    v13 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "hostAppBundleID"));
    v17 = objc_msgSend(v15, "isAppManaged:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "hostConfiguration"));
    LODWORD(v16) = objc_msgSend(v18, "isContentManaged");

    v19 = objc_msgSend(v15, "mayOpenFromManagedToUnmanaged");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UISUIActivityExtensionItemDataRequest requestForActivity:activityType:sourceAppIsManaged:](UISUIActivityExtensionItemDataRequest, "requestForActivity:activityType:sourceAppIsManaged:", v13, v20, (v17 | v16) & (v19 ^ 1)));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationExtension"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
    objc_msgSend(v9, "performExtensionActivityInHostWithBundleID:request:", v23, v21);

    goto LABEL_5;
  }
LABEL_6:

  objc_sync_exit(v7);
}

- (void)notifySession:(id)a3 shortcutSelectedWithBundleID:(id)a4 singleUseToken:(id)a5
{
  id v8;
  id v9;
  SDShareSheetSlotManager *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v10, "_remoteObjectProxyForConnection:", v11));

  objc_msgSend(v12, "performShortcutActivityInHostWithBundleID:singleUseToken:", v8, v9);
  objc_sync_exit(v10);

}

- (void)notifySession:(id)a3 personSelectedWithActivityType:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v8, "_remoteObjectProxyForConnection:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _activityWithActivityType:session:](v8, "_activityWithActivityType:session:", v7, v6));
  v12 = v11;
  if (v11)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activityUUID"));
    objc_msgSend(v10, "performActivityInHostWithUUID:", v13);
  }
  else
  {
    v14 = share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100160E20();
  }

  objc_sync_exit(v8);
}

- (void)notifySession:(id)a3 withAirDropTransferChange:(id)a4
{
  id v6;
  SDShareSheetSlotManager *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v7, "_remoteObjectProxyForConnection:", v8));

  objc_msgSend(v9, "didUpdateAirDropTransferWithChange:", v6);
  objc_sync_exit(v7);

}

- (void)requestAirDropItemsForNode:(id)a3 endpointUUID:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  SDShareSheetSlotManager *v18;
  SDAirDropActivity *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  SDAirDropActivity *v27;
  uint64_t v28;
  _QWORD v29[4];
  SDAirDropActivity *v30;
  id v31;
  id v32;
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endpointUUID"));
    v13 = v10;
    v14 = v12;
    if (v14 == v13)
    {

      v17 = v13;
LABEL_7:

      goto LABEL_8;
    }
    v15 = v14;
    if ((v13 == 0) == (v14 != 0))
    {

LABEL_10:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endpointUUID"));
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetSlotManager.m"), 1925, CFSTR("endpointUUID:%@ mismatching node.endpointUUID:%@"), v13, v28);
      v13 = (id)v28;
      goto LABEL_7;
    }
    v16 = objc_msgSend(v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_10;
  }
LABEL_8:
  v18 = self;
  objc_sync_enter(v18);
  v19 = objc_alloc_init(SDAirDropActivity);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostAppBundleID"));
  -[SDAirDropActivity setSendingAppBundleID:](v19, "setSendingAppBundleID:", v20);

  -[SDAirDropActivity setMaxPreviews:](v19, "setMaxPreviews:", 3);
  objc_msgSend(v11, "setActiveAirDropActivity:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UISUIActivityExtensionItemDataRequest requestForActivity:activityType:activitySpecificMetadata:](UISUIActivityExtensionItemDataRequest, "requestForActivity:activityType:activitySpecificMetadata:", v19, UIActivityTypeAirDrop, 0));
  objc_sync_exit(v18);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v18, "_remoteObjectProxyForConnection:", v22));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10014E468;
  v29[3] = &unk_100718AC8;
  v30 = v19;
  v31 = v11;
  v32 = v10;
  v33 = v9;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v27 = v19;
  objc_msgSend(v23, "willPerformInServiceActivityWithRequest:completion:", v21, v29);

}

- (void)connectToDaemonWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  SHSheetRemoteConnectionContext *v8;
  SDShareSheetSlotManager *v9;
  void *v10;
  void *v11;
  SDShareSheetSession *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  SDShareSheetSession *v16;
  unsigned int v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  SDXPCHelperConnection *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  SHSheetRemoteConnectionContext *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void (**v52)(_QWORD);
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[5];
  SHSheetRemoteConnectionContext *v60;
  id v61;
  id v62;
  id location;
  uint8_t buf[8];
  _QWORD v65[6];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = -[SHSheetRemoteConnectionContext initWithDictionary:]([SHSheetRemoteConnectionContext alloc], "initWithDictionary:", v6);
  v9 = self;
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext urlsBeingShared](v8, "urlsBeingShared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _filterForSharableURLs:](v9, "_filterForSharableURLs:", v10));
  -[SHSheetRemoteConnectionContext setUrlsBeingShared:](v8, "setUrlsBeingShared:", v11);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext sessionIdentifier](v8, "sessionIdentifier"));
  v12 = [SDShareSheetSession alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](v9, "currentConnection"));
  v14 = -[SHSheetRemoteConnectionContext instantShareSheet](v8, "instantShareSheet");
  v15 = -[SHSheetRemoteConnectionContext remoteShareSheet](v8, "remoteShareSheet");
  v16 = -[SDShareSheetSession initWithSessionID:xpcConnection:instantShareSheet:remoteShareSheet:xrRenderingMode:](v12, "initWithSessionID:xpcConnection:instantShareSheet:remoteShareSheet:xrRenderingMode:", v53, v13, v14, v15, -[SHSheetRemoteConnectionContext xrRenderingMode](v8, "xrRenderingMode"));

  -[SDShareSheetSession setDelegate:](v16, "setDelegate:", v9);
  -[SHSheetRemoteConnectionContext peopleSuggestionsTimeout](v8, "peopleSuggestionsTimeout");
  -[SDShareSheetSession setPeopleSuggestionsTimeout:](v16, "setPeopleSuggestionsTimeout:");
  -[SDShareSheetSession setShouldSuggestFamilyMembers:](v16, "setShouldSuggestFamilyMembers:", -[SHSheetRemoteConnectionContext shouldSuggestFamilyMembers](v8, "shouldSuggestFamilyMembers"));
  -[SDShareSheetSession setHideSuggestions:](v16, "setHideSuggestions:", -[SHSheetRemoteConnectionContext hideSuggestions](v8, "hideSuggestions"));
  -[SDShareSheetSession setIsSharePlayAvailable:](v16, "setIsSharePlayAvailable:", -[SHSheetRemoteConnectionContext isSharePlayAvailable](v8, "isSharePlayAvailable"));
  v17 = -[SHSheetRemoteConnectionContext supportsCollaboration](v8, "supportsCollaboration");
  if (v17)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSession connection](v16, "connection"));
    v18 = -[SDShareSheetSlotManager _hasCollaborationEntitlementForConnection:](v9, "_hasCollaborationEntitlementForConnection:", v15);
  }
  else
  {
    v18 = 0;
  }
  -[SDShareSheetSession setSupportsCollaboration:](v16, "setSupportsCollaboration:", v18);
  if (v17)

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext peopleSuggestionBundleIds](v8, "peopleSuggestionBundleIds"));
  v20 = objc_msgSend(v19, "copy");
  -[SDShareSheetSession setPeopleSuggestionBundleIds:](v16, "setPeopleSuggestionBundleIds:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext processedImageResultsData](v8, "processedImageResultsData"));
  -[SDShareSheetSession setProcessedImageResultsData:](v16, "setProcessedImageResultsData:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext urlsBeingShared](v8, "urlsBeingShared"));
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext urlsBeingShared](v8, "urlsBeingShared"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
    -[SDShareSheetSession setUrlBeingShared:](v16, "setUrlBeingShared:", v25);

  }
  v52 = v7;
  if (-[SDShareSheetSession skipSlotsRendering](v16, "skipSlotsRendering"))
  {
    v26 = share_sheet_log();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "skipping slots image rendering.", buf, 2u);
    }
  }
  else
  {
    v28 = share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "setting-up SharingXPCHelper connection for slots image rendering.", buf, 2u);
    }

    v27 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSession description](v16, "description"));
    v30 = -[SDXPCHelperConnection initWithQueue:xrRenderingMode:]([SDXPCHelperConnection alloc], "initWithQueue:xrRenderingMode:", 0, -[SDShareSheetSession xrRenderingMode](v16, "xrRenderingMode"));
    -[SDShareSheetSession setXpcHelperCnx:](v16, "setXpcHelperCnx:", v30);

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10014ED40;
    v65[3] = &unk_1007146D8;
    v65[4] = v27;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](v16, "xpcHelperCnx"));
    objc_msgSend(v31, "setInvalidationHandler:", v65);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](v16, "xpcHelperCnx"));
    objc_msgSend(v32, "activate");

    if (+[SDXPCHelperImageCache cacheIsEmpty](_TtC16DaemoniOSLibrary21SDXPCHelperImageCache, "cacheIsEmpty"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession description](v16, "description"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, cacheEmpty: %s"), v33, "yes"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](v16, "xpcHelperCnx"));
      objc_msgSend(v35, "setSessionKeepAliveTransactionIdentifier:", v34);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](v16, "xpcHelperCnx"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](v16, "airDropController"));
    objc_msgSend(v37, "setHelperConnection:", v36);

  }
  v51 = v6;

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v9);
  location = 0;
  objc_initWeak(&location, v16);
  v38 = objc_alloc((Class)_UIActivityHelper);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10014ED88;
  v59[3] = &unk_100718AF0;
  v59[4] = v9;
  objc_copyWeak(&v61, (id *)buf);
  v39 = v8;
  v60 = v39;
  objc_copyWeak(&v62, &location);
  v40 = objc_msgSend(v38, "initWithDelegate:sessionID:fetchShortcutsBlock:", v9, v53, v59);
  -[SDShareSheetSession setActivityHelper:](v16, "setActivityHelper:", v40);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_sessionIDToShareSheetSession, "setObject:forKeyedSubscript:", v16, v53);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext discoveryContext](v39, "discoveryContext"));
  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession activityHelper](v16, "activityHelper"));
    objc_msgSend(v42, "primeWithDiscoveryContext:", v41);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "activityItemValueExtensionMatchingDictionaries"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext assetIdentifiers](v39, "assetIdentifiers"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext urlsBeingShared](v39, "urlsBeingShared"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext sandboxExtensionsByfileURLPath](v39, "sandboxExtensionsByfileURLPath"));
    -[SDShareSheetSlotManager activateSuggestionBrowserForSession:withExtensionMatchingDictionaries:assetIdentifiers:urlsBeingShared:sandboxExtensionsByfileURLPath:](v9, "activateSuggestionBrowserForSession:withExtensionMatchingDictionaries:assetIdentifiers:urlsBeingShared:sandboxExtensionsByfileURLPath:", v16, v43, v44, v45, v46);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleBrowser](v16, "peopleBrowser"));
  objc_msgSend(v47, "setDiffableDelegate:", v9);

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10014EF38;
  v57[3] = &unk_100718B18;
  objc_copyWeak(&v58, (id *)buf);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](v16, "airDropController"));
  objc_msgSend(v48, "setTransferUpdateChangedHandler:", v57);

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10014EF80;
  v54[3] = &unk_1007188A0;
  objc_copyWeak(&v56, (id *)buf);
  v49 = v53;
  v55 = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](v16, "airDropController"));
  objc_msgSend(v50, "setAvailableNodesChangedHandler:", v54);

  -[SDShareSheetSession activate](v16, "activate");
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v62);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  objc_sync_exit(v9);
  v52[2](v52);

}

- (void)connectUIServiceToDaemonWithSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](v5, "currentConnection"));
    objc_msgSend(v6, "setUiServiceConnection:", v7);

    if (objc_msgSend(v6, "sentInitialConfiguration"))
      -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](v5, "dataSourceDidUpdateForSession:animated:", v6, 0);
  }
  else
  {
    v8 = share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_100160F48();

  }
  objc_sync_exit(v5);

}

- (id)_filterForSharableURLs:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isFileURL", (_QWORD)v16))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](self, "currentConnection"));
          v13 = objc_msgSend(v12, "sd_connectionCanShareURL:", v11);

          if (!v13)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "copy");
  return v14;
}

- (id)_fetchShortcutWorkflowsForMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleID:(id)a5 iconSize:(CGSize)a6 iconScale:(double)a7 error:(id *)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  os_signpost_id_t v29;
  uint8_t v31[16];
  uint8_t buf[16];

  height = a6.height;
  width = a6.width;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = share_sheet_log();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = share_sheet_log();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_signpost_id_make_with_pointer(v21, self);

  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v22, "FetchShortcuts", " enableTelemetry=YES ", buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivityItems:hostBundleIdentifier:iconSize:iconScale:error:", v17, v16, v15, a8, width, height, a7));

  v25 = share_sheet_log();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v27 = share_sheet_log();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = os_signpost_id_make_with_pointer(v28, self);

  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v29, "FetchShortcuts", " enableTelemetry=YES ", v31, 2u);
  }

  return v24;
}

- (id)_shortcutActivitiesForMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleID:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[8];
  id v38;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "iconSize");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v10, "iconScale");
  v19 = v18;

  v38 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _fetchShortcutWorkflowsForMatchingDictionaries:resolvedActivityItems:hostBundleID:iconSize:iconScale:error:](self, "_fetchShortcutWorkflowsForMatchingDictionaries:resolvedActivityItems:hostBundleID:iconSize:iconScale:error:", v13, v12, v11, &v38, v15, v17, v19));

  v21 = v38;
  v22 = share_sheet_log();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = share_sheet_log();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = os_signpost_id_make_with_pointer(v25, self);

  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v26, "FetchShortcuts", " enableTelemetry=YES ", buf, 2u);
  }

  if (!v20 && v21)
  {
    v27 = share_sheet_log();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_100160FA8();

  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10014F63C;
  v34[3] = &unk_100718B40;
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSExtension extensionWithIdentifier:error:](NSExtension, "extensionWithIdentifier:error:", CFSTR("com.apple.shortcuts.Run-Workflow"), 0));
  v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v20, "count"));
  v36 = v29;
  v30 = v35;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v34);
  v31 = v36;
  v32 = v29;

  return v32;
}

- (void)_configureSharingSectionsForSession:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  unint64_t v39;
  id v40;
  void *v41;
  _UIUserDefaultsActivity *v42;
  void *v43;
  _UIUserDefaultsActivity *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void **v49;
  uint64_t v50;
  void (*v51)(uint64_t);
  void *v52;
  SDShareSheetSlotManager *v53;
  id v54;
  uint8_t buf[8];
  _QWORD v56[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostConfiguration"));
  if (v6)
  {
    v7 = objc_alloc((Class)_UIActivityUserDefaults);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = objc_msgSend(v7, "initWithUnderlyingUserDefaults:activityDefaultsKey:", v8, CFSTR("UIActivityCategoryShare"));
    -[SDShareSheetSlotManager setShareUserDefaults:](v5, "setShareUserDefaults:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedPresentableActivities"));
    v11 = sub_10014FD84(v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    objc_msgSend(v4, "setShareActivities:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)objc_msgSend(v12, "count") + 1));
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activityUUID"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setShareActivitiesByUUID:", v13);
    if (_os_feature_enabled_impl("Sharing", "combine_share_activities"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager _groupActivitiesByBundleID:](SDShareSheetSlotManager, "_groupActivitiesByBundleID:", v14));
      objc_msgSend(v4, "setBundleIDToActivities:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIDToActivities"));
      v22 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _removeSecondaryActivities:bundleIDToActivities:](v5, "_removeSecondaryActivities:bundleIDToActivities:", v14, v21));

      v14 = v22;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v5, "shareUserDefaults"));
    if (v23)
    {
      v24 = -[NSObject count](v14, "count") == 0;

      if (!v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v5, "shareUserDefaults"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activitiesOrderedByUserActivityOrderForActivities:", v14));

        objc_msgSend(v4, "setShareActivitiesInUserOrder:", v26);
        v27 = share_sheet_log();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Discovered Share Activities:", buf, 2u);
        }

        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10014FE28;
        v56[3] = &unk_100718B68;
        v56[4] = v5;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v56));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filteredArrayUsingPredicate:", v29));

        if (_os_feature_enabled_impl("Sharing", "combine_share_activities"))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urlsBeingShared"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));
          objc_msgSend(v4, "setUrlBeingShared:", v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "urlBeingShared"));
          v34 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _moveDefaultApplicationToFrontForURL:activities:](v5, "_moveDefaultApplicationToFrontForURL:activities:", v33, v30));

          v30 = (void *)v34;
        }
        v35 = objc_msgSend(v30, "count");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v5, "shareUserDefaults"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "activityIdentifiersInUserOrder"));
        v38 = objc_msgSend(v37, "count");

        v39 = 12;
        if ((unint64_t)v38 > 0xC)
          v39 = (unint64_t)v38;
        if ((unint64_t)v35 >= v39)
          v40 = (id)v39;
        else
          v40 = v35;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subarrayWithRange:", 0, v40));

        v42 = [_UIUserDefaultsActivity alloc];
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v5, "shareUserDefaults"));
        v44 = -[_UIUserDefaultsActivity initWithUserDefaults:activityCategory:](v42, "initWithUserDefaults:activityCategory:", v43, 1);

        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "arrayByAddingObject:", v44));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[_UIUserDefaultsActivity activityUUID](v44, "activityUUID"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v44, v45);

        objc_msgSend(v4, "setShareUserDefaultsActivity:", v44);
      }
    }
    objc_msgSend(v4, "setVisibleShareActivities:", v14);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v4);
    v49 = _NSConcreteStackBlock;
    v50 = 3221225472;
    v51 = sub_10014FF24;
    v52 = &unk_1007147A0;
    v53 = v5;
    objc_copyWeak(&v54, (id *)buf);
    objc_msgSend(v4, "setDisabledNodesUpdatedHandler:", &v49);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleShareActivities", v49, v50, v51, v52, v53));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _createShareProxiesFromActivities:session:](v5, "_createShareProxiesFromActivities:session:", v46, v4));

    -[SDShareSheetSlotManager _configurePeopleSuggestionsSectionForSession:](v5, "_configurePeopleSuggestionsSectionForSession:", v4);
    objc_msgSend(v4, "setHostShareActivityProxies:", v47);

    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v48 = share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_100161008();
  }

  objc_sync_exit(v5);
}

- (void)_configurePeopleSuggestionsSectionForSession:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  os_signpost_id_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  os_signpost_id_t v37;
  int v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostConfiguration"));
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "shouldSkipPeopleSuggestions"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "initialPhotosAssetDetails"));
      if (v8)
      {

        goto LABEL_6;
      }
    }
    if ((objc_msgSend(v4, "hideSuggestions") & 1) != 0)
    {
LABEL_6:
      v9 = share_sheet_log();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v7, "shouldSkipPeopleSuggestions");
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "initialPhotosAssetDetails"));
        v13 = (void *)v12;
        v14 = "no";
        if (v11)
          v14 = "yes";
        v38 = 136315394;
        v39 = v14;
        v40 = 2112;
        v41 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SDShareSheetSlotManager: Should skip people suggestions %s with asset details %@", (uint8_t *)&v38, 0x16u);

      }
      goto LABEL_25;
    }
    v16 = share_sheet_log();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = os_signpost_id_make_with_pointer(v19, v7);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      LOWORD(v38) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PeopleSuggestions", ", (uint8_t *)&v38, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionBrowser"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "peopleSuggestionNodes"));

    v22 = share_sheet_log();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = os_signpost_id_make_with_pointer(v25, v7);

    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v38) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v26, "PeopleSuggestions", ", (uint8_t *)&v38, 2u);
    }

    v27 = share_sheet_log();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = share_sheet_log();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = os_signpost_id_make_with_pointer(v30, v7);

    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      LOWORD(v38) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v31, "ConfigureAirDropNodesFromSuggestions", ", (uint8_t *)&v38, 2u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v5, "shareUserDefaults"));
    -[SDShareSheetSlotManager configureAirDropNodesFromSuggestionNodes:shareUserDefaults:forSession:](v5, "configureAirDropNodesFromSuggestionNodes:shareUserDefaults:forSession:", v10, v32, v4);

    v33 = share_sheet_log();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = share_sheet_log();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = os_signpost_id_make_with_pointer(v36, v7);

    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      LOWORD(v38) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v37, "ConfigureAirDropNodesFromSuggestions", ", (uint8_t *)&v38, 2u);
    }

  }
  else
  {
    v15 = share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100161034();
  }
LABEL_25:

  objc_sync_exit(v5);
}

- (void)_configureActionsSectionForSession:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void **v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void *);
  void *v33;
  SDShareSheetSlotManager *v34;
  id v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostConfiguration"));
  if (v6)
  {
    v7 = objc_alloc((Class)_UIActivityUserDefaults);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = objc_msgSend(v7, "initWithUnderlyingUserDefaults:activityDefaultsKey:", v8, CFSTR("UIActivityCategoryAction"));
    -[SDShareSheetSlotManager setActionUserDefaults:](v5, "setActionUserDefaults:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedPresentableActivities"));
    v11 = sub_10014FD84(v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    objc_msgSend(v4, "setActionActivities:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v12, "count")));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activityUUID"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v15);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v5, "actionUserDefaults"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v5, "actionUserDefaults"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activitiesOrderedByUserActivityOrderForActivities:", v14));

      objc_msgSend(v4, "setActionActivitiesInUserOrder:", v22);
      v23 = share_sheet_log();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Discovered Action Activities:", buf, 2u);
      }

      v30 = _NSConcreteStackBlock;
      v31 = 3221225472;
      v32 = sub_100150744;
      v33 = &unk_100718B90;
      v34 = v5;
      v35 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &v30));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filteredArrayUsingPredicate:", v25, v30, v31, v32, v33, v34));

    }
    objc_msgSend(v4, "setActionActivitiesByUUID:", v13);
    objc_msgSend(v4, "setVisibleActionActivities:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleActionActivities"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostTintColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _createActionProxiesFromActivities:withTintColor:session:](v5, "_createActionProxiesFromActivities:withTintColor:session:", v26, v27, v4));

    objc_msgSend(v4, "setHostActionActivityProxies:", v28);
  }
  else
  {
    v29 = share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_100161060();
  }

  objc_sync_exit(v5);
}

- (void)requestConfigurationWithSessionID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, NSObject *);
  SDShareSheetSlotManager *v8;
  void *v9;
  NSObject *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, NSObject *))a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager configurationForDataSourceUpdateWithSession:](v8, "configurationForDataSourceUpdateWithSession:", v9));
    v7[2](v7, v10);
  }
  else
  {
    v11 = share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_10016108C();
  }

  objc_sync_exit(v8);
}

- (void)sendConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, NSObject *);
  double Current;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  SDShareSheetSlotManager *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  unsigned int v44;
  int v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  char v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  os_signpost_id_t v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  os_signpost_id_t v69;
  id v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  id v83;
  NSObject *v84;
  os_signpost_id_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unsigned int v92;
  void *v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  void *v97;
  _QWORD block[4];
  id v99;
  id v100;
  _BYTE buf[12];
  __int16 v102;
  unsigned int v103;
  __int16 v104;
  unsigned int v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  int v109;
  __int16 v110;
  unsigned int v111;

  v6 = a3;
  v7 = (void (**)(id, NSObject *))a4;
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
  if (v97)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_signpost_id_make_with_pointer(v12, v6);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SetConfiguration", ", buf, 2u);
    }

    v14 = self;
    objc_sync_enter(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v97));
    if (v15)
    {
      v16 = share_sheet_log();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "processing configuration: %@", buf, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "preferredLocalizations"));
      objc_msgSend(v6, "setPreferredLocalizations:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urlsBeingShared"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _filterForSharableURLs:](v14, "_filterForSharableURLs:", v20));
      objc_msgSend(v6, "setUrlsBeingShared:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostConfiguration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hostTraitCollection"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostTraitCollection"));
      v25 = v23;
      v26 = v24;
      v27 = v26;
      if (v25 == v26)
      {
        v92 = 1;
      }
      else if ((v25 == 0) == (v26 != 0))
      {
        v92 = 0;
      }
      else
      {
        v92 = objc_msgSend(v25, "isEqual:", v26);
      }

      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostConfiguration"));
      v31 = +[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled");
      if (v94)
        v32 = 0;
      else
        v32 = v31;
      if (v32 == 1)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "airDropController"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostAppBundleID"));
        objc_msgSend(v33, "activateWithBundleID:", v34);

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostConfiguration"));
      v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "securityScopedURLsForMatching"));

      objc_msgSend(v15, "setHostConfiguration:", v6);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "xpcHelperCnx"));
      objc_msgSend(v36, "updateShareSheetHostConfiguration:", v6);

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostConfiguration"));
      v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "securityScopedURLsForMatching"));

      if (v96)
      {
        objc_msgSend(v15, "_activateSecurityContext:", v96);
        if (v95 != v96)
          objc_msgSend(v15, "_deactivateSecurityContext:", v95);
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v39 = objc_msgSend(v38, "isAirDropAllowed");

      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostAppBundleID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
      v41 = objc_msgSend(v40, "isClassroomEnabled");

      v42 = objc_msgSend(v6, "isContentManaged");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
      v44 = objc_msgSend(v43, "mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:", v93, v42);

      v45 = (v39 | v41) & v44;
      if (v45 == 1)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "excludedActivityTypes"));
        v46 = objc_msgSend(v43, "containsObject:", UIActivityTypeAirDrop) ^ 1;
      }
      else
      {
        v46 = 0;
      }
      objc_msgSend(v15, "setAirDropAllowed:", v46);
      if (v45)

      v47 = share_sheet_log();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v15;
        v102 = 1024;
        v103 = v39;
        v104 = 1024;
        v105 = v41;
        v106 = 2112;
        v107 = v93;
        v108 = 1024;
        v109 = (int)v42;
        v110 = 1024;
        v111 = v44;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@, airdropGloballyAllowed: %i, classroomEnabled: %i, hostBundleID: %@, isContentManaged: %i, mayShare: %i", buf, 0x2Eu);
      }

      if ((objc_msgSend(v6, "excludedActivityCategories") & 2) != 0
        || objc_msgSend(v6, "sharingStyle") == (id)2)
      {
        v49 = 1;
        v50 = 1;
      }
      else
      {
        v49 = 0;
        v50 = objc_msgSend(v6, "sharingStyle") == (id)1;
      }
      objc_msgSend(v15, "setSharingExpanded:", objc_msgSend(v15, "sharingExpanded") | !v50);
      objc_msgSend(v15, "setIsCollaborative:", objc_msgSend(v6, "isCollaborative"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipients"));
      objc_msgSend(v15, "setRecipients:", v51);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](v14, "currentConnection"));
      if (v52)
      {
        v53 = share_sheet_log();
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](v14, "currentConnection"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "sd_connectionBundleID"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v56;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "current connection bundle ID: %@", buf, 0xCu);

        }
      }
      else
      {
        v57 = share_sheet_log();
        v54 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          sub_1001611AC();
      }

      v58 = share_sheet_log();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      v60 = share_sheet_log();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      v62 = os_signpost_id_make_with_pointer(v61, v6);

      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, v62, "LoadPresentableActivitiesForSession", " enableTelemetry=YES ", buf, 2u);
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostHiddenActivityConfigurations"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[SUIHostActivityProxy activitiesForConfigurations:](SUIHostActivityProxy, "activitiesForConfigurations:", v63));
      objc_msgSend(v15, "setHiddenActivities:", v64);

      -[SDShareSheetSlotManager _loadPresentableActivitiesForSession:](v14, "_loadPresentableActivitiesForSession:", v15);
      v65 = share_sheet_log();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      v67 = share_sheet_log();
      v68 = objc_claimAutoreleasedReturnValue(v67);
      v69 = os_signpost_id_make_with_pointer(v68, v6);

      if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, v69, "LoadPresentableActivitiesForSession", " enableTelemetry=YES ", buf, 2u);
      }

      if ((v49 & 1) == 0)
      {
        if ((objc_msgSend(v15, "sharingExpanded") & 1) != 0)
        {
          v70 = share_sheet_log();
          v71 = objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "fetching sharing sections synchronously…", buf, 2u);
          }

          -[SDShareSheetSlotManager _configureSharingSectionsForSession:](v14, "_configureSharingSectionsForSession:", v15);
        }
        else
        {
          v72 = share_sheet_log();
          v73 = objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "fetching sharing sections asynchronously…", buf, 2u);
          }

          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, v14);
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connection"));
          v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "_queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100151628;
          block[3] = &unk_100714468;
          objc_copyWeak(&v100, (id *)buf);
          v99 = v15;
          dispatch_async(v75, block);

          objc_destroyWeak(&v100);
          objc_destroyWeak((id *)buf);
        }
      }
      -[SDShareSheetSlotManager _configureActionsSectionForSession:](v14, "_configureActionsSectionForSession:", v15);
      if (!v94 || v92 != 1)
      {
        if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "airDropController"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "availableNodes"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionID"));
          -[SDShareSheetSlotManager handleAirDropNodesChanged:sessionID:](v14, "handleAirDropNodesChanged:sessionID:", v77, v78);
        }
        else
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peopleBrowser"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peopleBrowser"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "people"));
          -[SDShareSheetSlotManager browser:didUpdatePeople:deletedContactIdentifiers:](v14, "browser:didUpdatePeople:deletedContactIdentifiers:", v76, v78, 0);
        }

      }
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedNode"));
      objc_msgSend(v79, "setSelectionReason:", 2);

      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedNode"));
      -[SDShareSheetSlotManager createAirDropProxyForNode:session:](v14, "createAirDropProxyForNode:session:", v80, v15);

      -[SDShareSheetSlotManager updateNearbyCountSlotIDForSession:](v14, "updateNearbyCountSlotIDForSession:", v15);
      v81 = share_sheet_log();
      v82 = objc_claimAutoreleasedReturnValue(v81);
      v83 = share_sheet_log();
      v84 = objc_claimAutoreleasedReturnValue(v83);
      v85 = os_signpost_id_make_with_pointer(v84, v6);

      if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_END, v85, "SetConfiguration", ", buf, 2u);
      }

      if ((objc_msgSend(v15, "remoteShareSheet") & 1) != 0)
      {
        v29 = 0;
      }
      else
      {
        v29 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager configurationForDataSourceUpdateWithSession:](v14, "configurationForDataSourceUpdateWithSession:", v15));
        -[NSObject setReloadData:](v29, "setReloadData:", 1);
      }
      objc_msgSend(v15, "setSentInitialConfiguration:", 1);
      objc_msgSend(v15, "reportCurrentInvocationForDuration:", (uint64_t)((CFAbsoluteTimeGetCurrent() - Current) * 1000.0));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uiServiceConnection"));

      if (v86)
        -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](v14, "dataSourceDidUpdateForSession:animated:", v15, 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "findSupportedActivitiesCompletionHandler"));

      if (v87)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "findSupportedActivitiesCompletionHandler"));
        objc_msgSend(v15, "setFindSupportedActivitiesCompletionHandler:", 0);
        -[SDShareSheetSlotManager activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:](v14, "activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:", v97, v88);

      }
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "performActivityType"));

      if (v89)
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "performActivityType"));
        objc_msgSend(v15, "setPerformActivityType:", 0);
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "performActivityCompletionHandler"));
        objc_msgSend(v15, "setPerformActivityCompletionHandler:", 0);
        -[SDShareSheetSlotManager activityViewControllerWithSessionID:performActivityWithType:completionHandler:](v14, "activityViewControllerWithSessionID:performActivityWithType:completionHandler:", v97, v90, v91);

      }
    }
    else
    {
      v30 = share_sheet_log();
      v95 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
        sub_10016114C();
      v29 = 0;
    }

    objc_sync_exit(v14);
    if (v15)
      v7[2](v7, v29);
  }
  else
  {
    v28 = share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      sub_1001610EC();
  }

}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015170C;
  v7[3] = &unk_100718BE0;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  +[SFCollaborationUtilities createSharingURLForCollaborationRequest:completionHandler:](SFCollaborationUtilities, "createSharingURLForCollaborationRequest:completionHandler:", v6, v7);

}

- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, id, id);
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;

  v5 = (void (**)(id, id, id))a4;
  v6 = a3;
  v13 = 0;
  v7 = objc_msgSend(objc_alloc((Class)LSClaimBinding), "initWithURL:error:", v6, &v13);

  v8 = v13;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "claimRecord"));
  v10 = objc_opt_respondsToSelector(v9, "defaultShareModeCollaboration");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "claimRecord"));
    v12 = objc_msgSend(v11, "defaultShareModeCollaboration");

  }
  else
  {
    v12 = 0;
  }
  v5[2](v5, v12, v8);

}

- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  +[SFCollaborationUtilities requestSharedURLForURL:completionHandler:](SFCollaborationUtilities, "requestSharedURLForURL:completionHandler:", a3, a4);
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  id v8;

  v5 = (void (**)(id, id))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFCollaborationUserDefaults sharedDefaults](SFCollaborationUserDefaults, "sharedDefaults"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "existingCollaborativeModeForContentIdentifier:", v6));

  v5[2](v5, v8);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[SFCollaborationUserDefaults sharedDefaults](SFCollaborationUserDefaults, "sharedDefaults"));
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v8, "setCollaborativeMode:contentIdentifier:", v7, v5);
}

- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  +[SFCollaborationUtilities deleteSharingURL:containerSetupInfo:completionHandler:](SFCollaborationUtilities, "deleteSharingURL:containerSetupInfo:completionHandler:", a3, a4, a5);
}

- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  +[SFCollaborationUtilities addParticipantsAllowedForURL:share:completionHandler:](SFCollaborationUtilities, "addParticipantsAllowedForURL:share:completionHandler:", a3, a4, a5);
}

- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
  +[SFCollaborationUtilities isShareOwnerOrAdminForFileURL:completionHandler:](SFCollaborationUtilities, "isShareOwnerOrAdminForFileURL:completionHandler:", a3, a4);
}

- (void)shareStatusForFileURL:(id)a3 completionHandler:(id)a4
{
  +[SFCollaborationUtilities shareStatusForURL:completionHandler:](SFCollaborationUtilities, "shareStatusForURL:completionHandler:", a3, a4);
}

- (id)_moveDefaultApplicationToFrontForURL:(id)a3 activities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned int v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *j;
  void *v32;
  unsigned int v33;
  id v34;
  id v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isFileURL"))
  {
LABEL_32:
    v19 = v7;
    goto LABEL_33;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDocumentInteractionController interactionControllerWithURL:](UIDocumentInteractionController, "interactionControllerWithURL:", v6));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_defaultApplication"));
  if (v9)
  {
    v10 = (void *)v9;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = v7;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v11)
    {
      v12 = v11;
      v38 = v8;
      v13 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "applicationProxy"));
          v17 = objc_msgSend(v16, "isEqual:", v10);

          if (v17)
          {
            v18 = v15;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v12)
          continue;
        break;
      }
      v18 = 0;
LABEL_13:
      v8 = v38;
    }
    else
    {
      v18 = 0;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](self, "shareUserDefaults"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activityIdentifiersInUserOrder"));

    if (v18)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_activityTypeUsingFallbackActivityTypeIfNecessary"));
      v23 = objc_msgSend(v21, "containsObject:", v22);

      if ((v23 & 1) == 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](self, "shareUserDefaults"));
        v25 = objc_msgSend(v24, "hasUserEditedActivityOrder");

        if (v25)
        {
          v36 = v18;
          v37 = v6;
          v39 = v8;
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v26 = v7;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v27)
          {
            v28 = v27;
            v29 = 0;
            v30 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v28; j = (char *)j + 1)
              {
                if (*(_QWORD *)v41 != v30)
                  objc_enumerationMutation(v26);
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j), "_activityTypeUsingFallbackActivityTypeIfNecessary"));
                v33 = objc_msgSend(v21, "containsObject:", v32);

                v29 += v33;
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v28);
          }
          else
          {
            v29 = 0;
          }

          v34 = objc_msgSend(v26, "mutableCopy");
          v18 = v36;
          objc_msgSend(v34, "removeObject:", v36);
          objc_msgSend(v34, "insertObject:atIndex:", v36, v29);
          v6 = v37;
          v8 = v39;
        }
        else
        {
          v34 = objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v34, "removeObject:", v18);
          objc_msgSend(v34, "insertObject:atIndex:", v18, 1);
        }

        v7 = v34;
      }
    }

    goto LABEL_32;
  }
  v19 = v7;

LABEL_33:
  return v19;
}

+ (id)_bundleIdentifierForActivity:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = objc_opt_class(UIApplicationExtensionActivity, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containingAppBundleIdentifier"));
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationExtension"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

    }
  }
  else if ((objc_opt_respondsToSelector(v3, "applicationIdentifier") & 1) != 0
         && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationIdentifier")),
             v10,
             v10))
  {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationIdentifier"));
  }
  else
  {
    v9 = CFSTR("noBundleID");
  }

  return v9;
}

+ (id)_groupActivitiesByBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager _bundleIdentifierForActivity:](SDShareSheetSlotManager, "_bundleIdentifierForActivity:", v10, (_QWORD)v17));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
        v13 = v12;
        if (v12)
          v14 = v12;
        else
          v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v15 = v14;

        objc_msgSend(v15, "addObject:", v10);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_removeSecondaryActivities:(id)a3 bundleIDToActivities:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _getMainActivityPerBundleID:](self, "_getMainActivityPerBundleID:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "indexOfObject:", v14, (_QWORD)v17) == (id)0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v8, "addIndex:", objc_msgSend(v9, "indexOfObject:", v14));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v15, "removeObjectsAtIndexes:", v8);

  return v15;
}

- (id)_getMainActivityPerBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  uint64_t v22;
  id v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v22 = *(_QWORD *)v31;
    v23 = v3;
    do
    {
      v8 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9, v22, v23));
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("noBundleID")))
        {
          objc_msgSend(v4, "addObjectsFromArray:", v10);
        }
        else
        {
          v11 = v4;
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v12);
                v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
                if (v15)
                {
                  v19 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "_defaultSortGroup");
                  if ((uint64_t)v19 < (uint64_t)objc_msgSend(v15, "_defaultSortGroup"))
                  {
                    v20 = v18;

                    v15 = v20;
                  }
                }
                else
                {
                  v15 = v18;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v14);
          }
          else
          {
            v15 = 0;
          }

          v4 = v11;
          objc_msgSend(v11, "addObject:", v15);

          v7 = v22;
          v3 = v23;
          v6 = v24;
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)updateNearbyCountSlotIDForSession:(id)a3
{
  id v4;
  id v5;
  SDShareSheetSlotManager *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[8];
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))v5 = objc_msgSend(v4, "airDropNearbyCount");
  else
    v5 = 0;
  v6 = self;
  objc_sync_enter(v6);
  v7 = share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peopleNodes"));
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = (_DWORD)v5;
    LOWORD(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 2) = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found nearby count %u people nodes %u", buf, 0xEu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v6, "shareSheetContext"));
  if ((unint64_t)v5 <= 1)
  {
    if (v5 == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peopleNodes"));
      v11 = objc_msgSend(v12, "count") == 0;

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }
  if (objc_msgSend(v4, "skipSlotsRendering"))
  {
    if (v11)
      v13 = v5;
    else
      v13 = 0;
    objc_msgSend(v4, "setNearbyCountBadge:", v13);
  }
  else if (v11)
  {
    *(_QWORD *)buf = 0;
    v27 = 0;
    v28 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100152704;
    v23[3] = &unk_100718C08;
    v24 = v4;
    v25 = v5;
    v14 = v24;
    v21 = v14;
    v22 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostConfiguration", _NSConcreteStackBlock, 3221225472, sub_100152748, &unk_100718C30));
    -[SDShareSheetSlotManager _uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:](v6, "_uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:", v23, &v20, 1, v15);

    if (*(_DWORD *)buf)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nearbyCountSlotID"));
      objc_msgSend(v10, "deleteSlot:", objc_msgSend(v16, "unsignedIntValue"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)buf));
      objc_msgSend(v14, "setNearbyCountSlotID:", v17);

    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nearbyCountSlotID"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nearbyCountSlotID"));
      objc_msgSend(v10, "deleteSlot:", objc_msgSend(v19, "unsignedIntValue"));

      objc_msgSend(v4, "setNearbyCountSlotID:", 0);
    }
  }

  objc_sync_exit(v6);
}

- (id)_createShareProxiesFromActivities:(id)a3 session:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _UIHostActivityProxy *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  SDShareSheetLoadingConfiguration *v42;
  void *v43;
  void *v44;
  SDShareSheetLoadingConfiguration *v45;
  id v46;
  NSObject *v47;
  void *v48;
  SDShareSheetSlotManager *val;
  id obj;
  _UIHostActivityProxy *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  _QWORD v57[4];
  SDShareSheetLoadingConfiguration *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  NSObject *p_super;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE buf[12];
  __int16 v72;
  void *v73;
  _BYTE v74[128];

  v6 = a3;
  v56 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  val = self;
  objc_sync_enter(val);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v8)
  {
    v53 = UIActivityTypeUserDefaults;
    v54 = *(_QWORD *)v67;
    do
    {
      v55 = v8;
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v54)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "screenTimeMonitor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
        v13 = objc_msgSend(v11, "cachedPolicyForActivityType:", v12);

        v14 = -[_UIHostActivityProxy initWithActivity:]([_UIHostActivityProxy alloc], "initWithActivity:", v10);
        -[_UIHostActivityProxy setIsDisabled:](v14, "setIsDisabled:", v13 != 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
        -[_UIHostActivityProxy setIsUserDefaultsActivity:](v14, "setIsUserDefaultsActivity:", objc_msgSend(v15, "isEqualToString:", v53));

        v17 = objc_opt_class(SUIHostActivityProxy, v16);
        if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0
          || -[_UIHostActivityProxy isUserDefaultsActivity](v14, "isUserDefaultsActivity"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
          v19 = UIActivityTypeAirDrop;
          v20 = v18;
          if (v19 == v20)
          {

          }
          else
          {
            v21 = v20;
            if ((UIActivityTypeAirDrop == 0) == (v20 != 0))
            {

              goto LABEL_17;
            }
            v22 = -[NSString isEqual:](v19, "isEqual:", v20);

            if (!v22)
            {
LABEL_17:
              v27 = share_sheet_log();
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityUUID"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v29;
                v72 = 2112;
                v73 = v30;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Skipping slot creation for host activity %@ with activity type %@", buf, 0x16u);

              }
              goto LABEL_32;
            }
          }
          -[_UIHostActivityProxy setIsRestricted:](v14, "setIsRestricted:", objc_msgSend(v56, "airDropAllowed") ^ 1);
          goto LABEL_17;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "hostConfiguration"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "preferredLocalizations"));
        objc_msgSend(v10, "setPreferredLocalizations:", v24);

        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_100152EDC;
        v64[3] = &unk_100718C58;
        v52 = v14;
        p_super = &v52->super;
        v25 = objc_retainBlock(v64);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager _bundleIdentifierForActivity:](SDShareSheetSlotManager, "_bundleIdentifierForActivity:", v10));
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("noBundleID")))
        {
          ((void (*)(_QWORD *, void *))v25[2])(v25, v10);
        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bundleIDToActivities"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v26));

          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v33 = v32;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v34; j = (char *)j + 1)
              {
                if (*(_QWORD *)v61 != v35)
                  objc_enumerationMutation(v33);
                ((void (*)(_QWORD *, _QWORD))v25[2])(v25, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j));
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            }
            while (v34);
          }

        }
        if (objc_msgSend(v56, "skipSlotsRendering"))
        {
          v37 = objc_alloc((Class)SFProxyText);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityTitle"));
          v39 = objc_msgSend(v37, "initWithText:", v38);
          -[_UIHostActivityProxy setActivityTitle:](v52, "setActivityTitle:", v39);

          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("noBundleID")) & 1) == 0)
            -[_UIHostActivityProxy setApplicationBundleIdentifier:](v52, "setApplicationBundleIdentifier:", v26);
        }
        else
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "hostConfiguration"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v40));

          v42 = objc_alloc_init(SDShareSheetLoadingConfiguration);
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "xpcHelperCnx"));
          -[SDShareSheetLoadingConfiguration setHelperConnection:](v42, "setHelperConnection:", v43);

          -[SDShareSheetLoadingConfiguration setTextColor:](v42, "setTextColor:", v41);
          -[SDShareSheetLoadingConfiguration setInstantShareSheet:](v42, "setInstantShareSheet:", objc_msgSend(v56, "skipSlotsRendering"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "hostConfiguration"));
          -[SDShareSheetLoadingConfiguration setHostConfiguration:](v42, "setHostConfiguration:", v44);

          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, val);
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_100152FC0;
          v57[3] = &unk_100718C80;
          objc_copyWeak(&v59, (id *)buf);
          v45 = v42;
          v58 = v45;
          -[_UIHostActivityProxy setLoadHandler:](v52, "setLoadHandler:", v57);

          objc_destroyWeak(&v59);
          objc_destroyWeak((id *)buf);

        }
        v28 = p_super;
LABEL_32:

        v46 = share_sheet_log();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v14;
          v72 = 2112;
          v73 = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Created share activity proxy %@ for activity type %@", buf, 0x16u);

        }
        objc_msgSend(v7, "addObject:", v14);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v8);
  }

  objc_sync_exit(val);
  return v7;
}

- (id)_createActionProxiesFromActivities:(id)a3 withTintColor:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  SDShareSheetSlotManager *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  _UIHostActivityProxy *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  char isKindOfClass;
  uint64_t v39;
  SDShareSheetLoadingConfiguration *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v49;
  SDShareSheetSlotManager *val;
  id obj;
  id v52;
  _QWORD v53[4];
  NSObject *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE buf[12];
  __int16 v61;
  void *v62;
  _BYTE v63[128];

  v8 = a3;
  v49 = a4;
  v9 = a5;
  v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = self;
  objc_sync_enter(v10);
  val = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v10, "actionUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activityIdentifiersInUserOrder"));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v17 = -[_UIHostActivityProxy initWithActivity:]([_UIHostActivityProxy alloc], "initWithActivity:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
        -[_UIHostActivityProxy setIsFavorite:](v17, "setIsFavorite:", objc_msgSend(v12, "containsObject:", v18));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_activityFooterText"));
        if (v19)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_activityFooterText"));
          -[_UIHostActivityProxy setActivityFooter:](v17, "setActivityFooter:", v21);

        }
        v22 = objc_opt_class(SUIHostActivityProxy, v20);
        if ((objc_opt_isKindOfClass(v16, v22) & 1) != 0)
        {
          v23 = share_sheet_log();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityUUID"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v25;
            v61 = 2112;
            v62 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Skipping slot creation for host activity %@ with activity type %@", buf, 0x16u);

          }
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostConfiguration"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hostTraitCollection"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "preferredContentSizeCategory"));
          objc_msgSend(v16, "setContentSizeCategory:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostConfiguration"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "preferredLocalizations"));
          objc_msgSend(v16, "setPreferredLocalizations:", v31);

          v33 = objc_msgSend(v9, "skipSlotsRendering");
          if ((_DWORD)v33)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityTitle"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager nonBreakingActivityTitle:](SDShareSheetSlotManager, "nonBreakingActivityTitle:", v34));

            v36 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithText:", v35);
            -[_UIHostActivityProxy setActivityTitle:](v17, "setActivityTitle:", v36);

          }
          v37 = objc_opt_class(UIShortcutActivity, v32);
          isKindOfClass = objc_opt_isKindOfClass(v16, v37);
          if ((_DWORD)v33
            && !(isKindOfClass & 1 | ((objc_msgSend(v16, "isMemberOfClass:", objc_opt_class(UIApplicationExtensionActivity, v39)) & 1) == 0)))
          {
            v24 = v16;
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject applicationExtension](v24, "applicationExtension"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "identifier"));
            -[_UIHostActivityProxy setApplicationBundleIdentifier:](v17, "setApplicationBundleIdentifier:", v44);

          }
          else
          {
            v40 = objc_alloc_init(SDShareSheetLoadingConfiguration);
            -[SDShareSheetLoadingConfiguration setTintColor:](v40, "setTintColor:", v49);
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "xpcHelperCnx"));
            -[SDShareSheetLoadingConfiguration setHelperConnection:](v40, "setHelperConnection:", v41);

            -[SDShareSheetLoadingConfiguration setInstantShareSheet:](v40, "setInstantShareSheet:", v33);
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostConfiguration"));
            -[SDShareSheetLoadingConfiguration setHostConfiguration:](v40, "setHostConfiguration:", v42);

            *(_QWORD *)buf = 0;
            objc_initWeak((id *)buf, val);
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_1001535F4;
            v53[3] = &unk_100718C80;
            objc_copyWeak(&v55, (id *)buf);
            v24 = v40;
            v54 = v24;
            -[_UIHostActivityProxy setLoadHandler:](v17, "setLoadHandler:", v53);

            objc_destroyWeak(&v55);
            objc_destroyWeak((id *)buf);
          }
        }

        v45 = share_sheet_log();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v17;
          v61 = 2112;
          v62 = v47;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Created action activity proxy %@ for activity type %@", buf, 0x16u);

        }
        objc_msgSend(v52, "addObject:", v17);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v13);
  }

  objc_sync_exit(val);
  return v52;
}

- (CGImage)_createActivityTitleImageForActivity:(id)a3 foregroundColor:(id)a4 sessionConnection:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  CGImage *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v10 = a5;
  if (!v10)
  {
    v13 = share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_1001611D8();
    v12 = 0;
    goto LABEL_13;
  }
  v11 = objc_opt_class(SUIHostActivityProxy, v9);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) == 0)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityTitle"));
    v14 = v15;
    if (v15)
    {
      v20 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CGImgForUIActivityTitles:foregroundColor:processOppositeColor:", v16, v8, 1));

      v12 = (CGImage *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v14));
    }
    else
    {
      v18 = share_sheet_log();
      v17 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100161204();
      v12 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)_activityTitleImagesMapForActivities:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcHelperCnx"));
  v8 = (void *)v7;
  if (v7)
  {
    v29 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostConfiguration"));
    v28 = objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v9));

    v10 = objc_alloc_init((Class)NSMutableArray);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v18 = objc_opt_class(SUIHostActivityProxy, v13);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostConfiguration"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preferredLocalizations"));
            objc_msgSend(v17, "setPreferredLocalizations:", v20);

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activityTitle"));
            if (v21)
            {
              objc_msgSend(v10, "addObject:", v21);
            }
            else
            {
              v22 = share_sheet_log();
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v17;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't retrieve an activity title for %@", buf, 0xCu);
              }

            }
          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v14);
    }

    v24 = v28;
    v8 = v29;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "CGImgForUIActivityTitles:foregroundColor:processOppositeColor:", v10, v28, 1));

    v5 = v30;
  }
  else
  {
    v26 = share_sheet_log();
    v24 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_100161264();
    v25 = &__NSDictionary0__struct;
  }

  return v25;
}

- (BOOL)_loadAirDropProxy:(id)a3 forAirDropNode:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  SDShareSheetSlotManager *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  SDShareSheetSlotManager *v33;
  uint64_t v34;
  SDShareSheetSlotManager *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  os_signpost_id_t v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint8_t v69[16];
  uint8_t buf[8];
  uint64_t v71;
  double v72;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "helperConnection"));
  v12 = share_sheet_log();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11)
  {
    v15 = share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_signpost_id_make_with_pointer(v16, self);

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "LoadSuggestionUIAirdropNode", ", buf, 2u);
    }
    v64 = v11;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transportBundleID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_UIActivityHelper transportImageForBundleIdentifier:](_UIActivityHelper, "transportImageForBundleIdentifier:", v18));

    v14 = objc_retainAutorelease(v19);
    v67 = -[NSObject CGImage](v14, "CGImage");
    v68 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestionNode"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "iconData"));
    v22 = (void *)v21;
    if (v21)
    {
      v23 = (const void *)SFCreateCGImageFromData(v21);
      objc_msgSend(v9, "setDisplayIcon:", v23);
      if (v23)
        CFRelease(v23);
    }
    v24 = self;

    v25 = objc_msgSend(v20, "icon");
    if (v25)
      objc_msgSend(v9, "setDisplayIcon:", v25);
    v26 = objc_msgSend(v9, "displayIcon");
    v66 = v20;
    v27 = objc_msgSend(v20, "hasGroupImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostLocale"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayNameForLocale:", v28));

    +[CATransaction begin](CATransaction, "begin");
    *(_QWORD *)buf = 0;
    v71 = 0;
    v72 = 0.0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textColor"));
    if ((_DWORD)v27)
      v31 = 1;
    else
      v31 = 2;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostConfiguration"));
    v33 = v24;
    v65 = (void *)v29;
    v34 = v29;
    v35 = v24;
    v11 = v64;
    -[SDShareSheetSlotManager _createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:](v33, "_createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:", v34, v30, v31, 0, v27, v64, v32);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "formattedHandles"));
    v37 = objc_msgSend(v36, "count");

    v39 = SFLocalizedStringForKey(CFSTR("GROUP_PARTICIPANTS_LABEL"), v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v40, v37));

    v42 = v67;
    v8 = v68;
    if (v26 || v67 || *(_DWORD *)buf)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v35, "shareSheetContext"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if (v26)
      {
        v44 = share_sheet_log();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "create slot for people proxy icon image", v69, 2u);
        }

        v46 = (id)-[SDShareSheetSlotManager createSlotForContext:](v35, "createSlotForContext:", v43);
        objc_msgSend(v43, "setObject:forSlot:", v26, v46);
        v8 = v68;
        objc_msgSend(v68, "setAvatarImageSlotID:", v46);
        v42 = v67;
      }
      if (v42)
      {
        v47 = share_sheet_log();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "create slot for people proxy transport image", v69, 2u);
        }

        v49 = (id)-[SDShareSheetSlotManager createSlotForContext:](v35, "createSlotForContext:", v43);
        objc_msgSend(v43, "setObject:forSlot:", v42, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transportBundleID"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v49));
        objc_msgSend(v63, "setObject:forKey:", v50, v51);

        v8 = v68;
        objc_msgSend(v68, "setTransportImageSlotID:", v49);
      }
      if (*(_DWORD *)buf)
      {
        v52 = share_sheet_log();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "create slot for people proxy text image", v69, 2u);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)buf));
        objc_msgSend(v63, "setObject:forKey:", v54, v55);

        objc_msgSend(v8, "setMainLabelSlotID:", *(unsigned int *)buf);
        objc_msgSend(v8, "setMainLabelSlotHeight:", v72);
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v35, "accessibilityCache"));
      objc_msgSend(v56, "addEntriesFromDictionary:", v63);

    }
    +[CATransaction commit](CATransaction, "commit");
    v57 = share_sheet_log();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    v59 = share_sheet_log();
    v60 = objc_claimAutoreleasedReturnValue(v59);
    v61 = os_signpost_id_make_with_pointer(v60, v35);

    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
    {
      *(_WORD *)v69 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, v61, "LoadSuggestionUIAirdropNode", ", v69, 2u);
    }

  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    sub_1001612C4();
  }

  return v11 != 0;
}

- (BOOL)_loadSharingProxy:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  CFDictionaryRef (__cdecl **v32)(CFErrorRef);
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  os_signpost_id_t v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  os_signpost_id_t v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  os_signpost_id_t v60;
  BOOL v61;
  BOOL v62;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  NSObject *v71;
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;

  v7 = a3;
  v8 = a4;
  v9 = share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v13, "LoadSharingActivityProxy", ", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activity"));
  if (!v14)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetSlotManager.m"), 2910, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activity"));

  }
  v15 = share_sheet_log();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = share_sheet_log();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_signpost_id_make_with_pointer(v18, self);

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activityTitle"));
    *(_DWORD *)buf = 138543362;
    v78 = v20;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v19, "UIActivityImageLoad", "%{public}@", buf, 0xCu);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_activityImage"));
  v22 = share_sheet_log();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = share_sheet_log();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = os_signpost_id_make_with_pointer(v25, self);

  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v26, "UIActivityImageLoad", " enableTelemetry=YES ", buf, 2u);
  }

  v27 = objc_retainAutorelease(v21);
  v28 = objc_msgSend(v27, "CGImage");
  if (!v28)
  {
    v29 = share_sheet_log();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activityTitle"));
      *(_DWORD *)buf = 138412546;
      v78 = v31;
      v79 = 2112;
      v80 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@: imageRef is nil for %@ ", buf, 0x16u);

    }
  }
  v32 = &CFErrorCopyUserInfo_ptr;
  +[CATransaction begin](CATransaction, "begin");
  if ((objc_msgSend(v8, "instantShareSheet") & 1) != 0)
  {
    v33 = 0;
    if (!v28)
      goto LABEL_36;
LABEL_35:
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](self, "shareSheetContext"));
    v51 = -[SDShareSheetSlotManager createSlotForContext:](self, "createSlotForContext:", v50);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](self, "shareSheetContext"));
    objc_msgSend(v52, "setObject:forSlot:", v28, v51);

    objc_msgSend(v7, "setIconImageSlotID:", v51);
    goto LABEL_36;
  }
  v68 = v8;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "helperConnection"));
  v35 = share_sheet_log();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  v37 = v36;
  if (v34)
  {
    v66 = v7;
    v67 = v34;
    v38 = share_sheet_log();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    v40 = os_signpost_id_make_with_pointer(v39, self);

    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, v40, "UIActivityTitleDrawing", " enableTelemetry=YES ", buf, 2u);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "textColor"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10015473C;
    v73[3] = &unk_100718CA8;
    v73[4] = self;
    v74 = v14;
    v75 = v41;
    v76 = v34;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10015474C;
    v69[3] = &unk_100718CD0;
    v69[4] = self;
    v65 = v74;
    v70 = v65;
    v37 = v75;
    v71 = v37;
    v72 = v76;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "hostConfiguration"));
    -[SDShareSheetSlotManager _uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:](self, "_uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:", v73, v69, 0, v42);
    v33 = *(unsigned int *)buf;

    v43 = share_sheet_log();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v45 = share_sheet_log();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = os_signpost_id_make_with_pointer(v46, self);

    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v47, "UIActivityTitleDrawing", " enableTelemetry=YES ", buf, 2u);
    }

    v7 = v66;
    v34 = v67;
    v32 = &CFErrorCopyUserInfo_ptr;
    if (!(_DWORD)v33)
    {
      v48 = share_sheet_log();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        sub_10016131C(v65, (uint64_t)v37, v49);

    }
  }
  else
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      sub_1001612F0();
    v33 = 0;
  }

  v8 = v68;
  if (v28)
    goto LABEL_35;
LABEL_36:
  objc_msgSend(v32[384], "commit");
  if ((_DWORD)v33)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](self, "accessibilityCache"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activityTitle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
    objc_msgSend(v53, "setLabel:forSlotID:", v54, v55);

    objc_msgSend(v7, "setLabelSlotID:", v33);
  }
  v56 = share_sheet_log();
  v57 = objc_claimAutoreleasedReturnValue(v56);
  v58 = share_sheet_log();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  v60 = os_signpost_id_make_with_pointer(v59, self);

  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, v60, "LoadSharingActivityProxy", ", buf, 2u);
  }

  if (v28)
    v61 = 0;
  else
    v61 = (_DWORD)v33 == 0;
  v62 = !v61;

  return v62;
}

- (BOOL)_loadActionProxy:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  os_signpost_id_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  CFDictionaryRef (__cdecl **v32)(CFErrorRef);
  CFDictionaryRef (__cdecl **v33)(CFErrorRef);
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  CFDictionaryRef (__cdecl **v42)(CFErrorRef);
  CFDictionaryRef (__cdecl **v43)(CFErrorRef);
  id v44;
  NSObject *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  SDShareSheetSlotManager *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  os_signpost_id_t v63;
  BOOL v64;
  BOOL v65;
  void *v67;
  id v68;
  unsigned int v69;
  id v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  NSObject *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  uint8_t buf[4];
  NSObject *v81;
  __int16 v82;
  _BYTE v83[10];
  id v84;

  v7 = a3;
  v70 = a4;
  v8 = share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_signpost_id_make_with_pointer(v11, self);

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoadActionActivityProxy", ", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activity"));
  if (!v13)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetSlotManager.m"), 2968, CFSTR("activity is nil for proxy:%@"), v7);

  }
  v14 = share_sheet_log();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = os_signpost_id_make_with_pointer(v17, self);

  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityTitle"));
    *(_DWORD *)buf = 138543362;
    v81 = v19;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v18, "UIActivityActionImageLoad", "%{public}@", buf, 0xCu);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_actionImage"));
  v21 = share_sheet_log();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = share_sheet_log();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = os_signpost_id_make_with_pointer(v24, self);

  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v25, "UIActivityActionImageLoad", " enableTelemetry=YES ", buf, 2u);
  }

  v26 = objc_retainAutorelease(v20);
  v27 = objc_msgSend(v26, "CGImage");
  v28 = v70;
  if (!v27)
  {
    v29 = share_sheet_log();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityTitle"));
      *(_DWORD *)buf = 138412546;
      v81 = v31;
      v82 = 2112;
      *(_QWORD *)v83 = v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@: imageRef is nil for %@ ", buf, 0x16u);

    }
  }
  v32 = &CFErrorCopyUserInfo_ptr;
  +[CATransaction begin](CATransaction, "begin");
  if ((objc_msgSend(v70, "instantShareSheet") & 1) != 0)
  {
    v33 = 0;
    v34 = 0.0;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "helperConnection"));
    if (v35)
    {
      v68 = v26;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityTitle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager nonBreakingActivityTitle:](SDShareSheetSlotManager, "nonBreakingActivityTitle:", v36));

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "tintColor"));
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100154E2C;
      v76[3] = &unk_100718CF8;
      v77 = v35;
      v78 = v37;
      v79 = v38;
      v72[0] = _NSConcreteStackBlock;
      v28 = v70;
      v72[1] = 3221225472;
      v72[2] = sub_100154E3C;
      v72[3] = &unk_100718D20;
      v73 = v77;
      v39 = v78;
      v74 = v39;
      v40 = v79;
      v75 = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "hostConfiguration"));
      -[SDShareSheetSlotManager _uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:](self, "_uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:", v76, v72, 0, v41);
      v42 = (CFDictionaryRef (__cdecl **)(CFErrorRef))*(unsigned int *)buf;
      v34 = *(double *)&v83[2];

      v43 = v42;
      if (!(_DWORD)v42)
      {
        v44 = share_sheet_log();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v81 = v39;
          v82 = 2112;
          *(_QWORD *)v83 = v13;
          *(_WORD *)&v83[8] = 2112;
          v84 = v40;
          _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "returned nil: CGImgForActionPlatterWithTitle:%@, in: %@, tintColor:%@", buf, 0x20u);
        }

      }
      v26 = v68;
      v32 = &CFErrorCopyUserInfo_ptr;
    }
    else
    {
      v46 = share_sheet_log();
      v39 = objc_claimAutoreleasedReturnValue(v46);
      v34 = 0.0;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        sub_1001613BC();
      v43 = 0;
    }

    v33 = v43;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](self, "shareSheetContext"));
  if (v27)
  {
    v48 = -[SDShareSheetSlotManager createSlotForContext:](self, "createSlotForContext:", v47);
    objc_msgSend(v47, "setObject:forSlot:", v27, v48);
    objc_msgSend(v7, "setIconImageSlotID:", v48);
  }
  v71 = v47;
  if ((_DWORD)v33)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](self, "accessibilityCache"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityTitle"));
    v51 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
    v69 = v33;
    v33 = v32;
    v52 = self;
    v53 = v27;
    v54 = v28;
    v55 = v13;
    v56 = v7;
    v57 = v26;
    v58 = (void *)v51;
    objc_msgSend(v49, "setLabel:forSlotID:", v50, v51);

    v26 = v57;
    v7 = v56;
    v13 = v55;
    v28 = v54;
    v27 = v53;
    self = v52;
    v32 = v33;
    LODWORD(v33) = v69;

    objc_msgSend(v7, "setSlotTextHeight:", v34);
    objc_msgSend(v7, "setLabelSlotID:", v69);
  }
  objc_msgSend(v32[384], "commit");
  v59 = share_sheet_log();
  v60 = objc_claimAutoreleasedReturnValue(v59);
  v61 = share_sheet_log();
  v62 = objc_claimAutoreleasedReturnValue(v61);
  v63 = os_signpost_id_make_with_pointer(v62, self);

  if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_END, v63, "LoadActionActivityProxy", ", buf, 2u);
  }

  if (v27)
    v64 = 0;
  else
    v64 = (_DWORD)v33 == 0;
  v65 = !v64;

  return v65;
}

+ (id)nonBreakingActivityTitle:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (__CFString *)a3;
  v4 = v3;
  if (!v3)
    v3 = &stru_10072FE60;
  v5 = -[__CFString mutableCopy](v3, "mutableCopy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(&off_10074FCE8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(&off_10074FCE8);
        objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), &stru_10072FE60, 2, 0, objc_msgSend(v5, "length"));
      }
      v7 = objc_msgSend(&off_10074FCE8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR(" "), 2, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActivityWithIdentifier:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  NSObject *v27;
  id v28;
  id location;
  uint8_t buf[4];
  NSObject *v31;
  __int16 v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shareActivitiesByUUID"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));

    v13 = share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Selected activity %@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recipients"));
    v16 = objc_msgSend(v15, "count") == 0;

    if (v16)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestionBrowser"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v12, "activityType"));
      objc_msgSend(v24, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", 0, v25, 0, 0);

      -[SDShareSheetSlotManager _performSelectedActivity:inSession:](v8, "_performSelectedActivity:inSession:", v12, v10);
    }
    else
    {
      location = 0;
      objc_initWeak(&location, v8);
      v17 = share_sheet_log();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recipients"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v12, "activityType"));
        *(_DWORD *)buf = 138412546;
        v31 = v19;
        v32 = 2112;
        v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Creating suggestion from provided recipients %@ and activity %@", buf, 0x16u);

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recipients"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v12, "activityType"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100155338;
      v26[3] = &unk_100718D48;
      v26[4] = v10;
      v12 = v12;
      v27 = v12;
      objc_copyWeak(&v28, &location);
      +[SDSuggestionCreationUtilities retrieveSuggestionForRecipients:inActivityType:completionHandler:](_TtC16DaemoniOSLibrary29SDSuggestionCreationUtilities, "retrieveSuggestionForRecipients:inActivityType:completionHandler:", v21, v22, v26);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v23 = share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_1001613E8();
  }

  objc_sync_exit(v8);
}

- (void)_performSelectedActivity:(id)a3 inSession:(id)a4
{
  id v6;
  SDShareSheetSlotManager *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activityType"));
  v9 = objc_msgSend(v8, "isEqualToString:", UIActivityTypeUserDefaults);

  if (v9)
  {
    -[SDShareSheetSlotManager _instructHostToPerformUserDefaultsActivityForCategory:session:](v7, "_instructHostToPerformUserDefaultsActivityForCategory:session:", 1, v6);
  }
  else if (objc_msgSend(v15, "ss_shouldExecuteInShareSheet"))
  {
    -[SDShareSheetSlotManager _performServiceInitiatedActivityInServiceWithActivity:session:](v7, "_performServiceInitiatedActivityInServiceWithActivity:session:", v15, v6);
  }
  else
  {
    v11 = objc_opt_class(UIApplicationExtensionActivity, v10);
    if ((objc_opt_isKindOfClass(v15, v11) & 1) != 0)
    {
      v12 = v15;
      -[SDShareSheetSlotManager _instructHostToPerformExtensionActivity:session:](v7, "_instructHostToPerformExtensionActivity:session:", v12, v6);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activityType"));
      v14 = objc_msgSend(v13, "isEqualToString:", UIActivityTypeAirDrop);

      if (!v14)
      {
        -[SDShareSheetSlotManager _instructHostToPerformHostActivity:session:](v7, "_instructHostToPerformHostActivity:session:", v15, v6);
        goto LABEL_11;
      }
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "airDropPeople"));
      -[SDShareSheetSlotManager _instructHostToPerformAirDropActivityWithNoContentView:session:](v7, "_instructHostToPerformAirDropActivityWithNoContentView:session:", objc_msgSend(v12, "count") == 0, v6);
    }

  }
LABEL_11:
  objc_sync_exit(v7);

}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SDShareSheetSlotManager *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  NSObject *v36;
  SDShareSheetSlotManager *v37;
  id v38;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager getShareSheetSessionForSessionID:](self, "getShareSheetSessionForSessionID:", v6));
  v9 = self;
  objc_sync_enter(v9);
  if (!v8)
  {
    v15 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10016150C();
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionActivitiesByUUID"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestionBrowser"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v11, "activityType"));
  objc_msgSend(v12, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", 0, 0, v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v11, "activityType"));
  if (objc_msgSend(v14, "isEqualToString:", UIActivityTypeUserDefaults))
  {

LABEL_7:
    -[SDShareSheetSlotManager _instructHostToPerformUserDefaultsActivityForCategory:session:](v9, "_instructHostToPerformUserDefaultsActivityForCategory:session:", 0, v8);
    goto LABEL_8;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v11, "activityType"));
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.UIKit.activity.ActionDefaults"));

  if (v17)
    goto LABEL_7;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v11, "activityType"));
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Share"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleActionActivities"));
    v25 = objc_msgSend(v24, "mutableCopy");

    v26 = objc_msgSend(v25, "indexOfObject:", v11);
    objc_msgSend(v25, "removeObject:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostActionActivityProxies"));
    v28 = objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "removeObjectAtIndex:", v26);
    objc_msgSend(v8, "setHostActionActivityProxies:", v28);
    objc_msgSend(v8, "setVisibleActionActivities:", v25);
    objc_msgSend(v8, "setSharingExpanded:", 1);
    v29 = share_sheet_log();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "did expand sharing", buf, 2u);
    }

    -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](v9, "dataSourceDidUpdateForSession:animated:", v8, 1);
  }
  else if ((-[NSObject ss_shouldExecuteInShareSheet](v11, "ss_shouldExecuteInShareSheet") & 1) == 0)
  {
    v32 = objc_opt_class(UIShortcutActivity, v31);
    if ((objc_opt_isKindOfClass(v11, v32) & 1) != 0)
    {
      v11 = v11;
      v18 = 1;
      v19 = v11;
      goto LABEL_9;
    }
    v34 = objc_opt_class(UIApplicationExtensionActivity, v33);
    if ((objc_opt_isKindOfClass(v11, v34) & 1) != 0)
    {
      v11 = v11;
      -[SDShareSheetSlotManager _instructHostToPerformExtensionActivity:session:](v9, "_instructHostToPerformExtensionActivity:session:", v11, v8);

    }
    else
    {
      -[SDShareSheetSlotManager _instructHostToPerformHostActivity:session:](v9, "_instructHostToPerformHostActivity:session:", v11, v8);
    }
  }
LABEL_8:
  v18 = 0;
  v19 = 0;
LABEL_9:

  objc_sync_exit(v9);
  if (v8 && v18 && v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v19, "identifier"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100155A10;
    v35[3] = &unk_100718D70;
    v36 = v19;
    v37 = v9;
    v38 = v8;
    objc_msgSend(v20, "generateSingleUseTokenForWorkflowIdentifier:completion:", v21, v35);

  }
}

- (void)activityViewControllerWithSessionID:(id)a3 performActivityWithType:(id)a4 completionHandler:(id)a5
{
  id v8;
  SDShareSheetSlotManager *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  int v45;
  void *v46;
  void *v47;
  void (**v48)(id, uint64_t, _QWORD);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v8 = a3;
  v49 = a4;
  v48 = (void (**)(id, uint64_t, _QWORD))a5;
  v9 = self;
  objc_sync_enter(v9);
  v47 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v8));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForEntitlement:", CFSTR("com.apple.sharing.sharesheet.perform-activity")));

    v14 = objc_opt_class(NSNumber, v13);
    if ((objc_opt_isKindOfClass(v46, v14) & 1) != 0 && (objc_msgSend(v46, "BOOLValue") & 1) != 0)
    {
      if (objc_msgSend(v11, "sentInitialConfiguration"))
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shareActivitiesByUUID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v55;
LABEL_7:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shareActivitiesByUUID"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v20));

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "activityType"));
            v24 = objc_msgSend(v23, "isEqualToString:", v49);

            if ((v24 & 1) != 0)
              break;

            if (v17 == (id)++v19)
            {
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
              if (v17)
                goto LABEL_7;
              goto LABEL_13;
            }
          }
          v31 = v20;

          if (v31)
            goto LABEL_38;
          v45 = 1;
        }
        else
        {
LABEL_13:

          v45 = 0;
        }
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionActivitiesByUUID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allKeys"));

        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v51;
LABEL_29:
          v36 = 0;
          while (1)
          {
            if (*(_QWORD *)v51 != v35)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionActivitiesByUUID"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v37));

            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "activityType"));
            v41 = objc_msgSend(v40, "isEqualToString:", v49);

            if ((v41 & 1) != 0)
              break;

            if (v34 == (id)++v36)
            {
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
              if (v34)
                goto LABEL_29;
              goto LABEL_35;
            }
          }
          v31 = v37;

          if (!v31)
            goto LABEL_40;
          if (!v45)
          {
            -[SDShareSheetSlotManager activityViewControllerWithSessionID:selectedActionWithIdentifier:](v9, "activityViewControllerWithSessionID:selectedActionWithIdentifier:", v47, v31);
            goto LABEL_39;
          }
LABEL_38:
          -[SDShareSheetSlotManager activityViewControllerWithSessionID:selectedActivityWithIdentifier:](v9, "activityViewControllerWithSessionID:selectedActivityWithIdentifier:", v47, v31);
LABEL_39:
          v42 = 1;
        }
        else
        {
LABEL_35:

LABEL_40:
          v43 = share_sheet_log();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            sub_100161654();

          v42 = 0;
          v31 = 0;
        }
        v48[2](v48, v42, 0);

      }
      else
      {
        v29 = share_sheet_log();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v59 = v49;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Waiting to perform activity with type:%@ until configuration is done...", buf, 0xCu);
        }

        objc_msgSend(v11, "setPerformActivityType:", v49);
        objc_msgSend(v11, "setPerformActivityCompletionHandler:", v48);
      }
    }
    else
    {
      v25 = share_sheet_log();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_100161680();

      v48[2](v48, 0, 0);
    }

  }
  else
  {
    v27 = share_sheet_log();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_1001615F4();

    v48[2](v48, 0, 0);
  }

  objc_sync_exit(v9);
}

- (void)activityViewControllerWithSessionID:(id)a3 findSupportedActivitiesWithCompletionHandler:(id)a4
{
  id v6;
  SDShareSheetSlotManager *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void (**v28)(id, void *, _QWORD);
  void *v29;
  void *v30;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v28 = (void (**)(id, void *, _QWORD))a4;
  v7 = self;
  objc_sync_enter(v7);
  v27 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v30 = v8;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForEntitlement:", CFSTR("com.apple.sharing.sharesheet.perform-activity")));

    v11 = objc_opt_class(NSNumber, v10);
    if ((objc_opt_isKindOfClass(v29, v11) & 1) == 0 || (objc_msgSend(v29, "BOOLValue") & 1) == 0)
    {
      v21 = share_sheet_log();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100161680();

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
      v28[2](v28, v12, 0);
      goto LABEL_16;
    }
    if (objc_msgSend(v30, "sentInitialConfiguration"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "orderedPresentableActivities"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activityType"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[SFShareSheetRemoteActivity sharingServiceWithIdentifier:](SFShareSheetRemoteActivity, "sharingServiceWithIdentifier:", v18));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activityTitle"));
            objc_msgSend(v19, "setTitle:", v20);

            objc_msgSend(v12, "addObject:", v19);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v14);
      }

      v28[2](v28, v12, 0);
LABEL_16:

      goto LABEL_20;
    }
    v25 = share_sheet_log();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Waiting to find supported activities until configuration is done...", buf, 2u);
    }

    objc_msgSend(v30, "setFindSupportedActivitiesCompletionHandler:", v28);
  }
  else
  {
    v23 = share_sheet_log();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_1001616AC();

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v28[2](v28, v29, 0);
  }
LABEL_20:

  objc_sync_exit(v7);
}

- (void)activityViewControllerWithSessionID:(id)a3 provideFeedbackForPeopleSuggestionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v10 = v9;
  if (v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "suggestionBrowser"));
    -[NSObject provideFeedbackForPeopleSuggestionIdentifier:](v11, "provideFeedbackForPeopleSuggestionIdentifier:", v7);
  }
  else
  {
    v12 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10016170C();
  }

  objc_sync_exit(v8);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedPersonWithIdentifier:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  if (v9)
  {
    objc_sync_exit(v8);

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "airdropNodeForIdentifier:", v7));
    if (v10)
    {
      -[SDShareSheetSlotManager _handleSelectedNode:session:](v8, "_handleSelectedNode:session:", v10, v9);
    }
    else
    {
      v13 = share_sheet_log();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10016176C();

    }
    v8 = (SDShareSheetSlotManager *)v10;
  }
  else
  {
    v11 = share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_10016170C();

    objc_sync_exit(v8);
  }

}

- (void)_handleSelectedNode:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  NSString *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  id v20;
  SDShareSheetSlotManager *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  void *i;
  void *v51;
  void *v52;
  unsigned int v53;
  id v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  SDShareSheetSlotManager *obj;
  void *v82;
  NSString *v83;
  void *v84;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  id v92;
  _QWORD block[5];
  _BYTE v94[128];
  uint8_t buf[24];
  id v96;

  v5 = a3;
  v6 = a4;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportBundleID"));
  if ((objc_msgSend(v5, "isSuggestion") & 1) != 0)
  {
    obj = self;
    objc_sync_enter(obj);
    objc_msgSend(v6, "setSelectedRecipient:", v5);
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionIndex"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[_UIActivityHelper activityTypeForBundleIdentifier:](_UIActivityHelper, "activityTypeForBundleIdentifier:", v86));
    v83 = v7;
    if (v7)
    {
      if (v7 == UIActivityTypeMessage)
      {
        v31 = share_sheet_log();
        v9 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realName"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "formattedHandles"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2112;
          v96 = v34;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Messages recipient selected with GUID %@, group name %@, and handles %@", buf, 0x20u);

        }
      }
      else
      {
        v8 = share_sheet_log();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "formattedHandles"));
          v11 = (void *)v10;
          if (v83 == UIActivityTypeMail)
            v12 = CFSTR("Mail");
          else
            v12 = CFSTR("SharePlay");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ recipient selected with handles %@", buf, 0x16u);

        }
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionBrowser"));
      objc_msgSend(v35, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", v82, v86, 0, 0);

      -[SDShareSheetSlotManager notifySession:personSelectedWithActivityType:](obj, "notifySession:personSelectedWithActivityType:", v6, v83);
LABEL_46:

      objc_sync_exit(obj);
      goto LABEL_52;
    }
    v92 = 0;
    v30 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v86, 1, &v92);
    v77 = v92;
    v80 = v30;
    if (v30)
    {
      v79 = 0;
      v76 = 0;
    }
    else
    {
      v91 = 0;
      v79 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:requireValid:platform:error:", v86, 0, dyld_get_active_platform(), &v91);
      v76 = v91;
      if (!v79)
      {
        v75 = share_sheet_log();
        v47 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v86;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v77;
          *(_WORD *)&buf[22] = 2112;
          v96 = v76;
          _os_log_fault_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "Got no application or extension record for %@ with errors %@ and %@", buf, 0x20u);
        }
        v79 = 0;
        v48 = 0;
        v54 = 0;
LABEL_43:

        v55 = share_sheet_log();
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v57;
          *(_WORD *)&buf[22] = 2112;
          v96 = v86;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@ recipient %@ selected for corresponding bundleID %@", buf, 0x20u);

        }
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionBrowser"));
        objc_msgSend(v58, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", v82, v48, 0, 0);

        -[SDShareSheetSlotManager notifySession:activitySelected:](obj, "notifySession:activitySelected:", v6, v54);
        goto LABEL_46;
      }
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareActivitiesInUserOrder"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hiddenActivities"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "arrayByAddingObjectsFromArray:", v42));

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "applicationExtensionRecords"));
    v45 = v44;
    if (v44)
      v78 = v44;
    else
      v78 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v79));

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "valueForKey:", CFSTR("effectiveBundleIdentifier")));
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v47 = v43;
    v48 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v88;
      while (2)
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(_QWORD *)v88 != v49)
            objc_enumerationMutation(v47);
          v51 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "activityType"));
          v53 = objc_msgSend(v46, "containsObject:", v52);

          if (v53)
          {
            v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "activityType"));
            v54 = v51;
            goto LABEL_42;
          }
        }
        v48 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
        if (v48)
          continue;
        break;
      }
    }
    v54 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v13 = share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AirDrop node with display name %@ selected", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v17 = objc_msgSend(v16, "wirelessEnabled");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transferNodes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realName"));
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));

    v21 = self;
    objc_sync_enter(v21);
    if (v20 == v5)
    {
      v36 = share_sheet_log();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Transfer to this node already in progress, cancelling.", buf, 2u);
      }

      objc_msgSend(v6, "cancelAirDropForNode:", v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostConfiguration"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "hostLocale"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayNameForLocale:", v39));

      if (objc_msgSend(v6, "skipSlotsRendering"))
      {
        v40 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithText:", v84);
      }
      else
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostConfiguration"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v59));

        +[CATransaction begin](CATransaction, "begin");
        memset(buf, 0, sizeof(buf));
        v61 = objc_msgSend(v5, "isClassroom");
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcHelperCnx"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostConfiguration"));
        -[SDShareSheetSlotManager _createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:](v21, "_createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:", v84, v60, 2, 0, v61, v62, v63);

        +[CATransaction commit](CATransaction, "commit");
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));

        if (v64)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v21, "accessibilityCache"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)buf));
          objc_msgSend(v65, "setLabel:forSlotID:", v66, v67);

        }
        v68 = objc_alloc((Class)SFProxyText);
        v40 = objc_msgSend(v68, "initWithSlotIdentifier:", *(unsigned int *)buf);

      }
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "realNameToNodeID"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realName"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", v70));

      v72 = objc_msgSend(objc_alloc((Class)SFAirDropTransferChange), "initWithState:progress:proxyIdentifier:displayName:status:", 5, v71, v40, 0, 0.0);
      -[SDShareSheetSlotManager notifySession:withAirDropTransferChange:](v21, "notifySession:withAirDropTransferChange:", v6, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transferNodes"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realName"));
      objc_msgSend(v73, "removeObjectForKey:", v74);

      objc_msgSend(v6, "setFiredImpactHaptic:", 0);
      objc_msgSend(v6, "setTransferActive:", 0);
      objc_msgSend(v6, "setLastTransferEvent:", 4);

      objc_sync_exit(v21);
    }
    else
    {
      objc_msgSend(v6, "setTransferActive:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionHaptic"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10015711C;
      block[3] = &unk_1007146D8;
      block[4] = v22;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realName"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transferNodes"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realName"));
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v5, v25);

      }
      objc_msgSend(v6, "setSelectedRecipient:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionBrowser"));
      objc_msgSend(v26, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", &off_10074B958, v86, 0, 0);

      objc_sync_exit(v21);
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endpointUUID"));
      -[SDShareSheetSlotManager requestAirDropItemsForNode:endpointUUID:session:](v21, "requestAirDropItemsForNode:endpointUUID:session:", v5, v27, v6);
      v21 = (SDShareSheetSlotManager *)v27;
    }

  }
  else
  {
    v28 = share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "WiFi is Off. Presenting AirDrop UI to request WiFi access.", buf, 2u);
    }

    -[SDShareSheetSlotManager _instructHostToPerformAirDropActivityWithNoContentView:session:](self, "_instructHostToPerformAirDropActivityWithNoContentView:session:", 0, v6);
  }
LABEL_52:

}

- (void)activityViewControllerWithSessionID:(id)a3 removedPersonWithIdentifier:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  SDShareSheetSlotManager *obj;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  obj = v8;
  v42 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v43 = v9;
  if (v9)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "suggestedPeople"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v11; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nodeIdentifier"));
          v16 = objc_msgSend(v15, "isEqual:", v7);

          if (v16)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "suggestionBrowser"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject realName](v11, "realName"));
    objc_msgSend(v17, "suggestLessPeopleSuggestionIdentifier:", v18);

    v19 = share_sheet_log();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject nodeIdentifier](v11, "nodeIdentifier"));
      *(_DWORD *)buf = 138412546;
      v49 = v11;
      v50 = 2112;
      v51 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Asked to remove node:%@ with identifier:%@", buf, 0x16u);

    }
    v22 = share_sheet_log();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_claimAutoreleasedReturnValue(-[NSObject transportBundleID](v11, "transportBundleID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject realName](v11, "realName"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actualHandles](v11, "actualHandles"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject contactIDs](v11, "contactIDs"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject derivedIntentIdentifier](v11, "derivedIntentIdentifier"));
      *(_DWORD *)buf = 138413314;
      v49 = v24;
      v50 = 2112;
      v51 = v25;
      v52 = 2112;
      v53 = v26;
      v54 = 2112;
      v55 = v27;
      v56 = 2112;
      v57 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "bundleIDs:%@, conversationID:%@, handles:%@, contactIDs:%@, derivedIntentIdentifier:%@", buf, 0x34u);

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[_PSSuggesterConfiguration defaultConfiguration](_PSSuggesterConfiguration, "defaultConfiguration"));
    v39 = objc_msgSend(objc_alloc((Class)_PSSuggester), "initWithDaemonUsingConfiguration:", v40);
    v29 = objc_alloc((Class)_PSShareSheetSuggestLessFeedback);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject transportBundleID](v11, "transportBundleID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject realName](v11, "realName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject derivedIntentIdentifier](v11, "derivedIntentIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actualHandles](v11, "actualHandles"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "anyObject"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject contactIDs](v11, "contactIDs"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "anyObject"));
    v37 = objc_msgSend(v29, "initWithBundleId:conversationId:derivedIntentId:handle:contactId:", v30, v31, v32, v34, v36);

    objc_msgSend(v39, "provideSuggestLessFeedbackForShareSheetSuggestion:", v37);
  }
  else
  {
    v38 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10016170C();
  }

  objc_sync_exit(obj);
}

- (void)activityViewControllerWithSessionID:(id)a3 didLongPressShareActivityWithIdentifier:(id)a4
{
  id v6;
  SDShareSheetSlotManager *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  SDShareSheetSlotManager *obj;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v6 = a3;
  v29 = a4;
  v7 = self;
  objc_sync_enter(v7);
  obj = v7;
  v28 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v9 = v8;
  if (v8)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shareActivities"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v11; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activityUUID"));
          v16 = objc_msgSend(v15, "isEqual:", v29);

          if (v16)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIDToActivities"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v31;
LABEL_14:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIDToActivities"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v21));

        if (objc_msgSend(v23, "containsObject:", v11))
        {
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("noBundleID")) & 1) == 0)
            break;
        }

        if (v18 == (id)++v20)
        {
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          if (v18)
            goto LABEL_14;
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      v23 = 0;
    }

    v24 = share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Should present activities %@", buf, 0xCu);
    }

  }
  else
  {
    v26 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10016170C();
  }

  objc_sync_exit(obj);
}

- (void)_performServiceInitiatedActivityInServiceWithActivity:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ss_activityTypeToReportToHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ss_activitySpecificExtensionItemDataRequestInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UISUIActivityExtensionItemDataRequest requestForActivity:activityType:activitySpecificMetadata:](UISUIActivityExtensionItemDataRequest, "requestForActivity:activityType:activitySpecificMetadata:", v6, v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](v8, "_remoteObjectProxyForConnection:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "didFinishPerformingActivityHandler"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityUUID"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100157ABC;
  v22[3] = &unk_100718D98;
  v16 = v14;
  v25 = v16;
  v17 = v13;
  v23 = v17;
  v18 = v15;
  v24 = v18;
  objc_msgSend(v6, "setDidFinishPerformingActivityHandler:", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100157B38;
  v20[3] = &unk_100718DC0;
  v19 = v6;
  v21 = v19;
  objc_msgSend(v17, "willPerformInServiceActivityWithRequest:completion:", v11, v20);

  objc_sync_exit(v8);
}

- (id)_activityWithActivityType:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shareActivitiesInUserOrder"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityType"));
      v15 = objc_msgSend(v14, "isEqualToString:", v6);

      if ((v15 & 1) != 0)
        goto LABEL_18;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hiddenActivities", 0));
  v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
LABEL_11:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activityType"));
      v20 = objc_msgSend(v19, "isEqualToString:", v6);

      if ((v20 & 1) != 0)
        break;
      if (v16 == (id)++v18)
      {
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v16)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    v16 = v13;
  }
LABEL_19:

  objc_sync_exit(v8);
  return v16;
}

- (void)activityViewControllerWithSessionID:(id)a3 toggledActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  SDShareSheetSlotManager *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v8));
  v12 = v11;
  if (v11)
  {
    if (a5 == 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shareActivitiesByUUID"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v10, "shareUserDefaults"));
      LODWORD(v13) = objc_msgSend(v15, "activityIsHidden:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v10, "shareUserDefaults"));
      objc_msgSend(v16, "setActivity:asHidden:", v14, v13 ^ 1);

      -[SDShareSheetSlotManager shareActivityUserDefaultsDidChangeWithSession:](v10, "shareActivityUserDefaultsDidChangeWithSession:", v12);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionActivitiesByUUID"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v9));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v10, "actionUserDefaults"));
      LODWORD(v18) = objc_msgSend(v19, "activityIsHidden:", v14);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v10, "actionUserDefaults"));
      objc_msgSend(v20, "setActivity:asHidden:", v14, v18 ^ 1);

      -[SDShareSheetSlotManager actionActivityUserDefaultsDidChangeWithSession:](v10, "actionActivityUserDefaultsDidChangeWithSession:", v12);
    }
  }
  else
  {
    v17 = share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_100161858();
  }

  objc_sync_exit(v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 favoritedActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  id v9;
  id v10;
  SDShareSheetSlotManager *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v9 = a3;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v9));
  v13 = v12;
  if (v12)
  {
    if (a6 == 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shareActivitiesByUUID"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v10));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "favoriteApps"));
      v17 = objc_msgSend(v16, "mutableCopy");
      if (objc_msgSend(v16, "containsObject:", v15))
      {
        objc_msgSend(v17, "removeObject:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v11, "shareUserDefaults"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v15, "activityType"));
        objc_msgSend(v18, "removeActivityTypeFromDefaults:", v19);

      }
      else
      {
        objc_msgSend(v17, "addObject:", v15);
        v25 = objc_opt_class(UIApplicationExtensionActivity, v24);
        if ((objc_opt_isKindOfClass(v15, v25) & 1) != 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v11, "shareUserDefaults"));
          objc_msgSend(v26, "setActivity:asHidden:", v15, 0);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v11, "shareUserDefaults"));
        objc_msgSend(v18, "updateUserActivityOrderWithOrderedPartialActivities:", v17);
      }

      objc_msgSend(v13, "setFavoriteApps:", v17);
      -[SDShareSheetSlotManager shareActivityUserDefaultsDidChangeWithSession:](v11, "shareActivityUserDefaultsDidChangeWithSession:", v13);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionActivitiesByUUID"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v10));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "favoriteActions"));
      v17 = objc_msgSend(v16, "mutableCopy");
      if (objc_msgSend(v16, "containsObject:", v15))
      {
        objc_msgSend(v17, "removeObject:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v11, "actionUserDefaults"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v15, "activityType"));
        objc_msgSend(v22, "removeActivityTypeFromDefaults:", v23);

      }
      else
      {
        objc_msgSend(v17, "addObject:", v15);
        v28 = objc_opt_class(UIApplicationExtensionActivity, v27);
        if ((objc_opt_isKindOfClass(v15, v28) & 1) != 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v11, "actionUserDefaults"));
          objc_msgSend(v29, "setActivity:asHidden:", v15, 0);

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v11, "actionUserDefaults"));
        objc_msgSend(v22, "updateUserActivityOrderWithOrderedPartialActivities:", v17);
      }

      objc_msgSend(v13, "setFavoriteActions:", v17);
      -[SDShareSheetSlotManager actionActivityUserDefaultsDidChangeWithSession:](v11, "actionActivityUserDefaultsDidChangeWithSession:", v13);
    }

  }
  else
  {
    v20 = share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_1001618B8();
  }

  objc_sync_exit(v11);
}

- (void)activityViewControllerWithSessionID:(id)a3 updatedFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  SDShareSheetSlotManager *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v8 = a3;
  v32 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v31 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v8));
  if (v10)
  {
    if (a5 == 1)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v32, "count")));
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v12 = v32;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shareActivitiesByUUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
            -[NSObject addObject:](v11, "addObject:", v19);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v13);
      }

      objc_msgSend(v10, "setFavoriteApps:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v9, "shareUserDefaults"));
      objc_msgSend(v20, "updateUserActivityOrderWithOrderedPartialActivities:", v11);

      -[SDShareSheetSlotManager shareActivityUserDefaultsDidChangeWithSession:](v9, "shareActivityUserDefaultsDidChangeWithSession:", v10);
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v32, "count")));
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v22 = v32;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionActivitiesByUUID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v28));
            -[NSObject addObject:](v11, "addObject:", v29);

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v23);
      }

      objc_msgSend(v10, "setFavoriteActions:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v9, "actionUserDefaults"));
      objc_msgSend(v30, "updateUserActivityOrderWithOrderedPartialActivities:", v11);

      -[SDShareSheetSlotManager actionActivityUserDefaultsDidChangeWithSession:](v9, "actionActivityUserDefaultsDidChangeWithSession:", v10);
    }
  }
  else
  {
    v21 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_100161918();
  }

  objc_sync_exit(v9);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedDefaultActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  SDShareSheetSlotManager *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  SDShareSheetSlotManager *v38;
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager getShareSheetSessionForSessionID:](self, "getShareSheetSessionForSessionID:", v8));
  v11 = self;
  objc_sync_enter(v11);
  if (!v10)
  {
    v16 = share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_100161978();
    goto LABEL_7;
  }
  if (a5 != 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionActivitiesByUUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v9));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activityType"));
    if (objc_msgSend(v21, "isEqualToString:", UIActivityTypeUserDefaults))
    {

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activityType"));
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.UIKit.activity.ActionDefaults"));

      if (!v24)
      {
        v30 = objc_opt_class(UIShortcutActivity, v25);
        if ((objc_opt_isKindOfClass(v20, v30) & 1) != 0)
        {
          v18 = v20;
          v17 = 1;
          goto LABEL_15;
        }
        v34 = objc_opt_class(UIApplicationExtensionActivity, v31);
        if ((objc_opt_isKindOfClass(v20, v34) & 1) != 0)
        {
          v35 = v20;
          -[SDShareSheetSlotManager _instructHostToPerformExtensionActivity:session:](v11, "_instructHostToPerformExtensionActivity:session:", v35, v10);

        }
        else
        {
          -[SDShareSheetSlotManager _instructHostToPerformHostActivity:session:](v11, "_instructHostToPerformHostActivity:session:", v20, v10);
        }
LABEL_14:
        v17 = 0;
        v18 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[SDShareSheetSlotManager _instructHostToPerformUserDefaultsActivityForCategory:session:](v11, "_instructHostToPerformUserDefaultsActivityForCategory:session:", 0, v10);
    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shareActivitiesByUUID"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v13, "activityType"));
  v15 = objc_msgSend(v14, "isEqualToString:", UIActivityTypeUserDefaults);

  if (v15)
  {
    -[SDShareSheetSlotManager _instructHostToPerformUserDefaultsActivityForCategory:session:](v11, "_instructHostToPerformUserDefaultsActivityForCategory:session:", 1, v10);
  }
  else if (-[NSObject ss_shouldExecuteInShareSheet](v13, "ss_shouldExecuteInShareSheet"))
  {
    -[SDShareSheetSlotManager _performServiceInitiatedActivityInServiceWithActivity:session:](v11, "_performServiceInitiatedActivityInServiceWithActivity:session:", v13, v10);
  }
  else
  {
    v28 = objc_opt_class(UIApplicationExtensionActivity, v22);
    if ((objc_opt_isKindOfClass(v13, v28) & 1) != 0)
    {
      v29 = v13;
      -[SDShareSheetSlotManager _instructHostToPerformExtensionActivity:session:](v11, "_instructHostToPerformExtensionActivity:session:", v29, v10);
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activityType](v13, "activityType"));
      v33 = objc_msgSend(v32, "isEqualToString:", UIActivityTypeAirDrop);

      if (!v33)
      {
        -[SDShareSheetSlotManager _instructHostToPerformHostActivity:session:](v11, "_instructHostToPerformHostActivity:session:", v13, v10);
        goto LABEL_7;
      }
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "airDropPeople"));
      -[SDShareSheetSlotManager _instructHostToPerformAirDropActivityWithNoContentView:session:](v11, "_instructHostToPerformAirDropActivityWithNoContentView:session:", -[NSObject count](v29, "count") == 0, v10);
    }

  }
LABEL_7:

  v17 = 0;
  v18 = 0;
LABEL_16:
  objc_sync_exit(v11);

  if (v10 && v17 && v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100158A38;
    v36[3] = &unk_100718D70;
    v37 = v18;
    v38 = v11;
    v39 = v10;
    objc_msgSend(v26, "generateSingleUseTokenForWorkflowIdentifier:completion:", v27, v36);

  }
}

- (void)activityViewControllerPerformedActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  SDShareSheetSlotManager *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;

  v7 = a7;
  v12 = a3;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v12));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setEngagedWithSheet:", v7);
    objc_msgSend(v16, "setSelectedRecipient:", 0);
    v17 = objc_alloc_init((Class)SFShareSheetCompletedEvent);
    -[NSObject setSessionID:](v17, "setSessionID:", v12);
    -[NSObject setPresentationMs:](v17, "setPresentationMs:", a4);
    -[NSObject setTotalShareTimeMs:](v17, "setTotalShareTimeMs:", a5);
    -[NSObject setActivityType:](v17, "setActivityType:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hostConfiguration"));
    -[NSObject setIsCollaborative:](v17, "setIsCollaborative:", objc_msgSend(v18, "isCollaborative"));

    -[NSObject setSuccess:](v17, "setSuccess:", v7);
    v19 = share_sheet_log();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject eventPayload](v17, "eventPayload"));
      v23 = 138412290;
      v24 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Report activity: %@", (uint8_t *)&v23, 0xCu);

    }
    -[NSObject submitEvent](v17, "submitEvent");
  }
  else
  {
    v22 = share_sheet_log();
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_100161A60();
  }

  objc_sync_exit(v14);
}

- (void)activityViewControllerDidAppearWithSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  SDShareSheetSlotManager *v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    objc_sync_exit(v5);

    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "activityViewControllerDidAppear: for session ID %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100158E80;
    block[3] = &unk_1007146D8;
    v12 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = v12;
  }
  else
  {
    v9 = share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100161AC0();

    objc_sync_exit(v5);
  }

}

- (void)activityViewControllerDidDisappearWithSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  SDShareSheetSlotManager *v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    objc_sync_exit(v5);

    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "activityViewControllerDidDisappear: for session ID %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100159088;
    block[3] = &unk_1007146D8;
    v12 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = v12;
  }
  else
  {
    v9 = share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100161B20();

    objc_sync_exit(v5);
  }

}

- (void)activityViewControllerDidEnterBackgroundWithSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  SDShareSheetSlotManager *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    objc_sync_exit(v5);

    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "activityViewControllerDidEnterBackground: for session ID %@", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcHelperCnx"));
    objc_msgSend(v9, "setSessionKeepAliveTransactionIdentifier:", 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100159290;
    block[3] = &unk_1007146D8;
    v13 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = v13;
  }
  else
  {
    v10 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_100161B80();

    objc_sync_exit(v5);
  }

}

- (void)activityViewControllerWillEnterForegroundWithSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  SDShareSheetSlotManager *v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    objc_sync_exit(v5);

    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "activityViewControllerWillEnterForeground: for session ID %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015947C;
    block[3] = &unk_1007146D8;
    v12 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = v12;
  }
  else
  {
    v9 = share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100161BE0();

    objc_sync_exit(v5);
  }

}

- (void)activityViewControllerPerformEditActionsWithSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    -[SDShareSheetSlotManager _instructHostToPerformUserDefaultsActivityForCategory:session:](v5, "_instructHostToPerformUserDefaultsActivityForCategory:session:", 0, v6);
  }
  else
  {
    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_100161C40();

  }
  objc_sync_exit(v5);

}

- (void)shareActivityUserDefaultsDidChangeWithSession:(id)a3
{
  SDShareSheetSlotManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  SDShareSheetSlotManager *obj;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];

  v41 = a3;
  v4 = self;
  objc_sync_enter(v4);
  obj = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v4, "shareUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "shareActivities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activitiesOrderedByUserActivityOrderForActivities:", v6));

  objc_msgSend(v41, "setShareActivitiesInUserOrder:", v7);
  if (_os_feature_enabled_impl("Sharing", "combine_share_activities"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager _groupActivitiesByBundleID:](SDShareSheetSlotManager, "_groupActivitiesByBundleID:", v7));
    objc_msgSend(v41, "setBundleIDToActivities:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bundleIDToActivities"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _removeSecondaryActivities:bundleIDToActivities:](v4, "_removeSecondaryActivities:bundleIDToActivities:", v7, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "urlBeingShared"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _moveDefaultApplicationToFrontForURL:activities:](v4, "_moveDefaultApplicationToFrontForURL:activities:", v11, v10));

  }
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100159ACC;
  v46[3] = &unk_100718B68;
  v46[4] = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v46));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v12));

  v14 = objc_msgSend(v13, "count");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v4, "shareUserDefaults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activityIdentifiersInUserOrder"));
  v17 = objc_msgSend(v16, "count");

  v18 = 12;
  if ((unint64_t)v17 > 0xC)
    v18 = (unint64_t)v17;
  if ((unint64_t)v14 >= v18)
    v19 = (id)v18;
  else
    v19 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", 0, v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "shareUserDefaultsActivity"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObject:", v21));

  objc_msgSend(v41, "setVisibleShareActivities:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _createShareProxiesFromActivities:session:](v4, "_createShareProxiesFromActivities:session:", v39, v41));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v4, "shareSheetContext"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "hostShareActivityProxies"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v43;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v28);
        v30 = share_sheet_log();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Deleting slots for share proxy %@", buf, 0xCu);
        }

        v32 = objc_msgSend(v29, "iconImageSlotID");
        v33 = objc_msgSend(v29, "labelSlotID");
        if ((_DWORD)v32)
          objc_msgSend(v22, "deleteSlot:", v32);
        if ((_DWORD)v33)
        {
          objc_msgSend(v22, "deleteSlot:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
          objc_msgSend(v24, "addObject:", v34);

        }
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v26);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](obj, "accessibilityCache"));
  objc_msgSend(v35, "removeLabelsForSlotIDs:", v24);

  objc_msgSend(v41, "setHostShareActivityProxies:", v38);
  +[CATransaction flush](CATransaction, "flush");
  v36 = share_sheet_log();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "share user defaults did change", buf, 2u);
  }

  -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](obj, "dataSourceDidUpdateForSession:animated:", v41, 0);
  objc_sync_exit(obj);

}

- (void)actionActivityUserDefaultsDidChangeWithSession:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  SDShareSheetSlotManager *obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  obj = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v5, "actionUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionActivities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activitiesOrderedByUserActivityOrderForActivities:", v7));

  objc_msgSend(v4, "setActionActivitiesInUserOrder:", v8);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100159F40;
  v36[3] = &unk_100718B90;
  v36[4] = v5;
  v31 = v4;
  v37 = v31;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v36));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v9));

  objc_msgSend(v31, "setVisibleActionActivities:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hostConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hostTintColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _createActionProxiesFromActivities:withTintColor:session:](v5, "_createActionProxiesFromActivities:withTintColor:session:", v29, v10, v31));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v5, "shareSheetContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hostActionActivityProxies"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v33;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17);
        v19 = share_sheet_log();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Deleting slots for action proxy %@", buf, 0xCu);
        }

        v21 = objc_msgSend(v18, "iconImageSlotID");
        v22 = objc_msgSend(v18, "labelSlotID");
        if ((_DWORD)v21)
          objc_msgSend(v11, "deleteSlot:", v21);
        if ((_DWORD)v22)
        {
          objc_msgSend(v11, "deleteSlot:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v22));
          objc_msgSend(v13, "addObject:", v23);

        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v15);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](obj, "accessibilityCache"));
  objc_msgSend(v24, "removeLabelsForSlotIDs:", v13);

  objc_msgSend(v31, "setHostActionActivityProxies:", v28);
  +[CATransaction flush](CATransaction, "flush");
  v25 = share_sheet_log();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "action user defaults did change", buf, 2u);
  }

  -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](obj, "dataSourceDidUpdateForSession:animated:", v31, 0);
  objc_sync_exit(obj);

}

- ($EC76EA2E339756B4D2C49A1061DE0928)_uploadSlotWithVectorData:(SEL)a3 sfCGImageData:(id)a4 performCATransaction:(id)a5 hostConfiguration:(BOOL)a6
{
  _BOOL8 v8;
  id v11;
  $EC76EA2E339756B4D2C49A1061DE0928 *result;
  _QWORD v13[4];
  id v14;

  v8 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10015A080;
  v13[3] = &unk_100718DE8;
  v14 = a5;
  v11 = v14;
  -[SDShareSheetSlotManager _uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:](self, "_uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:", a4, v13, v8, a7);

  return result;
}

- ($EC76EA2E339756B4D2C49A1061DE0928)_uploadSlotWithVectorData:(SEL)a3 cgImage:(id)a4 performCATransaction:(id)a5 hostConfiguration:(BOOL)a6
{
  _BOOL4 v8;
  uint64_t (**v12)(_QWORD);
  uint64_t (**v13)(_QWORD);
  id v14;
  uint64_t v15;
  uint64_t v16;
  CGImage *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CGFloat Width;
  CGFloat Height;
  id v24;
  NSObject *v25;
  uint64_t v26;
  $EC76EA2E339756B4D2C49A1061DE0928 *result;

  v8 = a6;
  v12 = (uint64_t (**)(_QWORD))a4;
  v13 = (uint64_t (**)(_QWORD))a5;
  v14 = a7;
  retstr->var1.width = 0.0;
  retstr->var1.height = 0.0;
  *(_QWORD *)&retstr->var0 = 0;
  if (!+[SDStatusMonitor enableShareSheetVectorSlots](SDStatusMonitor, "enableShareSheetVectorSlots")
    || objc_msgSend(v14, "hostIdiom") != (id)6)
  {
    v17 = (CGImage *)v13[2](v13);
    if (!v17)
      goto LABEL_16;
    v18 = 0;
    goto LABEL_7;
  }
  v15 = v12[2](v12);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = (CGImage *)v16;
    v18 = 1;
LABEL_7:
    if (v8)
      +[CATransaction begin](CATransaction, "begin");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](self, "shareSheetContext"));
    v20 = -[SDShareSheetSlotManager createSlotForContext:](self, "createSlotForContext:", v19);

    if ((v18 & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](self, "shareSheetContext"));
      objc_msgSend(v21, "setObject:forSlot:", v17, v20);

      Width = (double)CGImageGetWidth(v17);
      Height = (double)CGImageGetHeight(v17);
      retstr->var1.width = Width;
      retstr->var1.height = Height;
      retstr->var0 = v20;
    }
    if (v8)
    {
      +[CATransaction commit](CATransaction, "commit");
      +[CATransaction flush](CATransaction, "flush");
    }
    goto LABEL_16;
  }
  v24 = share_sheet_log();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_100161CA0(v25, v26);

  v17 = 0;
LABEL_16:

  return result;
}

- (void)_instructHostToPerformUserDefaultsActivityForCategory:(int64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  unsigned int v34;
  unsigned __int8 v35;
  uint64_t v36;
  id v37;
  double v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  id v55;
  NSObject *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL8 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  NSMutableArray *v74;
  id v75;
  id v76;
  NSObject *v77;
  __int128 v78;
  NSMutableArray *v79;
  NSMutableArray *v80;
  id v81;
  void *v82;
  NSMutableArray *v83;
  id v84;
  int64_t v85;
  uint64_t v86;
  id v87;
  unsigned int v88;
  void *v89;
  SDShareSheetSlotManager *v90;
  NSString *v91;
  id obj;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  int64_t v97;
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  int64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  id v112;
  __int16 v113;
  _BYTE v114[10];
  id v115;
  _BYTE v116[128];
  _BYTE v117[128];

  v6 = a4;
  v80 = objc_opt_new(NSMutableArray);
  v79 = objc_opt_new(NSMutableArray);
  v83 = objc_opt_new(NSMutableArray);
  v90 = self;
  objc_sync_enter(v90);
  v85 = a3;
  v89 = v6;
  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareActivitiesInUserOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v90, "shareUserDefaults"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityIdentifiersInUserOrder"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostShareActivityProxies"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionActivitiesInUserOrder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v90, "actionUserDefaults"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityIdentifiersInUserOrder"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostActionActivityProxies"));
  }
  v11 = v9;
  v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v108 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
    }
    while (v13);
  }

  v88 = objc_msgSend(v89, "skipSlotsRendering");
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v84 = v7;
  v18 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
  if (v18)
  {
    v86 = *(_QWORD *)v104;
    *(_QWORD *)&v19 = 138412802;
    v78 = v19;
LABEL_13:
    v87 = v18;
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v104 != v86)
        objc_enumerationMutation(v84);
      v21 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType", v78));
      v23 = UIActivityTypeMail;
      v24 = v22;
      v25 = v24;
      if (v23 == v24)
      {

      }
      else
      {
        if ((UIActivityTypeMail == 0) == (v24 != 0))
        {

LABEL_24:
          goto LABEL_25;
        }
        v26 = -[NSString isEqual:](v23, "isEqual:", v24);

        if (!v26)
          goto LABEL_24;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "effectiveBlockedAppBundleIDs"));
      v29 = objc_msgSend(v28, "containsObject:", CFSTR("com.apple.mobilemail"));

      if ((v29 & 1) != 0)
        goto LABEL_57;
LABEL_25:
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      v31 = UIActivityTypeAirDrop;
      v32 = v30;
      v33 = v32;
      v91 = v31;
      if (v31 == v32)
      {

LABEL_30:
        v35 = objc_msgSend(v89, "airDropAllowed");

        if ((v35 & 1) == 0)
          goto LABEL_57;
        goto LABEL_34;
      }
      if ((UIActivityTypeAirDrop == 0) != (v32 != 0))
      {
        v34 = -[NSString isEqual:](v31, "isEqual:", v32);

        if (v34)
          goto LABEL_30;
      }
      else
      {

      }
LABEL_34:
      if ((v88 & 1) != 0)
      {
        v36 = 0;
        v37 = 0;
        v38 = 0.0;
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "xpcHelperCnx"));
        if (!v39)
        {
          v76 = share_sheet_log();
          v77 = objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
            sub_100161D3C();

          goto LABEL_66;
        }
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_activitySettingsImage")));
        v81 = objc_msgSend(v40, "CGImage");

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityTitle"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        +[CATransaction begin](CATransaction, "begin");
        v98[0] = _NSConcreteStackBlock;
        v98[1] = 3221225472;
        v98[2] = sub_10015AD00;
        v98[3] = &unk_100718E10;
        v43 = v39;
        v99 = v43;
        v44 = v41;
        v100 = v44;
        v45 = v42;
        v101 = v45;
        v102 = v85;
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_10015AD10;
        v93[3] = &unk_100718E38;
        v46 = v43;
        v94 = v46;
        v47 = v44;
        v95 = v47;
        v48 = v45;
        v96 = v48;
        v97 = v85;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "hostConfiguration"));
        -[SDShareSheetSlotManager _uploadSlotWithVectorData:sfCGImageData:performCATransaction:hostConfiguration:](v90, "_uploadSlotWithVectorData:sfCGImageData:performCATransaction:hostConfiguration:", v98, v93, 0, v49);
        v36 = *(unsigned int *)buf;
        v38 = *(double *)&v114[2];

        if ((_DWORD)v36)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v90, "accessibilityCache"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityTitle"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v36));
          objc_msgSend(v50, "setLabel:forSlotID:", v51, v52);

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v90, "shareSheetContext"));
          v37 = (id)-[SDShareSheetSlotManager createSlotForContext:](v90, "createSlotForContext:", v53);
          objc_msgSend(v53, "setObject:forSlot:", v81, v37);
          +[CATransaction commit](CATransaction, "commit");

          v54 = 0;
        }
        else
        {
          v55 = share_sheet_log();
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v78;
            v112 = v47;
            v113 = 2112;
            *(_QWORD *)v114 = v21;
            *(_WORD *)&v114[8] = 2112;
            v115 = v48;
            _os_log_fault_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "returned nil: CGImgDataForActivityMoreListEntryForActivityTitle:%@, in: %@, labelColor:%@", buf, 0x20u);
          }

          +[CATransaction commit](CATransaction, "commit");
          v37 = 0;
          v54 = 5;
        }

        if (v54)
          goto LABEL_57;
      }
      v57 = objc_alloc((Class)_UIUserDefaultsActivityProxy);
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityUUID"));
      v59 = objc_msgSend(v57, "initWithIdentifier:", v58);

      if (v88)
      {
        v60 = objc_alloc((Class)SFProxyText);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityTitle"));
        v62 = objc_msgSend(v60, "initWithText:", v61);

      }
      else
      {
        v62 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithSlotIdentifier:slotTextHeight:", v36, v38);
      }
      objc_msgSend(v59, "setActivityTitle:", v62);
      if (v88)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager _bundleIdentifierForActivity:](SDShareSheetSlotManager, "_bundleIdentifierForActivity:", v21));
        if ((objc_msgSend(v63, "isEqualToString:", CFSTR("noBundleID")) & 1) == 0)
          objc_msgSend(v59, "setApplicationBundleIdentifier:", v63);

      }
      else
      {
        objc_msgSend(v59, "setIconImageSlotID:", v37);
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "screenTimeMonitor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      v66 = objc_msgSend(v64, "cachedPolicyForActivityType:", v65) != 0;

      objc_msgSend(v59, "setIsDisabled:", v66);
      if (v85 == 1)
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v90, "shareUserDefaults"));
        objc_msgSend(v59, "setCanHide:", objc_msgSend(v67, "canHideActivity:", v21));

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareUserDefaults](v90, "shareUserDefaults"));
      }
      else
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v90, "actionUserDefaults"));
        objc_msgSend(v59, "setCanHide:", objc_msgSend(v69, "canHideActivity:", v21));

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager actionUserDefaults](v90, "actionUserDefaults"));
      }
      objc_msgSend(v59, "setIsHidden:", objc_msgSend(v68, "activityIsHidden:", v21));

      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      objc_msgSend(v59, "setCanEdit:", objc_msgSend(v70, "isEqualToString:", v91) ^ 1);

      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      objc_msgSend(v59, "setCanMove:", objc_msgSend(v71, "isEqualToString:", v91) ^ 1);

      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      v73 = objc_msgSend(v82, "containsObject:", v72);

      v74 = v83;
      v75 = v59;
      if (v73)
      {
        -[NSMutableArray addObject:](v79, "addObject:", v59);
        v74 = v80;
        v75 = v21;
      }
      -[NSMutableArray addObject:](v74, "addObject:", v75);

LABEL_57:
      if (v87 == (id)++v20)
      {
        v18 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
        if (v18)
          goto LABEL_13;
        break;
      }
    }
  }

  if (v85 == 1)
    objc_msgSend(v89, "setFavoriteApps:", v80);
  else
    objc_msgSend(v89, "setFavoriteActions:", v80);
  +[CATransaction flush](CATransaction, "flush");
  -[SDShareSheetSlotManager notifySession:favoritesProxies:suggestionProxies:activityCategory:](v90, "notifySession:favoritesProxies:suggestionProxies:activityCategory:", v89, v79, v83, v85);
LABEL_66:

  objc_sync_exit(v90);
}

- (void)_instructHostToPerformExtensionActivity:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
    v12 = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing extension %@", (uint8_t *)&v12, 0xCu);

  }
  -[SDShareSheetSlotManager notifySession:activitySelected:](v8, "notifySession:activitySelected:", v7, v6);
  objc_sync_exit(v8);

}

- (void)_instructHostToPerformShortcutActivity:(id)a3 singleUseToken:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  SDShareSheetSlotManager *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[SDShareSheetSlotManager notifySession:shortcutSelectedWithBundleID:singleUseToken:](v10, "notifySession:shortcutSelectedWithBundleID:singleUseToken:", v9, CFSTR("com.apple.shortcuts.Run-Workflow"), v8);
  objc_sync_exit(v10);

}

- (void)_instructHostToPerformHostActivity:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  SDShareSheetSlotManager *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v10 = share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityType"));
    v16 = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing host %@", (uint8_t *)&v16, 0xCu);

  }
  v14 = objc_opt_class(SUIHostActivityProxy, v13);
  if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
  {
    v15 = v7;
    -[SDShareSheetSlotManager notifySession:activitySelected:](v9, "notifySession:activitySelected:", v8, v15);
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SDShareSheetSlotManager.m"), 4090, CFSTR("attempt to perform an activity in-host that is not an in-host activity"));
  }

  objc_sync_exit(v9);
}

- (void)_instructHostToPerformAirDropActivityWithNoContentView:(BOOL)a3 session:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "connection"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _remoteObjectProxyForConnection:](self, "_remoteObjectProxyForConnection:", v6));

  objc_msgSend(v7, "performAirDropActivityInHostWithNoContentView:", v4);
}

- (void)_loadPresentableActivitiesForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](self, "currentConnection"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }

  v7[0] = v8;
  v7[1] = v9;
  objc_msgSend(v4, "_loadPresentableActivitiesForAuditToken:", v7);

}

- (void)activateSuggestionBrowserForSession:(id)a3 withExtensionMatchingDictionaries:(id)a4 assetIdentifiers:(id)a5 urlsBeingShared:(id)a6 sandboxExtensionsByfileURLPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SDShareSheetSlotManager *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  os_signpost_id_t v24;
  id v25;
  SDSuggestionBrowserContext *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  os_signpost_id_t v43;
  id v44;
  id v45;
  uint8_t v46[16];
  uint8_t v47[16];
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = self;
  objc_sync_enter(v17);
  if (objc_msgSend(v12, "hideSuggestions"))
  {
    v18 = share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not activating suggestion browser because hideSuggestions is true", buf, 2u);
    }
  }
  else
  {
    v20 = share_sheet_log();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = share_sheet_log();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = os_signpost_id_make_with_pointer(v23, v17);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v24, "ConfigurePeopleSuggester", " enableTelemetry=YES ", v47, 2u);
    }

    v25 = sub_10020CFE4(v13);
    v19 = objc_claimAutoreleasedReturnValue(v25);
    v45 = v13;
    v26 = objc_alloc_init(SDSuggestionBrowserContext);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](v17, "currentConnection"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sd_connectionBundleID"));
    -[SDSuggestionBrowserContext setBundleID:](v26, "setBundleID:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject array](v19, "array"));
    -[SDSuggestionBrowserContext setTypeIdentifiersBeingShared:](v26, "setTypeIdentifiersBeingShared:", v29);

    -[SDSuggestionBrowserContext setPhotosAssetIDs:](v26, "setPhotosAssetIDs:", v14);
    -[SDSuggestionBrowserContext setUrlsBeingShared:](v26, "setUrlsBeingShared:", v15);
    -[SDSuggestionBrowserContext setSandboxExtensionsByfileURLPath:](v26, "setSandboxExtensionsByfileURLPath:", v16);
    -[SDSuggestionBrowserContext setShouldSuggestFamilyMembers:](v26, "setShouldSuggestFamilyMembers:", objc_msgSend(v12, "shouldSuggestFamilyMembers"));
    -[SDSuggestionBrowserContext setIsSharePlayAvailable:](v26, "setIsSharePlayAvailable:", objc_msgSend(v12, "isSharePlayAvailable"));
    -[SDSuggestionBrowserContext setSupportsCollaboration:](v26, "setSupportsCollaboration:", objc_msgSend(v12, "supportsCollaboration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peopleSuggestionBundleIds"));
    -[SDSuggestionBrowserContext setPeopleSuggestionBundleIds:](v26, "setPeopleSuggestionBundleIds:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processedImageResultsData"));
    -[SDSuggestionBrowserContext setProcessedImageResultsData:](v26, "setProcessedImageResultsData:", v31);
    v44 = v16;
    v32 = v15;
    v33 = v14;

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sessionID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](v17, "currentConnection"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_queue"));
    objc_msgSend(v12, "peopleSuggestionsTimeout");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDSuggestionBrowser asyncBrowserWithSessionID:context:queue:timeout:](SDSuggestionBrowser, "asyncBrowserWithSessionID:context:queue:timeout:", v34, v26, v36));

    objc_msgSend(v37, "setDelegate:", v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "xpcHelperCnx"));
    objc_msgSend(v37, "setHelperConnection:", v38);

    objc_msgSend(v12, "setSuggestionBrowser:", v37);
    v39 = share_sheet_log();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = share_sheet_log();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v43 = os_signpost_id_make_with_pointer(v42, v17);

    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)v46 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, v43, "ConfigurePeopleSuggester", " enableTelemetry=YES ", v46, 2u);
    }

    v14 = v33;
    v15 = v32;
    v16 = v44;
    v13 = v45;
  }

  objc_sync_exit(v17);
}

- (void)suggestionBrowserDidUpdateSuggestions:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  NSMutableDictionary *sessionIDToShareSheetSession;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  sessionIDToShareSheetSession = v5->_sessionIDToShareSheetSession;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessionIDToShareSheetSession, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
    v10 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "sessionID"));
      sub_100161D9C(v12, (uint64_t)&v15, v11);
    }
    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostConfiguration"));

  if (!v9)
  {
    v13 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));
      v15 = 138412290;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "suggestionBrowserDidUpdateSuggestions: initial configuration hasn't happened yet for ID %@", (uint8_t *)&v15, 0xCu);

    }
LABEL_8:

    goto LABEL_9;
  }
  -[SDShareSheetSlotManager _configurePeopleSuggestionsSectionForSession:](v5, "_configurePeopleSuggestionsSectionForSession:", v8);
  -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](v5, "dataSourceDidUpdateForSession:animated:", v8, 0);
LABEL_9:

  objc_sync_exit(v5);
}

- (void)sessionDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "session did change", v7, 2u);
  }

  -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](self, "dataSourceDidUpdateForSession:animated:", v4, 1);
}

- (void)session:(id)a3 didConnectNearbySharingInteractionWithEndpointUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  id v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "did connect nearby sharing interaction with endpointUUID:%@", (uint8_t *)&v13, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostConfiguration"));
  v11 = objc_msgSend(v10, "isCollaborative");

  if (v11)
  {
    v12 = objc_msgSend(objc_alloc((Class)SFAirDropTransferChange), "initWithState:progress:proxyIdentifier:displayName:status:", 7, 0, 0, 0, 0.0);
    -[SDShareSheetSlotManager notifySession:withAirDropTransferChange:](self, "notifySession:withAirDropTransferChange:", v6, v12);

  }
  else
  {
    -[SDShareSheetSlotManager requestAirDropItemsForNode:endpointUUID:session:](self, "requestAirDropItemsForNode:endpointUUID:session:", 0, v7, v6);
  }

}

- (BOOL)activityHelper:(id)a3 matchingWithContext:(id)a4 shouldIncludeSystemActivityType:(id)a5 sessionID:(id)a6
{
  return 1;
}

- (id)activityHelper:(id)a3 activitiesForActivityType:(id)a4 matchingContext:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v34;
  unsigned int v35;
  _QWORD v36[4];
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v13));
  if (!v15)
  {
    v24 = share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_100161DE8();

    goto LABEL_8;
  }
  if (!_UIActivityOpenInApplicationTypeForActivityType(v11))
  {
LABEL_8:
    v26 = 0;
    goto LABEL_13;
  }
  v34 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager sessionIDToShareSheetSession](self, "sessionIDToShareSheetSession"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v13));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hostConfiguration"));
  v35 = objc_msgSend(v18, "_unitTest_disableExcludingSourceApplicationFromOpenActivities");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activityItemValueClasses"));
  v20 = objc_msgSend(v19, "count");

  if (v20 == (id)1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activityItemValueExtensionMatchingDictionaries"));
    v22 = sub_10020D244(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  }
  else
  {
    v23 = 0;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activityItemValues"));
  v28 = objc_msgSend(v12, "isContentManaged");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hostAuditTokenData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUIOpenInAppActivity openInActivitiesForItems:isContentManaged:sourceApplicationAuditTokenData:includeSourceApplicationInResults:supportedTypeIdentifiers:](SUIOpenInAppActivity, "openInActivitiesForItems:isContentManaged:sourceApplicationAuditTokenData:includeSourceApplicationInResults:supportedTypeIdentifiers:", v27, v28, v29, v35, v23));

  if (_UIActivityOpenInApplicationTypeForActivityType(v11) != 1)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100160870;
    v36[3] = &unk_100718FD0;
    v37 = v11;
    v30 = v37;
    v31 = v26;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "indexesOfObjectsPassingTest:", v36));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectsAtIndexes:", v32));

  }
  v10 = v34;
LABEL_13:

  objc_sync_exit(v14);
  return v26;
}

- (id)activityHelper:(id)a3 predictionContextForSessionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v7));
  if (!v9)
  {
    v15 = share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_100161E48();
    v10 = 0;
    goto LABEL_12;
  }
  v10 = objc_alloc_init(off_1007B28F0());
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostAppBundleID"));
  objc_msgSend(v10, "setBundleID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "setSuggestionDate:", v12);

  objc_msgSend(v10, "setShowPotentialFamilyMembers:", objc_msgSend(v9, "shouldSuggestFamilyMembers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peopleSuggestionBundleIds"));
  objc_msgSend(v10, "setSuggestionsFilteredByBundleIds:", v13);

  objc_msgSend(v10, "setIsSharePlayAvailable:", objc_msgSend(v9, "isSharePlayAvailable"));
  objc_msgSend(v10, "setSessionID:", v7);
  if ((objc_opt_respondsToSelector(v10, "isCollaborationAvailable") & 1) != 0)
  {
    if (objc_msgSend(v9, "supportsCollaboration"))
      v14 = _os_feature_enabled_impl("TelephonyUtilities", "collaborateTogetherEnabled");
    else
      v14 = 0;
    objc_msgSend(v10, "setIsCollaborationAvailable:", v14);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "processedImageResultsData"));

  if (v17)
  {
    v18 = objc_alloc(off_1007B28F8());
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "urlBeingShared"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "processedImageResultsData"));
    v16 = objc_msgSend(v18, "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:", 0, CFSTR("SDShareSheetImageAnalysisIdentifier"), 0, 0, 0, v19, 0, v20);

    v23 = v16;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v10, "setAttachments:", v21);

LABEL_12:
  }

  objc_sync_exit(v8);
  return v10;
}

- (unsigned)createSlotForContext:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "createSlot");
  if (!v4)
  {
    do
    {
      objc_msgSend(v3, "deleteSlot:", 0);
      v5 = objc_msgSend(v3, "createSlot");
    }
    while (!v5);
    v4 = v5;
  }

  return v4;
}

- (CAContext)shareSheetContext
{
  os_unfair_lock_s *p_contextLock;
  CAContext **p_shareSheetContext;
  CAContext *v5;
  CAContext *v6;
  id v7;
  NSObject *v8;
  void *v9;

  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  p_shareSheetContext = &self->_shareSheetContext;
  v5 = self->_shareSheetContext;
  v6 = v5;
  if (!v5 || (-[CAContext valid](v5, "valid") & 1) == 0)
  {
    if ((-[CAContext valid](v6, "valid") & 1) == 0)
    {
      v7 = share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100161EA8();

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager _createShareSheetContext](self, "_createShareSheetContext"));

    objc_storeStrong((id *)p_shareSheetContext, v9);
    v6 = (CAContext *)v9;
  }
  os_unfair_lock_unlock(p_contextLock);
  return v6;
}

- (void)invalidateShareSheetContext
{
  os_unfair_lock_s *p_contextLock;
  CAContext *shareSheetContext;

  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  -[CAContext invalidate](self->_shareSheetContext, "invalidate");
  shareSheetContext = self->_shareSheetContext;
  self->_shareSheetContext = 0;

  os_unfair_lock_unlock(p_contextLock);
}

- (void)configureAirDropNodesFromSuggestionNodes:(id)a3 shareUserDefaults:(id)a4 forSession:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *i;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  UIActivityType v16;
  unsigned __int8 v17;
  __CFString *v18;
  __CFString *v19;
  unsigned int v20;
  unsigned __int8 v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  __CFString *v32;
  __CFString *v33;
  unsigned int v34;
  id v35;
  uint64_t v36;
  void *k;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  unsigned int v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  void *v70;
  SDShareSheetLoadingConfiguration *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  NSObject *v80;
  const char *v81;
  id v82;
  SDShareSheetLoadingConfiguration *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  SDShareSheetSlotManager *val;
  NSMutableArray *v96;
  void *v97;
  id obj;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  NSMutableArray *v103;
  __CFString *v104;
  id v105;
  _QWORD v106[4];
  NSObject *v107;
  SDShareSheetLoadingConfiguration *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE buf[12];
  __int16 v127;
  void *v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];

  v8 = a3;
  v9 = a4;
  v105 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "shareActivitiesInUserOrder"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("activityType")));

  v96 = objc_opt_new(NSMutableArray);
  v103 = objc_opt_new(NSMutableArray);
  val = self;
  objc_sync_enter(val);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
  if (v11)
  {
    v100 = *(_QWORD *)v123;
    do
    {
      v102 = v11;
      for (i = 0; i != v102; i = (char *)i + 1)
      {
        if (*(_QWORD *)v123 != v100)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i);
        v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
        v15 = v14;
        v16 = UIActivityTypeMessage;
        if (v14 == CFSTR("com.apple.MobileSMS"))
          goto LABEL_11;
        if (!v14)
          goto LABEL_29;
        v17 = -[__CFString isEqual:](v14, "isEqual:", CFSTR("com.apple.MobileSMS"));

        v16 = UIActivityTypeMessage;
        if ((v17 & 1) != 0
          || (v18 = v15, v16 = UIActivityTypeMail, v18 == CFSTR("com.apple.mobilemail"))
          || (v19 = v18,
              v20 = -[__CFString isEqual:](v18, "isEqual:", CFSTR("com.apple.mobilemail")),
              v19,
              v16 = UIActivityTypeMail,
              v20))
        {
LABEL_11:
          v21 = objc_msgSend(v99, "containsObject:", v16);
        }
        else
        {
          v23 = v19;
          v24 = v23;
          if (v23 == CFSTR("com.apple.InCallService.ShareExtension")
            || (v25 = -[__CFString isEqual:](v23, "isEqual:", CFSTR("com.apple.InCallService.ShareExtension")), v24, v25))
          {
            if (!objc_msgSend(v105, "isCollaborative"))
            {
LABEL_13:
              v22 = 0;
              goto LABEL_51;
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "hiddenActivities"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("activityType")));

            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v28 = v27;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v119;
              while (2)
              {
                for (j = 0; j != v29; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v119 != v30)
                    objc_enumerationMutation(v28);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j), "hasPrefix:", v24) & 1) != 0)
                  {

                    goto LABEL_39;
                  }
                }
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
                if (v29)
                  continue;
                break;
              }
            }
            goto LABEL_25;
          }
          v32 = v24;
          if (v32 != CFSTR("com.apple.telephonyutilities.callservicesd"))
          {
            v33 = v32;
            v34 = -[__CFString isEqual:](v32, "isEqual:", CFSTR("com.apple.telephonyutilities.callservicesd"));

            if (!v34)
            {
LABEL_29:
              v116 = 0u;
              v117 = 0u;
              v115 = 0u;
              v114 = 0u;
              v28 = v99;
              v35 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
              if (v35)
              {
                v36 = *(_QWORD *)v115;
                while (2)
                {
                  for (k = 0; k != v35; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v115 != v36)
                      objc_enumerationMutation(v28);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)k), "hasPrefix:", v15) & 1) != 0)
                    {
LABEL_39:

                      goto LABEL_40;
                    }
                  }
                  v35 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
                  if (v35)
                    continue;
                  break;
                }
              }
              v22 = 0;
              goto LABEL_50;
            }
          }
          v21 = objc_msgSend(v105, "isSharePlayAvailable");
        }
        if ((v21 & 1) == 0)
          goto LABEL_13;
LABEL_40:
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "bundleIDToActivities"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v15));

        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v28 = v39;
        v40 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
        if (!v40)
        {
LABEL_48:
          v22 = 1;
          goto LABEL_49;
        }
        v41 = *(_QWORD *)v111;
LABEL_42:
        v42 = 0;
        while (1)
        {
          if (*(_QWORD *)v111 != v41)
            objc_enumerationMutation(v28);
          if ((objc_msgSend(v9, "activityIsHidden:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v42)) & 1) != 0)
            break;
          if (v40 == (id)++v42)
          {
            v40 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
            if (v40)
              goto LABEL_42;
            goto LABEL_48;
          }
        }
LABEL_25:
        v22 = 0;
LABEL_49:

LABEL_50:
LABEL_51:
        v43 = v15;
        v44 = CFSTR("SDSuggestionTransportIdentifierPlaceholder");
        v45 = v44;
        v104 = v43;
        if (v43 == v44)
        {

          v46 = 1;
        }
        else
        {
          if ((v43 == 0) == (CFSTR("SDSuggestionTransportIdentifierPlaceholder") != 0))
            v46 = 0;
          else
            v46 = -[__CFString isEqual:](v43, "isEqual:", v44);

          if (((v22 | v46) & 1) == 0)
          {
            v82 = share_sheet_log();
            v48 = objc_claimAutoreleasedReturnValue(v82);
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              goto LABEL_78;
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v13;
            v80 = v48;
            v81 = "Rejecting people row proxy %@ due to not visible activity type";
            goto LABEL_70;
          }
        }
        v47 = -[NSMutableArray count](v103, "count");
        if (v47 >= (id)+[SDStatusMonitor shareSheetMaxSuggestions](SDStatusMonitor, "shareSheetMaxSuggestions"))
        {
          v79 = share_sheet_log();
          v48 = objc_claimAutoreleasedReturnValue(v79);
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            goto LABEL_78;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          v80 = v48;
          v81 = "Rejecting people row proxy %@ because we are over the max number of suggestions";
LABEL_70:
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, v81, buf, 0xCu);
          goto LABEL_78;
        }
        v48 = objc_alloc_init((Class)SFAirDropNode);
        -[NSObject setTransportBundleID:](v48, "setTransportBundleID:", v43);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
        -[NSObject setDisplayName:](v48, "setDisplayName:", v49);

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        -[NSObject setRealName:](v48, "setRealName:", v50);

        -[NSObject setSuggestion:](v48, "setSuggestion:", 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "indexOfObject:", v13)));
        -[NSObject setSuggestionIndex:](v48, "setSuggestionIndex:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formattedHandles"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v52));
        -[NSObject setFormattedHandles:](v48, "setFormattedHandles:", v53);

        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actualHandles"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v54));
        -[NSObject setActualHandles:](v48, "setActualHandles:", v55);

        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contactIDs"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v56));
        -[NSObject setContactIDs:](v48, "setContactIDs:", v57);

        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "derivedIntentIdentifier"));
        -[NSObject setDerivedIntentIdentifier:](v48, "setDerivedIntentIdentifier:", v58);

        -[NSMutableArray addObject:](v103, "addObject:", v48);
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "realNameToNodeID"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject realName](v48, "realName"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v60));

        if (!v61)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "realNameToNodeID"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject realName](v48, "realName"));
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, v63);

        }
        -[NSObject setNodeIdentifier:](v48, "setNodeIdentifier:", v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIAirDropNode nodeWithIdentifier:suggestionNode:](UIAirDropNode, "nodeWithIdentifier:suggestionNode:", v61, v13));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "hostConfiguration"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "hostLocale"));

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "hostConfiguration"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v66));

        if ((objc_msgSend(v105, "skipSlotsRendering") & 1) != 0
          || (v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "hostConfiguration")),
              v68 = objc_msgSend(v67, "requestPeopleSuggestionsData"),
              v67,
              v68))
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "suggestion"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "createPeopleSuggestion"));
          objc_msgSend(v64, "setPeopleSuggestion:", v70);

        }
        if ((objc_msgSend(v105, "skipSlotsRendering") | v46) == 1)
        {
          v71 = (SDShareSheetLoadingConfiguration *)objc_claimAutoreleasedReturnValue(-[NSObject displayNameForLocale:](v48, "displayNameForLocale:", v101));
          v72 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithText:", v71);
          objc_msgSend(v64, "setDisplayName:", v72);

          if (objc_msgSend(v13, "hasGroupImage"))
          {
            v74 = SFLocalizedStringForKey(CFSTR("GROUP_PARTICIPANTS_LABEL"), v73);
            v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject formattedHandles](v48, "formattedHandles"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, objc_msgSend(v76, "count")));

            v78 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithText:", v77);
            objc_msgSend(v64, "setSubtitle:", v78);

          }
        }
        else
        {
          v83 = objc_alloc_init(SDShareSheetLoadingConfiguration);
          -[SDShareSheetLoadingConfiguration setTextColor:](v83, "setTextColor:", v97);
          -[SDShareSheetLoadingConfiguration setHostLocale:](v83, "setHostLocale:", v101);
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "xpcHelperCnx"));
          -[SDShareSheetLoadingConfiguration setHelperConnection:](v83, "setHelperConnection:", v84);

          -[SDShareSheetLoadingConfiguration setInstantShareSheet:](v83, "setInstantShareSheet:", objc_msgSend(v105, "skipSlotsRendering"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "hostConfiguration"));
          -[SDShareSheetLoadingConfiguration setHostConfiguration:](v83, "setHostConfiguration:", v85);

          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, val);
          v106[0] = _NSConcreteStackBlock;
          v106[1] = 3221225472;
          v106[2] = sub_10015CD0C;
          v106[3] = &unk_100718E60;
          objc_copyWeak(&v109, (id *)buf);
          v107 = v48;
          v71 = v83;
          v108 = v71;
          objc_msgSend(v64, "setLoadHandler:", v106);

          objc_destroyWeak(&v109);
          objc_destroyWeak((id *)buf);
        }

        if (objc_msgSend(v13, "isIntentsBased"))
          v86 = objc_msgSend(v13, "isGroup") ^ 1;
        else
          v86 = 0;
        objc_msgSend(v64, "setHasSquareImage:", v86);
        objc_msgSend(v64, "setIsDisabled:", -[NSObject isDisabled](v48, "isDisabled"));
        -[NSMutableArray addObject:](v96, "addObject:", v64);
        v87 = share_sheet_log();
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v13;
          v127 = 2112;
          v128 = v61;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Share Sheet accepted people suggestion:%@ for identifier:%@", buf, 0x16u);
        }

LABEL_78:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
    }
    while (v11);
  }

  v89 = -[NSMutableArray count](v96, "count");
  if (v89 && IsAppleInternalBuild(v89, v90))
  {
    v91 = share_sheet_log();
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "adding tap-to-radar airdrop node to people suggestions.", buf, 2u);
    }

    v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIAirDropNode TTRAirDropNode](UIAirDropNode, "TTRAirDropNode"));
    -[NSMutableArray addObject:](v96, "addObject:", v93);

  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "peopleNodes"));
  -[SDShareSheetSlotManager _clearSlotsForAirDropProxies:](val, "_clearSlotsForAirDropProxies:", v94);
  objc_msgSend(v105, "setSuggestedPeople:", v103);
  objc_msgSend(v105, "setPeopleNodes:", v96);
  +[CATransaction flush](CATransaction, "flush");

  objc_sync_exit(val);
}

- (void)_clearSlotsForAirDropProxies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SDShareSheetSlotManager *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];

  v4 = a3;
  v22 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](self, "shareSheetContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10);
        v12 = share_sheet_log();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Deleting slots for people row proxy %@", buf, 0xCu);
        }

        v14 = objc_msgSend(v11, "avatarImageSlotID");
        v15 = objc_msgSend(v11, "mainLabelSlotID");
        v16 = objc_msgSend(v11, "transportImageSlotID");
        v17 = objc_msgSend(v11, "bottomLabelSlotID");
        if ((_DWORD)v14)
          objc_msgSend(v5, "deleteSlot:", v14);
        if ((_DWORD)v15)
        {
          objc_msgSend(v5, "deleteSlot:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15));
          objc_msgSend(v6, "addObject:", v18);

        }
        if ((_DWORD)v16)
        {
          objc_msgSend(v5, "deleteSlot:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16));
          objc_msgSend(v6, "addObject:", v19);

        }
        if ((_DWORD)v17)
        {
          objc_msgSend(v5, "deleteSlot:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
          objc_msgSend(v6, "addObject:", v20);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v22, "accessibilityCache"));
  objc_msgSend(v21, "removeLabelsForSlotIDs:", v6);

}

- (void)handleAirDropNodesChanged:(id)a3 sessionID:(id)a4
{
  id v6;
  SDShareSheetSlotManager *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  SDShareSheetSlotManager *v49;
  id v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  NSObject *v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v50 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v48 = v6;
  v49 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v9 = v8;
  if (!v8)
  {
    v24 = share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_100161ED4();
    goto LABEL_49;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "airDropPeople"));
  v11 = objc_msgSend(v10, "count");
  v12 = objc_msgSend(v50, "count");

  if (v11 != v12)
    -[SDShareSheetSlotManager updateNearbyCountSlotIDForSession:](v7, "updateNearbyCountSlotIDForSession:", v9);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v50;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v57;
    v15 = 1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "realNameToNodeID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "realName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));
        objc_msgSend(v17, "setNodeIdentifier:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "realName"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedNode"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "realName"));
        LOBYTE(v19) = objc_msgSend(v21, "isEqualToString:", v23);

        v15 &= v19 ^ 1;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v13);

    if ((v15 & 1) == 0)
      goto LABEL_17;
  }
  else
  {

  }
  objc_msgSend(v9, "setSelectedNode:", 0);
LABEL_17:
  objc_msgSend(v9, "setAirDropPeople:", obj);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedNode"));
  if (v26)
    v25 = 0;
  else
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v27 = obj;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedNode"));
        v33 = v32 == 0;

        if (v33)
        {
          v34 = v31;

          v25 = v34;
        }
        else if (objc_msgSend(v31, "selectionReason"))
        {
          v35 = v31;

          v25 = v35;
          goto LABEL_31;
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v28);
  }
LABEL_31:

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peopleNodes"));
  if (objc_msgSend(v36, "count"))
    v37 = objc_msgSend(v9, "sentInitialConfiguration");
  else
    v37 = 0;

  if (v25
    && (v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject nodeIdentifier](v25, "nodeIdentifier")),
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedNode")),
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "nodeIdentifier")),
        v41 = objc_msgSend(v38, "isEqual:", v40),
        v40,
        v39,
        v38,
        (v41 & 1) == 0))
  {
    v44 = share_sheet_log();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v25;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "people row AirDrop slot changing to %@", buf, 0xCu);
    }

    if (!-[NSObject selectionReason](v25, "selectionReason"))
      -[NSObject setSelectionReason:](v25, "setSelectionReason:", 2);
    objc_msgSend(v9, "setSelectedNode:", v25);
    -[SDShareSheetSlotManager createAirDropProxyForNode:session:](v49, "createAirDropProxyForNode:session:", v25, v9);
  }
  else
  {
    if (objc_msgSend(v27, "count"))
      goto LABEL_49;
    v42 = share_sheet_log();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "no AirDrop nodes discovered", buf, 2u);
    }

    objc_msgSend(v9, "setAirDropNodes:", &__NSArray0__struct);
    objc_msgSend(v9, "setSelectedNode:", 0);
  }
  if (v37)
  {
    v46 = share_sheet_log();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "AirDrop suggestion node did change", buf, 2u);
    }

    -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](v49, "dataSourceDidUpdateForSession:animated:", v9, 1);
  }
LABEL_49:

  objc_sync_exit(v49);
}

- (void)browser:(id)a3 didUpdatePeople:(id)a4 deletedContactIdentifiers:(id)a5
{
  id v8;
  SDShareSheetSlotManager *v9;
  NSMutableDictionary *sessionIDToShareSheetSession;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  _BOOL4 v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  void *v50;
  SDShareSheetSlotManager *obj;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  NSObject *v60;

  v8 = a3;
  v52 = a4;
  v53 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v50 = v8;
  obj = v9;
  sessionIDToShareSheetSession = v9->_sessionIDToShareSheetSession;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessionIDToShareSheetSession, "objectForKeyedSubscript:", v11));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "airDropPeople"));
    v14 = objc_msgSend(v13, "count");
    v15 = objc_msgSend(v52, "count");

    if (v14 != v15)
      -[SDShareSheetSlotManager updateNearbyCountSlotIDForSession:](v9, "updateNearbyCountSlotIDForSession:", v12);
    objc_msgSend(v12, "setAirDropPeople:", v52);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedNode"));
    if (v16)
      v17 = 0;
    else
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "firstObject"));

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v20 = v52;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedNode"));
          v26 = v25 == 0;

          if (v26)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rangingMeasurement"));
            objc_msgSend(v30, "ptsScore");
            v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject rangingMeasurement](v17, "rangingMeasurement"));
            objc_msgSend(v33, "ptsScore");
            v35 = v32 > v34;

            if (v35)
            {
              v36 = v24;

              v17 = v36;
            }
          }
          else if (objc_msgSend(v24, "selectionReason")
                 || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedNode")),
                     v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contactIdentifier")),
                     v29 = objc_msgSend(v53, "containsObject:", v28),
                     v28,
                     v27,
                     (v29 & 1) != 0))
          {
            v37 = v24;

            v17 = v37;
            goto LABEL_24;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_24:

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peopleNodes"));
    if (objc_msgSend(v38, "count"))
      v39 = objc_msgSend(v12, "sentInitialConfiguration");
    else
      v39 = 0;

    if (v17
      && (v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject nodeIdentifier](v17, "nodeIdentifier")),
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedNode")),
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "nodeIdentifier")),
          v43 = objc_msgSend(v40, "isEqual:", v42),
          v42,
          v41,
          v40,
          (v43 & 1) == 0))
    {
      v46 = share_sheet_log();
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v17;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "people row AirDrop slot changing to %@", buf, 0xCu);
      }

      if (!-[NSObject selectionReason](v17, "selectionReason"))
        -[NSObject setSelectionReason:](v17, "setSelectionReason:", 2);
      objc_msgSend(v12, "setSelectedNode:", v17);
      -[SDShareSheetSlotManager createAirDropProxyForNode:session:](obj, "createAirDropProxyForNode:session:", v17, v12);
    }
    else
    {
      if (objc_msgSend(v20, "count"))
        goto LABEL_42;
      v44 = share_sheet_log();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "no AirDrop nodes discovered", buf, 2u);
      }

      objc_msgSend(v12, "setAirDropNodes:", &__NSArray0__struct);
      objc_msgSend(v12, "setSelectedNode:", 0);
    }
    if (v39)
    {
      v48 = share_sheet_log();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "AirDrop suggestion node did change", buf, 2u);
      }

      -[SDShareSheetSlotManager dataSourceDidUpdateForSession:animated:](obj, "dataSourceDidUpdateForSession:animated:", v12, 1);
    }
  }
  else
  {
    v18 = share_sheet_log();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));
      sub_100161F34(v19, (uint64_t)buf, v17);
    }
  }
LABEL_42:

  objc_sync_exit(obj);
}

- (void)createAirDropProxyForNode:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  NSBundle *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (!v6)
    goto LABEL_17;
  v10 = SFLocalizedStringForKey(CFSTR("AirDrop"), v9);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostLocale"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayNameForLocale:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "realNameToNodeID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "realName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "realNameToNodeID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "realName"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

  }
  objc_msgSend(v6, "setNodeIdentifier:", v15);
  if (!objc_msgSend(v7, "skipSlotsRendering"))
  {
    v29 = objc_msgSend(v6, "displayIcon");
    v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UIActivity, v30));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("AirDropBadge"), v32));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_applicationIconImageForFormat:precomposed:", 5, 0));

    v35 = objc_retainAutorelease(v34);
    v36 = objc_msgSend(v35, "CGImage");
    +[CATransaction begin](CATransaction, "begin");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostConfiguration"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSession labelColorWithHostConfiguration:](SDShareSheetSession, "labelColorWithHostConfiguration:", v37));
    v51 = v35;

    v38 = objc_msgSend(v6, "isClassroom");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcHelperCnx"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostConfiguration"));
    -[SDShareSheetSlotManager _createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:](v8, "_createNameLabelSlotWithString:textColor:maximumNumberOfLines:isAirDrop:ignoreNameWrapping:sessionConnection:hostConfig:", v55, v53, 2, 0, v38, v39, v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v8, "shareSheetContext"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (v29)
    {
      v52 = -[SDShareSheetSlotManager createSlotForContext:](v8, "createSlotForContext:", v41);
      objc_msgSend(v41, "setObject:forSlot:", v29, v52);
      if (v36)
        goto LABEL_8;
    }
    else
    {
      v52 = 0;
      if (v36)
      {
LABEL_8:
        v43 = (id)-[SDShareSheetSlotManager createSlotForContext:](v8, "createSlotForContext:", v41);
        objc_msgSend(v41, "setObject:forSlot:", v36, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v43));
        objc_msgSend(v42, "setObject:forKey:", v54, v44);

        if (!v56)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    v43 = 0;
    if (!v56)
    {
LABEL_13:
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v8, "accessibilityCache"));
      objc_msgSend(v47, "addEntriesFromDictionary:", v42);

      +[CATransaction commit](CATransaction, "commit");
      v48 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithSlotIdentifier:", v56);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAirDropNode nodeWithIdentifier:displayName:subtitle:avatarImageSlotID:transportImageSlotID:](UIAirDropNode, "nodeWithIdentifier:displayName:subtitle:avatarImageSlotID:transportImageSlotID:", v15, v48, 0, v52, v43));

      goto LABEL_14;
    }
LABEL_12:
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v56));
    objc_msgSend(v42, "setObject:forKey:", v45, v46);

    goto LABEL_13;
  }
  v18 = objc_alloc((Class)SFPeopleSuggestion);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transportBundleID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contact"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));
  v24 = objc_msgSend(v18, "initWithIdentifier:displayName:transportBundleIdentifier:contact:deviceModelIdentifier:", v19, v20, v21, v22, v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAirDropNode nodeWithIdentifier:peopleSuggestion:](UIAirDropNode, "nodeWithIdentifier:peopleSuggestion:", v15, v24));
  v26 = objc_alloc((Class)SFProxyText);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v28 = objc_msgSend(v26, "initWithText:", v27);
  objc_msgSend(v25, "setDisplayName:", v28);

LABEL_14:
  objc_msgSend(v25, "setIsDisabled:", objc_msgSend(v6, "isDisabled"));
  objc_msgSend(v25, "setHasSquareImage:", objc_msgSend(v6, "isClassroom"));
  if (GestaltGetBoolean(CFSTR("R1Capability"), 0, 0))
    objc_msgSend(v25, "setSelectionReason:", objc_msgSend(v6, "selectionReason"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "airDropNodes"));
  -[SDShareSheetSlotManager _clearSlotsForAirDropProxies:](v8, "_clearSlotsForAirDropProxies:", v49);
  v57 = v25;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
  objc_msgSend(v7, "setAirDropNodes:", v50);

  +[CATransaction flush](CATransaction, "flush");
LABEL_17:
  objc_sync_exit(v8);

}

- (id)_createActivityTitlePerspectiveDataForActivity:(id)a3 foregroundColor:(id)a4 sessionConnection:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;

  v7 = a3;
  v8 = a4;
  v10 = a5;
  if (!v10)
  {
    v13 = share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_1001611D8();
    goto LABEL_11;
  }
  v11 = objc_opt_class(SUIHostActivityProxy, v9);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) == 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityTitle"));
    if (v14)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "perspectiveDataForUIActivityTitle:textColor:", v14, v8));
LABEL_12:

      goto LABEL_13;
    }
    v15 = share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100161204();

LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)_createNameLabelPerspectiveDataForString:(id)a3 textColor:(id)a4 maximumNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 sessionConnection:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = v15;
  if (!v15)
  {
    v18 = share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_1001611D8();

    goto LABEL_7;
  }
  if (!v13)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "perspectiveDataForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNameWrapping:", v13, v14, a5, v10, v9));
LABEL_8:

  return v17;
}

- ($EC76EA2E339756B4D2C49A1061DE0928)_createNameLabelSlotWithString:(SEL)a3 textColor:(id)a4 maximumNumberOfLines:(id)a5 isAirDrop:(unint64_t)a6 ignoreNameWrapping:(BOOL)a7 sessionConnection:(BOOL)a8 hostConfig:(id)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  $EC76EA2E339756B4D2C49A1061DE0928 *result;
  const char *v28;
  const char *v29;
  unsigned int v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  unint64_t v36;
  BOOL v37;
  BOOL v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  unint64_t v43;
  BOOL v44;
  BOOL v45;
  _BYTE buf[28];
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;

  v11 = a8;
  v12 = a7;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  retstr->var1.width = 0.0;
  retstr->var1.height = 0.0;
  *(_QWORD *)&retstr->var0 = 0;
  if (v19)
  {
    v30 = objc_msgSend(v17, "length");
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10015E5A0;
    v39[3] = &unk_100718E88;
    v40 = v19;
    v31 = v17;
    v41 = v17;
    v42 = v18;
    v43 = a6;
    v44 = v12;
    v45 = v11;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10015E5B8;
    v32[3] = &unk_100718EB0;
    v33 = v40;
    v21 = v41;
    v34 = v21;
    v22 = v42;
    v35 = v22;
    v36 = a6;
    v37 = v12;
    v38 = v11;
    -[SDShareSheetSlotManager _uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:](self, "_uploadSlotWithVectorData:cgImage:performCATransaction:hostConfiguration:", v39, v32, 0, v20);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
    retstr->var1.height = *(CGFloat *)&buf[16];
    if (!retstr->var0)
    {
      v23 = share_sheet_log();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413570;
        v28 = "no";
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        if (v12)
          v29 = "yes";
        else
          v29 = "no";
        *(_DWORD *)&buf[14] = v30;
        *(_WORD *)&buf[18] = 2112;
        if (v11)
          v28 = "yes";
        *(_QWORD *)&buf[20] = v22;
        v47 = 1024;
        v48 = a6;
        v49 = 2080;
        v50 = v29;
        v51 = 2080;
        v52 = v28;
        _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "returned nil: CGImgForNameLabelWithString:'%@', length: %i, textColor:%@, maxNumberOfLines: %i, isAirDrop: %s, ignoreNameWrapping: %s", buf, 0x36u);
      }

    }
    v25 = v40;
    v17 = v31;
  }
  else
  {
    v26 = share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_100161F80();
  }

  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _BYTE buf[12];
  __int16 v24;
  const char *v25;

  v6 = a3;
  v7 = a4;
  v8 = -[SDShareSheetSlotManager shouldAcceptNewConnection:](self, "shouldAcceptNewConnection:", v7);
  v9 = daemon_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sd_description"));
    v12 = (void *)v11;
    v13 = "no";
    if (v8)
      v13 = "yes";
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    v24 = 2080;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New connection from %@ accepted %s", buf, 0x16u);

  }
  if (v8)
  {
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setExportedObject:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager exportedInterface](self, "exportedInterface"));
    objc_msgSend(v7, "setExportedInterface:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager remoteObjectInterface](self, "remoteObjectInterface"));
    objc_msgSend(v7, "setRemoteObjectInterface:", v15);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    location = 0;
    objc_initWeak(&location, v7);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10015E88C;
    v19[3] = &unk_100718ED8;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v19);
    objc_msgSend(v7, "resume");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager activeConnections](self, "activeConnections"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v16));

    objc_msgSend(v17, "addObject:", v7);
    -[SDShareSheetSlotManager setActiveConnections:](self, "setActiveConnections:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7;

  v7 = a4;
  -[SDShareSheetSlotManager setCurrentConnection:](self, "setCurrentConnection:", a3);
  objc_msgSend(v7, "invoke");

}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager currentConnection](self, "currentConnection"));
  v5 = daemon_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New connection established to %@", (uint8_t *)&v8, 0xCu);

  }
  -[SDShareSheetSlotManager connectionEstablished:](self, "connectionEstablished:", v4);

}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.sharesheet");
}

- (id)exportedInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSSet *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SDShareSheetSlotManagerProtocol));
  v4 = objc_opt_class(NSURL, v3);
  v6 = objc_opt_class(NSDictionary, v5);
  v8 = objc_opt_class(NSString, v7);
  v10 = objc_opt_class(NSNumber, v9);
  v12 = objc_opt_class(NSArray, v11);
  v14 = objc_opt_class(_UIActivityDiscoveryContext, v13);
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v6, v8, v10, v12, v14, objc_opt_class(NSData, v15), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, "connectToDaemonWithContext:completionHandler:", 0, 0);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v18), "connectUIServiceToDaemonWithSessionID:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(UISDShareSheetSessionConfiguration, v19), "sendConfiguration:completion:", 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(UISDShareSheetSessionConfiguration, v20), "requestConfigurationWithSessionID:completion:", 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v21), "activityViewControllerWithSessionID:selectedPersonWithIdentifier:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSUUID, v22), "activityViewControllerWithSessionID:selectedPersonWithIdentifier:", 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v23), "activityViewControllerWithSessionID:removedPersonWithIdentifier:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSUUID, v24), "activityViewControllerWithSessionID:removedPersonWithIdentifier:", 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v25), "activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSUUID, v26), "activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:", 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v27), "activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v28), "activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:", 1, 0);
  v30 = objc_opt_class(NSArray, v29);
  v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(_UIUserDefaultsActivityProxy, v31), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v33, "activityViewControllerWithSessionID:updatedFavoritesProxies:activityCategory:", 1, 0);

  v35 = objc_opt_class(NSArray, v34);
  v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, objc_opt_class(SFShareSheetRemoteActivity, v36), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, "activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:", 0, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFCollaborationCloudSharingRequest, v39), "createSharingURLForCollaborationRequest:completionHandler:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFCollaborationCloudSharingResult, v40), "createSharingURLForCollaborationRequest:completionHandler:", 0, 1);
  return v2;
}

- (id)remoteObjectInterface
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSSet *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSSet *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSSet *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSSet *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSSet *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFShareSheetSlotObserverProtocol));
  v95 = objc_opt_class(NSMutableArray, v2);
  v92 = objc_opt_class(NSArray, v3);
  v90 = objc_opt_class(NSMutableDictionary, v4);
  v88 = objc_opt_class(NSDictionary, v5);
  v86 = objc_opt_class(NSMutableString, v6);
  v84 = objc_opt_class(NSString, v7);
  v83 = objc_opt_class(NSNumber, v8);
  v82 = objc_opt_class(NSValue, v9);
  v11 = objc_opt_class(NSUUID, v10);
  v13 = objc_opt_class(NSDate, v12);
  v15 = objc_opt_class(NSURL, v14);
  v17 = objc_opt_class(NSNull, v16);
  v19 = objc_opt_class(NSMutableData, v18);
  v21 = objc_opt_class(NSData, v20);
  v23 = objc_opt_class(UIImage, v22);
  v25 = objc_opt_class(UISUIActivityExtensionItemDataRequest, v24);
  v27 = objc_opt_class(UISDActivityItemData, v26);
  v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v95, v92, v90, v88, v86, v84, v83, v82, v11, v13, v15, v17, v19, v21, v23, v25, v27,
          objc_opt_class(NSError, v28),
          0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v30, "willPerformInServiceActivityWithRequest:completion:", 0, 1);

  v96 = objc_opt_class(NSMutableArray, v31);
  v93 = objc_opt_class(NSArray, v32);
  v91 = objc_opt_class(NSMutableDictionary, v33);
  v89 = objc_opt_class(NSDictionary, v34);
  v87 = objc_opt_class(NSMutableString, v35);
  v85 = objc_opt_class(NSString, v36);
  v38 = objc_opt_class(NSNumber, v37);
  v40 = objc_opt_class(NSValue, v39);
  v42 = objc_opt_class(NSUUID, v41);
  v44 = objc_opt_class(NSDate, v43);
  v46 = objc_opt_class(NSURL, v45);
  v48 = objc_opt_class(NSNull, v47);
  v50 = objc_opt_class(NSMutableData, v49);
  v52 = objc_opt_class(NSData, v51);
  v54 = objc_opt_class(UIImage, v53);
  v56 = objc_opt_class(UISUIActivityExtensionItemDataRequest, v55);
  v58 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v96, v93, v91, v89, v87, v85, v38, v40, v42, v44, v46, v48, v50, v52, v54, v56, objc_opt_class(UISDActivityItemData, v57),
          0);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v59, "didPerformInServiceActivityWithIdentifier:completed:items:error:", 1, 0);

  v61 = objc_opt_class(NSNumber, v60);
  v63 = objc_opt_class(_UIUserDefaultsActivityProxy, v62);
  v65 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v61, v63, objc_opt_class(NSArray, v64), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v66, "performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:", 0, 0);

  v68 = objc_opt_class(NSNumber, v67);
  v70 = objc_opt_class(_UIUserDefaultsActivityProxy, v69);
  v72 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v68, v70, objc_opt_class(NSArray, v71), 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v73, "performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:", 1, 0);

  v75 = objc_opt_class(NSUUID, v74);
  v77 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v75, objc_opt_class(NSArray, v76), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v78, "performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:", 2, 0);

  objc_msgSend(v94, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFAirDropTransferChange, v79), "didUpdateAirDropTransferWithChange:", 0, 0);
  objc_msgSend(v94, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(UISDShareSheetSessionConfiguration, v80), "dataSourceUpdatedWithSessionConfiguration:", 0, 0);
  return v94;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sd_description"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New connection established %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)connectionInvalidated:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;

  v4 = a3;
  v5 = daemon_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    *(_DWORD *)buf = 138412290;
    v55 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection %@ invalidated", buf, 0xCu);

  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager activeConnections](v8, "activeConnections"));
  v42 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v42, "removeObject:", v4);
  -[SDShareSheetSlotManager setActiveConnections:](v8, "setActiveConnections:", v42);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v8->_sessionIDToShareSheetSession, "allValues"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "connection"));
        v16 = v15 == v4;

        if (v16)
        {
          v11 = v14;
          v17 = daemon_log(v11);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v11;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Session matched to connection %@", buf, 0xCu);
          }

          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_15:

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager shareSheetContext](v8, "shareSheetContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10015F918;
  v46[3] = &unk_100718F00;
  v21 = v19;
  v47 = v21;
  v22 = v20;
  v48 = v22;
  v23 = objc_retainBlock(v46);
  +[CATransaction begin](CATransaction, "begin");
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostShareActivityProxies"));
  ((void (*)(_QWORD *, uint64_t))v23[2])(v23, v24);
  v40 = (void *)v24;
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostActionActivityProxies"));
  ((void (*)(_QWORD *, uint64_t))v23[2])(v23, v25);
  v38 = v25;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10015FAD8;
  v43[3] = &unk_100718F00;
  v41 = v21;
  v44 = v41;
  v26 = v22;
  v45 = v26;
  v27 = objc_retainBlock(v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "airDropNodes"));
  ((void (*)(_QWORD *, void *))v27[2])(v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peopleNodes"));
  ((void (*)(_QWORD *, void *))v27[2])(v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](v8, "accessibilityCache"));
  objc_msgSend(v30, "removeLabelsForSlotIDs:", v26);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyCountSlotID"));
  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyCountSlotID", v38));
    objc_msgSend(v41, "deleteSlot:", objc_msgSend(v32, "unsignedIntValue"));

  }
  if ((objc_msgSend(v11, "engagedWithSheet", v38) & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionBrowser"));
    v34 = v33 == 0;

    if (!v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionBrowser"));
      objc_msgSend(v35, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", 0, 0, 0, 1);

    }
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peopleBrowser"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sessionID"));

  objc_msgSend(v11, "invalidate");
  if (v37)
    -[NSMutableDictionary removeObjectForKey:](v8->_sessionIDToShareSheetSession, "removeObjectForKey:", v37);
  if (!-[NSMutableDictionary count](v8->_sessionIDToShareSheetSession, "count"))
    -[SDShareSheetSlotManager invalidateShareSheetContext](v8, "invalidateShareSheetContext");
  +[CATransaction commit](CATransaction, "commit");
  +[CATransaction flush](CATransaction, "flush");

  objc_sync_exit(v8);
}

- (id)accessibilityStringForSlotID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSlotManager accessibilityCache](self, "accessibilityCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "labelForSlotID:", v5));

  v7 = share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning accessibility label %@ for slotID %u", (uint8_t *)&v10, 0x12u);
  }

  return v6;
}

- (id)recipientHandlesForSessionID:(id)a3
{
  id v4;
  SDShareSheetSlotManager *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *j;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  id v45;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v29 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v4));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedRecipient"));
  if (v30)
  {
    v7 = objc_msgSend(objc_alloc((Class)SFShareSheetRecipient), "initWithNode:", v30);
    v45 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));

    objc_msgSend(v6, "setSelectedRecipient:", 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipients"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = objc_alloc_init((Class)NSMutableArray);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipients"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v12);
            v16 = objc_msgSend(objc_alloc((Class)SFShareSheetRecipient), "initWithPerson:handleValidationBlock:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), &stru_100718F40);
            objc_msgSend(v11, "addObject:", v16);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v13);
      }

      v17 = objc_msgSend(v11, "copy");
    }
    else
    {
      v11 = objc_alloc_init((Class)NSMutableArray);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transferNodes"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allValues"));

      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v19);
            v23 = objc_msgSend(objc_alloc((Class)SFShareSheetRecipient), "initWithNode:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j));
            objc_msgSend(v11, "addObject:", v23);

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        }
        while (v20);
      }

      v17 = objc_msgSend(v11, "copy");
    }
    v8 = v17;

  }
  objc_sync_exit(v5);

  if (IsAppleInternalBuild(v24, v25))
  {
    v26 = share_sheet_log();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v8;
      v41 = 2112;
      v42 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Returning recipients %@ for session ID %@", buf, 0x16u);
    }

  }
  return v8;
}

- (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  SDShareSheetSlotManager *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_sessionIDToShareSheetSession, "objectForKeyedSubscript:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedRecipient"));

  if (v10)
  {
    v11 = objc_alloc((Class)SFShareSheetRecipient);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedRecipient"));
    v13 = objc_msgSend(v11, "initWithNode:", v12);

LABEL_3:
    objc_msgSend(v9, "setSelectedRecipient:", 0);
    v14 = 1;
    goto LABEL_6;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recipients"));
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    v13 = 0;
    goto LABEL_3;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recipients"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connection"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_queue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100160480;
  v24[3] = &unk_100718F68;
  v25 = v6;
  v26 = v7;
  sub_100195F9C(v17, v19, v24);

  v13 = 0;
  v14 = 0;
LABEL_6:

  objc_sync_exit(v8);
  if (v14)
  {
    if (IsAppleInternalBuild(v20, v21))
    {
      v22 = share_sheet_log();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v13;
        v29 = 2112;
        v30 = v6;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Returning Messages recipient %@ for session ID %@", buf, 0x16u);
      }

    }
    (*((void (**)(id, id))v7 + 2))(v7, v13);
  }

}

- (BOOL)wantsToBlockPresentation
{
  return 0;
}

- (NSMutableDictionary)personToImageSlot
{
  return self->_personToImageSlot;
}

- (void)setPersonToImageSlot:(id)a3
{
  objc_storeStrong((id *)&self->_personToImageSlot, a3);
}

- (NSMutableDictionary)personToLabelSlot
{
  return self->_personToLabelSlot;
}

- (void)setPersonToLabelSlot:(id)a3
{
  objc_storeStrong((id *)&self->_personToLabelSlot, a3);
}

- (NSMutableDictionary)bundleIDToSmallImageSlot
{
  return self->_bundleIDToSmallImageSlot;
}

- (void)setBundleIDToSmallImageSlot:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDToSmallImageSlot, a3);
}

- (NSMutableDictionary)activityTypeToLargeImageSlot
{
  return self->_activityTypeToLargeImageSlot;
}

- (void)setActivityTypeToLargeImageSlot:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeToLargeImageSlot, a3);
}

- (NSMutableDictionary)activityTypeToLabelSlot
{
  return self->_activityTypeToLabelSlot;
}

- (void)setActivityTypeToLabelSlot:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeToLabelSlot, a3);
}

- (NSMutableDictionary)sessionIDToShareSheetSession
{
  return self->_sessionIDToShareSheetSession;
}

- (void)setSessionIDToShareSheetSession:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIDToShareSheetSession, a3);
}

- (_UIActivityUserDefaults)shareUserDefaults
{
  return self->_shareUserDefaults;
}

- (void)setShareUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_shareUserDefaults, a3);
}

- (_UIActivityUserDefaults)actionUserDefaults
{
  return self->_actionUserDefaults;
}

- (void)setActionUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserDefaults, a3);
}

- (NSCache)slotIDToLabel
{
  return self->_slotIDToLabel;
}

- (NSXPCConnection)_currentConnection
{
  return self->__currentConnection;
}

- (void)set_currentConnection:(id)a3
{
  objc_storeStrong((id *)&self->__currentConnection, a3);
}

- (NSSet)_activeConnections
{
  return self->__activeConnections;
}

- (void)set_activeConnections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (SDShareSheetAccessibilityCache)accessibilityCache
{
  return (SDShareSheetAccessibilityCache *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccessibilityCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)sharingPolicyWantsToBlockShareSheet
{
  return self->_sharingPolicyWantsToBlockShareSheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityCache, 0);
  objc_storeStrong((id *)&self->__activeConnections, 0);
  objc_storeStrong((id *)&self->__currentConnection, 0);
  objc_storeStrong((id *)&self->_slotIDToLabel, 0);
  objc_storeStrong((id *)&self->_actionUserDefaults, 0);
  objc_storeStrong((id *)&self->_shareUserDefaults, 0);
  objc_storeStrong((id *)&self->_sessionIDToShareSheetSession, 0);
  objc_storeStrong((id *)&self->_activityTypeToLabelSlot, 0);
  objc_storeStrong((id *)&self->_activityTypeToLargeImageSlot, 0);
  objc_storeStrong((id *)&self->_bundleIDToSmallImageSlot, 0);
  objc_storeStrong((id *)&self->_personToLabelSlot, 0);
  objc_storeStrong((id *)&self->_personToImageSlot, 0);
  objc_storeStrong((id *)&self->_sharingPolicyWantsToBlockShareSheet, 0);
  objc_storeStrong((id *)&self->_shareSheetContext, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
