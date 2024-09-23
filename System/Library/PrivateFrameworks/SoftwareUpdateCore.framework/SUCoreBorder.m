@implementation SUCoreBorder

void __SUCoreBorder_MAPurgeAll_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  id v10;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  _SUCoreBorder_MAFunctionAtEnd(CFSTR("MAPurgeAll"), &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(id *)(v6 + 40);
    _SUCoreBorder_MASimulate(v5, &v10);
    objc_storeStrong((id *)(v6 + 40), v10);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_6:
      v8();
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_6;
    }
  }

}

@end
