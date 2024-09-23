@implementation SidecarRequestDisconnectSession

void __SidecarRequestDisconnectSession_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __SidecarRequestDisconnectSession_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *log;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      log = v3;
      v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      v3 = log;
      if (v4)
      {
        objc_msgSend(v2, "domain");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v2, "code");
        objc_msgSend(v2, "localizedDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v10 = v5;
        v11 = 2048;
        v12 = v6;
        v13 = 2113;
        v14 = v7;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v3 = log;
      }
    }

  }
}

@end
