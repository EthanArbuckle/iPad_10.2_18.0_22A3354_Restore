@implementation UITextKitTextRange

void __37___UITextKitTextRange_unionTextRange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  v10 = v3;
  if (v5)
  {
    objc_msgSend(v5, "textRangeByFormingUnionWithTextRange:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = v3;
    v8 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v9;
  }

}

@end
