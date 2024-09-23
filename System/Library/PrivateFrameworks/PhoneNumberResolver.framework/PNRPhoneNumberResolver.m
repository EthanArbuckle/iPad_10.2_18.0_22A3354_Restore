@implementation PNRPhoneNumberResolver

id __69__PNRPhoneNumberResolver__recordUsageAnalyticForCountryCode_success___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = &unk_24F4D3EF8;
  v6[0] = CFSTR("Count");
  v6[1] = CFSTR("cc");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 36));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PNRPhoneNumberResolver)init
{
  PNRPhoneNumberResolver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *resolveQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PNRPhoneNumberResolver;
  v2 = -[PNRPhoneNumberResolver init](&v7, sel_init);
  if (v2)
  {
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.PhoneNumberResolver.resolve", v3);
    resolveQueue = v2->_resolveQueue;
    v2->_resolveQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v41 = v9;
      v42 = 2114;
      v43 = v7;
      _os_log_impl(&dword_22AC59000, v8, OS_LOG_TYPE_INFO, "[%{public}@] couldn't determine cc (%{public}@)", buf, 0x16u);
    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = CFSTR("1000");

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = v7;
    v14 = *(id *)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    v15 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      v41 = v16;
      v42 = 2114;
      v43 = v6;
      v44 = 2113;
      v45 = v17;
      _os_log_impl(&dword_22AC59000, v15, OS_LOG_TYPE_INFO, "[%{public}@] determined cc %{public}@ for %{private}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", objc_msgSend(v6, "length"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543619;
      v41 = v20;
      v42 = 2113;
      v43 = v18;
      _os_log_impl(&dword_22AC59000, v19, OS_LOG_TYPE_INFO, "[%{public}@] now resolving %{private}@", buf, 0x16u);
    }
    v22 = *(void **)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 56);
    v23 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_63;
    v30[3] = &unk_24F4D2880;
    v36 = *(_QWORD *)(a1 + 80);
    v31 = v23;
    v32 = v18;
    v24 = v6;
    v25 = *(_QWORD *)(a1 + 72);
    v33 = v24;
    v37 = v25;
    v26 = *(id *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 88);
    v34 = v26;
    v38 = v27;
    v28 = *(id *)(a1 + 40);
    v29 = *(_QWORD *)(a1 + 96);
    v35 = v28;
    v39 = v29;
    v14 = v18;
    objc_msgSend(v22, "lookupStringForPhoneNumber:inCC:countryCodeOfDevice:logId:withResult:", v14, v24, v21, v31, v30);

  }
}

- (id)resolvePhoneNumber:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v11 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_22AC59000, v11, OS_LOG_TYPE_INFO, "[%{public}@] resolving %{private}@ synchronously", buf, 0x16u);
  }
  +[PNRUtils _stringByStrippingFormattingAndNotVisiblyAllowable:](PNRUtils, "_stringByStrippingFormattingAndNotVisiblyAllowable:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[PNRUtils _isValidPhoneNumber:](PNRUtils, "_isValidPhoneNumber:", v12))
  {
    -[PNRPhoneNumberResolver _notAPhoneNumberError](self, "_notAPhoneNumberError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    if (a5)
      goto LABEL_11;
    goto LABEL_12;
  }
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("+")) & 1) == 0)
  {
    -[PNRPhoneNumberResolver _notFullyQualifiedError](self, "_notFullyQualifiedError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    if (a5)
    {
LABEL_11:
      v13 = objc_retainAutorelease(v15);
      v14 = 0;
      *a5 = v13;
      goto LABEL_13;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v12, "substringFromIndex:", 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__PNRPhoneNumberResolver_resolvePhoneNumber_countryCode_error___block_invoke;
  v17[3] = &unk_24F4D2808;
  v17[4] = buf;
  v17[5] = &v18;
  -[PNRPhoneNumberResolver resolveFullyQualifiedPhoneNumber:inCountry:logId:resultBlock:](self, "resolveFullyQualifiedPhoneNumber:inCountry:logId:resultBlock:", v13, v9, v10, v17);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v14;
}

- (void)resolveFullyQualifiedPhoneNumber:(id)a3 inCountry:(id)a4 logId:(id)a5 resultBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t, void *))a6;
  +[PNRResourceManager sharedManager](PNRResourceManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke;
  v26 = &unk_24F4D28A8;
  v15 = v12;
  v27 = v15;
  v31 = &v46;
  v32 = &v40;
  v16 = v10;
  v28 = v16;
  v17 = v14;
  v29 = v17;
  v18 = v11;
  v30 = v18;
  v33 = &v52;
  v34 = &v36;
  v35 = &v56;
  objc_msgSend(v17, "lookupCCForPhoneNumber:logId:withResult:", v16, v15, &v23);
  if (v57[5])
  {
    v19 = 0;
  }
  else
  {
    v20 = v41[5];
    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v62 = *MEMORY[0x24BDD1398];
      v63[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PNRError"), 1, v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
  }
  -[PNRPhoneNumberResolver _recordUsageAnalyticForCountryCode:success:](self, "_recordUsageAnalyticForCountryCode:success:", v47[5], *((unsigned __int8 *)v37 + 24), v13, v23, v24, v25, v26);
  v13[2](v13, v57[5], v53[3], v19);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

}

void __63__PNRPhoneNumberResolver_resolvePhoneNumber_countryCode_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

- (void)_recordUsageAnalyticForCountryCode:(id)a3 success:(BOOL)a4
{
  objc_msgSend(a3, "intValue");
  AnalyticsSendEventLazy();
}

void __30__PNRPhoneNumberResolver_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PhoneNumberResolver", "Resolver");
  v1 = (void *)_log;
  _log = (uint64_t)v0;

}

- (id)_notAPhoneNumberError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("not a phone number");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PNRError"), 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNRPhoneNumberResolver _recordUsageAnalyticForCountryCode:success:](self, "_recordUsageAnalyticForCountryCode:success:", CFSTR("10"), 0);
  return v5;
}

- (id)_notFullyQualifiedError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("not fully qualified");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PNRError"), 3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNRPhoneNumberResolver _recordUsageAnalyticForCountryCode:success:](self, "_recordUsageAnalyticForCountryCode:success:", CFSTR("100"), 0);
  return v5;
}

- (void)resolvePhoneNumbers:(id)a3 handler:(id)a4 queue:(id)a5
{
  -[PNRPhoneNumberResolver resolvePhoneNumbers:queue:handler:](self, "resolvePhoneNumbers:queue:handler:", a3, a5, a4);
}

- (void)resolvePhoneNumbers:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *resolveQueue;
  id v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  PNRPhoneNumberResolutionResultSet *v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *group;
  id obj;
  uint64_t v34;
  PNRPhoneNumberResolutionResultSet *v35;
  void *v36;
  _QWORD v37[4];
  PNRPhoneNumberResolutionResultSet *v38;
  id v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  PNRPhoneNumberResolutionResultSet *v44;
  id v45;
  NSObject *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v31 = a4;
  v30 = a5;
  v35 = objc_alloc_init(PNRPhoneNumberResolutionResultSet);
  +[PNRUtils _currentCountry](PNRUtils, "_currentCountry");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v9)
  {
    v10 = v9;
    v34 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v13 = objc_alloc_init(MEMORY[0x24BDD1880]);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kGEOPhoneNumberKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kGEOPhoneNumberCountryKey"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = v36;
        if (v15)
          v17 = (void *)v15;
        v18 = v17;

        v19 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543619;
          v52 = v13;
          v53 = 2113;
          v54 = v14;
          _os_log_impl(&dword_22AC59000, v19, OS_LOG_TYPE_INFO, "[%{public}@] resolving %{private}@ asynchronously", buf, 0x16u);
        }
        +[PNRUtils _stringByStrippingFormattingAndNotVisiblyAllowable:](PNRUtils, "_stringByStrippingFormattingAndNotVisiblyAllowable:", v14, v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!+[PNRUtils _isValidPhoneNumber:](PNRUtils, "_isValidPhoneNumber:", v20))
        {
          -[PNRPhoneNumberResolver _notAPhoneNumberError](self, "_notAPhoneNumberError");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          -[PNRPhoneNumberResolutionResultSet setError:forPhoneNumber:](v35, "setError:forPhoneNumber:", v23, v14);
          v24 = _log;
          if (!os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          *(_DWORD *)buf = 138543619;
          v52 = v13;
          v53 = 2113;
          v54 = v14;
          v25 = v24;
          v26 = "[%{public}@] '%{private}@' is not a valid phone number";
          goto LABEL_17;
        }
        if ((objc_msgSend(v20, "hasPrefix:", CFSTR("+")) & 1) != 0)
        {
          objc_msgSend(v20, "substringFromIndex:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(group);
          resolveQueue = self->_resolveQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke;
          block[3] = &unk_24F4D27B8;
          block[4] = self;
          v41 = v21;
          v42 = v18;
          v43 = v13;
          v44 = v35;
          v45 = v14;
          v46 = group;
          v23 = v21;
          dispatch_async(resolveQueue, block);

          goto LABEL_18;
        }
        -[PNRPhoneNumberResolver _notFullyQualifiedError](self, "_notFullyQualifiedError");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[PNRPhoneNumberResolutionResultSet setError:forPhoneNumber:](v35, "setError:forPhoneNumber:", v23, v14);
        v27 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543619;
          v52 = v13;
          v53 = 2113;
          v54 = v14;
          v25 = v27;
          v26 = "[%{public}@] '%{private}@' is not a fully qualified phone number";
LABEL_17:
          _os_log_impl(&dword_22AC59000, v25, OS_LOG_TYPE_INFO, v26, buf, 0x16u);
        }
LABEL_18:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v10);
  }

  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_59;
  v37[3] = &unk_24F4D27E0;
  v38 = v35;
  v39 = v30;
  v28 = v35;
  v29 = v30;
  dispatch_group_notify(group, v31, v37);

}

void __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_2;
  v6[3] = &unk_24F4D2790;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 80);
  objc_msgSend(v2, "resolveFullyQualifiedPhoneNumber:inCountry:logId:resultBlock:", v3, v4, v5, v6);

}

void __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResult:resultDataSource:forPhoneNumber:", v7, a3, *(_QWORD *)(a1 + 40));
    v10 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v20 = 138544131;
      v21 = v11;
      v22 = 2113;
      v23 = v12;
      v24 = 2113;
      v25 = v13;
      v26 = 2113;
      v27 = v7;
      v14 = "[%{public}@] result for '%{private}@/%{private}@' is '%{private}@'";
LABEL_8:
      _os_log_impl(&dword_22AC59000, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    if (!v8)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0BA0];
      v29[0] = CFSTR("no result");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PNRError"), 1, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "setError:forPhoneNumber:", v9, *(_QWORD *)(a1 + 40));
    v10 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      v20 = 138544131;
      v21 = v17;
      v22 = 2113;
      v23 = v18;
      v24 = 2113;
      v25 = v19;
      v26 = 2114;
      v27 = v9;
      v14 = "[%{public}@] no result found for '%{private}@'/'%{private}@' (%{public}@)";
      goto LABEL_8;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

uint64_t __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_63(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t (*v7)(uint64_t, uint64_t);
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  id *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    v10 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543619;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_22AC59000, v10, OS_LOG_TYPE_INFO, "[%{public}@] found result in db for phNo %{private}@", buf, 0x16u);
    }
LABEL_16:
    v27 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543875;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2113;
      v52 = v7;
      _os_log_impl(&dword_22AC59000, v27, OS_LOG_TYPE_INFO, "[%{public}@] resolved %{private}@ to %{private}@", buf, 0x20u);
    }
    goto LABEL_21;
  }
  if (v8)
  {
    v13 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 48);
      *(_DWORD *)buf = 138544131;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2113;
      v52 = v16;
      LOWORD(v53) = 2114;
      *(_QWORD *)((char *)&v53 + 2) = v9;
      _os_log_impl(&dword_22AC59000, v13, OS_LOG_TYPE_INFO, "[%{public}@] lookup of %{private}@ in %{private}@ ended in error (%{public}@)", buf, 0x2Au);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
  }
  v17 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_22AC59000, v17, OS_LOG_TYPE_INFO, "[%{public}@] using only cc of %{public}@ for resolution", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  *(_QWORD *)&v53 = __Block_byref_object_dispose_;
  *((_QWORD *)&v53 + 1) = 0;
  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("1")))
  {
    v20 = *(void **)(a1 + 56);
    v21 = *(void **)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = MEMORY[0x24BDAC760];
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_66;
    v48[3] = &unk_24F4D2830;
    v50[1] = *(_QWORD *)(a1 + 80);
    v49 = v21;
    v50[0] = *(id *)(a1 + 40);
    v50[2] = buf;
    v50[3] = *(_QWORD *)(a1 + 72);
    objc_msgSend(v20, "lookupISOCountryCodeFromNANPNumber:logId:withResult:", v22, v49, v48);
    v24 = &v49;
    v25 = (id *)v50;
  }
  else
  {
    v26 = *(_QWORD *)(a1 + 48);
    v23 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_68;
    v45[3] = &unk_24F4D2830;
    v47[1] = *(_QWORD *)(a1 + 80);
    v46 = *(id *)(a1 + 32);
    v47[0] = *(id *)(a1 + 40);
    v47[2] = buf;
    v47[3] = *(_QWORD *)(a1 + 72);
    +[PNRUtils _countryCodeFromInternationalCode:result:](PNRUtils, "_countryCodeFromInternationalCode:result:", v26, v45);
    v24 = &v46;
    v25 = (id *)v47;
  }

  v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
  if (v7)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    v44 = 0;
    v34[0] = v23;
    v34[1] = 3221225472;
    v34[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_69;
    v34[3] = &unk_24F4D2858;
    v36 = *(_QWORD *)(a1 + 80);
    v35 = *(id *)(a1 + 32);
    v37 = buf;
    v38 = &v39;
    +[PNRUtils _localizedCountryNameForISOCountryCode:result:](PNRUtils, "_localizedCountryNameForISOCountryCode:result:", v7, v34);
    v7 = (uint64_t (*)(uint64_t, uint64_t))(id)v40[5];

    _Block_object_dispose(&v39, 8);
  }
  _Block_object_dispose(buf, 8);

  if (v7)
    goto LABEL_16;
  v30 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
    __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_63_cold_1((_QWORD *)a1, v30);
  v7 = 0;
LABEL_21:
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v7;
  v33 = v7;

}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_66(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    if (*(_QWORD *)(v9 + 40))
    {
      v10 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "code");
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v19 = *MEMORY[0x24BDD1398];
      v20[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, v12, v14);
      v16 = *(_QWORD *)(a1[6] + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    else
    {
      v18 = v7;
      v11 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v18;
    }

    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_66_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = 2;
  }

}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_68(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    if (*(_QWORD *)(v9 + 40))
    {
      v10 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "code");
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v19 = *MEMORY[0x24BDD1398];
      v20[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, v12, v14);
      v16 = *(_QWORD *)(a1[6] + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    else
    {
      v18 = v7;
      v11 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v18;
    }

    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_68_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = 3;
  }

}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(v9 + 40))
    {
      v10 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "code");
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v20 = *MEMORY[0x24BDD1398];
      v21[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, v12, v14);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    else
    {
      v18 = v7;
      v11 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v18;
    }

    v19 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_69_cold_1(a1, (uint64_t)v8, v19);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveQueue, 0);
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_63_cold_1(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = a1[8];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
  v5 = 138543875;
  v6 = v2;
  v7 = 2113;
  v8 = v3;
  v9 = 2114;
  v10 = v4;
  _os_log_error_impl(&dword_22AC59000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] didn't resolved %{private}@ : %{public}@", (uint8_t *)&v5, 0x20u);
  OUTLINED_FUNCTION_2_0();
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_66_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC59000, v0, v1, "[%{public}@] country lookup failure for NANP number %{private}@ (%{public}@)");
  OUTLINED_FUNCTION_2_0();
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_68_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC59000, v0, v1, "[%{public}@] country lookup failure for non-NANP number %{private}@ (%{public}@)");
  OUTLINED_FUNCTION_2_0();
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_69_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543874;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_0_0(&dword_22AC59000, a2, a3, "[%{public}@] localized country name lookup failure for country code %{public}@ (%{public}@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
  OUTLINED_FUNCTION_2_0();
}

@end
