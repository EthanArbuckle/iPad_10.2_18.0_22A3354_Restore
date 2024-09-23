@implementation SBXXInterruptKeybagRefetch

void ___SBXXInterruptKeybagRefetch_block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)SBApp, "isKeybagRefetchTransactionActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interruptKeybagRefetch from %@"), *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = SBWorkspaceInterruptBusynessIfPossible(v2);

    if ((v3 & 1) != 0)
      return;
    SBLogWorkspace();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BSPrettyFunctionName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v7 = "%{public}@ - failed to interrupt keybag refetch (requested from %{public}@)";
LABEL_7:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, v7, buf, 0x16u);

    }
  }
  else
  {
    SBLogWorkspace();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BSPrettyFunctionName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v8;
      v7 = "%{public}@ - no keybag refetch active (requested from %{public}@)";
      goto LABEL_7;
    }
  }

}

@end
