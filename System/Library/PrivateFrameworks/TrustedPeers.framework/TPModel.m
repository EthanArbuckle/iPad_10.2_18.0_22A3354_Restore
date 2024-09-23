@implementation TPModel

- (TPModel)initWithDecrypter:(id)a3 dbAdapter:(id)a4
{
  id v7;
  id v8;
  TPModel *v9;
  TPModel *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *custodianRecoveryKeys;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TPModel;
  v9 = -[TPModel init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_suppressInitialInfoLogging = 0;
    objc_storeStrong((id *)&v9->_dbAdapter, a4);
    objc_storeStrong((id *)&v10->_decrypter, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    custodianRecoveryKeys = v10->_custodianRecoveryKeys;
    v10->_custodianRecoveryKeys = v11;

  }
  return v10;
}

- (unint64_t)latestEpochAmongPeerIDs:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  id *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = v7;
    v21 = a4;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1DF0E9908]();
        v22 = 0;
        -[TPModel peerWithID:error:](self, "peerWithID:error:", v12, &v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v22;
        if (v15)
        {
          v18 = v15;
          TPModelLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v28 = v12;
            v29 = 2114;
            v30 = v18;
            _os_log_impl(&dword_1DE1BE000, v19, OS_LOG_TYPE_DEFAULT, "error determining epoch of peerID %{public}@: %{public}@", buf, 0x16u);
          }

          objc_autoreleasePoolPop(v13);
          if (v21)
          {
            v18 = objc_retainAutorelease(v18);
            v9 = 0;
            *v21 = v18;
          }
          else
          {
            v9 = 0;
          }
          goto LABEL_20;
        }
        if (v14)
        {
          objc_msgSend(v14, "permanentInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "epoch");

          if (v9 <= v17)
            v9 = v17;
        }

        objc_autoreleasePoolPop(v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v18 = 0;
LABEL_20:

  return v9;
}

- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[TPModel dbAdapter](self, "dbAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "policyWithVersion:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allPeerIDs
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[TPModel dbAdapter](self, "dbAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "allPeerIDs:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)peerCountWithError:(id *)a3
{
  void *v4;
  unint64_t v5;

  -[TPModel dbAdapter](self, "dbAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "peerCount:", a3);

  return v5;
}

- (BOOL)hasAnyPeersWithError:(id *)a3
{
  return -[TPModel peerCountWithError:](self, "peerCountWithError:", a3) != 0;
}

- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x1DF0E9908]();
  -[TPModel dbAdapter](self, "dbAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__TPModel_enumeratePeersUsingBlock_error___block_invoke;
  v13[3] = &unk_1EA8BF110;
  v9 = v6;
  v14 = v9;
  v12 = 0;
  objc_msgSend(v8, "enumeratePeersUsingBlock:error:", v13, &v12);
  v10 = v12;

  objc_autoreleasePoolPop(v7);
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);

  return v10 == 0;
}

- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x1DF0E9908]();
  -[TPModel dbAdapter](self, "dbAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__TPModel_enumerateVouchersUsingBlock_error___block_invoke;
  v13[3] = &unk_1EA8BF138;
  v9 = v6;
  v14 = v9;
  v12 = 0;
  objc_msgSend(v8, "enumerateVouchersUsingBlock:error:", v13, &v12);
  v10 = v12;

  objc_autoreleasePoolPop(v7);
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);

  return v10 == 0;
}

- (unint64_t)voucherCountWithError:(id *)a3
{
  void *v4;
  unint64_t v5;

  -[TPModel dbAdapter](self, "dbAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voucherCount:", a3);

  return v5;
}

- (id)_iterateOverPeersWithBlock:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;
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

  v6 = a3;
  v7 = &v23;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1DF0E9908]();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__TPModel__iterateOverPeersWithBlock_error___block_invoke;
  v13[3] = &unk_1EA8BF160;
  v15 = &v23;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v12 = 0;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v13, &v12);
  v10 = v12;
  if (!v10)
  {
    objc_msgSend((id)v24[5], "minusSet:", v18[5]);
    v7 = (uint64_t *)(id)v24[5];
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v8);
  if (v10)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  _Block_object_dispose(&v23, 8);

  return v7;
}

- (BOOL)hasPotentiallyTrustedPeerTestingOnlyWithError:(id *)a3
{
  BOOL v3;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  _QWORD v12[5];
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1DF0E9908](self, a2);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__TPModel_hasPotentiallyTrustedPeerTestingOnlyWithError___block_invoke;
  v12[3] = &unk_1EA8BF188;
  v12[4] = &buf;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v12, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v8)
  {
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "intersectSet:", v7);
    v3 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count") != 0;
  }

  _Block_object_dispose(&buf, 8);
  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    TPModelLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1DE1BE000, v9, OS_LOG_TYPE_DEFAULT, "hasPotentiallyTrustedPeer error: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v3 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v3;
}

- (id)recoveryKeyPeerID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  ccsha384_di();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", *(_QWORD *)ccsha384_di());
  objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v5, "bytes");

  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "mutableBytes");
  ccdigest();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RK-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allPolicyVersionsWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__TPModel_allPolicyVersionsWithError___block_invoke;
  v10[3] = &unk_1EA8BF1B0;
  v10[4] = &v11;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v10, &v9);
  v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (id)allRegisteredPolicyVersionsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[TPModel dbAdapter](self, "dbAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allRegisteredPolicyVersions:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasPeerWithID:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  -[TPModel peerWithID:error:](self, "peerWithID:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)peerWithID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[TPModel dbAdapter](self, "dbAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peerWithID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyPeerWithNewStableInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  id v24;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27 = 0;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v9, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  v12 = v11;
  if (v10)
  {
    v26 = 0;
    objc_msgSend(v10, "peerWithUpdatedStableInfo:error:", v8, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    if (!v13)
    {
      TPModelLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v9;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_1DE1BE000, v23, OS_LOG_TYPE_DEFAULT, "failed to update stable info for peerID %{public}@: %{public}@", buf, 0x16u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v14);
      goto LABEL_26;
    }
    if (-[TPModel suppressInitialInfoLogging](self, "suppressInitialInfoLogging")
      && (objc_msgSend(v10, "stableInfo"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      TPModelLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      v20 = "peer(%{public}@) initially loaded stable info";
    }
    else
    {
      objc_msgSend(v10, "stableInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stableInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      TPModelLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 != v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138543618;
          v29 = v9;
          v30 = 2114;
          v31 = v8;
          v20 = "peer(%{public}@) stable info is now: %{public}@";
          v21 = v18;
          v22 = 22;
LABEL_24:
          _os_log_impl(&dword_1DE1BE000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }
LABEL_25:

        v24 = v13;
LABEL_26:

        goto LABEL_27;
      }
      if (!v19)
        goto LABEL_25;
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      v20 = "peer(%{public}@) stable info didn't actually change";
    }
    v21 = v18;
    v22 = 12;
    goto LABEL_24;
  }
  if (v11)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    failWithNoPeerWithIDError(a5);
  }
  TPModelLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v9;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_1DE1BE000, v14, OS_LOG_TYPE_DEFAULT, "can't update stable info for peerID %{public}@: %{public}@", buf, 0x16u);
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (id)copyPeerWithNewDynamicInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  id v24;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27 = 0;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v9, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  v12 = v11;
  if (v10)
  {
    v26 = 0;
    objc_msgSend(v10, "peerWithUpdatedDynamicInfo:error:", v8, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    if (!v13)
    {
      TPModelLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v9;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_1DE1BE000, v23, OS_LOG_TYPE_DEFAULT, "failed to update dynamic info for peerID %{public}@: %{public}@", buf, 0x16u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v14);
      goto LABEL_26;
    }
    if (-[TPModel suppressInitialInfoLogging](self, "suppressInitialInfoLogging")
      && (objc_msgSend(v10, "dynamicInfo"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      TPModelLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      v20 = "peer(%{public}@) initially loaded dynamic info";
    }
    else
    {
      objc_msgSend(v10, "dynamicInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dynamicInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      TPModelLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 != v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138543618;
          v29 = v9;
          v30 = 2114;
          v31 = v8;
          v20 = "peer(%{public}@) dynamic info is now: %{public}@";
          v21 = v18;
          v22 = 22;
LABEL_24:
          _os_log_impl(&dword_1DE1BE000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }
LABEL_25:

        v24 = v13;
LABEL_26:

        goto LABEL_27;
      }
      if (!v19)
        goto LABEL_25;
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      v20 = "peer(%{public}@) dynamic info didn't actually change";
    }
    v21 = v18;
    v22 = 12;
    goto LABEL_24;
  }
  if (v11)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    failWithNoPeerWithIDError(a5);
  }
  TPModelLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v9;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_1DE1BE000, v14, OS_LOG_TYPE_DEFAULT, "can't update dynamic info for peerID %{public}@: %{public}@", buf, 0x16u);
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (id)custodianPeerWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actualPeerWithID:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", a3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v6);
    }
    else
    {
      failWithNoPeerWithIDError(a4);
    }
  }

  return v5;
}

- (id)allMachineIDsWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__TPModel_allMachineIDsWithError___block_invoke;
  v10[3] = &unk_1EA8BF1B0;
  v10[4] = &v11;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v10, &v9);
  v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (id)viablePeerCountsByModelIDWithError:(id *)a3
{
  void *v3;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *context;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1DF0E9908]();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = (id)0xAAAAAAAAAAAAAAAALL;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __46__TPModel_viablePeerCountsByModelIDWithError___block_invoke;
  v25[3] = &unk_1EA8BF188;
  v25[4] = &v26;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v25, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;
  if (v19)
  {

    _Block_object_dispose(&v26, 8);
    objc_autoreleasePoolPop(context);
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v19);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend((id)v27[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), context, v19, (_QWORD)v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v14, "longValue") + 1);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v3;
          }
          else
          {
            v16 = &unk_1EA8C7C40;
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v13);
          if (v15)

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v10);
    }

    _Block_object_dispose(&v26, 8);
    objc_autoreleasePoolPop(context);
    v8 = v6;
  }

  return v8;
}

- (id)peerCountsByMachineIDWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__TPModel_peerCountsByMachineIDWithError___block_invoke;
  v12[3] = &unk_1EA8BF1D8;
  v6 = v5;
  v13 = v6;
  v11 = 0;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v12, &v11);
  v7 = v11;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (BOOL)isRecoveryKeyExcluded:(id)a3 error:(id *)a4
{
  BOOL v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = (void *)MEMORY[0x1DF0E9908]();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryKeyPeerID:](self, "recoveryKeyPeerID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__TPModel_isRecoveryKeyExcluded_error___block_invoke;
  v15[3] = &unk_1EA8BF200;
  v10 = v9;
  v16 = v10;
  v17 = &v18;
  v14 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v15, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (!v12)
  {
    objc_msgSend((id)v19[5], "intersectSet:", v11);
    v4 = objc_msgSend((id)v19[5], "count") != 0;
  }

  _Block_object_dispose(&v18, 8);
  objc_autoreleasePoolPop(v8);
  if (v12)
  {
    v4 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v4;
}

- (id)allTrustedPeersWithCurrentRecoveryKeyWithError:(id *)a3
{
  uint64_t *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = &v12;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1DF0E9908]();
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__TPModel_allTrustedPeersWithCurrentRecoveryKeyWithError___block_invoke;
  v11[3] = &unk_1EA8BF200;
  v11[4] = self;
  v11[5] = &v12;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v11, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (!v8)
  {
    objc_msgSend((id)v13[5], "intersectSet:", v7);
    v5 = (uint64_t *)(id)v13[5];
  }

  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (BOOL)hasPotentiallyTrustedPeerPreapprovingKey:(id)a3 error:(id *)a4
{
  BOOL v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = (void *)MEMORY[0x1DF0E9908]();
  +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__TPModel_hasPotentiallyTrustedPeerPreapprovingKey_error___block_invoke;
  v15[3] = &unk_1EA8BF200;
  v10 = v9;
  v16 = v10;
  v17 = &v18;
  v14 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v15, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (!v12)
  {
    objc_msgSend((id)v19[5], "intersectSet:", v11);
    v4 = objc_msgSend((id)v19[5], "count") != 0;
  }

  _Block_object_dispose(&v18, 8);
  objc_autoreleasePoolPop(v8);
  if (v12)
  {
    v4 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v4;
}

- (BOOL)anyTrustedPeerDistrustsOtherPeer:(id)a3 error:(id *)a4
{
  BOOL v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = (void *)MEMORY[0x1DF0E9908]();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__TPModel_anyTrustedPeerDistrustsOtherPeer_error___block_invoke;
  v14[3] = &unk_1EA8BF200;
  v9 = v7;
  v15 = v9;
  v16 = &v17;
  v13 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v14, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (!v11)
  {
    objc_msgSend((id)v18[5], "intersectSet:", v10);
    v4 = objc_msgSend((id)v18[5], "count") != 0;
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v8);
  if (v11)
  {
    v4 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v4;
}

- (BOOL)hasPotentiallyTrustedPeerWithSigningKey:(id)a3 error:(id *)a4
{
  BOOL v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = (void *)MEMORY[0x1DF0E9908]();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__TPModel_hasPotentiallyTrustedPeerWithSigningKey_error___block_invoke;
  v14[3] = &unk_1EA8BF200;
  v9 = v7;
  v15 = v9;
  v16 = &v17;
  v13 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v14, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (!v11)
  {
    objc_msgSend((id)v18[5], "intersectSet:", v10);
    v4 = objc_msgSend((id)v18[5], "count") != 0;
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v8);
  if (v11)
  {
    v4 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v4;
}

- (BOOL)validatePeerWithPreApproval:(id)a3 sponsor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "dynamicInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preapprovals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v5, "permanentInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingPubKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "spki");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dynamicInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preapprovals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v13);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)statusOfPeerWithID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  TPModel *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v27 = 0;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v6, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = v8;
  if (v7)
    goto LABEL_2;
  if (!v8)
  {
    v29[3] |= 0x20uLL;
LABEL_2:
    objc_msgSend(v7, "dynamicInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "includedPeerIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") == 0;

    if (v12)
    {
      TPModelLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v6;
        _os_log_impl(&dword_1DE1BE000, v15, OS_LOG_TYPE_DEFAULT, "status: peerID %{public}@ has no included peer IDs?", buf, 0xCu);
      }

    }
    else
    {
      v29[3] |= 2uLL;
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __36__TPModel_statusOfPeerWithID_error___block_invoke;
    v22[3] = &unk_1EA8BF228;
    v16 = v6;
    v23 = v16;
    v26 = &v28;
    v24 = v7;
    v25 = self;
    v21 = 0;
    -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v22, &v21);
    v9 = v21;
    TPModelLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        v33 = v9;
        _os_log_impl(&dword_1DE1BE000, v17, OS_LOG_TYPE_DEFAULT, "status: error enumerating peers: %{public}@", buf, 0xCu);
      }

      v14 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      if (v18)
      {
        TPPeerStatusToString(v29[3]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v16;
        v34 = 2114;
        v35 = v19;
        _os_log_impl(&dword_1DE1BE000, v17, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ trust status is: %{public}@", buf, 0x16u);

      }
      v14 = v29[3];
    }

    goto LABEL_21;
  }
  TPModelLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v6;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_1DE1BE000, v13, OS_LOG_TYPE_DEFAULT, "can't find peer for status %{public}@: %{public}@", buf, 0x16u);
  }

  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v14 = 0;
    *a4 = v9;
  }
  else
  {
    v14 = 0;
  }
LABEL_21:

  _Block_object_dispose(&v28, 8);
  return v14;
}

- (id)getStableInfoForPeerWithID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[TPModel peerWithID:error:](self, "peerWithID:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stableInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getDynamicInfoForPeerWithID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[TPModel peerWithID:error:](self, "peerWithID:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)userViewSyncabilityConsensusAmongTrustedPeers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "includedPeerIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v8)
  {
    v9 = v8;
    v28 = a4;
    v10 = *(_QWORD *)v32;
    v11 = 1;
    v29 = v6;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1DF0E9908]();
      v30 = 0;
      -[TPModel peerWithID:error:](self, "peerWithID:error:", v13, &v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30;
      if (v16)
        break;
      objc_msgSend(v15, "stableInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "syncUserControllableViews");

      if (v18 == 1)
      {
        TPModelLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "peerID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v26;
          _os_log_impl(&dword_1DE1BE000, v25, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ has disabled user view syncing", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);

        v23 = 0;
LABEL_24:
        v11 = 1;
        v6 = v29;
        goto LABEL_25;
      }
      objc_msgSend(v15, "stableInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "syncUserControllableViews");

      if (v20 == 2)
      {
        TPModelLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "peerID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v22;
          _os_log_impl(&dword_1DE1BE000, v21, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ has enabled user view syncing", buf, 0xCu);

        }
        v11 = 2;
      }

      objc_autoreleasePoolPop(v14);
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v6 = v29;
        if (v9)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    v23 = v16;
    TPModelLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v13;
      v37 = 2114;
      v38 = v23;
      _os_log_impl(&dword_1DE1BE000, v24, OS_LOG_TYPE_DEFAULT, "Can't find peer %{public}@: %{public}@", buf, 0x16u);
    }

    objc_autoreleasePoolPop(v14);
    if (v28)
    {
      v23 = objc_retainAutorelease(v23);
      *v28 = v23;
    }
    goto LABEL_24;
  }
  v11 = 1;
LABEL_16:

  v23 = 0;
LABEL_25:

  return v11;
}

- (id)createStableInfoWithFrozenPolicyVersion:(id)a3 flexiblePolicyVersion:(id)a4 policySecrets:(id)a5 syncUserControllableViews:(int)a6 secureElementIdentity:(id)a7 walrusSetting:(id)a8 webAccess:(id)a9 deviceName:(id)a10 serialNumber:(id)a11 osVersion:(id)a12 signingKeyPair:(id)a13 recoverySigningPubKey:(id)a14 recoveryEncryptionPubKey:(id)a15 isInheritedAccount:(BOOL)a16 error:(id *)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  TPPeerStableInfo *v34;
  unint64_t v35;
  id v37;
  uint64_t v38;
  id v40;
  TPPeerStableInfo *v42;
  id v43;
  id v44;
  id v45;
  id v46[2];

  v40 = a3;
  v21 = a4;
  v45 = a5;
  v44 = a7;
  v43 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v46[0] = 0;
  v29 = -[TPModel maxClockWithError:](self, "maxClockWithError:", v46);
  v30 = v46[0];
  v31 = v30;
  if (v30)
  {
    v32 = v27;
    v33 = v40;
    v42 = 0;
    if (a17)
      *a17 = objc_retainAutorelease(v30);
  }
  else
  {
    v34 = [TPPeerStableInfo alloc];
    LOBYTE(v38) = a16;
    v37 = v27;
    v35 = v29 + 1;
    v32 = v27;
    v33 = v40;
    v42 = -[TPPeerStableInfo initWithClock:frozenPolicyVersion:flexiblePolicyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:deviceName:serialNumber:osVersion:signingKeyPair:recoverySigningPubKey:recoveryEncryptionPubKey:isInheritedAccount:error:](v34, "initWithClock:frozenPolicyVersion:flexiblePolicyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:deviceName:serialNumber:osVersion:signingKeyPair:recoverySigningPubKey:recoveryEncryptionPubKey:isInheritedAccount:error:", v35, v40, v21, v45, a6, v44, v43, v22, v23, v24, v25, v26, v37, v28, v38,
            a17);
  }

  return v42;
}

- (unint64_t)maxClockWithError:(id *)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__TPModel_maxClockWithError___block_invoke;
  v9[3] = &unk_1EA8BF1B0;
  v9[4] = &v10;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v9, &v8);
  v4 = v8;
  if (v4)
  {
    TPModelLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v4;
      _os_log_impl(&dword_1DE1BE000, v5, OS_LOG_TYPE_DEFAULT, "maxClock error enumerating peers: %{public}@", buf, 0xCu);
    }

    v6 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v4);
  }
  else
  {
    v6 = v11[3];
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)createDynamicInfoWithIncludedPeerIDs:(id)a3 excludedPeerIDs:(id)a4 dispositions:(id)a5 preapprovals:(id)a6 signingKeyPair:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v24 = 0;
  v19 = -[TPModel maxClockWithError:](self, "maxClockWithError:", &v24);
  v20 = v24;
  v21 = v20;
  if (v20)
  {
    v22 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v20);
  }
  else
  {
    +[TPPeerDynamicInfo dynamicInfoWithClock:includedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:](TPPeerDynamicInfo, "dynamicInfoWithClock:includedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:", v19 + 1, v14, v15, v16, v17, v18, a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (BOOL)canTrustCandidate:(id)a3 inEpoch:(unint64_t)a4
{
  return objc_msgSend(a3, "epoch") + 1 >= a4;
}

- (BOOL)canIntroduceCandidate:(id)a3 withSponsor:(id)a4 toEpoch:(unint64_t)a5 underPolicy:(id)a6 disposition:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  TPPBPolicyProhibits *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  TPPBAncientEpoch *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (-[TPModel canTrustCandidate:inEpoch:](self, "canTrustCandidate:inEpoch:", v12, a5))
  {
    objc_msgSend(v13, "modelID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "categoryForModel:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "modelID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "categoryForModel:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v14, "trustedPeerInCategory:canIntroduceCategory:", v17, v19);
    if ((v20 & 1) == 0)
    {
      v21 = objc_alloc_init(TPPBPolicyProhibits);
      objc_msgSend(v15, "setPolicyProhibits:", v21);

      objc_msgSend(v14, "version");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "versionNumber");
      objc_msgSend(v15, "policyProhibits");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPolicyVersion:", v23);

      objc_msgSend(v13, "peerID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "policyProhibits");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSponsorId:", v25);

      objc_msgSend(v15, "policyProhibits");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSponsorCategory:", v17);

      objc_msgSend(v15, "policyProhibits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCandidateCategory:", v19);

      if (v19)
      {
        v29 = 0;
      }
      else
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "modelID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("unrecognized modelID: %@"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "policyProhibits");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setExplanation:", v29);

      if (!v19)
      {

      }
    }

  }
  else
  {
    v30 = objc_alloc_init(TPPBAncientEpoch);
    objc_msgSend(v15, "setAncientEpoch:", v30);

    v31 = objc_msgSend(v12, "epoch");
    objc_msgSend(v15, "ancientEpoch");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCandidateEpoch:", v31);

    objc_msgSend(v15, "ancientEpoch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMyEpoch:", a5);
    v20 = 0;
  }

  return v20;
}

- (BOOL)checkIntroductionForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TPPBDisposition *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[TPModel actualPeerWithID:error:](self, "actualPeerWithID:error:", a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "trustedPeerIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "peerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:](self, "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:", v14, v15, v11, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v22 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v10, "modelID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "categoryForModel:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_alloc_init(TPPBDisposition);
      objc_msgSend(v13, "permanentInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "permanentInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[TPModel canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:](self, "canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:", v10, v20, objc_msgSend(v21, "epoch"), v16, v19);

      if (!a6 || v22)
        goto LABEL_18;
      v39 = TPErrorDomain;
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v46[0] = CFSTR("Policy prohibits introducing candidate");
      v45[0] = v23;
      v45[1] = CFSTR("sponsorID");
      -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "sponsorId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v43;
      v45[2] = CFSTR("sponsorCategory");
      -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "sponsorCategory");
      v24 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v24;
      v44 = v18;
      if (v24)
        v25 = (const __CFString *)v24;
      else
        v25 = CFSTR("unknown");
      v46[2] = v25;
      v45[3] = CFSTR("candidateCategory");
      -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "candidateCategory");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
        v28 = (const __CFString *)v26;
      else
        v28 = CFSTR("unknown");
      v46[3] = v28;
      v45[4] = CFSTR("policyVersion");
      v29 = (void *)MEMORY[0x1E0CB37E8];
      -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v30, "policyVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v39, 6, v32);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v18 = v44;
      v33 = v42;

    }
    else
    {
      if (!a6)
      {
        v22 = 0;
        goto LABEL_19;
      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = TPErrorDomain;
      v47[0] = *MEMORY[0x1E0CB2D50];
      v47[1] = CFSTR("model");
      v48[0] = CFSTR("Unrecognized modelID for candidate");
      objc_msgSend(v10, "modelID");
      v19 = (TPPBDisposition *)objc_claimAutoreleasedReturnValue();
      v48[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 9, v33);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v22 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  v22 = 0;
LABEL_21:

  return v22;
}

- (id)createVoucherForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 reason:(unint64_t)a6 signingKeyPair:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (-[TPModel checkIntroductionForCandidate:stableInfo:withSponsorID:error:](self, "checkIntroductionForCandidate:stableInfo:withSponsorID:error:", v14, a4, v15, a8))
  {
    objc_msgSend(v14, "peerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPVoucher voucherWithReason:beneficiaryID:sponsorID:signingKeyPair:error:](TPVoucher, "voucherWithReason:beneficiaryID:sponsorID:signingKeyPair:error:", a6, v17, v15, v16, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)verifyVoucherSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sponsorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v5, &v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v36;

  if (v6 && !v7)
    goto LABEL_26;
  TPModelLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sponsorID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v9;
    v40 = 2114;
    v41 = v7;
    _os_log_impl(&dword_1DE1BE000, v8, OS_LOG_TYPE_DEFAULT, "Can't find peer %{public}@: %{public}@", buf, 0x16u);

  }
  if (v6)
  {
LABEL_26:
    objc_msgSend(v6, "permanentInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingPubKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "checkSignatureWithKey:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_9;
  }
  objc_msgSend(v6, "stableInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recoverySigningPublicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_10;
  objc_msgSend(v6, "stableInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recoverySigningPublicKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createRecoveryECPublicKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "checkSignatureWithKey:", v17);

  if ((v18 & 1) != 0)
  {
LABEL_9:
    v19 = 1;
  }
  else
  {
LABEL_10:
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v21)
    {
      v22 = v21;
      v31 = v7;
      v23 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "signingPublicKey");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v4, "checkSignatureWithKey:", v28);

          if ((v29 & 1) != 0)
          {
            v19 = 1;
            goto LABEL_20;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v22)
          continue;
        break;
      }
      v19 = 0;
LABEL_20:
      v7 = v31;
    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (BOOL)validateVoucherForPeer:(id)a3 sponsor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  TPModel *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[TPModel dbAdapter](self, "dbAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__TPModel_validateVoucherForPeer_sponsor___block_invoke;
  v14[3] = &unk_1EA8BF250;
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v17 = self;
  v18 = &v19;
  v13 = 0;
  objc_msgSend(v8, "enumerateVouchersUsingBlock:error:", v14, &v13);
  v11 = v13;

  LOBYTE(v8) = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return (char)v8;
}

- (id)considerCandidateID:(id)a3 withSponsorID:(id)a4 sponsorPermanentInfo:(id)a5 toExpandIncludedPeerIDs:(id)a6 andExcludedPeerIDs:(id)a7 dispositions:(id)a8 currentMachineIDs:(id)a9 forEpoch:(unint64_t)a10
{
  id v16;
  TPPBDisposition *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  TPPBDisposition *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  TPPBDisposition *v34;
  void *v35;
  void *v36;
  TPPBDisposition *v37;
  TPPBUnknownMachineID *v38;
  NSObject *v39;
  void *v40;
  TPPBDisposition *v41;
  TPPBDispositionDisallowedMachineID *v42;
  NSObject *v43;
  NSObject *v44;
  TPPBDispositionEvictedMachineID *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  TPPBDisposition *v51;
  void *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  TPPBDisposition *v63;
  void *v64;
  void *v65;
  TPPBDisposition *v66;
  TPPBDisposition *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  TPPBDisposition *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = (TPPBDisposition *)a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if ((objc_msgSend(v19, "containsObject:", v16) & 1) != 0)
    goto LABEL_8;
  if (objc_msgSend(v20, "containsObject:", v16))
  {
    TPModelLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v73 = v16;
      _os_log_impl(&dword_1DE1BE000, v23, OS_LOG_TYPE_DEFAULT, "voucher: peer (%{public}@) already excluded", buf, 0xCu);
    }

    goto LABEL_8;
  }
  -[TPModel allCustodianRecoveryKeyPeerIDs](self, "allCustodianRecoveryKeyPeerIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "containsObject:", v16);

  if (!v25)
  {
    v71 = 0;
    -[TPModel peerWithID:error:](self, "peerWithID:error:", v16, &v71);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (TPPBDisposition *)v71;
    v68 = v18;
    v69 = v28;
    if (!v28)
    {
      TPModelLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v67;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v73 = v16;
        v74 = 2114;
        v75 = v67;
        _os_log_impl(&dword_1DE1BE000, v33, OS_LOG_TYPE_DEFAULT, "voucher: no peer for id %{public}@: %{public}@", buf, 0x16u);
      }

      v26 = v67;
      goto LABEL_60;
    }
    v63 = v17;
    objc_msgSend(v28, "permanentInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "machineID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "entryFor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v31;
    if (v31)
      v32 = objc_msgSend(v31, "status");
    else
      v32 = 0;
    objc_msgSend(v21, "objectForKeyedSubscript:", v16);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
      v37 = v35;
    else
      v37 = objc_alloc_init(TPPBDisposition);
    v66 = v37;

    switch(v32)
    {
      case 0:
        if (v22)
        {
          v38 = objc_alloc_init(TPPBUnknownMachineID);
          -[TPPBDisposition setUnknownMachineID:](v66, "setUnknownMachineID:", v38);

        }
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", 0);
        -[TPPBDisposition setEvictedMachineID:](v66, "setEvictedMachineID:", 0);
        -[TPPBDisposition setUnknownReasonRemovalMachineID:](v66, "setUnknownReasonRemovalMachineID:", 0);
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v66, v16);
        TPModelLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v73 = v31;
          v74 = 2114;
          v75 = v66;
          _os_log_impl(&dword_1DE1BE000, v39, OS_LOG_TYPE_DEFAULT, "voucher: unknown machineID %{public}@ %{public}@", buf, 0x16u);
        }

        break;
      case 1:
        v40 = v21;
        v41 = 0;
        goto LABEL_40;
      case 2:
        v42 = objc_alloc_init(TPPBDispositionDisallowedMachineID);
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", v42);

        objc_msgSend(v21, "setObject:forKeyedSubscript:", v66, v16);
        TPModelLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v73 = v31;
          v74 = 2114;
          v75 = v66;
          _os_log_impl(&dword_1DE1BE000, v43, OS_LOG_TYPE_DEFAULT, "voucher: disallowed machineID %{public}@ %{public}@", buf, 0x16u);
        }
        v26 = 0;
        v34 = v67;
        goto LABEL_59;
      case 3:
        TPModelLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v73 = v31;
          v74 = 2114;
          v75 = v66;
          _os_log_impl(&dword_1DE1BE000, v44, OS_LOG_TYPE_DEFAULT, "voucher: evicted machineID %{public}@ %{public}@", buf, 0x16u);
        }

        -[TPPBDisposition setUnknownMachineID:](v66, "setUnknownMachineID:", 0);
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", 0);
        -[TPPBDisposition setUnknownReasonRemovalMachineID:](v66, "setUnknownReasonRemovalMachineID:", 0);
        v45 = objc_alloc_init(TPPBDispositionEvictedMachineID);
        -[TPPBDisposition setEvictedMachineID:](v66, "setEvictedMachineID:", v45);
        goto LABEL_39;
      case 4:
        TPModelLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v73 = v31;
          v74 = 2114;
          v75 = v66;
          _os_log_impl(&dword_1DE1BE000, v46, OS_LOG_TYPE_DEFAULT, "voucher: unknown reason removed machineID %{public}@ %{public}@", buf, 0x16u);
        }

        -[TPPBDisposition setUnknownMachineID:](v66, "setUnknownMachineID:", 0);
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", 0);
        -[TPPBDisposition setEvictedMachineID:](v66, "setEvictedMachineID:", 0);
        v45 = objc_alloc_init(TPPBDispositionUnknownReasonRemovalMachineID);
        -[TPPBDisposition setUnknownReasonRemovalMachineID:](v66, "setUnknownReasonRemovalMachineID:", v45);
        goto LABEL_39;
      case 5:
        TPModelLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v73 = v31;
          v74 = 2114;
          v75 = v66;
          _os_log_impl(&dword_1DE1BE000, v47, OS_LOG_TYPE_DEFAULT, "voucher: ghosted machineID %{public}@ %{public}@", buf, 0x16u);
        }

        v45 = objc_alloc_init(TPPBDispositionGhostedMachineID);
        -[TPPBDisposition setGhostedMachineID:](v66, "setGhostedMachineID:", v45);
LABEL_39:

        v40 = v21;
        v41 = v66;
LABEL_40:
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, v16);
        break;
      default:
        break;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v19);
    v43 = objc_claimAutoreleasedReturnValue();
    -[NSObject minusSet:](v43, "minusSet:", v20);
    -[NSObject addObject:](v43, "addObject:", v16);
    v70 = 0;
    -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:](self, "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:", v43, v16, 0, &v70);
    v48 = objc_claimAutoreleasedReturnValue();
    v62 = v70;
    v64 = (void *)v48;
    if (!v48)
    {
      TPModelLog();
      v58 = objc_claimAutoreleasedReturnValue();
      v31 = v65;
      v59 = v62;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v62;
        _os_log_impl(&dword_1DE1BE000, v58, OS_LOG_TYPE_DEFAULT, "voucher: failed to fetch policy: %{public}@", buf, 0xCu);
      }

      v26 = (TPPBDisposition *)v62;
      v34 = v67;
LABEL_58:

LABEL_59:
      v17 = v63;
LABEL_60:

      v18 = v68;
      goto LABEL_9;
    }
    v61 = v43;
    -[TPPBDisposition unknownMachineID](v66, "unknownMachineID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
      goto LABEL_47;
    -[TPPBDisposition evictedMachineID](v66, "evictedMachineID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49
      || (-[TPPBDisposition unknownReasonRemovalMachineID](v66, "unknownReasonRemovalMachineID"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (-[TPPBDisposition unknownMachineID](v66, "unknownMachineID"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (-[TPPBDisposition disallowedMachineID](v66, "disallowedMachineID"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_47:

      v50 = a10;
      v51 = v66;
    }
    else
    {
      -[TPPBDisposition ghostedMachineID](v66, "ghostedMachineID");
      v51 = v66;
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = a10;
      if (!v60)
        goto LABEL_49;
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v51, v16);
LABEL_49:
    objc_msgSend(v69, "permanentInfo");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[TPModel canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:](self, "canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:", v52, v18, v50, v64, v51);

    if (v53)
    {
      TPModelLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v69, "peerID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v55;
        v74 = 2114;
        v75 = v63;
        _os_log_impl(&dword_1DE1BE000, v54, OS_LOG_TYPE_DEFAULT, "voucher: %{public}@ presented valid voucher from %{public}@", buf, 0x16u);

      }
      objc_msgSend(v19, "addObject:", v16);
      objc_msgSend(v69, "dynamicInfo");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "excludedPeerIDs");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unionSet:", v57);

      -[TPModel recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:](self, "recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:", v19, v20, v21, v16, v22, a10);
      v26 = (TPPBDisposition *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v34 = v67;
    v31 = v65;
    v43 = v61;
    v59 = v62;
    goto LABEL_58;
  }
  objc_msgSend(v19, "addObject:", v16);
LABEL_8:
  v26 = 0;
LABEL_9:

  return v26;
}

- (void)considerVouchersSponsoredByPeerID:(id)a3 sponsorPermanentInfo:(id)a4 toRecursivelyExpandIncludedPeerIDs:(id)a5 andExcludedPeerIDs:(id)a6 dispositions:(id)a7 currentMachineIDs:(id)a8 forEpoch:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  TPModel *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  -[TPModel dbAdapter](self, "dbAdapter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __160__TPModel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke;
  v31[3] = &unk_1EA8BF278;
  v22 = v15;
  v32 = v22;
  v23 = v17;
  v33 = v23;
  v24 = v18;
  v39 = &v41;
  v34 = v24;
  v35 = self;
  v25 = v16;
  v36 = v25;
  v26 = v19;
  v37 = v26;
  v27 = v20;
  v38 = v27;
  v40 = a9;
  v30 = 0;
  objc_msgSend(v21, "enumerateVouchersUsingBlock:error:", v31, &v30);
  v28 = v30;

  if (!v28)
  {
    v29 = (void *)v42[5];
    if (v29)
      v28 = v29;
    else
      v28 = 0;
  }

  _Block_object_dispose(&v41, 8);
}

- (id)considerPreapprovalsSponsoredByPeer:(id)a3 toRecursivelyExpandIncludedPeerIDs:(id)a4 andExcludedPeerIDs:(id)a5 dispositions:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  id v26;
  NSObject *v27;
  __int128 v29;
  id v30;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  TPModel *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  int64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v33 = a4;
  v32 = a5;
  v14 = a6;
  v15 = a7;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v16 = v13;
  objc_msgSend(v13, "dynamicInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preapprovals");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v45;
    *(_QWORD *)&v20 = 138543362;
    v29 = v20;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v22)
        objc_enumerationMutation(v18);
      v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v23);
      v25 = +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v24, v29, v30);
      if (v25 != -1)
      {
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __141__TPModel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke;
        v35[3] = &unk_1EA8BF2A0;
        v42 = v25;
        v35[4] = v24;
        v36 = v16;
        v37 = self;
        v38 = v33;
        v39 = v32;
        v40 = v14;
        v41 = v15;
        v43 = a8;
        v34 = 0;
        -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v35, &v34);
        v26 = v34;
        if (v26)
        {
          TPModelLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v49 = v26;
            _os_log_impl(&dword_1DE1BE000, v27, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", buf, 0xCu);
          }

          v30 = v26;
        }

        if (v26)
          break;
      }
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v21)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v30 = 0;
  }

  return v30;
}

- (id)recursivelyExpandIncludedPeerIDs:(id)a3 andExcludedPeerIDs:(id)a4 dispositions:(id)a5 withPeersTrustedBySponsorID:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  TPModel *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v57 = 0;
  v51 = self;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v16, &v57);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v57;
  v20 = v19;
  if (v18)
  {
    v46 = v19;
    v48 = v17;
    v49 = v15;
    v50 = v13;
    TPModelLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "peerID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dynamicInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "includedPeerIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dynamicInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "excludedPeerIDs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v22;
      v61 = 2114;
      v62 = v24;
      v63 = 2114;
      v64 = v26;
      _os_log_impl(&dword_1DE1BE000, v21, OS_LOG_TYPE_INFO, "Including information from sponsor (%{public}@): included: %{public}@ excluded: %{public}@", buf, 0x20u);

    }
    v47 = v16;

    objc_msgSend(v18, "dynamicInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "excludedPeerIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    objc_msgSend(v14, "unionSet:", v28);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v18, "dynamicInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "includedPeerIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v54 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          v37 = (void *)MEMORY[0x1DF0E9908]();
          objc_msgSend(v18, "peerID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "permanentInfo");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[TPModel considerCandidateID:withSponsorID:sponsorPermanentInfo:toExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:](v51, "considerCandidateID:withSponsorID:sponsorPermanentInfo:toExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:", v36, v38, v39, v50, v29, v49, v48, a8);

          objc_autoreleasePoolPop(v37);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v33);
    }

    objc_msgSend(v18, "peerID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "permanentInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v49;
    v13 = v50;
    v14 = v29;
    v17 = v48;
    -[TPModel considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:](v51, "considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:", v41, v42, v50, v29, v49, v48, a8);

    -[TPModel considerPreapprovalsSponsoredByPeer:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:](v51, "considerPreapprovalsSponsoredByPeer:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:", v18, v50, v29, v49, v48, a8);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v46;
    v16 = v47;
  }
  else if (v19)
  {
    TPModelLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v60 = v16;
      v61 = 2114;
      v62 = v20;
      _os_log_impl(&dword_1DE1BE000, v44, OS_LOG_TYPE_DEFAULT, "Could not find peer %{public}@: %{public}@", buf, 0x16u);
    }

    v43 = v20;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)calculateDynamicInfoForPeerWithID:(id)a3 addingPeerIDs:(id)a4 removingPeerIDs:(id)a5 preapprovedKeys:(id)a6 signingKeyPair:(id)a7 currentMachineIDs:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TPModel *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v36 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[TPModel actualPeerWithID:error:](self, "actualPeerWithID:error:", v15, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "peerID");
    v34 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "permanentInfo");
    v35 = v19;
    v23 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stableInfo");
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dynamicInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self;
    v29 = v36;
    -[TPModel calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:](v28, "calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:", v22, v21, v24, v26, v27, v36, v23, v25, v18, v35, 0, a9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v23;
    v15 = v34;
    v19 = v35;
  }
  else
  {
    v31 = v18;
    v25 = v17;
    v29 = v36;
    TPModelLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v15;
      _os_log_impl(&dword_1DE1BE000, v32, OS_LOG_TYPE_DEFAULT, "No peer for ID %{public}@", buf, 0xCu);
    }

    v30 = 0;
    v18 = v31;
  }

  return v30;
}

- (id)calculateDynamicInfoFromModel:(id)a3 peer:(id)a4 peerPermanentInfo:(id)a5 peerStableInfo:(id)a6 startingDynamicInfo:(id)a7 addingPeerIDs:(id)a8 removingPeerIDs:(id)a9 preapprovedKeys:(id)a10 signingKeyPair:(id)a11 currentMachineIDs:(id)a12 sponsorPeerID:(id)a13 error:(id *)a14
{
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *k;
  uint64_t v70;
  int64_t v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  void *v75;
  int v76;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  TPPBDisposition *v88;
  void *v89;
  TPPBDisposition *v90;
  void *v91;
  TPPBDisposition *v92;
  void *v93;
  TPPBDisposition *v94;
  void *v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  int v99;
  void *v100;
  BOOL v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t n;
  void *v109;
  unint64_t v110;
  void *v111;
  _BOOL4 v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  const __CFString *v118;
  int v119;
  NSObject *v120;
  NSObject *v121;
  void *v122;
  uint64_t v123;
  NSObject *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  id v135;
  NSObject *v136;
  NSObject *v137;
  const char *v138;
  uint32_t v139;
  void *v140;
  BOOL v141;
  void *v142;
  void *v143;
  BOOL v144;
  NSObject *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  char v155;
  void *v156;
  NSObject *v157;
  _BOOL4 v158;
  NSObject *v159;
  const char *v160;
  uint32_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  NSObject *v165;
  void *v166;
  NSObject *v167;
  void *v168;
  NSObject *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t m;
  uint64_t v174;
  void *v175;
  void *v176;
  TPPBDisposition *v177;
  TPPBDispositionDuplicateMachineID *v178;
  void *v179;
  NSObject *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v186;
  int v187;
  NSObject *v188;
  void *v189;
  id v190;
  void *v191;
  id v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  TPRecoveryKeyPair *v198;
  id v199;
  id v200;
  void *v201;
  id v202;
  id v203;
  id v204;
  id v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  id v215;
  void *v216;
  TPModel *v217;
  id obj;
  void *v219;
  void *context;
  void *contexta;
  void *v222;
  id v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  id v228;
  id v229;
  id v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _QWORD v235[6];
  id v236;
  id v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  id v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  id v251;
  id v252;
  _QWORD v253[6];
  id v254;
  id v255;
  id v256;
  id v257;
  id v258;
  _BYTE *v259;
  int64_t v260;
  uint64_t v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  _BYTE v274[128];
  _BYTE v275[128];
  uint64_t v276;
  const __CFString *v277;
  _BYTE v278[128];
  _BYTE v279[128];
  uint8_t v280[128];
  uint8_t v281[4];
  id v282;
  _BYTE buf[24];
  uint64_t (*v284)(uint64_t, uint64_t);
  __int128 v285;
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  uint64_t v289;

  v289 = *MEMORY[0x1E0C80C00];
  v210 = a3;
  v204 = a4;
  v20 = a5;
  v205 = a6;
  v211 = a7;
  v208 = a8;
  v209 = a9;
  v203 = a10;
  v200 = a11;
  v215 = a12;
  v201 = v20;
  v202 = a13;
  v212 = objc_msgSend(v20, "epoch");
  v21 = (void *)MEMORY[0x1E0C99E60];
  v217 = self;
  -[TPModel allPeerIDs](self, "allPeerIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  TPModelLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v210;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v206;
    _os_log_impl(&dword_1DE1BE000, v23, OS_LOG_TYPE_DEFAULT, "Calculating dynamic info for peer %{public}@ with peer set %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v208, "count"))
  {
    TPModelLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v208;
      _os_log_impl(&dword_1DE1BE000, v24, OS_LOG_TYPE_DEFAULT, "Adding peer IDs: %{public}@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v209, "count"))
  {
    TPModelLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v209;
      _os_log_impl(&dword_1DE1BE000, v25, OS_LOG_TYPE_DEFAULT, "Removing peer IDs: %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v211, "excludedPeerIDs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsObject:", v210);

  if (v27)
  {
    TPModelLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v210;
      _os_log_impl(&dword_1DE1BE000, v28, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) excludes itself", buf, 0xCu);
    }

    v29 = v211;
    goto LABEL_271;
  }
  v30 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v211, "includedPeerIDs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithSet:", v31);
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v211, "excludedPeerIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithSet:", v33);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  TPModelLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v214;
    _os_log_impl(&dword_1DE1BE000, v34, OS_LOG_TYPE_DEFAULT, "Initial sets: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  v35 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v211, "dispositions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryWithDictionary:", v36);
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v216, "addObject:", v210);
  v198 = -[TPRecoveryKeyPair initWithStableInfo:]([TPRecoveryKeyPair alloc], "initWithStableInfo:", v205);
  -[TPRecoveryKeyPair signingKeyData](v198, "signingKeyData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", 2, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "stringByReplacingOccurrencesOfString:withString:", CFSTR("SHA384:"), &stru_1EA8BFDC8);
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RK-%@"), v197);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v206);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "addObject:", v196);
  -[TPModel allCustodianRecoveryKeyPeerIDs](self, "allCustodianRecoveryKeyPeerIDs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "addObjectsFromArray:", v39);

  v272 = 0u;
  v273 = 0u;
  v270 = 0u;
  v271 = 0u;
  obj = v209;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v270, v288, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v271;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v271 != v41)
          objc_enumerationMutation(obj);
        v43 = *(_QWORD *)(*((_QWORD *)&v270 + 1) + 8 * i);
        if ((objc_msgSend(v219, "containsObject:", v43) & 1) == 0)
        {
          TPModelLog();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v43;
            _os_log_impl(&dword_1DE1BE000, v59, OS_LOG_TYPE_DEFAULT, "No peer for given peer id: %{public}@", buf, 0xCu);
          }

          failWithNoPeerWithIDError(a14);
          v29 = 0;
          goto LABEL_270;
        }
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v270, v288, 16);
    }
    while (v40);
  }

  objc_msgSend(v216, "addObjectsFromArray:", v208);
  objc_msgSend(v214, "addObjectsFromArray:", obj);
  objc_msgSend(v216, "minusSet:", v214);
  TPModelLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v214;
    _os_log_impl(&dword_1DE1BE000, v44, OS_LOG_TYPE_DEFAULT, "After removals: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  TPModelLog();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v215;
    _os_log_impl(&dword_1DE1BE000, v45, OS_LOG_TYPE_DEFAULT, "Beginning sponsor checking; machine ID list: %{public}@",
      buf,
      0xCu);
  }

  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  obj = (id)objc_msgSend(v216, "copy");
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v266, v287, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v267;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v267 != v47)
          objc_enumerationMutation(obj);
        v49 = *(_QWORD *)(*((_QWORD *)&v266 + 1) + 8 * j);
        v50 = (void *)MEMORY[0x1DF0E9908]();
        -[TPModel recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:](v217, "recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:", v216, v214, v222, v49, v215, v212);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v50);
        if (v51)
        {

          TPModelLog();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v51;
            _os_log_impl(&dword_1DE1BE000, v60, OS_LOG_TYPE_DEFAULT, "Error sponsor checking: %{public}@", buf, 0xCu);
          }

          if (a14)
          {
            v61 = objc_retainAutorelease(v51);
            v29 = 0;
            *a14 = v61;
          }
          else
          {
            v29 = 0;
            v61 = v51;
          }
          goto LABEL_269;
        }
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v266, v287, 16);
    }
    while (v46);
  }

  TPModelLog();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v214;
    _os_log_impl(&dword_1DE1BE000, v52, OS_LOG_TYPE_DEFAULT, "After sponsor checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  if (v204)
  {
    objc_msgSend(v204, "peerID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "permanentInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:](v217, "considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:", v53, v54, v216, v214, v222, v215, v212);

  }
  TPModelLog();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v214;
    _os_log_impl(&dword_1DE1BE000, v55, OS_LOG_TYPE_DEFAULT, "After voucher checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  if (v203)
  {
    TPModelLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v203;
      _os_log_impl(&dword_1DE1BE000, v56, OS_LOG_TYPE_DEFAULT, "Preapproved keys: %{public}@", buf, 0xCu);
    }

    +[TPModel preapprovalsFromKeys:](TPModel, "preapprovalsFromKeys:", v203);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    TPModelLog();
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      goto LABEL_59;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v195;
    v58 = "New preapproval list: %{public}@";
    goto LABEL_58;
  }
  v62 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v211, "preapprovals");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setWithSet:", v63);
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  TPModelLog();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v195;
    v58 = "Using existing preapproval list: %{public}@";
LABEL_58:
    _os_log_impl(&dword_1DE1BE000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 0xCu);
  }
LABEL_59:

  objc_msgSend(v216, "setByAddingObjectsFromSet:", v214);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel filterPreapprovals:forExistingPeers:](v217, "filterPreapprovals:forExistingPeers:", v195, v194);
  v199 = (id)objc_claimAutoreleasedReturnValue();
  TPModelLog();
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
  if (v199)
  {
    if (v65)
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v199;
      _os_log_impl(&dword_1DE1BE000, v64, OS_LOG_TYPE_DEFAULT, "Error filtering preapprovals: %{public}@", buf, 0xCu);
    }

    if (a14)
    {
      v199 = objc_retainAutorelease(v199);
      v29 = 0;
      *a14 = v199;
      goto LABEL_268;
    }
    goto LABEL_90;
  }
  if (v65)
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v195;
    _os_log_impl(&dword_1DE1BE000, v64, OS_LOG_TYPE_DEFAULT, "Final preapproval list: %{public}@", buf, 0xCu);
  }

  v264 = 0u;
  v265 = 0u;
  v262 = 0u;
  v263 = 0u;
  objc_msgSend(v195, "allObjects");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (id)objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v262, v286, 16);
  if (!v67)
  {
    v199 = 0;
    goto LABEL_92;
  }
  v199 = 0;
  v68 = *(_QWORD *)v263;
  do
  {
    for (k = 0; k != v67; k = (char *)k + 1)
    {
      if (*(_QWORD *)v263 != v68)
        objc_enumerationMutation(v66);
      v70 = *(_QWORD *)(*((_QWORD *)&v262 + 1) + 8 * (_QWORD)k);
      v71 = +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v70);
      if (v71 == -1)
        continue;

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v284 = __Block_byref_object_copy_;
      *(_QWORD *)&v285 = __Block_byref_object_dispose_;
      *((_QWORD *)&v285 + 1) = 0;
      v253[0] = MEMORY[0x1E0C809B0];
      v253[1] = 3221225472;
      v253[2] = __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke;
      v253[3] = &unk_1EA8BF2C8;
      v253[4] = v70;
      v253[5] = v217;
      v260 = v71;
      v261 = v212;
      v254 = v216;
      v259 = buf;
      v255 = v214;
      v256 = v222;
      v257 = v215;
      v258 = v195;
      v252 = 0;
      -[TPModel enumeratePeersUsingBlock:error:](v217, "enumeratePeersUsingBlock:error:", v253, &v252);
      v199 = v252;
      if (v199)
      {
        TPModelLog();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v281 = 138543362;
          v282 = v199;
          _os_log_impl(&dword_1DE1BE000, v72, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", v281, 0xCu);
        }

        if (a14)
        {
          v73 = objc_retainAutorelease(v199);
LABEL_82:
          v76 = 0;
          *a14 = v73;
          goto LABEL_85;
        }
LABEL_83:
        v76 = 0;
        goto LABEL_85;
      }
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        TPModelLog();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v281 = 138543362;
          v282 = v75;
          _os_log_impl(&dword_1DE1BE000, v74, OS_LOG_TYPE_DEFAULT, "Error recursively expanding peers: %{public}@", v281, 0xCu);
        }

        if (a14)
        {
          v73 = 0;
          goto LABEL_82;
        }
        goto LABEL_83;
      }
      v76 = 1;
LABEL_85:

      _Block_object_dispose(buf, 8);
      if (!v76)
      {

LABEL_90:
        v29 = 0;
        goto LABEL_268;
      }
    }
    v67 = (id)objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v262, v286, 16);
  }
  while (v67);
LABEL_92:

  objc_msgSend(v216, "minusSet:", v214);
  TPModelLog();
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v214;
    _os_log_impl(&dword_1DE1BE000, v77, OS_LOG_TYPE_DEFAULT, "After preapproval checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  objc_msgSend(v204, "permanentInfo");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "modelID");
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v191, "containsString:", CFSTR("AppleTV")) & 1) != 0
    || objc_msgSend(v191, "containsString:", CFSTR("AudioAccessory")))
  {
    TPModelLog();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE1BE000, v79, OS_LOG_TYPE_DEFAULT, "Ignoring TDL Disallowed Machine IDs", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TPModel filterPeerList:byMachineIDs:sponsorPeerID:dispositions:](v217, "filterPeerList:byMachineIDs:sponsorPeerID:dispositions:", v216, v215, v202, v222);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v190 = v80;

  -[TPModel filterPeerList:byMachineIDs:sponsorPeerID:dispositions:](v217, "filterPeerList:byMachineIDs:sponsorPeerID:dispositions:", v214, v215, v202, v222);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v216, "count") != 1 || (objc_msgSend(v216, "containsObject:", v210) & 1) == 0)
  {
    objc_msgSend(v216, "minusSet:", v190);
    objc_msgSend(v214, "unionSet:", v190);
    objc_msgSend(v214, "unionSet:", v189);
  }
  if (v202)
  {
    TPModelLog();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE1BE000, v81, OS_LOG_TYPE_DEFAULT, "Joining using a sponsor! Opting not to kick out past selves yet.", buf, 2u);
    }
    goto LABEL_106;
  }
  objc_msgSend(v201, "machineID");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "length") == 0;

  if (v101)
  {
    TPModelLog();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE1BE000, v81, OS_LOG_TYPE_DEFAULT, "No local machine ID; not filtering peers", buf, 2u);
    }
LABEL_106:

  }
  else
  {
    contexta = (void *)MEMORY[0x1DF0E9908]();
    objc_msgSend(v201, "machineID");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = 0;
    -[TPModel peersWithMachineID:error:](v217, "peersWithMachineID:error:", v102, &v251);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    v192 = v251;

    if (v192)
    {

      objc_autoreleasePoolPop(contexta);
      v29 = 0;
      if (a14)
        *a14 = objc_retainAutorelease(v192);
      goto LABEL_267;
    }
    v168 = (void *)objc_msgSend(v67, "mutableCopy");
    objc_msgSend(v168, "removeObject:", v210);
    TPModelLog();
    v169 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v168;
      _os_log_impl(&dword_1DE1BE000, v169, OS_LOG_TYPE_DEFAULT, "Remote peers with the ego machine ID: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v216, "minusSet:", v168);
    objc_msgSend(v214, "unionSet:", v168);
    v249 = 0u;
    v250 = 0u;
    v247 = 0u;
    v248 = 0u;
    v170 = v168;
    v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v247, v280, 16);
    if (v171)
    {
      v172 = *(_QWORD *)v248;
      do
      {
        for (m = 0; m != v171; ++m)
        {
          if (*(_QWORD *)v248 != v172)
            objc_enumerationMutation(v170);
          v174 = *(_QWORD *)(*((_QWORD *)&v247 + 1) + 8 * m);
          objc_msgSend(v222, "objectForKeyedSubscript:", v174);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = v175;
          if (v175)
          {
            v177 = v175;
          }
          else
          {
            v177 = objc_alloc_init(TPPBDisposition);

          }
          v178 = objc_alloc_init(TPPBDispositionDuplicateMachineID);
          -[TPPBDisposition setDuplicateMachineID:](v177, "setDuplicateMachineID:", v178);

          objc_msgSend(v222, "setObject:forKeyedSubscript:", v177, v174);
        }
        v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v247, v280, 16);
      }
      while (v171);
    }

    objc_autoreleasePoolPop(contexta);
  }
  TPModelLog();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v214;
    _os_log_impl(&dword_1DE1BE000, v82, OS_LOG_TYPE_DEFAULT, "After machine ID checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  v245 = 0u;
  v246 = 0u;
  v243 = 0u;
  v244 = 0u;
  v207 = v216;
  v83 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v243, v279, 16);
  if (v83)
  {
    v67 = *(id *)v244;
    do
    {
      v84 = 0;
      do
      {
        if (*(id *)v244 != v67)
          objc_enumerationMutation(v207);
        v85 = *(_QWORD *)(*((_QWORD *)&v243 + 1) + 8 * v84);
        objc_msgSend(v222, "objectForKeyedSubscript:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v86;
        if (v86)
        {
          if (objc_msgSend(v86, "hasUnknownMachineID"))
          {
            v88 = objc_alloc_init(TPPBDisposition);

            objc_msgSend(v87, "unknownMachineID");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPPBDisposition setUnknownMachineID:](v88, "setUnknownMachineID:", v89);

            if ((objc_msgSend(v87, "hasEvictedMachineID") & 1) != 0)
            {
              if (v88)
              {
                v90 = v88;
                goto LABEL_121;
              }
LABEL_120:
              v90 = objc_alloc_init(TPPBDisposition);
LABEL_121:
              v88 = v90;

              objc_msgSend(v87, "evictedMachineID");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBDisposition setEvictedMachineID:](v88, "setEvictedMachineID:", v91);

            }
            if ((objc_msgSend(v87, "hasUnknownReasonRemovalMachineID") & 1) != 0)
            {
              if (v88)
              {
                v92 = v88;
                goto LABEL_127;
              }
LABEL_126:
              v92 = objc_alloc_init(TPPBDisposition);
LABEL_127:
              v88 = v92;

              objc_msgSend(v87, "unknownReasonRemovalMachineID");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBDisposition setUnknownReasonRemovalMachineID:](v88, "setUnknownReasonRemovalMachineID:", v93);

            }
            if ((objc_msgSend(v87, "hasGhostedMachineID") & 1) != 0)
            {
              if (v88)
              {
                v94 = v88;
                goto LABEL_133;
              }
LABEL_132:
              v94 = objc_alloc_init(TPPBDisposition);
LABEL_133:
              v88 = v94;

              objc_msgSend(v87, "ghostedMachineID");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBDisposition setGhostedMachineID:](v88, "setGhostedMachineID:", v95);

            }
          }
          else
          {
            if ((objc_msgSend(v87, "hasEvictedMachineID") & 1) != 0)
              goto LABEL_120;
            if ((objc_msgSend(v87, "hasUnknownReasonRemovalMachineID") & 1) != 0)
              goto LABEL_126;
            if ((objc_msgSend(v87, "hasGhostedMachineID") & 1) != 0)
              goto LABEL_132;
            v88 = 0;
          }
          objc_msgSend(v222, "setObject:forKeyedSubscript:", v88, v85);

        }
        ++v84;
      }
      while (v83 != v84);
      v96 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v243, v279, 16);
      v83 = v96;
    }
    while (v96);
  }

  v242 = 0;
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:](v217, "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:", v207, v210, v205, &v242);
  context = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v242;
  if (v97)
  {
    TPModelLog();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v97;
      _os_log_impl(&dword_1DE1BE000, v98, OS_LOG_TYPE_DEFAULT, "ignoring error getting policy for peerIDs %{public}@", buf, 0xCu);
    }

  }
  if (context && (objc_msgSend(context, "unknownRedactions") & 1) == 0)
  {
    if (v205)
    {
      objc_msgSend(context, "version");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v103, "versionNumber");
      objc_msgSend(v205, "flexiblePolicyVersion");
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v99 = v104 == objc_msgSend(v67, "versionNumber");

    }
    else
    {
      v99 = 1;
    }
  }
  else
  {
    v99 = 0;
  }

  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  v237 = 0;
  -[TPModel allPolicyVersionsWithError:](v217, "allPolicyVersionsWithError:", &v237);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v237;
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v238, v278, 16);
  if (v106)
  {
    v107 = *(_QWORD *)v239;
    do
    {
      for (n = 0; n != v106; ++n)
      {
        if (*(_QWORD *)v239 != v107)
          objc_enumerationMutation(v105);
        v109 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * n);
        v110 = objc_msgSend(v109, "versionNumber");
        objc_msgSend(context, "version");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v110 <= objc_msgSend(v111, "versionNumber");

        v113 = objc_msgSend(v109, "versionNumber");
        objc_msgSend(context, "version");
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v99 &= v112;
        if (v113 == objc_msgSend(v67, "versionNumber"))
        {
          objc_msgSend(v109, "policyHash");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(context, "version");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "policyHash");
          v116 = objc_claimAutoreleasedReturnValue();
          v117 = (void *)v116;
          if (v116)
            v118 = (const __CFString *)v116;
          else
            v118 = &stru_1EA8BFDC8;
          v119 = objc_msgSend(v114, "isEqualToString:", v118);

          v99 &= v119;
        }
        else
        {

        }
      }
      v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v238, v278, 16);
    }
    while (v106);
  }

  if (v192)
  {
    v29 = 0;
    if (a14)
      *a14 = objc_retainAutorelease(v192);
    goto LABEL_266;
  }
  if (v99)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v206);
    v120 = objc_claimAutoreleasedReturnValue();
    -[NSObject minusSet:](v120, "minusSet:", v207);
    -[NSObject minusSet:](v120, "minusSet:", v214);
    TPModelLog();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v120;
      _os_log_impl(&dword_1DE1BE000, v121, OS_LOG_TYPE_DEFAULT, "Unknown peers, distrusting by default: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v214, "unionSet:", v120);
  }
  else
  {
    TPModelLog();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v205, "bestPolicyVersion");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "versionNumber");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v210;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v123;
      *(_WORD *)&buf[22] = 2114;
      v284 = (uint64_t (*)(uint64_t, uint64_t))context;
      LOWORD(v285) = 2114;
      *(_QWORD *)((char *)&v285 + 2) = 0;
      _os_log_impl(&dword_1DE1BE000, v120, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) is using an unknown policy version (%llu, %{public}@), not distrusting unknown peers (error: %{public}@)", buf, 0x2Au);

    }
  }

  if (objc_msgSend(v214, "containsObject:", v210))
  {
    TPModelLog();
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE1BE000, v124, OS_LOG_TYPE_DEFAULT, "Peer distrusts self", buf, 2u);
    }

    v236 = 0;
    -[TPModel untrustedPeerIDsWithError:](v217, "untrustedPeerIDsWithError:", &v236);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v236;
    v127 = v126;
    if (v126)
    {
      v29 = 0;
      if (a14)
        *a14 = objc_retainAutorelease(v126);
      goto LABEL_265;
    }
    objc_msgSend(v125, "setByAddingObjectsFromSet:", v214);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v206, "isSubsetOfSet:", v179))
    {
      TPModelLog();
      v180 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DE1BE000, v180, OS_LOG_TYPE_DEFAULT, "Update would result in zero trusted peers; failing",
          buf,
          2u);
      }

      if (a14)
      {
        v181 = (void *)MEMORY[0x1E0CB35C8];
        v182 = TPErrorDomain;
        v276 = *MEMORY[0x1E0CB2D50];
        v277 = CFSTR("Update would result in no trusted peers");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v277, &v276, 1);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "errorWithDomain:code:userInfo:", v182, 11, v183);
        v29 = 0;
        *a14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_263;
      }
      v29 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v208);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v210);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPModel createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:](v217, "createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:", v183, v184, v222, v195, v200, a14);
      v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_263:
    }

LABEL_265:
    goto LABEL_266;
  }
  v235[0] = MEMORY[0x1E0C809B0];
  v235[1] = 3221225472;
  v235[2] = __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke_79;
  v235[3] = &unk_1EA8BF2F0;
  v235[4] = v217;
  v235[5] = v212;
  objc_msgSend(v214, "objectsPassingTest:", v235);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = (void *)objc_msgSend(v128, "mutableCopy");

  v233 = 0u;
  v234 = 0u;
  v231 = 0u;
  v232 = 0u;
  v129 = v214;
  v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v231, v275, 16);
  if (!v130)
    goto LABEL_210;
  v213 = *(_QWORD *)v232;
  while (2)
  {
    v131 = 0;
    while (2)
    {
      if (*(_QWORD *)v232 != v213)
        objc_enumerationMutation(v129);
      v132 = *(_QWORD *)(*((_QWORD *)&v231 + 1) + 8 * v131);
      v133 = (void *)MEMORY[0x1DF0E9908]();
      v230 = 0;
      -[TPModel peerWithID:error:](v217, "peerWithID:error:", v132, &v230);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = v230;
      if (v135)
      {
        v67 = v135;
        TPModelLog();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v132;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v67;
          v137 = v136;
          v138 = "Error finding excluded peer %{public}@: %{public}@";
          v139 = 22;
          goto LABEL_193;
        }
        goto LABEL_194;
      }
      objc_msgSend(v134, "stableInfo");
      v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "recoverySigningPublicKey");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v140 == 0;

      if (!v141)
      {
        objc_msgSend(v134, "stableInfo");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "recoverySigningPublicKey");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v229 = 0;
        v144 = -[TPModel isRecoveryKeyExcluded:error:](v217, "isRecoveryKeyExcluded:error:", v143, &v229);
        v67 = v229;

        if (v67)
        {
          TPModelLog();
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v67;
            v137 = v136;
            v138 = "Error determining whether recovery key is excluded: %{public}@";
            v139 = 12;
LABEL_193:
            _os_log_impl(&dword_1DE1BE000, v137, OS_LOG_TYPE_DEFAULT, v138, buf, v139);
          }
          goto LABEL_194;
        }
        if (!v144)
        {
          v228 = 0;
          -[TPModel allTrustedPeersWithCurrentRecoveryKeyWithError:](v217, "allTrustedPeersWithCurrentRecoveryKeyWithError:", &v228);
          v136 = objc_claimAutoreleasedReturnValue();
          v67 = v228;
          if (v67)
          {
            TPModelLog();
            v145 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v67;
              _os_log_impl(&dword_1DE1BE000, v145, OS_LOG_TYPE_DEFAULT, "Error finding peers with current recovery key: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            if (-[NSObject count](v136, "count"))
            {
              v67 = 0;
              goto LABEL_194;
            }
            objc_msgSend(v134, "stableInfo");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "recoverySigningPublicKey");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPModel recoveryKeyPeerID:](v217, "recoveryKeyPeerID:", v147);
            v145 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v193, "addObject:", v145);
          }

LABEL_194:
        }
      }

      objc_autoreleasePoolPop(v133);
      if (v130 != ++v131)
        continue;
      break;
    }
    v148 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v231, v275, 16);
    v130 = v148;
    if (v148)
      continue;
    break;
  }
LABEL_210:

  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v149 = v129;
  v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v224, v274, 16);
  if (!v150)
    goto LABEL_229;
  v151 = *(_QWORD *)v225;
  while (2)
  {
    v152 = 0;
    while (2)
    {
      if (*(_QWORD *)v225 != v151)
        objc_enumerationMutation(v149);
      v153 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * v152);
      if ((objc_msgSend(v153, "containsString:", CFSTR("RK-")) & 1) != 0
        || (-[TPModel allCustodianRecoveryKeyPeerIDs](v217, "allCustodianRecoveryKeyPeerIDs"),
            v154 = (void *)objc_claimAutoreleasedReturnValue(),
            v155 = objc_msgSend(v154, "containsObject:", v153),
            v154,
            (v155 & 1) != 0))
      {
        v67 = 0;
        goto LABEL_218;
      }
      v223 = 0;
      -[TPModel peerWithID:error:](v217, "peerWithID:error:", v153, &v223);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v223;

      if (!v156)
      {
        TPModelLog();
        v157 = objc_claimAutoreleasedReturnValue();
        v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT);
        if (v67)
        {
          if (v158)
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v153;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v67;
            v159 = v157;
            v160 = "Error finding peer %{public}@ in model, removing: %{public}@";
            v161 = 22;
            goto LABEL_226;
          }
        }
        else if (v158)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v153;
          v159 = v157;
          v160 = "Peer %{public}@ not registered in the model, removing";
          v161 = 12;
LABEL_226:
          _os_log_impl(&dword_1DE1BE000, v159, OS_LOG_TYPE_DEFAULT, v160, buf, v161);
        }

        objc_msgSend(v193, "removeObject:", v153);
      }
LABEL_218:

      if (v150 != ++v152)
        continue;
      break;
    }
    v162 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v224, v274, 16);
    v150 = v162;
    if (v162)
      continue;
    break;
  }
LABEL_229:

  objc_msgSend(v211, "includedPeerIDs");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v207, "isEqualToSet:", v163))
    goto LABEL_235;
  objc_msgSend(v211, "excludedPeerIDs");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v193, "isEqualToSet:", v164))
    goto LABEL_234;
  if (!v195
    || (objc_msgSend(v211, "preapprovals"),
        v67 = (id)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v195, "isEqual:", v67) & 1) != 0))
  {
    objc_msgSend(v211, "dispositions");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v222, "isEqualToDictionary:", v186);

    if (v195)
    {

      if ((v187 & 1) == 0)
        goto LABEL_236;
    }
    else
    {

      if (!v187)
        goto LABEL_236;
    }
    TPModelLog();
    v188 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE1BE000, v188, OS_LOG_TYPE_DEFAULT, "Analysis didn't actually change anything, returning old dynamicInfo", buf, 2u);
    }

    v29 = v211;
  }
  else
  {

LABEL_234:
LABEL_235:

LABEL_236:
    TPModelLog();
    v165 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v207;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v193;
      _os_log_impl(&dword_1DE1BE000, v165, OS_LOG_TYPE_DEFAULT, "After exclusion filtering: included:%{public}@ excluded:%{public}@", buf, 0x16u);
    }

    -[TPModel createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:](v217, "createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:", v207, v193, v222, v195, v200, a14);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    TPModelLog();
    v167 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v166;
      _os_log_impl(&dword_1DE1BE000, v167, OS_LOG_TYPE_DEFAULT, "Returning new dynamicinfo: %{public}@", buf, 0xCu);
    }

    v29 = v166;
  }

LABEL_266:
LABEL_267:

LABEL_268:
  v61 = v199;
LABEL_269:

LABEL_270:
LABEL_271:

  return v29;
}

- (id)filterPeerList:(id)a3 byMachineIDs:(id)a4 sponsorPeerID:(id)a5 dispositions:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  TPPBDisposition *v29;
  TPPBDisposition *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  TPPBDisposition *v39;
  TPPBDispositionDisallowedMachineID *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  TPPBDispositionEvictedMachineID *v45;
  void *v46;
  TPPBDispositionUnknownReasonRemovalMachineID *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  TPPBDispositionGhostedMachineID *v52;
  TPPBUnknownMachineID *v53;
  void *v54;
  id v56;
  id v57;
  TPModel *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id obj;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v64 = a6;
  v60 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v56 = v10;
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (!v13)
    goto LABEL_42;
  v14 = v13;
  v15 = *(_QWORD *)v67;
  v62 = *(_QWORD *)v67;
  v58 = self;
  v59 = v12;
  do
  {
    v16 = 0;
    v61 = v14;
    do
    {
      if (*(_QWORD *)v67 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x1DF0E9908]();
      v65 = 0;
      -[TPModel peerWithID:error:](self, "peerWithID:error:", v17, &v65);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v65;
      v21 = v20;
      if (v19)
      {
        if ((objc_msgSend(v17, "isEqualToString:", v12) & 1) != 0)
          goto LABEL_40;
        objc_msgSend(v19, "permanentInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "machineID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "entryFor:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        if (v24)
          v25 = -[NSObject status](v24, "status");
        else
          v25 = 0;
        objc_msgSend(v19, "peerID", v56);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          v29 = v27;
        else
          v29 = objc_alloc_init(TPPBDisposition);
        v30 = v29;

        v15 = v62;
        switch(v25)
        {
          case 0:
            -[TPPBDisposition disallowedMachineID](v30, "disallowedMachineID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              TPModelLog();
              v32 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                goto LABEL_37;
              objc_msgSend(v19, "permanentInfo");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "machineID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v71 = v17;
              v72 = 2114;
              v73 = v34;
              v35 = v32;
              v36 = "Peer (%{public}@) has an unknown machine ID (%{public}@), but leaving disposition as 'disallowed'";
            }
            else
            {
              v53 = objc_alloc_init(TPPBUnknownMachineID);
              -[TPPBDisposition setUnknownMachineID:](v30, "setUnknownMachineID:", v53);

              objc_msgSend(v19, "peerID");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "setObject:forKeyedSubscript:", v30, v54);

              TPModelLog();
              v32 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                goto LABEL_37;
              objc_msgSend(v19, "permanentInfo");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "machineID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v71 = v17;
              v72 = 2114;
              v73 = v34;
              v35 = v32;
              v36 = "Peer (%{public}@) has an unknown machine ID (%{public}@)";
            }
            goto LABEL_36;
          case 1:
            objc_msgSend(v19, "peerID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v64;
            v39 = 0;
            goto LABEL_33;
          case 2:
            v40 = objc_alloc_init(TPPBDispositionDisallowedMachineID);
            -[TPPBDisposition setDisallowedMachineID:](v30, "setDisallowedMachineID:", v40);

            objc_msgSend(v19, "peerID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v30, v41);

            TPModelLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "permanentInfo");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "machineID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v71 = v17;
              v72 = 2114;
              v73 = v44;
              _os_log_impl(&dword_1DE1BE000, v42, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) has a disallowed machine ID (%{public}@)", buf, 0x16u);

              v15 = v62;
            }

            objc_msgSend(v57, "addObject:", v17);
            break;
          case 3:
            -[TPPBDisposition setUnknownMachineID:](v30, "setUnknownMachineID:", 0);
            -[TPPBDisposition setDisallowedMachineID:](v30, "setDisallowedMachineID:", 0);
            -[TPPBDisposition setUnknownReasonRemovalMachineID:](v30, "setUnknownReasonRemovalMachineID:", 0);
            v45 = objc_alloc_init(TPPBDispositionEvictedMachineID);
            -[TPPBDisposition setEvictedMachineID:](v30, "setEvictedMachineID:", v45);

            objc_msgSend(v19, "peerID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v30, v46);

            TPModelLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              goto LABEL_37;
            objc_msgSend(v19, "permanentInfo");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "machineID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v71 = v17;
            v72 = 2114;
            v73 = v34;
            v35 = v32;
            v36 = "Peer (%{public}@) has an evicted machine ID (%{public}@)";
            goto LABEL_36;
          case 4:
            -[TPPBDisposition setUnknownMachineID:](v30, "setUnknownMachineID:", 0);
            -[TPPBDisposition setDisallowedMachineID:](v30, "setDisallowedMachineID:", 0);
            -[TPPBDisposition setEvictedMachineID:](v30, "setEvictedMachineID:", 0);
            v47 = objc_alloc_init(TPPBDispositionUnknownReasonRemovalMachineID);
            -[TPPBDisposition setUnknownReasonRemovalMachineID:](v30, "setUnknownReasonRemovalMachineID:", v47);

            objc_msgSend(v19, "peerID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v30, v48);

            TPModelLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              goto LABEL_37;
            objc_msgSend(v19, "permanentInfo");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "machineID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v71 = v17;
            v72 = 2114;
            v73 = v34;
            v35 = v32;
            v36 = "Peer (%{public}@) with machine ID (%{public}@) has been removed with an unknown reason";
LABEL_36:
            _os_log_impl(&dword_1DE1BE000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);

            v15 = v62;
LABEL_37:

            break;
          case 5:
            TPModelLog();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "permanentInfo");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "machineID");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v71 = v17;
              v72 = 2114;
              v73 = v51;
              _os_log_impl(&dword_1DE1BE000, v49, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) with machine ID (%{public}@) has ghosted the TDL", buf, 0x16u);

              v15 = v62;
            }

            v52 = objc_alloc_init(TPPBDispositionGhostedMachineID);
            -[TPPBDisposition setGhostedMachineID:](v30, "setGhostedMachineID:", v52);

            objc_msgSend(v19, "peerID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v64;
            v39 = v30;
LABEL_33:
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, v37);

            break;
          default:
            break;
        }

        self = v58;
        v12 = v59;
        v14 = v61;
      }
      else
      {
        if (!v20)
          goto LABEL_40;
        TPModelLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v71 = v17;
          v72 = 2114;
          v73 = v21;
          _os_log_impl(&dword_1DE1BE000, v24, OS_LOG_TYPE_DEFAULT, "Error finding peer %{public}@: %{public}@", buf, 0x16u);
        }
      }

LABEL_40:
      objc_autoreleasePoolPop(v18);
      ++v16;
    }
    while (v14 != v16);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  }
  while (v14);
LABEL_42:

  v10 = v56;
LABEL_44:

  return v57;
}

- (id)peersWithMachineID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__TPModel_peersWithMachineID_error___block_invoke;
    v11[3] = &unk_1EA8BF318;
    v12 = v6;
    p_buf = &buf;
    -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v11, a4);
    if (*a4)
      v7 = 0;
    else
      v7 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v9 = v7;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TPModelLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_1DE1BE000, v8, OS_LOG_TYPE_ERROR, "Unexpected nil error in peersWithMachineID:%{public}@", (uint8_t *)&buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)filterPreapprovals:(id)a3 forExistingPeers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int64_t v14;
  id v15;
  id v16;
  id v17;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v14 = +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v13);
        if (v14 != -1)
        {
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __47__TPModel_filterPreapprovals_forExistingPeers___block_invoke;
          v20[3] = &unk_1EA8BF340;
          v23 = v14;
          v20[4] = v13;
          v21 = v7;
          v22 = v6;
          v19 = 0;
          -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v20, &v19);
          v15 = v19;
          v16 = v22;
          if (v15)
          {
            v17 = v15;

            goto LABEL_13;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (id)dynamicInfoForJoiningPeerID:(id)a3 peerPermanentInfo:(id)a4 peerStableInfo:(id)a5 sponsorID:(id)a6 preapprovedKeys:(id)a7 signingKeyPair:(id)a8 currentMachineIDs:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _BOOL4 v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v46 = a4;
  v47 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v48 = a9;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = (id)0xAAAAAAAAAAAAAAAALL;
  v49 = v16;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v16);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_13;
  v57 = 0;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v17, &v57);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v57;
  if (!v21)
  {
    TPModelLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (!v28)
        goto LABEL_10;
      *(_DWORD *)buf = 138543618;
      v65 = v17;
      v66 = 2114;
      v67 = v22;
      v29 = "Error finding peer %{public}@: %{public}@";
    }
    else
    {
      if (!v28)
        goto LABEL_10;
      *(_DWORD *)buf = 138543618;
      v65 = v17;
      v66 = 2114;
      v67 = 0;
      v29 = "Peer not in DB %{public}@: %{public}@";
    }
    _os_log_impl(&dword_1DE1BE000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    goto LABEL_10;
  }
  v23 = (void *)v59[5];
  objc_msgSend(v21, "dynamicInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "includedPeerIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unionSet:", v25);

  objc_msgSend(v21, "dynamicInfo");
  v26 = objc_claimAutoreleasedReturnValue();
  -[NSObject excludedPeerIDs](v26, "excludedPeerIDs");
  v27 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v27;
LABEL_10:

  TPModelLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (void *)v59[5];
    *(_DWORD *)buf = 138543874;
    v65 = v17;
    v66 = 2114;
    v67 = v31;
    v68 = 2114;
    v69 = v20;
    _os_log_impl(&dword_1DE1BE000, v30, OS_LOG_TYPE_DEFAULT, "From our sponsor (%{public}@), included: %{public}@ excluded: %{public}@", buf, 0x20u);
  }

LABEL_13:
  if (v18)
  {
    objc_msgSend(v19, "publicKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "spki");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CB3880];
    v35 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke;
    v55[3] = &unk_1EA8BF368;
    v36 = v33;
    v56 = v36;
    objc_msgSend(v34, "predicateWithBlock:", v55);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v51[0] = v35;
    v51[1] = 3221225472;
    v51[2] = __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke_2;
    v51[3] = &unk_1EA8BF390;
    v18 = v38;
    v52 = v18;
    v53 = v20;
    v54 = &v58;
    v50 = 0;
    -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v51, &v50);
    v39 = v50;
    if (v39)
    {
      v40 = v39;
      TPModelLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v65 = v40;
        _os_log_impl(&dword_1DE1BE000, v41, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", buf, 0xCu);
      }

      if (a10)
        *a10 = objc_retainAutorelease(v40);

      v42 = 0;
      v43 = v56;
      goto LABEL_26;
    }

  }
  +[TPModel preapprovalsFromKeys:](TPModel, "preapprovalsFromKeys:", v18);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[TPModel createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:](self, "createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:", v59[5], v20, MEMORY[0x1E0C9AA70], v36, v19, a10);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[TPModel calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:](self, "calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:", v49, 0, v46, v47, v43, MEMORY[0x1E0C9AA60], v18, v19, v48, v17, a10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TPModelLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v65 = v49;
      _os_log_impl(&dword_1DE1BE000, v44, OS_LOG_TYPE_DEFAULT, "Unable to create initial dynamic info for peer: %{public}@", buf, 0xCu);
    }

    v43 = 0;
    v42 = 0;
  }
LABEL_26:

  _Block_object_dispose(&v58, 8);
  return v42;
}

- (id)policyForPeerIDs:(id)a3 candidatePeerID:(id)a4 candidateStableInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  BOOL v27;
  id v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  id v34;
  id *v35;
  id v36;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v10, "count"))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", TPErrorDomain, 8, 0);
      v29 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    goto LABEL_35;
  }
  v35 = a6;
  v36 = v12;
  v37 = v11;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v34 = v10;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_25;
  }
  v14 = v13;
  v15 = 0;
  v39 = *(_QWORD *)v46;
  while (2)
  {
    v16 = 0;
    v17 = v15;
    do
    {
      if (*(_QWORD *)v46 != v39)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v16);
      v19 = (void *)MEMORY[0x1DF0E9908]();
      v44 = 0;
      -[TPModel peerWithID:error:](self, "peerWithID:error:", v18, &v44);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v44;
      if (!v20)
      {
        TPModelLog();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 138543618;
            v50 = v18;
            v51 = 2114;
            v52 = v21;
            v24 = v22;
            v25 = "Error finding peer %{public}@: %{public}@";
LABEL_13:
            _os_log_impl(&dword_1DE1BE000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
          }
        }
        else if (v23)
        {
          *(_DWORD *)buf = 138543618;
          v50 = v18;
          v51 = 2114;
          v52 = 0;
          v24 = v22;
          v25 = "Peer not in DB %{public}@: %{public}@";
          goto LABEL_13;
        }

      }
      objc_msgSend(v20, "stableInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v43 = v17;
      v27 = -[TPModel considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:](self, "considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:", v18, v26, v40, &v43, &v42);
      v15 = v43;

      v28 = v42;
      objc_autoreleasePoolPop(v19);
      if (!v27)
      {
        if (v35)
          *v35 = objc_retainAutorelease(v28);

        v29 = 0;
        v10 = v34;
        v12 = v36;
        v11 = v37;
        goto LABEL_34;
      }

      ++v16;
      v17 = v15;
    }
    while (v14 != v16);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v14)
      continue;
    break;
  }
LABEL_25:
  v30 = v15;

  v41 = v15;
  v12 = v36;
  v11 = v37;
  v31 = -[TPModel considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:](self, "considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:", v37, v36, v40, &v41, v35);
  v15 = v41;

  if (!v31)
    goto LABEL_32;
  if (!v15)
  {
    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", TPErrorDomain, 3, 0);
      v15 = 0;
      v29 = 0;
      *v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    v15 = 0;
LABEL_32:
    v29 = 0;
    goto LABEL_33;
  }
  -[TPModel decrypter](self, "decrypter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "policyWithSecrets:decrypter:error:", v40, v32, v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  v10 = v34;
LABEL_34:

LABEL_35:
  return v29;
}

- (BOOL)considerPolicyFromPeerID:(id)a3 stableInfo:(id)a4 secrets:(id)a5 newestPolicyDoc:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  TPModel *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v13)
  {
    v29 = 1;
    goto LABEL_28;
  }
  v57 = a7;
  v58 = self;
  v15 = a6;
  v59 = v12;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v13, "policySecrets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v62 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v13, "policySecrets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v18);
  }

  v24 = v15;
  if (!*v15)
    goto LABEL_12;
  objc_msgSend(*v15, "version");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "versionNumber");
  objc_msgSend(v13, "bestPolicyVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "versionNumber");

  if (v26 <= v28)
  {
LABEL_12:
    -[TPModel dbAdapter](v58, "dbAdapter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bestPolicyVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v30, "policyWithVersion:error:", objc_msgSend(v31, "versionNumber"), &v60);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v60;

    v12 = v59;
    if (v33)
    {
      if (v57)
      {
        v29 = 0;
        *v57 = objc_retainAutorelease(v33);
LABEL_27:

        goto LABEL_28;
      }
LABEL_21:
      v29 = 0;
      goto LABEL_27;
    }
    if (!v32)
    {
      if (v57)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v41 = TPErrorDomain;
        v67[0] = CFSTR("peerID");
        v67[1] = CFSTR("policyVersion");
        v68[0] = v59;
        v42 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "bestPolicyVersion");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v43, "versionNumber"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 1, v45);
        *v57 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_21;
    }
    objc_msgSend(v32, "version");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "policyHash");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bestPolicyVersion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "policyHash");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v32;
    v39 = objc_msgSend(v35, "isEqualToString:", v37);

    if ((v39 & 1) != 0)
    {
      *v24 = objc_retainAutorelease(v38);
      v29 = 1;
    }
    else
    {
      if (v57)
      {
        v53 = TPErrorDomain;
        v54 = (void *)MEMORY[0x1E0CB35C8];
        v66[0] = v59;
        v65[0] = CFSTR("peerID");
        v65[1] = CFSTR("policyVersion");
        v46 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "bestPolicyVersion");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithUnsignedLongLong:", objc_msgSend(v56, "versionNumber"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v55;
        v65[2] = CFSTR("policyDocHash");
        objc_msgSend(v38, "version");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "policyHash");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v66[2] = v48;
        v65[3] = CFSTR("peerExpectsHash");
        objc_msgSend(v13, "bestPolicyVersion");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "policyHash");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v66[3] = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", v53, 2, v51);
        *v57 = (id)objc_claimAutoreleasedReturnValue();

        v32 = v38;
        v29 = 0;
LABEL_26:
        v33 = 0;
        goto LABEL_27;
      }
      v29 = 0;
    }
    v32 = v38;
    goto LABEL_26;
  }
  v29 = 1;
  v12 = v59;
LABEL_28:

  return v29;
}

- (id)getViewsForPeer:(id)a3 stableInfo:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = a4;
  objc_msgSend(v8, "peerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "peerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:](self, "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:", v12, v13, v10, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "modelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewsForModel:error:", v15, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)getViewsForCRK:(id)a3 donorPermanentInfo:(id)a4 donorStableInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[TPModel getViewsForPeer:stableInfo:error:](self, "getViewsForPeer:stableInfo:error:", v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (!v14)
  {
    v19 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "kind") != 2)
    goto LABEL_9;
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "peerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "peerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:](self, "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:", v17, v18, v12, a6);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "inheritedExcludedViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "version");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v21, "versionNumber") <= 0xB)
    {
      v22 = objc_msgSend(v20, "count");

      if (v22)
      {
LABEL_8:
        objc_msgSend(v14, "minusSet:", v20);

LABEL_9:
        v19 = v14;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA8C7C28);
      v21 = v20;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_8;
  }
LABEL_11:

  return v19;
}

- (id)getPeerIDsTrustedByPeerWithID:(id)a3 toAccessView:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  -[TPModel actualPeerWithID:error:](self, "actualPeerWithID:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "dynamicInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel getPeerIDsTrustedByPeerWithDynamicInfo:toAccessView:error:](self, "getPeerIDsTrustedByPeerWithDynamicInfo:toAccessView:error:", v11, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)getPeerIDsTrustedByPeerWithDynamicInfo:(id)a3 toAccessView:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  const char *v24;
  void *v26;
  id v27;
  void *v28;
  id obj;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  objc_msgSend(v8, "includedPeerIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:](self, "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:", v9, 0, 0, &v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v39;
  if (!v11)
  {
    v28 = v10;
    v26 = v9;
    v27 = v8;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v9;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    v12 = 0;
    if (!v33)
      goto LABEL_20;
    v32 = *(_QWORD *)v36;
    while (1)
    {
      for (i = 0; i != v33; ++i)
      {
        v15 = v12;
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1DF0E9908]();
        v34 = v12;
        -[TPModel peerWithID:error:](self, "peerWithID:error:", v16, &v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v34;

        if (v18)
        {
          objc_msgSend(v18, "permanentInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "modelID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "categoryForModel:", v20);
          v21 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v30, "peerInCategory:canAccessView:", v21, v31))
            objc_msgSend(v28, "addObject:", v16);
        }
        else
        {
          TPModelLog();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (!v22)
              goto LABEL_18;
            *(_DWORD *)buf = 138543618;
            v41 = v16;
            v42 = 2114;
            v43 = v12;
            v23 = v21;
            v24 = "Error finding peer %{public}@: %{public}@";
          }
          else
          {
            if (!v22)
              goto LABEL_18;
            *(_DWORD *)buf = 138543618;
            v41 = v16;
            v42 = 2114;
            v43 = 0;
            v23 = v21;
            v24 = "Peer not in DB %{public}@: %{public}@";
          }
          _os_log_impl(&dword_1DE1BE000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
        }
LABEL_18:

        objc_autoreleasePoolPop(v17);
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (!v33)
      {
LABEL_20:

        v10 = v28;
        v13 = v28;
        v9 = v26;
        v8 = v27;
        goto LABEL_22;
      }
    }
  }
  v12 = v11;
  if (a5)
  {
    v12 = objc_retainAutorelease(v11);
    v13 = 0;
    *a5 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_22:

  return v13;
}

- (id)vectorClockWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__TPModel_vectorClockWithError___block_invoke;
  v12[3] = &unk_1EA8BF1D8;
  v6 = v5;
  v13 = v6;
  v11 = 0;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v12, &v11);
  v7 = v11;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (BOOL)doesOctagonContainDistrustedRecoveryKeysWithError:(id *)a3
{
  BOOL v3;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = (void *)MEMORY[0x1DF0E9908](self, a2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__TPModel_doesOctagonContainDistrustedRecoveryKeysWithError___block_invoke;
  v11[3] = &unk_1EA8BF188;
  v11[4] = &v12;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v11, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (!v8)
  {
    objc_msgSend((id)v13[5], "intersectSet:", v7);
    v3 = objc_msgSend((id)v13[5], "count") != 0;
  }

  _Block_object_dispose(&v12, 8);
  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    v3 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v3;
}

- (id)bestRecoveryKeyForStableInfo:(id)a3 vouchers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  TPRecoveryKeyPair *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  TPRecoveryKeyPair *v18;
  void *v19;
  TPRecoveryKeyPair *v20;
  void *v22;
  TPRecoveryKeyPair *v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  TPModel *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[TPRecoveryKeyPair initWithStableInfo:]([TPRecoveryKeyPair alloc], "initWithStableInfo:", v7);
  -[TPRecoveryKeyPair signingKeyData](v9, "signingKeyData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryKeyPeerID:](self, "recoveryKeyPeerID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1DF0E9908]();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__TPModel_bestRecoveryKeyForStableInfo_vouchers_error___block_invoke;
  v32[3] = &unk_1EA8BF3B8;
  v13 = v11;
  v33 = v13;
  v36 = &v38;
  v14 = v8;
  v34 = v14;
  v35 = self;
  v37 = &v44;
  v31 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v32, &v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v31;
  if (v16)
  {
    v17 = v16;
    v18 = 0;
LABEL_3:
    LODWORD(v19) = 1;
    goto LABEL_6;
  }
  objc_msgSend((id)v39[5], "intersectSet:", v15);
  if (objc_msgSend((id)v39[5], "count"))
  {
    -[TPModel removeRecoveryKey](self, "removeRecoveryKey");
    v18 = 0;
    v17 = 0;
    LODWORD(v19) = 0;
    goto LABEL_6;
  }
  objc_msgSend((id)v45[5], "intersectSet:", v15);
  objc_msgSend((id)v45[5], "anyObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v30 = 0;
    -[TPModel peerWithID:error:](self, "peerWithID:error:", v19, &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v30;
    if (v22)
    {
      v23 = [TPRecoveryKeyPair alloc];
      objc_msgSend(v22, "stableInfo");
      v24 = objc_claimAutoreleasedReturnValue();
      v18 = -[TPRecoveryKeyPair initWithStableInfo:](v23, "initWithStableInfo:", v24);
LABEL_23:

      goto LABEL_3;
    }
    TPModelLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543618;
        v51 = v19;
        v52 = 2114;
        v53 = v17;
        v26 = "Error finding peer %{public}@: %{public}@";
        v27 = v24;
        v28 = 22;
LABEL_21:
        _os_log_impl(&dword_1DE1BE000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v51 = v19;
      v26 = "Peer not in DB %{public}@";
      v27 = v24;
      v28 = 12;
      goto LABEL_21;
    }
    v18 = 0;
    goto LABEL_23;
  }
  v18 = 0;
  v17 = 0;
LABEL_6:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  objc_autoreleasePoolPop(v12);
  if ((_DWORD)v19)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    v20 = v18;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)bestWalrusForStableInfo:(id)a3 walrusStableChanges:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  id v21;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  -[TPModel bestWalrusAcrossTrustedPeersWithError:](self, "bestWalrusAcrossTrustedPeersWithError:", &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  v12 = v11;
  if (!v11)
  {
    if (v9 && v10)
    {
      v14 = objc_msgSend(v10, "clock");
      objc_msgSend(v8, "walrusSetting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == objc_msgSend(v15, "clock"))
      {
        objc_msgSend(v8, "walrusSetting");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "value");
        v18 = objc_msgSend(v9, "value");

        if (v17 == v18)
        {
          objc_msgSend(v8, "walrusSetting");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      else
      {

      }
      objc_msgSend(v10, "setClock:", objc_msgSend(v10, "clock") + 1);
      objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
    }
    else
    {
      if (v9 && !v10)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v10, "setClock:", 0);
      }
      if (!v10)
      {
        objc_msgSend(v8, "walrusSetting");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "walrusSetting");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v19, "copy");

          objc_msgSend(v10, "setClock:", 0);
        }
      }
    }
    v13 = v10;
    v10 = v13;
    goto LABEL_19;
  }
  v13 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v11);
LABEL_19:

  return v13;
}

- (unint64_t)trustedPeerCountWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  id v10;

  v5 = (void *)MEMORY[0x1DF0E9908](self, a2);
  v10 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", &__block_literal_global, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {

    objc_autoreleasePoolPop(v5);
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v8 = objc_msgSend(v6, "count");

    objc_autoreleasePoolPop(v5);
  }

  return v8;
}

- (id)bestWalrusAcrossTrustedPeersWithError:(id *)a3
{
  void *v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1DF0E9908](self, a2);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__TPModel_bestWalrusAcrossTrustedPeersWithError___block_invoke;
  v22[3] = &unk_1EA8BF188;
  v22[4] = &v23;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v22, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (id)v24[5];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14, (_QWORD)v17))
          {
            objc_msgSend((id)v24[5], "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      }
      while (v11);
    }

    +[TPModel pickClock:](TPModel, "pickClock:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v23, 8);

  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    v3 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v3;
}

- (id)bestWebAccessAcrossTrustedPeersWithError:(id *)a3
{
  void *v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1DF0E9908](self, a2);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__TPModel_bestWebAccessAcrossTrustedPeersWithError___block_invoke;
  v22[3] = &unk_1EA8BF188;
  v22[4] = &v23;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v22, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (id)v24[5];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14, (_QWORD)v17))
          {
            objc_msgSend((id)v24[5], "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      }
      while (v11);
    }

    +[TPModel pickClock:](TPModel, "pickClock:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v23, 8);

  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    v3 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v3;
}

- (id)bestWebAccessForStableInfo:(id)a3 webAccessStableChanges:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  id v21;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  -[TPModel bestWebAccessAcrossTrustedPeersWithError:](self, "bestWebAccessAcrossTrustedPeersWithError:", &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  v12 = v11;
  if (!v11)
  {
    if (v9 && v10)
    {
      v14 = objc_msgSend(v10, "clock");
      objc_msgSend(v8, "webAccess");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == objc_msgSend(v15, "clock"))
      {
        objc_msgSend(v8, "webAccess");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "value");
        v18 = objc_msgSend(v9, "value");

        if (v17 == v18)
        {
          objc_msgSend(v8, "webAccess");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      else
      {

      }
      objc_msgSend(v10, "setClock:", objc_msgSend(v10, "clock") + 1);
      objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
    }
    else
    {
      if (v9 && !v10)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v10, "setClock:", 0);
      }
      if (!v10)
      {
        objc_msgSend(v8, "webAccess");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "webAccess");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v19, "copy");

          objc_msgSend(v10, "setClock:", 0);
        }
      }
    }
    v13 = v10;
    v10 = v13;
    goto LABEL_19;
  }
  v13 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v11);
LABEL_19:

  return v13;
}

- (id)untrustedPeerIDsWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__TPModel_untrustedPeerIDsWithError___block_invoke;
  v10[3] = &unk_1EA8BF1B0;
  v10[4] = &v11;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v10, &v9);
  v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (id)possibleSponsorsForRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5
{
  id v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  void *context;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[4];
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1DF0E9908]();
  TPModelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "signingKeyData", context);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptionKeyData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1DE1BE000, v10, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: sign %{public}@, enc %{public}@", buf, 0x16u);

  }
  objc_msgSend(v8, "signingKeyData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryKeyPeerID:](self, "recoveryKeyPeerID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __54__TPModel_possibleSponsorsForRecoveryKey_block_error___block_invoke;
  v27[3] = &unk_1EA8BF460;
  v14 = v13;
  v28 = v14;
  v31 = buf;
  v15 = v8;
  v29 = v15;
  v16 = v9;
  v30 = v16;
  v32 = &v33;
  v26 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v27, &v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v26;
  if (!v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "intersectSet:", v17);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      TPModelLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1DE1BE000, v19, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: registered recovery key is not trusted", v39, 2u);
      }
LABEL_7:

      v5 = 0;
      goto LABEL_12;
    }
    objc_msgSend((id)v34[5], "intersectSet:", v17);
    v20 = objc_msgSend((id)v34[5], "count");
    TPModelLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v21)
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1DE1BE000, v19, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: no sponsors, no distrust", v39, 2u);
      }
      goto LABEL_7;
    }
    if (v21)
    {
      v22 = v34[5];
      *(_DWORD *)v39 = 138543362;
      v40 = v22;
      _os_log_impl(&dword_1DE1BE000, v19, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: returning %{public}@", v39, 0xCu);
    }

    v5 = (id)v34[5];
  }
LABEL_12:

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
  if (v18)
  {
    v5 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v18);
  }
  _Block_object_dispose(&v33, 8);

  return v5;
}

- (id)peerIDThatTrustsRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__TPModel_peerIDThatTrustsRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke;
  v18[3] = &unk_1EA8BF488;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  -[TPModel possibleSponsorsForRecoveryKey:block:error:](self, "possibleSponsorsForRecoveryKey:block:error:", a3, v18, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (*a6)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v14, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)isRecoveryKeyEnrolledWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  TPRecoveryKeyPair *v8;
  void *v9;
  void *v10;
  TPRecoveryKeyPair *v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = (void *)v5;
  -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  v8 = [TPRecoveryKeyPair alloc];
  -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TPRecoveryKeyPair initWithSigningKeyData:encryptionKeyData:](v8, "initWithSigningKeyData:encryptionKeyData:", v9, v10);

  v17 = 0;
  -[TPModel possibleSponsorsForRecoveryKey:block:error:](self, "possibleSponsorsForRecoveryKey:block:error:", v11, &__block_literal_global_99, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v13)
  {
    TPModelLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1DE1BE000, v14, OS_LOG_TYPE_DEFAULT, "Error determining possible sponsors: %{public}@", buf, 0xCu);
    }

    v15 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v13);
  }
  else
  {
    v15 = objc_msgSend(v12, "count") != 0;
  }

  return v15;
}

- (void)removeRecoveryKey
{
  -[TPModel setRecoverySigningPubKey:](self, "setRecoverySigningPubKey:", 0);
  -[TPModel setRecoveryEncryptionPubKey:](self, "setRecoveryEncryptionPubKey:", 0);
}

- (void)setRecoveryKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signingKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToData:", v6) & 1) != 0)
  {
    -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptionKeyData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToData:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  TPModelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signingKeyData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptionKeyData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1DE1BE000, v10, OS_LOG_TYPE_DEFAULT, "Recovery Keys changed! currently set signingKey: %{public}@, currently set encryptionKey: %{public}@, new signingKey: %{public}@, new encryption Key: %{public}@", (uint8_t *)&v17, 0x2Au);

  }
LABEL_8:
  objc_msgSend(v4, "encryptionKeyData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel setRecoveryEncryptionPubKey:](self, "setRecoveryEncryptionPubKey:", v15);

  objc_msgSend(v4, "signingKeyData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel setRecoverySigningPubKey:](self, "setRecoverySigningPubKey:", v16);

}

- (id)recoverySigningPublicKey
{
  return self->_recoverySigningPubKey;
}

- (id)recoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPubKey;
}

- (id)possibleSponsorsForCustodianRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5
{
  id v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *context;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1DF0E9908]();
  TPModelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uuid");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1DE1BE000, v10, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: %{public}@/%{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__TPModel_possibleSponsorsForCustodianRecoveryKey_block_error___block_invoke;
  v28[3] = &unk_1EA8BF4F0;
  v12 = v8;
  v29 = v12;
  v31 = buf;
  v13 = v9;
  v30 = v13;
  v32 = &v33;
  v27 = 0;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v28, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;
  if (!v15)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "intersectSet:", v14);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      TPModelLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "peerID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v39 = 138543618;
        v40 = v17;
        v41 = 2114;
        v42 = v18;
        _os_log_impl(&dword_1DE1BE000, v16, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: CRK %{public}@/%{public}@ is not trusted", v39, 0x16u);

      }
LABEL_7:

      v5 = 0;
      goto LABEL_12;
    }
    objc_msgSend((id)v34[5], "intersectSet:", v14);
    v19 = objc_msgSend((id)v34[5], "count");
    TPModelLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (!v19)
    {
      if (v20)
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1DE1BE000, v16, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: no sponsors, no distrust", v39, 2u);
      }
      goto LABEL_7;
    }
    if (v20)
    {
      objc_msgSend(v12, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "peerID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v34[5];
      *(_DWORD *)v39 = 138543874;
      v40 = v21;
      v41 = 2114;
      v42 = v22;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1DE1BE000, v16, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: CRK %{public}@/%{public}@ returning %{public}@", v39, 0x20u);

    }
    v5 = (id)v34[5];
  }
LABEL_12:

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
  if (v15)
  {
    v5 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  _Block_object_dispose(&v33, 8);

  return v5;
}

- (id)peerIDThatTrustsCustodianRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v10 = a4;
  v11 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__TPModel_peerIDThatTrustsCustodianRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke;
  v20[3] = &unk_1EA8BF488;
  v20[4] = self;
  v12 = v10;
  v21 = v12;
  v13 = v11;
  v22 = v13;
  v19 = 0;
  -[TPModel possibleSponsorsForCustodianRecoveryKey:block:error:](self, "possibleSponsorsForCustodianRecoveryKey:block:error:", a3, v20, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  v16 = v15;
  if (v15)
  {
    v17 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }
  else
  {
    objc_msgSend(v14, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)isCustodianRecoveryKeyTrusted:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  -[TPModel possibleSponsorsForCustodianRecoveryKey:block:error:](self, "possibleSponsorsForCustodianRecoveryKey:block:error:", a3, &__block_literal_global_100, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    TPModelLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1DE1BE000, v7, OS_LOG_TYPE_DEFAULT, "Error determining possible sponsors: %{public}@", buf, 0xCu);
    }

    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    v8 = objc_msgSend(v5, "count") != 0;
  }

  return v8;
}

- (void)registerCustodianRecoveryKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPModel.m"), 2687, CFSTR("custodianRecoveryKey"));

  }
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v10);

  }
  TPModelLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "peerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v12;
    v17 = 2048;
    v18 = objc_msgSend(v13, "count");
    _os_log_impl(&dword_1DE1BE000, v11, OS_LOG_TYPE_DEFAULT, "registerCustodianRecoveryKey %{public}@ -- size now %lu", (uint8_t *)&v15, 0x16u);

  }
}

- (void)removeCustodianRecoveryKey:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TPModelLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1DE1BE000, v4, OS_LOG_TYPE_DEFAULT, "removeCustodianRecoveryKey: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)findCustodianRecoveryKeyWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)allCustodianRecoveryKeys
{
  void *v2;
  void *v3;

  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allCustodianRecoveryKeyPeerIDs
{
  void *v2;
  void *v3;

  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)currentStatePossiblyMissingDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v20;
  void *context;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  uint64_t *v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1DF0E9908](self, a2);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = (id)0xAAAAAAAAAAAAAAAALL;
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v33 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __52__TPModel_currentStatePossiblyMissingDataWithError___block_invoke;
  v28[3] = &unk_1EA8BF538;
  v30 = v32;
  v8 = v7;
  v29 = v8;
  v31 = &v34;
  v27 = 0;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v28, &v27);
  v22 = v27;
  v20 = v8;
  if (v22 || !objc_msgSend((id)v35[5], "count"))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)v35[5];
    v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v44, 16);
    if (v9)
    {
      v11 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v10);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend((id)v35[5], "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          TPModelLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v14;
            v42 = 2114;
            v43 = v13;
            _os_log_impl(&dword_1DE1BE000, v15, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ trusts the following unknown peer IDs: %{public}@", buf, 0x16u);
          }

          if (+[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v13) != -1)
          {

            LOBYTE(v9) = 1;
            goto LABEL_18;
          }
          TPModelLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v14;
            v42 = 2114;
            v43 = v13;
            _os_log_impl(&dword_1DE1BE000, v16, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ trusts the following peer ID, but we don't recognize the hash: %{public}@", buf, 0x16u);
          }

        }
        v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v44, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_18:

  }
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  objc_autoreleasePoolPop(context);
  v17 = v22;
  if ((v9 & 1) == 0 && a3 && v22)
  {
    *a3 = objc_retainAutorelease(v22);
    v17 = v22;
  }

  return v9;
}

- (BOOL)suppressInitialInfoLogging
{
  return self->_suppressInitialInfoLogging;
}

- (void)setSuppressInitialInfoLogging:(BOOL)a3
{
  self->_suppressInitialInfoLogging = a3;
}

- (TPModelDBAdapterProtocol)dbAdapter
{
  return self->_dbAdapter;
}

- (void)setDbAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_dbAdapter, a3);
}

- (TPDecrypter)decrypter
{
  return self->_decrypter;
}

- (void)setDecrypter:(id)a3
{
  objc_storeStrong((id *)&self->_decrypter, a3);
}

- (NSData)recoverySigningPubKey
{
  return self->_recoverySigningPubKey;
}

- (void)setRecoverySigningPubKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoverySigningPubKey, a3);
}

- (NSData)recoveryEncryptionPubKey
{
  return self->_recoveryEncryptionPubKey;
}

- (void)setRecoveryEncryptionPubKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryEncryptionPubKey, a3);
}

- (NSMutableDictionary)custodianRecoveryKeys
{
  return self->_custodianRecoveryKeys;
}

- (void)setCustodianRecoveryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_custodianRecoveryKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianRecoveryKeys, 0);
  objc_storeStrong((id *)&self->_recoveryEncryptionPubKey, 0);
  objc_storeStrong((id *)&self->_recoverySigningPubKey, 0);
  objc_storeStrong((id *)&self->_decrypter, 0);
  objc_storeStrong((id *)&self->_dbAdapter, 0);
}

void __52__TPModel_currentStatePossiblyMissingDataWithError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "peerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v4);
  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "dynamicInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "includedPeerIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "minusSet:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_msgSend(v8, "minusSet:", a1[4]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", 0, v4);
}

uint64_t __47__TPModel_isCustodianRecoveryKeyTrusted_error___block_invoke()
{
  return 1;
}

uint64_t __83__TPModel_peerIDThatTrustsCustodianRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v12 = 0;
  v7 = objc_msgSend(v4, "checkIntroductionForCandidate:stableInfo:withSponsorID:error:", v5, v6, v3, &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
  {
    TPModelLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)a1[5], "peerID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v3;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1DE1BE000, v9, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ supports this Custodian RK, but cannot sponsor peer %{public}@: %{public}@", buf, 0x20u);

    }
  }

  return v7;
}

void __63__TPModel_possibleSponsorsForCustodianRecoveryKey_block_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dynamicInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "excludedPeerIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
LABEL_6:
    objc_msgSend(*(id *)(*(_QWORD *)(v8 + 8) + 40), "addObject:", v3);
    goto LABEL_8;
  }
  objc_msgSend(v13, "dynamicInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "includedPeerIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "containsObject:", v11))
  {

    goto LABEL_8;
  }
  v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if (v12)
  {
    v8 = *(_QWORD *)(a1 + 56);
    goto LABEL_6;
  }
LABEL_8:

}

uint64_t __42__TPModel_isRecoveryKeyEnrolledWithError___block_invoke()
{
  return 1;
}

uint64_t __74__TPModel_peerIDThatTrustsRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v12 = 0;
  v7 = objc_msgSend(v4, "checkIntroductionForCandidate:stableInfo:withSponsorID:error:", v5, v6, v3, &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
  {
    TPModelLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)a1[5], "peerID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v3;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1DE1BE000, v9, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ supports this recovery key, but cannot sponsor peer %{public}@: %{public}@", buf, 0x20u);

    }
  }

  return v7;
}

void __54__TPModel_possibleSponsorsForRecoveryKey_block_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dynamicInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "excludedPeerIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
LABEL_3:
    objc_msgSend(*(id *)(*(_QWORD *)(v7 + 8) + 40), "addObject:", v3);
    goto LABEL_15;
  }
  objc_msgSend(v26, "stableInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_15;
  v9 = (void *)v8;
  objc_msgSend(v26, "stableInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recoverySigningPublicKey");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_14:

    goto LABEL_15;
  }
  v12 = (void *)v11;
  objc_msgSend(v26, "stableInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recoveryEncryptionPublicKey");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_13:

    goto LABEL_14;
  }
  v15 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 40), "signingKeyData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stableInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recoverySigningPublicKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToData:", v18))
  {

    goto LABEL_13;
  }
  v25 = v16;
  objc_msgSend(*(id *)(a1 + 40), "encryptionKeyData");
  v24 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stableInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recoveryEncryptionPublicKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToData:", v20);
  if (v21)
    v21 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v23 = v21;

  if (v23)
  {
    v7 = *(_QWORD *)(a1 + 64);
    goto LABEL_3;
  }
LABEL_15:

}

void __37__TPModel_untrustedPeerIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "dynamicInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludedPeerIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "unionSet:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unionSet:", v4);

  }
}

void __52__TPModel_bestWebAccessAcrossTrustedPeersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stableInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "webAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __49__TPModel_bestWalrusAcrossTrustedPeersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stableInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "walrusSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __55__TPModel_bestRecoveryKeyForStableInfo_vouchers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "peerID");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludedPeerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  v8 = (void *)v4;
  v9 = a1;

  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = *(id *)(a1 + 40);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  v42 = a1;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    v40 = v8;
    v41 = *(_QWORD *)v46;
    do
    {
      v13 = 0;
      v43 = v11;
      do
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
        objc_msgSend(v14, "sponsorID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "isEqualToString:", v15);

        if (v16)
        {
          objc_msgSend(v3, "stableInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "recoverySigningPublicKey");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_15;
          v19 = (void *)v18;
          objc_msgSend(*(id *)(v9 + 48), "recoverySigningPubKey");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
          {

            v11 = v43;
LABEL_15:

            goto LABEL_16;
          }
          v21 = (void *)v20;
          objc_msgSend(v3, "stableInfo");
          v22 = v3;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "recoverySigningPublicKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v9 + 48), "recoverySigningPubKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToData:", v25);

          v9 = v42;
          v12 = v41;

          v3 = v22;
          v8 = v40;

          v11 = v43;
          if (v26)
          {
            objc_msgSend(v3, "stableInfo");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "recoverySigningPublicKey");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "createRecoveryECPublicKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v14, "checkSignatureWithKey:", v29);

            v12 = v41;
            v9 = v42;
            if (v30)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v42 + 64) + 8) + 40), "addObject:", v40);
              goto LABEL_18;
            }
          }
        }
LABEL_16:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v11);
  }
LABEL_18:

  objc_msgSend(v3, "stableInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = v8;
    objc_msgSend(v3, "stableInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "recoverySigningPublicKey");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v42 + 48), "recoverySigningPubKey");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqualToData:", v35) & 1) != 0)
    {
      objc_msgSend(v3, "stableInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "recoveryEncryptionPublicKey");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v42 + 48), "recoveryEncryptionPubKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqualToData:", v38);

      v8 = v32;
      if (v39)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v42 + 64) + 8) + 40), "addObject:", v32);
    }
    else
    {

      v8 = v32;
    }
  }

}

void __61__TPModel_doesOctagonContainDistrustedRecoveryKeysWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "peerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "dynamicInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludedPeerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "containsString:", CFSTR("RK-")))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

void __32__TPModel_vectorClockWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stableInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(v13, "dynamicInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_8;
  }
  objc_msgSend(v13, "stableInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "clock");

  objc_msgSend(v13, "dynamicInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clock");

  if (v6 <= v8)
    v9 = v8;
  else
    v9 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v13, "peerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

LABEL_8:
}

uint64_t __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "permanentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signingPubKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spki");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    *(_QWORD *)&v9 = 138543362;
    v21 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v21, (_QWORD)v22))
        {
          v13 = *(void **)(a1 + 40);
          objc_msgSend(v3, "peerID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

          if ((v13 & 1) != 0)
          {
            TPModelLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v3, "peerID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v21;
              v27 = v16;
              v17 = v15;
              v18 = "Not including %{public}@ even through they are preapproved";
              goto LABEL_12;
            }
          }
          else
          {
            v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            objc_msgSend(v3, "peerID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v20);

            TPModelLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v3, "peerID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v21;
              v27 = v16;
              v17 = v15;
              v18 = "Trusting %{public}@ due to preapproval";
LABEL_12:
              _os_log_impl(&dword_1DE1BE000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

            }
          }

          continue;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

}

void __47__TPModel_filterPreapprovals_forExistingPeers___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  objc_msgSend(v5, "peerID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "permanentInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "signingPubKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spki");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v10)
    && objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11))
  {
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", *(_QWORD *)(a1 + 32));
    *a3 = 1;
  }

}

void __36__TPModel_peersWithMachineID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "permanentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "machineID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v8, "peerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v5, "permanentInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signingPubKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spki");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v11))
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v5, "permanentInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "canTrustCandidate:inEpoch:", v13, *(_QWORD *)(a1 + 104));

    if ((_DWORD)v12)
    {
      TPModelLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v6;
        _os_log_impl(&dword_1DE1BE000, v14, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ preapproved", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
      objc_msgSend(*(id *)(a1 + 40), "recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      objc_msgSend(*(id *)(a1 + 80), "removeObject:", *(_QWORD *)(a1 + 32));
      *a3 = 1;
    }
  }

}

uint64_t __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1DF0E9908]();
  v5 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v5, "peerWithID:error:", v3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v6)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "permanentInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "canTrustCandidate:inEpoch:", v10, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!v7)
    {
      v11 = 1;
      goto LABEL_8;
    }
    TPModelLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = v3;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1DE1BE000, v10, OS_LOG_TYPE_DEFAULT, "Error finding excluded peer %{public}@: %{public}@", buf, 0x16u);
    }
    v11 = 1;
  }

LABEL_8:
  objc_autoreleasePoolPop(v4);

  return v11;
}

void __141__TPModel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "peerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v3, "permanentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "signingPubKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spki");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v9))
  {
    TPModelLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "peerID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1DE1BE000, v10, OS_LOG_TYPE_DEFAULT, "Sponsor %{public}@ preapproves peer %{public}@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "peerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "permanentInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v12, "considerCandidateID:withSponsorID:sponsorPermanentInfo:toExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:", v4, v13, v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96));

  }
}

void __160__TPModel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id obj;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "sponsorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "beneficiaryID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v9))
    {

LABEL_5:
      TPModelLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        goto LABEL_9;
      }
      *(_DWORD *)buf = 138543362;
      v29 = v5;
      v13 = "Skipping voucher for already known beneficiary: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1DE1BE000, v12, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
      goto LABEL_8;
    }
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v5, "beneficiaryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

    if ((_DWORD)v10)
      goto LABEL_5;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    v16 = *(void **)(a1 + 56);
    objc_msgSend(v5, "sponsorID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    obj = *(id *)(v18 + 40);
    LOBYTE(v16) = objc_msgSend(v16, "hasPeerWithID:error:", v17, &obj);
    objc_storeStrong((id *)(v18 + 40), obj);

    if ((v16 & 1) == 0)
    {
      TPModelLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_8;
      *(_DWORD *)buf = 138543362;
      v29 = v5;
      v13 = "Skipping voucher for unknown sponsor: %{public}@";
      goto LABEL_7;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    {
      TPModelLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v29 = v5;
        v30 = 2114;
        v31 = v26;
        _os_log_error_impl(&dword_1DE1BE000, v19, OS_LOG_TYPE_ERROR, "DB error for sponsor %{public}@: %{public}@", buf, 0x16u);
      }

      *a3 = 1;
    }
    else
    {
      v20 = objc_msgSend(*(id *)(a1 + 56), "verifyVoucherSignature:", v5);
      TPModelLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((v20 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v5;
          _os_log_impl(&dword_1DE1BE000, v22, OS_LOG_TYPE_INFO, "Inspecting voucher claiming to be from sponsor: %{public}@", buf, 0xCu);
        }

        v23 = *(void **)(a1 + 56);
        objc_msgSend(v5, "beneficiaryID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v23, "considerCandidateID:withSponsorID:sponsorPermanentInfo:toExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:", v24, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96));

      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v5;
          _os_log_impl(&dword_1DE1BE000, v22, OS_LOG_TYPE_DEFAULT, "voucher: voucher has failed signature checking: %{public}@", buf, 0xCu);
        }

      }
    }
  }
LABEL_9:

}

void __42__TPModel_validateVoucherForPeer_sponsor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "beneficiaryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v11, "sponsorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "peerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {

LABEL_6:
    v10 = v11;
    goto LABEL_7;
  }
  v9 = objc_msgSend(*(id *)(a1 + 48), "verifyVoucherSignature:", v11);

  v10 = v11;
  if (v9)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_7:

}

void __29__TPModel_maxClockWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stableInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    objc_msgSend(v13, "stableInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "clock");

    if (v4 <= v6)
      v7 = v6;
    else
      v7 = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  }
  objc_msgSend(v13, "dynamicInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    objc_msgSend(v13, "dynamicInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "clock");

    if (v9 <= v11)
      v12 = v11;
    else
      v12 = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
  }

}

void __36__TPModel_statusOfPeerWithID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "peerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "includedPeerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "dynamicInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "excludedPeerIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    if (v7)
    {
      TPModelLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v37 = 138543362;
        *(_QWORD *)&v37[4] = v4;
        _os_log_impl(&dword_1DE1BE000, v11, OS_LOG_TYPE_DEFAULT, "status: peerID %{public}@ trusts itself", v37, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 0x40uLL;
    }
    if (v10)
    {
      TPModelLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v37 = 138543362;
        *(_QWORD *)&v37[4] = v13;
        _os_log_impl(&dword_1DE1BE000, v12, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ excludes itself", v37, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 4uLL;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(_QWORD *)(v14 + 24) & 0xFFFFFFFFFFFFFFBFLL;
LABEL_31:
      *(_QWORD *)(v14 + 24) = v15;
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (((v10 | v7) & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 0x80uLL;
  objc_msgSend(*(id *)(a1 + 40), "dynamicInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "includedPeerIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v4);

  if (!v18)
    goto LABEL_32;
  if ((v7 & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "validateVoucherForPeer:sponsor:", *(_QWORD *)(a1 + 40), v3) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "validatePeerWithPreApproval:sponsor:", *(_QWORD *)(a1 + 40), v3))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 1uLL;
    TPModelLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v37 = 138543618;
    *(_QWORD *)&v37[4] = v4;
    *(_WORD *)&v37[12] = 2114;
    *(_QWORD *)&v37[14] = v20;
    v21 = "status: peer %{public}@ trusts %{public}@";
    goto LABEL_18;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) &= ~2uLL;
  TPModelLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v36 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v37 = 138543618;
    *(_QWORD *)&v37[4] = v4;
    *(_WORD *)&v37[12] = 2114;
    *(_QWORD *)&v37[14] = v36;
    v21 = "status: peer %{public}@ doesn't trust %{public}@";
LABEL_18:
    _os_log_impl(&dword_1DE1BE000, v19, OS_LOG_TYPE_INFO, v21, v37, 0x16u);
  }
LABEL_19:

  if (v10)
  {
    TPModelLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v37 = 138543618;
      *(_QWORD *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(_QWORD *)&v37[14] = v23;
      _os_log_impl(&dword_1DE1BE000, v22, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ excludes %{public}@", v37, 0x16u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 4uLL;
  }
  objc_msgSend(v3, "permanentInfo", *(_OWORD *)v37, *(_QWORD *)&v37[16], v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "epoch");
  objc_msgSend(*(id *)(a1 + 40), "permanentInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "epoch");

  if (v25 > v27)
  {
    TPModelLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v37 = 138543618;
      *(_QWORD *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(_QWORD *)&v37[14] = v29;
      _os_log_impl(&dword_1DE1BE000, v28, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ outdates %{public}@", v37, 0x16u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 8uLL;
  }
  objc_msgSend(v3, "permanentInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "epoch");
  objc_msgSend(*(id *)(a1 + 40), "permanentInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "epoch") + 1;

  if (v31 > v33)
  {
    TPModelLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v37 = 138543618;
      *(_QWORD *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(_QWORD *)&v37[14] = v35;
      _os_log_impl(&dword_1DE1BE000, v34, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ far outdates %{public}@", v37, 0x16u);
    }

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(_QWORD *)(v14 + 24) | 0x10;
    goto LABEL_31;
  }
LABEL_32:

}

void __57__TPModel_hasPotentiallyTrustedPeerWithSigningKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "permanentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "signingPubKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spki");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToData:", *(_QWORD *)(a1 + 32));

  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);

}

void __50__TPModel_anyTrustedPeerDistrustsOtherPeer_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "dynamicInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "excludedPeerIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v8, "peerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __58__TPModel_hasPotentiallyTrustedPeerPreapprovingKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preapprovals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

}

void __58__TPModel_allTrustedPeersWithCurrentRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stableInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverySigningPublicKey");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  objc_msgSend(v19, "stableInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recoveryEncryptionPublicKey");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  v9 = (void *)v8;
  objc_msgSend(*(id *)(a1 + 32), "recoverySigningPublicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stableInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recoverySigningPublicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToData:", v12))
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "recoveryEncryptionPublicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stableInfo");
  v18 = v3;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recoveryEncryptionPublicKey");
  v16 = a1;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "isEqualToData:", v15);

  v3 = v18;
  if (v17)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v16 + 40) + 8) + 40), "addObject:", v18);
LABEL_9:

}

void __39__TPModel_isRecoveryKeyExcluded_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "excludedPeerIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

}

void __42__TPModel_peerCountsByMachineIDWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "permanentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "machineID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v4, "longValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1EA8C7C40, v7);
  }

}

void __46__TPModel_viablePeerCountsByModelIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "permanentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v6);
}

void __34__TPModel_allMachineIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "permanentInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "machineID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __38__TPModel_allPolicyVersionsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stableInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frozenPolicyVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v13, "stableInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frozenPolicyVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v13, "stableInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flexiblePolicyVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v13, "stableInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "flexiblePolicyVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
}

void __57__TPModel_hasPotentiallyTrustedPeerTestingOnlyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "peerID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "includedPeerIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v7);

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);

}

void __44__TPModel__iterateOverPeersWithBlock_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v3);
  v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(v8, "dynamicInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludedPeerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "unionSet:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v7);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __45__TPModel_enumerateVouchersUsingBlock_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1DF0E9908]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

void __42__TPModel_enumeratePeersUsingBlock_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1DF0E9908]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

+ (id)preapprovalsFromKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", 1, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)pickClock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_96);
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v6 = 1;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "clock");
      if (v8 < objc_msgSend(v5, "clock"))
        break;
      v9 = objc_msgSend(v7, "clock");
      if (v9 == objc_msgSend(v5, "clock"))
      {
        v10 = objc_msgSend(v7, "value");
        if (v10 != objc_msgSend(v5, "value"))
        {
          objc_msgSend(v5, "setValue:", 1);
          break;
        }
      }

      if (++v6 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_10;
    }

  }
LABEL_10:

  return v5;
}

uint64_t __21__TPModel_pickClock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "clock");
  if (v6 <= objc_msgSend(v5, "clock"))
  {
    v8 = objc_msgSend(v4, "clock");
    v7 = v8 != objc_msgSend(v5, "clock");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

@end
