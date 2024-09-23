@implementation TPSCallForwardingRequestController

- (void)executeRequest:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TPSCallForwardingRequestController executeSetForRequest:](self, "executeSetForRequest:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TPSCallForwardingRequestController executeFetchForRequest:](self, "executeFetchForRequest:", v4);
  }

}

- (void)executeFetchForRequest:(id)a3
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
  v7 = objc_msgSend(v4, "reason");
  v8 = objc_msgSend(v4, "callClass");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__TPSCallForwardingRequestController_executeFetchForRequest___block_invoke;
  v10[3] = &unk_1EA2CD8A0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "fetchCallForwardingValue:reason:callClass:completion:", v6, v7, v8, v10);

}

void __61__TPSCallForwardingRequestController_executeFetchForRequest___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v2, "respondWithSubscriptionContext:value:error:", v5, 0, v4);

  }
}

- (void)executeSetForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[TPSRequestController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__TPSCallForwardingRequestController_executeSetForRequest___block_invoke;
  v9[3] = &unk_1EA2CD8A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "saveCallForwardingValue:value:completion:", v6, v7, v9);

}

void __59__TPSCallForwardingRequestController_executeSetForRequest___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v2, "respondWithSubscriptionContext:value:error:", v5, 0, v4);

  }
}

- (void)respondWithSubscriptionContext:(id)a3 value:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  TPSCallForwardingResponse *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[TPSCallForwardingResponse initWithSubscriptionContext:error:value:]([TPSCallForwardingResponse alloc], "initWithSubscriptionContext:error:value:", v10, v8, v9);

  -[TPSRequestController postResponse:](self, "postResponse:", v11);
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  TPSCallForwardingRequestController *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (a5 == 1)
  {
    TPSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      TPSStringForCTSuppServicesEventType(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      TPSStringForCTSuppServicesSettingsType(1u);
      v14 = objc_claimAutoreleasedReturnValue();
      v24 = 138413058;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1DB4B7000, v12, OS_LOG_TYPE_DEFAULT, "Received event %@, settings type %@, data %@ for context %@.", (uint8_t *)&v24, 0x2Au);

    }
    -[TPSRequestController pendingRequest](self, "pendingRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a4)
    {
      case 1:
        if (v11)
        {
          -[TPSCallForwardingRequestController valueForNotificationData:](self, "valueForNotificationData:", v11);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        TPSLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412546;
          v25 = v15;
          v26 = 2112;
          v27 = v16;
          _os_log_impl(&dword_1DB4B7000, v23, OS_LOG_TYPE_DEFAULT, "Call forwarding fetch request succeeded for %@; value is %@.",
            (uint8_t *)&v24,
            0x16u);
        }

        goto LABEL_21;
      case 2:
        +[TPSResponseError errorWithCode:userInfo:](TPSResponseError, "errorWithCode:userInfo:", 2, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        TPSLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[TPSCallForwardingRequestController suppServicesEvent:event:settingsType:data:].cold.2();
        goto LABEL_16;
      case 3:
        TPSLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412290;
          v25 = v15;
          _os_log_impl(&dword_1DB4B7000, v18, OS_LOG_TYPE_DEFAULT, "Call forwarding save request succeeded for %@.", (uint8_t *)&v24, 0xCu);
        }

        objc_msgSend(v15, "value");
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v19 = self;
        v20 = v10;
        v21 = v16;
        v22 = 0;
        goto LABEL_22;
      case 4:
        +[TPSResponseError errorWithCode:userInfo:](TPSResponseError, "errorWithCode:userInfo:", 4, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        TPSLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[TPSCallForwardingRequestController suppServicesEvent:event:settingsType:data:].cold.3();
LABEL_16:

        v19 = self;
        v20 = v10;
        v21 = 0;
        v22 = v16;
LABEL_22:
        -[TPSCallForwardingRequestController respondWithSubscriptionContext:value:error:](v19, "respondWithSubscriptionContext:value:error:", v20, v21, v22);
        break;
      default:
        TPSLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[TPSCallForwardingRequestController suppServicesEvent:event:settingsType:data:].cold.1(a4, v16);
        break;
    }

  }
}

- (id)valueForNotificationData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CA6D08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "callClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClss:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v4, "enabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(v4, "callForwardingNoReplyTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNoReplyTime:", v8);

  objc_msgSend(v4, "callForwardingReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReason:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v4, "callForwardingNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSaveNumber:", v10);
  return v5;
}

- (void)suppServicesEvent:(int)a1 event:(NSObject *)a2 settingsType:data:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB4B7000, a2, OS_LOG_TYPE_ERROR, "Event type %u is not recognized as a valid call forwarding request event.", (uint8_t *)v2, 8u);
}

- (void)suppServicesEvent:event:settingsType:data:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB4B7000, v0, v1, "Call forwarding fetch request failed with error %@ for %@.");
}

- (void)suppServicesEvent:event:settingsType:data:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB4B7000, v0, v1, "Call forwarding save request failed with error %@ for %@.");
}

@end
