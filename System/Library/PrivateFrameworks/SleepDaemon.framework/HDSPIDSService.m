@implementation HDSPIDSService

+ (id)localServiceWithScheduler:(id)a3
{
  id v3;
  _HDSPIDSService *v4;

  v3 = a3;
  v4 = -[_HDSPIDSService initWithIsCloudService:scheduler:]([_HDSPIDSService alloc], "initWithIsCloudService:scheduler:", 0, v3);

  return v4;
}

+ (id)cloudServiceWithScheduler:(id)a3
{
  id v3;
  _HDSPIDSService *v4;

  v3 = a3;
  v4 = -[_HDSPIDSService initWithIsCloudService:scheduler:]([_HDSPIDSService alloc], "initWithIsCloudService:scheduler:", 1, v3);

  return v4;
}

void __64___HDSPIDSService__sendSerializedMessage_identifier_completion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[24])
    objc_msgSend(v2, "_cloudDestinations");
  else
    objc_msgSend(v2, "_localDestinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v5;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] destinations: %{public}@", buf, 0x16u);

  }
  v6 = MEMORY[0x24BDBD1C8];
  v7 = *MEMORY[0x24BE4FAA8];
  v31[0] = *MEMORY[0x24BE4FA90];
  v31[1] = v7;
  v32[0] = MEMORY[0x24BDBD1C8];
  v32[1] = MEMORY[0x24BDBD1C8];
  v31[2] = *MEMORY[0x24BE4FAC0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE4FA70];
  v32[2] = v8;
  v32[3] = v6;
  v10 = *MEMORY[0x24BE4FB18];
  v31[3] = v9;
  v31[4] = v10;
  v32[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loggingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    v29 = 2114;
    v30 = v11;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueuing message %{public}@ with options %{public}@", buf, 0x20u);

  }
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v16 = *(_QWORD *)(a1 + 48);
  v23 = 0;
  v24 = 0;
  v17 = objc_msgSend(v15, "sendMessage:toDestinations:priority:options:identifier:error:", v16, v3, 300, v11, &v24, &v23);
  v18 = v24;
  v19 = v23;
  HKSPLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v17)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 32), "_loggingDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v22;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_21610C000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] failed to enqueue message %{public}@ with error %{public}@", buf, 0x20u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loggingDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v22;
    v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully enqueued message %{public}@", buf, 0x16u);
LABEL_11:

  }
LABEL_13:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __37___HDSPIDSService__cloudDestinations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isActive"))
    v3 = objc_msgSend(v2, "isDefaultPairedDevice") ^ 1;
  else
    v3 = 1;

  return v3;
}

id __37___HDSPIDSService__cloudDestinations__block_invoke_2()
{
  return (id)IDSCopyIDForDevice();
}

@end
