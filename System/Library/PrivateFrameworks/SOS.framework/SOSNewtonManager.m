@implementation SOSNewtonManager

+ (void)newtonEligibilityWithCompletion:(id)a3
{
  objc_msgSend(a1, "newtonEligibilityWithHealthStore:completion:", 0, a3);
}

+ (void)newtonEligibilityWithHealthStore:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "newtonEligibilityWithHealthStore:deviceSupportsWorkoutsOnly:completion:", v7, +[SOSUtilities activeDeviceSupportsNewtonWorkoutsOnly](SOSUtilities, "activeDeviceSupportsNewtonWorkoutsOnly"), v6);

}

+ (void)newtonEligibilityWithHealthStore:(id)a3 deviceSupportsWorkoutsOnly:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD, _QWORD);
  id v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = v9;
  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB6780]);
    objc_msgSend(v10, "setDebugIdentifier:", CFSTR("com.apple.sos"));
    objc_msgSend(v10, "resume");
  }
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke;
  v24[3] = &unk_1E5F76DF0;
  v26 = a4;
  v12 = v8;
  v25 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF84EC](v24);
  v23 = 0;
  objc_msgSend(v10, "dateOfBirthComponentsWithError:", &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;
  v16 = v15;
  if (!v14 || v15)
  {
    sos_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "Could not retrieve age from Health record; error: %@. Querying medical ID.",
        buf,
        0xCu);
    }

    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke_191;
    v21[3] = &unk_1E5F76E18;
    v22 = v13;
    objc_msgSend(v10, "fetchMedicalIDDataWithCompletion:", v21);
    v18 = v22;
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0C99D48]);
    v18 = (void *)objc_msgSend(v17, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v18, "dateFromComponents:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v19);

  }
}

void __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D48]);
    v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:toDate:options:", 28, v3, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "year") >= 18)
    {
      if (objc_msgSend(v7, "year") <= 54)
      {
        if (*(_BYTE *)(a1 + 40))
        {
          if (objc_msgSend(v7, "year") <= 17)
            v8 = 1;
          else
            v8 = 4;
        }
        else
        {
          v8 = 1;
        }
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 2;
    }

  }
  else
  {
    v8 = 1;
  }
  sos_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v8;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "Newton Eligibility based on age: %lu", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "gmtBirthdate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

+ (void)checkEligibilityForAutoEnableWithCompletion:(id)a3
{
  objc_msgSend(a1, "checkEligibilityForAutoEnableWithHealthStore:completion:", 0, a3);
}

+ (void)checkEligibilityForAutoEnableWithHealthStore:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SOSNewtonManager_checkEligibilityForAutoEnableWithHealthStore_completion___block_invoke;
  v8[3] = &unk_1E5F76E40;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "newtonEligibilityWithHealthStore:completion:", a3, v8);

}

uint64_t __76__SOSNewtonManager_checkEligibilityForAutoEnableWithHealthStore_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

@end
