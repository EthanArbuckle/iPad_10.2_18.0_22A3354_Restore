@implementation TPSCallWaitingRequestController

- (void)executeRequest:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TPSCallWaitingRequestController executeSetForRequest:](self, "executeSetForRequest:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TPSCallWaitingRequestController executeFetchForRequest:](self, "executeFetchForRequest:", v4);
  }

}

- (void)executeFetchForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[TPSRequestController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "callClass");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__TPSCallWaitingRequestController_executeFetchForRequest___block_invoke;
  v9[3] = &unk_1EA2CD8A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "fetchCallWaitingValue:callClass:completion:", v6, v7, v9);

}

void __58__TPSCallWaitingRequestController_executeFetchForRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = a2;
    objc_msgSend(v3, "subscriptionContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithSubscriptionContext:enabled:error:", v5, 0, v4);

  }
}

- (void)executeSetForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[TPSRequestController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "callClass");
  v8 = objc_msgSend(v4, "enabled");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__TPSCallWaitingRequestController_executeSetForRequest___block_invoke;
  v10[3] = &unk_1EA2CD8A0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "saveCallWaitingValue:callClass:enabled:completion:", v6, v7, v8, v10);

}

void __56__TPSCallWaitingRequestController_executeSetForRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = a2;
    objc_msgSend(v3, "subscriptionContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithSubscriptionContext:enabled:error:", v5, 0, v4);

  }
}

- (void)respondWithSubscriptionContext:(id)a3 enabled:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  TPSCallWaitingResponse *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[TPSCallWaitingResponse initWithsubscriptionContext:error:enabled:]([TPSCallWaitingResponse alloc], "initWithsubscriptionContext:error:enabled:", v9, v8, v5);

  -[TPSRequestController postResponse:](self, "postResponse:", v10);
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  TPSCallWaitingRequestController *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (a5 == 3)
  {
    TPSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      TPSStringForCTSuppServicesEventType(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      TPSStringForCTSuppServicesSettingsType(3u);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      v39 = 2112;
      v40 = v11;
      v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1DB4B7000, v12, OS_LOG_TYPE_DEFAULT, "Received event %@, settings type %@, data %@ for context %@.", buf, 0x2Au);

    }
    -[TPSRequestController pendingRequest](self, "pendingRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a4)
    {
      case 1:
        TPSLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "enabled");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v36 = v15;
          v37 = 2112;
          v38 = v17;
          _os_log_impl(&dword_1DB4B7000, v16, OS_LOG_TYPE_DEFAULT, "Call waiting fetch request succeeded for %@; enabled value is %@.",
            buf,
            0x16u);

        }
        objc_msgSend(v11, "enabled");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");
        v20 = self;
        v21 = v10;
        v22 = 0;
        goto LABEL_14;
      case 2:
        +[TPSResponseError errorWithCode:userInfo:](TPSResponseError, "errorWithCode:userInfo:", 2, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        TPSLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[TPSCallWaitingRequestController suppServicesEvent:event:settingsType:data:].cold.2((uint64_t)v18, (uint64_t)v15, v24);

        v20 = self;
        v21 = v10;
        v19 = 0;
        v22 = v18;
LABEL_14:
        -[TPSCallWaitingRequestController respondWithSubscriptionContext:enabled:error:](v20, "respondWithSubscriptionContext:enabled:error:", v21, v19, v22);

        break;
      case 3:
        TPSLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_impl(&dword_1DB4B7000, v25, OS_LOG_TYPE_DEFAULT, "Call waiting save request succeeded for %@.", buf, 0xCu);
        }

        -[TPSCallWaitingRequestController respondWithSubscriptionContext:enabled:error:](self, "respondWithSubscriptionContext:enabled:error:", v10, objc_msgSend(v15, "enabled"), 0);
        break;
      case 4:
        v33[0] = *MEMORY[0x1E0CB2D60];
        +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CALL_WAITING_SAVE_REQUEST_ERROR_LOCALIZED_DESCRIPTION"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *MEMORY[0x1E0CB2D68];
        v34[0] = v26;
        v34[1] = CFSTR("Call waiting save request failed with error kCTSuppServicesEventTypeSaveError");
        v28 = *MEMORY[0x1E0CB2938];
        v33[1] = v27;
        v33[2] = v28;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ for %@"), CFSTR("Call waiting save request failed with error kCTSuppServicesEventTypeSaveError"), v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[TPSResponseError errorWithCode:userInfo:](TPSResponseError, "errorWithCode:userInfo:", 4, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        TPSLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[TPSCallWaitingRequestController suppServicesEvent:event:settingsType:data:].cold.3(v31, v32);

        -[TPSCallWaitingRequestController respondWithSubscriptionContext:enabled:error:](self, "respondWithSubscriptionContext:enabled:error:", v10, 0, v31);
        break;
      default:
        TPSLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:].cold.1(a4, v23);

        break;
    }

  }
}

- (void)suppServicesEvent:(os_log_t)log event:settingsType:data:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DB4B7000, log, OS_LOG_TYPE_ERROR, "Call waiting fetch request failed with error %@ for %@.", (uint8_t *)&v3, 0x16u);
}

- (void)suppServicesEvent:(void *)a1 event:(NSObject *)a2 settingsType:data:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DB4B7000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);

}

@end
