@implementation LPApplication

- (LPApplication)init
{
  __assert_rtn("-[LPApplication init]", "LPApplication.m", 36, "false");
}

- (LPApplication)initWithAppBundleIdentifier:(id)a3
{
  id v5;
  id v6;
  LPApplication *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *extensionQueue;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *pendingReplyQueue;
  uint64_t v14;
  NSMutableArray *pendingReplies;
  LPApplication *v16;
  objc_super v18;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)LPApplication;
    v7 = -[LPApplication init](&v18, "init");
    if (v7)
    {
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(".extension-run"))));
      v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
      extensionQueue = v7->_extensionQueue;
      v7->_extensionQueue = (OS_dispatch_queue *)v9;

      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(".token-reply"))));
      v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
      pendingReplyQueue = v7->_pendingReplyQueue;
      v7->_pendingReplyQueue = (OS_dispatch_queue *)v12;

      v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      pendingReplies = v7->_pendingReplies;
      v7->_pendingReplies = (NSMutableArray *)v14;

      objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)deliverToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LPApplication pendingReplyQueue](self, "pendingReplyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004510;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)addPendingTokenReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LPApplication pendingReplyQueue](self, "pendingReplyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000046BC;
  block[3] = &unk_10000C308;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)deliverLocationPayloadToExtension:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LPApplication extensionQueue](self, "extensionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000047A8;
  v7[3] = &unk_10000C2E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSString)apsEnvironment
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  v5 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entitlements"));
  v7 = objc_msgSend(v6, "objectForKey:ofClass:", CFSTR("aps-environment"), objc_opt_class(NSString));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ((objc_msgSend(v8, "isEqualToString:", APSEnvironmentProduction) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", APSEnvironmentDevelopment))
  {
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (BOOL)hasLocationPushEntitlement
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  v5 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entitlements"));
  v7 = objc_msgSend(v6, "objectForKey:ofClass:", CFSTR("com.apple.developer.location.push"), objc_opt_class(NSNumber));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)hasLocationPushServiceExtension
{
  LPApplication *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication serviceExtensionForBundleIdentifier:](v2, "serviceExtensionForBundleIdentifier:", v3));
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_extensionQueue_deliverLocationPayloadToExtension:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  dispatch_queue_global_t global_queue;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  double v29;
  id v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  __int128 *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id obj;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  id v76;
  __int16 v77;
  double v78;
  __int16 v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;

  v51 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication serviceExtensionForBundleIdentifier:](self, "serviceExtensionForBundleIdentifier:", v4));

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
    v72 = 0;
    v7 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:error:](CLLocationManager, "_checkAndExerciseAuthorizationForBundleID:error:", v6, &v72);
    v49 = v72;

    if ((v7 & 1) != 0)
    {
      global_queue = dispatch_get_global_queue(21, 0);
      v9 = objc_claimAutoreleasedReturnValue(global_queue);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100005260;
      v69[3] = &unk_10000C2E0;
      v47 = v52;
      v70 = v47;
      v10 = v5;
      v71 = v10;
      v48 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSTimer scheduledTimerWithFireInterval:queue:handler:](BSTimer, "scheduledTimerWithFireInterval:queue:handler:", v9, v69, 30.0));
      v12 = BSMachAbsoluteTime();
      *(_QWORD *)&v81 = 0;
      *((_QWORD *)&v81 + 1) = &v81;
      v82 = 0x3032000000;
      v83 = sub_100005334;
      v84 = sub_100005344;
      v85 = 0;
      obj = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &obj));
      objc_storeStrong(&v85, obj);
      objc_opt_class(NSUUID);
      v14 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v50 = v15;

      objc_msgSend(v11, "cancel");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_extensionContextForUUID:", v50));
      v17 = v16 != 0;
      if (v16)
      {
        if ((BSPIDIsBeingDebugged(objc_msgSend(v10, "pidForRequestIdentifier:", v50)) & 1) != 0)
        {
          if (qword_100010D10 != -1)
            dispatch_once(&qword_100010D10, &stru_10000C398);
          v18 = qword_100010D18;
          if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v74 = v47;
            v75 = 2114;
            v76 = v50;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Extension is being debugged, will skip scheduling timers: sessionUUID=%{public}@", buf, 0x16u);
          }
          v19 = 0;
          v20 = 0;
        }
        else
        {
          v29 = BSMachAbsoluteTime();
          v30 = objc_alloc((Class)BSTimer);
          v31 = fmax(v12 - v29 + 30.0, 0.0);
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_10000534C;
          v64[3] = &unk_10000C330;
          v46 = v47;
          v65 = v46;
          v32 = v50;
          v66 = v32;
          v33 = v10;
          v67 = v33;
          v34 = objc_msgSend(v30, "initWithFireInterval:queue:handler:", v48, v64, v31);
          v35 = objc_alloc((Class)BSTimer);
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_100005428;
          v60[3] = &unk_10000C330;
          v61 = v33;
          v36 = v32;
          v62 = v36;
          v63 = v16;
          v20 = objc_msgSend(v35, "initWithFireInterval:queue:handler:", v48, v60, 25.0);
          if (qword_100010D10 != -1)
            dispatch_once(&qword_100010D10, &stru_10000C398);
          v37 = qword_100010D18;
          if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            v74 = v46;
            v75 = 2114;
            v76 = v36;
            v77 = 2048;
            v78 = v31;
            v79 = 2048;
            v80 = 0x4039000000000000;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}@] Extension started, scheduled timers: sessionUUID=%{public}@, serviceTime=%lf, graceTime=%lf", buf, 0x2Au);
          }

          v19 = v34;
        }
        v38 = v19;
        objc_msgSend(v19, "schedule", v46);
        objc_msgSend(v20, "schedule");
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_auxiliaryConnection"));
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100005550;
        v56[3] = &unk_10000C358;
        v59 = &v81;
        v40 = v47;
        v57 = v40;
        v41 = v50;
        v58 = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "synchronousRemoteObjectProxyWithErrorHandler:", v56));
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100005658;
        v53[3] = &unk_10000C2E0;
        v54 = v40;
        v55 = v41;
        objc_msgSend(v42, "didReceiveLocationPushPayload:reply:", v51, v53);

        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_auxiliaryConnection"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "remoteObjectProxy"));
        objc_msgSend(v44, "serviceExtensionPerformCleanup");

        objc_msgSend(v38, "cancel");
        objc_msgSend(v20, "cancel");

      }
      else
      {
        if (qword_100010D10 != -1)
          dispatch_once(&qword_100010D10, &stru_10000C398);
        v27 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(void **)(*((_QWORD *)&v81 + 1) + 40);
          *(_DWORD *)buf = 138543618;
          v74 = v47;
          v75 = 2114;
          v76 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not start an extension session: error=%{public}@", buf, 0x16u);
        }
      }

      _Block_object_dispose(&v81, 8);
    }
    else
    {
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C398);
      v24 = (void *)qword_100010D18;
      v17 = 0;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
        LODWORD(v81) = 138543362;
        *(_QWORD *)((char *)&v81 + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Don't yet have non-provisional authorization for %{public}@, bailing...", (uint8_t *)&v81, 0xCu);

        v17 = 0;
      }
    }

  }
  else
  {
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C398);
    v21 = (void *)qword_100010D18;
    v17 = 0;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
      LODWORD(v81) = 138543362;
      *(_QWORD *)((char *)&v81 + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Tried to deliver payload to %{public}@, but couldn't find a location push extension", (uint8_t *)&v81, 0xCu);

      v17 = 0;
    }
  }

  return v17;
}

- (id)serviceExtensionForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = objc_alloc((Class)LSApplicationRecord);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  v6 = objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);

  if (v6)
  {
    v15[0] = CFSTR("com.apple.location.push.service");
    v14[0] = NSExtensionPointName;
    v14[1] = NSExtensionContainingAppName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v15[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

    v13 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension extensionsWithMatchingAttributes:error:](NSExtension, "extensionsWithMatchingAttributes:error:", v9, &v13));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (OS_dispatch_queue)extensionQueue
{
  return self->_extensionQueue;
}

- (void)setExtensionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_extensionQueue, a3);
}

- (OS_dispatch_queue)pendingReplyQueue
{
  return self->_pendingReplyQueue;
}

- (void)setPendingReplyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReplyQueue, a3);
}

- (NSMutableArray)pendingReplies
{
  return self->_pendingReplies;
}

- (void)setPendingReplies:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReplies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplies, 0);
  objc_storeStrong((id *)&self->_pendingReplyQueue, 0);
  objc_storeStrong((id *)&self->_extensionQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
