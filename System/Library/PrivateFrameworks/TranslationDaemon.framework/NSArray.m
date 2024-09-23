@implementation NSArray

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_2;
  block[3] = &unk_251A11070;
  v7 = *(id *)(a1 + 64);
  v11 = v5;
  v8 = *(_QWORD *)(a1 + 72);
  v17 = a3;
  v15 = v7;
  v16 = v8;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v9 = v5;
  dispatch_async(v6, block);

}

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_3;
  v7[3] = &unk_251A11048;
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 80);
  v10 = v5;
  v12 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v4, v3, v7);

}

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_4;
    block[3] = &unk_251A11020;
    v8 = v5;
    v10 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v15 = v8;
    v18 = v9;
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 64);
    v16 = v11;
    v19 = v12;
    v17 = v13;
    dispatch_sync(v7, block);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
}

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v1);
  else
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
}

uint64_t __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = a1 + 40;
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40))
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, MEMORY[0x24BDBD1A8]);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
}

void __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke_2;
    v8[3] = &unk_251A110E8;
    v3 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 64);
    v9 = v4;
    v11 = v5;
    (*(void (**)(uint64_t, void *, _QWORD *))(v3 + 16))(v3, v2, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else
  {
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  }

}

@end
