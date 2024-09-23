@implementation DMDSetAppExtensionUUIDsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetAppExtensionUUIDsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C29B8;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29[3];
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "VPNUUIDString"));
  v31 = 0;
  v10 = objc_msgSend(v8, "setVPNUUIDString:forBundleIdentifier:error:", v9, v7, &v31);
  v11 = v31;
  if ((v10 & 1) == 0)
  {

    v15 = v11;
LABEL_13:
    -[DMDSetAppExtensionUUIDsOperation endOperationWithError:](self, "endOperationWithError:", v11);
    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellularSliceUUIDString"));
  v30 = v11;
  v14 = objc_msgSend(v12, "setCellularSliceUUIDString:forBundleIdentifier:error:", v13, v7, &v30);
  v15 = v30;

  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v29[2] = v15;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentFilterUUIDString"));
    v28 = v16;
    v17 = objc_msgSend(v16, "setContentFilterUUIDString:forBundleIdentifier:error:");
    v18 = v15;

    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
      v29[1] = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "DNSProxyUUIDString"));
      v26 = v19;
      v17 = objc_msgSend(v19, "setDNSProxyUUIDString:forBundleIdentifier:error:");
      v20 = v18;

      if (v17)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relayUUIDString"));
        v29[0] = v20;
        v17 = objc_msgSend(v24, "setRelayUUIDString:forBundleIdentifier:error:", v21, v7, v29);
        v23 = v29[0];

        v20 = v23;
      }

      v18 = v20;
    }

    v15 = v18;
  }
  else
  {
    v17 = 0;
  }

  if (!v17)
  {
    v11 = v15;
    goto LABEL_13;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v22, "sendManagedAppsChangedNotification");

  -[DMDSetAppExtensionUUIDsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
LABEL_14:

}

@end
