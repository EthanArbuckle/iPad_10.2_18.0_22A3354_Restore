@implementation PXMomentSharePresentFailureForAction

void __PXMomentSharePresentFailureForAction_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)a1[6];
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __PXMomentSharePresentFailureForAction_block_invoke_2;
    aBlock[3] = &unk_1E5148A40;
    v16 = v10;
    v11 = _Block_copy(aBlock);

  }
  else
  {
    v11 = 0;
  }
  v13 = (void *)a1[4];
  v12 = (void *)a1[5];
  PLSharingGetLog();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PXConfigureAndPresentFailureAlert(v7, v8, v13, v12, v11, v14, v9, &__block_literal_global_301_159357);

}

uint64_t __PXMomentSharePresentFailureForAction_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PXMomentSharePresentFailureForAction_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setComponent:", 11);
  objc_msgSend(v2, "setClassification:", 7);

}

@end
