@implementation UITextLayoutDrawRangeInContext

uint64_t ___UITextLayoutDrawRangeInContext_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[9];

  v3 = a2;
  objc_msgSend(v3, "rangeInElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v3, "layoutFragmentFrame");
    v9 = v8;
    v11 = v10;
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v4, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "offsetFromLocation:toLocation:", v13, v14);

    v16 = *(void **)(a1 + 40);
    objc_msgSend(v4, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "offsetFromLocation:toLocation:", v17, v18) - v15;

    objc_msgSend(v3, "textLineFragments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = ___UITextLayoutDrawRangeInContext_block_invoke_2;
    v22[3] = &__block_descriptor_72_e35_v32__0__NSTextLineFragment_8Q16_B24l;
    v22[4] = v15;
    v22[5] = v19;
    v22[6] = v9;
    v22[7] = v11;
    v22[8] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v22);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void ___UITextLayoutDrawRangeInContext_block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;
  NSRange v6;

  v5 = a2;
  v6.location = objc_msgSend(v5, "characterRange");
  if (NSIntersectionRange(v6, *(NSRange *)(a1 + 32)).length)
  {
    objc_msgSend(v5, "typographicBounds");
    objc_msgSend(v5, "drawAtPoint:inContext:", *(_QWORD *)(a1 + 64), *(double *)(a1 + 48) + v3, v4 + *(double *)(a1 + 56));
  }

}

@end
