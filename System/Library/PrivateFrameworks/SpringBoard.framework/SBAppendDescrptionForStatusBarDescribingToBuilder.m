@implementation SBAppendDescrptionForStatusBarDescribingToBuilder

void ___SBAppendDescrptionForStatusBarDescribingToBuilder_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "statusBarPartStyles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___SBAppendDescrptionForStatusBarDescribingToBuilder_block_invoke_2;
  v3[3] = &unk_1E8EA7C98;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void ___SBAppendDescrptionForStatusBarDescribingToBuilder_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  _SBStringFromStatusBarStyle(objc_msgSend(v10, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", v9, v5, 1);
}

@end
