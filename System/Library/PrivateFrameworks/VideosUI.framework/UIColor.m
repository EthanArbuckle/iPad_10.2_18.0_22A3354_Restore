@implementation UIColor

void __44__UIColor_VideosUI__vui_imageHighlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.4, 0.4, 0.4, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vui_imageHighlightColor___imageHighlightColor;
  vui_imageHighlightColor___imageHighlightColor = v0;

}

void __41__UIColor_VideosUI__vui_imageBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.05);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vui_imageBorderColor___imageBorderColor;
  vui_imageBorderColor___imageBorderColor = v0;

}

uint64_t __46__UIColor_VideosUI__vui_opacityColorWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v3, "userInterfaceStyle");

  return objc_msgSend(v4, "vui_opacityColorWithType:userInterfaceStyle:", v5, v6);
}

void __45__UIColor_VideosUI__vui_progressBarFillColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.847058824, 0.847058824, 0.847058824, 0.4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vui_progressBarFillColor___fillColor;
  vui_progressBarFillColor___fillColor = v0;

}

id __62__UIColor_VideosUI__vui_dynamicColorWithLightColor_darkColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 1)
    v4 = 32;
  return *(id *)(a1 + v4);
}

@end
