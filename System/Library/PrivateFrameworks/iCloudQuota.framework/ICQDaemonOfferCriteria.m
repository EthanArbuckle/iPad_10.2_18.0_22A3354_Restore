@implementation ICQDaemonOfferCriteria

- (BOOL)isSatisfiedByConditions:(id)a3
{
  id v4;
  NSDictionary *serverDict;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  objc_opt_class();
  objc_opt_isKindOfClass();
  serverDict = self->_serverDict;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ICQDaemonOfferCriteria_isSatisfiedByConditions___block_invoke;
  v8[3] = &unk_1E8B39FF8;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](serverDict, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(serverDict) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serverDict;
}

void __50__ICQDaemonOfferCriteria_isSatisfiedByConditions___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  int v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  const __CFString *v23;
  int v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v9 + 24))
  {
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }
  v10 = *(id *)(a1 + 32);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("deviceStorageAlmostFull")))
  {
    v11 = objc_msgSend(v10, "isDeviceStorageAlmostFull");
    goto LABEL_7;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("iCPLEnabled")))
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("optimizeEnabled")) & 1) != 0)
    {
      if (_ICQDoesCriterionValueEqualBOOL(v8, objc_msgSend(v10, "isPhotosOptimizeEnabled")))
        goto LABEL_8;
      goto LABEL_13;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("minPhotoLibraryInBytes")) & 1) == 0
      && !objc_msgSend(v7, "isEqualToString:", CFSTR("maxPhotoLibraryInBytes")))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("backupRestoreComplete")))
      {
        LOBYTE(v12) = _ICQDoesCriterionValueEqualBOOL(v8, objc_msgSend(v10, "isBackupRestoreComplete"));
        goto LABEL_18;
      }
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412290;
        v25 = v7;
        v13 = "unexpected criterion key %@";
        v14 = v12;
        v15 = 12;
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v24 = 138412546;
      v25 = v7;
      v26 = 2112;
      v27 = (uint64_t)v8;
      v13 = "criterion: %@: %@ not convertible to long long";
      goto LABEL_15;
    }
    objc_msgSend(v10, "photosLibrarySize");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      LOWORD(v24) = 0;
      v13 = "criterion: photos library size unknown";
      v14 = v12;
      v15 = 2;
      goto LABEL_16;
    }
    v18 = objc_msgSend(v8, "longLongValue");
    objc_msgSend(v10, "photosLibrarySize");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "longLongValue");

    LODWORD(v19) = objc_msgSend(v7, "isEqualToString:", CFSTR("minPhotoLibraryInBytes"));
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v19)
    {
      LOBYTE(v12) = v20 >= v18;
      if (v22)
      {
        v23 = CFSTR("<");
        v24 = 138544130;
        v25 = v7;
        if (v20 >= v18)
          v23 = CFSTR(">=");
LABEL_42:
        v26 = 2048;
        v27 = v20;
        v28 = 2114;
        v29 = v23;
        v30 = 2048;
        v31 = v18;
        _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "criterion: %{public}@: %lld %{public}@ %lld", (uint8_t *)&v24, 0x2Au);
      }
    }
    else
    {
      LODWORD(v12) = v20 <= v18;
      if (v22)
      {
        v23 = CFSTR(">");
        v24 = 138544130;
        v25 = v7;
        if (v20 <= v18)
          v23 = CFSTR("<=");
        goto LABEL_42;
      }
    }

    goto LABEL_18;
  }
  v11 = objc_msgSend(v10, "isPhotosCloudEnabled");
LABEL_7:
  if ((_ICQDoesCriterionValueEqualBOOL(v8, v11) & 1) != 0)
  {
LABEL_8:
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138543618;
      v25 = v7;
      v26 = 2114;
      v27 = (uint64_t)v8;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "criterion: %{public}@ matches %{public}@", (uint8_t *)&v24, 0x16u);
    }

    LOBYTE(v12) = 1;
    goto LABEL_18;
  }
LABEL_13:
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138543618;
    v25 = v7;
    v26 = 2114;
    v27 = (uint64_t)v8;
    v13 = "criterion: %{public}@ doesn't match %{public}@";
LABEL_15:
    v14 = v12;
    v15 = 22;
LABEL_16:
    _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, v15);
  }
LABEL_17:

  LOBYTE(v12) = 0;
LABEL_18:

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_19:
  *(_BYTE *)(v9 + 24) = (_BYTE)v12;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

- (ICQDaemonOfferCriteria)initWithServerDictionary:(id)a3
{
  id v4;
  ICQDaemonOfferCriteria *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  objc_class *v9;
  void *v10;
  NSDictionary *serverDict;
  objc_super v13;
  const __CFString *v14;
  const __CFString *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQDaemonOfferCriteria;
  v5 = -[ICQDaemonOfferCriteria init](&v13, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (!v4)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "criteria: missing, substituting empty criteria (always succeeds)", buf, 2u);
        }

        serverDict = v5->_serverDict;
        v5->_serverDict = (NSDictionary *)MEMORY[0x1E0C9AA70];
        goto LABEL_9;
      }
      if (v8)
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "criteria: expected NSDictionary, got %@", buf, 0xCu);

      }
      v14 = CFSTR("fail");
      v15 = &stru_1E8B3C468;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    serverDict = v5->_serverDict;
    v5->_serverDict = (NSDictionary *)v6;
LABEL_9:

  }
  return v5;
}

- (NSDictionary)serverDictionary
{
  return self->_serverDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDict, 0);
}

@end
