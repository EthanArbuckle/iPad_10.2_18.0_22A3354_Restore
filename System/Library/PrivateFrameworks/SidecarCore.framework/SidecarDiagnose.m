@implementation SidecarDiagnose

void __SidecarDiagnose_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4 && !*v4)
  {
    v5 = v3;
    **(_QWORD **)(a1 + 32) = objc_retainAutorelease(v3);
    v3 = v5;
  }

}

void __SidecarDiagnose_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a2 && !v5)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a2, 0, 0, &v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
