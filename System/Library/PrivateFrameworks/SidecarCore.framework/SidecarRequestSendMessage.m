@implementation SidecarRequestSendMessage

void __SidecarRequestSendMessage_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(const char **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  if (v6)
  {
    if (v5)
      v7 = v4 == 0;
    else
      v7 = 1;
    if (v7)
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543875;
        v14 = v10;
        v15 = 2048;
        v16 = v11;
        v17 = 2113;
        v18 = v12;
        _os_log_impl(&dword_220044000, v9, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", (uint8_t *)&v13, 0x20u);

      }
    }
    else
    {
      _SidecarCoreLogObjCAPIError(v5, v4, v6);
    }

    SidecarRequestFinish(*(void **)(a1 + 32), v6);
  }
  else
  {

  }
}

@end
