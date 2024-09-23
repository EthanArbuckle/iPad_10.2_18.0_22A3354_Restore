@implementation ICUserIdentityStore

- (int64_t)identityStoreStyle
{
  return -[ICUserIdentityStoreCoding identityStoreStyle](self->_codingHelper, "identityStoreStyle");
}

- (id)getPropertiesForUserIdentity:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ICUserIdentityStore *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__33687;
  v27 = __Block_byref_object_dispose__33688;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__33687;
  v21 = __Block_byref_object_dispose__33688;
  v22 = 0;
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__ICUserIdentityStore_getPropertiesForUserIdentity_error___block_invoke;
  v12[3] = &unk_1E43909C0;
  v9 = v7;
  v13 = v9;
  v14 = self;
  v15 = &v17;
  v16 = &v23;
  dispatch_sync(accessQueue, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v24[5]);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

+ (ICUserIdentityStore)nullIdentityStore
{
  if (nullIdentityStore_sNullIdentityStoreOnceToken != -1)
    dispatch_once(&nullIdentityStore_sNullIdentityStoreOnceToken, &__block_literal_global_46_33773);
  return (ICUserIdentityStore *)(id)nullIdentityStore_sNullIdentityStore;
}

void __58__ICUserIdentityStore_getPropertiesForUserIdentity_error___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isContentProtectionEnabled")
    && (objc_msgSend(v2, "isDeviceClassCUnlocked") & 1) == 0)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = a1[4];
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Request for properties for user identity %@ before first unlock.", buf, 0xCu);
    }

  }
  v6 = a1[4];
  v5 = (void *)a1[5];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "_existingIdentityPropertiesForUserIdentity:error:", v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = objc_msgSend(v8, "copy");
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[4];
      v14 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to load properties for identity %{public}@. err=%{public}@", buf, 0x16u);
    }

  }
}

void __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isContentProtectionEnabled")
    && (objc_msgSend(v2, "isDeviceClassCUnlocked") & 1) == 0)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = a1[4];
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Request for properties for user identity %@ before first unlock.", buf, 0xCu);
    }

  }
  v6 = a1[4];
  v5 = (void *)a1[5];
  v17 = 0;
  objc_msgSend(v5, "_existingIdentityPropertiesForUserIdentity:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = (void *)a1[6];
  v10 = *(NSObject **)(a1[5] + 88);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke_24;
  v13[3] = &unk_1E4390E58;
  v15 = v8;
  v16 = v9;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v13);

}

- (BOOL)isEqual:(id)a3
{
  ICUserIdentityStore *v4;
  ICUserIdentityStore *v5;
  int64_t v6;
  ICDelegateAccountStoreOptions *delegateAccountStoreOptions;
  ICDelegateAccountStoreOptions *v8;
  ICDelegateAccountStoreOptions *v9;
  ICDelegateAccountStoreOptions *v10;
  char v11;

  v4 = (ICUserIdentityStore *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[ICUserIdentityStore isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[ICUserIdentityStoreCoding identityStoreStyle](self->_codingHelper, "identityStoreStyle");
    if (v6 == -[ICUserIdentityStoreCoding identityStoreStyle](v5->_codingHelper, "identityStoreStyle"))
    {
      delegateAccountStoreOptions = self->_delegateAccountStoreOptions;
      v8 = v5->_delegateAccountStoreOptions;
      v9 = delegateAccountStoreOptions;
      v10 = v9;
      if (v9 == v8)
        v11 = 1;
      else
        v11 = -[ICDelegateAccountStoreOptions isEqual:](v9, "isEqual:", v8);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)DSIDForUserIdentity:(id)a3 outError:(id *)a4
{
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ICUserIdentityStore *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__33687;
  v27 = __Block_byref_object_dispose__33688;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__33687;
  v21 = __Block_byref_object_dispose__33688;
  v22 = 0;
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__ICUserIdentityStore_DSIDForUserIdentity_outError___block_invoke;
  v12[3] = &unk_1E43909C0;
  v9 = v7;
  v13 = v9;
  v14 = self;
  v15 = &v23;
  v16 = &v17;
  dispatch_sync(accessQueue, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v10 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (id)_existingIdentityPropertiesForUserIdentity:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  unint64_t v9;
  void *v10;
  id v11;
  ICUserIdentityStoreBackend *backend;
  void *v13;
  ICUserIdentityStoreBackend *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  ICMutableUserIdentityProperties *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v7 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__33687;
  v37 = __Block_byref_object_dispose__33688;
  v38 = 0;
  v8 = -[ICUserIdentityStore _allowsDelegationForUserIdentity:](self, "_allowsDelegationForUserIdentity:", v7);
  v9 = objc_msgSend(v7, "type");
  if (v9 < 4)
  {
LABEL_4:
    v32 = 0;
    -[ICUserIdentityStore _dsidForUserIdentity:error:](self, "_dsidForUserIdentity:error:", v7, &v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v32;
    if (!v11 && v10)
    {
      backend = self->_backend;
      v31 = 0;
      -[ICUserIdentityStoreBackend activeAccountDSIDWithError:](backend, "activeAccountDSIDWithError:", &v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v31;
      if (!v11)
      {
        if (v8 && !objc_msgSend(v13, "isEqual:", v10))
        {
          v11 = 0;
        }
        else
        {
          v14 = self->_backend;
          v30 = 0;
          -[ICUserIdentityStoreBackend identityPropertiesForDSID:error:](v14, "identityPropertiesForDSID:error:", v10, &v30);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v30;
          v16 = objc_msgSend(v15, "mutableCopy");
          v17 = (void *)v34[5];
          v34[5] = v16;

        }
      }

    }
    goto LABEL_14;
  }
  if (v9 != 4)
  {
    if (v9 != 6)
    {
      v11 = 0;
      goto LABEL_15;
    }
    goto LABEL_4;
  }
  v18 = objc_alloc_init(ICMutableUserIdentityProperties);
  v19 = (void *)v34[5];
  v34[5] = (uint64_t)v18;

  v20 = (void *)v34[5];
  objc_msgSend(v7, "deviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCarrierBundleDeviceIdentifier:", v10);
  v11 = 0;
LABEL_14:

LABEL_15:
  if (v34[5])
    v21 = 0;
  else
    v21 = v8;
  if (v21)
  {
    v29 = v11;
    -[ICUserIdentityStore _openDelegateAccountStoreWithError:](self, "_openDelegateAccountStoreWithError:", &v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v29;

    if (v22)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __72__ICUserIdentityStore__existingIdentityPropertiesForUserIdentity_error___block_invoke;
      v26[3] = &unk_1E4390BB8;
      v28 = &v33;
      v27 = v7;
      objc_msgSend(v22, "readUsingBlock:", v26);

    }
    v11 = v23;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  v24 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v24;
}

- (id)_dsidForUserIdentity:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t *p_lastKnownActiveAccountTimestamp;
  uint64_t v12;
  ICValueHistory *activeAccountHistory;
  uint64_t v14;
  ICUserIdentityStoreBackend *v15;
  void *v16;
  id v17;
  ICUserIdentityStoreBackend *v18;
  uint64_t v19;
  void *v20;
  ICUserIdentityStoreBackend *v21;
  ICUserIdentityStoreBackend *backend;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v7 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  objc_msgSend(v7, "DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasResolvedDSID") & 1) != 0)
  {
    v9 = 0;
    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
  v10 = objc_msgSend(v7, "type");
  p_lastKnownActiveAccountTimestamp = &self->_lastKnownActiveAccountTimestamp;
  if (!self->_lastKnownActiveAccountTimestamp)
  {
    v14 = mach_absolute_time();
    if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      backend = self->_backend;
      v26 = 0;
      -[ICUserIdentityStoreBackend activeLockerAccountDSIDWithError:](backend, "activeLockerAccountDSIDWithError:", &v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v26;
      if (!v17)
      {
        -[ICValueHistory addValue:timestamp:](self->_activeLockerAccountHistory, "addValue:timestamp:", v16, v14);
        p_lastKnownActiveAccountTimestamp = &self->_lastKnownActiveLockerAccountTimestamp;
        goto LABEL_26;
      }
    }
    else
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        goto LABEL_5;
      v15 = self->_backend;
      v27 = 0;
      -[ICUserIdentityStoreBackend activeAccountDSIDWithError:](v15, "activeAccountDSIDWithError:", &v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v27;
      if (!v17)
      {
        -[ICValueHistory addValue:timestamp:](self->_activeAccountHistory, "addValue:timestamp:", v16, v14);
LABEL_26:
        *p_lastKnownActiveAccountTimestamp = v14;

        goto LABEL_5;
      }
    }
    v9 = v17;

    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_5:
  v9 = 0;
  switch(v10)
  {
    case 0:
      v12 = objc_msgSend(v7, "creationTime");
      activeAccountHistory = self->_activeAccountHistory;
      goto LABEL_13;
    case 1:
      v12 = objc_msgSend(v7, "creationTime");
      activeAccountHistory = self->_activeLockerAccountHistory;
LABEL_13:
      -[ICUserIdentityStore _dsidForTimestamp:history:](self, "_dsidForTimestamp:history:", v12, activeAccountHistory);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_setResolvedDSID:", v19);
      goto LABEL_17;
    case 2:
      v18 = self->_backend;
      v25 = 0;
      -[ICUserIdentityStoreBackend activeAccountDSIDWithError:](v18, "activeAccountDSIDWithError:", &v25);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v25;
      goto LABEL_15;
    case 3:
      v21 = self->_backend;
      v24 = 0;
      -[ICUserIdentityStoreBackend activeLockerAccountDSIDWithError:](v21, "activeLockerAccountDSIDWithError:", &v24);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v24;
LABEL_15:
      v9 = v20;

      goto LABEL_18;
    case 6:
      objc_msgSend(v7, "DSID");
      v19 = objc_claimAutoreleasedReturnValue();

LABEL_17:
      v9 = 0;
LABEL_18:
      v8 = (void *)v19;
      break;
    default:
      break;
  }
  if (a4)
LABEL_20:
    *a4 = objc_retainAutorelease(v9);
LABEL_21:

  return v8;
}

- (id)_dsidForTimestamp:(unint64_t)a3 history:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  objc_msgSend(v7, "firstValueBeforeTimestamp:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "firstValueAfterOrEqualToTimestamp:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)_assertNonNullIdentityStoreForSelector:(SEL)a3
{
  id v5;

  if (-[ICUserIdentityStoreCoding identityStoreStyle](self->_codingHelper, "identityStoreStyle", a3) == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICUserIdentityStore.m"), 1293, CFSTR("The following method is not supported on the null identity store: %s."), sel_getName(a2));

  }
}

void __52__ICUserIdentityStore_DSIDForUserIdentity_outError___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasResolvedDSID");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "DSID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    return;
  }
  v7 = objc_msgSend(v3, "type");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
  {
    v8 = mach_absolute_time();
    if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v28 = *(id *)(v15 + 40);
      objc_msgSend(v14, "activeLockerAccountDSIDWithError:", &v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v15 + 40), v28);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
LABEL_11:

        goto LABEL_12;
      }
      v12 = 72;
      v13 = 16;
    }
    else
    {
      if ((v7 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        goto LABEL_12;
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v10 + 40);
      objc_msgSend(v9, "activeAccountDSIDWithError:", &obj);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v10 + 40), obj);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        goto LABEL_11;
      v12 = 64;
      v13 = 8;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + v13), "addValue:timestamp:", v11, v8);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + v12) = v8;
    goto LABEL_11;
  }
LABEL_12:
  switch(v7)
  {
    case 0:
      v16 = *(void **)(a1 + 40);
      v17 = objc_msgSend(*(id *)(a1 + 32), "creationTime");
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      goto LABEL_15;
    case 1:
      v16 = *(void **)(a1 + 40);
      v17 = objc_msgSend(*(id *)(a1 + 32), "creationTime");
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
LABEL_15:
      objc_msgSend(v16, "_dsidForTimestamp:history:", v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      objc_msgSend(*(id *)(a1 + 32), "_setResolvedDSID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      return;
    case 2:
      v22 = *(void **)(a1 + 40);
      v23 = mach_absolute_time();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      goto LABEL_18;
    case 3:
      v22 = *(void **)(a1 + 40);
      v23 = mach_absolute_time();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
LABEL_18:
      objc_msgSend(v22, "_dsidForTimestamp:history:", v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "DSID");
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      break;
    default:
      return;
  }
}

- (BOOL)_allowsDelegationForUserIdentity:(id)a3
{
  id v5;
  uint64_t v6;
  int v7;
  ICUserIdentityStoreBackend *backend;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  if (objc_msgSend(v5, "allowsDelegation"))
  {
    v6 = objc_msgSend(v5, "type");
    if (v6 == 6)
    {
      backend = self->_backend;
      v13 = 0;
      -[ICUserIdentityStoreBackend activeAccountDSIDWithError:](backend, "activeAccountDSIDWithError:", &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "DSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == v9)
        LOBYTE(v7) = 0;
      else
        v7 = objc_msgSend(v10, "isEqual:", v9) ^ 1;

    }
    else
    {
      LOBYTE(v7) = v6 == 4;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (ICUserIdentityStore)defaultIdentityStore
{
  if (defaultIdentityStore_sOnceToken != -1)
    dispatch_once(&defaultIdentityStore_sOnceToken, &__block_literal_global_33774);
  return (ICUserIdentityStore *)(id)defaultIdentityStore_sDefaultIdentityStore;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  ICDelegateAccountStoreOptions *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  uint64_t v58;
  uint64_t v59;
  int64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t data;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v66 = __ROR8__(v14 + v13, 32);
  v69 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = -[ICUserIdentityStoreCoding identityStoreStyle](self->_codingHelper, "identityStoreStyle");
  v19 = (v17 + v63) ^ __ROR8__(v63, 51);
  v20 = v66 + (v69 ^ v18);
  v21 = __ROR8__(v69 ^ v18, 48);
  v22 = (v20 ^ v21) + __ROR8__(v17 + v63, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v67 = __ROR8__(v24, 32);
  v70 = v23;
  v61 = v22 ^ v18;
  v64 = v24 ^ __ROR8__(v19, 47);
  v25 = self->_delegateAccountStoreOptions;
  data = -[ICDelegateAccountStoreOptions hash](v25, "hash");
  v26 = (v61 + v64) ^ __ROR8__(v64, 51);
  v27 = v67 + (v70 ^ data);
  v28 = __ROR8__(v70 ^ data, 48);
  v29 = (v27 ^ v28) + __ROR8__(v61 + v64, 32);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v68 = __ROR8__(v31, 32);
  v71 = v30;
  v62 = v29 ^ data;
  v65 = v31 ^ __ROR8__(v26, 47);

  v32 = (v62 + v65) ^ __ROR8__(v65, 51);
  v33 = v68 + (v71 ^ 0x1800000000000000);
  v34 = __ROR8__(v71 ^ 0x1800000000000000, 48);
  v35 = (v33 ^ v34) + __ROR8__(v62 + v65, 32);
  v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  v37 = v33 + v32;
  v38 = v37 ^ __ROR8__(v32, 47);
  v39 = (v35 ^ 0x1800000000000000) + v38;
  v40 = v39 ^ __ROR8__(v38, 51);
  v41 = (__ROR8__(v37, 32) ^ 0xFFLL) + v36;
  v42 = __ROR8__(v36, 48);
  v43 = __ROR8__(v39, 32) + (v41 ^ v42);
  v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  v45 = v40 + v41;
  v46 = v45 ^ __ROR8__(v40, 47);
  v47 = v46 + v43;
  v48 = v47 ^ __ROR8__(v46, 51);
  v49 = __ROR8__(v45, 32) + v44;
  v50 = __ROR8__(v44, 48);
  v51 = __ROR8__(v47, 32) + (v49 ^ v50);
  v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  v53 = v48 + v49;
  v54 = v53 ^ __ROR8__(v48, 47);
  v55 = v54 + v51;
  v56 = v55 ^ __ROR8__(v54, 51);
  v57 = __ROR8__(v53, 32) + v52;
  v58 = __ROR8__(v52, 48);
  v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  return (v56 + v57) ^ __ROR8__(v56, 47) ^ v59 ^ __ROR8__(v56 + v57, 32) ^ v59 ^ __ROR8__(v57 ^ v58, 43);
}

void __53__ICUserIdentityStore__importValuesFromCodingHelper___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  if (v2 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "uniqueIdentifier"))
  {
    objc_msgSend(*(id *)(a1 + 32), "activeAccountHistory");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addValuesFromHistory:", v4);
    objc_msgSend(*(id *)(a1 + 32), "activeLockerAccountHistory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addValuesFromHistory:", v3);

  }
}

- (void)synchronize
{
  NSObject *accessQueue;
  _QWORD block[5];

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ICUserIdentityStore_synchronize__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)getPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ICUserIdentityStore *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(accessQueue, block);

}

- (id)getPropertiesForActiveICloudAccountReturningError:(id *)a3
{
  NSObject *accessQueue;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__33687;
  v19 = __Block_byref_object_dispose__33688;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__33687;
  v13 = __Block_byref_object_dispose__33688;
  v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ICUserIdentityStore_getPropertiesForActiveICloudAccountReturningError___block_invoke;
  block[3] = &unk_1E4390C10;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __43__ICUserIdentityStore_defaultIdentityStore__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  if (__IsSingleWriter == 1)
  {
    +[ICDelegateAccountStoreSchema defaultDatabasePath](ICDelegateAccountStoreSchema, "defaultDatabasePath");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDelegateAccountStoreOptions singleWriterOptionsWithDatabasePath:](ICDelegateAccountStoreOptions, "singleWriterOptionsWithDatabasePath:", v0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ICDelegateAccountStoreOptions defaultOptionsWithServiceName:](ICDelegateAccountStoreOptions, "defaultOptionsWithServiceName:", CFSTR("com.apple.itunescloud.delegate-account-store"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v1 = -[ICUserIdentityStore _initWithStyle:delegateAccountStoreOptions:]([ICUserIdentityStore alloc], "_initWithStyle:delegateAccountStoreOptions:", 0, v3);
  v2 = (void *)defaultIdentityStore_sDefaultIdentityStore;
  defaultIdentityStore_sDefaultIdentityStore = (uint64_t)v1;

}

- (id)_initWithStyle:(int64_t)a3 delegateAccountStoreOptions:(id)a4
{
  id v6;
  ICUserIdentityStore *v7;
  ICUserIdentityStoreCoding *v8;
  ICUserIdentityStoreCoding *v9;
  ICValueHistory *v10;
  ICValueHistory *activeAccountHistory;
  ICValueHistory *v12;
  ICValueHistory *activeLockerAccountHistory;
  uint64_t v14;
  ICDelegateAccountStoreOptions *delegateAccountStoreOptions;
  __objc2_class *v16;
  ICUserIdentityStoreBackend *v17;
  ICUserIdentityStoreBackend *v18;
  ICUserIdentityStoreCoding *v19;
  ICUserIdentityStoreCoding *codingHelper;
  uint64_t v21;
  ICUserIdentityStoreBackend *backend;
  void *v23;
  id v24;
  ICUserIdentityStoreBackend *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  ICUserIdentityStoreCoding *v30;
  _QWORD v32[4];
  ICUserIdentityStore *v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 != 2)
  {
    v7 = -[ICUserIdentityStore _initCommon](self, "_initCommon");
    if (!v7)
      goto LABEL_18;
    v10 = objc_alloc_init(ICValueHistory);
    activeAccountHistory = v7->_activeAccountHistory;
    v7->_activeAccountHistory = v10;

    v12 = objc_alloc_init(ICValueHistory);
    activeLockerAccountHistory = v7->_activeLockerAccountHistory;
    v7->_activeLockerAccountHistory = v12;

    v14 = objc_msgSend(v6, "copy");
    delegateAccountStoreOptions = v7->_delegateAccountStoreOptions;
    v7->_delegateAccountStoreOptions = (ICDelegateAccountStoreOptions *)v14;

    if (a3 == 1)
    {
      v16 = ICUserIdentityStoreTestingBackend;
    }
    else
    {
      if (a3)
      {
LABEL_10:
        v19 = -[ICUserIdentityStoreCoding initWithIdentityStoreStyle:]([ICUserIdentityStoreCoding alloc], "initWithIdentityStoreStyle:", a3);
        codingHelper = v7->_codingHelper;
        v7->_codingHelper = v19;

        -[ICUserIdentityStoreCoding setDelegateAccountStoreOptions:](v7->_codingHelper, "setDelegateAccountStoreOptions:", v6);
        v21 = mach_absolute_time();
        backend = v7->_backend;
        v35 = 0;
        -[ICUserIdentityStoreBackend activeAccountDSIDWithError:](backend, "activeAccountDSIDWithError:", &v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v35;
        if (v23)
        {
          -[ICValueHistory addValue:timestamp:](v7->_activeAccountHistory, "addValue:timestamp:", v23, v21);
          v7->_lastKnownActiveAccountTimestamp = v21;
        }
        v25 = v7->_backend;
        v34 = v24;
        -[ICUserIdentityStoreBackend activeLockerAccountDSIDWithError:](v25, "activeLockerAccountDSIDWithError:", &v34);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (ICUserIdentityStoreCoding *)v34;

        if (v26)
        {
          -[ICValueHistory addValue:timestamp:](v7->_activeLockerAccountHistory, "addValue:timestamp:", v26, v21);
          v7->_lastKnownActiveLockerAccountTimestamp = v21;
        }
        v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          ICCreateLoggableValueForDSID(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          ICCreateLoggableValueForDSID(v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v28;
          v39 = 2114;
          v40 = v29;
          v41 = 2048;
          v42 = v21;
          _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - initializing account histories with activeAccountDSID = %{public}@, activeLockerAccountDSID = %{public}@, timestamp = %lld", buf, 0x20u);

        }
        v30 = v7->_codingHelper;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __66__ICUserIdentityStore__initWithStyle_delegateAccountStoreOptions___block_invoke;
        v32[3] = &unk_1E43913D8;
        v7 = v7;
        v33 = v7;
        -[ICUserIdentityStoreCoding lock:](v30, "lock:", v32);
        -[ICUserIdentityStore _initializeLocalStoreAccountProperties](v7, "_initializeLocalStoreAccountProperties");

        goto LABEL_17;
      }
      v16 = ICUserIdentityStoreACAccountBackend;
    }
    v17 = (ICUserIdentityStoreBackend *)objc_alloc_init(v16);
    v18 = v7->_backend;
    v7->_backend = v17;

    -[ICUserIdentityStoreBackend setDelegate:](v7->_backend, "setDelegate:", v7);
    goto LABEL_10;
  }
  v36.receiver = self;
  v36.super_class = (Class)ICUserIdentityStore;
  v7 = -[ICUserIdentityStore init](&v36, sel_init);
  if (v7)
  {
    v8 = -[ICUserIdentityStoreCoding initWithIdentityStoreStyle:]([ICUserIdentityStoreCoding alloc], "initWithIdentityStoreStyle:", 2);
    v9 = v7->_codingHelper;
    v7->_codingHelper = v8;
LABEL_17:

  }
LABEL_18:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  ICUserIdentityStoreCoding *codingHelper;
  id v7;
  _QWORD v8[4];
  id v9;
  ICUserIdentityStore *v10;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  codingHelper = self->_codingHelper;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__ICUserIdentityStore_encodeWithCoder___block_invoke;
  v8[3] = &unk_1E4391110;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[ICUserIdentityStoreCoding lock:](codingHelper, "lock:", v8);

}

uint64_t __39__ICUserIdentityStore_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("helper"));
}

uint64_t __66__ICUserIdentityStore__initWithStyle_delegateAccountStoreOptions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setActiveAccountHistory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setActiveLockerAccountHistory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_initializeLocalStoreAccountProperties
{
  void *v3;
  ICLocalStoreAccountProperties *v4;
  ICLocalStoreAccountProperties *localStoreAccountProperties;
  id v6;

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastKnownLocalStoreAccountProperties");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4 = -[ICLocalStoreAccountProperties initWithPropertyListRepresentation:]([ICLocalStoreAccountProperties alloc], "initWithPropertyListRepresentation:", v6);
    localStoreAccountProperties = self->_localStoreAccountProperties;
    self->_localStoreAccountProperties = v4;

  }
  -[ICUserIdentityStore _refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:](self, "_refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:", 1);

}

- (BOOL)_refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  ICUserIdentityStoreBackend *backend;
  ICLocalStoreAccountProperties *v6;
  id v7;
  ICLocalStoreAccountProperties *v8;
  ICLocalStoreAccountProperties *v9;
  BOOL v10;
  ICLocalStoreAccountProperties *v11;
  ICLocalStoreAccountProperties *localStoreAccountProperties;
  NSObject *callbackQueue;
  BOOL v14;
  NSObject *v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  backend = self->_backend;
  v18 = 0;
  -[ICUserIdentityStoreBackend localStoreAccountPropertiesWithError:](backend, "localStoreAccountPropertiesWithError:", &v18);
  v6 = (ICLocalStoreAccountProperties *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (!v6)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to fetch local store account with error: %{public}@.", buf, 0xCu);
    }

    goto LABEL_11;
  }
  v8 = self->_localStoreAccountProperties;
  if (v8 == v6)
  {

    goto LABEL_11;
  }
  v9 = v8;
  v10 = -[ICLocalStoreAccountProperties isEqual:](v8, "isEqual:", v6);

  if (v10)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v11 = (ICLocalStoreAccountProperties *)-[ICLocalStoreAccountProperties copy](v6, "copy");
  localStoreAccountProperties = self->_localStoreAccountProperties;
  self->_localStoreAccountProperties = v11;

  if (v3)
  {
    callbackQueue = self->_callbackQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __88__ICUserIdentityStore__refreshLocalStoreAccountPropertiesAllowingDidChangeNotification___block_invoke;
    v17[3] = &unk_1E43913D8;
    v17[4] = self;
    dispatch_async(callbackQueue, v17);
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (id)_initCommon
{
  ICUserIdentityStore *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *callbackQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICUserIdentityStore;
  v2 = -[ICUserIdentityStore init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStore.accessQueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStore.callback", v7);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

uint64_t __34__ICUserIdentityStore_synchronize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "synchronize");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_localStoreAccountProperties, 0);
  objc_storeStrong((id *)&self->_delegateAccountStoreOptions, 0);
  objc_storeStrong((id *)&self->_delegateAccountStore, 0);
  objc_storeStrong((id *)&self->_codingHelper, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_activeLockerAccountHistory, 0);
  objc_storeStrong((id *)&self->_activeAccountHistory, 0);
}

- (id)userIdentitiesForManageableAccountsWithError:(id *)a3
{
  ICUserIdentityStoreBackend *backend;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  backend = self->_backend;
  v21 = 0;
  -[ICUserIdentityStoreBackend allManageableStoreAccountDSIDsWithError:](backend, "allManageableStoreAccountDSIDsWithError:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - Error retrieving user identities for manageable accounts - error=%{public}@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);
  v15 = (void *)objc_msgSend(v9, "copy", (_QWORD)v17);

  return v15;
}

- (ICUserIdentityStore)initWithCoder:(id)a3
{
  ICUserIdentityStore *v4;
  void *v5;
  uint64_t v6;
  ICUserIdentityStore *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = (ICUserIdentityStore *)a3;
  -[ICUserIdentityStore decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("helper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "identityStoreStyle");
    switch(v6)
    {
      case 2:
        +[ICUserIdentityStore nullIdentityStore](ICUserIdentityStore, "nullIdentityStore");
        v4 = (ICUserIdentityStore *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        self = 0;
        break;
      case 1:
        v8 = -[ICUserIdentityStore _initCommon](self, "_initCommon");
        if (v8)
        {
          objc_msgSend(v5, "activeAccountHistory");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)*((_QWORD *)v8 + 1);
          *((_QWORD *)v8 + 1) = v9;

          objc_msgSend(v5, "activeLockerAccountHistory");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)*((_QWORD *)v8 + 2);
          *((_QWORD *)v8 + 2) = v11;

          objc_msgSend(v5, "backend");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)*((_QWORD *)v8 + 3);
          *((_QWORD *)v8 + 3) = v13;

          objc_msgSend(*((id *)v8 + 3), "setDelegate:", v8);
          objc_storeStrong((id *)v8 + 4, v5);
          objc_msgSend(v5, "delegateAccountStoreOptions");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)*((_QWORD *)v8 + 6);
          *((_QWORD *)v8 + 6) = v15;

          objc_msgSend(v8, "_initializeLocalStoreAccountProperties");
        }
        self = (ICUserIdentityStore *)v8;
        v4 = self;
        break;
      case 0:
        +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
        v7 = (ICUserIdentityStore *)objc_claimAutoreleasedReturnValue();
        v4 = v7;
        if (v7)
          -[ICUserIdentityStore _importValuesFromCodingHelper:](v7, "_importValuesFromCodingHelper:", v5);
        goto LABEL_9;
    }
  }
  else
  {

    self = 0;
    v4 = 0;
  }

  return v4;
}

- (void)_importValuesFromCodingHelper:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD block[4];
  id v9;
  ICUserIdentityStore *v10;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICUserIdentityStore__importValuesFromCodingHelper___block_invoke;
  block[3] = &unk_1E4391110;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(accessQueue, block);

}

- (void)dealloc
{
  ICDelegateAccountStore *delegateAccountStore;
  OS_dispatch_queue *accessQueue;
  NSObject *v5;
  ICDelegateAccountStore *v6;
  objc_super v7;
  _QWORD block[5];

  delegateAccountStore = self->_delegateAccountStore;
  if (delegateAccountStore)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__ICUserIdentityStore_dealloc__block_invoke;
    block[3] = &unk_1E43913D8;
    block[4] = delegateAccountStore;
    v5 = accessQueue;
    v6 = delegateAccountStore;
    dispatch_barrier_async(v5, block);

  }
  v7.receiver = self;
  v7.super_class = (Class)ICUserIdentityStore;
  -[ICUserIdentityStore dealloc](&v7, sel_dealloc);
}

void __88__ICUserIdentityStore__refreshLocalStoreAccountPropertiesAllowingDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Local store account properties change detected [Posting notification]", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __73__ICUserIdentityStore_getPropertiesForActiveICloudAccountReturningError___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isContentProtectionEnabled")
    && (objc_msgSend(v2, "isDeviceClassCUnlocked") & 1) == 0)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Request for properties for active iCloud account before first unlock.", buf, 2u);
    }

  }
  v4 = *(void **)(a1[4] + 24);
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "identityPropertiesForPrimaryICloudAccountWithError:", &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to load active icloud account properties. err=%{public}@", buf, 0xCu);
    }

  }
}

void __40__ICUserIdentityStore_nullIdentityStore__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  +[ICDelegateAccountStoreOptions defaultOptionsWithServiceName:](ICDelegateAccountStoreOptions, "defaultOptionsWithServiceName:", CFSTR("com.apple.itunescloud.delegate-account-store"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[ICUserIdentityStore _initWithStyle:delegateAccountStoreOptions:]([ICUserIdentityStore alloc], "_initWithStyle:delegateAccountStoreOptions:", 2, v2);
  v1 = (void *)nullIdentityStore_sNullIdentityStore;
  nullIdentityStore_sNullIdentityStore = (uint64_t)v0;

}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v16[3] = &unk_1E4390EA8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(accessQueue, v16);

}

- (void)enumerateDelegateTokensUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E43908F8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(accessQueue, block);

}

- (void)enumerateDelegateTokensWithType:(int64_t)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v9 = a4;
  v10 = a5;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke;
  v14[3] = &unk_1E4390948;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a3;
  v12 = v10;
  v13 = v9;
  dispatch_async(accessQueue, v14);

}

- (void)getDelegationUUIDsForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(accessQueue, block);

}

- (id)getVerificationContextForUserIdentity:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *accessQueue;
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

  v7 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__33687;
  v26 = __Block_byref_object_dispose__33688;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__33687;
  v20 = __Block_byref_object_dispose__33688;
  v21 = 0;
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ICUserIdentityStore_getVerificationContextForUserIdentity_error___block_invoke;
  v12[3] = &unk_1E43909C0;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = &v16;
  v15 = &v22;
  dispatch_sync(accessQueue, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  -[ICUserIdentityStore insertPropertiesForUserIdentity:usingBlock:completionHandler:](self, "insertPropertiesForUserIdentity:usingBlock:completionHandler:", v8, v7, 0);

}

- (BOOL)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__33687;
  v25 = __Block_byref_object_dispose__33688;
  v26 = 0;
  accessQueue = self->_accessQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__ICUserIdentityStore_insertPropertiesForUserIdentity_usingBlock_error___block_invoke;
  v17[3] = &unk_1E43909E8;
  v17[4] = self;
  v12 = v9;
  v18 = v12;
  v20 = &v21;
  v13 = v10;
  v19 = v13;
  dispatch_sync(accessQueue, v17);
  v14 = (void *)v22[5];
  if (a5 && v14)
  {
    *a5 = objc_retainAutorelease(v14);
    v14 = (void *)v22[5];
  }
  v15 = v14 == 0;

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  -[ICUserIdentityStore insertPropertiesForUserIdentity:andPostAccountChangeNotification:usingBlock:completionHandler:](self, "insertPropertiesForUserIdentity:andPostAccountChangeNotification:usingBlock:completionHandler:", v11, 1, v10, v9);

}

- (void)insertPropertiesForUserIdentity:(id)a3 andPostAccountChangeNotification:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E4390A10;
  block[4] = self;
  v19 = v11;
  v22 = a4;
  v20 = v12;
  v21 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  dispatch_async(accessQueue, block);

}

- (void)removeAllDelegateTokensWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4390EF8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

- (void)removeDelegateTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(accessQueue, block);

}

- (void)removeDelegateTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(accessQueue, block);

}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v16[3] = &unk_1E4390EA8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(accessQueue, v16);

}

- (void)removePropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(accessQueue, block);

}

- (void)setActiveAccountWithDSID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v9 = mach_absolute_time();
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E4390AB0;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(accessQueue, v13);

}

- (void)setActiveLockerAccountWithDSID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v9 = mach_absolute_time();
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E4390AB0;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(accessQueue, v13);

}

- (void)disableLockerAccountWithDSID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICUserIdentityStore.m"), 684, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dsID != nil"));

  }
  v9 = mach_absolute_time();
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke;
  block[3] = &unk_1E4390AB0;
  block[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(accessQueue, block);

}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ICUserIdentityStore_synchronizeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4390EF8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

- (void)updatePropertiesForUserIdentity:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  -[ICUserIdentityStore updatePropertiesForUserIdentity:usingBlock:completionHandler:](self, "updatePropertiesForUserIdentity:usingBlock:completionHandler:", v8, v7, 0);

}

- (void)updatePropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke;
  v16[3] = &unk_1E4390AD8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(accessQueue, v16);

}

- (ICLocalStoreAccountProperties)localStoreAccountProperties
{
  NSObject *accessQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33687;
  v11 = __Block_byref_object_dispose__33688;
  v12 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke;
  v6[3] = &unk_1E4391568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICLocalStoreAccountProperties *)v4;
}

- (void)updatePropertiesForLocalStoreAccountUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E43908F8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(accessQueue, block);

}

- (id)userIdentitiesForAllStoreAccountsWithError:(id *)a3
{
  ICUserIdentityStoreBackend *backend;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  backend = self->_backend;
  v21 = 0;
  -[ICUserIdentityStoreBackend allStoreAccountDSIDsWithError:](backend, "allStoreAccountDSIDsWithError:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - Error retrieving user identities for all accounts - error=%{public}@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);
  v15 = (void *)objc_msgSend(v9, "copy", (_QWORD)v17);

  return v15;
}

- (void)userIdentityStoreBackendDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Backend changed", v5, 2u);
  }

  -[ICUserIdentityStore _reloadForExternalChange](self, "_reloadForExternalChange");
}

- (ICUserIdentityStoreBackend)_unsafeBackend
{
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  return self->_backend;
}

- (void)_prepareDelegateAccountStoreWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4390EF8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

- (void)_reloadForExternalChange
{
  NSObject *accessQueue;
  _QWORD block[5];

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICUserIdentityStore__reloadForExternalChange__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_resetDelegateAccountStoreWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4390EF8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

- (void)_unsafe_deleteDelegateAccountStore
{
  NSObject *accessQueue;
  _QWORD block[5];

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICUserIdentityStore__unsafe_deleteDelegateAccountStore__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_updateDelegateAccountStoreUsingBlock:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__ICUserIdentityStore__updateDelegateAccountStoreUsingBlock___block_invoke;
  v8[3] = &unk_1E4390EF8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

- (void)_delegateAccountStoreDidChangeNotification:(id)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICUserIdentityStore__delegateAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)_dispatchDidChangeNotification:(BOOL)a3 didDelegateAccountStoreChange:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICUserIdentityStoreDidChangeNotification"), self);

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("ICUserIdentityStoreDelegateAccountStoreDidChangeNotification"), self);

  }
}

- (id)_openDelegateAccountStoreWithError:(id *)a3
{
  ICDelegateAccountStore *v5;
  ICDelegateAccountStoreOptions *delegateAccountStoreOptions;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  ICDelegateAccountStoreOptions *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  id obj;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  ICDelegateAccountStore *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__33687;
  v33 = __Block_byref_object_dispose__33688;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__33687;
  v27 = __Block_byref_object_dispose__33688;
  v28 = self->_delegateAccountStore;
  if (!v28)
  {
    if (-[ICDelegateAccountStoreOptions isSingleWriter](self->_delegateAccountStoreOptions, "isSingleWriter"))
    {
      v5 = [ICDelegateAccountStore alloc];
      delegateAccountStoreOptions = self->_delegateAccountStoreOptions;
      v7 = v30;
      obj = v30[5];
      v8 = -[ICDelegateAccountStore initSingleWriterWithOptions:error:](v5, "initSingleWriterWithOptions:error:", delegateAccountStoreOptions, &obj);
      objc_storeStrong(v7 + 5, obj);
      v9 = (void *)v24[5];
      v24[5] = v8;

      v10 = v24;
      if (v30[5] || v24[5])
      {
LABEL_11:
        if (v10[5])
        {
          -[ICUserIdentityStore _registerForDelegateAccountStoreNotifications:](self, "_registerForDelegateAccountStoreNotifications:");
          v15 = (void *)v24[5];
        }
        else
        {
          v15 = 0;
        }
        objc_storeStrong((id *)&self->_delegateAccountStore, v15);
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->_delegateAccountStoreOptions)
      {
        v12 = dispatch_semaphore_create(0);
        v13 = self->_delegateAccountStoreOptions;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __58__ICUserIdentityStore__openDelegateAccountStoreWithError___block_invoke;
        v18[3] = &unk_1E4390BE0;
        v20 = &v23;
        v21 = &v29;
        v14 = v12;
        v19 = v14;
        +[ICDelegateAccountStore openWithOptions:completionHandler:](ICDelegateAccountStore, "openWithOptions:completionHandler:", v13, v18);
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

LABEL_10:
        v10 = v24;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v30[5];
    v30[5] = (id)v11;
    goto LABEL_10;
  }
LABEL_15:
  if (a3)
    *a3 = objc_retainAutorelease(v30[5]);
  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

- (id)_openDelegateAccountStoreForUserIdentity:(id)a3 error:(id *)a4
{
  id v7;
  ICDelegateAccountStore *v8;
  void *v9;
  id v10;
  id v12;

  v7 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v8 = self->_delegateAccountStore;
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "allowsDelegation"))
  {
    v12 = 0;
    -[ICUserIdentityStore _openDelegateAccountStoreWithError:](self, "_openDelegateAccountStoreWithError:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v10 = 0;
  v9 = 0;
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v10);
LABEL_9:

  return v9;
}

- (void)_registerForDelegateAccountStoreNotifications:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__delegateAccountStoreDidChangeNotification_, CFSTR("ICDelegateAccountStoreDidChangeNotification"), v5);

}

- (BOOL)_saveIdentityProperties:(id)a3 andPostAccountChangeNotification:(BOOL)a4 forUserIdentity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  ICUserIdentityStoreBackend *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  char v24;
  ICUserIdentityStoreCoding *codingHelper;
  NSObject *callbackQueue;
  BOOL v27;
  _BOOL4 v29;
  _QWORD block[7];
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  id obj;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;

  v29 = a4;
  v10 = a3;
  v11 = a5;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__33687;
  v48 = __Block_byref_object_dispose__33688;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  if (objc_msgSend(v10, "isDelegated"))
  {
    v12 = v45;
    obj = v45[5];
    -[ICUserIdentityStore _openDelegateAccountStoreWithError:](self, "_openDelegateAccountStoreWithError:", &obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12 + 5, obj);
    if (v45[5])
    {
      *((_BYTE *)v41 + 24) = 0;
    }
    else
    {
      v14 = dispatch_semaphore_create(0);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke;
      v35[3] = &unk_1E4390A38;
      v37 = &v44;
      v38 = &v40;
      v15 = v14;
      v36 = v15;
      objc_msgSend(v13, "setIdentityProperties:forUserIdentity:completionHandler:", v10, v11, v35);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  v34 = 0;
  -[ICUserIdentityStore _dsidForUserIdentity:error:](self, "_dsidForUserIdentity:error:", v11, &v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v34;
  if (v16)
  {
    v18 = self->_backend;
    if (objc_msgSend(v10, "isDelegated"))
    {
      v33 = 0;
      -[ICUserIdentityStoreBackend replaceIdentityProperties:forDSID:error:](v18, "replaceIdentityProperties:forDSID:error:", v10, v16, &v33);
      v19 = v33;
      if (objc_msgSend(v19, "code") == -7401)
      {
        objc_msgSend(v19, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("ICError"));

        if (v21)
        {

          v19 = 0;
        }
      }
    }
    else
    {
      v32 = 0;
      -[ICUserIdentityStoreBackend setIdentityProperties:forDSID:error:](v18, "setIdentityProperties:forDSID:error:", v10, v16, &v32);
      v19 = v32;
    }
    *((_BYTE *)v51 + 24) = v19 == 0;

  }
  else
  {
    v19 = 0;
  }
  v22 = v19;
  if (*((_BYTE *)v51 + 24))
  {
    if (*((_BYTE *)v41 + 24))
    {
      v23 = 0;
      v24 = 1;
      goto LABEL_19;
    }
    v22 = v45[5];
  }
  v23 = v22;
  v24 = 0;
LABEL_19:
  codingHelper = self->_codingHelper;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_2;
  v31[3] = &unk_1E43913D8;
  v31[4] = self;
  -[ICUserIdentityStoreCoding lock:](codingHelper, "lock:", v31);
  if (v29)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_3;
    block[3] = &unk_1E4390C10;
    block[4] = self;
    block[5] = &v50;
    block[6] = &v40;
    dispatch_async(callbackQueue, block);
  }
  if (a6)
    *a6 = objc_retainAutorelease(v23);
  if (v23)
    v27 = v24;
  else
    v27 = 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v27;
}

- (void)_unregisterForDelegateAccountStoreNotifications:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("ICDelegateAccountStoreDidChangeNotification"), v5);

}

- (id)_icValidStoreAccountsFromACAccounts:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ICUserIdentityStore _assertNonNullIdentityStoreForSelector:](self, "_assertNonNullIdentityStoreForSelector:", a2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "ic_DSID", (_QWORD)v21);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(v12, "ic_isLocalAccount");

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v12, "ic_DSID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "addObject:", v17);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - _icValidStoreAccountsFromACAccounts=%{public}@", buf, 0xCu);
  }

  v19 = (void *)objc_msgSend(v6, "copy");
  return v19;
}

void __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBackend:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_3(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) | v1) != 0, v1 != 0);
}

void __58__ICUserIdentityStore__openDelegateAccountStoreWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v6)
  {
    v7 = 0;
    v8 = v6;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
  if (v7)

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__ICUserIdentityStore__existingIdentityPropertiesForUserIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "identityPropertiesForUserIdentity:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __66__ICUserIdentityStore__delegateAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICUserIdentityStoreDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __61__ICUserIdentityStore__updateDelegateAccountStoreUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__ICUserIdentityStore__unsafe_deleteDelegateAccountStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "databasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v11 = v2;
  if (v3)
  {
    objc_msgSend(v3, "close");
    objc_msgSend(*(id *)(a1 + 32), "_unregisterForDelegateAccountStoreNotifications:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v2 = v11;
  }
  if (objc_msgSend(v2, "length"))
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3620];
    v7 = v11;
    v8 = objc_alloc_init(v6);
    objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);
    ICSQLiteGetRelatedFilePath(v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v9, 0);

    ICSQLiteGetRelatedFilePath(v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeItemAtPath:error:", v10, 0);
  }
  dispatch_barrier_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 88), &__block_literal_global_49);

}

void __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ICDelegateAccountStore *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  id v23;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isSingleWriter") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    if (v3)
    {
      objc_msgSend(v3, "close");
      objc_msgSend(*(id *)(a1 + 32), "_unregisterForDelegateAccountStoreNotifications:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 48), "databasePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      ICSQLiteTruncateDatabase(v6);
    v7 = [ICDelegateAccountStore alloc];
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v23 = 0;
    v9 = -[ICDelegateAccountStore initSingleWriterWithOptions:error:](v7, "initSingleWriterWithOptions:error:", v8, &v23);
    v10 = v23;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v9;

    v13 = *(_QWORD **)(a1 + 32);
    v14 = v13[5];
    v15 = v14 != 0;
    if (v14)
      objc_msgSend(v13, "_registerForDelegateAccountStoreNotifications:");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7701, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }
  v16 = *(void **)(a1 + 40);
  v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E4390B70;
  v22 = v15;
  v20 = v10;
  v21 = v16;
  v18 = v10;
  dispatch_async(v17, v19);

}

uint64_t __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __47__ICUserIdentityStore__reloadForExternalChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_t v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_t v25;
  char v26;
  int v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _QWORD v35[6];
  char v36;
  _QWORD v37[7];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v47 = 0;
  objc_msgSend(v3, "activeAccountDSIDWithError:", &v47);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v47;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = (uint64_t)v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - reloadForExternalChange failed to obtain active account DSID. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstValueBeforeOrEqualToTimestamp:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      ICCreateLoggableValueForDSID(v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      ICCreateLoggableValueForDSID(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      *(_DWORD *)buf = 134218754;
      v49 = v2;
      v50 = 2114;
      v51 = v9;
      v52 = 2114;
      v53 = v10;
      v54 = 2048;
      v55 = v11;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - checking for active account change at timestamp %llu. activeAccountDSID = %{public}@, lastKnownActiveAccountDSID = %{public}@ (timestamp = %llu)", buf, 0x2Au);

    }
    v6 = v7;
    v12 = v4;
    v13 = v12;
    if (v6 == v12)
    {

    }
    else
    {
      v14 = -[NSObject isEqual:](v6, "isEqual:", v12);

      if ((v14 & 1) != 0)
        goto LABEL_12;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addValue:timestamp:", v13, v2);
      *((_BYTE *)v44 + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v2;
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Active account change detected", buf, 2u);
      }
    }

  }
LABEL_12:

  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v38 = v5;
  objc_msgSend(v15, "activeLockerAccountDSIDWithError:", &v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v38;

  if (v17)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = (uint64_t)v17;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - reloadForExternalChange failed to obtain active locker account DSID. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstValueBeforeOrEqualToTimestamp:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      ICCreateLoggableValueForDSID(v16);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      ICCreateLoggableValueForDSID(v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      *(_DWORD *)buf = 134218754;
      v49 = v2;
      v50 = 2114;
      v51 = v21;
      v52 = 2114;
      v53 = v22;
      v54 = 2048;
      v55 = v23;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - checking for active locker account change at timestamp %llu. activeLockerAccountDSID = %{public}@, lastKnownActiveLockerAccountDSID = %{public}@ (timestamp = %lld)", buf, 0x2Au);

    }
    v18 = v19;
    v24 = v16;
    v25 = v24;
    if (v18 == v24)
    {

    }
    else
    {
      v26 = -[NSObject isEqual:](v18, "isEqual:", v24);

      if ((v26 & 1) != 0)
        goto LABEL_23;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addValue:timestamp:", v25, v2);
      *((_BYTE *)v40 + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v2;
      v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Active locker account change detected", buf, 2u);
      }
    }

  }
LABEL_23:

  v27 = objc_msgSend(*(id *)(a1 + 32), "_refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:", 0);
  v28 = v27;
  if (v27)
  {
    v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Local store account properties change detected", buf, 2u);
    }

  }
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 32);
  v32 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_47;
  v37[3] = &unk_1E4390C10;
  v37[4] = v30;
  v37[5] = &v43;
  v37[6] = &v39;
  objc_msgSend(v31, "lock:", v37);
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(NSObject **)(v33 + 88);
  v35[0] = v32;
  v35[1] = 3221225472;
  v35[2] = __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_2;
  v35[3] = &unk_1E4390B48;
  v35[4] = v33;
  v35[5] = &v43;
  v36 = v28;
  dispatch_async(v34, v35);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

}

uint64_t __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_47(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 32), "setActiveAccountHistory:", *(_QWORD *)(*(_QWORD *)(result + 32) + 8));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "setActiveLockerAccountHistory:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16));
  return result;
}

void __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICUserIdentityStoreDidChangeNotification"), *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICActiveUserIdentityDidChangeNotification"), *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v16 = v5;
    v15 = v4;
    dispatch_async(v6, block);

    v7 = v16;
  }
  else
  {
    objc_msgSend(v3, "databasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E4390B20;
    v11 = 0;
    v12 = v8;
    v13 = v3 != 0;
    v10[4] = v7;
    dispatch_async(v9, v10);

  }
}

uint64_t __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 24);
  v22 = 0;
  objc_msgSend(v2, "localStoreAccountPropertiesWithError:", &v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v22;
  v5 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v6 = objc_msgSend(v3, "mutableCopy");
    (*(void (**)(void))(a1[5] + 16))();
    v7 = *(id *)(a1[4] + 32);
    v8 = *(id *)(a1[4] + 24);
    v9 = *(void **)(a1[4] + 24);
    v21 = v4;
    objc_msgSend(v9, "setLocalStoreAccountProperties:error:", v6, &v21);
    v10 = v21;

    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_45;
    v18[3] = &unk_1E4391110;
    v19 = v7;
    v20 = v8;
    v11 = v8;
    v12 = v7;
    objc_msgSend(v12, "lock:", v18);

    v4 = v10;
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to fetch local store account with error: %{public}@.", buf, 0xCu);
    }
  }

  v13 = (void *)a1[6];
  if (v13)
  {
    v14 = *(NSObject **)(a1[4] + 88);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_2;
    v15[3] = &unk_1E4390EF8;
    v17 = v13;
    v16 = v4;
    dispatch_async(v14, v15);

  }
}

uint64_t __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackend:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

void __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  ICLocalStoreAccountProperties *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  }
  else
  {
    v4 = *(void **)(v2 + 24);
    v16 = 0;
    objc_msgSend(v4, "localStoreAccountPropertiesWithError:", &v16);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v16;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v5;

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(NSObject **)(v13 + 88);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke_43;
      v15[3] = &unk_1E43913D8;
      v15[4] = v13;
      dispatch_async(v14, v15);
    }
    else
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v6;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to fetch local store account synchronously with error: %{public}@.", buf, 0xCu);
      }

      v10 = objc_alloc_init(ICLocalStoreAccountProperties);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 56);
      *(_QWORD *)(v11 + 56) = v10;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
    }
  }
}

void __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke_43(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v2, "_existingIdentityPropertiesForUserIdentity:error:", v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v15 = v5;
    objc_msgSend(v6, "_saveIdentityProperties:andPostAccountChangeNotification:forUserIdentity:error:", v4, 1, v7, &v15);
    v8 = v15;

    v5 = v8;
  }
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke_2;
  v12[3] = &unk_1E4390EF8;
  v10 = *(id *)(a1 + 56);
  v13 = v5;
  v14 = v10;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

void __56__ICUserIdentityStore_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "synchronize");
  v2 = *(void **)(a1 + 40);
  if (v2)
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 88), v2);
}

void __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  char v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v26 = 0;
  objc_msgSend(v2, "activeLockerAccountDSIDWithError:", &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  if (v4)
  {
    v5 = 0;
  }
  else if (v3 == *(void **)(a1 + 40))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqual:");
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v25 = v4;
  objc_msgSend(v7, "disableLockerAccountDSID:error:", v6, &v25);
  v8 = v25;

  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v28 = v10;
    v29 = 2048;
    v30 = v11;
    v31 = 2114;
    v32 = v8;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - removed cloud library setting from %{public}@ (timestamp = %lld) error=%{public}@", buf, 0x20u);

  }
  if (v8)
    v12 = 0;
  else
    v12 = v5;
  v13 = MEMORY[0x1E0C809B0];
  if (v12 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addValue:timestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_40;
    v24[3] = &unk_1E43913D8;
    v24[4] = v14;
    objc_msgSend(v15, "lock:", v24);
  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 88);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_2;
  block[3] = &unk_1E4390B20;
  v23 = v5;
  block[4] = v16;
  v18 = *(id *)(a1 + 48);
  v21 = v8;
  v22 = v18;
  v19 = v8;
  dispatch_async(v17, block);

}

uint64_t __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_40(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setActiveLockerAccountHistory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBackend:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", 1, 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 40) == 0);
  return result;
}

void __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  char v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v29 = 0;
  objc_msgSend(v2, "activeLockerAccountDSIDWithError:", &v29);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v29;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    goto LABEL_13;
  }
  v8 = *(id *)(a1 + 40);
  if (v3 == v8)
  {

    goto LABEL_8;
  }
  v9 = v8;
  v10 = objc_msgSend(v3, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_8:
    v7 = 0;
    v6 = 0;
    goto LABEL_13;
  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v28 = 0;
  objc_msgSend(v12, "updateActiveLockerAccountDSID:error:", v11, &v28);
  v13 = v28;
  if (v13)
  {
    v6 = v13;
  }
  else
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 2048;
      v33 = v16;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - updating active locker account to %{public}@ (timestamp = %lld)", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addValue:timestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 32);
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_32;
    v27[3] = &unk_1E43913D8;
    v27[4] = v17;
    objc_msgSend(v18, "lock:", v27);
    v6 = 0;
  }
  v7 = 1;
LABEL_13:
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(NSObject **)(v19 + 88);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_2;
  block[3] = &unk_1E4390B20;
  v26 = v7;
  block[4] = v19;
  v21 = *(id *)(a1 + 48);
  v24 = v6;
  v25 = v21;
  v22 = v6;
  dispatch_async(v20, block);

}

uint64_t __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_32(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setActiveLockerAccountHistory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBackend:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", 1, 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 40) == 0);
  return result;
}

void __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  char v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v29 = 0;
  objc_msgSend(v2, "activeAccountDSIDWithError:", &v29);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v29;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    goto LABEL_13;
  }
  v8 = *(id *)(a1 + 40);
  if (v3 == v8)
  {

    goto LABEL_8;
  }
  v9 = v8;
  v10 = objc_msgSend(v3, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_8:
    v7 = 0;
    v6 = 0;
    goto LABEL_13;
  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v28 = 0;
  objc_msgSend(v12, "updateActiveAccountDSID:error:", v11, &v28);
  v13 = v28;
  if (v13)
  {
    v6 = v13;
  }
  else
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 2048;
      v33 = v16;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - updating active account to %{public}@ (timestamp = %lld)", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addValue:timestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 32);
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_31;
    v27[3] = &unk_1E43913D8;
    v27[4] = v17;
    objc_msgSend(v18, "lock:", v27);
    v6 = 0;
  }
  v7 = 1;
LABEL_13:
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(NSObject **)(v19 + 88);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_2;
  block[3] = &unk_1E4390B20;
  v26 = v7;
  block[4] = v19;
  v21 = *(id *)(a1 + 48);
  v24 = v6;
  v25 = v21;
  v22 = v6;
  dispatch_async(v20, block);

}

uint64_t __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_31(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setActiveAccountHistory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBackend:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", 1, 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 40) == 0);
  return result;
}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[7];
  id v25;
  _QWORD v26[7];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[5];
  id v41;

  v2 = dispatch_group_create();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__33687;
  v40[4] = __Block_byref_object_dispose__33688;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 1;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__33687;
  v36 = __Block_byref_object_dispose__33688;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_allowsDelegationForUserIdentity:", *(_QWORD *)(a1 + 40));
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v27 = 0;
    objc_msgSend(v5, "_openDelegateAccountStoreWithError:", &v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    v8 = v27;
    if (v8)
    {
      objc_storeStrong(v33 + 5, v7);
      *((_BYTE *)v29 + 24) = 0;
    }
    else
    {
      dispatch_group_enter(v2);
      v9 = *(_QWORD *)(a1 + 40);
      v26[0] = v4;
      v26[1] = 3221225472;
      v26[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_2;
      v26[3] = &unk_1E4390A38;
      v26[5] = &v32;
      v26[6] = &v28;
      v26[4] = v2;
      objc_msgSend(v6, "removeIdentityPropertiesForUserIdentity:completionHandler:", v9, v26);
    }

  }
  else
  {
    v8 = 0;
  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v25 = v8;
  objc_msgSend(v10, "_dsidForUserIdentity:error:", v11, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  v14 = v25;

  if (v14)
  {
    objc_storeStrong(v33 + 5, v13);
    *((_BYTE *)v29 + 24) = 0;
  }
  else if (v12)
  {
    dispatch_group_enter(v2);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_3;
    v24[3] = &unk_1E4390A38;
    v24[5] = v40;
    v24[6] = v38;
    v24[4] = v2;
    objc_msgSend(v15, "removeIdentityForDSID:completion:", v12, v24);
  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 88);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_4;
  v18[3] = &unk_1E4390A88;
  v21 = v40;
  v22 = &v28;
  v23 = &v32;
  v20 = v38;
  v18[4] = v16;
  v19 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v17, v18);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = a1 + 56;
LABEL_6:
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40);
    v3 = 0;
    goto LABEL_7;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v4 = a1 + 72;
    goto LABEL_6;
  }
  v2 = 0;
  v3 = 1;
LABEL_7:
  v5 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(void **)(v5 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_5;
  v19[3] = &unk_1E43913D8;
  v19[4] = v5;
  objc_msgSend(v7, "lock:", v19);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 88);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_6;
  block[3] = &unk_1E4390A60;
  v10 = *(_QWORD *)(a1 + 64);
  block[4] = v8;
  v17 = v10;
  v13 = *(_OWORD *)(a1 + 40);
  v11 = (id)v13;
  v16 = v13;
  v18 = v3;
  v15 = v2;
  v12 = v2;
  dispatch_async(v9, block);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));

}

uint64_t __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBackend:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_6(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) | v2) != 0, v2 != 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40));
  return result;
}

void __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E43908A8;
    v8 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "removeDelegationUUIDs:forUserIdentity:completionHandler:", v8, v9, v10);
    v7 = v11;
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v14 = v5;
    v13 = v4;
    dispatch_async(v6, block);

    v7 = v14;
LABEL_5:

  }
}

uint64_t __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4;
  v10[3] = &unk_1E4390B20;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 88);
  v10[1] = 3221225472;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));

}

uint64_t __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

void __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_3;
    v9[3] = &unk_1E43908A8;
    v8 = *(_QWORD *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "removeTokensExpiringBeforeDate:completionHandler:", v8, v9);
    v7 = v10;
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v13 = v5;
    v12 = v4;
    dispatch_async(v6, block);

    v7 = v13;
LABEL_5:

  }
}

uint64_t __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_4;
  v10[3] = &unk_1E4390B20;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 88);
  v10[1] = 3221225472;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));

}

uint64_t __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

void __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E43908A8;
    v8 = *(_QWORD *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "removeTokenForUserIdentity:completionHandler:", v8, v9);
    v7 = v10;
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v13 = v5;
    v12 = v4;
    dispatch_async(v6, block);

    v7 = v13;
LABEL_5:

  }
}

uint64_t __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_4;
  v10[3] = &unk_1E4390B20;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 88);
  v10[1] = 3221225472;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));

}

uint64_t __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

void __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E43908A8;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v3, "removeAllTokensWithCompletionHandler:", v9);
    v7 = v10;
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v13 = v5;
    v12 = v4;
    dispatch_async(v6, block);

    v7 = v13;
LABEL_5:

  }
}

uint64_t __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E4390B20;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 88);
  v10[1] = 3221225472;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));

}

uint64_t __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

void __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  ICMutableUserIdentityProperties *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  objc_msgSend(v2, "_existingIdentityPropertiesForUserIdentity:error:", v3, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (!v5)
  {
    v6 = v4;
    if (!v6)
    {
      v6 = objc_alloc_init(ICMutableUserIdentityProperties);
      objc_msgSend(*(id *)(a1 + 40), "deviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMutableUserIdentityProperties setCarrierBundleDeviceIdentifier:](v6, "setCarrierBundleDeviceIdentifier:", v7);

      objc_msgSend(*(id *)(a1 + 40), "DSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMutableUserIdentityProperties setDSID:](v6, "setDSID:", v8);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v9 = *(unsigned __int8 *)(a1 + 64);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v17 = 0;
    objc_msgSend(v10, "_saveIdentityProperties:andPostAccountChangeNotification:forUserIdentity:error:", v6, v9, v11, &v17);
    v5 = v17;

  }
  v12 = *(void **)(a1 + 56);
  if (v12)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke_2;
    v14[3] = &unk_1E4390EF8;
    v16 = v12;
    v15 = v5;
    dispatch_async(v13, v14);

  }
}

uint64_t __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

void __72__ICUserIdentityStore_insertPropertiesForUserIdentity_usingBlock_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  ICMutableUserIdentityProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_existingIdentityPropertiesForUserIdentity:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v6 = v5;
    if (!v6)
    {
      v6 = objc_alloc_init(ICMutableUserIdentityProperties);
      objc_msgSend((id)a1[5], "deviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMutableUserIdentityProperties setCarrierBundleDeviceIdentifier:](v6, "setCarrierBundleDeviceIdentifier:", v7);

      objc_msgSend((id)a1[5], "DSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMutableUserIdentityProperties setDSID:](v6, "setDSID:", v8);

    }
    (*(void (**)(void))(a1[6] + 16))();
    v9 = (void *)a1[4];
    v10 = a1[5];
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(id *)(v11 + 40);
    objc_msgSend(v9, "_saveIdentityProperties:andPostAccountChangeNotification:forUserIdentity:error:", v6, 1, v10, &v12);
    objc_storeStrong((id *)(v11 + 40), v12);

  }
}

void __67__ICUserIdentityStore_getVerificationContextForUserIdentity_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id obj;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_dsidForUserIdentity:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
  {
    v9 = *(void **)(a1[4] + 24);
    if (v5)
    {
      v26 = 0;
      objc_msgSend(v9, "verificationContextForDSID:error:", v5, &v26);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v7, v26);
      v11 = *(_QWORD *)(a1[7] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIdentityStore:", a1[4]);
    }
    else
    {
      v25 = 0;
      objc_msgSend(v9, "activeAccountDSIDWithError:", &v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v7, v25);
      if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      {
        if (v13 || !objc_msgSend((id)a1[5], "allowsAccountEstablishment"))
        {
          v28 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get verification context for user identity - activeAccountDSID=%@ - allowsAccountEstablishment=%u"), v13, objc_msgSend((id)a1[5], "allowsAccountEstablishment"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(a1[6] + 8);
          v23 = *(void **)(v22 + 40);
          *(_QWORD *)(v22 + 40) = v21;

        }
        else
        {
          v14 = *(void **)(a1[4] + 24);
          v15 = *(_QWORD *)(a1[6] + 8);
          v24 = *(id *)(v15 + 40);
          objc_msgSend(v14, "verificationContextForAccountEstablishmentWithError:", &v24);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v15 + 40), v24);
          v17 = *(_QWORD *)(a1[7] + 8);
          v18 = *(void **)(v17 + 40);
          *(_QWORD *)(v17 + 40) = v16;

          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIdentityStore:", a1[4]);
        }
      }

    }
  }

}

uint64_t __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke_24(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v2 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  v5 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_2;
    v16[3] = &unk_1E4390998;
    v17 = *(id *)(a1 + 40);
    v7 = v6;
    v18 = v7;
    objc_msgSend(v3, "readUsingBlock:", v16);

  }
  else
  {
    v7 = 0;
  }
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_4;
  v12[3] = &unk_1E4390E58;
  v9 = *(id *)(a1 + 48);
  v14 = v4;
  v15 = v9;
  v13 = v7;
  v10 = v4;
  v11 = v7;
  dispatch_async(v8, v12);

}

void __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_3;
  v4[3] = &unk_1E4390970;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateDelegationUUIDsForUserIdentity:usingBlock:", v3, v4);

}

uint64_t __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_2;
  v10[3] = &unk_1E4390920;
  v12 = *(_QWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "readUsingBlock:", v10);
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_3;
    v8[3] = &unk_1E4390D18;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

uint64_t __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateTokensWithType:usingBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_2;
  v10[3] = &unk_1E43908D0;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "readUsingBlock:", v10);
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_3;
    block[3] = &unk_1E4390D18;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateTokensUsingBlock:", *(_QWORD *)(a1 + 32));
}

uint64_t __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v2, "_openDelegateAccountStoreWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E43908A8;
    v8 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "addDelegationUUIDs:forUserIdentity:completionHandler:", v8, v9, v10);
    v7 = v11;
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v14 = v5;
    v13 = v4;
    dispatch_async(v6, block);

    v7 = v14;
LABEL_5:

  }
}

uint64_t __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4;
  v10[3] = &unk_1E4390B20;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 88);
  v10[1] = 3221225472;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));

}

uint64_t __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchDidChangeNotification:didDelegateAccountStoreChange:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 40) == 0);
  return result;
}

uint64_t __30__ICUserIdentityStore_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

+ (BOOL)canAccessAccountStore
{
  return objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_canAccessAccountStore");
}

+ (void)_claimSingleWriterStatus
{
  __IsSingleWriter = 1;
}

+ (id)testingIdentityStoreWithDatabasePath:(id)a3
{
  void *v4;
  void *v5;

  +[ICDelegateAccountStoreOptions singleWriterOptionsWithDatabasePath:](ICDelegateAccountStoreOptions, "singleWriterOptionsWithDatabasePath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStyle:delegateAccountStoreOptions:", 1, v4);

  return v5;
}

+ (id)testingIdentityStoreWithSingleWriterService:(id)a3
{
  void *v4;
  void *v5;

  +[ICDelegateAccountStoreOptions defaultOptionsWithServiceEndpoint:](ICDelegateAccountStoreOptions, "defaultOptionsWithServiceEndpoint:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStyle:delegateAccountStoreOptions:", 1, v4);

  return v5;
}

@end
