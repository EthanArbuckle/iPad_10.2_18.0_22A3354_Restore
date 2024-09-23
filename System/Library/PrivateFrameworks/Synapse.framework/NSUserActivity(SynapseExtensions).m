@implementation NSUserActivity(SynapseExtensions)

- (BOOL)_syIsShowBacklinkIndicatorUserActivity
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "_syIsBacklinkUserActivity"))
    return 0;
  objc_msgSend(a1, "_syUserInfoDomainIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(a1, "_syUserInfoLinkIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v3)
    return 0;
  return v5 != 0;
}

- (id)_canonicalURL
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.canonicalURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithDataRepresentation:relativeToURL:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  objc_sync_exit(v1);
  return v3;
}

- (id)_syUserInfoLinkIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (id)_syUserInfoDomainIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("domainIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (uint64_t)_syIsBacklinkUserActivity
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activityType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.notes.activity.show-backlink"));

  return v2;
}

- (void)set_canonicalURL:()SynapseExtensions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_msgSend(v4, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPayload:object:identifier:", v6, 0, CFSTR("com.apple.synapse.canonicalURL"));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v7 = (void *)getUAUserActivityClass_softClass_0;
  v22 = getUAUserActivityClass_softClass_0;
  if (!getUAUserActivityClass_softClass_0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getUAUserActivityClass_block_invoke_0;
    v18[3] = &unk_1E757B260;
    v18[4] = &v19;
    __getUAUserActivityClass_block_invoke_0((uint64_t)v18);
    v7 = (void *)v20[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v8, "observers");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "userActivityCanonicalURLWasChanged:", v5, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (id)_linkContextInfo
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.linkContextInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    SYSupportedLinkContextInfoClasses();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v4, v2, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;

    if (!v5)
    {
      v7 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NSUserActivity(SynapseExtensions) _linkContextInfo].cold.1((uint64_t)v6, v7, v8);

    }
  }
  else
  {
    v5 = 0;
  }

  objc_sync_exit(v1);
  return v5;
}

- (void)set_linkContextInfo:()SynapseExtensions
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a1;
  objc_sync_enter(v6);
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke;
    v13[3] = &unk_1E757C518;
    v13[4] = &v14;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);
    if (*((_BYTE *)v15 + 24)
      || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SYNSUserActivityExtensions.m"), 112, CFSTR("linkContextInfo contains objects of unsupported classes.")), v11, *((_BYTE *)v15 + 24)))
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      if (!v7)
      {
        v9 = os_log_create("com.apple.synapse", ");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[NSUserActivity(SynapseExtensions) set_linkContextInfo:].cold.1((uint64_t)v8, v9, v10);

      }
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, "_setPayload:object:identifier:", v7, 0, CFSTR("com.apple.synapse.linkContextInfo"));

  objc_sync_exit(v6);
}

- (id)_linkContextPreviewMetadata
{
  id v1;
  void *v2;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.linkContextPreviewMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v1);

  return v2;
}

- (void)set_linkContextPreviewMetadata:()SynapseExtensions
{
  id v4;
  id v5;

  v5 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v4, "_setPayload:object:identifier:", v5, 0, CFSTR("com.apple.synapse.linkContextPreviewMetadata"));
  objc_sync_exit(v4);

}

- (id)_syLoggableDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_syRelatedUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p> type: %@, title: %@, userInfo: %@, persistentIdentifier: %@, relatedUniqueIdentifier: %@"), v4, a1, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_linkContextInfo
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, a3, "Error decoding linkContextInfo dictionary: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)set_linkContextInfo:()SynapseExtensions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, a3, "Error encoding linkContextInfo dictionary: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

@end
