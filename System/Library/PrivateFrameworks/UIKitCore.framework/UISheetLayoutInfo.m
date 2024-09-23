@implementation UISheetLayoutInfo

double __36___UISheetLayoutInfo__activeDetents__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "objectAtIndexedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_value");
  v4 = v3;

  return v4;
}

void __36___UISheetLayoutInfo__preferredSize__block_invoke()
{
  id v0;

  objc_msgSend(off_1E167A828, "defaultFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  qword_1ECD7D410 = __UIViewReadableWidthForFont(v0);

}

void __36___UISheetLayoutInfo__activeDetents__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D420;
  qword_1ECD7D420 = v0;

}

BOOL __36___UISheetLayoutInfo__activeDetents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "_value");
  v7 = v6;
  objc_msgSend(v5, "_value");
  v9 = v8;

  if (v4)
    return v7 < v9;
  else
    return v7 > v9;
}

@end
