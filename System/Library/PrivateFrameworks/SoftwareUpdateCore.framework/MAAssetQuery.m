@implementation MAAssetQuery

void __78__MAAssetQuery_SUCoreBorderMAAssetQuery__SUCoreBorder_queryMetaDataWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA8988];
  v6 = a3;
  objc_msgSend(v5, "sharedSimulator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end:atFunction:", CFSTR("ma"), CFSTR("queryMetaDataWithError"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(MEMORY[0x1E0D4E050], "_SUCoreBorder_MAQueryResultAtEnd:withResult:withError:withCompletion:", v8, a2, v6, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __92__MAAssetQuery_SUCoreBorderMAAssetQuery___SUCoreBorder_MAQueryResultAtBegin_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

@end
