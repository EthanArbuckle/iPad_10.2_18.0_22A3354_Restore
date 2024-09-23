@implementation SSAuthorizationMetricsController

+ (id)authorizationDialogEventForParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("buyParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dialogID"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dualAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("biometricMatchState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topicName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("userAgent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v7)
  {
    case 1:
    case 4:
      v15 = (void *)v22;
      objc_msgSend((id)objc_opt_class(), "_dialogEventForPasswordAuthorizationWithDialogId:buyParams:topicName:userAgent:", v22, v4, v13, v14);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      v15 = (void *)v22;
      objc_msgSend((id)objc_opt_class(), "_dialogEventForBiometricAuthorizationWithDialogId:buyParams:matchState:topicName:userAgent:", v22, v4, v9, v13, v14);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v17 = (void *)v16;
      v18 = (void *)v21;
      if (v5)
        goto LABEL_7;
      goto LABEL_8;
    case 3:
      v18 = (void *)v21;
      objc_msgSend((id)objc_opt_class(), "_dialogEventForBiometricOptInWithResult:message:topicName:userAgent:error:", v12, v10, v13, v14, v21);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      v18 = (void *)v21;
      objc_msgSend((id)objc_opt_class(), "_dialogEventForPaymentSheetPresentationErrorWithBuyParams:error:", v4, v21);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v17 = (void *)v20;
      v15 = (void *)v22;
      if (!v5)
        goto LABEL_8;
      goto LABEL_7;
    default:
      v17 = 0;
      v18 = (void *)v21;
      v15 = (void *)v22;
      if (!v5)
        goto LABEL_8;
LABEL_7:
      objc_msgSend(v17, "setDualAction:", v5);
LABEL_8:

      return v17;
  }
}

+ (id)dialogIdForMetricsDictionary:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("dialogId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)userActionDictionaryForBiometricMatchState:(unint64_t)a3 didBiometricsLockout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString **v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString **v27;
  __CFString **v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v44;
  int v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int *v55;
  int *v56;
  uint64_t v57;
  int v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v4 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  v8 = 0x1E0CB3000uLL;
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("error"), CFSTR("reason"));
      v9 = CFSTR("failure");
      v10 = CFSTR("result");
      goto LABEL_25;
    case 2uLL:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("authenticate"), CFSTR("actionType"));
      v27 = SSMetricsDialogEventResultSuccess;
      goto LABEL_23;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 4uLL:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("enterPassword"), CFSTR("actionType"));
      v28 = SSMetricsDialogEventTargetIdEnterPassword;
      goto LABEL_24;
    case 8uLL:
      v11 = SSMetricsDialogEventActionTypeCancel;
      goto LABEL_21;
    default:
      if (a3 == 16)
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("authenticate"), CFSTR("actionType"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("invalidCredentials"), CFSTR("reason"));
        v27 = SSMetricsDialogEventResultFailure;
LABEL_23:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", *v27, CFSTR("result"));
        v28 = SSMetricsDialogEventTargetIdBiometrics;
        goto LABEL_24;
      }
      if (a3 != 32)
      {
LABEL_6:
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v13 = objc_msgSend(v12, "shouldLog");
        if (objc_msgSend(v12, "shouldLogToDisk"))
          v14 = v13 | 2;
        else
          v14 = v13;
        objc_msgSend(v12, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          v14 &= 2u;
        if (v14)
        {
          v16 = (void *)objc_opt_class();
          v17 = (void *)MEMORY[0x1E0CB37E8];
          v18 = v16;
          objc_msgSend(v17, "numberWithUnsignedInteger:", a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 138543618;
          v59 = v16;
          v60 = 2114;
          v61 = v19;
          LODWORD(v57) = 22;
          v55 = &v58;
          v20 = (void *)_os_log_send_and_compose_impl();

          v8 = 0x1E0CB3000;
          if (!v20)
          {
LABEL_17:

            goto LABEL_26;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v58, v57);
          v15 = objc_claimAutoreleasedReturnValue();
          free(v20);
          SSFileLog(v12, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v15);
        }

        goto LABEL_17;
      }
      v11 = SSMetricsDialogEventActionTypeCancelHomeButton;
LABEL_21:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", *v11, CFSTR("actionType"));
      v28 = SSMetricsDialogEventTargetIdCancel;
LABEL_24:
      v9 = *v28;
      v10 = CFSTR("targetId");
LABEL_25:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);
LABEL_26:
      +[SSDevice currentDevice](SSDevice, "currentDevice", v55);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "deviceBiometricStyle");

      if (!v30)
      {
        +[SSLogConfig sharediTunesStoreConfig](SSLogConfig, "sharediTunesStoreConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v33 = objc_msgSend(v32, "shouldLog");
        if (objc_msgSend(v32, "shouldLogToDisk"))
          v34 = v33 | 2;
        else
          v34 = v33;
        objc_msgSend(v32, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          v34 &= 2u;
        if (!v34)
          goto LABEL_53;
        goto LABEL_51;
      }
      if (v30 != 3)
      {
        if (v30 == 2)
        {
          v31 = CFSTR("touchId");
          goto LABEL_40;
        }
        +[SSLogConfig sharediTunesStoreConfig](SSLogConfig, "sharediTunesStoreConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v44 = objc_msgSend(v32, "shouldLog");
        if (objc_msgSend(v32, "shouldLogToDisk"))
          v45 = v44 | 2;
        else
          v45 = v44;
        objc_msgSend(v32, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          v45 &= 2u;
        if (!v45)
          goto LABEL_53;
LABEL_51:
        v46 = (void *)objc_opt_class();
        v58 = 138543362;
        v59 = v46;
        v47 = v46;
        LODWORD(v57) = 12;
        v56 = &v58;
        v48 = (void *)_os_log_send_and_compose_impl();

        if (!v48)
          goto LABEL_54;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v48, 4, &v58, v57);
        v35 = objc_claimAutoreleasedReturnValue();
        free(v48);
        SSFileLog(v32, CFSTR("%@"), v49, v50, v51, v52, v53, v54, (uint64_t)v35);
LABEL_53:

LABEL_54:
        if (!v4)
          goto LABEL_42;
        goto LABEL_41;
      }
      v31 = CFSTR("faceId");
LABEL_40:
      objc_msgSend(v7, "setObject:forKey:", v31, CFSTR("biometricType"));
      if (v4)
LABEL_41:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("bioLockout"), v56);
LABEL_42:
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v56);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeIntervalSince1970");
      v38 = v37;

      v39 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v8 + 2024), "numberWithLongLong:", (uint64_t)v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("%@"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, CFSTR("responseTime"));
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      return v42;
  }
}

+ (id)userActionDictionaryForUserAction:(int64_t)a3 didBiometricsLockout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int64_t v8;
  __CFString **v9;
  const __CFString *v10;
  __CFString **v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  v8 = a3 - 1;
  v9 = SSMetricsDialogEventActionTypeAuthenticate;
  v10 = CFSTR("result");
  v11 = SSMetricsDialogEventResultSuccess;
  switch(v8)
  {
    case 0:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("success"), CFSTR("result"));
      v9 = SSMetricsDialogEventTargetIdOK;
      v10 = CFSTR("actionType");
      v11 = SSMetricsDialogEventActionTypeOK;
      goto LABEL_11;
    case 1:
      v9 = SSMetricsDialogEventTargetIdIForgot;
      goto LABEL_6;
    case 2:
      v9 = SSMetricsDialogEventTargetIdIForgot;
      v10 = CFSTR("actionType");
      v11 = SSMetricsDialogEventActionTypeOpen;
      goto LABEL_11;
    case 3:
      v9 = SSMetricsDialogEventTargetIdCancel;
LABEL_6:
      v10 = CFSTR("actionType");
      v11 = SSMetricsDialogEventActionTypeCancel;
      goto LABEL_11;
    case 4:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("invalidCredentials"), CFSTR("reason"));
      v10 = CFSTR("result");
      v11 = SSMetricsDialogEventResultFailure;
      goto LABEL_11;
    case 5:
      goto LABEL_11;
    case 6:
      v10 = CFSTR("actionType");
      v11 = SSMetricsDialogEventActionTypeEnterPasswordCancelled;
      goto LABEL_11;
    case 7:
      v10 = CFSTR("actionType");
      v11 = SSMetricsDialogEventActionTypeEnterPasswordPressed;
      goto LABEL_11;
    case 8:
      v9 = SSMetricsDialogEventTargetIdCancel;
      v10 = CFSTR("actionType");
      v11 = SSMetricsDialogEventActionTypeCancelHomeButton;
LABEL_11:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", *v11, v10);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", *v9, CFSTR("targetId"));
      break;
    default:
      break;
  }
  if (v4)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("bioLockout"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("responseTime"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_dialogEventForBiometricAuthorizationWithDialogId:(id)a3 buyParams:(id)a4 matchState:(int64_t)a5 topicName:(id)a6 userAgent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SSMetricsDialogEvent *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  __CFString **v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString **v35;
  uint64_t v37;
  id v38;
  NSObject *v39;
  int v40;
  void *v41;
  __int16 v42;
  id v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = objc_alloc_init(SSMetricsDialogEvent);
  -[SSMetricsDialogEvent setDialogId:](v16, "setDialogId:", v15);

  -[SSMetricsDialogEvent setDialogType:](v16, "setDialogType:", CFSTR("SignIn"));
  objc_msgSend((id)objc_opt_class(), "_clientIdForMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v16, "setProperty:forBodyKey:", v17, CFSTR("clientId"));
  if (v12)
  {
    v44 = CFSTR("buyParams");
    v45[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsDialogEvent setDetails:](v16, "setDetails:", v18);

  }
  if (v14)
    -[SSMetricsMutableEvent setUserAgent:](v16, "setUserAgent:", v14);
  v19 = (__CFString *)v13;
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(a1, "_mtTopicForBuyParams:", v12);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
      v20 = (__CFString *)v21;
    else
      v20 = CFSTR("xp_its_main");
  }
  -[SSMetricsMutableEvent setTopic:](v16, "setTopic:", v20);
  switch(a5)
  {
    case 1:
      -[SSMetricsDialogEvent setResult:](v16, "setResult:", CFSTR("failure"));
      goto LABEL_32;
    case 2:
      -[SSMetricsDialogEvent setActionType:](v16, "setActionType:", CFSTR("biometricsAnalyze"));
      v22 = SSMetricsDialogEventResultSuccess;
      goto LABEL_25;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_15;
    case 4:
      -[SSMetricsDialogEvent setActionType:](v16, "setActionType:", CFSTR("enterPassword"));
      -[SSMetricsDialogEvent setResult:](v16, "setResult:", CFSTR("unknown"));
      v35 = SSMetricsDialogEventTargetIdEnterPassword;
      goto LABEL_28;
    case 8:
      -[SSMetricsDialogEvent setActionType:](v16, "setActionType:", CFSTR("cancel"));
      -[SSMetricsDialogEvent setResult:](v16, "setResult:", CFSTR("failure"));
      v35 = SSMetricsDialogEventTargetIdCancel;
      goto LABEL_28;
    default:
      if (a5 != 16)
      {
LABEL_15:
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v24 = objc_msgSend(v23, "shouldLog");
        if (objc_msgSend(v23, "shouldLogToDisk"))
          v24 |= 2u;
        objc_msgSend(v23, "OSLogObject");
        v39 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          v24 &= 2u;
        if (v24)
        {
          HIDWORD(v37) = v24;
          v25 = (void *)objc_opt_class();
          v26 = (void *)MEMORY[0x1E0CB37E8];
          v38 = v25;
          objc_msgSend(v26, "numberWithInteger:", a5);
          v40 = 138543618;
          v41 = v25;
          v42 = 2114;
          v43 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v37) = 22;
          v27 = (void *)_os_log_send_and_compose_impl();

          if (!v27)
          {
LABEL_31:

            goto LABEL_32;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v40, v37);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          free(v27);
          SSFileLog(v23, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v28);
        }
        else
        {
          v28 = v39;
        }

        goto LABEL_31;
      }
      -[SSMetricsDialogEvent setActionType:](v16, "setActionType:", CFSTR("biometricsAnalyze"));
      v22 = SSMetricsDialogEventResultFailure;
LABEL_25:
      -[SSMetricsDialogEvent setResult:](v16, "setResult:", *v22);
      v35 = SSMetricsDialogEventTargetIdBiometrics;
LABEL_28:
      -[SSMetricsDialogEvent setTargetId:](v16, "setTargetId:", *v35);
LABEL_32:

      return v16;
  }
}

+ (id)_dialogEventForBiometricOptInWithResult:(BOOL)a3 message:(id)a4 topicName:(id)a5 userAgent:(id)a6 error:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  __CFString *v13;
  SSMetricsDialogEvent *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  __CFString **v18;
  __CFString **v19;
  __CFString **v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];

  v10 = a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = (__CFString *)a5;
  v14 = objc_alloc_init(SSMetricsDialogEvent);
  objc_msgSend((id)objc_opt_class(), "_clientIdForMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v14, "setProperty:forBodyKey:", v15, CFSTR("clientId"));
  -[SSMetricsDialogEvent setDialogId:](v14, "setDialogId:", CFSTR("EnableTouchIdPurchases"));
  -[SSMetricsDialogEvent setDialogType:](v14, "setDialogType:", CFSTR("OkCancel"));
  if (v13)
    v16 = v13;
  else
    v16 = CFSTR("xp_its_main");
  -[SSMetricsMutableEvent setTopic:](v14, "setTopic:", v16);

  if (v11)
    -[SSMetricsDialogEvent setMessage:](v14, "setMessage:", v11);
  if (v12)
    -[SSMetricsMutableEvent setUserAgent:](v14, "setUserAgent:", v12);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a7)
  {
    v18 = SSMetricsDialogEventResultFailure;
  }
  else
  {
    v19 = SSMetricsDialogEventActionTypeOK;
    if (v10)
    {
      v20 = SSMetricsDialogEventTargetIdOK;
    }
    else
    {
      v19 = SSMetricsDialogEventActionTypeCancel;
      v20 = SSMetricsDialogEventTargetIdNotNow;
    }
    -[SSMetricsDialogEvent setActionType:](v14, "setActionType:", *v19);
    v21 = *v20;
    -[SSMetricsDialogEvent setTargetId:](v14, "setTargetId:", v21);
    objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("targetId"));
    v18 = SSMetricsDialogEventResultSuccess;
  }
  v22 = *v18;
  -[SSMetricsDialogEvent setResult:](v14, "setResult:", *v18);
  objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("result"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSince1970");
  v25 = v24;

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKey:", v28, CFSTR("responseTime"));
  v31[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsDialogEvent setUserActions:](v14, "setUserActions:", v29);

  return v14;
}

+ (id)_dialogEventForPasswordAuthorizationWithDialogId:(id)a3 buyParams:(id)a4 topicName:(id)a5 userAgent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SSMetricsDialogEvent *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_alloc_init(SSMetricsDialogEvent);
  -[SSMetricsDialogEvent setDialogId:](v14, "setDialogId:", v13);

  -[SSMetricsDialogEvent setDialogType:](v14, "setDialogType:", CFSTR("SignIn"));
  objc_msgSend((id)objc_opt_class(), "_clientIdForMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v14, "setProperty:forBodyKey:", v15, CFSTR("clientId"));
  if (v10)
  {
    v21 = CFSTR("buyParams");
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsDialogEvent setDetails:](v14, "setDetails:", v16);

  }
  if (v12)
    -[SSMetricsMutableEvent setUserAgent:](v14, "setUserAgent:", v12);
  v17 = (__CFString *)v11;
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(a1, "_mtTopicForBuyParams:", v10);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
      v18 = (__CFString *)v19;
    else
      v18 = CFSTR("xp_its_main");
  }
  -[SSMetricsMutableEvent setTopic:](v14, "setTopic:", v18);

  return v14;
}

+ (id)_dialogEventForPaymentSheetPresentationErrorWithBuyParams:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SSMetricsDialogEvent *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __CFString **v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SSMetricsDialogEvent);
  objc_msgSend((id)objc_opt_class(), "_clientIdForMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v8, "setProperty:forBodyKey:", v9, CFSTR("clientId"));
  -[SSMetricsDialogEvent setDialogId:](v8, "setDialogId:", CFSTR("PaymentSheet"));
  -[SSMetricsDialogEvent setDialogType:](v8, "setDialogType:", CFSTR("SignIn"));
  -[SSMetricsDialogEvent setResult:](v8, "setResult:", CFSTR("failure"));
  objc_msgSend(a1, "_mtTopicForBuyParams:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[SSMetricsMutableEvent setTopic:](v8, "setTopic:", v10);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKey:", CFSTR("authenticate"), CFSTR("actionType"));
  objc_msgSend(v11, "setObject:forKey:", CFSTR("failure"), CFSTR("result"));
  v12 = objc_msgSend(v6, "code");

  if (v12 == 151)
  {
    v13 = SSMetricsDialogEventReasonPaymentSheetPresentationFailure;
    goto LABEL_9;
  }
  if (v12 == 152)
  {
    v13 = SSMetricsDialogEventReasonPaymentSheetTimeout;
LABEL_9:
    objc_msgSend(v11, "setObject:forKey:", *v13, CFSTR("reason"));
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = v15;

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("responseTime"));
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsDialogEvent setUserActions:](v8, "setUserActions:", v20);

  return v8;
}

+ (id)_clientIdForMetrics
{
  void *v3;
  void *v4;
  void *v5;

  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(a1, "_clientIDForAccount:orUserID:", v4, 0),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "_clientIDForAccount:orUserID:", 0, &unk_1E481E840);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "_clientIDForAccount:orUserID:", 0, &unk_1E481E858);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

+ (id)_clientIDForAccount:(id)a3 orUserID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  int v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  int v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  int v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SSLogConfig sharediTunesStoreConfig](SSLogConfig, "sharediTunesStoreConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (!v6)
  {
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    objc_msgSend(v8, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      v26 = v24;
    else
      v26 = v24 & 2;
    if (v26)
    {
      v65 = 138543362;
      v66 = (id)objc_opt_class();
      v27 = v66;
      LODWORD(v60) = 12;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_28:
        v35 = 0;
        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, &v65, v60);
      v25 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog(v8, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v25);
    }

    goto LABEL_28;
  }
  if (!v7)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    v12 = v10;
  else
    v12 = v10 & 2;
  if (!v12)
    goto LABEL_13;
  v65 = 138543618;
  v66 = (id)objc_opt_class();
  v67 = 2112;
  v68 = v6;
  v13 = v66;
  LODWORD(v60) = 22;
  v59 = &v65;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v65, v60);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
LABEL_13:

  }
  +[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v5)
    objc_msgSend(v21, "allCookiesForAccount:", v5);
  else
    objc_msgSend(v21, "allCookiesForUserIdentifier:", v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v8 = v36;
  v37 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v62;
LABEL_32:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v39)
        objc_enumerationMutation(v8);
      v41 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v40);
      objc_msgSend(v41, "name", v59);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("xp_ci"));

      if ((v43 & 1) != 0)
        break;
      if (v38 == ++v40)
      {
        v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        if (v38)
          goto LABEL_32;
        goto LABEL_38;
      }
    }
    objc_msgSend(v41, "value");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      goto LABEL_53;
    +[SSLogConfig sharediTunesStoreConfig](SSLogConfig, "sharediTunesStoreConfig");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45 = objc_msgSend(v44, "shouldLog");
    if (objc_msgSend(v44, "shouldLogToDisk"))
      v46 = v45 | 2;
    else
      v46 = v45;
    objc_msgSend(v44, "OSLogObject");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      v48 = v46;
    else
      v48 = v46 & 2;
    if (v48)
    {
      v49 = (void *)objc_opt_class();
      v65 = 138543874;
      v66 = v49;
      v67 = 2114;
      v68 = v35;
      v69 = 2112;
      v70 = v6;
      v50 = v49;
      LODWORD(v60) = 32;
      v51 = (void *)_os_log_send_and_compose_impl();

      if (!v51)
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, &v65, v60);
      v47 = objc_claimAutoreleasedReturnValue();
      free(v51);
      SSFileLog(v44, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v47);
    }

  }
  else
  {
LABEL_38:
    v35 = 0;
    v44 = v8;
  }
LABEL_52:

LABEL_53:
  return v35;
}

+ (id)_mtTopicForBuyParams:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__86;
  v12 = __Block_byref_object_dispose__86;
  v13 = 0;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSAuthorizationMetricsController__mtTopicForBuyParams___block_invoke;
  v7[3] = &unk_1E47C0918;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __57__SSAuthorizationMetricsController__mtTopicForBuyParams___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = objc_msgSend(v12, "containsString:", CFSTR("mtTopic"));
  v7 = v12;
  if (v6)
  {
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("="));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    *a4 = 1;

    v7 = v12;
  }

}

@end
