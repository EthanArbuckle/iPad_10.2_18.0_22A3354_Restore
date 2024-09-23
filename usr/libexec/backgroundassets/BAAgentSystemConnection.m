@implementation BAAgentSystemConnection

- (BAAgentSystemConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4
{
  BAAgentSystemConnection *v4;
  BAAgentSystemConnection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BAAgentSystemConnection;
  v4 = -[BAAgentConnection initWithNSXPCConnection:error:](&v15, "initWithNSXPCConnection:error:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_progressConfigLock._os_unfair_lock_opaque = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BAClientSystemXPCProtocol));
    objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(BAAppStoreProgressInfoDescriptor, v7), "receiveAppStoreProgressWithAppBundleIdentifier:progressInfo:", 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BAAgentSystemXPCProtocol));
    objc_msgSend(v8, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(BAAppStorePrepareDescriptor, v9), "applicationPrepareWithDescriptor:completionHandler:", 0, 0);
    objc_msgSend(v8, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(BAAppStoreEventDescriptor, v10), "applicationEventPerformedWithDescriptor:completionHandler:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v5, "connection"));
    objc_msgSend(v11, "setRemoteObjectInterface:", v6);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v5, "connection"));
    objc_msgSend(v12, "setExportedInterface:", v8);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v5, "connection"));
    objc_msgSend(v13, "setExportedObject:", v5);

  }
  return v5;
}

- (void)applicationPrepareWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  void *v17;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_baassets_validUTI"));

  if (v8 && (v10 = objc_opt_class(NSString, v9), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    objc_msgSend(v11, "applicationPrepareWithDescriptor:", v5);

    v6[2](v6, 1, 0);
  }
  else
  {
    v16 = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid application identifier supplied: %@"), v12));
    v17 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAAgentSystemConnectionErrorDomain"), 1, v14));
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v15);

  }
}

- (void)applicationEventPerformedWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSErrorUserInfoKey v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  NSErrorUserInfoKey v33;
  void *v34;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_baassets_validUTI"));

  if (v8 && (v10 = objc_opt_class(NSString, v9), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    if (objc_msgSend(v5, "automaticInstall") && objc_msgSend(v5, "eventType") == (id)10)
    {
      v11 = sub_1000129D4();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "App Store sent an [Installing] event during an automatic install for: (%{public}@). Dropping event...", buf, 0xCu);
      }
    }
    else
    {
      v17 = objc_msgSend(v5, "eventType");
      v18 = 1;
      switch((unint64_t)v17)
      {
        case 0xAuLL:
          goto LABEL_21;
        case 0xBuLL:
          v18 = 2;
          goto LABEL_21;
        case 0xCuLL:
          v18 = 3;
          goto LABEL_21;
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
          goto LABEL_13;
        case 0x14uLL:
          v18 = 4;
          goto LABEL_21;
        case 0x15uLL:
          v18 = 5;
          goto LABEL_21;
        case 0x16uLL:
          v12 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
          -[NSObject applicationInstallCanceledWithIdentifier:userInitiated:](v12, "applicationInstallCanceledWithIdentifier:userInitiated:", v19, objc_msgSend(v5, "userInitiated"));
          goto LABEL_18;
        default:
          if (v17 == (id)30)
          {
            v18 = 6;
LABEL_21:
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleURL"));
            objc_msgSend(v26, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:", v18, v27, v28, objc_msgSend(v5, "userInitiated"));

            goto LABEL_22;
          }
          if (v17 != (id)5)
          {
LABEL_13:
            v29 = NSLocalizedDescriptionKey;
            v21 = objc_msgSend(v5, "eventType");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid eventType supplied (%lu) for: %@"), v21, v22));
            v30 = v23;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAAgentSystemConnectionErrorDomain"), 2, v24));
            v6[2](v6, 0, v25);

            goto LABEL_23;
          }
          v12 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleURL"));
          -[NSObject applicationPlaceholderReadyWithIdentifier:placeholderBundleURL:userInitiated:](v12, "applicationPlaceholderReadyWithIdentifier:placeholderBundleURL:userInitiated:", v19, v20, objc_msgSend(v5, "userInitiated"));

LABEL_18:
          break;
      }
    }

LABEL_22:
    v6[2](v6, 1, 0);
  }
  else
  {
    v33 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid application identifier supplied: %@"), v13));
    v34 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAAgentSystemConnectionErrorDomain"), 1, v15));
    v6[2](v6, 0, v16);

  }
LABEL_23:

}

- (void)applicationShouldTriggerPeriodicWithIdentifier:(id)a3 bundleURLPath:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_baassets_validUTI"));
  if (v11 && (v12 = objc_opt_class(NSString, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    objc_msgSend(v13, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:", 7, v11, v8, 0);

    v9[2](v9, 1, 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid application identifier supplied: %@"), v7, NSLocalizedDescriptionKey));
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAAgentSystemConnectionErrorDomain"), 1, v15));
    ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v16);

  }
}

- (void)runDebugCommand:(id)a3 reply:(id)a4
{
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  BAContentRequestTelemetry *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _BOOL4 v28;
  void *v29;
  unsigned int v30;
  id v31;
  void *v32;
  void *v33;
  BAContentRequestTelemetry *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  _BOOL4 v48;
  void **p_vtable;
  const char *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  uint8_t buf[4];
  BAContentRequestTelemetry *v59;
  __int16 v60;
  NSObject *v61;

  v5 = (void (**)(_QWORD))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("command")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("arguments")));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("state")))
  {
    if (!objc_msgSend(v9, "count"))
    {
      v10 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
      -[NSObject _printDebugState](v10, "_printDebugState");
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("shutdown")))
  {
    if (objc_msgSend(v9, "count"))
      goto LABEL_15;
LABEL_13:
    v10 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    -[NSObject _debugShutdown](v10, "_debugShutdown");
    goto LABEL_14;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("force_periodic")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("reset")))
    {
      if (objc_msgSend(v9, "count"))
        goto LABEL_15;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
      objc_msgSend(v11, "_setClearBeforeShutdown");

      goto LABEL_13;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("downloads-allowed")))
    {
      if (objc_msgSend(v9, "count") != (id)1)
        goto LABEL_15;
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lowercaseString](v10, "lowercaseString"));
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("clear"));

      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
        v15 = v14;
        v16 = 0;
        v17 = 1;
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lowercaseString](v10, "lowercaseString"));
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("yes"));

        if (v30)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
          v15 = v14;
          v16 = 1;
        }
        else
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lowercaseString](v10, "lowercaseString"));
          v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("no"));

          if (!v41)
            goto LABEL_14;
          v14 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
          v15 = v14;
          v16 = 0;
        }
        v17 = 0;
      }
      -[NSObject _debugDownloadTime:clear:](v14, "_debugDownloadTime:clear:", v16, v17);
LABEL_79:

      goto LABEL_14;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("consume-extension-time")))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("reset-extension-time")))
      {
        if (objc_msgSend(v9, "count") != (id)1)
        {
          v39 = sub_100012964();
          v10 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_1000356D0();
          goto LABEL_14;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_baassets_validUTI"));

        if (!v10 || !-[NSObject length](v10, "length"))
        {
          v42 = sub_100012964();
          v15 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_1000356A4();
          goto LABEL_79;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "applicationInfoForIdentifier:", v10));

        v27 = sub_100012964();
        v19 = objc_claimAutoreleasedReturnValue(v27);
        v28 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v28)
          {
            *(_DWORD *)buf = 138543362;
            v59 = (BAContentRequestTelemetry *)v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Resetting extension runtime for %{public}@", buf, 0xCu);
          }

          -[NSObject resetExtensionRuntime](v15, "resetExtensionRuntime");
          v19 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
          -[NSObject saveApplicationState](v19, "saveApplicationState");
          goto LABEL_78;
        }
        if (!v28)
        {
LABEL_78:

          goto LABEL_79;
        }
        *(_DWORD *)buf = 138543362;
        v59 = (BAContentRequestTelemetry *)v10;
      }
      else
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("send-telemetry-event")))
          goto LABEL_15;
        if (objc_msgSend(v9, "count") != (id)1)
        {
          v51 = sub_100012964();
          v10 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_100035728();
          goto LABEL_14;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "_baassets_validUTI"));

        if (!v10 || !-[NSObject length](v10, "length"))
        {
          v52 = sub_100012964();
          v15 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_1000356FC();
          goto LABEL_79;
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "applicationInfoIfExistsForIdentifier:", v10));

        if (v15)
        {
          v19 = objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("1CB2CF25-5012-4A61-85D5-2FF468AE9203")));
          v34 = [BAContentRequestTelemetry alloc];
          v35 = -[NSObject installSource](v15, "installSource");
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
          v23 = -[BAContentRequestTelemetry initWithContentRequest:applicationIdentifier:installSource:downloads:](v34, "initWithContentRequest:applicationIdentifier:installSource:downloads:", 3, v19, v35, v36);

          +[BATelemetrySender sendContentRequestTelemetryEvent:](BATelemetrySender, "sendContentRequestTelemetryEvent:", v23);
          goto LABEL_77;
        }
        v56 = sub_100012964();
        v19 = objc_claimAutoreleasedReturnValue(v56);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_78;
        *(_DWORD *)buf = 138543362;
        v59 = (BAContentRequestTelemetry *)v10;
      }
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Unable to get application runtime info for identifier: %{public}@", buf, 0xCu);
      goto LABEL_78;
    }
    if (objc_msgSend(v9, "count") != (id)2)
    {
      v31 = sub_100012964();
      v10 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100035678();
      goto LABEL_14;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_baassets_validUTI"));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));
    v19 = objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v15));
    v57 = 0;
    -[NSObject scanInteger:](v19, "scanInteger:", &v57);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject substringFromIndex:](v15, "substringFromIndex:", -[NSObject scanLocation](v19, "scanLocation")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lowercaseString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v23 = (BAContentRequestTelemetry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22));

    if (-[BAContentRequestTelemetry length](v23, "length") == (id)1)
    {
      if (-[BAContentRequestTelemetry isEqualToString:](v23, "isEqualToString:", CFSTR("m")))
      {
        v24 = 60 * v57;
        goto LABEL_55;
      }
      if (-[BAContentRequestTelemetry isEqualToString:](v23, "isEqualToString:", CFSTR("h")))
      {
        v24 = 3600 * v57;
LABEL_55:
        v57 = v24;
        if (v24)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "applicationInfoForIdentifier:", v10));

          if (!v44)
          {
            v54 = sub_100012964();
            v55 = objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v59 = (BAContentRequestTelemetry *)v10;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Unable to get application runtime info for identifier: %{public}@", buf, 0xCu);
            }
            goto LABEL_76;
          }
          v45 = v57;
          v46 = sub_100012964();
          v47 = objc_claimAutoreleasedReturnValue(v46);
          v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
          if (v45 < 1)
          {
            p_vtable = &OBJC_METACLASS___BAAppStoreProgressInfoDescriptor.vtable;
            if (v48)
            {
              *(_DWORD *)buf = 134218242;
              v59 = (BAContentRequestTelemetry *)v57;
              v60 = 2114;
              v61 = v10;
              v50 = "Removing %ld seconds to %{public}@";
              goto LABEL_74;
            }
          }
          else
          {
            p_vtable = (void **)(&OBJC_METACLASS___BAAppStoreProgressInfoDescriptor + 24);
            if (v48)
            {
              *(_DWORD *)buf = 134218242;
              v59 = (BAContentRequestTelemetry *)v57;
              v60 = 2114;
              v61 = v10;
              v50 = "Added %ld seconds to %{public}@";
LABEL_74:
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, v50, buf, 0x16u);
            }
          }

          objc_msgSend(v44, "_debugConsumeTime:", (double)v57);
          v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 212, "sharedCore"));
          -[NSObject saveApplicationState](v55, "saveApplicationState");
LABEL_76:

        }
LABEL_77:

        goto LABEL_78;
      }
      v53 = sub_100012964();
      v38 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v59 = v23;
        goto LABEL_66;
      }
    }
    else
    {
      v37 = sub_100012964();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v59 = v23;
LABEL_66:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Invalid unit string: %{public}@\nShould be 'm' or 'h'.", buf, 0xCu);
      }
    }

    v57 = 0;
    goto LABEL_77;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    -[NSObject doPeriodicUpdateCheck](v10, "doPeriodicUpdateCheck");
    goto LABEL_14;
  }
LABEL_15:
  v5[2](v5);

}

- (void)updateAppStoreProgressObservationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  os_unfair_lock_s *v6;
  void (**v7)(id, uint64_t, _QWORD);
  id *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  os_unfair_lock_s *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = (os_unfair_lock_s *)a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  os_unfair_lock_lock(&self->_progressConfigLock);
  -[BAAgentSystemConnection setClientProgressConfiguration:](self, "setClientProgressConfiguration:", v6);
  os_unfair_lock_unlock(&self->_progressConfigLock);
  v17 = v6;
  v8 = sub_10000B8B4(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "essentialAssetsProgressDescriptorWithIdentifier:", v14));

        -[BAAgentSystemConnection reportProgressForIdentifier:progressInfo:](self, "reportProgressForIdentifier:progressInfo:", v14, v16);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  v7[2](v7, 1, 0);

}

- (void)reportProgressForIdentifier:(id)a3 progressInfo:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *v8;
  id *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_progressConfigLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentSystemConnection clientProgressConfiguration](self, "clientProgressConfiguration"));

  if (v7)
  {
    v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(-[BAAgentSystemConnection clientProgressConfiguration](self, "clientProgressConfiguration"));
    v9 = sub_10000B8B4(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v10, "containsObject:", v14);

    os_unfair_lock_unlock(&self->_progressConfigLock);
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &stru_100058C08));
      objc_msgSend(v13, "receiveAppStoreProgressWithAppBundleIdentifier:progressInfo:", v14, v6);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_progressConfigLock);
  }

}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("System Connection\nPID: %d"), objc_msgSend(v2, "processIdentifier")));

  return (NSString *)v3;
}

- (BAAppStoreProgressConfiguration)clientProgressConfiguration
{
  return (BAAppStoreProgressConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientProgressConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProgressConfiguration, 0);
}

@end
