@implementation MRSystemHealthComponentHandler

- (MRSystemHealthComponentHandler)initWithComponentName:(id)a3
{
  id v4;
  MRSystemHealthComponentHandler *v5;
  MRSystemHealthComponentHandler *v6;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  dispatch_queue_t v35;
  void *v36;
  void *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MRSystemHealthComponentHandler;
  v5 = -[MRBaseComponentHandler init](&v39, "init");
  v6 = v5;
  if (v5)
  {
    -[MRBaseComponentHandler setComponentName:](v5, "setComponentName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SUcaseFor%@"), v7));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v6, "setComponentSUCaseKey:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentSUCaseKey](v6, "componentSUCaseKey"));
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v6, "setIsSUCaseForComponent:", objc_msgSend(v9, "BOOLForKey:", v10));

    -[MRBaseComponentHandler setDisplayNotification:](v6, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v6, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v6, "isSUCaseForComponent") ^ 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/%@"), v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v6, "setLinkedSensitiveURL:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mobilerepair.%@Repair"), v14));
    -[MRBaseComponentHandler setComponentFollowupClientID:](v6, "setComponentFollowupClientID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentFollowupClientID](v6, "componentFollowupClientID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("FINISH_REPAIR")));
    -[MRBaseComponentHandler setFinishRepairKey:](v6, "setFinishRepairKey:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unlockCheckCountFor%@"), v18));
    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v6, "setComponentUnLockCheckCountKey:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("retriggerCheckCountFor%@"), v20));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v6, "setComponentRetriggerCountKey:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("lastCheckTimeFor%@"), v22));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v6, "setComponentLastCheckTimeKey:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hasDisplayedFollowupForSHC%@"), v24));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v6, "setComponentHasDisplayedFollowUpKey:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mobilerepair.%@unlockchecker"), v26));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v6, "setComponentUnlockCheckerActivityName:", v27);

    -[MRBaseComponentHandler setComponentId:](v6, "setComponentId:", 0);
    -[MRBaseComponentHandler setNotifyServer:](v6, "setNotifyServer:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("firstUIDisplayedTimeFor%@"), v28));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v6, "setComponentFirstUIDisplayedTimeKey:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("lastKnownIDFor%@"), v30));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v6, "setLastKnownComponentIdentifierKey:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v33 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:](CRFDRBaseDeviceHandler, "copySealingManifestDataInstanceForComponent:", v32);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v6, "setLastKnownComponentIdentifierValue:", v33);

    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v6, "setUnlockCheckActivityRequired:", 0);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName")));
    v35 = dispatch_queue_create((const char *)objc_msgSend(v34, "UTF8String"), 0);
    -[MRSystemHealthComponentHandler setComponentEventQueue:](v6, "setComponentEventQueue:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v6, "componentName"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringByAppendingString:", CFSTR("Failed")));
    -[MRBaseComponentHandler setComponentStatusKey:](v6, "setComponentStatusKey:", v37);

  }
  return v6;
}

- (void)postComponentStatus:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;

  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2048;
    v23 = a3;
    v24 = 2112;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "postComponentStatus name:%@ status:%llu connection:%@", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentAuthHandler](self, "componentAuthHandler"));
  v11 = objc_msgSend(v10, "copyComponentStatus");

  v12 = handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 != (id)-3)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Processing componentStatus", buf, 2u);
    }

    if (a3 == 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentStatusKey](self, "componentStatusKey"));
      v16 = v5;
      v17 = 0;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_14:
        objc_msgSend(v5, "synchronize");
        v18 = objc_claimAutoreleasedReturnValue(-[MRSystemHealthComponentHandler componentEventQueue](self, "componentEventQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000DC34;
        block[3] = &unk_100018810;
        block[4] = self;
        dispatch_async(v18, block);

        goto LABEL_15;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentStatusKey](self, "componentStatusKey"));
      v16 = v5;
      v17 = 1;
    }
    objc_msgSend(v16, "setBool:forKey:", v17, v15);

    goto LABEL_14;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring componentStatus for pending repair case", buf, 2u);
  }

LABEL_15:
}

- (OS_dispatch_queue)componentEventQueue
{
  return self->_componentEventQueue;
}

- (void)setComponentEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_componentEventQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentEventQueue, 0);
}

@end
