@implementation UIColor(VideosUI)

+ (id)vui_opacityColorWithType:()VideosUI
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__UIColor_VideosUI__vui_opacityColorWithType___block_invoke;
  v4[3] = &__block_descriptor_48_e36___UIColor_16__0__UITraitCollection_8l;
  v4[4] = a1;
  v4[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)vui_secondaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)vui_primaryDynamicBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)vui_keyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)vui_windowBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (id)vui_blendWithColor:()VideosUI percentage:
{
  double v5;
  double v6;
  id v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = fmax(a2, 0.0);
  if (v5 <= 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  v16 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  v7 = a4;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
  objc_msgSend(v7, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v6 * v12 + v16 * (1.0 - v6), v6 * v11 + v15 * (1.0 - v6), v6 * v10 + v14 * (1.0 - v6), v6 * v9 + v13 * (1.0 - v6));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)vui_separatorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

+ (uint64_t)vui_primaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)vui_imageHighlightColor
{
  if (vui_imageHighlightColor_onceToken != -1)
    dispatch_once(&vui_imageHighlightColor_onceToken, &__block_literal_global_2_0);
  return (id)vui_imageHighlightColor___imageHighlightColor;
}

+ (id)vui_imageBorderColor
{
  if (vui_imageBorderColor_onceToken != -1)
    dispatch_once(&vui_imageBorderColor_onceToken, &__block_literal_global_51);
  return (id)vui_imageBorderColor___imageBorderColor;
}

+ (uint64_t)vui_secondaryDynamicBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (uint64_t)vui_tertiaryDynamicBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
}

+ (uint64_t)vui_secondaryFillColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryFillColor");
}

+ (uint64_t)vui_tertiaryFillColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_tertiaryFillColor");
}

+ (id)vui_opacityColorWithType:()VideosUI userInterfaceStyle:
{
  double v4;
  void *v5;
  double v6;

  v4 = 0.0;
  if (a4 == 2)
  {
    if (a3 <= 2)
      v4 = dbl_1DA1C1E30[a3];
    v5 = (void *)MEMORY[0x1E0DC3658];
    v6 = 1.0;
  }
  else
  {
    if (a3 <= 2)
      v4 = dbl_1DA1C1E48[a3];
    v5 = (void *)MEMORY[0x1E0DC3658];
    v6 = 0.0;
  }
  objc_msgSend(v5, "colorWithWhite:alpha:", v6, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vui_keyBlueHighlightedColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)vui_opaqueSeparatorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
}

+ (id)vui_progressBarFillColor
{
  if (vui_progressBarFillColor_onceToken[0] != -1)
    dispatch_once(vui_progressBarFillColor_onceToken, &__block_literal_global_3_0);
  return (id)vui_progressBarFillColor___fillColor;
}

+ (id)vui_dynamicColorWithLightColor:()VideosUI darkColor:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3658];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__UIColor_VideosUI__vui_dynamicColorWithLightColor_darkColor___block_invoke;
  v12[3] = &unk_1E9F9CA60;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "colorWithDynamicProvider:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
