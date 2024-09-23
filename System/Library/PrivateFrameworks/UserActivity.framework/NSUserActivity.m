@implementation NSUserActivity

void __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void (*v15)(_QWORD *, void *, id, id, _QWORD *);
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = *(void **)(a1 + 32);
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "_internalUserActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadUpdateBlockForIdentifier:", v10);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_internalUserActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke_2;
  v17[3] = &unk_1E6007740;
  v18 = v8;
  v15 = (void (*)(_QWORD *, void *, id, id, _QWORD *))v13[2];
  v16 = v8;
  v15(v13, v14, v11, v10, v17);

}

uint64_t __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, id, uint64_t, _QWORD *);
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = a3;
  objc_msgSend(a2, "parentUserActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke_2;
  v15[3] = &unk_1E6007790;
  v16 = v8;
  v13 = *(void (**)(uint64_t, void *, id, uint64_t, _QWORD *))(v9 + 16);
  v14 = v8;
  v13(v9, v11, v10, v12, v15);

}

uint64_t __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__NSUserActivity_UAUserActivityAdditions___forceSave__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  char v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "_internalUserActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(id *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    if (v11 == v5)
      v12 = "";
    else
      v12 = "(new-allocation)";
    v28 = 2082;
    v29 = v12;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@ (%{public}s, error=%{public}@", buf, 0x20u);

  }
  if (!v5 || v6)
  {
    v19 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v6);
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);
LABEL_19:

    goto LABEL_21;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
LABEL_20:
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v5, 0);
    goto LABEL_21;
  }
  v13 = objc_opt_respondsToSelector();
  v14 = *(void **)(a1 + 40);
  if ((v13 & 1) == 0)
  {
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "userActivityWillSave:", v5);
      v21 = objc_alloc(MEMORY[0x1E0CB3B10]);
      objc_msgSend(v5, "_internalUserActivity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copyWithNewUUID:", 0);
      v20 = (void *)objc_msgSend(v21, "initWithInternalUserActivity:", v23);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 40), "didSynchronizeActivity");
      (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v20, 0);
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v15 = *(unsigned __int8 *)(a1 + 72);
  v16 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
  v18 = v16 - v17;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_56;
  v24[3] = &unk_1E6007FC8;
  v25 = *(id *)(a1 + 56);
  objc_msgSend(v14, "_userActivityWillSave:isCurrent:timeout:withCompletionHandler:", v5, v15, v24, v18);

LABEL_21:
}

uint64_t __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalidated");

  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "_internalUserActivity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "userActivity=%{public}@ was invalidated before we could get its information.", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "willSynchronizeActivity");
    v7 = objc_alloc(MEMORY[0x1E0CB3B10]);
    objc_msgSend(*(id *)(a1 + 32), "_internalUserActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithNewUUID:", 0);
    v10 = (id)objc_msgSend(v7, "initWithInternalUserActivity:", v9);

    objc_msgSend(*(id *)(a1 + 32), "didSynchronizeActivity");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
