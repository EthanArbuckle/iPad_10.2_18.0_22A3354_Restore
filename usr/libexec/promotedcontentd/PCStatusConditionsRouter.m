@implementation PCStatusConditionsRouter

- (PCStatusConditionsRouter)init
{
  PCStatusConditionsRouter *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v8.receiver = self;
  v8.super_class = (Class)PCStatusConditionsRouter;
  v2 = -[PCStatusConditionsRouter init](&v8, "init");
  if (v2)
  {
    v3 = APLogForCategory(50);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class(v2);
      *(_DWORD *)buf = 138477827;
      v10 = v5;
      v6 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for PCStatusConditions ", buf, 0xCu);

    }
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v2);
  }
  return v2;
}

- (id)actionReceiverForConnection:(id)a3
{
  id v3;
  void *v4;
  PCStatusConditionsReceiver *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
  if (!objc_msgSend(v4, "length"))
  {
    if (proc_pidpath((int)objc_msgSend(v3, "processIdentifier"), buf, 0x1000u) <= 0)
    {
      v23 = APLogForCategory(50);
      v11 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "StatusConditionListener: Unable to determine process path. Cannot continue.", (uint8_t *)&v27, 2u);
      }
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", buf, 0, 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v11, "path"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v11, "path"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sha256hash"));

        v18 = APLogForCategory(44);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v27 = 138477827;
          v28 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "StatusConditionListener: looking up '%{private}@'.", (uint8_t *)&v27, 0xCu);
        }

        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10022B258, "objectForKeyedSubscript:", v17));
        if (!v20)
        {
          v20 = v17;
          v21 = APLogForCategory(44);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v27 = 138477827;
            v28 = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "StatusConditionListener: bundleID for %{private}@ not found.", (uint8_t *)&v27, 0xCu);
          }

        }
        v4 = v20;
        goto LABEL_2;
      }
      v24 = APLogForCategory(50);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "StatusConditionListener: The BundleID and path of process are both empty. Cannot continue.", (uint8_t *)&v27, 2u);
      }

    }
    v5 = 0;
    goto LABEL_26;
  }
LABEL_2:
  v5 = -[PCStatusConditionsReceiver initWithBundleID:connection:]([PCStatusConditionsReceiver alloc], "initWithBundleID:connection:", v4, v3);
  v6 = APLogForCategory(44);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (-[PCStatusConditionsReceiver hasWriteEntitlement](v5, "hasWriteEntitlement"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = -[PCStatusConditionsReceiver hasReadEntitlement](v5, "hasReadEntitlement");
    *(_DWORD *)buf = 138543874;
    if (v9)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v30 = v4;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "StatusConditionListener: accepting ADStatusConditionService connection from client %{public}@.\nWrite entitlement: %{public}@\nRead entitlement: %{public}@", buf, 0x20u);
  }

LABEL_26:
  return v5;
}

- (id)machServiceName
{
  return CFSTR("com.apple.ap.adservicesd.statusconditionservice");
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
