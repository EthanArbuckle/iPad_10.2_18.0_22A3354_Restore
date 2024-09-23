@implementation SAEDFollowUpManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SAEDFollowUpManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EDBF0BC8 != -1)
    dispatch_once(&qword_1EDBF0BC8, block);
  return (id)_MergedGlobals;
}

void __37__SAEDFollowUpManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)v0;

}

- (SAEDFollowUpManager)init
{
  SAEDFollowUpManager *v2;
  SAEDFollowUpManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *evaluationQueue;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SAEDFollowUpManager;
  v2 = -[SAEDFollowUpManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[SAEDFollowUpManager _isIgneousEnabled](v2, "_isIgneousEnabled"))
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create("com.apple.SAEDFollowUpManager", v4);
      evaluationQueue = v3->_evaluationQueue;
      v3->_evaluationQueue = (OS_dispatch_queue *)v5;

    }
    else
    {
      v7 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        _os_log_impl(&dword_1CA099000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,init,!isIgneousEnabled\"}", buf, 0x12u);
      }
    }
    -[SAEDFollowUpManager userDefaults](v3, "userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("saEnabledStateDefaultsWrite"));

  }
  return v3;
}

- (void)start
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_1CA099000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,start\"}", (uint8_t *)v4, 0x12u);
  }
  if (-[SAEDFollowUpManager _isIgneousEnabled](self, "_isIgneousEnabled"))
  {
    -[SAEDFollowUpManager _addNotificationObservers](self, "_addNotificationObservers");
    -[SAEDFollowUpManager _evaluateFollowUpStateAsync](self, "_evaluateFollowUpStateAsync");
  }
}

- (void)setSAEWEnabledState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = v3;
    _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,setSAEWEnabledState\", \"state\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SAEDFollowUpManager _removeNotificationObservers](self, "_removeNotificationObservers");
  v3.receiver = self;
  v3.super_class = (Class)SAEDFollowUpManager;
  -[SAEDFollowUpManager dealloc](&v3, sel_dealloc);
}

- (BOOL)_isIgneousEnabled
{
  return !*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9)
      || -[SAEDFollowUpManager BOOLOverrideForDefaultsKey:defaultValue:](self, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.isIgneousEnabled"), 1);
}

- (void)_evaluateFollowUpStateAsync
{
  NSObject *evaluationQueue;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[SAEDFollowUpManager _isIgneousEnabled](self, "_isIgneousEnabled"))
  {
    evaluationQueue = self->_evaluationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SAEDFollowUpManager__evaluateFollowUpStateAsync__block_invoke;
    block[3] = &unk_1E83DB660;
    block[4] = self;
    dispatch_async(evaluationQueue, block);
  }
  else
  {
    v4 = SALogObjectWarning;
    if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState with !isIgneousEnabled\"}", buf, 0x12u);
    }
  }
}

void __50__SAEDFollowUpManager__evaluateFollowUpStateAsync__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1CAA49B38]();
  objc_msgSend(*(id *)(a1 + 32), "_evaluateFollowUpState_LOCKED");
  objc_autoreleasePoolPop(v2);
}

- (void)_evaluateFollowUpState_LOCKED
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_evaluationQueue);
  v3 = -[SAEDFollowUpManager followUpState](self, "followUpState");
  if ((unint64_t)v3 >= 0x64)
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2050;
      v30 = v3;
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,followUpState >= SAFollowUpStateRetracted\", \"followUpState\":%{public}lu}", buf, 0x1Cu);
    }
    v36[0] = CFSTR("NOP");
    v35[0] = CFSTR("action");
    v35[1] = CFSTR("startingFollowUpState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v5;
    v35[2] = CFSTR("ctSuppressEDFollowUpReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager ctSuppressEDFollowUpReason](self, "ctSuppressEDFollowUpReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v6;
    v35[3] = CFSTR("saSuppressEDFollowUpReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager saSuppressEDFollowUpReason](self, "saSuppressEDFollowUpReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v8;
    AnalyticsSendEventLazy();
    -[SAEDFollowUpManager _retractFollowUp](self, "_retractFollowUp");
    -[SAEDFollowUpManager _removeNotificationObservers](self, "_removeNotificationObservers");

    return;
  }
  v9 = -[SAEDFollowUpManager _ctSuppressEDFollowUpReason](self, "_ctSuppressEDFollowUpReason");
  v10 = -[SAEDFollowUpManager _shouldPostFollowUpForCTReason:](self, "_shouldPostFollowUpForCTReason:", v9);
  v11 = -[SAEDFollowUpManager _saSuppressEDFollowUpReason](self, "_saSuppressEDFollowUpReason");
  v12 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2050;
    v30 = v3;
    v31 = 2050;
    v32 = v9;
    v33 = 2050;
    v34 = v11;
    _os_log_impl(&dword_1CA099000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED\", \"followUpState\":%{public}lu, \"ctSuppressEDFollowUpReason\":%{public}lu, \"saSuppressEDFollowUpReason\":%{public}lu}", buf, 0x30u);
  }
  v22 = MEMORY[0x1E0C809B0];
  v23 = v11;
  AnalyticsSendEventLazy();
  if (v3 <= 48)
  {
    if (v3 && v3 != 10)
    {
LABEL_16:
      v14 = SALogObjectWarning;
      if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2050;
        v30 = v3;
        _os_log_impl(&dword_1CA099000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,unexpected followUpState\", \"followUpState\":%{public}lu}", buf, 0x1Cu);
      }
    }
  }
  else if (v3 != 49)
  {
    if (v3 == 50)
    {
      v18 = !v10 | -[SAEDFollowUpManager _shouldRetractFollowUpForSAReason:](self, "_shouldRetractFollowUpForSAReason:", v11, v22, 3221225472, __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_34, &__block_descriptor_56_e19___NSDictionary_8__0l, 50, v9, v11);
      v19 = SALogObjectGeneral;
      v20 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      if (v18 == 1)
      {
        if (v20)
        {
          *(_DWORD *)buf = 68289026;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          _os_log_impl(&dword_1CA099000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,posted,retracting FollowUp\"}", buf, 0x12u);
        }
        -[SAEDFollowUpManager setCtSuppressEDFollowUpReason:](self, "setCtSuppressEDFollowUpReason:", v9);
        -[SAEDFollowUpManager setSaSuppressEDFollowUpReason:](self, "setSaSuppressEDFollowUpReason:", v11);
        -[SAEDFollowUpManager _retractFollowUp](self, "_retractFollowUp");
        -[SAEDFollowUpManager _removeNotificationObservers](self, "_removeNotificationObservers");
      }
      else
      {
        if (v20)
        {
          *(_DWORD *)buf = 68289026;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          _os_log_impl(&dword_1CA099000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,posted,leaving posted\"}", buf, 0x12u);
        }
        -[SAEDFollowUpManager setCtSuppressEDFollowUpReason:](self, "setCtSuppressEDFollowUpReason:", v9);
        -[SAEDFollowUpManager setSaSuppressEDFollowUpReason:](self, "setSaSuppressEDFollowUpReason:", v11);
      }
      return;
    }
    if (v3 == 99)
    {
      v13 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        _os_log_impl(&dword_1CA099000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,retractingFailed,retracting FollowUp\"}", buf, 0x12u);
      }
      -[SAEDFollowUpManager _retractFollowUp](self, "_retractFollowUp", v22, 3221225472, __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_34, &__block_descriptor_56_e19___NSDictionary_8__0l, v3, v9, v23);
      -[SAEDFollowUpManager _removeNotificationObservers](self, "_removeNotificationObservers");
      return;
    }
    goto LABEL_16;
  }
  if ((v10 & -[SAEDFollowUpManager _shouldPostFollowUpForSAReason:](self, "_shouldPostFollowUpForSAReason:", v11, v22, 3221225472, __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_34, &__block_descriptor_56_e19___NSDictionary_8__0l, v3, v9, v11)) == 1)
  {
    v15 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      _os_log_impl(&dword_1CA099000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,posting FollowUp\"}", buf, 0x12u);
    }
    -[SAEDFollowUpManager setCtSuppressEDFollowUpReason:](self, "setCtSuppressEDFollowUpReason:", v9);
    -[SAEDFollowUpManager setSaSuppressEDFollowUpReason:](self, "setSaSuppressEDFollowUpReason:", v11);
    -[SAEDFollowUpManager _postFollowUp](self, "_postFollowUp");
    return;
  }
  if (v10)
  {
    v16 = -[SAEDFollowUpManager _shouldDeferFollowUpForSAReason:](self, "_shouldDeferFollowUpForSAReason:", v11);
    -[SAEDFollowUpManager setCtSuppressEDFollowUpReason:](self, "setCtSuppressEDFollowUpReason:", v9);
    -[SAEDFollowUpManager setSaSuppressEDFollowUpReason:](self, "setSaSuppressEDFollowUpReason:", v11);
    if (v16)
    {
      v17 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        _os_log_impl(&dword_1CA099000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,deferring FollowUp\"}", buf, 0x12u);
      }
      -[SAEDFollowUpManager setFollowUpState:](self, "setFollowUpState:", 10);
      return;
    }
  }
  else
  {
    -[SAEDFollowUpManager setCtSuppressEDFollowUpReason:](self, "setCtSuppressEDFollowUpReason:", v9);
    -[SAEDFollowUpManager setSaSuppressEDFollowUpReason:](self, "setSaSuppressEDFollowUpReason:", v11);
  }
  v21 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    _os_log_impl(&dword_1CA099000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,skipping FollowUp\"}", buf, 0x12u);
  }
  -[SAEDFollowUpManager setFollowUpState:](self, "setFollowUpState:", 200);
}

id __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_34(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Evaluate");
  v7[0] = CFSTR("action");
  v7[1] = CFSTR("startingFollowUpState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  v7[2] = CFSTR("ctSuppressEDFollowUpReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  v7[3] = CFSTR("saSuppressEDFollowUpReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldPostFollowUpForCTReason:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_shouldPostFollowUpForSAReason:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_shouldRetractFollowUpForSAReason:(unint64_t)a3
{
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0x2710uLL:
      goto LABEL_4;
    case 0x7530uLL:
      return 1;
    case 0x4E20uLL:
LABEL_4:
      v4 = SALogObjectWarning;
      if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 68289282;
        v6[1] = 0;
        v7 = 2082;
        v8 = "";
        v9 = 2050;
        v10 = a3;
        _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_shouldRetractFollowUpForSAReason,very unexpected reason\", \"saSuppressEDFollowUpReason\":%{public}lu}", (uint8_t *)v6, 0x1Cu);
      }
      return 1;
  }
  return 0;
}

- (BOOL)_shouldDeferFollowUpForSAReason:(unint64_t)a3
{
  BOOL result;

  result = 1;
  if ((uint64_t)a3 <= 7999)
  {
    if (a3 == 1000 || a3 == 2000)
      return result;
    return 0;
  }
  if (a3 != 8000 && a3 != 9000)
    return 0;
  return result;
}

- (NSUserDefaults)userDefaults
{
  if (qword_1EDBF0BD0 != -1)
    dispatch_once(&qword_1EDBF0BD0, &__block_literal_global);
  return (NSUserDefaults *)(id)qword_1EDBF0BD8;
}

void __35__SAEDFollowUpManager_userDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.safetyalerts"));
  v1 = (void *)qword_1EDBF0BD8;
  qword_1EDBF0BD8 = v0;

}

- (BOOL)hasNumberOverrideForDefaultsKey:(id)a3
{
  SAPlatformInfo *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = (SAPlatformInfo *)a3;
  if (!*((_BYTE *)SAPlatformInfo::instance(v4) + 9))
    goto LABEL_4;
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0)
    v7 = 1;
  else
LABEL_4:
    v7 = 0;

  return v7;
}

- (id)numberOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  SAPlatformInfo *v7;
  void *v8;
  SAPlatformInfo *v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SAPlatformInfo *v18;
  __int16 v19;
  SAPlatformInfo *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (SAPlatformInfo *)a4;
  if (!*((_BYTE *)SAPlatformInfo::instance(v7) + 9))
    goto LABEL_6;
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (SAPlatformInfo *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v9 = v7;
    goto LABEL_7;
  }
  v10 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289794;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1CA099000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,numberOverrideForDefaultsKey,#overriding\", \"key\":%{public, location:escape_only}@, \"overrideNumber\":%{public, location:escape_only}@, \"defaultValue\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x30u);
  }
LABEL_7:

  return v9;
}

- (BOOL)BOOLOverrideForDefaultsKey:(id)a3 defaultValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAEDFollowUpManager numberOverrideForDefaultsKey:defaultValue:](self, "numberOverrideForDefaultsKey:defaultValue:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)BOOLForDefaultsKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v8, "BOOLValue");

  return a4;
}

- (unint64_t)uintForDefaultsKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v8, "unsignedIntegerValue");

  return a4;
}

- (id)stringForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

- (unint64_t)followUpState
{
  return -[SAEDFollowUpManager uintForDefaultsKey:defaultValue:](self, "uintForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.state"), 0);
}

- (void)setFollowUpState:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v5 = -[SAEDFollowUpManager followUpState](self, "followUpState");
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("enhancedDelivery.followUp.state"));

  if (v5 != a3)
  {
    v15[0] = CFSTR("SetFollowupState");
    v14[0] = CFSTR("action");
    v14[1] = CFSTR("startingFollowUpState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    v14[2] = CFSTR("newFollowUpState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v9;
    v14[3] = CFSTR("ctSuppressEDFollowUpReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager ctSuppressEDFollowUpReason](self, "ctSuppressEDFollowUpReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v10;
    v14[4] = CFSTR("saSuppressEDFollowUpReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager saSuppressEDFollowUpReason](self, "saSuppressEDFollowUpReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    AnalyticsSendEventLazy();

  }
}

id __40__SAEDFollowUpManager_setFollowUpState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)ctSuppressEDFollowUpReason
{
  return -[SAEDFollowUpManager uintForDefaultsKey:defaultValue:](self, "uintForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.ctSuppressionReason"), 0);
}

- (void)setCtSuppressEDFollowUpReason:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("enhancedDelivery.followUp.ctSuppressionReason"));

}

- (unint64_t)saSuppressEDFollowUpReason
{
  return -[SAEDFollowUpManager uintForDefaultsKey:defaultValue:](self, "uintForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.saSuppressionReason"), 0);
}

- (void)setSaSuppressEDFollowUpReason:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("enhancedDelivery.followUp.saSuppressionReason"));

}

- (BOOL)userViewedEDSettings
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("enhancedDelivery.followUp.settingsViewedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setUserViewedEDSettings:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v3 = a3;
  v14[5] = *MEMORY[0x1E0C80C00];
  if (-[SAEDFollowUpManager userViewedEDSettings](self, "userViewedEDSettings") != a3)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[SAEDFollowUpManager userDefaults](self, "userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("enhancedDelivery.followUp.settingsViewedDate"));

    -[SAEDFollowUpManager _evaluateFollowUpStateAsync](self, "_evaluateFollowUpStateAsync");
    v14[0] = CFSTR("ShowedEDSettings");
    v13[0] = CFSTR("action");
    v13[1] = CFSTR("userViewedEDSettings");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    v13[2] = CFSTR("startingFollowUpState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager followUpState](self, "followUpState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v8;
    v13[3] = CFSTR("ctSuppressEDFollowUpReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager ctSuppressEDFollowUpReason](self, "ctSuppressEDFollowUpReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v9;
    v13[4] = CFSTR("saSuppressEDFollowUpReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAEDFollowUpManager saSuppressEDFollowUpReason](self, "saSuppressEDFollowUpReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    AnalyticsSendEventLazy();

  }
}

id __47__SAEDFollowUpManager_setUserViewedEDSettings___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_postFollowUp
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    _os_log_impl(&dword_1CA099000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_postFollowUp\"}", buf, 0x12u);
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D15E38]);
  objc_msgSend(v4, "setUniqueIdentifier:", CFSTR("com.apple.safetyalerts.enhancedDelivery.onboardPrompt"));
  objc_msgSend(v4, "setGroupIdentifier:", *MEMORY[0x1E0D15DF0]);
  objc_msgSend(v4, "setDisplayStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAFETYALERTS_ENHANCED_DELIVERY_FOLLOW_UP_TITLE"), &stru_1E83DBAB8, CFSTR("SAEDFollowUpManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAFETYALERTS_ENHANCED_DELIVERY_FOLLOW_UP_BODY_PHONE"), &stru_1E83DBAB8, CFSTR("SAEDFollowUpManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v8);

  v9 = (void *)MEMORY[0x1E0D15E28];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SAFETYALERTS_ENHANCED_DELIVERY_FOLLOW_UP_REDIRECT_ACTION_TITLE"), &stru_1E83DBAB8, CFSTR("SAEDFollowUpManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=com.apple.cmas.EmergencyAlerts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithLabel:url:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.safetyalerts"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__SAEDFollowUpManager__postFollowUp__block_invoke;
  v16[3] = &unk_1E83DB738;
  v16[4] = self;
  objc_msgSend(v15, "postFollowUpItem:completion:", v4, v16);

}

void __36__SAEDFollowUpManager__postFollowUp__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SAEDFollowUpManager__postFollowUp__block_invoke_2;
  block[3] = &unk_1E83DB710;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

void __36__SAEDFollowUpManager__postFollowUp__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  char v5;

  v2 = (void *)MEMORY[0x1CAA49B38]();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__SAEDFollowUpManager__postFollowUp__block_invoke_3;
  v3[3] = &unk_1E83DB710;
  v5 = *(_BYTE *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  __36__SAEDFollowUpManager__postFollowUp__block_invoke_3((uint64_t)v3);
  objc_autoreleasePoolPop(v2);
}

uint64_t __36__SAEDFollowUpManager__postFollowUp__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl(&dword_1CA099000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_postFollowUp,posted FollowUp successfully\"}", (uint8_t *)&v7, 0x12u);
    }
    v3 = 50;
  }
  else
  {
    v4 = SALogObjectWarning;
    if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_postFollowUp,failed to post FollowUp\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
    v3 = 49;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFollowUpState:", v3);
}

- (void)_retractFollowUp
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SAEDFollowUpManager *v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    _os_log_impl(&dword_1CA099000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp\"}", buf, 0x12u);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.safetyalerts"));
  v12 = CFSTR("com.apple.safetyalerts.enhancedDelivery.onboardPrompt");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke;
  v8[3] = &unk_1E83DB760;
  v6 = v4;
  v9 = v6;
  v10 = v5;
  v11 = self;
  v7 = v5;
  objc_msgSend(v6, "countOfPendingFollowUpItemsWithCompletion:", v8);

}

void __39__SAEDFollowUpManager__retractFollowUp__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    if (a2)
    {
      v11 = (void *)a1[4];
      v12 = a1[5];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke_68;
      v14[3] = &unk_1E83DB738;
      v14[4] = a1[6];
      objc_msgSend(v11, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v12, v14);
      goto LABEL_9;
    }
    v13 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v7 = "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,no pendingFollowUpItems\"}";
    v8 = v13;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 18;
    goto LABEL_4;
  }
  v6 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289282;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2114;
    v20 = v5;
    v7 = "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,error from countOfPendingFollowUpItemsWithCompletion\", \"
         "error\":%{public, location:escape_only}@}";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 28;
LABEL_4:
    _os_log_impl(&dword_1CA099000, v8, v9, v7, buf, v10);
  }
LABEL_9:

}

void __39__SAEDFollowUpManager__retractFollowUp__block_invoke_68(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke_2;
  block[3] = &unk_1E83DB710;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

void __39__SAEDFollowUpManager__retractFollowUp__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  char v5;

  v2 = (void *)MEMORY[0x1CAA49B38]();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke_3;
  v3[3] = &unk_1E83DB710;
  v5 = *(_BYTE *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  __39__SAEDFollowUpManager__retractFollowUp__block_invoke_3((uint64_t)v3);
  objc_autoreleasePoolPop(v2);
}

uint64_t __39__SAEDFollowUpManager__retractFollowUp__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl(&dword_1CA099000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,cleared FollowUp successfully\"}", (uint8_t *)&v7, 0x12u);
    }
    v3 = 100;
  }
  else
  {
    v4 = SALogObjectWarning;
    if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,failed to clear FollowUp\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
    v3 = 99;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFollowUpState:", v3);
}

- (unint64_t)_ctSuppressEDFollowUpReason
{
  const void *v3;
  uint64_t CellBroadcastConfig;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SAPlatformInfo *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (const void *)_CTServerConnectionCreateOnTargetQueue();
  CellBroadcastConfig = _CTServerConnectionGetCellBroadcastConfig();
  v5 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289538;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2050;
    v24 = (int)CellBroadcastConfig;
    v25 = 2050;
    v26 = CellBroadcastConfig >> 32;
    _os_log_impl(&dword_1CA099000, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_ctSuppressEDFollowUpReason,_CTServerConnectionGetCellBroadcastConfig error\", \"error.domain\":%{public}ld, \"error.error\":%{public}ld}", buf, 0x26u);
  }
  CFRelease(v3);
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = 0;
    _os_log_impl(&dword_1CA099000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_ctSuppressEDFollowUpReason,_CTServerConnectionGetCellBroadcastConfig\", \"configDict\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("EmergencyAlertsPref"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("EnhancedDeliveryAvailability"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("EnhancedDeliveryPref"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (*((_BYTE *)SAPlatformInfo::instance(v13) + 9))
  {
    LODWORD(v8) = -[SAEDFollowUpManager BOOLOverrideForDefaultsKey:defaultValue:](self, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.emergencyAlertsEnabled"), v8);
    LOBYTE(v10) = -[SAEDFollowUpManager BOOLOverrideForDefaultsKey:defaultValue:](self, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.enhancedDeliveryAvailable"), v10);
    LODWORD(v12) = -[SAEDFollowUpManager BOOLOverrideForDefaultsKey:defaultValue:](self, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.enhancedDeliveryPrefEnabled"), v12);
  }
  if ((_DWORD)v8 && (v10 & 1) != 0)
  {
    v14 = 300;
    if (!(_DWORD)v12)
      v14 = 0;
    v15 = v14 | 0xF4240;
    if ((_DWORD)v12)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v17 = 100;
    if ((_DWORD)v8)
      v17 = 200;
    v16 = v17 + 1000000;
  }

  return v16;
}

- (unint64_t)_saSuppressEDFollowUpReason
{
  if (!-[SAEDFollowUpManager _currentDeviceHasEnhancedDeliverySwitch](self, "_currentDeviceHasEnhancedDeliverySwitch"))
    return 20000;
  if (-[SAEDFollowUpManager userViewedEDSettings](self, "userViewedEDSettings"))
    return 30000;
  if (!-[SAEDFollowUpManager hasValidLocationServicesEnabled](self, "hasValidLocationServicesEnabled"))
    return 1000;
  if (!-[SAEDFollowUpManager locationServicesEnabled](self, "locationServicesEnabled"))
    return 40000;
  if (!-[SAEDFollowUpManager hasValidCurrentLocationInCoveredRegion](self, "hasValidCurrentLocationInCoveredRegion"))
    return 2000;
  if (!-[SAEDFollowUpManager currentLocationInCoveredRegion](self, "currentLocationInCoveredRegion"))
    return 50000;
  if (!-[SAEDFollowUpManager hasValidUptakeCoefficient](self, "hasValidUptakeCoefficient"))
    return 8000;
  if (-[SAEDFollowUpManager shouldShowCFUPerUptakeCoefficient](self, "shouldShowCFUPerUptakeCoefficient"))
    return 0;
  return 9000;
}

- (BOOL)_currentDeviceHasEnhancedDeliverySwitch
{
  return 1;
}

- (void)setCurrentLocationInCoveredRegion:(BOOL)a3
{
  self->_currentLocationInCoveredRegion = a3;
  if (!self->_currentLocationInCoveredRegion_Valid)
  {
    self->_currentLocationInCoveredRegion_Valid = 1;
    -[SAEDFollowUpManager _evaluateFollowUpStateAsync](self, "_evaluateFollowUpStateAsync");
  }
}

- (BOOL)currentLocationInCoveredRegion
{
  _BOOL8 v3;
  NSObject *v4;
  _BOOL4 currentLocationInCoveredRegion;
  BOOL v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[SAEDFollowUpManager hasValidCurrentLocationInCoveredRegion](self, "hasValidCurrentLocationInCoveredRegion");
  if (!v3)
  {
    v4 = SALogObjectWarning;
    v3 = os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v8[0] = 68289026;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"currentLocationInCoveredRegion + !hasValidCurrentLocationInCoveredRegion\"}", (uint8_t *)v8, 0x12u);
    }
  }
  currentLocationInCoveredRegion = self->_currentLocationInCoveredRegion;
  v6 = self->_currentLocationInCoveredRegion;
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)v3) + 9))
    return -[SAEDFollowUpManager BOOLOverrideForDefaultsKey:defaultValue:](self, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.currentLocationInCoveredRegion"), currentLocationInCoveredRegion);
  return v6;
}

- (BOOL)hasValidCurrentLocationInCoveredRegion
{
  if (self->_currentLocationInCoveredRegion_Valid)
    return 1;
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9))
    return -[SAEDFollowUpManager hasNumberOverrideForDefaultsKey:](self, "hasNumberOverrideForDefaultsKey:", CFSTR("enhancedDelivery.followUp.override.currentLocationInCoveredRegion"));
  return 0;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
  if (!self->_locationServicesEnabled_Valid)
  {
    self->_locationServicesEnabled_Valid = 1;
    -[SAEDFollowUpManager _evaluateFollowUpStateAsync](self, "_evaluateFollowUpStateAsync");
  }
}

- (BOOL)locationServicesEnabled
{
  _BOOL8 v3;
  NSObject *v4;
  _BOOL4 locationServicesEnabled;
  BOOL v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[SAEDFollowUpManager hasValidLocationServicesEnabled](self, "hasValidLocationServicesEnabled");
  if (!v3)
  {
    v4 = SALogObjectWarning;
    v3 = os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v8[0] = 68289026;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"locationServicesEnabled + !hasValidLocationServicesEnabled\"}", (uint8_t *)v8, 0x12u);
    }
  }
  locationServicesEnabled = self->_locationServicesEnabled;
  v6 = self->_locationServicesEnabled;
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)v3) + 9))
    return -[SAEDFollowUpManager BOOLOverrideForDefaultsKey:defaultValue:](self, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.locationServicesEnabled"), locationServicesEnabled);
  return v6;
}

- (BOOL)hasValidLocationServicesEnabled
{
  if (self->_locationServicesEnabled_Valid)
    return 1;
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9))
    return -[SAEDFollowUpManager hasNumberOverrideForDefaultsKey:](self, "hasNumberOverrideForDefaultsKey:", CFSTR("enhancedDelivery.followUp.override.locationServicesEnabled"));
  return 0;
}

- (void)setUptakeCoefficient:(float)a3
{
  self->_uptakeCoefficient = a3;
  if (!self->_uptakeCoefficient_Valid)
  {
    self->_uptakeCoefficient_Valid = 1;
    -[SAEDFollowUpManager _evaluateFollowUpStateAsync](self, "_evaluateFollowUpStateAsync");
  }
}

- (float)uptakeCoefficient
{
  _BOOL8 v3;
  NSObject *v4;
  float uptakeCoefficient;
  double v6;
  void *v7;
  void *v8;
  float v9;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[SAEDFollowUpManager hasValidUptakeCoefficient](self, "hasValidUptakeCoefficient");
  if (!v3)
  {
    v4 = SALogObjectWarning;
    v3 = os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v11[0] = 68289026;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"uptakeCoefficient + !hasValidUptakeCoefficient\"}", (uint8_t *)v11, 0x12u);
    }
  }
  uptakeCoefficient = self->_uptakeCoefficient;
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)v3) + 9))
  {
    *(float *)&v6 = uptakeCoefficient;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAEDFollowUpManager numberOverrideForDefaultsKey:defaultValue:](self, "numberOverrideForDefaultsKey:defaultValue:", CFSTR("enhancedDelivery.followUp.override.uptakeCoefficient"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    uptakeCoefficient = v9;

  }
  return uptakeCoefficient;
}

- (BOOL)hasValidUptakeCoefficient
{
  if (self->_uptakeCoefficient_Valid)
    return 1;
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9))
    return -[SAEDFollowUpManager hasNumberOverrideForDefaultsKey:](self, "hasNumberOverrideForDefaultsKey:", CFSTR("enhancedDelivery.followUp.override.uptakeCoefficient"));
  return 0;
}

- (BOOL)shouldShowCFUPerUptakeCoefficient
{
  float v3;
  float v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  float v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SAEDFollowUpManager uptakeCoefficient](self, "uptakeCoefficient");
  v4 = v3;
  -[SAEDFollowUpManager userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("enhancedDelivery.followUp.lastTestedUptakeCoefficient"));

  v8 = v4 * 1000000.0;
  v9 = (float)arc4random_uniform(0xF4240u);
  v10 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68290050;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 1026;
    v16 = v8 > v9;
    v17 = 2050;
    v18 = v4;
    v19 = 2050;
    v20 = v8;
    v21 = 2050;
    v22 = v9;
    _os_log_impl(&dword_1CA099000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,shouldShowCFUPerUptakeCoefficient\", \"showCFU\":%{public}hhd, \"uptakeCoefficient\":\"%{public}f\", \"threshold\":\"%{public}f\", \"randomValue\":\"%{public}f\"}", (uint8_t *)v12, 0x36u);
  }
  return v8 > v9;
}

- (void)_onCellConfigChanged:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_1CA099000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_onCellConfigChanged\"}", (uint8_t *)v5, 0x12u);
  }
  -[SAEDFollowUpManager _evaluateFollowUpStateAsync](self, "_evaluateFollowUpStateAsync");
}

- (void)_addNotificationObservers
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_1CA099000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_addNotificationObservers\"}", (uint8_t *)v5, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__onCellConfigChanged_, *MEMORY[0x1E0CA7820], 0);

}

- (void)_removeNotificationObservers
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_1CA099000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_removeNotificationObservers\"}", (uint8_t *)v5, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CA7820], 0);

}

- (void)noteUserViewedEDSettings
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_1CA099000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,noteUserViewedEDSettings\"}", (uint8_t *)v4, 0x12u);
  }
  -[SAEDFollowUpManager setUserViewedEDSettings:](self, "setUserViewedEDSettings:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationQueue, 0);
}

@end
