@implementation SearchUIMobileTimerUtilities

+ (void)getEnablementStatusForAlarmWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke;
  v9[3] = &unk_1EA1F6908;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v9);

}

void __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[24];
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)getMTAlarmManagerClass_softClass;
  v20 = getMTAlarmManagerClass_softClass;
  if (!getMTAlarmManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getMTAlarmManagerClass_block_invoke;
    v22 = &unk_1EA1F6930;
    v23 = &v17;
    __getMTAlarmManagerClass_block_invoke((uint64_t)buf);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "alarmWithIDString:", *(_QWORD *)(a1 + 32), v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SearchUIGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = objc_msgSend(v5, "isEnabled");
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v9;
      _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "Resolved enablement state (%d) for alarm of identifier: %@", buf, 0x12u);
    }

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "isEnabled"));
  }
  else
  {
    if (v7)
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "Fetching sleepMode enablement state for alarm of identifier: %@", buf, 0xCu);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8598]), "initWithIdentifier:", CFSTR("com.apple.SearchUI"));
    objc_msgSend(v11, "currentSleepScheduleWithError:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "occurrences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alarmConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v15, "isEnabled"));
    }
    else
    {
      SearchUIGeneralLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke_cold_1(v16);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Unable to query sleepAlarmConfiguration", v1, 2u);
}

@end
