@implementation SidecarSessionAddToLocalMapTable

void __SidecarSessionAddToLocalMapTable_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  do
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10[0] = 0;
    v10[1] = 0;
    objc_msgSend(v7, "getUUIDBytes:", v10);
    v8 = bswap32(v10[0]);
    SidecarMapTableGetObject((uint64_t)v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v9);
  SidecarMapTableReplaceObject(v3, v8, *(void **)(a1 + 32));

}

@end
