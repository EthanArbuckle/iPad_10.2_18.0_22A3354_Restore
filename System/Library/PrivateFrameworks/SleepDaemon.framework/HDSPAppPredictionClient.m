@implementation HDSPAppPredictionClient

- (HDSPAppPredictionClient)initWithSleepFocusModeBridge:(id)a3
{
  id v5;
  HDSPAppPredictionClient *v6;
  HDSPAppPredictionClient *v7;
  HDSPAppPredictionClient *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPAppPredictionClient;
  v6 = -[HDSPAppPredictionClient init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sleepFocusModeBridge, a3);
    v8 = v7;
  }

  return v7;
}

- (void)createSuggestedHomeScreenPageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = (id)objc_opt_class();
    v6 = v14;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating suggested home screen page", buf, 0xCu);

  }
  v7 = objc_alloc_init(MEMORY[0x24BE041F8]);
  objc_msgSend(v7, "setPageType:", 4);
  v8 = objc_alloc_init(MEMORY[0x24BE04200]);
  v9 = objc_alloc_init(MEMORY[0x24BE041F0]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__HDSPAppPredictionClient_createSuggestedHomeScreenPageWithCompletion___block_invoke;
  v11[3] = &unk_24D4E5D88;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "suggestedPagesWithFilter:layoutOptions:completionHandler:", v7, v8, v11);

}

void __71__HDSPAppPredictionClient_createSuggestedHomeScreenPageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!objc_msgSend(v5, "count"))
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = (id)objc_opt_class();
        v12 = v34;
        _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] no suggested pages found", buf, 0xCu);

      }
      goto LABEL_4;
    }
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v31 = 0;
    objc_msgSend(v8, "sleepFocusConfiguration:", &v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;
    if (v10)
    {
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v34 = v29;
        v35 = 2114;
        v36 = (uint64_t)v10;
        v30 = v29;
        _os_log_error_impl(&dword_21610C000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get sleep focus mode: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v13)
        {
          v14 = (void *)objc_opt_class();
          v15 = v14;
          v16 = objc_msgSend(v5, "count");
          *(_DWORD *)buf = 138543618;
          v34 = v14;
          v35 = 2048;
          v36 = v16;
          _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] found %ld pages, creating home screen request", buf, 0x16u);

        }
        v17 = objc_alloc(MEMORY[0x24BEB0A58]);
        objc_msgSend(v9, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v17, "initWithFocusModeIdentifier:", v19);

        objc_msgSend(v5, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setProactivePages:", v22);

        objc_msgSend(v20, "setAppendExistingPages:", 1);
        objc_msgSend(MEMORY[0x24BEB0A60], "addSuggestedHomeScreenPageWithRequest:", v20);
        HKSPLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v34 = v24;
          v25 = v24;
          _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] submitted home screen request", buf, 0xCu);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_19;
      }
      if (v13)
      {
        v27 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v34 = v27;
        v28 = v27;
        _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] no sleep focus mode found", buf, 0xCu);

      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v34 = (id)objc_opt_class();
    v35 = 2114;
    v36 = (uint64_t)v6;
    v26 = v34;
    _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get suggested pages: %{public}@", buf, 0x16u);

  }
LABEL_4:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_20:

}

- (HKSPSleepFocusModeBridge)sleepFocusModeBridge
{
  return self->_sleepFocusModeBridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepFocusModeBridge, 0);
}

@end
