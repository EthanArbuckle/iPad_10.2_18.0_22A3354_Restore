@implementation SidecarRelayDelegateConduit

- (void)sendDataRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220044000, v8, OS_LOG_TYPE_INFO, "Sending a request to the relay delegate.", buf, 2u);
  }

  SidecarQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke;
  v12[3] = &unk_24E5E12B0;
  v13 = v5;
  v14 = v6;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke_2;
  v3[3] = &unk_24E5E1028;
  v4 = *(id *)(a1 + 40);
  SidecarRelayProxyAsync(0, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayDelegateSendDataRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__SidecarRelayDelegateConduit_sendDataRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *log;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to send a request to the relay delegate.  The error will be logged separately.", buf, 2u);
  }

  v6 = v3;
  if (v6)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      log = v9;
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      v9 = log;
      if (v10)
      {
        objc_msgSend(v6, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v16 = v11;
        v17 = 2048;
        v18 = v12;
        v19 = 2113;
        v20 = v13;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v9 = log;
      }
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);

}

@end
