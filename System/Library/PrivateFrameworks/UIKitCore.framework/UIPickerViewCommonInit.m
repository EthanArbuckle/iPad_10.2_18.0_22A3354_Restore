@implementation UIPickerViewCommonInit

void ___UIPickerViewCommonInit_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  +[UIColor labelColor](UIColor, "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setTextColor:", v3);

  v4 = *(void **)(a1 + 32);
  +[UIColor labelColor](UIColor, "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.198);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMagnifierLineColor:", v5);

}

void ___UIPickerViewCommonInit_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[UIColor clearColor](UIColor, "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

@end
