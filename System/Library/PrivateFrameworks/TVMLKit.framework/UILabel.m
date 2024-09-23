@implementation UILabel

uint64_t __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke(uint64_t a1, double a2, double a3)
{
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfLines") < 2)
    return objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", a2, a3);
  else
    return objc_msgSend(*(id *)(a1 + 32), "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "numberOfLines"), 0.0, 0.0, a2, 3.40282347e38);
}

double __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke_2(uint64_t a1, double a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF65F8], 0, 0);
  }
  else
  {
    objc_msgSend(v6, "_defaultAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "numberOfLines");
  objc_msgSend(v8, "lineHeight");
  objc_msgSend(v8, "leading");

  return a2;
}

void __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v3 = a2;
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v13 = v3;
  objc_msgSend(v3, "capHeight");
  if (v4 < v5)
  {
    objc_msgSend(v13, "ascender");
    v7 = v6;
    objc_msgSend(v13, "capHeight");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v7 - v8;
    objc_msgSend(v13, "capHeight");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
  }
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  objc_msgSend(v13, "descender");
  if (v10 < -v11)
  {
    objc_msgSend(v13, "descender");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = -v12;
  }

}

uint64_t __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
