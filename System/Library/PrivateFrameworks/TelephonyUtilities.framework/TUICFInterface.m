@implementation TUICFInterface

+ (id)allowCallForDestinationID:(id)a3 providerIdentifier:(id)a4
{
  id v6;
  id v7;
  TUICFQueryResult *v8;
  dispatch_semaphore_t v9;
  TUICFQueryResult *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  NSObject *v14;
  TUICFQueryResult *v15;
  __int16 v17[8];
  _QWORD v18[4];
  TUICFQueryResult *v19;
  NSObject *v20;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(TUICFQueryResult);
  v9 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__TUICFInterface_allowCallForDestinationID_providerIdentifier___block_invoke;
  v18[3] = &unk_1E38A4330;
  v10 = v8;
  v19 = v10;
  v11 = v9;
  v20 = v11;
  objc_msgSend(a1, "allowCallForDestinationID:providerIdentifier:queue:completionHandler:", v7, v6, 0, v18);

  v12 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 0;
      _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Timed out waiting for ICFCallProviderShouldAllowIncomingCall(). Defaulting to allowCall=YES, fromBlockList=NO", (uint8_t *)v17, 2u);
    }

    -[TUICFQueryResult setAllowCallForDestinationID:](v10, "setAllowCallForDestinationID:", 1);
    -[TUICFQueryResult setFromBlockList:](v10, "setFromBlockList:", 0);
  }
  v14 = v20;
  v15 = v10;

  return v15;
}

intptr_t __63__TUICFInterface_allowCallForDestinationID_providerIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowCallForDestinationID:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setFromBlockList:", a3);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)allowCallForDestinationID:(id)a3 providerIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v6;
  id v7;

  v7 = a6;
  v6 = v7;
  ICFCallProviderShouldAllowIncomingCallWithQueue();

}

uint64_t __87__TUICFInterface_allowCallForDestinationID_providerIdentifier_queue_completionHandler___block_invoke(uint64_t a1, int a2, int a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0, a3 != 0);
}

@end
