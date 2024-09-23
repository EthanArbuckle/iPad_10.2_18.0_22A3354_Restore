@implementation NSXPCConnection(UserNotificationsServer)

- (id)uns_clientBundleProxy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "uns_clientAuditToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "pid");
  else
    objc_msgSend(a1, "processIdentifier");
  BSBundleIDForPID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)uns_clientAuditToken
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  objc_msgSend(a1, "uns_getClientConnectionDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE0BDB8];
    objc_msgSend(a1, "auditToken");
    objc_msgSend(v6, "tokenFromAuditToken:", &v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  return v7;
}

- (id)uns_getClientConnectionDetails
{
  return objc_getAssociatedObject(a1, &kUNClientConnectionDetailsKey);
}

- (uint64_t)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char HasEntitlement;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  uint64_t v37;

  v4 = a3;
  if ((objc_msgSend(a1, "uns_isAllowedFromDaemon") & 1) == 0)
  {
    objc_msgSend(a1, "processIdentifier");
    BSBundleIDForPID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "containingBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v4);

      if ((v10 & 1) == 0)
      {
        v11 = (void *)MEMORY[0x24BE0BDB8];
        objc_msgSend(a1, "_xpcConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tokenFromXPCConnection:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(a1, "_uns_connection:isAuthorizedToSendNotificationsForBundleIdentifier:", v13, v4))
        {

        }
        else
        {
          v14 = objc_msgSend(a1, "_uns_connection:isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:", v13, v4);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(a1, "_xpcConnection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            HasEntitlement = BSXPCConnectionHasEntitlement();

            if ((HasEntitlement & 1) == 0)
            {
              objc_msgSend(a1, "_xpcConnection");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = BSXPCConnectionHasEntitlement();

              if ((v18 & 1) == 0)
              {
                objc_msgSend(a1, "_xpcConnection");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = BSXPCConnectionHasEntitlement();

                if ((v20 & 1) == 0)
                {
                  objc_msgSend(a1, "_xpcConnection");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = BSXPCConnectionHasEntitlement();

                  if ((v22 & 1) == 0)
                  {
                    objc_msgSend(a1, "_xpcConnection");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = BSXPCConnectionHasEntitlement();

                    if ((v24 & 1) == 0)
                    {
                      v36 = *MEMORY[0x24BDF8998];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
                        -[NSXPCConnection(UserNotificationsServer) uns_isAllowedToRequestUserNotificationsForBundleIdentifier:].cold.2((uint64_t)v4, v36, v37);
                      v5 = 0;
                      goto LABEL_20;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    objc_msgSend(v7, "protocol");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BEBF4F8]);

    if (v26)
    {
      objc_msgSend(v7, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(MEMORY[0x24BEBF418], "isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:", v27);
      if ((v5 & 1) == 0)
      {
        v28 = *MEMORY[0x24BDF8998];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
          -[NSXPCConnection(UserNotificationsServer) uns_isAllowedToRequestUserNotificationsForBundleIdentifier:].cold.1((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);
      }

    }
    else
    {
      v5 = 1;
    }
LABEL_20:

    goto LABEL_21;
  }
  v5 = 1;
LABEL_21:

  return v5;
}

- (uint64_t)uns_isAllowedFromDaemon
{
  void *v1;
  uint64_t HasEntitlement;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "_xpcConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HasEntitlement = BSXPCConnectionHasEntitlement();

  if ((HasEntitlement & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = *MEMORY[0x24BDF8998];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(UserNotificationsServer) uns_isAllowedFromDaemon].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return HasEntitlement;
}

- (void)uns_setConnectionDetails:()UserNotificationsServer
{
  objc_setAssociatedObject(a1, &kUNClientConnectionDetailsKey, a3, (void *)1);
}

- (void)uns_isAllowedFromDaemon
{
  OUTLINED_FUNCTION_3(&dword_216DCB000, a1, a3, "Entitlement is required to forward requests", a5, a6, a7, a8, 0);
}

- (uint64_t)uns_requestContainsDisallowedPrivateUserInfo:()UserNotificationsServer
{
  void *v4;
  int v5;
  os_log_t *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];
  uint8_t buf[16];

  objc_msgSend(a3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.private.untool.override"));

  if (!v5)
    return 0;
  v6 = (os_log_t *)MEMORY[0x24BDF8998];
  v7 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "Request contains Apple private userInfo, checking request's entitlement...", buf, 2u);
  }
  v8 = objc_msgSend(a1, "uns_isInternalUserNotificationsTool");
  v9 = *v6;
  if (v8)
  {
    v10 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v10)
      return result;
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "Request is allowed for Apple private userInfo.", v19, 2u);
    return 0;
  }
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    -[NSXPCConnection(UserNotificationsServer) uns_requestContainsDisallowedPrivateUserInfo:].cold.1(v9, v12, v13, v14, v15, v16, v17, v18);
  return 1;
}

- (uint64_t)uns_isAllowedToReadSettings
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = objc_msgSend(a1, "uns_hasEntitlement:capability:", CFSTR("com.apple.private.usernotifications.settings"), CFSTR("read"));
  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(UserNotificationsServer) uns_isAllowedToReadSettings].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return v1;
}

- (uint64_t)uns_isAllowedToWriteSettings
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = objc_msgSend(a1, "uns_hasEntitlement:capability:", CFSTR("com.apple.private.usernotifications.settings"), CFSTR("write"));
  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(UserNotificationsServer) uns_isAllowedToWriteSettings].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return v1;
}

- (uint64_t)uns_hasEntitlement:()UserNotificationsServer capability:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "valueForEntitlement:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(UserNotificationsServer) uns_hasEntitlement:capability:].cold.1((uint64_t)v6, (uint64_t)v7, v12);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "containsObject:", v7);

LABEL_8:
  return v11;
}

- (uint64_t)uns_isInternalUserNotificationsTool
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (objc_msgSend(a1, "uns_isAllowedFromDaemon")
    && (objc_msgSend(a1, "uns_getClientConnectionDetails"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "isInternalTool");
  }
  else
  {
    v5 = (void *)MEMORY[0x24BE0BDB8];
    objc_msgSend(a1, "_xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenFromXPCConnection:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "unc_isInternalUserNotificationsTool");
  }
  v7 = v4;

  return v7;
}

- (uint64_t)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForBundleIdentifier:
{
  return objc_msgSend(a1, "_uns_connection:valueForEntitlementKey:matchesValue:", a3, CFSTR("com.apple.private.usernotifications.bundle-identifiers"), a4);
}

- (uint64_t)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, &v14);
  v9 = v14;
  objc_msgSend(v8, "managementDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(UserNotificationsServer) _uns_connection:isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:].cold.1((uint64_t)v7, v11, v9);
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(a1, "_uns_connection:valueForEntitlementKey:matchesValue:", v6, CFSTR("com.apple.private.usernotifications.app-management-domains"), v10);
  }

  return v12;
}

- (uint64_t)_uns_connection:()UserNotificationsServer valueForEntitlementKey:matchesValue:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v7, "valueForEntitlement:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = objc_msgSend(v10, "containsObject:", v9);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)uns_requestContainsDisallowedPrivateUserInfo:()UserNotificationsServer .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_216DCB000, a1, a3, "Request is NOT allowed for Apple private userInfo!", a5, a6, a7, a8, 0);
}

- (void)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a2, a3, "Not allowing service extension '%{public}@' to request user notifications at this time", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = CFSTR("com.apple.private.usernotifications.bundle-identifiers");
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_1_2(&dword_216DCB000, a2, a3, "Entitlment '%{public}@' for %{public}@ required to request user notifications", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)uns_isAllowedToReadSettings
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a1, a3, "Entitlement '%{public}@' required to read settings", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)uns_isAllowedToWriteSettings
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a1, a3, "Entitlement '%{public}@' required to write settings", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)uns_hasEntitlement:()UserNotificationsServer capability:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_1_2(&dword_216DCB000, a3, (uint64_t)a3, "Entitlement '%{public}@' for capability '%{public}@' is not valid because it is not an NSArray", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6;
  v9 = CFSTR("<null>");
  if (v6)
    v9 = (const __CFString *)v6;
  v10 = 138543618;
  v11 = a1;
  v12 = 2114;
  v13 = v9;
  OUTLINED_FUNCTION_1_2(&dword_216DCB000, v5, v7, "Failed to lookup application record to get management domain for '%{public}@'. Error: '%{public}@'", (uint8_t *)&v10);

}

@end
