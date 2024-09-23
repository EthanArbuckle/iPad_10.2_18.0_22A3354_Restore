@implementation NSXPCConnection(SafariCoreExtras)

- (id)safari_applicationRecordForConnectedProcess
{
  void *v1;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3B38];
  objc_msgSend(a1, "auditToken");
  objc_msgSend(v1, "safari_applicationRecordForConnectedProcessWithAuditToken:", &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras
{
  __int128 v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v12;
  _OWORD v13[2];
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3[1];
  v13[0] = *a3;
  v13[1] = v3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", v13, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (!v4)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSXPCConnection(SafariCoreExtras) safari_applicationRecordForConnectedProcessWithAuditToken:].cold.1(v8, (uint64_t)v14, v7);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSXPCConnection(SafariCoreExtras) safari_applicationRecordForConnectedProcessWithAuditToken:].cold.2(v10, (uint64_t)v14, v7);
    }
LABEL_9:

    v6 = 0;
    goto LABEL_10;
  }
  v6 = v4;
LABEL_10:

  return v6;
}

+ (uint64_t)safari_applicationWithAuditToken:()SafariCoreExtras hasApprovedWebCredentialsDomainAssociationForDomain:
{
  id v5;
  __int128 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v16;
  _OWORD v17[2];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3[1];
  v17[0] = *a3;
  v17[1] = v6;
  WBSApplicationIdentifierFromAuditToken(v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D96E50]);
    v9 = (void *)objc_msgSend(v8, "initWithServiceType:applicationIdentifier:domain:", *MEMORY[0x1E0D96E60], v7, v5);
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0D96E48], "serviceDetailsWithServiceSpecifier:error:", v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v10)
    {
      v12 = objc_msgSend(v10, "safari_containsObjectPassingTest:", &__block_literal_global_30);
    }
    else
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXXPC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "safari_privacyPreservingDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        _os_log_impl(&dword_1B2621000, v13, OS_LOG_TYPE_DEFAULT, "Could not load shared web credentials: %{public}@", buf, 0xCu);

      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)safari_arrayForEntitlement:()SafariCoreExtras
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForEntitlement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)safari_arrayForEntitlement:()SafariCoreExtras containingObjectsOfClass:
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "safari_arrayForEntitlement:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__NSXPCConnection_SafariCoreExtras__safari_arrayForEntitlement_containingObjectsOfClass___block_invoke;
    v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v8[4] = a4;
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)safari_hasApprovedWebCredentialsDomainAssociationForDomain:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "auditToken");
  v6 = objc_msgSend(v5, "safari_applicationWithAuditToken:hasApprovedWebCredentialsDomainAssociationForDomain:", &v8, v4);

  return v6;
}

+ (void)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Could not fetch bundle record for connected process: %{public}@.", (uint8_t *)a2);

}

+ (void)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Connected process bundle record has unexpected type: %{public}@.", (uint8_t *)a2);

}

@end
