@implementation SidecarDevicesForService

void __SidecarDevicesForService_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  v5 = a2;
  v6 = a3;
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
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

@end
