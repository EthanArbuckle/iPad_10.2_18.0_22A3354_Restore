@implementation TPSCallingLineIdRestrictionRequestController

- (void)executeRequest:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TPSCallingLineIdRestrictionRequestController executeSetForRequest:](self, "executeSetForRequest:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TPSCallingLineIdRestrictionRequestController executeFetchForRequest:](self, "executeFetchForRequest:", v4);
  }

}

- (void)executeFetchForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[TPSRequestController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__TPSCallingLineIdRestrictionRequestController_executeFetchForRequest___block_invoke;
  v8[3] = &unk_1EA2CD8A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchCallingLineIdRestrictionValue:completion:", v6, v8);

}

void __71__TPSCallingLineIdRestrictionRequestController_executeFetchForRequest___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v2, "respondWithSubscriptionContext:editable:state:error:", v5, 0, 0, v4);

  }
}

- (void)executeSetForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = CTCallingLineIdRestrictionValueForState(objc_msgSend(v4, "state"));
  -[TPSRequestController telephonyClient](self, "telephonyClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__TPSCallingLineIdRestrictionRequestController_executeSetForRequest___block_invoke;
  v9[3] = &unk_1EA2CD8A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "saveCallingLineIdRestrictionValue:restrictionValue:completion:", v7, v5, v9);

}

void __69__TPSCallingLineIdRestrictionRequestController_executeSetForRequest___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v2, "respondWithSubscriptionContext:editable:state:error:", v5, 0, 0, v4);

  }
}

- (void)respondWithSubscriptionContext:(id)a3 editable:(BOOL)a4 state:(int64_t)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  TPSCallingLineIdRestrictionResponse *v12;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = -[TPSCallingLineIdRestrictionResponse initWithsubscriptionContext:editable:state:error:]([TPSCallingLineIdRestrictionResponse alloc], "initWithsubscriptionContext:editable:state:error:", v11, v7, a5, v10);

  -[TPSRequestController postResponse:](self, "postResponse:", v12);
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
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  TPSCallingLineIdRestrictionRequestController *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (a5 == 6)
  {
    TPSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      TPSStringForCTSuppServicesEventType(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      TPSStringForCTSuppServicesSettingsType(6u);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138413058;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_1DB4B7000, v12, OS_LOG_TYPE_DEFAULT, "Received event %@, settings type %@, data %@ for context %@.", (uint8_t *)&v29, 0x2Au);

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
          v29 = 138412546;
          v30 = v15;
          v31 = 2112;
          v32 = v11;
          _os_log_impl(&dword_1DB4B7000, v16, OS_LOG_TYPE_DEFAULT, "Calling Line ID Restriction fetch request succeeded for %@; data value is %@.",
            (uint8_t *)&v29,
            0x16u);
        }

        objc_msgSend(v11, "callingLineIdRestrictionModification");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue") == 1;

        objc_msgSend(v11, "callingLineIdRestriction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = TPSCallingLineIdRestrictionStateForValue(objc_msgSend(v19, "intValue"));

        v21 = self;
        v22 = v10;
        v23 = v18;
        v24 = v20;
        goto LABEL_16;
      case 2:
        +[TPSResponseError errorWithCode:userInfo:](TPSResponseError, "errorWithCode:userInfo:", 2, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        TPSLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:].cold.2();
        goto LABEL_19;
      case 3:
        TPSLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138412290;
          v30 = v15;
          _os_log_impl(&dword_1DB4B7000, v28, OS_LOG_TYPE_DEFAULT, "Calling Line ID Restriction save request succeeded for %@.", (uint8_t *)&v29, 0xCu);
        }

        v24 = objc_msgSend(v15, "state");
        v21 = self;
        v22 = v10;
        v23 = 1;
LABEL_16:
        -[TPSCallingLineIdRestrictionRequestController respondWithSubscriptionContext:editable:state:error:](v21, "respondWithSubscriptionContext:editable:state:error:", v22, v23, v24, 0);
        break;
      case 4:
        +[TPSResponseError errorWithCode:userInfo:](TPSResponseError, "errorWithCode:userInfo:", 4, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        TPSLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:].cold.3();
LABEL_19:

        -[TPSCallingLineIdRestrictionRequestController respondWithSubscriptionContext:editable:state:error:](self, "respondWithSubscriptionContext:editable:state:error:", v10, 0, 0, v26);
        break;
      default:
        TPSLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:].cold.1(a4, v25);

        break;
    }

  }
}

- (void)suppServicesEvent:(int)a1 event:(NSObject *)a2 settingsType:data:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB4B7000, a2, OS_LOG_TYPE_ERROR, "Event type %u is not recognized as a valid call waiting request event.", (uint8_t *)v2, 8u);
}

- (void)suppServicesEvent:event:settingsType:data:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB4B7000, v0, v1, "Calling Line ID Restriction fetch request failed with error %@ for %@.");
}

- (void)suppServicesEvent:event:settingsType:data:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB4B7000, v0, v1, "Calling Line ID Restriction save request failed with error %@ for %@.");
}

@end
