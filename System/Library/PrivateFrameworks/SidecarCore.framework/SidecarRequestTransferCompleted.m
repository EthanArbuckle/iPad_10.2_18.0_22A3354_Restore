@implementation SidecarRequestTransferCompleted

void __SidecarRequestTransferCompleted_block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;

  v2 = (id *)*(id *)(*(_QWORD *)(a1 + 32) + 96);
  if (v2)
  {
    v8 = v2;
    SidecarMapTableRemoveObject(v2, objc_msgSend(*(id *)(a1 + 40), "transferID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    v2 = v8;
    if (v3 == v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
      v5 = objc_msgSend(v8[2], "count");
      v2 = v8;
      if (!v5)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 96);
        *(_QWORD *)(v6 + 96) = 0;

        v2 = v8;
      }
    }
  }

}

@end
