@implementation TPSHKFeatureStatusValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id))a3;
  -[TPSTargetingValidation value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "TPSSafeIntegerForKey:", CFSTR("featureIdentifier"));

  -[TPSTargetingValidation value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "TPSSafeIntegerForKey:", CFSTR("statusType"));

  +[TPSHealthKitDefines identifierForFeature:](TPSHealthKitDefines, "identifierForFeature:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSHealthKitDefines featureAvailabilityContextForStatusType:](TPSHealthKitDefines, "featureAvailabilityContextForStatusType:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v30)
  {
    +[TPSHealthKitDefines sharedHealthStore](TPSHealthKitDefines, "sharedHealthStore");
    v10 = objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v11 = (void *)getHKFeatureStatusManagerClass_softClass;
    v35 = getHKFeatureStatusManagerClass_softClass;
    if (!getHKFeatureStatusManagerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getHKFeatureStatusManagerClass_block_invoke;
      *(_QWORD *)&v37 = &unk_1EA1DF510;
      *((_QWORD *)&v37 + 1) = &v32;
      __getHKFeatureStatusManagerClass_block_invoke((uint64_t)buf);
      v11 = (void *)v33[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v32, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "initWithFeatureIdentifier:healthStore:countryCodeSource:", v9, v10, 1);
    v31 = 0;
    objc_msgSend(v13, "featureStatusWithError:", &v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v31;
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "areAllRequirementsSatisfied");

      -[TPSTargetingValidation value](self, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "TPSSafeBoolForKey:", CFSTR("value"));

      v20 = v17 ^ v19 ^ 1u;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[TPSTargetingValidation name](self, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&v37 = v15;
        _os_log_error_impl(&dword_1DAC2F000, v21, OS_LOG_TYPE_ERROR, "%@ - unable to query feature status (%@). Error: %@", buf, 0x20u);

      }
      v20 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting", v30);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[TPSTargetingValidation name](self, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&v37 = v27;
      _os_log_error_impl(&dword_1DAC2F000, v10, OS_LOG_TYPE_ERROR, "%@ - unrecognized feature (%@) or statusType (%@)", buf, 0x20u);

    }
    v15 = 0;
    v20 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[TPSTargetingValidation name](self, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSTargetingValidation targetContext](self, "targetContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = v20;
    WORD2(v37) = 2112;
    *(_QWORD *)((char *)&v37 + 6) = v15;
    _os_log_debug_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", buf, 0x26u);

  }
  v4[2](v4, v20, v15);

}

@end
