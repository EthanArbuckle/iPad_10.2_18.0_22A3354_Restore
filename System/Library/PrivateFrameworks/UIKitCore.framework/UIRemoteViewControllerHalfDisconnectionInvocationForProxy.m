@implementation UIRemoteViewControllerHalfDisconnectionInvocationForProxy

void ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD aBlock[6];
  _QWORD v26[4];
  int v27;
  _QWORD v28[3];
  char v29;

  v3 = a2;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2810000000;
  v26[3] = &unk_18685B0AF;
  v27 = 0;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_2;
  aBlock[3] = &unk_1E16E8BD8;
  aBlock[4] = v26;
  aBlock[5] = v28;
  v5 = _Block_copy(aBlock);
  v6 = *(void **)(a1 + 32);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_3;
  v22[3] = &unk_1E16E8C00;
  v7 = v5;
  v23 = v7;
  v8 = v3;
  v24 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_4;
  v19[3] = &unk_1E16E8C28;
  v10 = v7;
  v20 = v10;
  v11 = v8;
  v21 = v11;
  objc_msgSend(v9, "__prepareForDisconnectionWithCompletionHandler:", v19);

  v12 = dispatch_time(0, 1000000000);
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_5;
  block[3] = &unk_1E16B6740;
  v17 = v10;
  v18 = v11;
  v14 = v11;
  v15 = v10;
  dispatch_after(v12, v13, block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

void ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (**v4)(void);

  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
    if (v4)
      v4[2]();
  }

}

uint64_t ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_6;
  v2[3] = &unk_1E16B1BF8;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
