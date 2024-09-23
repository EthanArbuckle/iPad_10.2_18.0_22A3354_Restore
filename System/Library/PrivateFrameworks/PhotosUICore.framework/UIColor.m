@implementation UIColor

void __49__UIColor_PhotosUICore__px_dynamicHighlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_3_116958);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_dynamicHighlightColor_color;
  px_dynamicHighlightColor_color = v0;

}

id __49__UIColor_PhotosUICore__px_dynamicHighlightColor__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.980392157, 0.666666667, 0.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __46__UIColor_PhotosUICore__px_messagesBubbleGray__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.149019608;
    v3 = 0.160784314;
  }
  else
  {
    v2 = 0.91372549;
    v3 = 0.917647059;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
