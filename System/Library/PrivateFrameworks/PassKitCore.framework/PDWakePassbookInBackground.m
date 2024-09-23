@implementation PDWakePassbookInBackground

void __PDWakePassbookInBackground_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_234);
  if (qword_1ECF225A8)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1ECF225A8);
    v0 = (void *)qword_1ECF225A8;
    qword_1ECF225A8 = 0;

  }
  v1 = (void *)qword_1ECF225A0;
  if (qword_1ECF225A0)
  {
    v2 = (id)qword_1ECF225A0;
    v3 = (void *)qword_1ECF225A0;
    qword_1ECF225A0 = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_234);
  if (+[PKWalletVisibility isWalletVisible](PKWalletVisibility, "isWalletVisible"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = *MEMORY[0x1E0D22BB0];
    v13[0] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D22CF0]);

    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PDWakePassbookInBackground: performing background fetch...", buf, 2u);
    }

    SBSCreateOpenApplicationService();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __PDWakePassbookInBackground_block_invoke_20;
    v9[3] = &unk_1E2ACF0C0;
    v10 = v1;
    objc_msgSend(v7, "openApplication:withOptions:completion:", CFSTR("com.apple.Passbook"), v8, v9);

  }
}

void __PDWakePassbookInBackground_block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PDWakePassbookInBackground: -[FBSOpenApplicationService openApplication] returned error %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

@end
