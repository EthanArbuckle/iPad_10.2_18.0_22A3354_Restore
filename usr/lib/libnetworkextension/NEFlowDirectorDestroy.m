@implementation NEFlowDirectorDestroy

void __NEFlowDirectorDestroy_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[6];

  v2 = *(_QWORD **)(a1 + 40);
  v3 = (const void *)v2[16];
  if (v3)
  {
    _Block_release(v3);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v4 = (const void *)v2[17];
  if (v4)
  {
    _Block_release(v4);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v5 = (const void *)v2[18];
  if (v5)
  {
    _Block_release(v5);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v6 = (const void *)v2[19];
  if (v6)
  {
    _Block_release(v6);
    v2 = *(_QWORD **)(a1 + 40);
  }
  *((_OWORD *)v2 + 8) = 0u;
  *((_OWORD *)v2 + 9) = 0u;
  v7 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_14;
  v8 = *(NSObject **)(v7 + 8);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    dispatch_retain(*(dispatch_object_t *)(v7 + 8));
    block[0] = v9;
    block[1] = 0x40000000;
    block[2] = __NEFlowDirectorDestroy_block_invoke_2;
    block[3] = &unk_24C09FFE8;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v8;
    dispatch_async(v8, block);
    v7 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)v7)
  {
    nw_queue_context_async_if_needed();
    v7 = *(_QWORD *)(a1 + 40);
LABEL_14:
    if (*(_QWORD *)v7)
    {
      nw_release(*(void **)v7);
      **(_QWORD **)(a1 + 40) = 0;
      v7 = *(_QWORD *)(a1 + 40);
    }
  }
  v10 = *(NSObject **)(v7 + 8);
  if (v10)
  {
    dispatch_release(v10);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = 0;
    v7 = *(_QWORD *)(a1 + 40);
  }
  dispatch_release(*(dispatch_object_t *)(v7 + 16));
}

void __NEFlowDirectorDestroy_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t __NEFlowDirectorDestroy_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
