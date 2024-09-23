@implementation SidecarTransferDequeueMessages

void __SidecarTransferDequeueMessages_block_invoke(uint64_t a1)
{
  int v1;
  void *v3;
  uint64_t v4;
  id v5;
  void **AssociatedObject;
  void **v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  _QWORD v18[6];

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
  if (v1 <= 0)
  {
    v3 = 0;
    v4 = MEMORY[0x24BDAC760];
    while (1)
    {
      v5 = *(id *)(a1 + 32);
      AssociatedObject = (void **)objc_getAssociatedObject(v5, SidecarTransferMessageEnqueue);
      if (AssociatedObject)
      {
        v7 = AssociatedObject;
        v8 = (void **)*AssociatedObject;
        if (!v8)
        {
          __break(1u);
          return;
        }
        v10 = *v8;
        v9 = v8[1];
        *v7 = v9;
        if (!v9)
          v7[1] = v7;
        free(v8);
        if (!*v7)
          _SidecarAssociatedQueueDealloc(v5, SidecarTransferMessageEnqueue, v7);
      }
      else
      {
        v10 = 0;
      }

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "_resumeMessage:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
            v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          else
            v12 = &__block_literal_global_61;
          v13 = (void *)MEMORY[0x2207DCAD0](v12);
          v18[0] = v4;
          v18[1] = 3221225472;
          v18[2] = __SidecarTransferDequeueMessages_block_invoke_3;
          v18[3] = &unk_24E5E0BD0;
          v18[4] = v13;
          v18[5] = v11;
          v14 = MEMORY[0x2207DCAD0](v18);
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

        }
        v17 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
        v3 = v10;
        if (v17 < 1)
          continue;
      }

      return;
    }
  }
}

uint64_t __SidecarTransferDequeueMessages_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
