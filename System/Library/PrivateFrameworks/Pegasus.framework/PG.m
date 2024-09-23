@implementation PG

void __PG_dispatch_async_with_timeout_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD block[4];
  id v15;
  dispatch_semaphore_t v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PG_dispatch_async_with_timeout_block_invoke_2;
  block[3] = &unk_1E6230640;
  v17 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v18 = v22;
  v19 = v20;
  v15 = v5;
  v16 = v2;
  v6 = v2;
  dispatch_async(v4, block);
  v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
  dispatch_semaphore_wait(v6, v7);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __PG_dispatch_async_with_timeout_block_invoke_5;
  v9[3] = &unk_1E6230690;
  v12 = v22;
  v8 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 56);
  v13 = v20;
  dispatch_async(v8, v9);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __PG_dispatch_async_with_timeout_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PG_dispatch_async_with_timeout_block_invoke_3;
  v3[3] = &unk_1E6230618;
  v4 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __PG_dispatch_async_with_timeout_block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  id v2;
  __int128 v3;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PG_dispatch_async_with_timeout_block_invoke_4;
  block[3] = &unk_1E62305F0;
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  dispatch_async(v1, block);

}

intptr_t __PG_dispatch_async_with_timeout_block_invoke_4(intptr_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  }
  return result;
}

void __PG_dispatch_async_with_timeout_block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PG_dispatch_async_with_timeout_block_invoke_6;
  v5[3] = &unk_1E6230668;
  v2 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v7 = v4;
  dispatch_async(v2, v5);

}

uint64_t __PG_dispatch_async_with_timeout_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

@end
