@implementation UAUserActivity

+ (void)addUserActivityObserver:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    if (getUserActivityObservers(BOOL)::sOnce != -1)
      dispatch_once(&getUserActivityObservers(BOOL)::sOnce, &__block_literal_global_775);
    v4 = (id)getUserActivityObservers(BOOL)::sResult;
    objc_sync_enter(v4);
    objc_msgSend(v4, "addObject:", v5);
    objc_sync_exit(v4);

    v3 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDataCache, 0);
  objc_storeStrong((id *)&self->_payloadUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_payloadObjects, 0);
  objc_storeStrong((id *)&self->_originalUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicIdentifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_cachedEncodedUserInfo, 0);
  objc_storeStrong((id *)&self->_sentToIndexerDate, 0);
  objc_storeStrong((id *)&self->_madeInitiallyCurrentDate, 0);
  objc_storeStrong((id *)&self->_madeCurrentEndDate, 0);
  objc_storeStrong((id *)&self->_madeCurrentDate, 0);
  objc_storeStrong((id *)&self->_willCallSaveSerializationQueue, 0);
  objc_storeStrong((id *)&self->_savedUserInfo, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredUserInfoKeys, 0);
  objc_storeStrong((id *)&self->_contentUserAction, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_decodeUserInfoError, 0);
  objc_storeStrong((id *)&self->_dirtyPayloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_resumerAdvertiser, 0);
  objc_storeStrong((id *)&self->_advertiserCompletedGroup, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_frameworkPayload, 0);
}

- (BOOL)isEqual:(id)a3
{
  UAUserActivity *v4;
  UAUserActivity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UAUserActivity *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

void __83__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_clearDirty___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  int v13;
  int v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  _BYTE *v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  int v60;
  NSObject *oslog;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  const __CFString *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (!objc_msgSend(v3, "isInvalidated"))
      goto LABEL_8;
LABEL_5:
    _uaGetLogForCategory(0);
    oslog = objc_claimAutoreleasedReturnValue();
    v60 = 1;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v6;
      _os_log_impl(&dword_1AF7EB000, oslog, OS_LOG_TYPE_INFO, "Refusing to consider calling delegate for %{public}@ because it has been invalidated.", buf, 0xCu);

      v60 = 1;
    }
    goto LABEL_49;
  }
  v4 = objc_msgSend(v3, "needsSave");
  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) != 0)
    goto LABEL_5;
  if ((v4 & 1) != 0)
  {
LABEL_8:
    v7 = 1;
LABEL_9:
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "needsSave");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v78 = v10;
      v79 = 2114;
      v80 = v12;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "for %{public}@: needsSave=%{public}@", buf, 0x16u);

    }
    if (*(_BYTE *)(a1 + 56))
      v13 = 1000;
    else
      v13 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "needsSave"))
      v14 = 100;
    else
      v14 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "dirty"))
      v15 = 10;
    else
      v15 = 0;
    v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setCachedEncodedUserInfo:", 0);
    objc_sync_exit(v16);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    oslog = objc_claimAutoreleasedReturnValue();
    v60 = v14 + v13 + v15;
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = *(id *)(a1 + 32);
      objc_sync_enter(v17);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      objc_sync_exit(v17);

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      getUserActivityObserversCopy();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v71 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = objc_opt_respondsToSelector();

              if ((v24 & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "userActivityWillSynchronize:", v25);

              }
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
        }
        while (v19);
      }

      _uaGetLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138543619;
        v78 = v28;
        v79 = 2113;
        v80 = v29;
        _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_DEBUG, "--- in async block, calling willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);

      }
      -[NSObject willSynchronizeActivity](oslog, "willSynchronizeActivity");
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      getUserActivityObserversCopy();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v67 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
            objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = objc_opt_respondsToSelector();

              if ((v36 & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "userActivityWasSynchronized:", v37);

              }
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        }
        while (v31);
      }

      v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105);
      objc_sync_exit(v38);

      objc_msgSend(*(id *)(a1 + 32), "displayInDtrace");
      _uaGetLogForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "UUIDString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138543619;
        v78 = v41;
        v79 = 2113;
        v80 = v42;
        _os_log_impl(&dword_1AF7EB000, v39, OS_LOG_TYPE_DEBUG, "--- in async block, back from willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);

      }
    }
LABEL_49:

    goto LABEL_50;
  }
  v7 = 0;
  v60 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "dirty"))
    goto LABEL_9;
LABEL_50:
  if (*(_BYTE *)(a1 + 57))
  {
    v43 = *(id *)(a1 + 32);
    objc_sync_enter(v43);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = 0;
    v44 = *(_BYTE **)(a1 + 32);
    if (v44[104])
      objc_msgSend(v44, "setDirty:", 1);
    objc_sync_exit(v43);

  }
  _uaGetLogForCategory(CFSTR("signposts"));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = v45;
  v47 = *(_QWORD *)(a1 + 48);
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v78) = v60;
    _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v46, OS_SIGNPOST_INTERVAL_END, v47, "callWillSaveDelegate", "why=%{public}d enableTelemetry=YES ", buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "userActivityInfoForSelf");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v50 = *(void **)(v49 + 40);
  *(_QWORD *)(v49 + 40) = v48;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  getUserActivityObserversCopy();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v63 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v58 = objc_opt_respondsToSelector();

          if ((v58 & 1) != 0)
          {
            if (!v52)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "archiveUserActivityInfo");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "userActivityWasSerialized:archived:", v59, v52);

          }
        }
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v53);
  }

}

- (void)setDirty:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 dirty;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  _BYTE v40[10];
  uint64_t v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  dirty = v4->_dirty;
  if (v4->_inWillSaveCallback)
  {
    v32 = 0;
    goto LABEL_31;
  }
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("NO");
    v10 = v4->_dirty;
    if (v3)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v38 = v7;
    v39 = 2114;
    if (v10)
      v9 = CFSTR("YES");
    *(_QWORD *)v40 = v11;
    *(_WORD *)&v40[8] = 2114;
    v41 = (uint64_t)v9;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "setDirty:(%{public}@) => %{public}@ (is currently %{public}@)", buf, 0x20u);

  }
  if (-[UAUserActivity forceImmediateSendToServer](v4, "forceImmediateSendToServer"))
  {
    v12 = 1;
  }
  else
  {
    if (!v4->_activityHasBeenSentToServer)
    {
      HIDWORD(v32) = 0;
      if (v3)
        goto LABEL_15;
LABEL_30:
      LODWORD(v32) = 0;
      goto LABEL_31;
    }
    v12 = v4->_dirty != v3;
  }
  HIDWORD(v32) = v12;
  if (!v3)
    goto LABEL_30;
LABEL_15:
  v4->_dirty = 1;
  -[UAUserActivity setCachedEncodedUserInfo:](v4, "setCachedEncodedUserInfo:", 0);
  if (-[UAUserActivity forwardToCoreSpotlightIndexer](v4, "forwardToCoreSpotlightIndexer"))
  {
    -[UAUserActivity manager](v4, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v13, "userActivityIsActive:", v4);

  }
  else
  {
    LODWORD(v32) = 0;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  getUserActivityObserversCopy();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[UAUserActivity parentUserActivity](v4, "parentUserActivity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = objc_opt_respondsToSelector();

          if ((v20 & 1) != 0)
          {
            -[UAUserActivity parentUserActivity](v4, "parentUserActivity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "userActivityWasMadeDirty:", v21);

          }
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v15);
  }

LABEL_31:
  objc_sync_exit(v4);

  biomeInfoLogging();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[UAUserActivity forceImmediateSendToServer](v4, "forceImmediateSendToServer");
    *(_DWORD *)buf = 138544386;
    v38 = (uint64_t)v23;
    v39 = 1024;
    *(_DWORD *)v40 = dirty;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v24;
    LOWORD(v41) = 1024;
    *(_DWORD *)((char *)&v41 + 2) = HIDWORD(v32);
    HIWORD(v41) = 1024;
    v42 = v32;
    _os_log_impl(&dword_1AF7EB000, v22, OS_LOG_TYPE_INFO, "%{public}@ SET-DIRTY\twasDirty=%{BOOL}d force=%{BOOL}d informServer=%{BOOL}d informIndex=%{BOOL}d", buf, 0x24u);

  }
  if (HIDWORD(v32))
  {
    if (v4->_createsNewUUIDIfSaved)
    {
      -[UAUserActivity tellDaemonAboutNewLSUserActivity](v4, "tellDaemonAboutNewLSUserActivity");
    }
    else
    {
      if (-[UAUserActivity forceImmediateSendToServer](v4, "forceImmediateSendToServer"))
      {
        -[UAUserActivity setForceImmediateSendToServer:](v4, "setForceImmediateSendToServer:", 0);
        v25 = 1;
      }
      else
      {
        v25 = -[UAUserActivity encodedContainsUnsynchronizedCloudDocument](v4, "encodedContainsUnsynchronizedCloudDocument");
      }
      -[UAUserActivity manager](v4, "manager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "markUserActivityAsDirty:forceImmediate:", v4, v25);

    }
  }
  if ((_DWORD)v32)
  {
    _uaGetLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity typeIdentifier](v4, "typeIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v38 = (uint64_t)v28;
      v39 = 2114;
      *(_QWORD *)v40 = v30;
      *(_WORD *)&v40[8] = 2048;
      v41 = 0x403E000000000000;
      _os_log_impl(&dword_1AF7EB000, v27, OS_LOG_TYPE_DEBUG, "sending %{private}@/%{public}@ to indexer within %f seconds because it is dirty.", buf, 0x20u);

    }
    -[UAUserActivity indexActivity:forceIndexing:](v4, "indexActivity:forceIndexing:", 1, 30.0);
  }
}

- (NSUserActivity)parentUserActivity
{
  void *v3;
  void *v4;

  getUAUserActivityToNSUserActivityMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(v3, "objectForKey:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSUserActivity *)v4;
}

- (BOOL)forceImmediateSendToServer
{
  return self->_forceImmediateSendToServer;
}

- (UAUserActivityManager)manager
{
  return (UAUserActivityManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (BOOL)forwardToCoreSpotlightIndexer
{
  UAUserActivity *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_forwardToCoreSpotlightIndexerCount > 0 || -[UAUserActivity isEligibleForSearch](v2, "isEligibleForSearch"))
    v3 = 1;
  else
    v3 = -[UAUserActivity isEligibleForPrediction](v2, "isEligibleForPrediction");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEligibleForSearch
{
  return self->_eligibleForSearch;
}

- (BOOL)isEligibleForPrediction
{
  UAUserActivity *v2;
  BOOL eligibleForPrediction;

  v2 = self;
  objc_sync_enter(v2);
  eligibleForPrediction = v2->_eligibleForPrediction;
  objc_sync_exit(v2);

  return eligibleForPrediction;
}

- (void)setCachedEncodedUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

uint64_t __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_object *v3;
  objc_object *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (v3 && objectIsOfAcceptableClassForUserInfo(v3))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[objc_object isFileURL](v4, "isFileURL"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v4);

    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)dirty
{
  UAUserActivity *v2;
  BOOL dirty;

  v2 = self;
  objc_sync_enter(v2);
  dirty = v2->_dirty;
  objc_sync_exit(v2);

  return dirty;
}

- (void)sendUserActivityInfoToLSUserActivityd:(BOOL)a3 onAsyncQueue:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  UAUserActivity *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  const __CFString *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  const __CFString *v30;
  const __CFString *v31;
  UAUserActivity *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[5];
  BOOL v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v4 = a4;
  v5 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v7 = -[UAUserActivity needsSave](self, "needsSave");
  if (-[UAUserActivity isInvalidated](self, "isInvalidated"))
  {
    _uaGetLogForCategory(0);
    v8 = (UAUserActivity *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v10;
      _os_log_impl(&dword_1AF7EB000, &v8->super, OS_LOG_TYPE_ERROR, "sendUserActivityToServer, called on activity %{public}@ after it had been invalidated, so doing nothing.", buf, 0xCu);

    }
  }
  else
  {
    if (!v7 && !v5)
      return;
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v12)
      {
        -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        -[UAUserActivity manager](self, "manager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "userActivityIsActive:", self);
        v18 = -[UAUserActivity needsSave](self, "needsSave");
        v19 = &stru_1E60084E8;
        *(_DWORD *)buf = 138544130;
        v46 = v14;
        if (v17)
          v19 = CFSTR(" (is active)");
        v47 = 2114;
        v48 = v15;
        if (v18)
          v20 = CFSTR("YES");
        else
          v20 = CFSTR("NO");
        v49 = 2114;
        v50 = v19;
        v51 = 2114;
        v52 = v20;
        _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "--- on async queue, for %{public}@: makeActive=%{public}@%{public}@ needsSave=%{public}@", buf, 0x2Au);

      }
      v8 = self;
      objc_sync_enter(v8);
      if (v8->_sendToServerPending)
      {
        _uaGetLogForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          -[UAUserActivity uniqueIdentifier](v8, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v46 = v23;
          _os_log_impl(&dword_1AF7EB000, v21, OS_LOG_TYPE_DEBUG, "skipping %{public}@ since there is already a save pending (_sendToServerPending==YES) for this user activity.", buf, 0xCu);

        }
      }
      else
      {
        v8->_sendToServerPending = 1;
        -[UAUserActivity manager](v8, "manager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "serialQueueForSendingActivitiesToServer");
        v42 = objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __79__UAUserActivity_Internal__sendUserActivityInfoToLSUserActivityd_onAsyncQueue___block_invoke;
        v43[3] = &unk_1E6006A50;
        v43[4] = v8;
        v44 = v5;
        dispatch_async(v42, v43);

      }
      objc_sync_exit(v8);
    }
    else
    {
      if (v12)
      {
        -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          v26 = CFSTR("YES");
        else
          v26 = CFSTR("NO");
        -[UAUserActivity manager](self, "manager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "userActivityIsActive:", self);
        v29 = -[UAUserActivity needsSave](self, "needsSave");
        v30 = &stru_1E60084E8;
        *(_DWORD *)buf = 138544130;
        v46 = v25;
        if (v28)
          v30 = CFSTR(" (is active)");
        v47 = 2114;
        v48 = v26;
        if (v29)
          v31 = CFSTR("YES");
        else
          v31 = CFSTR("NO");
        v49 = 2114;
        v50 = v30;
        v51 = 2114;
        v52 = v31;
        _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "--- for %{public}@: makeActive=%{public}@%{public}@ needsSave=%{public}@", buf, 0x2Au);

      }
      v32 = self;
      objc_sync_enter(v32);
      if (v5)
      {
        v33 = 1;
      }
      else
      {
        -[UAUserActivity manager](v32, "manager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "activeUserActivityUUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UAUserActivity uniqueIdentifier](v32, "uniqueIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v35, "isEqual:", v36);

      }
      v32->_lastSaveTime = CFAbsoluteTimeGetCurrent();
      objc_sync_exit(v32);

      -[UAUserActivity callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:](v32, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", v5, 1);
      v8 = (UAUserActivity *)objc_claimAutoreleasedReturnValue();
      _uaGetLogForCategory(0);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        -[UAUserActivity uniqueIdentifier](v32, "uniqueIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "UUIDString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v39;
        _os_log_impl(&dword_1AF7EB000, v37, OS_LOG_TYPE_DEBUG, "--- clearing _sendToServerPending for %{public}@ because we're about to push this to the server.", buf, 0xCu);

      }
      v32->_sendToServerPending = 0;
      if (v8)
      {
        -[UAUserActivity manager](v32, "manager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sendUserActivityInfoToLSUserActivityd:makeCurrent:", v8, v33);

      }
    }
  }

}

- (BOOL)isInvalidated
{
  UAUserActivity *v2;
  BOOL invalidated;

  v2 = self;
  objc_sync_enter(v2);
  invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (BOOL)needsSave
{
  UAUserActivity *v2;
  BOOL needsSave;

  v2 = self;
  objc_sync_enter(v2);
  needsSave = v2->_needsSave;
  objc_sync_exit(v2);

  return needsSave;
}

- (UAUserActivityDelegate)delegate
{
  return (UAUserActivityDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (id)userActivityInfoForSelf
{
  return -[UAUserActivity userActivityInfoForSelfWithPayload:](self, "userActivityInfoForSelfWithPayload:", 1);
}

- (id)callWillSaveDelegateIfDirtyAndPackageUpData:(BOOL)a3 clearDirty:(BOOL)a4
{
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[7];
  BOOL v16;
  BOOL v17;
  uint8_t buf[16];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  -[UAUserActivity willCallSaveSerializationQueue](self, "willCallSaveSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  _uaGetLogForCategory(CFSTR("signposts"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);

  _uaGetLogForCategory(CFSTR("signposts"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "callWillSaveDelegate", (const char *)&unk_1AF832D5A, buf, 2u);
  }

  -[UAUserActivity willCallSaveSerializationQueue](self, "willCallSaveSerializationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_clearDirty___block_invoke;
  v15[3] = &unk_1E6006E60;
  v16 = a3;
  v17 = a4;
  v15[4] = self;
  v15[5] = &v19;
  v15[6] = v9;
  dispatch_sync(v12, v15);

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (OS_dispatch_queue)willCallSaveSerializationQueue
{
  UAUserActivity *v2;
  OS_dispatch_queue *willCallSaveSerializationQueue;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;

  v2 = self;
  objc_sync_enter(v2);
  willCallSaveSerializationQueue = v2->_willCallSaveSerializationQueue;
  if (!willCallSaveSerializationQueue)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivity uniqueIdentifier](v2, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("willSaveCallback/%@"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), 0);
    v9 = v2->_willCallSaveSerializationQueue;
    v2->_willCallSaveSerializationQueue = (OS_dispatch_queue *)v8;

    willCallSaveSerializationQueue = v2->_willCallSaveSerializationQueue;
  }
  v10 = willCallSaveSerializationQueue;
  objc_sync_exit(v2);

  return v10;
}

- (void)becomeCurrent
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 needsSave;
  _BOOL4 dirty;
  _BOOL4 activityHasBeenSentToServer;
  NSDate *v17;
  void *madeCurrentDate;
  NSDate *madeInitiallyCurrentDate;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  double v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  _BYTE v38[10];
  const __CFString *v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UAUserActivity manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userActivityIsActive:", self);
    v8 = -[UAUserActivity isInvalidated](self, "isInvalidated");
    v9 = &stru_1E60084E8;
    v10 = CFSTR(" (already current)");
    if (!v7)
      v10 = &stru_1E60084E8;
    *(_DWORD *)buf = 138543874;
    v36 = v5;
    v37 = 2114;
    *(_QWORD *)v38 = v10;
    if (v8)
      v9 = CFSTR("(invalidated)");
    *(_WORD *)&v38[8] = 2114;
    v39 = v9;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "-becomeCurrent, uuid=%{public}@%{public}@%{public}@", buf, 0x20u);

  }
  if (loadSynapseObserverWhenFirstUserActivityIsMadeCurrent(void)::sOnce != -1)
    dispatch_once(&loadSynapseObserverWhenFirstUserActivityIsMadeCurrent(void)::sOnce, &__block_literal_global_761);
  if (!-[UAUserActivity isInvalidated](self, "isInvalidated"))
  {
    -[UAUserActivity manager](self, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v11, "userActivityIsActive:", self);

    biomeInfoLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      needsSave = self->_needsSave;
      dirty = self->_dirty;
      activityHasBeenSentToServer = self->_activityHasBeenSentToServer;
      *(_DWORD *)buf = 138544386;
      v36 = v13;
      v37 = 1024;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = needsSave;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = dirty;
      HIWORD(v39) = 1024;
      v40 = activityHasBeenSentToServer;
      _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "%{public}@ BECOMECURRENT\twas=%{BOOL}d needsSave=%{BOOL}d dirty=%{BOOL}d sendToServer=%{BOOL}d", buf, 0x24u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if ((v29 & 1) != 0)
    {
      madeCurrentDate = self->_madeCurrentDate;
      self->_madeCurrentDate = v17;
    }
    else
    {
      madeInitiallyCurrentDate = self->_madeInitiallyCurrentDate;
      self->_madeInitiallyCurrentDate = v17;

      objc_storeStrong((id *)&self->_madeCurrentDate, self->_madeInitiallyCurrentDate);
      if (!-[UAUserActivity activityHasBeenSentToServer](self, "activityHasBeenSentToServer"))
        -[UAUserActivity tellDaemonAboutNewLSUserActivity](self, "tellDaemonAboutNewLSUserActivity");
      -[UAUserActivity manager](self, "manager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "makeActive:", self);

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      getUserActivityObserversCopy();
      madeCurrentDate = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(madeCurrentDate, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(madeCurrentDate);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            -[UAUserActivity parentUserActivity](self, "parentUserActivity");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = objc_opt_respondsToSelector();

              if ((v26 & 1) != 0)
              {
                -[UAUserActivity parentUserActivity](self, "parentUserActivity");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "userActivityDidBecomeCurrent:current:", v27, 1);

              }
            }
          }
          v21 = objc_msgSend(madeCurrentDate, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v21);
      }
    }

    if (-[UAUserActivity isEligibleForSearch](self, "isEligibleForSearch")
      || -[UAUserActivity forwardToCoreSpotlightIndexer](self, "forwardToCoreSpotlightIndexer"))
    {
      v28 = 0.1;
      if (v29)
        v28 = 1.0;
      -[UAUserActivity indexActivity:forceIndexing:](self, "indexActivity:forceIndexing:", 1, v28);
    }
    if (v29)
      -[UAUserActivity scheduleSendUserActivityInfoToLSUserActivityd](self, "scheduleSendUserActivityInfoToLSUserActivityd");
    else
      -[UAUserActivity sendUserActivityInfoToLSUserActivityd:onAsyncQueue:](self, "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", 1, 1);
  }
}

void __79__UAUserActivity_Internal__sendUserActivityInfoToLSUserActivityd_onAsyncQueue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  objc_msgSend(*(id *)(a1 + 32), "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", *(unsigned __int8 *)(a1 + 40), 0);
  objc_autoreleasePoolPop(v2);
}

- (void)scheduleSendUserActivityInfoToLSUserActivityd
{
  UAUserActivity *v2;
  double Current;
  double lastSaveTime;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (-[UAUserActivity dirty](v2, "dirty"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    lastSaveTime = v2->_lastSaveTime;
    if (Current >= lastSaveTime && Current - lastSaveTime <= 30.0)
    {
      if (!v2->_saveScheduled)
      {
        v2->_saveScheduled = 1;
        v6 = dispatch_time(0, 30000000000);
        dispatch_get_global_queue(0, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __73__UAUserActivity_Internal__scheduleSendUserActivityInfoToLSUserActivityd__block_invoke;
        block[3] = &unk_1E6006AA0;
        block[4] = v2;
        dispatch_after(v6, v7, block);

      }
    }
    else
    {
      -[UAUserActivity sendUserActivityInfoToLSUserActivityd:onAsyncQueue:](v2, "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", 0, 1);
      v2->_saveScheduled = 0;
    }
  }
  objc_sync_exit(v2);

}

- (int64_t)priority
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[UAUserActivity options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("UserActivityPriority"));

  if (!v5)
    return 0;
  -[UAUserActivity options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserActivityPriority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3 options:(id)a4
{
  return -[UAUserActivity initWithTypeIdentifier:suggestedActionType:options:](self, "initWithTypeIdentifier:suggestedActionType:options:", a3, 1, a4);
}

- (void)setParentUserActivity:(id)a3
{
  id v4;
  void *v5;
  UAUserActivity *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getUAUserActivityToNSUserActivityMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(v5, "setObject:forKey:", v4, self);
  objc_sync_exit(v5);
  if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (!v6->_userActivityWasCreatedSent)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      getUserActivityObserversCopy();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v11, "userActivityWasCreated:", v4, (_QWORD)v12);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
    objc_sync_exit(v6);

  }
}

- (id)userActivityInfoForSelfWithPayload:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *v4;
  UAUserActivityInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_object *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *advertiserCompletedGroup;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  UAUserActivityInfo *v38;
  UAUserActivityInfo *v39;
  void *v41;
  _QWORD block[5];
  id v43;
  UAUserActivityInfo *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[8];
  _BYTE v50[128];
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_alloc_init(UAUserActivityInfo);
  -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setUuid:](v5, "setUuid:", v6);

  -[UAUserActivityInfo setType:](v5, "setType:", -[UAUserActivity suggestedActionType](v4, "suggestedActionType"));
  -[UAUserActivity title](v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setTitle:](v5, "setTitle:", v7);

  -[UAUserActivityInfo setActivityType:](v5, "setActivityType:", v4->_typeIdentifier);
  -[UAUserActivityInfo setDynamicActivityType:](v5, "setDynamicActivityType:", v4->_dynamicIdentifier);
  -[UAUserActivity teamIdentifier](v4, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setTeamIdentifier:](v5, "setTeamIdentifier:", v8);

  -[UAUserActivityInfo setWebpageURL:](v5, "setWebpageURL:", v4->_webpageURL);
  -[UAUserActivityInfo setReferrerURL:](v5, "setReferrerURL:", v4->_referrerURL);
  -[UAUserActivityInfo setTargetContentIdentifier:](v5, "setTargetContentIdentifier:", v4->_targetContentIdentifier);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setWhen:](v5, "setWhen:", v9);

  -[UAUserActivity requiredUserInfoKeys](v4, "requiredUserInfoKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setRequiredUserInfoKeys:](v5, "setRequiredUserInfoKeys:", v10);

  -[UAUserActivityInfo setUniversalLink:](v5, "setUniversalLink:", -[UAUserActivity isUniversalLink](v4, "isUniversalLink"));
  if (v3)
  {
    -[UAUserActivity cachedEncodedUserInfo](v4, "cachedEncodedUserInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _uaGetLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEFAULT, "Using cached encoded userInfo to build ActivityInfo", buf, 2u);
      }

      -[UAUserActivity cachedEncodedUserInfo](v4, "cachedEncodedUserInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", v13, CFSTR("UAUserActivityUserInfoPayload"));

      v14 = 0;
    }
    else
    {
      -[UAUserActivity userInfo](v4, "userInfo");
      v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
      deepMutableCopy(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[UAUserActivity payloadIdentifiers](v4, "payloadIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[UAUserActivity payloadForIdentifier:](v4, "payloadForIdentifier:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UAUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", v21, v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v17);
    }

    if (v4->_supportsContinuationStreams)
    {
      -[UAUserActivity payloadForIdentifier:](v4, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (v23)
      {
        advertiserCompletedGroup = v4->_advertiserCompletedGroup;
        if (advertiserCompletedGroup)
        {
          if (dispatch_group_wait(advertiserCompletedGroup, 0xEE6B280uLL))
          {
            v25 = 0;
            goto LABEL_22;
          }
          -[UAUserActivity payloadForIdentifier:](v4, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
            -[UAUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", v41, CFSTR("UAUserActivityStreamsPayload"));

        }
      }
    }
    else
    {
      -[UAUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", 0, CFSTR("UAUserActivityStreamsPayload"));
    }
  }
  else
  {
    v14 = 0;
  }
  v25 = 1;
LABEL_22:
  -[UAUserActivity options](v4, "options");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0C99E08];
  if (v26)
  {
    -[UAUserActivity options](v4, "options");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryWithDictionary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (-[UAUserActivity userInfoContainsFileURLs](v4, "userInfoContainsFileURLs"))
    objc_msgSend(v29, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("UAUserActivityContainsCloudDocsKey"));
  if (-[UAUserActivity encodedFileProviderURL](v4, "encodedFileProviderURL"))
    objc_msgSend(v29, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA59E8]);
  -[UAUserActivityInfo setEligibleForHandoff:](v5, "setEligibleForHandoff:", -[UAUserActivity isEligibleForHandoff](v4, "isEligibleForHandoff"));
  -[UAUserActivityInfo setEligibleForSearch:](v5, "setEligibleForSearch:", -[UAUserActivity isEligibleForSearch](v4, "isEligibleForSearch"));
  -[UAUserActivityInfo setEligibleForPublicIndexing:](v5, "setEligibleForPublicIndexing:", -[UAUserActivity isEligibleForPublicIndexing](v4, "isEligibleForPublicIndexing"));
  -[UAUserActivityInfo setEligibleForReminders:](v5, "setEligibleForReminders:", -[UAUserActivity isEligibleForReminders](v4, "isEligibleForReminders"));
  -[UAUserActivityInfo setEligibleForPrediction:](v5, "setEligibleForPrediction:", -[UAUserActivity isEligibleForPrediction](v4, "isEligibleForPrediction"));
  -[UAUserActivity persistentIdentifier](v4, "persistentIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setPersistentIdentifier:](v5, "setPersistentIdentifier:", v30);

  -[UAUserActivity contentUserAction](v4, "contentUserAction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setContentUserAction:](v5, "setContentUserAction:", v31);

  -[UAUserActivity keywords](v4, "keywords");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setKeywords:](v5, "setKeywords:", v32);

  -[UAUserActivity expirationDate](v4, "expirationDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setExpirationDate:](v5, "setExpirationDate:", v33);

  v34 = (void *)objc_msgSend(v29, "copy");
  -[UAUserActivityInfo setOptions:](v5, "setOptions:", v34);

  -[UAUserActivityInfo setEncodingOptions:](v5, "setEncodingOptions:", 0);
  objc_sync_exit(v4);

  if (v14)
    v35 = v25;
  else
    v35 = 0;
  if (v35 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v14, "count"))
      {
        v36 = dispatch_group_create();
        dispatch_get_global_queue(0, 0);
        v37 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__UAUserActivity_Internal__userActivityInfoForSelfWithPayload___block_invoke;
        block[3] = &unk_1E6006E38;
        block[4] = v4;
        v43 = v14;
        v44 = v5;
        dispatch_group_async(v36, v37, block);

        dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  if (v25)
    v38 = v5;
  else
    v38 = 0;
  v39 = v38;

  return v39;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (void)addUserInfoEntriesFromDictionary:(id)a3
{
  UAUserActivity *v4;
  id v5;
  NSDictionary *userInfo;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v8 && objc_msgSend(v8, "count"))
  {
    if ((recurse(v8, &__block_literal_global) & 1) != 0 || (dyld_program_sdk_at_least() & 1) == 0)
    {
      userInfo = v4->_userInfo;
      if (userInfo)
      {
        v7 = (void *)-[NSDictionary mutableCopy](userInfo, "mutableCopy");
        objc_msgSend(v7, "addEntriesFromDictionary:", v8);
      }
      else
      {
        v7 = (void *)objc_msgSend(v8, "copy");
      }
      -[UAUserActivity setUserInfo:](v4, "setUserInfo:", v7);

    }
    else if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("userInfo contained an invalid object type"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
  }
  objc_sync_exit(v4);

}

- (void)setUserInfo:(id)a3
{
  objc_object *v4;
  UAUserActivity *v5;
  NSDictionary *savedUserInfo;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int userInfoChangeCount;
  uint64_t v11;
  NSDictionary *userInfo;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *v17;
  NSDictionary *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (objc_object *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (differ((objc_object *)v5->_userInfo, v4))
  {
    ++v5->_userInfoChangeCount;
    savedUserInfo = v5->_savedUserInfo;
    v5->_savedUserInfo = 0;

    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      userInfoChangeCount = v5->_userInfoChangeCount;
      *(_DWORD *)buf = 138543875;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v25) = userInfoChangeCount;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "UAUserActivity:%{public}@/%{private}@, updating userInfoChangeCount to %d", buf, 0x1Cu);

    }
    if (v4)
    {
      if ((recurse(v4, &__block_literal_global) & 1) == 0 && dyld_program_sdk_at_least())
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("userInfo contained an invalid object type"), 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v19);
      }
      v11 = -[objc_object copy](v4, "copy");
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSDictionary *)v11;

      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL25dictionaryContainsFileURLP12NSDictionary_block_invoke;
      v25 = &unk_1E6007028;
      v26 = &v20;
      recurse(v4, buf);
      v13 = *((unsigned __int8 *)v21 + 24);
      _Block_object_dispose(&v20, 8);
      if ((v13 != 0) != -[UAUserActivity userInfoContainsFileURLs](v5, "userInfoContainsFileURLs"))
      {
        -[UAUserActivity setUserInfoContainsFileURLs:](v5, "setUserInfoContainsFileURLs:", v13 != 0);
        if (!v5->_inWillSaveCallback)
          -[UAUserActivity sendUserActivityInfoToLSUserActivityd:onAsyncQueue:](v5, "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", 1, 1);
      }
      biomeInfoLogging();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[objc_object count](v4, "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v25) = v13;
        _os_log_impl(&dword_1AF7EB000, v14, OS_LOG_TYPE_INFO, "%{public}@ SET-USERINFO\tcount=%{public}ld %{BOOL}d", buf, 0x1Cu);

      }
      -[UAUserActivity setDirty:](v5, "setDirty:", 1);
    }
    else
    {
      v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v18 = v5->_userInfo;
      v5->_userInfo = v17;

    }
  }
  objc_sync_exit(v5);

}

- (BOOL)userInfoContainsFileURLs
{
  return self->_userInfoContainsFileURLs;
}

- (NSString)persistentIdentifier
{
  UAUserActivity *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSString copy](v2->_persistentIdentifier, "copy");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)title
{
  UAUserActivity *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_title;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)expirationDate
{
  UAUserActivity *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expirationDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)keywords
{
  UAUserActivity *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSSet copy](v2->_keywords, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)isEligibleForPublicIndexing
{
  return self->_eligibleForPublicIndexing;
}

- (BOOL)isEligibleForHandoff
{
  return self->_eligibleForHandoff;
}

- (NSSet)requiredUserInfoKeys
{
  UAUserActivity *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSSet copy](v2->_requiredUserInfoKeys, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)isEligibleForReminders
{
  UAUserActivity *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_eligibleForReminders || v2->_eligibleForSearch;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)contentUserAction
{
  UAUserActivity *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_contentUserAction;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isUniversalLink
{
  UAUserActivity *v2;
  BOOL universalLink;

  v2 = self;
  objc_sync_enter(v2);
  universalLink = v2->_universalLink;
  objc_sync_exit(v2);

  return universalLink;
}

- (id)initDynamicActivityWithTypeIdentifier:(id)a3 dynamicIdentifier:(id)a4 suggestedActionType:(unint64_t)a5 options:(id)a6
{
  NSObject *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  UAUserActivity *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSDictionary *v25;
  NSDictionary *userInfo;
  uint64_t v27;
  NSString *typeIdentifier;
  uint64_t v29;
  NSString *dynamicIdentifier;
  uint64_t v31;
  NSDictionary *options;
  SFCompanionAdvertiser *advertiser;
  SFCompanionAdvertiser *resumerAdvertiser;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  id *v48;
  id *v49;
  void *v50;
  id obj;
  id v52;
  id v53;
  id v54;
  id v55;
  id from;
  id location;
  objc_super v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v53 = a4;
  v52 = a6;
  _uaGetLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    trimmedString(v54, 0x80u);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      trimmedString(v53, 0x10u);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &stru_1E60084E8;
    }
    suggestedActionTypeString(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    userActivityInfoOptionsDictionaryString(v52);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v60 = v11;
    v61 = 2113;
    v62 = v12;
    v63 = 2114;
    v64 = v13;
    v65 = 2114;
    v66 = v14;
    _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_DEBUG, "CREATING UAUserActivity/(%{public}@-%{private}@ %{public}@ options=%{public}@)", buf, 0x2Au);
    if (v53)

  }
  if (!v54 || !objc_msgSend(v54, "length"))
  {
    _uaGetLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v15, OS_LOG_TYPE_ERROR, "*** UserActivity: passed nil or the empty string for activityType, which is an error.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Caller did not provide an activityType, and this process does not have a NSUserActivityTypes in its Info.plist."));
  }
  v58.receiver = self;
  v58.super_class = (Class)UAUserActivity;
  v16 = -[UAUserActivity init](&v58, sel_init);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    obj = (id)objc_claimAutoreleasedReturnValue();
    +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v17);

    v18 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v16->_manager, v18);

    objc_initWeak(&from, v16);
    dispatch_get_global_queue(0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = &v55;
    objc_copyWeak(&v55, &from);
    v20 = obj;
    v21 = os_state_add_handler();

    v16->_os_state_handler = v21;
    uaUserActivityObjectsMap();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v22);
    uaUserActivityObjectsMap();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained(&from);
    objc_msgSend(v23, "setObject:forKey:", v24, v20);

    objc_sync_exit(v22);
    v25 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    userInfo = v16->_userInfo;
    v16->_userInfo = v25;

    objc_storeStrong((id *)&v16->_uniqueIdentifier, obj);
    v16->_suggestedActionType = a5;
    v27 = objc_msgSend(v54, "copy");
    typeIdentifier = v16->_typeIdentifier;
    v16->_typeIdentifier = (NSString *)v27;

    if (v53)
    {
      v29 = objc_msgSend(v53, "copy", &v55);
      dynamicIdentifier = v16->_dynamicIdentifier;
      v16->_dynamicIdentifier = (NSString *)v29;
    }
    else
    {
      dynamicIdentifier = v16->_dynamicIdentifier;
      v16->_dynamicIdentifier = 0;
    }

    *(_WORD *)&v16->_needsSave = 1;
    v16->_sendToServerPending = 0;
    if (v52)
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
    else
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v50, "copy", v48);
    options = v16->_options;
    v16->_options = (NSDictionary *)v31;

    advertiser = v16->_advertiser;
    v16->_advertiser = 0;

    v16->_canCreateStreams = 0;
    resumerAdvertiser = v16->_resumerAdvertiser;
    v16->_resumerAdvertiser = 0;

    v16->_supportsContinuationStreams = 0;
    *(_WORD *)&v16->_needsSave = 1;
    v16->_sendToServerPending = 0;
    v16->_eligibleForHandoff = 1;
    _uaGetLogForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity typeIdentifier](v16, "typeIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      trimmedString(v36, 0x80u);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity dynamicIdentifier](v16, "dynamicIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      trimmedString(v38, 0x80u);
      v39 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity uniqueIdentifier](v16, "uniqueIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "UUIDString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      suggestedActionTypeString(-[UAUserActivity suggestedActionType](v16, "suggestedActionType"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478595;
      v60 = v37;
      v61 = 2113;
      v62 = v39;
      v63 = 2114;
      v64 = v41;
      v65 = 2114;
      v66 = v42;
      _os_log_impl(&dword_1AF7EB000, v35, OS_LOG_TYPE_INFO, "initUAUserActivity:%{private}@-%{private}@ %{public}@ %{public}@", buf, 0x2Au);

    }
    biomeInfoLogging();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](v16, "uniqueIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity typeIdentifier](v16, "typeIdentifier");
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity dynamicIdentifier](v16, "dynamicIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v44;
      v61 = 2112;
      v62 = v45;
      v63 = 2112;
      v64 = v46;
      _os_log_impl(&dword_1AF7EB000, v43, OS_LOG_TYPE_INFO, "%{public}@ CREATED %@/%@", buf, 0x20u);

    }
    objc_destroyWeak(v49);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v16;
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)dynamicIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (unint64_t)suggestedActionType
{
  return self->_suggestedActionType;
}

- (NSData)cachedEncodedUserInfo
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)encodedFileProviderURL
{
  return self->_encodedFileProviderURL;
}

- (id)payloadIdentifiers
{
  UAUserActivity *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[UAUserActivity payloadUpdateBlocks](v2, "payloadUpdateBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAUserActivity payloadDataCache](v2, "payloadDataCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[UAUserActivity payloadDataCache](v2, "payloadDataCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)payloadForIdentifier:(id)a3
{
  id v4;
  UAUserActivity *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[UAUserActivity payloadUpdateBlocks](v5, "payloadUpdateBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UAUserActivity objectForIdentifier:](v5, "objectForIdentifier:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __77__UAUserActivity_UAUserActivityPayloadServicesSupport__payloadForIdentifier___block_invoke;
      v14[3] = &unk_1E6008128;
      v14[4] = v5;
      v14[5] = &v15;
      ((void (**)(_QWORD, UAUserActivity *, void *, id, _QWORD *))v7)[2](v7, v5, v8, v4, v14);
    }
    else
    {
      -[UAUserActivity payloadDataCache](v5, "payloadDataCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v16[5];
      v16[5] = v10;

    }
    objc_sync_exit(v5);

    v9 = (void *)v16[5];
  }
  else
  {
    v9 = 0;
  }
  v12 = v9;
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (NSMutableDictionary)payloadUpdateBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (NSMutableDictionary)payloadDataCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 376, 1);
}

void __85__UAUserActivity_UAUserActivityCoreSpotlightIndexingSupport__setContentAttributeSet___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v12, "encodeObject:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v12, "finishEncoding");
  objc_msgSend(v12, "encodedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *, _QWORD, _QWORD))v11 + 2))(v11, v10, v13, 0, 0);

}

void __77__UAUserActivity_UAUserActivityPayloadServicesSupport__payloadForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4, int a5)
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v9 = a3;
  if (!a4 || !*a4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_msgSend(*(id *)(a1 + 32), "dirtyPayloadIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5)
    objc_msgSend(v10, "addObject:", v12);
  else
    objc_msgSend(v10, "removeObject:", v12);

}

+ (BOOL)supportsUserActivityAppLinks
{
  return 1;
}

- (void)resignCurrent
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  UAUserActivity *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  _BOOL4 needsSave;
  _BOOL4 dirty;
  _BOOL4 activityHasBeenSentToServer;
  uint64_t v19;
  NSDate *madeCurrentEndDate;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  _BYTE v39[10];
  const __CFString *v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UAUserActivity manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userActivityIsActive:", self);
    v8 = -[UAUserActivity isInvalidated](self, "isInvalidated");
    v9 = &stru_1E60084E8;
    v10 = CFSTR(" (was current)");
    if (!v7)
      v10 = &stru_1E60084E8;
    *(_DWORD *)buf = 138543874;
    v37 = v5;
    v38 = 2114;
    *(_QWORD *)v39 = v10;
    if (v8)
      v9 = CFSTR("(invalidated)");
    *(_WORD *)&v39[8] = 2114;
    v40 = v9;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "uuid=%{public}@%{public}@%{public}@", buf, 0x20u);

  }
  v11 = self;
  objc_sync_enter(v11);
  -[UAUserActivity manager](v11, "manager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userActivityIsActive:", v11);

  biomeInfoLogging();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    -[UAUserActivity uniqueIdentifier](v11, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    needsSave = v11->_needsSave;
    dirty = v11->_dirty;
    activityHasBeenSentToServer = v11->_activityHasBeenSentToServer;
    *(_DWORD *)buf = 138544386;
    v37 = v15;
    v38 = 1024;
    *(_DWORD *)v39 = v13;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = needsSave;
    LOWORD(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 2) = dirty;
    HIWORD(v40) = 1024;
    v41 = activityHasBeenSentToServer;
    _os_log_impl(&dword_1AF7EB000, v14, OS_LOG_TYPE_INFO, "%{public}@ RESIGNCURRENT\twas=%{BOOL}d needsSave=%{BOOL}d dirty=%{BOOL}d sendToServer=%{BOOL}d", buf, 0x24u);

  }
  if (v13)
  {
    v19 = objc_opt_new();
    madeCurrentEndDate = v11->_madeCurrentEndDate;
    v11->_madeCurrentEndDate = (NSDate *)v19;

    -[NSDate timeIntervalSinceDate:](v11->_madeCurrentEndDate, "timeIntervalSinceDate:", v11->_madeInitiallyCurrentDate);
    v11->_madeCurrentInterval = v21 + v11->_madeCurrentInterval;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    getUserActivityObserversCopy();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v25);
          -[UAUserActivity parentUserActivity](v11, "parentUserActivity", (_QWORD)v31);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = objc_opt_respondsToSelector();

            if ((v28 & 1) != 0)
            {
              -[UAUserActivity parentUserActivity](v11, "parentUserActivity");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "userActivityDidBecomeCurrent:current:", v29, 0);

            }
          }
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v23);
    }

  }
  -[UAUserActivity manager](v11, "manager", (_QWORD)v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "makeInactive:", v11);

  objc_sync_exit(v11);
}

- (void)setWebpageURL:(id)a3
{
  void *v4;
  unint64_t v5;
  char *v6;
  _BOOL8 v7;
  UAUserActivity *v8;
  NSURL *v9;
  uint64_t v10;
  NSURL *webpageURL;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  objc_object *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = (objc_object *)a3;
  v4 = (void *)objc_opt_class();
  v5 = -[UAUserActivity suggestedActionType](self, "suggestedActionType");
  v6 = getenv("__UA_THROW_ON_SETWEBPAGEURL_FAILURE");
  if (v6)
    v7 = atoi(v6) != 0;
  else
    v7 = 1;
  objc_msgSend(v4, "checkWebpageURL:actionType:throwIfFailed:", v22, v5, v7);
  v8 = self;
  objc_sync_enter(v8);
  if (differ(v22, (objc_object *)v8->_webpageURL))
  {
    v9 = v8->_webpageURL;
    v10 = -[objc_object copy](v22, "copy");
    webpageURL = v8->_webpageURL;
    v8->_webpageURL = (NSURL *)v10;

    -[UAUserActivity manager](v8, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userActivityIsActive:", v8);

    if (v13)
    {
      -[UAUserActivity setForceImmediateSendToServer:](v8, "setForceImmediateSendToServer:", 1);
      -[UAUserActivity indexActivity:forceIndexing:](v8, "indexActivity:forceIndexing:", 1, 0.5);
    }
    -[UAUserActivity setDirty:](v8, "setDirty:", 1);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    getUserActivityObserversCopy();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
          -[UAUserActivity parentUserActivity](v8, "parentUserActivity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) != 0)
            {
              -[UAUserActivity parentUserActivity](v8, "parentUserActivity");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "userActivityWebpageURLWasChanged:webpageURL:previousValue:", v21, v22, v9);

            }
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

  }
  objc_sync_exit(v8);

}

void __63__UAUserActivity_Internal__userActivityInfoForSelfWithPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__UAUserActivity_Internal__userActivityInfoForSelfWithPayload___block_invoke_2;
  v7[3] = &unk_1E6006E10;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "encodeUserInfo:completionHandler:", v4, v7);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)encodeUserInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *context;
  id v45;
  id obj;
  NSObject *group;
  UAUserActivity *v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD block[4];
  NSObject *v56;
  UAUserActivity *v57;
  uint64_t v58;
  id v59;
  id v60;
  __int128 *p_buf;
  uint64_t *v62;
  uint64_t *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  unsigned int *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  unsigned int *v73;
  uint64_t v74;
  int v75;
  _QWORD v76[4];
  id v77;
  uint8_t v78[4];
  id v79;
  __int16 v80;
  void *v81;
  _QWORD v82[3];
  _QWORD v83[3];
  uint8_t v84[128];
  __int128 buf;
  uint64_t v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v50 = a4;
  v6 = MEMORY[0x1B5DFD11C]();
  v48 = self;
  -[UAUserActivity cachedEncodedUserInfo](self, "cachedEncodedUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UAUserActivity cachedEncodedUserInfo](v48, "cachedEncodedUserInfo");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    context = (void *)v6;
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[UAUserActivity cachedEncodedUserInfo](v48, "cachedEncodedUserInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      trimmedHexStringForData(v9, 64);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEFAULT, "Returning cached encoded userInfo, %{private}@", (uint8_t *)&buf, 0xCu);

    }
    (*((void (**)(id, id, _QWORD, _QWORD))v50 + 2))(v50, v49, 0, 0);
LABEL_38:

    v41 = context;
    goto LABEL_39;
  }
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke;
    v76[3] = &unk_1E6006B38;
    v49 = v11;
    v77 = v49;
    context = (void *)v6;
    if (recurse(v45, v76))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v86 = 0x2020000000;
      v87 = 0;
      v72 = 0;
      v73 = (unsigned int *)&v72;
      v74 = 0x2020000000;
      v75 = 0;
      v68 = 0;
      v69 = (unsigned int *)&v68;
      v70 = 0x2020000000;
      v71 = 0;
      if (objc_msgSend(v49, "count"))
      {
        _uaGetLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v49, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          stringRemovingNewlines(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138477827;
          v79 = v14;
          _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "-- This .userInfo contains iCloud URLs, so beginning process to supplement them with iCloud cookie information. (%{private}@)", v78, 0xCu);

        }
        group = dispatch_group_create();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        objc_msgSend(v49, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v65;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v65 != v16)
                objc_enumerationMutation(obj);
              v18 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v17);
              dispatch_get_global_queue(0, 0);
              v19 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_133;
              block[3] = &unk_1E6006B88;
              p_buf = &buf;
              v20 = group;
              v56 = v20;
              v57 = v48;
              v58 = v18;
              v59 = v49;
              v62 = &v72;
              v63 = &v68;
              v60 = v50;
              dispatch_group_async(v20, v19, block);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
          }
          while (v15);
        }

        _uaGetLogForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v45, "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          stringRemovingNewlines(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138477827;
          v79 = v23;
          _os_log_impl(&dword_1AF7EB000, v21, OS_LOG_TYPE_DEBUG, "ENCODE: Waiting for replacementURLs block to complete, userInfo=%{private}@.", v78, 0xCu);

        }
        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        _uaGetLogForCategory(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v49, "description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          stringRemovingNewlines(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138477827;
          v79 = v26;
          _os_log_impl(&dword_1AF7EB000, v24, OS_LOG_TYPE_DEBUG, "ENCODE: DONE waiting for replacementURLs block to complete. replacementURLs=%{private}@", v78, 0xCu);

        }
      }
      atomic_load((unsigned int *)(*((_QWORD *)&buf + 1) + 24));
      if (!atomic_load((unsigned int *)(*((_QWORD *)&buf + 1) + 24)))
      {
        v28 = MEMORY[0x1E0C809B0];
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_134;
        v53[3] = &unk_1E6006BB0;
        v54 = v49;
        v51[0] = v28;
        v51[1] = 3221225472;
        v51[2] = __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_2_136;
        v51[3] = &unk_1E6006BD8;
        v52 = v54;
        v29 = (void *)_UACopyPackedDataForObjectWithSubstitution(v45, 0, v53, v51);
        v82[0] = CFSTR("UAUserActivityContainsCloudDocsKey");
        if (atomic_load(v73 + 6))
          v31 = MEMORY[0x1E0C9AAB0];
        else
          v31 = MEMORY[0x1E0C9AAA0];
        v32 = *MEMORY[0x1E0CA59F0];
        v83[0] = v31;
        v83[1] = MEMORY[0x1E0C9AAA0];
        v33 = *MEMORY[0x1E0CA59E8];
        v82[1] = v32;
        v82[2] = v33;
        LODWORD(v33) = atomic_load(v69 + 6);
        if ((_DWORD)v33)
          v34 = MEMORY[0x1E0C9AAB0];
        else
          v34 = MEMORY[0x1E0C9AAA0];
        v83[2] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void *, _QWORD))v50 + 2))(v50, v29, v35, 0);
        _uaGetLogForCategory(0);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          trimmedHexStringForData(v29, 64);
          v37 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "description");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          stringRemovingNewlines(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138478083;
          v79 = v37;
          v80 = 2114;
          v81 = v39;
          _os_log_impl(&dword_1AF7EB000, v36, OS_LOG_TYPE_DEFAULT, "ENCODE: Caching encoded userInfo to use until we are marked dirty again, returning encoded result %{private}@ opts=%{public}@", v78, 0x16u);

        }
        -[UAUserActivity setCachedEncodedUserInfo:](v48, "setCachedEncodedUserInfo:", v29);

      }
      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -114, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v50 + 2))(v50, 0, 0, v42);

    }
    goto LABEL_38;
  }
  _uaGetLogForCategory(0);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AF7EB000, v40, OS_LOG_TYPE_DEFAULT, "ENCODE: Asked to encode nil userInfo, so returning nil.", (uint8_t *)&buf, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v50 + 2))(v50, 0, 0, 0);
  v41 = (void *)v6;
LABEL_39:
  objc_autoreleasePoolPop(v41);

  return 1;
}

+ (id)_encodeKeyAndValueIntoString:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v6 = a3;
  objc_msgSend(a1, "_encodeToString:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_encodeToString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = &stru_1E60084E8;
  if (v8 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s=%s"), objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)_encodeToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSArray *v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSArray *v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  if (!v46)
  {
    v8 = 0;
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v46, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("'%@'"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v8 = (__CFString *)v7;

LABEL_5:
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v10 = v46;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v56 != v13)
            objc_enumerationMutation(v10);
          +[UAUserActivity _encodeToString:](UAUserActivity, "_encodeToString:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v12 & 1) != 0)
            objc_msgSend(v9, "appendString:", CFSTR(","));
          objc_msgSend(v9, "appendString:", v15);

          v12 = 1;
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "appendString:", CFSTR(")"));
    v8 = (__CFString *)objc_msgSend(v9, "copy");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{("));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v46, "allObjects");
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sortedArrayIfSameClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v19)
      {
        v20 = 0;
        v21 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v52 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(a1, "_encodeToString:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 & 1) != 0)
              objc_msgSend(v16, "appendString:", CFSTR(","));
            objc_msgSend(v16, "appendString:", v23);

            v20 = 1;
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        }
        while (v19);
      }

      objc_msgSend(v16, "appendString:", CFSTR(")}"));
      v8 = (__CFString *)objc_msgSend(v16, "copy");

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v46, "allKeys");
        v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
        sortedArrayIfSameClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v26;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v27)
        {
          v28 = 0;
          v29 = *(_QWORD *)v48;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v48 != v29)
                objc_enumerationMutation(obj);
              v31 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
              objc_msgSend(v46, "objectForKey:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v28 & 1) != 0)
                objc_msgSend(v24, "appendString:", CFSTR(","));
              objc_msgSend(a1, "_encodeToString:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_encodeToString:", v31);
              v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v35 = objc_msgSend(v34, "UTF8String");
              v36 = objc_retainAutorelease(v33);
              objc_msgSend(v24, "appendFormat:", CFSTR("%s=%s"), v35, objc_msgSend(v36, "UTF8String"));

              v28 = 1;
            }
            v26 = obj;
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v27);
        }

        objc_msgSend(v24, "appendString:", CFSTR("}"));
        v8 = (__CFString *)objc_msgSend(v24, "copy");

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v46, "stringValue");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v46, "base64EncodedStringWithOptions:", 0);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v37, "stringWithFormat:", CFSTR("$%s$"), objc_msgSend(v38, "UTF8String"));
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v4, "stringFromDate:", v46);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR("^d%@^"), v6);
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v46, "absoluteString");
          v4 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789."));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("^url^%@%%%%^"), v43);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_5;
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v44 = (id)objc_claimAutoreleasedReturnValue();

        if (v44 == v46)
          v8 = CFSTR("--");
        else
          v8 = 0;
      }
    }
  }
LABEL_44:

  return v8;
}

void __63__UAUserActivity_Internal__userActivityInfoForSelfWithPayload___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v22 = v7;
  objc_msgSend(*(id *)(a1 + 32), "setPayload:identifier:", v7, CFSTR("UAUserActivityUserInfoPayload"));
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E08];
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dictionaryWithDictionary:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v18);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA59F0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setEncodedContainsUnsynchronizedCloudDocument:", objc_msgSend(v20, "BOOLValue"));

    v21 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setOptions:", v21);

  }
  objc_msgSend(*(id *)(a1 + 32), "setEncodedUserInfoError:", v9);

}

- (BOOL)activityHasBeenSentToServer
{
  return self->_activityHasBeenSentToServer;
}

+ (BOOL)checkWebpageURL:(id)a3 actionType:(unint64_t)a4 throwIfFailed:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  v10 = 0;
  v11 = 1;
  if (v8 && a4 != 10)
  {
    objc_msgSend(v8, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v13, "copy");

    if (v10)
    {
      objc_msgSend(a1, "allowedWebpageURLSchemes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "containsObject:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      v11 = 0;
    }
    if (v5)
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSUserActivity.webpageURL scheme \"%@\" is not allowed."), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v18);
    }
  }
LABEL_8:

  return v11;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (void)setEncodedContainsUnsynchronizedCloudDocument:(BOOL)a3
{
  self->_encodedContainsUnsynchronizedCloudDocument = a3;
}

- (NSString)targetContentIdentifier
{
  UAUserActivity *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_targetContentIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)sentToIndexerDate
{
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (NSDate)madeInitiallyCurrentDate
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setEligibleForPrediction:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForPrediction != v3)
    obj->_eligibleForPrediction = v3;
  objc_sync_exit(obj);

}

- (NSURL)webpageURL
{
  UAUserActivity *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_webpageURL;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)encodedContainsUnsynchronizedCloudDocument
{
  return self->_encodedContainsUnsynchronizedCloudDocument;
}

- (double)madeCurrentInterval
{
  UAUserActivity *v2;
  double madeCurrentInterval;

  v2 = self;
  objc_sync_enter(v2);
  madeCurrentInterval = v2->_madeCurrentInterval;
  objc_sync_exit(v2);

  return madeCurrentInterval;
}

- (void)setEligibleForSearch:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_eligibleForSearch != v3)
  {
    _uaGetLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = "NO";
      if (v3)
        v9 = "YES";
      v12 = 138543618;
      v13 = v7;
      v14 = 2080;
      v15 = v9;
      _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "setEligibleForSearch(%{public}@)=%s", (uint8_t *)&v12, 0x16u);

    }
    v4->_eligibleForSearch = v3;
  }
  if (v3)
  {
    -[UAUserActivity manager](v4, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userActivityIsActive:", v4);

    if (v11)
      -[UAUserActivity indexActivity:forceIndexing:](v4, "indexActivity:forceIndexing:", 1, 0.0);
  }
  objc_sync_exit(v4);

}

- (void)setTitle:(id)a3
{
  objc_object *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  UAUserActivity *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSString *title;
  void *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (objc_object *)a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "setTitle(%{public}@)", (uint8_t *)&v15, 0xCu);

  }
  v8 = self;
  objc_sync_enter(v8);
  if (differ(v4, (objc_object *)v8->_title))
  {
    biomeInfoLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](v8, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_INFO, "%{public}@ SET-TITLE", (uint8_t *)&v15, 0xCu);

    }
    v11 = -[objc_object copy](v4, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v11;

    -[UAUserActivity setDirty:](v8, "setDirty:", 1);
    -[UAUserActivity manager](v8, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userActivityIsActive:", v8);

    if (v14)
      -[UAUserActivity indexActivity:forceIndexing:](v8, "indexActivity:forceIndexing:", 1, 0.5);
  }
  objc_sync_exit(v8);

}

+ (void)fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchUUID:intervalToWaitForDocumentSynchonization:withCompletionHandler:", v8, v5, 3.40282347e38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

}

- (BOOL)createUserActivityStringsWithSaving:(BOOL)a3 options:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  _QWORD block[5];
  id v14;
  BOOL v15;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (v6 && -[UAUserActivity needsSave](self, "needsSave"))
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke;
    block[3] = &unk_1E6006FC0;
    block[4] = self;
    v15 = v6;
    v14 = v9;
    dispatch_async(v10, block);

    v11 = 1;
  }
  else
  {
    v11 = -[UAUserActivity _encodeIntoUserActivityStringWithSave:completionHandler:](self, "_encodeIntoUserActivityStringWithSave:completionHandler:", 0, v9);
  }

  return v11;
}

- (BOOL)_encodeIntoUserActivityStringWithSave:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  v6 = a4;
  if (v4)
    dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  -[UAUserActivity callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:](self, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", v4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_createUserActivityStrings:secondaryString:optionalData:", v8, v9, v10);
    if (!v8 || !objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -114, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, 0, v11);
LABEL_17:

      goto LABEL_18;
    }
    v11 = (void *)objc_msgSend(v8, "copy");
    if (v9 && objc_msgSend(v9, "length"))
    {
      v12 = (void *)objc_msgSend(v9, "copy");
      v13 = 1;
      if (!v10)
      {
LABEL_9:
        v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v13 = 0;
      v12 = 0;
      if (!v10)
        goto LABEL_9;
    }
    if (objc_msgSend(v10, "length"))
      v14 = v10;
    else
      v14 = 0;
LABEL_15:
    (*((void (**)(id, void *, void *, void *, _QWORD))v6 + 2))(v6, v11, v12, v14, 0);
    if (v13)

    goto LABEL_17;
  }
LABEL_18:

  return v7 != 0;
}

char *__102__UAUserActivity_initDynamicActivityWithTypeIdentifier_dynamicIdentifier_suggestedActionType_options___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  void *v11;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_sync_enter(WeakRetained);
  uaUserActivityObjectsMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  uaUserActivityObjectsMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v3);

  if (v7 == v8)
  {
    v10 = objc_loadWeakRetained(v3);
    objc_msgSend(v10, "stateString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = serializedCFType(v11);

  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(v5);

  objc_sync_exit(WeakRetained);
  objc_autoreleasePoolPop(v2);
  return v9;
}

- (id)stateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[UAUserActivity delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UAUserActivity dirty](self, "dirty");
  v10 = "(delegate) ";
  v11 = "";
  if (!v8)
    v10 = "";
  if (v9)
    v11 = "dirty ";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ userInfo.count=%ld %s%s"), v5, v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "copy");
  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  UAUserActivity *v14;
  void *v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  biomeInfoLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v4;
    v25 = 2050;
    v26 = -[UAUserActivity userInfoChangeCount](self, "userInfoChangeCount");
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "%{public}@ RELEASED changeCount=%{public}ld", buf, 0x16u);

  }
  -[UAUserActivity manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeUserActivity:", self);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  getUserActivityObserversCopy();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        -[UAUserActivity parentUserActivity](self, "parentUserActivity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = objc_opt_respondsToSelector();

          if ((v12 & 1) != 0)
          {
            -[UAUserActivity parentUserActivity](self, "parentUserActivity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "userActivityWillBeDestroyed:", v13);

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  setIndexPendingForUUID(0, self->_uniqueIdentifier);
  v14 = self;
  objc_sync_enter(v14);
  uaUserActivityObjectsMap();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v15);
  uaUserActivityObjectsMap();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", self->_uniqueIdentifier);

  objc_sync_exit(v15);
  objc_sync_exit(v14);

  if (v14->_os_state_handler)
  {
    os_state_remove_handler();
    v14->_os_state_handler = 0;
  }
  objc_storeWeak((id *)&v14->_manager, 0);
  v14->_delegate = 0;
  v17.receiver = v14;
  v17.super_class = (Class)UAUserActivity;
  -[UAUserActivity dealloc](&v17, sel_dealloc);
}

void __28__UAUserActivity_invalidate__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;

  v2 = *(id **)(a1 + 32);
  if (v2[6])
  {
    objc_msgSend(v2[6], "stop");
    v2 = *(id **)(a1 + 32);
  }
  objc_msgSend(v2, "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeUserActivity:", *(_QWORD *)(a1 + 32));

}

- (unint64_t)userInfoChangeCount
{
  UAUserActivity *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned int userInfoChangeCount;
  unint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  UAUserActivity *v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](v2, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    userInfoChangeCount = v2->_userInfoChangeCount;
    v9 = 138543875;
    v10 = v5;
    v11 = 2113;
    v12 = v2;
    v13 = 1024;
    v14 = userInfoChangeCount;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "UAUserActivity:%{public}@/%{private}@, userInfoChangeCount = %d", (uint8_t *)&v9, 0x1Cu);

  }
  v7 = v2->_userInfoChangeCount;
  objc_sync_exit(v2);

  return v7;
}

void __90__UAUserActivity_UAUserActivityCoreSpotlightIndexingSupport__indexActivity_forceIndexing___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  _BYTE *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5DFD11C]();
  if (+[UAUserActivity isIndexPendingForUUID:](UAUserActivity, "isIndexPendingForUUID:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "userActivityForUUID:", *(_QWORD *)(a1 + 32));
    v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3
      && (objc_msgSend(v3, "isInvalidated") & 1) == 0
      && objc_msgSend(v4, "forwardToCoreSpotlightIndexer")
      && objc_msgSend(*(id *)(a1 + 40), "userActivityIsActive:", v4))
    {
      v4[114] = 1;
      v5 = (void *)objc_msgSend(v4, "copyWithNewUUID:", 1);
      objc_msgSend(v5, "setEligibleForHandoff:", 0);
      v4[114] = 0;
      biomeInfoLogging();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v7;
        v12 = 2114;
        v13 = v8;
        _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "%{public}@ COPYFORINDEXING %{public}@", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSentToIndexerDate:", v9);

      objc_msgSend(v5, "sendToCoreSpotlightIndexer");
    }

  }
  +[UAUserActivity setIndexPending:forUUID:](UAUserActivity, "setIndexPending:forUUID:", 0, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)indexActivity:(double)a3 forceIndexing:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  dispatch_time_t v23;
  NSObject *v24;
  UAUserActivity *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD block[4];
  UAUserActivity *v36;
  NSObject *v37;
  UAUserActivity *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = "NO";
    *(_DWORD *)buf = 138543874;
    v40 = v9;
    if (v4)
      v10 = "YES";
    v41 = 2048;
    v42 = a3;
    v43 = 2082;
    v44 = v10;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "indexActivity(%{public}@} delay=%f forceIndexing:%{public}s", buf, 0x20u);

  }
  if (self->_indexInProcess)
  {
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v13;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "indexActivity: %{public}@, _indexInProcess == YES so doing nothing.,", buf, 0xCu);

    }
  }
  else if (-[UAUserActivity forwardToCoreSpotlightIndexer](self, "forwardToCoreSpotlightIndexer")
         && (v4
          || -[UAUserActivity dirty](self, "dirty")
          && (a3 <= 0.0
           || (-[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier"),
               v26 = (void *)objc_claimAutoreleasedReturnValue(),
               v27 = +[UAUserActivity isIndexPendingForUUID:](UAUserActivity, "isIndexPendingForUUID:", v26), v26, !v27))))
  {
    -[UAUserActivity manager](self, "manager");
    v11 = objc_claimAutoreleasedReturnValue();
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UAUserActivity needsSave](self, "needsSave")
      || -[UAUserActivity dirty](self, "dirty")
      || (-[UAUserActivity dirtyPayloadIdentifiers](self, "dirtyPayloadIdentifiers"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "count") == 0,
          v15,
          !v16))
    {
      +[UAUserActivity setIndexPending:forUUID:](UAUserActivity, "setIndexPending:forUUID:", 1, v14);
      biomeInfoLogging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v18;
        _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_INFO, "%{public}@ INDEX-UPDATEUSERINFO", buf, 0xCu);

      }
      _uaGetLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "UUIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v21;
        v41 = 2048;
        v42 = a3;
        _os_log_impl(&dword_1AF7EB000, v19, OS_LOG_TYPE_DEBUG, "indexActivity: %{public}@, Deferred %g seconds, because .dirty == YES", buf, 0x16u);

      }
      v22 = a3 * 1000000000.0;
      if (a3 < 0.0)
        v22 = 0.0;
      v23 = dispatch_time(0, (uint64_t)v22);
      if (getDeferredIndexingQueue(void)::sOnce != -1)
        dispatch_once(&getDeferredIndexingQueue(void)::sOnce, &__block_literal_global_32);
      v24 = getDeferredIndexingQueue(void)::sQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__UAUserActivity_UAUserActivityCoreSpotlightIndexingSupport__indexActivity_forceIndexing___block_invoke;
      block[3] = &unk_1E6006E38;
      v36 = v14;
      v37 = v11;
      v38 = self;
      dispatch_after(v23, v24, block);

      v25 = v36;
    }
    else
    {
      v25 = self;
      objc_sync_enter(v25);
      self->_indexInProcess = 1;
      _uaGetLogForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        -[UAUserActivity uniqueIdentifier](v25, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v32;
        _os_log_impl(&dword_1AF7EB000, v30, OS_LOG_TYPE_DEBUG, "indexActivity: Immediate, %{public}@ because .needsSave == NO", buf, 0xCu);

      }
      v33 = -[UAUserActivity copyWithNewUUID:](v25, "copyWithNewUUID:", 0);
      self->_indexInProcess = 0;
      if (v33)
      {
        v34 = (void *)objc_opt_new();
        objc_msgSend(v33, "setSentToIndexerDate:", v34);

        objc_msgSend(v33, "sendToCoreSpotlightIndexer");
      }

      objc_sync_exit(v25);
    }

  }
  else
  {
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v29;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "indexActivity: Ignoring, because this activity %{public}@ doesn't seem to need indexing", buf, 0xCu);

    }
  }

}

+ (void)setIndexPending:(BOOL)a3 forUUID:(id)a4
{
  setIndexPendingForUUID(a3, (NSUUID *)a4);
}

- (void)setEligibleForHandoff:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  UAUserActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForHandoff != v3)
  {
    obj->_eligibleForHandoff = v3;
    -[UAUserActivity setDirty:](obj, "setDirty:", 1);
    -[UAUserActivity setForceImmediateSendToServer:](obj, "setForceImmediateSendToServer:", 1);
    -[UAUserActivity manager](obj, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userActivityIsActive:", obj);

    if (v5)
      -[UAUserActivity scheduleSendUserActivityInfoToLSUserActivityd](obj, "scheduleSendUserActivityInfoToLSUserActivityd");
  }
  objc_sync_exit(obj);

}

- (void)setForceImmediateSendToServer:(BOOL)a3
{
  self->_forceImmediateSendToServer = a3;
}

- (id)copyWithNewUUID:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  UAUserActivity *v21;
  _BOOL4 needsSave;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  UAUserActivity *v27;
  NSObject *v28;
  void *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD block[5];
  id v80;
  uint8_t v81[128];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v3 = a3;
  v86 = *MEMORY[0x1E0C80C00];
  v5 = [UAUserActivity alloc];
  -[UAUserActivity typeIdentifier](self, "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity dynamicIdentifier](self, "dynamicIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UAUserActivity suggestedActionType](self, "suggestedActionType");
  -[UAUserActivity options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UAUserActivity initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:](v5, "initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:", v6, v7, v8, v9);

  if (-[UAUserActivity isInvalidated](self, "isInvalidated"))
  {
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v13;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_ERROR, "copyWithNewUUID:%{public}@, unable to copy because this object has been invalidated.", buf, 0xCu);

    }
    v14 = 0;
LABEL_40:

    return v14;
  }
  if (-[UAUserActivity needsSave](self, "needsSave")
    || (-[UAUserActivity dirtyPayloadIdentifiers](self, "dirtyPayloadIdentifiers"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v16))
  {
    _uaGetLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (v3)
        v18 = "-callDelegate-";
      else
        v18 = "-noDelegateCall-";
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v83 = v18;
      v84 = 2114;
      v85 = v20;
      _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_DEBUG, "copyWithNewUUID:%{public}s (%{public}@), calling delegate because .needSave == YES or it has dirty payloads", buf, 0x16u);

    }
    v21 = self;
    objc_sync_enter(v21);
    needsSave = v21->_needsSave;
    *(_WORD *)&v21->_needsSave = 0;
    objc_sync_exit(v21);

    -[UAUserActivity delegate](v21, "delegate");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v3)
    {
      if (needsSave && v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UAUserActivity willCallSaveSerializationQueue](v21, "willCallSaveSerializationQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_not_V2(v25);

        dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
        -[UAUserActivity willCallSaveSerializationQueue](v21, "willCallSaveSerializationQueue");
        v26 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__UAUserActivity_Internal__copyWithNewUUID___block_invoke;
        block[3] = &unk_1E6006DE8;
        block[4] = v21;
        v80 = v24;
        dispatch_sync(v26, block);

      }
    }
    else
    {

      v10 = 0;
    }

  }
  if (v10)
  {
    v10 = v10;
    objc_sync_enter(v10);
    v27 = self;
    objc_sync_enter(v27);
    _uaGetLogForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity uniqueIdentifier](v27, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v30 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v30;
      v84 = 2114;
      v85 = v32;
      _os_log_impl(&dword_1AF7EB000, v28, OS_LOG_TYPE_DEBUG, "copyWithNewUUID(%{public}@), copying all properties over to new object %{public}@", buf, 0x16u);

    }
    -[UAUserActivity originalUniqueIdentifier](v27, "originalUniqueIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      -[UAUserActivity uniqueIdentifier](v27, "uniqueIdentifier");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)*((_QWORD *)v10 + 44);
    *((_QWORD *)v10 + 44) = v35;

    -[UAUserActivity title](v27, "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    v39 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v38;

    -[UAUserActivity userInfo](v27, "userInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      -[UAUserActivity userInfo](v27, "userInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count") == 0;

      if (!v42)
      {
        -[UAUserActivity userInfo](v27, "userInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "copy");
        v45 = (void *)*((_QWORD *)v10 + 36);
        *((_QWORD *)v10 + 36) = v44;

      }
    }
    v46 = -[NSURL copy](v27->_webpageURL, "copy");
    v47 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v46;

    v48 = -[NSURL copy](v27->_referrerURL, "copy");
    v49 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = v48;

    v10[235] = 0;
    v10[109] = 0;
    *(_WORD *)(v10 + 107) = 0;
    v10[180] = -[UAUserActivity isEligibleForHandoff](v27, "isEligibleForHandoff");
    v10[183] = -[UAUserActivity isEligibleForPublicIndexing](v27, "isEligibleForPublicIndexing");
    v10[181] = -[UAUserActivity isEligibleForSearch](v27, "isEligibleForSearch");
    v10[182] = -[UAUserActivity isEligibleForReminders](v27, "isEligibleForReminders");
    v10[184] = -[UAUserActivity isEligibleForPrediction](v27, "isEligibleForPrediction");
    -[UAUserActivity persistentIdentifier](v27, "persistentIdentifier");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)*((_QWORD *)v10 + 24);
    *((_QWORD *)v10 + 24) = v50;

    -[UAUserActivity keywords](v27, "keywords");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "copy");
    v54 = (void *)*((_QWORD *)v10 + 16);
    *((_QWORD *)v10 + 16) = v53;

    -[UAUserActivity requiredUserInfoKeys](v27, "requiredUserInfoKeys");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "copy");
    v57 = (void *)*((_QWORD *)v10 + 19);
    *((_QWORD *)v10 + 19) = v56;

    v10[234] = -[UAUserActivity isUniversalLink](v27, "isUniversalLink");
    -[UAUserActivity contentUserAction](v27, "contentUserAction");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "copy");
    v60 = (void *)*((_QWORD *)v10 + 18);
    *((_QWORD *)v10 + 18) = v59;

    -[UAUserActivity expirationDate](v27, "expirationDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "copy");
    v63 = (void *)*((_QWORD *)v10 + 17);
    *((_QWORD *)v10 + 17) = v62;

    -[UAUserActivity madeCurrentDate](v27, "madeCurrentDate");
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)*((_QWORD *)v10 + 30);
    *((_QWORD *)v10 + 30) = v64;

    -[UAUserActivity madeCurrentEndDate](v27, "madeCurrentEndDate");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)*((_QWORD *)v10 + 31);
    *((_QWORD *)v10 + 31) = v66;

    *((_QWORD *)v10 + 32) = *(_QWORD *)&v27->_madeCurrentInterval;
    objc_storeStrong((id *)v10 + 33, v27->_madeInitiallyCurrentDate);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[UAUserActivity payloadIdentifiers](v27, "payloadIdentifiers", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    if (v69)
    {
      v70 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v76 != v70)
            objc_enumerationMutation(v68);
          v72 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          if ((objc_msgSend(v72, "isEqual:", CFSTR("UAUserActivityUserInfoPayload")) & 1) == 0
            && (objc_msgSend(v72, "isEqual:", CFSTR("UAUserActivityStreamsPayload")) & 1) == 0)
          {
            -[UAUserActivity payloadForIdentifier:](v27, "payloadForIdentifier:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setPayload:object:identifier:dirty:", v73, 0, v72, 0);

          }
        }
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      }
      while (v69);
    }

    *((_QWORD *)v10 + 25) = 0;
    v10[104] = 0;
    v10[106] = 0;
    objc_sync_exit(v27);

    objc_sync_exit(v10);
    v14 = v10;
    goto LABEL_40;
  }
  return 0;
}

- (NSDictionary)userInfo
{
  UAUserActivity *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSDictionary copy](v2->_userInfo, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3 suggestedActionType:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  UAUserActivity *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _uaGetLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    trimmedString(v8, 0x80u);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    suggestedActionTypeString(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    userActivityInfoOptionsDictionaryString(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138478339;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_DEBUG, "CREATING UAUserActivity/initWithTypeIdentifier:%{private}@ type:%{public}@ options=%{public}@)", (uint8_t *)&v17, 0x20u);

  }
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    _uaGetLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1AF7EB000, v14, OS_LOG_TYPE_ERROR, "*** UserActivity: passed nil or the empty string for activityType, which is an error.", (uint8_t *)&v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Caller did not provide an activityType, and this process does not have a NSUserActivityTypes in its Info.plist."));
  }
  v15 = -[UAUserActivity initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:](self, "initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:", v8, 0, a4, v9);

  return v15;
}

- (NSUUID)originalUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 352, 1);
}

- (NSDate)madeCurrentEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (NSDate)madeCurrentDate
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDirty:(BOOL)a3 identifier:(id)a4
{
  _BOOL4 v4;
  UAUserActivity *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if (v4)
  {
    -[UAUserActivity dirtyPayloadIdentifiers](v6, "dirtyPayloadIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity setDirtyPayloadIdentifiers:](v6, "setDirtyPayloadIdentifiers:", v8);

    }
    -[UAUserActivity dirtyPayloadIdentifiers](v6, "dirtyPayloadIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);
  }
  else
  {
    -[UAUserActivity dirtyPayloadIdentifiers](v6, "dirtyPayloadIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v10);
  }

  objc_sync_exit(v6);
}

- (NSMutableSet)dirtyPayloadIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

+ (BOOL)isIndexPendingForUUID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  getIndexPendingQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___ZL21isIndexPendingForUUIDP6NSUUID_block_invoke;
  v7[3] = &unk_1E6007130;
  v8 = v3;
  v9 = &v10;
  v5 = v3;
  dispatch_sync(v4, v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)setDirtyPayloadIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setSentToIndexerDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void)setNeedsSave:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _BOOL4 needsSaveValueAtEndOfWillSaveCallback;
  const char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _BOOL4 needsSave;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  _BYTE v28[24];
  const char *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_inWillSaveCallback)
  {
    if (-[UAUserActivity forceImmediateSendToServer](v4, "forceImmediateSendToServer"))
    {
      _uaGetLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v14;
        _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEBUG, "setNeedsSave:(%{public}@), since self.forceImmediateSendToServer == YES doing an immediate call to the server to mark this item as dirty.", v28, 0xCu);

      }
      biomeInfoLogging();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        needsSave = v4->_needsSave;
        *(_DWORD *)v28 = 138544130;
        *(_QWORD *)&v28[4] = v16;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v3;
        *(_WORD *)&v28[18] = 1024;
        *(_DWORD *)&v28[20] = needsSave;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = 1;
        _os_log_impl(&dword_1AF7EB000, v15, OS_LOG_TYPE_INFO, "%{public}@ SET-NEEDSSAVE\t%{BOOL}d was=%{BOOL}d force=%{BOOL}d", v28, 0x1Eu);

      }
      v4->_needsSave = v3;
      -[UAUserActivity setForceImmediateSendToServer:](v4, "setForceImmediateSendToServer:", 0);
    }
    else
    {
      if (v4->_needsSave == v3)
        goto LABEL_29;
      _uaGetLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = "NO";
        v23 = v4->_needsSave;
        if (v3)
          v24 = "YES";
        else
          v24 = "NO";
        *(_DWORD *)v28 = 138543874;
        *(_QWORD *)&v28[4] = v20;
        *(_WORD *)&v28[12] = 2082;
        if (v23)
          v22 = "YES";
        *(_QWORD *)&v28[14] = v24;
        *(_WORD *)&v28[22] = 2082;
        v29 = v22;
        _os_log_impl(&dword_1AF7EB000, v18, OS_LOG_TYPE_DEBUG, "setNeedsSave:(%{public}@ => %{public}s, (was %{public}s) and .dirty = YES", v28, 0x20u);

      }
      biomeInfoLogging();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v4->_needsSave;
        *(_DWORD *)v28 = 138543874;
        *(_QWORD *)&v28[4] = v26;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v3;
        *(_WORD *)&v28[18] = 1024;
        *(_DWORD *)&v28[20] = v27;
        _os_log_impl(&dword_1AF7EB000, v25, OS_LOG_TYPE_INFO, "%{public}@ SET-NEEDSSAVE\t%{BOOL}d was=%{BOOL}d", v28, 0x18u);

      }
      v4->_needsSave = v3;
    }
    -[UAUserActivity setDirty:](v4, "setDirty:", 1, *(_OWORD *)v28);
    goto LABEL_29;
  }
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "NO";
    needsSaveValueAtEndOfWillSaveCallback = v4->_needsSaveValueAtEndOfWillSaveCallback;
    if (v3)
      v11 = "YES";
    else
      v11 = "NO";
    *(_DWORD *)v28 = 138543874;
    *(_QWORD *)&v28[4] = v7;
    *(_WORD *)&v28[12] = 2082;
    if (needsSaveValueAtEndOfWillSaveCallback)
      v9 = "YES";
    *(_QWORD *)&v28[14] = v11;
    *(_WORD *)&v28[22] = 2082;
    v29 = v9;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "setNeedsSave:(%{public}@) => %{public}s, but in willSave callback, so setting _needsSaveValueAtEndOfWillSaveCallback (was %{public}s", v28, 0x20u);

  }
  if (v3)
    v4->_needsSaveValueAtEndOfWillSaveCallback = 1;
LABEL_29:
  objc_sync_exit(v4);

}

+ (id)currentUserActivityUUID
{
  void *v2;
  void *v3;

  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeUserActivityUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)deleteAllSavedUserActivitiesWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  getCSSearchableIndexClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class defaultSearchableIndex](getCSSearchableIndexClass(), "defaultSearchableIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mainBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "Deleting all saved useractivities", buf, 2u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __95__UAUserActivity_UAUserActivitySiriActions__deleteAllSavedUserActivitiesWithCompletionHandler___block_invoke;
      v10[3] = &unk_1E60075A8;
      v11 = v4;
      objc_msgSend(v5, "deleteAllUserActivities:completionHandler:", v6, v10);

    }
    else
    {
      _uaGetLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
      }

      v4[2](v4);
    }

  }
  else
  {
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
    }

    v4[2](v4);
  }

}

- (void)setPayload:(id)a3 object:(id)a4 identifier:(id)a5 dirty:(BOOL)a6
{
  id v9;
  UAUserActivity *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v26 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v28 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[UAUserActivity setPayloadIdentifier:object:withBlock:](v10, "setPayloadIdentifier:object:withBlock:", v9, 0, 0);
    if (v28)
    {
      -[UAUserActivity payloadObjects](v10, "payloadObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[UAUserActivity setPayloadObjects:](v10, "setPayloadObjects:", v12);

      }
      -[UAUserActivity payloadObjects](v10, "payloadObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v28, v9);
    }
    else
    {
      -[UAUserActivity payloadObjects](v10, "payloadObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v9);
    }

    if (v27)
    {
      -[UAUserActivity payloadDataCache](v10, "payloadDataCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[UAUserActivity setPayloadDataCache:](v10, "setPayloadDataCache:", v15);

      }
      -[UAUserActivity payloadDataCache](v10, "payloadDataCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v27, "copy");
      objc_msgSend(v16, "setObject:forKey:", v17, v9);

    }
    else
    {
      -[UAUserActivity payloadDataCache](v10, "payloadDataCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v9);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend((id)objc_opt_class(), "observers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v30;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v21);
          -[UAUserActivity parentUserActivity](v10, "parentUserActivity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = objc_opt_respondsToSelector();

            if ((v24 & 1) != 0)
            {
              -[UAUserActivity parentUserActivity](v10, "parentUserActivity");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "userActivityPayloadWasChanged:payloadIdentifier:", v25, v9);

            }
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    -[UAUserActivity setDirty:identifier:](v10, "setDirty:identifier:", v26, v9);
    objc_sync_exit(v10);

  }
}

- (void)sendToCoreSpotlightIndexer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  getCSSearchableIndexClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _uaGetLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity typeIdentifier](self, "typeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity payloadForIdentifier:](self, "payloadForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[UAUserActivity payloadForIdentifier:](self, "payloadForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        trimmedHexStringForData(v8, 64);
      }
      else
      {
        -[UAUserActivity contentAttributeSet](self, "contentAttributeSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        stringForContentSet(v8);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543875;
      v16 = v5;
      v17 = 2113;
      v18 = v6;
      v19 = 2113;
      v20 = v9;
      _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "INDEXING:%{public}@/%{private}@, attrs=%{private}@", (uint8_t *)&v15, 0x20u);

    }
    biomeInfoLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_INFO, "%{public}@ SENDTOCORESPOTLIGHT", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend((id)getCSSearchableIndexClass(), "defaultSearchableIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc((Class)getNSUserActivityClass()), "initWithInternalUserActivity:", self);
      objc_msgSend(v12, "indexUserActivity:", v13);
      -[UAUserActivity manager](self, "manager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "registerForApplicationDeactivateIfNecessary");

    }
  }
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  UAUserActivity *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[UAUserActivity objectForIdentifier:](v2, "objectForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UAUserActivity payloadForIdentifier:](v2, "payloadForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
      getCSSearchableItemAttributeSetClass();
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        -[UAUserActivity setContentAttributeSet:](v2, "setContentAttributeSet:", v3);
    }
    else
    {
      v3 = 0;
    }

  }
  objc_sync_exit(v2);

  return (CSSearchableItemAttributeSet *)v3;
}

- (void)setContentAttributeSet:(id)a3
{
  id v4;
  UAUserActivity *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _uaGetLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543619;
    v18 = v8;
    v19 = 2113;
    v20 = v4;
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "setContentAttributeSet(%{public}@,%{private}@))", (uint8_t *)&v17, 0x16u);

  }
  -[UAUserActivity objectForIdentifier:](v5, "objectForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v4 || !v9)
  {
    if (v4 && !v9 || v4 && (objc_msgSend(v4, "isEqual:", v9) & 1) == 0)
    {
      biomeInfoLogging();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v12;
        _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_INFO, "%{public}@ SETCONTENTATTRIBUTESET", (uint8_t *)&v17, 0xCu);

      }
      v13 = (void *)objc_msgSend(v4, "copy");
      -[UAUserActivity setPayloadIdentifier:object:withBlock:](v5, "setPayloadIdentifier:object:withBlock:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"), v13, &__block_literal_global_0);

      -[UAUserActivity setDirty:](v5, "setDirty:", 1);
    }
  }
  else
  {
    -[UAUserActivity setPayload:object:identifier:](v5, "setPayload:object:identifier:", 0, 0, CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
  }

  objc_sync_exit(v5);
  -[UAUserActivity manager](v5, "manager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userActivityIsActive:", v5);

  if (v15)
  {
    -[UAUserActivity manager](v5, "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerForApplicationDeactivateIfNecessary");

    -[UAUserActivity indexActivity:forceIndexing:](v5, "indexActivity:forceIndexing:", 1, 0.5);
  }

}

- (void)setPayloadIdentifier:(id)a3 object:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  UAUserActivity *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (v23)
  {
    v10 = self;
    objc_sync_enter(v10);
    if (v9)
    {
      if (v8)
      {
        -[UAUserActivity payloadObjects](v10, "payloadObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UAUserActivity setPayloadObjects:](v10, "setPayloadObjects:", v12);

        }
        -[UAUserActivity payloadObjects](v10, "payloadObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v8, v23);
      }
      else
      {
        -[UAUserActivity payloadObjects](v10, "payloadObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v23);
      }

      -[UAUserActivity payloadUpdateBlocks](v10, "payloadUpdateBlocks");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[UAUserActivity setPayloadUpdateBlocks:](v10, "setPayloadUpdateBlocks:", v20);

      }
      -[UAUserActivity payloadUpdateBlocks](v10, "payloadUpdateBlocks");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = _Block_copy(v9);
      objc_msgSend(v21, "setObject:forKey:", v22, v23);

      -[UAUserActivity setDirty:identifier:](v10, "setDirty:identifier:", 1, v23);
    }
    else
    {
      -[UAUserActivity payloadObjects](v10, "payloadObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v23);

      -[UAUserActivity payloadUpdateBlocks](v10, "payloadUpdateBlocks");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[UAUserActivity payloadUpdateBlocks](v10, "payloadUpdateBlocks");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v23);

      }
      -[UAUserActivity dirtyPayloadIdentifiers](v10, "dirtyPayloadIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObject:", v23);

    }
    objc_sync_exit(v10);

  }
}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  UAUserActivity *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[UAUserActivity payloadObjects](v5, "payloadObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (NSMutableDictionary)payloadObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setPayloadUpdateBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (void)setPayloadObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (void)setPayloadDataCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

+ (id)mainBundleIdentifier
{
  if (mainBundleIdentifier_sOnce != -1)
    dispatch_once(&mainBundleIdentifier_sOnce, &__block_literal_global_10);
  return (id)mainBundleIdentifier_bundleIdentifier;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 needsSave;
  _BOOL4 dirty;
  _BOOL4 activityHasBeenSentToServer;
  UAUserActivity *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  _QWORD block[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  _BYTE v35[10];
  const __CFString *v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivity description](self, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UAUserActivity isInvalidated](self, "isInvalidated");
    v8 = &stru_1E60084E8;
    *(_DWORD *)buf = 138543875;
    v33 = v5;
    if (v7)
      v8 = CFSTR(" (was already invalidated)");
    v34 = 2113;
    *(_QWORD *)v35 = v6;
    *(_WORD *)&v35[8] = 2114;
    v36 = v8;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "Invalidate activity %{public}@ (%{private}@)%{public}@", buf, 0x20u);

  }
  if (!-[UAUserActivity isInvalidated](self, "isInvalidated"))
  {
    biomeInfoLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity manager](self, "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userActivityIsActive:", self);
      needsSave = self->_needsSave;
      dirty = self->_dirty;
      activityHasBeenSentToServer = self->_activityHasBeenSentToServer;
      *(_DWORD *)buf = 138544386;
      v33 = v10;
      v34 = 1024;
      *(_DWORD *)v35 = v12;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = needsSave;
      LOWORD(v36) = 1024;
      *(_DWORD *)((char *)&v36 + 2) = dirty;
      HIWORD(v36) = 1024;
      v37 = activityHasBeenSentToServer;
      _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_INFO, "%{public}@ INVALIDATE\twasCurrent=%{BOOL}d needsSave=%{BOOL}d dirty=%{BOOL}d sendToServer=%{BOOL}d", buf, 0x24u);

    }
    v16 = self;
    objc_sync_enter(v16);
    v16->_invalidated = 1;
    objc_sync_exit(v16);

    -[UAUserActivity setDelegate:](v16, "setDelegate:", 0);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    getUserActivityObserversCopy();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v20);
          -[UAUserActivity parentUserActivity](v16, "parentUserActivity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = objc_opt_respondsToSelector();

            if ((v23 & 1) != 0)
            {
              -[UAUserActivity parentUserActivity](v16, "parentUserActivity");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "userActivityWasInvalidated:", v24);

            }
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    dispatch_get_global_queue(0, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__UAUserActivity_invalidate__block_invoke;
    block[3] = &unk_1E6006AA0;
    block[4] = v16;
    dispatch_async(v25, block);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)finishUserInfoUpdate
{
  UAUserActivity *v2;
  NSDictionary *savedUserInfo;
  NSDictionary *v4;

  v2 = self;
  objc_sync_enter(v2);
  savedUserInfo = v2->_savedUserInfo;
  if (savedUserInfo)
  {
    objc_storeStrong((id *)&v2->_userInfo, v2->_savedUserInfo);
    v4 = v2->_savedUserInfo;
    v2->_savedUserInfo = 0;

  }
  objc_sync_exit(v2);

  return savedUserInfo == 0;
}

- (void)tellDaemonAboutNewLSUserActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSUUID *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSUUID *uniqueIdentifier;
  UAUserActivity *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "Sending activity %{public}@ information to server", (uint8_t *)&v14, 0xCu);

  }
  if (self->_createsNewUUIDIfSaved)
  {
    -[UAUserActivity manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeUserActivity:", self);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[NSUUID UUIDString](self->_uniqueIdentifier, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUUID UUIDString](v7, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "-- Allocating a new UUID for this activity, old=%{public}@ new=%{public}@", (uint8_t *)&v14, 0x16u);

    }
    uniqueIdentifier = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v7;

  }
  v12 = self;
  objc_sync_enter(v12);
  v12->_activityHasBeenSentToServer = 1;
  objc_sync_exit(v12);

  -[UAUserActivity manager](v12, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tellDaemonAboutNewLSUserActivity:", v12);

}

- (unint64_t)beginUserInfoUpdate:(id)a3
{
  id v4;
  UAUserActivity *v5;
  uint64_t v6;
  NSDictionary *userInfo;
  unint64_t userInfoChangeCount;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_savedUserInfo)
  {
    objc_storeStrong((id *)&v5->_savedUserInfo, v5->_userInfo);
    if (v4)
      v6 = objc_msgSend(v4, "copy");
    else
      v6 = 0;
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v6;

  }
  userInfoChangeCount = v5->_userInfoChangeCount;
  objc_sync_exit(v5);

  return userInfoChangeCount;
}

void __65__UAUserActivity_UAUserActivitySiriActions__mainBundleIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mainBundleIdentifier_bundleIdentifier;
  mainBundleIdentifier_bundleIdentifier = v0;

}

- (void)setRequiredUserInfoKeys:(id)a3
{
  UAUserActivity *v4;
  uint64_t v5;
  NSSet *requiredUserInfoKeys;
  NSDictionary *savedUserInfo;
  objc_object *v8;

  v8 = (objc_object *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (differ(v8, (objc_object *)v4->_requiredUserInfoKeys))
  {
    v5 = (uint64_t)v8;
    if (v8)
      v5 = -[objc_object copy](v8, "copy");
    requiredUserInfoKeys = v4->_requiredUserInfoKeys;
    v4->_requiredUserInfoKeys = (NSSet *)v5;

    savedUserInfo = v4->_savedUserInfo;
    v4->_savedUserInfo = 0;

    -[UAUserActivity setDirty:](v4, "setDirty:", 1);
  }
  objc_sync_exit(v4);

}

- (void)setPersistentIdentifier:(id)a3
{
  NSString *v4;
  UAUserActivity *v5;
  NSString *persistentIdentifier;
  NSString *v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  persistentIdentifier = v5->_persistentIdentifier;
  if (persistentIdentifier == v4)
  {
    if (!v4 || !-[NSString isEqual:](v4, "isEqual:", v4))
      goto LABEL_12;
    persistentIdentifier = v5->_persistentIdentifier;
  }
  v7 = persistentIdentifier;
  v8 = -[NSString copy](v4, "copy");
  v9 = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v8;

  -[UAUserActivity setDirty:](v5, "setDirty:", 1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[UAUserActivity observers](UAUserActivity, "observers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UAUserActivity parentUserActivity](v5, "parentUserActivity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "userActivityPersistentIdentifierWasChanged:persistentIdentifier:previousValue:", v15, v4, v7);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

LABEL_12:
  objc_sync_exit(v5);

}

- (void)setEligibleForPublicIndexing:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForPublicIndexing != v3)
  {
    obj->_eligibleForPublicIndexing = v3;
    -[UAUserActivity setDirty:](obj, "setDirty:", 1);
  }
  objc_sync_exit(obj);

}

- (void)setKeywords:(id)a3
{
  objc_object *v4;
  uint64_t v5;
  UAUserActivity *v6;
  uint64_t v7;
  NSSet *keywords;
  objc_object *v9;

  v4 = (objc_object *)a3;
  if (v4)
  {
    v9 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v5 = objc_claimAutoreleasedReturnValue();

      v9 = (objc_object *)v5;
    }
  }
  else
  {
    v9 = 0;
  }
  v6 = self;
  objc_sync_enter(v6);
  if (differ(v9, (objc_object *)v6->_keywords))
  {
    if (v9)
    {
      v7 = -[objc_object copy](v9, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    keywords = v6->_keywords;
    v6->_keywords = (NSSet *)v7;

    -[UAUserActivity setDirty:](v6, "setDirty:", 1);
  }
  objc_sync_exit(v6);

}

uint64_t __44__UAUserActivity_Internal__copyWithNewUUID___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  objc_sync_exit(v2);

  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v13 = 138543619;
    v14 = v5;
    v15 = 2113;
    v16 = v6;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "in async block, calling willSynchronizeActivity. self=%{public}@/%{private}@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "willSynchronizeActivity");
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105);
  objc_sync_exit(v7);

  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v13 = 138543619;
    v14 = v10;
    v15 = 2113;
    v16 = v11;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "in async block, back from willSynchronizeActivity. self=%{public}@/%{private}@", (uint8_t *)&v13, 0x16u);

  }
  return 0;
}

void __95__UAUserActivity_UAUserActivitySiriActions__deleteAllSavedUserActivitiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v3;
      v6 = "Error deleting saved items: %{public}@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1AF7EB000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    v6 = "Deleted saved user activities";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v10);
}

- (void)setContentUserAction:(id)a3
{
  UAUserActivity *v4;
  uint64_t v5;
  NSString *contentUserAction;
  objc_object *v7;

  v7 = (objc_object *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (differ(v7, (objc_object *)v4->_contentUserAction))
  {
    v5 = -[objc_object copy](v7, "copy");
    contentUserAction = v4->_contentUserAction;
    v4->_contentUserAction = (NSString *)v5;

    -[UAUserActivity setDirty:](v4, "setDirty:", 1);
  }
  objc_sync_exit(v4);

}

+ (BOOL)userActivityContinuationSupported
{
  return +[UAUserActivityManager userActivityContinuationSupported](UAUserActivityManager, "userActivityContinuationSupported");
}

+ (id)userActivityFromUUID:(id)a3 timeout:(double)a4 withError:(id *)a5
{
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__UAUserActivity_userActivityFromUUID_timeout_withError___block_invoke;
  v17[3] = &unk_1E6006A00;
  v19 = &v27;
  v20 = &v21;
  v9 = v8;
  v18 = v9;
  +[UAUserActivity fetchUserActivityWithUUID:completionHandler:](UAUserActivity, "fetchUserActivityWithUUID:completionHandler:", v7, v17);

  if (a4 >= 1.84467441e19)
    v10 = -1;
  else
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v11 = dispatch_semaphore_wait(v9, v10);

  if (v11 && !v22[5])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -109, 0);
    v13 = (void *)v22[5];
    v22[5] = v12;

  }
  v14 = (void *)v28[5];
  if (a5 && !v14)
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v14 = (void *)v28[5];
  }
  v15 = v14;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __57__UAUserActivity_userActivityFromUUID_timeout_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)userActivityFromUUID:(id)a3 withError:(id *)a4
{
  objc_msgSend(a1, "userActivityFromUUID:timeout:withError:", a3, a4, 9.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchUUID:intervalToWaitForDocumentSynchonization:withCompletionHandler:", v7, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UAUserActivity)init
{
  return -[UAUserActivity initWithTypeIdentifier:suggestedActionType:options:](self, "initWithTypeIdentifier:suggestedActionType:options:", 0, 1, 0);
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3
{
  return -[UAUserActivity initWithTypeIdentifier:suggestedActionType:options:](self, "initWithTypeIdentifier:suggestedActionType:options:", a3, 1, 0);
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3 dynamicIdentifier:(id)a4 options:(id)a5
{
  return (UAUserActivity *)-[UAUserActivity initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:](self, "initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:", a3, a4, 1, a5);
}

- (void)_setWebpageURL:(id)a3 throwOnFailure:(BOOL)a4
{
  _BOOL8 v4;
  UAUserActivity *v6;
  NSURL *v7;
  uint64_t v8;
  NSURL *webpageURL;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  objc_object *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v22 = (objc_object *)a3;
  objc_msgSend((id)objc_opt_class(), "checkWebpageURL:actionType:throwIfFailed:", v22, -[UAUserActivity suggestedActionType](self, "suggestedActionType"), v4);
  v6 = self;
  objc_sync_enter(v6);
  if (differ(v22, (objc_object *)v6->_webpageURL))
  {
    v7 = v6->_webpageURL;
    v8 = -[objc_object copy](v22, "copy");
    webpageURL = v6->_webpageURL;
    v6->_webpageURL = (NSURL *)v8;

    biomeInfoLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](v6, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_INFO, "%{public}@ SET-URL", buf, 0xCu);

    }
    -[UAUserActivity manager](v6, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userActivityIsActive:", v6);

    if (v13)
    {
      -[UAUserActivity setForceImmediateSendToServer:](v6, "setForceImmediateSendToServer:", 1);
      -[UAUserActivity indexActivity:forceIndexing:](v6, "indexActivity:forceIndexing:", 1, 0.5);
    }
    -[UAUserActivity setDirty:](v6, "setDirty:", 1);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    getUserActivityObserversCopy();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
          -[UAUserActivity parentUserActivity](v6, "parentUserActivity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) != 0)
            {
              -[UAUserActivity parentUserActivity](v6, "parentUserActivity");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "userActivityWebpageURLWasChanged:webpageURL:previousValue:", v21, v22, v7);

            }
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

  }
  objc_sync_exit(v6);

}

- (NSURL)referrerURL
{
  UAUserActivity *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_referrerURL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setReferrerURL:(id)a3
{
  objc_object *v4;
  UAUserActivity *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSURL *referrerURL;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (objc_object *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (differ(v4, (objc_object *)v5->_referrerURL))
  {
    biomeInfoLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "%{public}@ SET-REFERRERURL", (uint8_t *)&v10, 0xCu);

    }
    v8 = -[objc_object copy](v4, "copy");
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v8;

    -[UAUserActivity setDirty:](v5, "setDirty:", 1);
  }
  objc_sync_exit(v5);

}

- (void)setUniversalLink:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_universalLink != v3)
  {
    obj->_universalLink = v3;
    -[UAUserActivity setDirty:](obj, "setDirty:", 1);
  }
  objc_sync_exit(obj);

}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_object *v5;
  UAUserActivity *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  objc_object *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (objc_object *)a3;
  v6 = self;
  objc_sync_enter(v6);
  v16 = v5;
  if (differ(v5, (objc_object *)v6->_targetContentIdentifier))
  {
    v7 = v6->_targetContentIdentifier;
    objc_storeStrong((id *)&v6->_targetContentIdentifier, a3);
    -[UAUserActivity setDirty:](v6, "setDirty:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    getUserActivityObserversCopy();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          -[UAUserActivity parentUserActivity](v6, "parentUserActivity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = objc_opt_respondsToSelector();

            if ((v14 & 1) != 0)
            {
              -[UAUserActivity parentUserActivity](v6, "parentUserActivity");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "userActivityTargetContentIdentifierWasChanged:targetContentIdentifier:previousValue:", v15, v16, v7);

            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  objc_sync_exit(v6);

}

- (BOOL)supportsContinuationStreams
{
  UAUserActivity *v2;
  BOOL supportsContinuationStreams;

  v2 = self;
  objc_sync_enter(v2);
  supportsContinuationStreams = v2->_supportsContinuationStreams;
  objc_sync_exit(v2);

  return supportsContinuationStreams;
}

- (NSData)streamsData
{
  UAUserActivity *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  OS_dispatch_group *advertiserCompletedGroup;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_supportsContinuationStreams)
    goto LABEL_6;
  -[UAUserActivity payloadForIdentifier:](v2, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (!v4)
  {
    advertiserCompletedGroup = v2->_advertiserCompletedGroup;
    if (advertiserCompletedGroup)
    {
      v5 = advertiserCompletedGroup;
LABEL_7:
      v4 = 0;
      goto LABEL_8;
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:
  objc_sync_exit(v2);

  if (v5 && !v4)
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "UserActivity: Before waiting for completion group to finish.", (uint8_t *)&v15, 2u);
    }

    v8 = dispatch_time(0, 750000000);
    v9 = dispatch_group_wait(v5, v8);
    _uaGetLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = "NO";
      if (!v9)
        v11 = "YES";
      v15 = 136446210;
      v16 = v11;
      _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_INFO, "UserActivity: After waiting for completion group to finish, success = %{public}s.", (uint8_t *)&v15, 0xCu);
    }

    if (v9)
    {
      _uaGetLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "UserActivity: Failed getting streamsData from sharingd, so continuation streams are broken even though we think they are needed.", (uint8_t *)&v15, 2u);
      }
      v4 = 0;
    }
    else
    {
      v12 = v2;
      objc_sync_enter(v12);
      -[NSObject payloadForIdentifier:](v12, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v13, "copy");

      objc_sync_exit(v12);
    }

  }
  return (NSData *)v4;
}

- (void)setStreamsData:(id)a3
{
  id v4;
  UAUserActivity *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  biomeInfoLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[UAUserActivity uniqueIdentifier](v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = v4 != 0;
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "%{public}@ SET-STREAMSDATA hasStream=%{BOOL}d", (uint8_t *)&v9, 0x12u);

  }
  v5->_supportsContinuationStreams = v4 != 0;
  v8 = (void *)objc_msgSend(v4, "copy");
  -[UAUserActivity setPayload:object:identifier:dirty:](v5, "setPayload:object:identifier:dirty:", v8, 0, CFSTR("UAUserActivityStreamsPayload"), 0);

  objc_sync_exit(v5);
}

- (void)setSupportsContinuationStreams:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *v5;
  NSObject *v6;
  const char *v7;
  SFCompanionAdvertiser *advertiser;
  NSObject *advertiserCompletedGroup;
  NSObject *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  SFCompanionAdvertiser *v15;
  NSObject *v16;
  SFCompanionAdvertiser *v17;
  dispatch_group_t v18;
  OS_dispatch_group *v19;
  _QWORD v20[5];
  BOOL v21;
  _QWORD block[5];
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  UAUserActivity *v27;
  __int16 v28;
  SFCompanionAdvertiser *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (getSFCompanionAdvertiserClass())
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5->_supportsContinuationStreams != v3)
    {
      v5->_supportsContinuationStreams = v3;
      if (v5->_advertiser)
      {
        _uaGetLogForCategory(0);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = "YES";
          advertiser = v5->_advertiser;
          if (!v5->_supportsContinuationStreams)
            v7 = "NO";
          *(_DWORD *)buf = 136446722;
          v25 = (void *)v7;
          v26 = 2114;
          v27 = v5;
          v28 = 2114;
          v29 = advertiser;
          _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "Changing supportsContinuationStreams to %{public}s on %{public}@ advertiser=%{public}@", buf, 0x20u);
        }

        advertiserCompletedGroup = v5->_advertiserCompletedGroup;
        getSupportsContinuationStreamsQueue();
        v10 = objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __49__UAUserActivity_setSupportsContinuationStreams___block_invoke_90;
        v20[3] = &unk_1E6006A50;
        v20[4] = v5;
        v21 = v3;
        v11 = v20;
LABEL_15:
        dispatch_group_async(advertiserCompletedGroup, v10, v11);

        goto LABEL_16;
      }
      if (v3)
      {
        v12 = objc_alloc((Class)getSFCompanionAdvertiserClass());
        -[NSUUID UUIDString](v5->_uniqueIdentifier, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "initWithServiceType:", v13);
        v15 = v5->_advertiser;
        v5->_advertiser = (SFCompanionAdvertiser *)v14;

        _uaGetLogForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = v5->_advertiser;
          *(_DWORD *)buf = 138543618;
          v25 = v5;
          v26 = 2114;
          v27 = (UAUserActivity *)v17;
          _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_INFO, "Creating SFCompanionAdvertiser, since the client is setting .supportsContinuationStreams == YES for the first time on %{public}@ advertiser=%{public}@", buf, 0x16u);
        }

        advertiserCompletedGroup = v5->_advertiserCompletedGroup;
        if (!advertiserCompletedGroup)
        {
          v18 = dispatch_group_create();
          v19 = v5->_advertiserCompletedGroup;
          v5->_advertiserCompletedGroup = (OS_dispatch_group *)v18;

          advertiserCompletedGroup = v5->_advertiserCompletedGroup;
        }
        getSupportsContinuationStreamsQueue();
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__UAUserActivity_setSupportsContinuationStreams___block_invoke;
        block[3] = &unk_1E6006A50;
        block[4] = v5;
        v23 = v3;
        v11 = block;
        goto LABEL_15;
      }
    }
LABEL_16:
    objc_sync_exit(v5);

  }
}

void __49__UAUserActivity_setSupportsContinuationStreams___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "UserActivity: In group, setting up advertiser.", (uint8_t *)&v12, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v4, "setSupportsStreams:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setPayload:object:identifier:", 0, 0, CFSTR("UAUserActivityStreamsPayload"));
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 48);
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "Calling _start on advertiser and getting serviceEndpointData, %{public}@ advertiser=%{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_sync_exit(v3);
  objc_msgSend(v4, "start");
  objc_msgSend(v4, "serviceEndpointData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _uaGetLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 48);
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_INFO, "Finished calling _start on advertiser and getting serviceEndpointData, %{public}@ advertiser=%{public}@ data=%{public}@", (uint8_t *)&v12, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setStreamsData:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setDirty:", 1);

}

void __49__UAUserActivity_setSupportsContinuationStreams___block_invoke_90(uint64_t a1)
{
  id v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = "YES";
    else
      v4 = "NO";
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 48);
    v7 = 136446722;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "Telling _advertiser that supportsStreams = %{public}s on %{public}@ advertiser=%{public}@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setSupportsStreams:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDirty:", 1);
  objc_sync_exit(v2);

}

- (void)getContinuationStreamsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  SFCompanionAdvertiser **p_resumerAdvertiser;
  SFCompanionAdvertiser *resumerAdvertiser;
  SFCompanionAdvertiser *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[8];
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "getContinuationStreamsWithCompletionHandler", buf, 2u);
  }

  if (!v4)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getContinuationStreamsWithCompletionHandler called with a nil completionHandler argument."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
  if (getSFCompanionAdvertiserClass())
  {
    if (self->_resumerAdvertiser)
    {
      _uaGetLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), activtiy stream already in progress, EALREADY", buf, 2u);
      }

      v7 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("Get streams already in progress");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 37, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v9);
    }
    else if (self->_canCreateStreams)
    {
      -[UAUserActivity payloadForIdentifier:](self, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        self->_supportsContinuationStreams = 0;
        v12 = objc_msgSend(objc_alloc((Class)getSFCompanionAdvertiserClass()), "initWithServiceType:", 0);
        resumerAdvertiser = self->_resumerAdvertiser;
        p_resumerAdvertiser = &self->_resumerAdvertiser;
        *p_resumerAdvertiser = (SFCompanionAdvertiser *)v12;

        v15 = *p_resumerAdvertiser;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __62__UAUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke;
        v24[3] = &unk_1E6006A78;
        v25 = v4;
        -[SFCompanionAdvertiser getContinuationStreamsWithEndpointData:completionHandler:](v15, "getContinuationStreamsWithEndpointData:completionHandler:", v8, v24);
        v9 = v25;
      }
      else
      {
        _uaGetLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF7EB000, v18, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), no connect back token available, EOENT", buf, 2u);
        }

        v19 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v34[0] = CFSTR("No connect back token available");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v20);

      }
    }
    else
    {
      _uaGetLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), activtiy doesn't support streams, ENOTSUP", buf, 2u);
      }

      v17 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Activity doesn't support streams");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v9);
    }
  }
  else
  {
    _uaGetLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), failed to load Sharing.framework, ENOSYS", buf, 2u);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Failed to load Sharing framework");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 78, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v9);
  }

}

void __62__UAUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _uaGetLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_INFO, "getContinuationStreamsWithCompletionHandler(), inputStream=%{public}@ outputStream=%{public}@ error=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isCurrent
{
  UAUserActivity *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (-[UAUserActivity isInvalidated](v2, "isInvalidated"))
  {
    v3 = 0;
  }
  else
  {
    -[UAUserActivity manager](v2, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeUserActivityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivity uniqueIdentifier](v2, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isEqual:", v6);

  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)archiveURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__UAUserActivity_archiveURL_completionHandler___block_invoke;
  v11[3] = &unk_1E6006AC8;
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v11);

  return 1;
}

void __47__UAUserActivity_archiveURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  const void *v7;
  NSObject *v8;
  CFErrorDomain Domain;
  void *v10;
  CFIndex Code;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  CFErrorDomain v16;
  CFIndex v17;
  void *v18;
  CFDictionaryRef v19;
  void *v20;
  uint64_t v21;
  CFErrorDomain v22;
  CFIndex v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  __CFError *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  CFErrorDomain v34;
  CFIndex v35;
  void *v36;
  CFDictionaryRef v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *context;
  uint64_t v42;
  CFErrorRef err;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  CFErrorRef v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5DFD11C]();
  v42 = a1;
  objc_msgSend(*(id *)(a1 + 32), "absoluteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v3, "setScheme:", CFSTR("x-br-file"));
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v2)
  {
    v13 = 0;
    goto LABEL_26;
  }
  err = 0;
  v6 = _UABRCopyUbiquitousBookmarkDataForDocumentAtURL((const __CFURL *)v2, &err);
  v7 = (const void *)v6;
  if (err)
  {
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      v45 = v2;
      v46 = 2114;
      v47 = err;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "*** Error from _UACopyUbiquitousBookmarkDataForDocumentAtURL(%{private}@) => %{public}@", buf, 0x16u);
    }

    Domain = CFErrorGetDomain(err);
    v10 = _UABRCloudDocsErrorDomain();
    if (CFEqual(Domain, v10))
    {
      Code = CFErrorGetCode(err);
      if (Code == 6)
      {
        v13 = 0;
        goto LABEL_21;
      }
      if (Code == 7)
      {
        _uaGetLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v45 = v2;
          _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEFAULT, "*** Setting self.encodedContainsUnsynchronizedCloudDocument = YES because the .userInfo contains an unsynced cloud document, %{private}@", buf, 0xCu);
        }
      }
      else
      {
        _uaGetLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478083;
          v45 = v2;
          v46 = 2114;
          v47 = err;
          _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEBUG, "*** ERROR, BRCloudDocsErrorDomain from _UACopyUbiquitousBookmarkDataForDocumentAtURL(%{private}@) => %{public}@", buf, 0x16u);
        }
      }

      v40 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFErrorGetDomain(err);
      v23 = CFErrorGetCode(err);
      v24 = (void *)MEMORY[0x1E0C99D80];
      v19 = CFErrorCopyUserInfo(err);
      objc_msgSend(v24, "dictionaryWithDictionary:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v22, v23, v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFErrorGetDomain(err);
      v17 = CFErrorGetCode(err);
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = CFErrorCopyUserInfo(err);
      objc_msgSend(v18, "dictionaryWithDictionary:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v21;

LABEL_21:
    if (!v7)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (!v6)
  {
    v13 = 0;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("v"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  v13 = 0;
LABEL_22:
  CFRelease(v7);
LABEL_23:
  if (err)
    CFRelease(err);
LABEL_25:
  if (!objc_msgSend(v5, "count") && softLinkFPURLMightBeInFileProvider((const __CFURL *)v2))
  {
    err = 0;
    v29 = (void *)softLinkFPCreateBookmarkableStringFromDocumentURL((const __CFURL *)v2, &err);
    if (v29)
    {
      _uaGetLogForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v45 = v29;
        v46 = 2114;
        v47 = (CFErrorRef)v2;
        _os_log_impl(&dword_1AF7EB000, v30, OS_LOG_TYPE_DEBUG, "*** fileProviderCookie=%{public}@ for url %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("fp"), v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v31);

      CFRelease(v29);
    }
    else
    {
      if (!err)
        goto LABEL_26;
      _uaGetLogForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v45 = v2;
        v46 = 2114;
        v47 = err;
        _os_log_impl(&dword_1AF7EB000, v32, OS_LOG_TYPE_ERROR, "*** Error from FPBookmarkableStringFromDocumentURL, %{private}@ -> %{public}@", buf, 0x16u);
      }

      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = CFErrorGetDomain(err);
      v35 = CFErrorGetCode(err);
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = CFErrorCopyUserInfo(err);
      objc_msgSend(v36, "dictionaryWithDictionary:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, v35, v38);
      v39 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v39;
    }
    if (err)
      CFRelease(err);
  }
LABEL_26:
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "setQueryItems:", v5);
    objc_msgSend(v3, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");

    _uaGetLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(__CFError **)(v42 + 32);
      *(_DWORD *)buf = 138478083;
      v45 = v26;
      v46 = 2113;
      v47 = v28;
      _os_log_impl(&dword_1AF7EB000, v27, OS_LOG_TYPE_DEBUG, "BR: Mapping file:%{private}@ from %{private}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(v42 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(v42 + 40) + 16))();
  }

  objc_autoreleasePoolPop(context);
}

- (id)unarchiveURL:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  const __CFURL *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id *v30;
  __CFString *v31;
  id v32;
  __CFString *v33;
  CFTypeRef v34;
  CFTypeRef cf;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  CFTypeRef v43;
  __int16 v44;
  CFTypeRef v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  if (v32)
  {
    v31 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v32, 1);
    -[__CFString scheme](v31, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("x-br-file"));

    if (!v6)
    {
      v24 = 0;
LABEL_50:

      goto LABEL_51;
    }
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v30 = a4;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[__CFString queryItems](v31, "queryItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v41 = v31;
      v42 = 2113;
      v43 = v8;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "components=%{private}@ queryItems=%{private}@", buf, 0x16u);

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[__CFString queryItems](v31, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (!v10)
    {

      v11 = 0;
      v33 = 0;
      v24 = 0;
      cf = 0;
LABEL_47:
      _uaGetLogForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v41 = v24;
        v42 = 2113;
        v43 = v32;
        _os_log_impl(&dword_1AF7EB000, v28, OS_LOG_TYPE_DEBUG, "BR:Resolved url %{private}@ from %{private}@", buf, 0x16u);
      }

      goto LABEL_50;
    }
    v11 = 0;
    v33 = 0;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v14, "name", v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", CFSTR("v"));

        if (v16)
        {
          objc_msgSend(v14, "value");
          v17 = objc_claimAutoreleasedReturnValue();

          v33 = (__CFString *)v17;
        }
        objc_msgSend(v14, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", CFSTR("fp"));

        if (v19)
        {
          objc_msgSend(v14, "value");
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = (__CFString *)v20;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v10);

    cf = 0;
    if (!v11)
    {
      v24 = 0;
LABEL_36:
      if (v33 && !v24)
      {
        v34 = 0;
        v24 = (__CFString *)_UABRCopyDocumentURLForUbiquitousBookmarkData(v33, (__CFError **)&v34);
        _uaGetLogForCategory(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478339;
          v41 = v33;
          v42 = 2113;
          v43 = v24;
          v44 = 2114;
          v45 = v34;
          _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_DEBUG, "BRCopyDocumentURLForBookmarkData(%{private}@) = %{private}@/%{public}@", buf, 0x20u);
        }

        if (v30 && v34)
        {
          _uaGetLogForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138478083;
            v41 = v33;
            v42 = 2114;
            v43 = v34;
            _os_log_impl(&dword_1AF7EB000, v27, OS_LOG_TYPE_INFO, "error decoding brCookie %{private}@, error = %{public}@", buf, 0x16u);
          }

          CFRetain(v34);
          *v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v34)
          CFRelease(v34);
      }
      goto LABEL_47;
    }
    v21 = softLinkFPCreateDocumentURLFromBookmarkableString(v11, (__CFError **)&cf);
    v22 = (const __CFURL *)v21;
    if (cf)
    {
      _uaGetLogForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v41 = v11;
        v42 = 2114;
        v43 = cf;
        _os_log_impl(&dword_1AF7EB000, v23, OS_LOG_TYPE_DEBUG, "error decoding fileProvider %{private}@, error = %{public}@", buf, 0x16u);
      }

    }
    else if (v21)
    {
      -[__CFString setScheme:](v31, "setScheme:", CFSTR("file"));
      v25 = (__CFString *)CFURLCopyPath(v22);
      -[__CFString setPath:](v31, "setPath:", v25);

      -[__CFString URL](v31, "URL");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_28:
      if (v30 && cf)
        *v30 = (id)(id)CFRetain(cf);
      if (v22)
        CFRelease(v22);
      if (cf)
        CFRelease(cf);
      cf = 0;
      goto LABEL_36;
    }
    v24 = 0;
    goto LABEL_28;
  }
  v24 = 0;
LABEL_51:

  return v24;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = (id *)&v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v7 = a4;
  v21 = v7;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;
    if (objc_msgSend(v8, "isFileURL"))
    {
      v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __44__UAUserActivity_archiver_willEncodeObject___block_invoke;
      v13[3] = &unk_1E6006AF0;
      v15 = &v16;
      v10 = v9;
      v14 = v10;
      if (-[UAUserActivity archiveURL:completionHandler:](self, "archiveURL:completionHandler:", v8, v13))
        dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    objc_storeStrong(v17 + 5, a4);
  }
  v11 = v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __44__UAUserActivity_archiver_willEncodeObject___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v7 = a4;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("x-br-file"));

  if ((v9 & 1) == 0)
  {

LABEL_14:
    v12 = a4;
    v14 = v12;
    goto LABEL_15;
  }
  v16 = 0;
  -[UAUserActivity unarchiveURL:error:](self, "unarchiveURL:error:", v7, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v11)
  {
    -[UAUserActivity setDecodeUserInfoError:](self, "setDecodeUserInfoError:", v11);
LABEL_6:
    v12 = 0;
    goto LABEL_10;
  }
  if (!v10)
    goto LABEL_6;
  v12 = v10;
LABEL_10:
  _uaGetLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v18 = v12;
    v19 = 2113;
    v20 = v7;
    _os_log_impl(&dword_1AF7EB000, v13, OS_LOG_TYPE_DEBUG, " -- resolved url = %{private}@ from %{private}@", buf, 0x16u);
  }

  if (!v12)
    goto LABEL_14;

  v14 = 0;
LABEL_15:

  return v12;
}

void __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_133(uint64_t a1)
{
  void *v2;
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4)
  {
    _uaGetLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138477827;
      v20 = v6;
      _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "ENCODE: Skipping archiveURL for %{private}@ because another URL archive has already failed.", buf, 0xCu);
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6006B60;
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 48);
    v13 = v9;
    v14 = v10;
    v17 = *(_OWORD *)(a1 + 80);
    v11 = *(void **)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 72);
    v16 = v11;
    v15 = *(id *)(a1 + 32);
    if ((objc_msgSend(v7, "archiveURL:completionHandler:", v8, v12) & 1) == 0)
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

    v5 = v13;
  }

  objc_autoreleasePoolPop(v2);
}

void __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = *(id *)(a1 + 32);
    objc_sync_enter(v12);
    _uaGetLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v28 = 138478083;
      v29 = v14;
      v30 = 2113;
      v31 = v9;
      _os_log_impl(&dword_1AF7EB000, v13, OS_LOG_TYPE_INFO, "-- Replacing url %{private}@ with %{private}@", (uint8_t *)&v28, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, *(_QWORD *)(a1 + 40));
    v15 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 + a3, v15));
    v17 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 + a4, v17));
    objc_sync_exit(v12);
LABEL_9:

    goto LABEL_13;
  }
  v19 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 + 1, v19));
  if (!v20)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E0CB3388]);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -114, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CA59F0];
    v36[0] = CFSTR("UAUserActivityContainsCloudDocsKey");
    v36[1] = v22;
    v37[0] = MEMORY[0x1E0C9AAB0];
    v37[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _uaGetLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v23, "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      stringRemovingNewlines(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138478595;
      v29 = v25;
      v30 = 2114;
      v31 = v11;
      v32 = 2114;
      v33 = v21;
      v34 = 2114;
      v35 = v27;
      _os_log_impl(&dword_1AF7EB000, v24, OS_LOG_TYPE_INFO, "ICLOUD: Error encoding url %{private}@, %{public}@, so failing with error %{public}@ opts=%{public}@.", (uint8_t *)&v28, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    goto LABEL_9;
  }
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

BOOL __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_134(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __51__UAUserActivity_encodeUserInfo_completionHandler___block_invoke_2_136(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  return objc_claimAutoreleasedReturnValue();
}

- (id)encodeUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = dispatch_group_create();
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__UAUserActivity_encodeUserInfo_error___block_invoke;
  v12[3] = &unk_1E6006C28;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v14 = &v22;
  v15 = &v16;
  dispatch_group_async(v7, v8, v12);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __39__UAUserActivity_encodeUserInfo_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__UAUserActivity_encodeUserInfo_error___block_invoke_2;
  v5[3] = &unk_1E6006C00;
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v3, "encodeUserInfo:completionHandler:", v4, v5);
  objc_autoreleasePoolPop(v2);
}

void __39__UAUserActivity_encodeUserInfo_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

- (id)encodeUserInfo:(id)a3
{
  -[UAUserActivity encodeUserInfo:error:](self, "encodeUserInfo:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)decodeUserInfo:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  BOOL v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *group;
  id v49;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD v53[4];
  NSObject *v54;
  _QWORD block[5];
  id v56;
  UAUserActivity *v57;
  NSObject *v58;
  _BYTE *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  _QWORD v65[4];
  NSObject *v66;
  _QWORD v67[10];
  uint8_t v68[4];
  uint64_t v69;
  uint8_t v70[128];
  _BYTE buf[24];
  char v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    trimmedHexStringForData(v49, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "data=%{private}@", buf, 0xCu);

  }
  v5 = v49;
  if (v49)
  {
    if ((unint64_t)objc_msgSend(v49, "length") >= 4)
    {
      v6 = objc_retainAutorelease(v49);
      if (*(_BYTE *)objc_msgSend(v6, "bytes") == 77)
      {
        v7 = objc_retainAutorelease(v6);
        if (*(_BYTE *)(objc_msgSend(v7, "bytes") + 1) == 80)
        {
          v8 = objc_retainAutorelease(v7);
          v9 = _UACopyUnpackedObjectFromData(objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 0);
          v47 = v9;
          if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = MEMORY[0x1E0C809B0];
            v65[1] = 3221225472;
            v65[2] = __33__UAUserActivity_decodeUserInfo___block_invoke;
            v65[3] = &unk_1E6006B38;
            v11 = v10;
            v66 = v11;
            v46 = v11;
            recurse(v9, v65);
            if (-[NSObject count](v11, "count"))
            {
              _uaGetLogForCategory(0);
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                -[NSObject description](v11, "description");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                stringRemovingNewlines(v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                *(_QWORD *)&buf[4] = v14;
                _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "-- Converting x-br-file: NSURLs into local, iCloud URLs: %{private}@", buf, 0xCu);

              }
              objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[NSObject count](v11, "count") + 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v72 = 0;
              objc_msgSend(v15, "setCancellable:", 1);
              v64[0] = MEMORY[0x1E0C809B0];
              v64[1] = 3221225472;
              v64[2] = __33__UAUserActivity_decodeUserInfo___block_invoke_140;
              v64[3] = &unk_1E6006C50;
              v64[4] = buf;
              objc_msgSend(v15, "setCancellationHandler:", v64);
              group = dispatch_group_create();
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v16 = v11;
              v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
              if (v17)
              {
                v18 = *(_QWORD *)v61;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v61 != v18)
                      objc_enumerationMutation(v16);
                    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                    {
                      v20 = v15;
                      v21 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                      dispatch_get_global_queue(0, 0);
                      v22 = objc_claimAutoreleasedReturnValue();
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3221225472;
                      block[2] = __33__UAUserActivity_decodeUserInfo___block_invoke_2;
                      block[3] = &unk_1E6006C78;
                      block[4] = v21;
                      v15 = v20;
                      v56 = v20;
                      v57 = self;
                      v58 = v16;
                      v59 = buf;
                      dispatch_group_async(group, v22, block);

                    }
                  }
                  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
                }
                while (v17);
              }

              _uaGetLogForCategory(0);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v68 = 134217984;
                v69 = 0x402E000000000000;
                _os_log_impl(&dword_1AF7EB000, v23, OS_LOG_TYPE_INFO, "-- Waiting up to %g seconds for all iCloud x-br-file items to be converted into local iCloud NSURLs", v68, 0xCu);
              }

              v24 = dispatch_time(0, 15000000000);
              v25 = 0;
              if (!dispatch_group_wait(group, v24))
              {
                objc_msgSend(v15, "becomeCurrentWithPendingUnitCount:", 1);
                if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                {
                  v25 = 0;
                }
                else
                {
                  v43 = MEMORY[0x1E0C809B0];
                  v53[0] = MEMORY[0x1E0C809B0];
                  v53[1] = 3221225472;
                  v53[2] = __33__UAUserActivity_decodeUserInfo___block_invoke_141;
                  v53[3] = &unk_1E6006B38;
                  v54 = v16;
                  v51[0] = v43;
                  v51[1] = 3221225472;
                  v51[2] = __33__UAUserActivity_decodeUserInfo___block_invoke_2_142;
                  v51[3] = &unk_1E6006CA0;
                  v52 = v54;
                  recurseAndReplace(v47, v53, v51);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = v44;
                  if (v44)
                    v25 = (id)objc_msgSend(v44, "mutableCopy");
                  else
                    v25 = 0;

                }
                objc_msgSend(v15, "resignCurrent", v46);
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              v25 = -[NSObject copy](v9, "copy");
            }
            v39 = v66;
          }
          else
          {
            -[UAUserActivity decodeUserInfoError](self, "decodeUserInfoError");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37 == 0;

            if (v38)
            {
              v25 = 0;
              goto LABEL_41;
            }
            _uaGetLogForCategory(0);
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
            v41 = v47;
            if (v40)
            {
              -[UAUserActivity decodeUserInfoError](self, "decodeUserInfoError");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v42;
              _os_log_impl(&dword_1AF7EB000, v39, OS_LOG_TYPE_INFO, "*** Failed decoding archive, with error %{public}@, so (potentially) looping and trying again.", buf, 0xCu);

              v25 = 0;
              v41 = v47;
            }
            else
            {
              v25 = 0;
            }
            v46 = v41;
            v47 = 0;
          }

          v28 = v46;
LABEL_40:

LABEL_41:
          v5 = v49;
          goto LABEL_42;
        }
      }
    }
    v26 = (void *)MEMORY[0x1E0C99E60];
    v67[0] = objc_opt_class();
    v67[1] = objc_opt_class();
    v67[2] = objc_opt_class();
    v67[3] = objc_opt_class();
    v67[4] = objc_opt_class();
    v67[5] = objc_opt_class();
    v67[6] = objc_opt_class();
    v67[7] = objc_opt_class();
    v67[8] = objc_opt_class();
    v67[9] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v47 = objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v49, 0);
    -[NSObject setDelegate:](v28, "setDelegate:", self);
    -[NSObject setRequiresSecureCoding:](v28, "setRequiresSecureCoding:", 1);
    -[UAUserActivity setDecodeUserInfoError:](self, "setDecodeUserInfoError:", 0);
    -[NSObject decodeObjectOfClasses:forKey:](v28, "decodeObjectOfClasses:forKey:", v47, *MEMORY[0x1E0CB2CD0]);
    v29 = objc_claimAutoreleasedReturnValue();
    -[UAUserActivity decodeUserInfoError](self, "decodeUserInfoError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (v31)
    {
      if (v29)
      {
        _uaGetLogForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          trimmedHexStringForData(v49, 64);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v34;
          _os_log_impl(&dword_1AF7EB000, v32, OS_LOG_TYPE_DEBUG, "Successfully unarchived(old) payload to %{private}@, from %{private}@", buf, 0x16u);

        }
      }
      else
      {
        _uaGetLogForCategory(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF7EB000, v35, OS_LOG_TYPE_ERROR, "*** Failed to decode keyed object, trying unkeyed object decode", buf, 2u);
        }

        -[NSObject decodeObjectOfClasses:forKey:](v28, "decodeObjectOfClasses:forKey:", v47, CFSTR("$$0"));
        v29 = objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          v25 = 0;
          goto LABEL_39;
        }
        _uaGetLogForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF7EB000, v32, OS_LOG_TYPE_INFO, "*** Unarchived(old and unkeyed) payload", buf, 2u);
        }
      }
    }
    else
    {
      _uaGetLogForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        -[UAUserActivity decodeUserInfoError](self, "decodeUserInfoError");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v33;
        _os_log_impl(&dword_1AF7EB000, v32, OS_LOG_TYPE_ERROR, "*** Failed decoding archive, with error %{public}@.", buf, 0xCu);

      }
    }

    v25 = (id)v29;
LABEL_39:
    -[NSObject finishDecoding](v28, "finishDecoding");
    goto LABEL_40;
  }
  v25 = 0;
LABEL_42:
  -[UAUserActivity setDecodeUserInfoError:](self, "setDecodeUserInfoError:", 0, v46);

  return v25;
}

uint64_t __33__UAUserActivity_decodeUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v3, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:options:", CFSTR("x-br-file"), 1);

  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v4, v3);
LABEL_5:

  }
  return 1;
}

uint64_t __33__UAUserActivity_decodeUserInfo___block_invoke_140(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __33__UAUserActivity_decodeUserInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5DFD11C]();
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138477827;
    v10 = v4;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "-- Converting x-br-file: NSURL %{private}@ into local, iCloud URL", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 48), "unarchiveURL:error:", *(_QWORD *)(a1 + 32), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resignCurrent");
  _uaGetLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138478083;
    v10 = v7;
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEBUG, "-- Converted x-br-file: NSURL %{private}@ into local, iCloud URLs: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(id *)(a1 + 56);
  objc_sync_enter(v8);
  if (v5)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  objc_sync_exit(v8);

  objc_autoreleasePoolPop(v2);
}

BOOL __33__UAUserActivity_decodeUserInfo___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __33__UAUserActivity_decodeUserInfo___block_invoke_2_142(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)addDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138478083;
    v10 = v5;
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "addDynamicUserActivity(%{private}@ matching=%{private}@)", (uint8_t *)&v9, 0x16u);
  }

  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDynamicUserActivity:matching:", v5, v6);

}

+ (void)removeDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138478083;
    v10 = v5;
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "removeDynamicUserActivity(%{private}@ matching=%{private}@)", (uint8_t *)&v9, 0x16u);
  }

  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDynamicUserActivity:matching:", v5, v6);

}

- (void)prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[UAUserActivity manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pinUserActivity:withCompletionHandler:", self, v6);

}

- (void)pinUserActivityWithCompletionHandler:(id)a3
{
  -[UAUserActivity prepareUserActivityForLaunchingWithOptions:completionHandler:](self, "prepareUserActivityForLaunchingWithOptions:completionHandler:", 0, a3);
}

- (id)determineMatchingApplicationBundleIdentfierWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UAUserActivity typeIdentifier](self, "typeIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity dynamicIdentifier](self, "dynamicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity teamIdentifier](self, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAUserActivityManager _determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:dynamicType:kind:teamIdentifier:](UAUserActivityManager, "_determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:dynamicType:kind:teamIdentifier:", v4, v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  UAUserActivity *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSDictionary count](v2->_userInfo, "count");
  objc_sync_exit(v2);

  v4 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = v2;
  v17.super_class = (Class)UAUserActivity;
  -[UAUserActivity description](&v17, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity typeIdentifier](v2, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  trimmedString(v5, 0x80u);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity uniqueIdentifier](v2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity cachedEncodedUserInfo](v2, "cachedEncodedUserInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld items"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UAUserActivity supportsContinuationStreams](v2, "supportsContinuationStreams");
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivity payloadForIdentifier:](v2, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
    v2 = (UAUserActivity *)objc_claimAutoreleasedReturnValue();
    trimmedHexStringForData(v2, 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" streamData=%@"), v3);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1E60084E8;
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ { type = %@, UUID = %@, userInfo = %@%@ }"), v16, v6, v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  return (NSString *)v13;
}

- (NSString)debugDescription
{
  UAUserActivity *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v2 = self;
  objc_sync_enter(v2);
  -[NSDictionary description](v2->_userInfo, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stringRemovingNewlines(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  -[UAUserActivity payloadIdentifiers](v2, "payloadIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[UAUserActivity payloadIdentifiers](v2, "payloadIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E60084E8;
  }

  v9 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = v2;
  v16.super_class = (Class)UAUserActivity;
  -[UAUserActivity description](&v16, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity typeIdentifier](v2, "typeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivity uniqueIdentifier](v2, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ { type = %@, UUID = %@, userInfo = %@ %@ }"), v10, v11, v13, v4, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

+ (void)removeUserActivityObserver:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    v4 = (id)getUserActivityObservers(BOOL)::sResult;
    objc_sync_enter(v4);
    objc_msgSend(v4, "removeObject:", v5);
    objc_sync_exit(v4);

    v3 = v5;
  }

}

- (void)setMadeCurrentDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (void)setMadeCurrentEndDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (BOOL)sendToServerPending
{
  return self->_sendToServerPending;
}

- (void)setSendToServerPending:(BOOL)a3
{
  self->_sendToServerPending = a3;
}

- (BOOL)createsNewUUIDIfSaved
{
  return self->_createsNewUUIDIfSaved;
}

- (void)setCreatesNewUUIDIfSaved:(BOOL)a3
{
  self->_createsNewUUIDIfSaved = a3;
}

- (NSError)decodeUserInfoError
{
  return (NSError *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDecodeUserInfoError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setEncodedFileProviderURL:(BOOL)a3
{
  self->_encodedFileProviderURL = a3;
}

- (unint64_t)os_state_handler
{
  return self->_os_state_handler;
}

- (void)setUserInfoContainsFileURLs:(BOOL)a3
{
  self->_userInfoContainsFileURLs = a3;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void)setDynamicIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (BOOL)canCreateStreams
{
  return self->_canCreateStreams;
}

- (void)setCanCreateStreams:(BOOL)a3
{
  self->_canCreateStreams = a3;
}

- (NSString)subtitle
{
  if (-[UAUserActivity(Legacy) subtitle]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) subtitle]::sOnce, &__block_literal_global_475);
  return 0;
}

void __34__UAUserActivity_Legacy__subtitle__block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) subtitle]", ");
}

- (void)setSubtitle:(id)a3
{
  id v3;

  v3 = a3;
  if (-[UAUserActivity(Legacy) setSubtitle:]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) setSubtitle:]::sOnce, &__block_literal_global_477);

}

void __38__UAUserActivity_Legacy__setSubtitle___block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) setSubtitle:]", ");
}

- (id)contentType
{
  if (-[UAUserActivity(Legacy) contentType]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) contentType]::sOnce, &__block_literal_global_478);
  return 0;
}

void __37__UAUserActivity_Legacy__contentType__block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) contentType]", ");
}

- (void)setContentType:(id)a3
{
  id v3;

  v3 = a3;
  if (-[UAUserActivity(Legacy) setContentType:]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) setContentType:]::sOnce, &__block_literal_global_479);

}

void __41__UAUserActivity_Legacy__setContentType___block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) setContentType:]", ");
}

- (id)contentAttributes
{
  if (-[UAUserActivity(Legacy) contentAttributes]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) contentAttributes]::sOnce, &__block_literal_global_480);
  return 0;
}

void __43__UAUserActivity_Legacy__contentAttributes__block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) contentAttributes]", ");
}

- (void)setContentAttributes:(id)a3
{
  id v3;

  v3 = a3;
  if (-[UAUserActivity(Legacy) setContentAttributes:]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) setContentAttributes:]::sOnce, &__block_literal_global_481);

}

void __47__UAUserActivity_Legacy__setContentAttributes___block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) setContentAttributes:]", ");
}

- (void)addContentAttribute:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (-[UAUserActivity(Legacy) addContentAttribute:forKey:]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) addContentAttribute:forKey:]::sOnce, &__block_literal_global_482);

}

void __53__UAUserActivity_Legacy__addContentAttribute_forKey___block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) addContentAttribute:forKey:]", ");
}

- (void)removeContentAttribute:(id)a3
{
  id v3;

  v3 = a3;
  if (-[UAUserActivity(Legacy) removeContentAttribute:]::sOnce != -1)
    dispatch_once(&-[UAUserActivity(Legacy) removeContentAttribute:]::sOnce, &__block_literal_global_483);

}

void __49__UAUserActivity_Legacy__removeContentAttribute___block_invoke()
{
  syslog(3, "*** UserActivity.framework, %s was called but is useless and deprecated. %s  Please write a bug against this application.", "-[UAUserActivity(Legacy) removeContentAttribute:]", ");
}

- (UAUserActivity)initWithManager:(id)a3 userActivityInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  UAUserActivity *v9;
  UAUserActivity *v10;
  void *v11;
  uint64_t v12;
  NSUUID *uniqueIdentifier;
  void *v14;
  uint64_t v15;
  NSDictionary *options;
  void *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSString *typeIdentifier;
  uint64_t v22;
  NSString *dynamicIdentifier;
  uint64_t v24;
  NSString *teamIdentifier;
  uint64_t v26;
  NSURL *webpageURL;
  uint64_t v28;
  NSURL *referrerURL;
  uint64_t v30;
  NSString *targetContentIdentifier;
  void *v32;
  BOOL v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSMutableDictionary *payloadDataCache;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSDictionary *userInfo;
  NSMutableDictionary *frameworkPayload;
  SFCompanionAdvertiser *advertiser;
  SFCompanionAdvertiser *resumerAdvertiser;
  void *v46;
  BOOL v47;
  uint64_t v48;
  NSString *persistentIdentifier;
  void *v50;
  void *v51;
  uint64_t v52;
  NSSet *requiredUserInfoKeys;
  uint64_t v54;
  NSString *contentUserAction;
  void *v56;
  void *v57;
  uint64_t v58;
  NSSet *keywords;
  uint64_t v60;
  NSDate *expirationDate;
  objc_super v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    v65 = v6;
    v66 = 2113;
    v67 = v7;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "initWithManager:%{public}@, userActivityInfo=%{private}@", buf, 0x16u);
  }

  v63.receiver = self;
  v63.super_class = (Class)UAUserActivity;
  v9 = -[UAUserActivity init](&v63, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_manager, v6);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeCurrentWithPendingUnitCount:", 1);
    objc_msgSend(v7, "uuid");
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSUUID *)v12;

    v10->_suggestedActionType = objc_msgSend(v7, "type");
    objc_msgSend(v7, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    options = v10->_options;
    v10->_options = (NSDictionary *)v15;

    objc_msgSend(v7, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v18;

    objc_msgSend(v7, "activityType");
    v20 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v10->_typeIdentifier;
    v10->_typeIdentifier = (NSString *)v20;

    objc_msgSend(v7, "dynamicActivityType");
    v22 = objc_claimAutoreleasedReturnValue();
    dynamicIdentifier = v10->_dynamicIdentifier;
    v10->_dynamicIdentifier = (NSString *)v22;

    objc_msgSend(v7, "teamIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v10->_teamIdentifier;
    v10->_teamIdentifier = (NSString *)v24;

    objc_msgSend(v7, "webpageURL");
    v26 = objc_claimAutoreleasedReturnValue();
    webpageURL = v10->_webpageURL;
    v10->_webpageURL = (NSURL *)v26;

    objc_msgSend(v7, "referrerURL");
    v28 = objc_claimAutoreleasedReturnValue();
    referrerURL = v10->_referrerURL;
    v10->_referrerURL = (NSURL *)v28;

    objc_msgSend(v7, "targetContentIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    targetContentIdentifier = v10->_targetContentIdentifier;
    v10->_targetContentIdentifier = (NSString *)v30;

    objc_msgSend(v7, "payloads");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (!v33)
    {
      v34 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "payloads");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "initWithDictionary:", v35);
      payloadDataCache = v10->_payloadDataCache;
      v10->_payloadDataCache = (NSMutableDictionary *)v36;

      v38 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "payloadForIdentifier:", CFSTR("UAUserActivityUserInfoPayload"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivity decodeUserInfo:](v10, "decodeUserInfo:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v38, "initWithDictionary:", v40);
      userInfo = v10->_userInfo;
      v10->_userInfo = (NSDictionary *)v41;

      -[NSMutableDictionary removeObjectForKey:](v10->_payloadDataCache, "removeObjectForKey:", CFSTR("UAUserActivityUserInfoPayload"));
    }
    frameworkPayload = v10->_frameworkPayload;
    v10->_frameworkPayload = 0;

    advertiser = v10->_advertiser;
    v10->_advertiser = 0;

    resumerAdvertiser = v10->_resumerAdvertiser;
    v10->_resumerAdvertiser = 0;

    v10->_needsSave = 1;
    -[UAUserActivity payloadForIdentifier:](v10, "payloadForIdentifier:", CFSTR("UAUserActivityStreamsPayload"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46 == 0;

    if (!v47)
    {
      v10->_canCreateStreams = 1;
      v10->_supportsContinuationStreams = 1;
    }
    v10->_createsNewUUIDIfSaved = 1;
    v10->_eligibleForHandoff = objc_msgSend(v7, "eligibleForHandoff");
    v10->_eligibleForPublicIndexing = objc_msgSend(v7, "eligibleForPublicIndexing");
    v10->_eligibleForReminders = objc_msgSend(v7, "eligibleForReminders");
    v10->_eligibleForSearch = objc_msgSend(v7, "eligibleForSearch");
    v10->_eligibleForPrediction = objc_msgSend(v7, "eligibleForPrediction");
    objc_msgSend(v7, "persistentIdentifier");
    v48 = objc_claimAutoreleasedReturnValue();
    persistentIdentifier = v10->_persistentIdentifier;
    v10->_persistentIdentifier = (NSString *)v48;

    objc_msgSend(v7, "requiredUserInfoKeys");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v7, "requiredUserInfoKeys");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "copy");
      requiredUserInfoKeys = v10->_requiredUserInfoKeys;
      v10->_requiredUserInfoKeys = (NSSet *)v52;

    }
    else
    {
      v51 = v10->_requiredUserInfoKeys;
      v10->_requiredUserInfoKeys = 0;
    }

    v10->_universalLink = objc_msgSend(v7, "isUniversalLink");
    objc_msgSend(v7, "contentUserAction");
    v54 = objc_claimAutoreleasedReturnValue();
    contentUserAction = v10->_contentUserAction;
    v10->_contentUserAction = (NSString *)v54;

    objc_msgSend(v7, "keywords");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v7, "keywords");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "copy");
      keywords = v10->_keywords;
      v10->_keywords = (NSSet *)v58;

    }
    else
    {
      v57 = v10->_keywords;
      v10->_keywords = 0;
    }

    objc_msgSend(v7, "expirationDate");
    v60 = objc_claimAutoreleasedReturnValue();
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v60;

    objc_msgSend(v11, "resignCurrent");
  }

  return v10;
}

- (void)willSynchronizeUserActivityWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  UAUserActivity *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  UAUserActivity *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543619;
    v19 = v7;
    v20 = 2113;
    v21 = self;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "self=%{public}@/%{private}@", (uint8_t *)&v18, 0x16u);

  }
  self->_lastSaveTime = 0.0;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[UAUserActivity needsSave](v8, "needsSave");
  objc_sync_exit(v8);

  -[UAUserActivity delegate](v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UAUserActivity isInvalidated](v8, "isInvalidated"))
  {
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[UAUserActivity uniqueIdentifier](v8, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_INFO, "willSynchronize was called after the UAUserActivity %{public}@ had been invalidated.", (uint8_t *)&v18, 0xCu);

    }
    v10 = 0;
    goto LABEL_15;
  }
  if (v10)
    v14 = v9;
  else
    v14 = 0;
  if (!v14)
  {
LABEL_15:
    if (v4)
      v4[2](v4, 0);
    goto LABEL_17;
  }
  -[UAUserActivity sendUserActivityInfoToLSUserActivityd:onAsyncQueue:](v8, "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", 0, 0);
  if (v4)
  {
    _uaGetLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[UAUserActivity uniqueIdentifier](v8, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543619;
      v19 = v17;
      v20 = 2113;
      v21 = v8;
      _os_log_impl(&dword_1AF7EB000, v15, OS_LOG_TYPE_DEBUG, "Calling completionHandler self=%{public}@/%{private}@", (uint8_t *)&v18, 0x16u);

    }
    v4[2](v4, 0);
  }
LABEL_17:

}

- (void)didSynchronizeUserActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  UAUserActivity *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v18 = v5;
    v19 = 2113;
    v20 = self;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "self=%{public}@/%{private}@", buf, 0x16u);

  }
  -[UAUserActivity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__UAUserActivity_Internal__didSynchronizeUserActivity__block_invoke;
    v15[3] = &unk_1E6006DE8;
    v15[4] = self;
    v16 = v6;
    dispatch_async(v7, v15);

  }
  else
  {
    -[UAUserActivity options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UAUserActivity options](self, "options");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CA59F8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
      {
        _uaGetLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[UAUserActivity uniqueIdentifier](self, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v14;
          _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEBUG, "UserActivity(%{public}@) has UAUserActivityOptionInvalidateAfterFetchKey = YES, so invalidating this activity because it has been continued.", buf, 0xCu);

        }
        -[UAUserActivity invalidate](self, "invalidate");
      }
    }
  }

}

void __54__UAUserActivity_Internal__didSynchronizeUserActivity__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5DFD11C]();
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v22 = 138543619;
    v23 = v5;
    v24 = 2113;
    v25 = v6;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "(on default queue) self=%{public}@/%{private}@", (uint8_t *)&v22, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v22 = 138543619;
      v23 = v9;
      v24 = 2113;
      v25 = v10;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "--- calling delegate.didSynchronizeActivity self=%{public}@/%{private}@", (uint8_t *)&v22, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "didSynchronizeActivity");
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v22 = 138543619;
      v23 = v13;
      v24 = 2113;
      v25 = v14;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "--- after calling delegate.didSynchronizeActivity self=%{public}@/%{private}@", (uint8_t *)&v22, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CA59F8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      _uaGetLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "UUIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v21;
        _os_log_impl(&dword_1AF7EB000, v19, OS_LOG_TYPE_DEBUG, "UserActivity(%{public}@) has UAUserActivityOptionInvalidateAfterFetchKey = YES, so invalidating this activity because it has been continued.", (uint8_t *)&v22, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
  }
  objc_autoreleasePoolPop(v2);
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  UAUserActivity *v9;

  -[UAUserActivity delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__UAUserActivity_Internal__didReceiveInputStream_outputStream___block_invoke;
    v7[3] = &unk_1E6006DE8;
    v8 = v5;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

void __63__UAUserActivity_Internal__didReceiveInputStream_outputStream___block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x1B5DFD11C]();
  objc_opt_respondsToSelector();
  objc_autoreleasePoolPop(v0);
}

void __73__UAUserActivity_Internal__scheduleSendUserActivityInfoToLSUserActivityd__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  objc_msgSend(*(id *)(a1 + 32), "scheduleSendUserActivityInfoToLSUserActivityd");
  objc_autoreleasePoolPop(v2);
}

- (id)callWillSaveDelegateIfDirtyAndPackageUpData:(BOOL)a3 clearDirty:(BOOL)a4 completionHandler:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[7];
  BOOL v17;
  BOOL v18;
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  -[UAUserActivity willCallSaveSerializationQueue](self, "willCallSaveSerializationQueue", a3, a4, a5);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  _uaGetLogForCategory(CFSTR("signposts"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  _uaGetLogForCategory(CFSTR("signposts"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "callWillSaveDelegate", (const char *)&unk_1AF832D5A, buf, 2u);
  }

  -[UAUserActivity willCallSaveSerializationQueue](self, "willCallSaveSerializationQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_clearDirty_completionHandler___block_invoke;
  v16[3] = &unk_1E6006E60;
  v17 = a3;
  v18 = a4;
  v16[4] = self;
  v16[5] = &v20;
  v16[6] = v10;
  dispatch_sync(v13, v16);

  v14 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v14;
}

void __101__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_clearDirty_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  int v13;
  int v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  _BYTE *v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  int v60;
  NSObject *oslog;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  const __CFString *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (!objc_msgSend(v3, "isInvalidated"))
      goto LABEL_8;
LABEL_5:
    _uaGetLogForCategory(0);
    oslog = objc_claimAutoreleasedReturnValue();
    v60 = 1;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v6;
      _os_log_impl(&dword_1AF7EB000, oslog, OS_LOG_TYPE_INFO, "Refusing to consider calling delegate for %{public}@ because it has been invalidated.", buf, 0xCu);

      v60 = 1;
    }
    goto LABEL_49;
  }
  v4 = objc_msgSend(v3, "needsSave");
  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) != 0)
    goto LABEL_5;
  if ((v4 & 1) != 0)
  {
LABEL_8:
    v7 = 1;
LABEL_9:
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "needsSave");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v78 = v10;
      v79 = 2114;
      v80 = v12;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "for %{public}@: needsSave=%{public}@", buf, 0x16u);

    }
    if (*(_BYTE *)(a1 + 56))
      v13 = 1000;
    else
      v13 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "needsSave"))
      v14 = 100;
    else
      v14 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "dirty"))
      v15 = 10;
    else
      v15 = 0;
    v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setCachedEncodedUserInfo:", 0);
    objc_sync_exit(v16);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    oslog = objc_claimAutoreleasedReturnValue();
    v60 = v14 + v13 + v15;
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = *(id *)(a1 + 32);
      objc_sync_enter(v17);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      objc_sync_exit(v17);

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      getUserActivityObserversCopy();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v71 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = objc_opt_respondsToSelector();

              if ((v24 & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "userActivityWillSynchronize:", v25);

              }
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
        }
        while (v19);
      }

      _uaGetLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138543619;
        v78 = v28;
        v79 = 2113;
        v80 = v29;
        _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_DEBUG, "--- in async block, calling willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);

      }
      -[NSObject willSynchronizeActivity](oslog, "willSynchronizeActivity");
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      getUserActivityObserversCopy();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v67 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
            objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = objc_opt_respondsToSelector();

              if ((v36 & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "userActivityWasSynchronized:", v37);

              }
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        }
        while (v31);
      }

      v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105);
      objc_sync_exit(v38);

      objc_msgSend(*(id *)(a1 + 32), "displayInDtrace");
      _uaGetLogForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "UUIDString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138543619;
        v78 = v41;
        v79 = 2113;
        v80 = v42;
        _os_log_impl(&dword_1AF7EB000, v39, OS_LOG_TYPE_DEBUG, "--- in async block, back from willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);

      }
    }
LABEL_49:

    goto LABEL_50;
  }
  v7 = 0;
  v60 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "dirty"))
    goto LABEL_9;
LABEL_50:
  if (*(_BYTE *)(a1 + 57))
  {
    v43 = *(id *)(a1 + 32);
    objc_sync_enter(v43);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = 0;
    v44 = *(_BYTE **)(a1 + 32);
    if (v44[104])
      objc_msgSend(v44, "setDirty:", 1);
    objc_sync_exit(v43);

  }
  _uaGetLogForCategory(CFSTR("signposts"));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = v45;
  v47 = *(_QWORD *)(a1 + 48);
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v78) = v60;
    _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v46, OS_SIGNPOST_INTERVAL_END, v47, "callWillSaveDelegate", "why=%{public}d enableTelemetry=YES ", buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "userActivityInfoForSelf");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v50 = *(void **)(v49 + 40);
  *(_QWORD *)(v49 + 40) = v48;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  getUserActivityObserversCopy();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v63 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v58 = objc_opt_respondsToSelector();

          if ((v58 & 1) != 0)
          {
            if (!v52)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "archiveUserActivityInfo");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(*(id *)(a1 + 32), "parentUserActivity");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "userActivityWasSerialized:archived:", v59, v52);

          }
        }
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v53);
  }

}

+ (id)allowedWebpageURLSchemes
{
  if (+[UAUserActivity(Internal) allowedWebpageURLSchemes]::once != -1)
    dispatch_once(&+[UAUserActivity(Internal) allowedWebpageURLSchemes]::once, &__block_literal_global_509);
  return (id)+[UAUserActivity(Internal) allowedWebpageURLSchemes]::result;
}

void __52__UAUserActivity_Internal__allowedWebpageURLSchemes__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("http"), CFSTR("https"), 0);
  v1 = (void *)+[UAUserActivity(Internal) allowedWebpageURLSchemes]::result;
  +[UAUserActivity(Internal) allowedWebpageURLSchemes]::result = v0;

}

- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[UAUserActivity delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__UAUserActivity_Internal__advertiser_didReceiveInputStream_outputStream___block_invoke;
    block[3] = &unk_1E6006E38;
    v12 = v9;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, block);

  }
}

void __74__UAUserActivity_Internal__advertiser_didReceiveInputStream_outputStream___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "didReceiveInputStream:outputStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

+ (id)registerForSuggestedActionNudgeOfType:(unint64_t)a3 withOptions:(id)a4 block:(id)a5
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  suggestedActionNudgesQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__UAUserActivity_Nudges__registerForSuggestedActionNudgeOfType_withOptions_block___block_invoke;
  v10[3] = &unk_1E6006EA8;
  v11 = v5;
  v12 = &v13;
  v7 = v5;
  dispatch_sync(v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __82__UAUserActivity_Nudges__registerForSuggestedActionNudgeOfType_withOptions_block___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;

  if (!suggestedActionNudges)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)suggestedActionNudges;
    suggestedActionNudges = (uint64_t)v2;

  }
  v4 = _ZZZ82__UAUserActivity_Nudges__registerForSuggestedActionNudgeOfType_withOptions_block__EUb_E7sNextID++;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (objc_msgSend((id)suggestedActionNudges, "count"))
    v8 = 0;
  else
    v8 = springBoardEventToken == 0;
  if (v8)
  {
    suggestedActionNudgesQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch("com.apple.sharing.SpringBoard.startDiscovery", &springBoardEventToken, v9, &__block_literal_global_782);

  }
  return objc_msgSend((id)suggestedActionNudges, "setObject:forKey:", _Block_copy(*(const void **)(a1 + 32)), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (void)unregisterForSuggestedActionNudgeOfType:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  suggestedActionNudgesQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UAUserActivity_Nudges__unregisterForSuggestedActionNudgeOfType___block_invoke;
  block[3] = &unk_1E6006AA0;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

uint64_t __66__UAUserActivity_Nudges__unregisterForSuggestedActionNudgeOfType___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t result;

  v2 = (const void *)objc_msgSend((id)suggestedActionNudges, "objectForKey:", *(_QWORD *)(a1 + 32));
  if (v2)
    _Block_release(v2);
  objc_msgSend((id)suggestedActionNudges, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend((id)suggestedActionNudges, "count");
  if (!result)
  {
    result = springBoardEventToken;
    if (springBoardEventToken)
    {
      result = notify_cancel(springBoardEventToken);
      springBoardEventToken = 0;
    }
  }
  return result;
}

+ (BOOL)currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__UAUserActivity_UAUserActivityReminders__currentUserActivityUUIDWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_1E6006ED0;
  v8 = v6;
  v12 = v8;
  v9 = objc_msgSend(v7, "currentUserActivityUUIDWithOptions:completionHandler:", v5, v11);

  return v9;
}

uint64_t __96__UAUserActivity_UAUserActivityReminders__currentUserActivityUUIDWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)determineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__UAUserActivity_UAUserActivityReminders__determineIfUserActivityIsCurrent_completionHandler___block_invoke;
  v11[3] = &unk_1E6006EF8;
  v8 = v6;
  v12 = v8;
  v9 = objc_msgSend(v7, "determineIfUserActivityIsCurrent:completionHandler:", v5, v11);

  return v9;
}

uint64_t __94__UAUserActivity_UAUserActivityReminders__determineIfUserActivityIsCurrent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)currentUserActivityProxiesWithOptions:(id)a3 matching:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __108__UAUserActivity_UAUserActivityReminders__currentUserActivityProxiesWithOptions_matching_completionHandler___block_invoke;
    v12[3] = &unk_1E6006F20;
    v13 = v9;
    objc_msgSend(v10, "currentUserActivityProxiesWithOptions:predicate:completionHandler:", v7, v8, v12);

  }
  return v9 != 0;
}

void __108__UAUserActivity_UAUserActivityReminders__currentUserActivityProxiesWithOptions_matching_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      stringRemovingNewlines(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_ERROR, " proxies=%{public}@ error=%{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)contentIdentifier
{
  return 0;
}

- (void)setExpirationDate:(id)a3
{
  UAUserActivity *v4;
  uint64_t v5;
  NSDate *expirationDate;
  objc_object *v7;

  v7 = (objc_object *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (differ(v7, (objc_object *)v4->_expirationDate))
  {
    v5 = -[objc_object copy](v7, "copy");
    expirationDate = v4->_expirationDate;
    v4->_expirationDate = (NSDate *)v5;

    -[UAUserActivity setForceImmediateSendToServer:](v4, "setForceImmediateSendToServer:", 1);
    -[UAUserActivity setDirty:](v4, "setDirty:", 1);
  }
  objc_sync_exit(v4);

}

- (void)addKeywordsFromArray:(id)a3
{
  id v4;
  UAUserActivity *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSSet *keywords;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5->_keywords);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __63__UAUserActivity_UAUserActivityAppLinks__addKeywordsFromArray___block_invoke;
    v13 = &unk_1E6006F48;
    v7 = v6;
    v14 = v7;
    v15 = &v16;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v10);
    if (*((_BYTE *)v17 + 24))
    {
      v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
      keywords = v5->_keywords;
      v5->_keywords = (NSSet *)v8;

      -[UAUserActivity setDirty:](v5, "setDirty:", 1);
    }

    _Block_object_dispose(&v16, 8);
    objc_sync_exit(v5);

  }
}

void __63__UAUserActivity_UAUserActivityAppLinks__addKeywordsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (void)setEligibleForReminders:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForReminders != v3)
  {
    obj->_eligibleForReminders = v3;
    -[UAUserActivity setDirty:](obj, "setDirty:", 1);
  }
  objc_sync_exit(obj);

}

- (UAUserActivity)initWithUserActivityStrings:(id)a3 optionalString:(id)a4 tertiaryData:(id)a5 options:(id)a6
{
  id v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  UAUserActivity *v21;
  id v22;
  id v23;
  char v24;
  void *v25;
  UAUserActivity *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  UAUserActivity *v41;
  id v42;
  uint64_t v43;
  UAUserActivity *v44;
  uint64_t v45;
  NSDictionary *userInfo;
  void *v47;
  uint64_t v48;
  NSSet *requiredUserInfoKeys;
  UAUserActivity *v50;
  uint64_t v52;
  char v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  UAUserActivity *v61;
  UAUserActivity *v62;
  id obj;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v56 = a4;
  v54 = a5;
  v55 = a6;
  v59 = v10;
  v62 = self;
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("v1/")) & 1) == 0
    && (!objc_msgSend(v10, "hasPrefix:", CFSTR("v1."))
     || !objc_msgSend(v10, "containsString:", CFSTR("/"))))
  {
    v64 = 0;
    v65 = 0;
    v60 = 0;
    v61 = 0;
    obj = 0;
    v57 = 0;
    v25 = 0;
    v26 = self;
LABEL_79:
    v62 = 0;
    goto LABEL_90;
  }
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("/"), &v75);
  v66 = v75;
  objc_msgSend(v11, "scanString:intoString:", CFSTR("/"), 0);
  v74 = 0;
  v12 = objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("/"), &v74);
  v13 = v74;
  v65 = v13;
  if (v12)
  {
    objc_msgSend(v13, "stringByRemovingPercentEncoding");
    v14 = objc_claimAutoreleasedReturnValue();

    v65 = (void *)v14;
    objc_msgSend(v11, "scanString:intoString:", CFSTR("/"), 0);
  }
  LODWORD(v52) = 0;
  v57 = 0;
  v60 = 0;
  v61 = 0;
  obj = 0;
  v64 = 0;
  while ((objc_msgSend(v11, "isAtEnd", v52, v54) & 1) == 0
       && (objc_msgSend(v11, "scanString:intoString:", CFSTR("/"), 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("=&/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    v16 = objc_msgSend(v11, "scanUpToCharactersFromSet:intoString:", v15, &v73);
    v17 = v73;

    if (!v16)
      goto LABEL_34;
    if (!objc_msgSend(v11, "scanString:intoString:", CFSTR("="), 0))
      goto LABEL_34;
    +[UAUserActivity _decodeFromScanner:](UAUserActivity, "_decodeFromScanner:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_34;
    if (objc_msgSend(v17, "isEqual:", CFSTR("t"))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = v18;

      obj = v19;
    }
    else if (objc_msgSend(v17, "isEqual:", CFSTR("u"))
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = v18;

      v64 = v20;
    }
    else if (objc_msgSend(v17, "isEqual:", CFSTR("url"))
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v21 = v18;

      v61 = v21;
    }
    else if (objc_msgSend(v17, "isEqual:", CFSTR("referrer"))
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v22 = v18;

      v60 = v22;
    }
    else if (objc_msgSend(v17, "isEqual:", CFSTR("targetIdentifier"))
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = v18;

      v57 = v23;
    }
    else if (objc_msgSend(v17, "isEqual:", CFSTR("universalLink")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        LODWORD(v52) = objc_msgSend(v18, "BOOLValue");
    }

    if ((objc_msgSend(v11, "isAtEnd") & 1) != 0)
    {
LABEL_34:

      break;
    }
    v24 = objc_msgSend(v11, "scanString:intoString:", CFSTR("&"), 0);

    if ((v24 & 1) == 0)
      break;
  }
  if (v64)
  {
    v27 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v64, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  if (!v56 || !v65)
  {
    v26 = v61;
    if (!v65)
    {
      v65 = 0;
      v26 = self;
      goto LABEL_79;
    }
    if (!v61)
      goto LABEL_72;
LABEL_65:
    v41 = v62;
    v26 = (UAUserActivity *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v26);
    if (v26
      && !objc_msgSend((id)objc_opt_class(), "checkWebpageURL:actionType:throwIfFailed:", v26, 1, 0))
    {
      goto LABEL_90;
    }
    goto LABEL_73;
  }
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v56);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  while ((objc_msgSend(v67, "isAtEnd", v52) & 1) == 0)
  {
    if ((objc_msgSend(v67, "isAtEnd") & 1) != 0)
    {
      v31 = 0;
LABEL_70:

      break;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("=&/"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v30 = objc_msgSend(v67, "scanUpToCharactersFromSet:intoString:", v29, &v72);
    v31 = v72;

    if (!v30)
      goto LABEL_70;
    if (objc_msgSend(v67, "scanString:intoString:", CFSTR("="), 0))
    {
      +[UAUserActivity _decodeFromScanner:](UAUserActivity, "_decodeFromScanner:", v67);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "isEqual:", CFSTR("ue")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v64)
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
          else
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v58;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          objc_msgSend(v33, "allKeys");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v69;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v69 != v36)
                  objc_enumerationMutation(v34);
                v38 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
                if ((objc_msgSend(v25, "containsObject:", v38) & 1) == 0)
                {
                  objc_msgSend(v33, "objectForKeyedSubscript:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, v38);

                }
              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
            }
            while (v35);
          }

          -[UAUserActivity setRequiredUserInfoKeys:](v62, "setRequiredUserInfoKeys:", v25);
          v40 = objc_msgSend(v32, "copy");

          v64 = (void *)v40;
        }
      }

    }
    if ((objc_msgSend(v67, "scanString:intoString:", CFSTR("&"), 0) & 1) == 0)
      goto LABEL_70;

  }
  v26 = v61;
  if (v61)
    goto LABEL_65;
LABEL_72:
  v41 = v62;
LABEL_73:
  if (objc_msgSend(v55, "count", v52))
    v42 = v55;
  else
    v42 = 0;
  v43 = -[UAUserActivity initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:](v41, "initDynamicActivityWithTypeIdentifier:dynamicIdentifier:suggestedActionType:options:", v65, 0, 1, v42);
  v44 = (UAUserActivity *)v43;
  if (!v43)
    goto LABEL_79;
  objc_storeStrong((id *)(v43 + 16), obj);
  if (v64)
  {
    v45 = objc_msgSend(v64, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  userInfo = v44->_userInfo;
  v44->_userInfo = (NSDictionary *)v45;

  -[UAUserActivity setWebpageURL:](v44, "setWebpageURL:", v26);
  if (v60)
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v60);
  else
    v47 = 0;
  -[UAUserActivity setReferrerURL:](v44, "setReferrerURL:", v47);
  if (v60)

  if (v25)
  {
    v48 = objc_msgSend(v25, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  requiredUserInfoKeys = v44->_requiredUserInfoKeys;
  v44->_requiredUserInfoKeys = (NSSet *)v48;

  -[UAUserActivity setTargetContentIdentifier:](v44, "setTargetContentIdentifier:", v57);
  -[UAUserActivity setUniversalLink:](v44, "setUniversalLink:", v53 & 1);
  v62 = v44;
LABEL_90:

  v50 = v62;
  return v50;
}

- (UAUserActivity)initWithUserActivityData:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UAUserActivity *v13;
  id v15;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
    v7 = objc_opt_class();
    v8 = *MEMORY[0x1E0CB2CD0];
    v15 = 0;
    objc_msgSend(v6, "decodeTopLevelObjectOfClass:forKey:error:", v7, v8, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUuid:", v11);

      +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[UAUserActivity initWithManager:userActivityInfo:](self, "initWithManager:userActivityInfo:", v12, v9);
    }
    else
    {
      v12 = self;
      v13 = 0;
    }

    objc_msgSend(v6, "finishDecoding");
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (id)_encodeIntoUserActivityStringWithSave:(BOOL)a3 optionalString:(id *)a4 optionalData:(id *)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  -[UAUserActivity callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:](self, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", a3, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        objc_msgSend(v9, "_createUserActivityStrings:secondaryString:optionalData:", v10, v11, v12);
        if (!v10 || !objc_msgSend(v10, "length"))
        {
          if (a6)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -114, 0);
            v13 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          goto LABEL_22;
        }
        v13 = (void *)objc_msgSend(v10, "copy");
        if (a4)
        {
          if (!objc_msgSend(v11, "length"))
          {
            *a4 = 0;
            if (a5)
            {
LABEL_14:
              if (objc_msgSend(v12, "length"))
              {
                v15 = objc_retainAutorelease((id)objc_msgSend(v12, "copy"));
                *a5 = v15;

              }
              else
              {
                *a5 = 0;
              }
            }
LABEL_22:

            goto LABEL_23;
          }
          v14 = objc_retainAutorelease((id)objc_msgSend(v11, "copy"));
          *a4 = v14;

        }
        if (a5)
          goto LABEL_14;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = 0;
      if (a5)
        goto LABEL_4;
    }
    v12 = 0;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_23:

  return v13;
}

- (id)createUserActivityStringsWithSaving:(BOOL)a3 options:(id)a4 optionalString:(id *)a5 data:(id *)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[9];
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v12 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  if (v10 && -[UAUserActivity needsSave](self, "needsSave"))
  {
    v13 = dispatch_group_create();
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_optionalString_data_error___block_invoke;
    block[3] = &unk_1E6006F70;
    block[4] = self;
    block[5] = &v30;
    v29 = v10;
    block[6] = a5;
    block[7] = a6;
    block[8] = a7;
    dispatch_group_async(v13, v14, block);

    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v24 = v12;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    -[UAUserActivity _encodeIntoUserActivityStringWithSave:optionalString:optionalData:error:](self, "_encodeIntoUserActivityStringWithSave:optionalString:optionalData:error:", v10, &v27, &v26, &v25);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v27;
    v13 = v27;
    v17 = v26;
    v18 = v26;
    v19 = v25;
    v20 = v25;
    v21 = (void *)v31[5];
    v31[5] = v15;

    if (a5)
      objc_storeStrong(a5, v16);
    if (a6)
      objc_storeStrong(a6, v17);
    if (a7)
      objc_storeStrong(a7, v19);

    v12 = v24;
  }

  v22 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __120__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_optionalString_data_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id *v15;
  id *v16;
  id v17;
  id v18;
  id v19;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v18 = 0;
  v19 = 0;
  v17 = 0;
  objc_msgSend(v3, "_encodeIntoUserActivityStringWithSave:optionalString:optionalData:error:", v4, &v19, &v18, &v17);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v7 = v19;
  v8 = v18;
  v9 = v18;
  v10 = v17;
  v11 = v17;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;

  v14 = *(id **)(a1 + 48);
  if (v14)
    objc_storeStrong(v14, v6);
  v15 = *(id **)(a1 + 56);
  if (v15)
    objc_storeStrong(v15, v8);
  v16 = *(id **)(a1 + 64);
  if (v16)
    objc_storeStrong(v16, v10);

  objc_autoreleasePoolPop(v2);
}

void __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6006F98;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  if ((objc_msgSend(v4, "_encodeIntoUserActivityStringWithSave:completionHandler:", v3, v5) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
}

uint64_t __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_encodeIntoUserActivityDataWithSave:(BOOL)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
    -[UAUserActivity callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:](self, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", 1, 0);
  }
  else
  {
    -[UAUserActivity userActivityInfoForSelf](self, "userActivityInfoForSelf", a3, a4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v5, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v6, "finishEncoding");
  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createUserActivityDataWithSaving:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  -[UAUserActivity _encodeIntoUserActivityDataWithSave:error:](self, "_encodeIntoUserActivityDataWithSave:error:", a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)createUserActivityDataWithSaving:(BOOL)a3 options:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v14;
  _QWORD block[5];
  id v16;
  BOOL v17;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (v6 && -[UAUserActivity needsSave](self, "needsSave"))
  {
    v10 = dispatch_group_create();
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityDataWithSaving_options_completionHandler___block_invoke;
    block[3] = &unk_1E6006FC0;
    block[4] = self;
    v17 = v6;
    v16 = v9;
    dispatch_group_async(v10, v11, block);

  }
  else
  {
    v14 = 0;
    -[UAUserActivity _encodeIntoUserActivityDataWithSave:error:](self, "_encodeIntoUserActivityDataWithSave:error:", 0, &v14);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = v14;
    (*((void (**)(id, NSObject *, id))v9 + 2))(v9, v10, v12);

  }
  return 1;
}

void __109__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityDataWithSaving_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v7 = 0;
  objc_msgSend(v3, "_encodeIntoUserActivityDataWithSave:error:", v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
}

+ (id)_decodeFromScanner:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  int v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v20;
  int v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t i;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v4 = a3;
  if (objc_msgSend(v4, "scanString:intoString:", CFSTR("--"), 0))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v7 = (__CFString *)v6;
    goto LABEL_51;
  }
  if (!objc_msgSend(v4, "scanString:intoString:", CFSTR("'"), 0))
  {
    if (objc_msgSend(v4, "scanString:intoString:", CFSTR("$"), 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("$"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v10 = objc_msgSend(v4, "scanUpToCharactersFromSet:intoString:", v9, &v32);
      v11 = v32;

      if (v10)
        v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
      else
        v7 = 0;
      objc_msgSend(v4, "scanString:intoString:", CFSTR("$"), 0);
      goto LABEL_50;
    }
    if (objc_msgSend(v4, "scanString:intoString:", CFSTR("{("), 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_15:
        if ((objc_msgSend(v4, "scanString:intoString:", CFSTR(")}"), 0) & 1) == 0)
        {
          while (1)
          {
            objc_msgSend(a1, "_decodeFromScanner:", v4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
              break;
            objc_msgSend(v11, "addObject:", v12);

            if ((objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0) & 1) == 0)
              goto LABEL_15;
          }

          v11 = 0;
        }
      }
LABEL_49:
      v7 = (__CFString *)objc_msgSend(v11, "copy");
LABEL_50:

      v5 = 0;
      goto LABEL_51;
    }
    if (objc_msgSend(v4, "scanString:intoString:", CFSTR("("), 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_24:
        if ((objc_msgSend(v4, "isAtEnd") & 1) == 0
          && (objc_msgSend(v4, "scanString:intoString:", CFSTR(")"), 0) & 1) == 0)
        {
          while (1)
          {
            objc_msgSend(a1, "_decodeFromScanner:", v4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
              break;
            objc_msgSend(v11, "addObject:", v13);

            if ((objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0) & 1) == 0)
              goto LABEL_24;
          }

          v11 = 0;
        }
      }
      goto LABEL_49;
    }
    if (objc_msgSend(v4, "scanString:intoString:", CFSTR("{"), 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_35:
        if ((objc_msgSend(v4, "isAtEnd") & 1) == 0
          && (objc_msgSend(v4, "scanString:intoString:", CFSTR("}"), 0) & 1) == 0)
        {
          while (1)
          {
            objc_msgSend(a1, "_decodeFromScanner:", v4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            if (!objc_msgSend(v4, "scanString:intoString:", CFSTR("="), 0))
              break;
            objc_msgSend(a1, "_decodeFromScanner:", v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
              break;
            objc_msgSend(v11, "setObject:forKey:", v15, v14);

            if ((objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0) & 1) == 0)
              goto LABEL_35;
          }

          v11 = 0;
        }
      }
      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789.-"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v17 = objc_msgSend(v4, "scanCharactersFromSet:intoString:", v16, &v31);
    v5 = v31;

    if (v17)
    {
      if (!objc_msgSend(v5, "containsString:", CFSTR(".")))
      {
        if ((objc_msgSend(v5, "containsString:", CFSTR("-")) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
          v6 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
          for (i = 0; i < objc_msgSend(v5, "length"); ++i)
            v27 = 10 * v27 + objc_msgSend(v5, "characterAtIndex:", i) - 48;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27);
          v6 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_3;
      }
      v18 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v18, "numberFromString:", v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_61:

      goto LABEL_51;
    }
    if (objc_msgSend(v4, "scanString:intoString:", CFSTR("^d"), 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789-"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v21 = objc_msgSend(v4, "scanCharactersFromSet:intoString:", v20, &v30);
      v18 = v30;

      if (v21)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v22, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
        objc_msgSend(v22, "dateFromString:", v18);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "scanString:intoString:", CFSTR("^"), 0);

        goto LABEL_61;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "scanString:intoString:", CFSTR("^url^"), 0))
        goto LABEL_12;
      v29 = 0;
      v23 = objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("%%^"), &v29);
      v24 = v29;
      v18 = v24;
      if (v23)
      {
        v25 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v24, "stringByRemovingPercentEncoding");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "URLWithString:", v26);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "scanString:intoString:", CFSTR("%%^"), 0);
        goto LABEL_61;
      }
    }
    v7 = 0;
    goto LABEL_61;
  }
  v33 = 0;
  v8 = objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("'"), &v33);
  v5 = v33;
  if (v8)
  {
    if (objc_msgSend(v4, "scanString:intoString:", CFSTR("'"), 0))
    {
      objc_msgSend(v5, "stringByRemovingPercentEncoding");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_12:
    v7 = 0;
    goto LABEL_51;
  }
  if ((objc_msgSend(v4, "isAtEnd") & 1) != 0)
    goto LABEL_12;
  if (objc_msgSend(v4, "scanString:intoString:", CFSTR("'"), 0))
    v7 = &stru_1E60084E8;
  else
    v7 = 0;
LABEL_51:

  return v7;
}

+ (id)_decodeFromString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAUserActivity _decodeFromScanner:](UAUserActivity, "_decodeFromScanner:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_decodeFromEntireString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAUserActivity _decodeFromScanner:](UAUserActivity, "_decodeFromScanner:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v3, "isAtEnd") & 1) == 0)
  {

    v4 = 0;
  }

  return v4;
}

+ (BOOL)registerAsProxyForApplication:(int)a3 options:(id)a4 completionBlock:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = a5;
  +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "registerAsProxyForApplication:options:completionBlock:", v6, v7, v8);

  return v6;
}

- (void)updateForwardToCoreSpotlightIndexer:(char)a3
{
  int v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  UAUserActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj->_forwardToCoreSpotlightIndexerCount + v3;
  obj->_forwardToCoreSpotlightIndexerCount = v4;
  if (v4)
  {
    -[UAUserActivity manager](obj, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userActivityIsActive:", obj);

    -[UAUserActivity manager](obj, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForApplicationDeactivateIfNecessary");

    objc_sync_exit(obj);
    if ((v6 & 1) != 0)
      -[UAUserActivity indexActivity:forceIndexing:](obj, "indexActivity:forceIndexing:", 1, 0.0);
  }
  else
  {
    objc_sync_exit(obj);

  }
}

+ (void)deleteSavedUserActivitiesWithPersistentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "Deleting saved user activities with persistent identifiers: %@", buf, 0xCu);
  }

  getCSSearchableIndexClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class defaultSearchableIndex](getCSSearchableIndexClass(), "defaultSearchableIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mainBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __114__UAUserActivity_UAUserActivitySiriActions__deleteSavedUserActivitiesWithPersistentIdentifiers_completionHandler___block_invoke;
      v13[3] = &unk_1E60075A8;
      v14 = v7;
      objc_msgSend(v9, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:completionHandler:", v6, v10, v13);

    }
    else
    {
      _uaGetLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
      }

      v7[2](v7);
    }

  }
  else
  {
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
    }

    v7[2](v7);
  }

}

void __114__UAUserActivity_UAUserActivitySiriActions__deleteSavedUserActivitiesWithPersistentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v3;
      v6 = "Error deleting saved items: %{public}@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1AF7EB000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    v6 = "Deleted saved user activities";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v10);
}

- (void)setPayload:(id)a3 object:(id)a4 identifier:(id)a5
{
  -[UAUserActivity setPayload:object:identifier:dirty:](self, "setPayload:object:identifier:dirty:", a3, a4, a5, 0);
}

- (id)payloadUpdateBlockForIdentifier:(id)a3
{
  id v4;
  void *v5;
  UAUserActivity *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[UAUserActivity payloadUpdateBlocks](self, "payloadUpdateBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = self;
      objc_sync_enter(v6);
      -[UAUserActivity payloadUpdateBlocks](v6, "payloadUpdateBlocks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v6);
    }
  }
  else
  {
    v5 = 0;
  }
  v8 = _Block_copy(v5);

  return v8;
}

- (BOOL)isPayloadDirty:(id)a3
{
  id v4;
  void *v5;
  UAUserActivity *v6;

  v4 = a3;
  if (v4)
  {
    -[UAUserActivity dirtyPayloadIdentifiers](self, "dirtyPayloadIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = self;
      objc_sync_enter(v6);
      if ((-[NSMutableSet containsObject:](v6->_dirtyPayloadIdentifiers, "containsObject:", v4) & 1) != 0)
        goto LABEL_4;
      if (!objc_msgSend(v4, "isEqual:", CFSTR("UAUserActivityUserInfoPayload")))
      {
        LOBYTE(v5) = 0;
        goto LABEL_10;
      }
      if (-[UAUserActivity needsSave](v6, "needsSave"))
LABEL_4:
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = -[UAUserActivity dirty](v6, "dirty");
LABEL_10:
      objc_sync_exit(v6);

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

@end
