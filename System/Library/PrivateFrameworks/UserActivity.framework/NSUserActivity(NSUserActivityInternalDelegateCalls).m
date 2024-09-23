@implementation NSUserActivity(NSUserActivityInternalDelegateCalls)

- (uint64_t)_supportsSynchronizeActivityWithTimeout
{
  void *v1;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "delegate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(a1, "_frameworkDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_frameworkDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  else
  {
    v4 = 0;
  }

  if (v3)
    goto LABEL_8;
LABEL_9:

  return v4 & 1;
}

- (BOOL)doSaveUserActivityWithTimeout:()NSUserActivityInternalDelegateCalls isCurrent:withCompletionHandler:
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD block[5];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  double v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  double v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _uaGetLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "_internalUserActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v12;
    v42 = 2050;
    v43 = a2;
    v44 = 1024;
    v45 = a4;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@ timeout=%{public}f isCurrent=%{BOOL}d", buf, 0x1Cu);

  }
  if (v8)
  {
    objc_msgSend(a1, "_frameworkDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _uaGetLogForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a1, "_internalUserActivity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v18;
          _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@ delegate supports _userActivityWillSave:... so calling that.", buf, 0xCu);

        }
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke;
        v34[3] = &unk_1E6007FF0;
        v34[4] = a1;
        v39 = a4;
        v38 = a2;
        v35 = v13;
        v36 = v15;
        v37 = v8;
        v19 = v15;
        objc_msgSend(v14, "_userActivityWillSave:isCurrent:timeout:withCompletionHandler:", a1, a4, v34, a2);

        goto LABEL_23;
      }
      if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "userActivityWillSave:", a1);
        goto LABEL_16;
      }
    }
    else
    {
      if (!v13)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB3B10]);
        objc_msgSend(a1, "_internalUserActivity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copyWithNewUUID:", 0);
        v24 = (void *)objc_msgSend(v25, "initWithInternalUserActivity:", v27);

        goto LABEL_22;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
LABEL_16:
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_2;
        v32[3] = &unk_1E6007FC8;
        v33 = v8;
        objc_msgSend(v13, "_userActivityWillSave:isCurrent:timeout:withCompletionHandler:", a1, a4, v32, a2);
        v20 = v33;
LABEL_20:

LABEL_23:
        goto LABEL_24;
      }
    }
    if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_3;
      block[3] = &unk_1E6007DC8;
      block[4] = a1;
      v31 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v20 = v31;
      goto LABEL_20;
    }
    objc_msgSend(a1, "willSynchronizeActivity");
    v21 = objc_alloc(MEMORY[0x1E0CB3B10]);
    objc_msgSend(a1, "_internalUserActivity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copyWithNewUUID:", 0);
    v24 = (void *)objc_msgSend(v21, "initWithInternalUserActivity:", v23);

    objc_msgSend(a1, "didSynchronizeActivity");
LABEL_22:
    (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v24, 0);

    goto LABEL_23;
  }
LABEL_24:

  return v8 != 0;
}

@end
