@implementation UIColor(UIKit_SiriUIFrameworkAdditions)

+ (uint64_t)siriui_lightTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (uint64_t)siriui_snippetBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.1);
}

+ (id)siriui_highlightColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)siriui_lightHighlightColor
{
  return objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, 0.1);
}

+ (id)siriui_maskingHighlightColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterMaskingHighlightColor");
  else
    objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, 0.2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_lightMaskingHighlightColor
{
  return objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, 0.2);
}

+ (id)siriui_platterMaskingHighlightColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)siriui_keylineColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterKeylineColor");
  else
    objc_msgSend(a1, "siriui_lightKeylineColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_lightKeylineColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.18);
}

+ (id)siriui_platterKeylineColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)siriui_maskingColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterMaskingColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_transparantButtonColor
{
  void *v0;
  _BOOL4 v1;
  double v2;

  v0 = (void *)MEMORY[0x24BDF6950];
  v1 = UIAccessibilityDarkerSystemColorsEnabled();
  v2 = 0.8;
  if (!v1)
    v2 = 0.6;
  return objc_msgSend(v0, "colorWithWhite:alpha:", 1.0, v2);
}

+ (uint64_t)siriui_transparantHighlightedButtonColor
{
  _BOOL4 v2;
  double v3;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = 0.4;
  if (!v2)
    v3 = 0.2;
  return objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, v3);
}

+ (uint64_t)siriui_lightMaskingColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.6);
}

+ (id)siriui_platterMaskingColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)siriui_glyphColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterGlyphColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_platterGlyphColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (id)siriui_textColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterTextColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_platterTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (id)siriui_linkTextColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterLinkTextColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.55);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)siriui_platterLinkTextColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.55);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)siriui_semiTransparentTextColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterSemiTransparentTextColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_semiTransparentLightTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
}

+ (id)siriui_platterSemiTransparentTextColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)siriui_textHighlightColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterTextHighlightColor");
  else
    objc_msgSend(a1, "siriui_lightTextHighlightColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)siriui_lightTextHighlightColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (uint64_t)siriui_platterTextHighlightColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (uint64_t)siriui_tapToEditColor
{
  _BOOL4 v0;
  double v1;

  v0 = UIAccessibilityDarkerSystemColorsEnabled();
  v1 = 0.314;
  if (v0)
    v1 = 0.510078431;
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v1, v1, v1, 1.0);
}

+ (uint64_t)siriui_tapToEditMaskingColor
{
  double v0;
  void *v1;
  double v2;

  if (UIAccessibilityDarkerSystemColorsEnabled())
    v0 = 0.510078431;
  else
    v0 = 0.314;
  v1 = (void *)MEMORY[0x24BDF6950];
  if (UIAccessibilityDarkerSystemColorsEnabled())
    v2 = 0.8;
  else
    v2 = 0.6;
  return objc_msgSend(v1, "colorWithRed:green:blue:alpha:", v0, v0, v0, v2);
}

+ (id)siriui_insertionPointColor
{
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) != 0)
    objc_msgSend(a1, "siriui_platterInsertionPointColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)siriui_platterInsertionPointColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)siriui_lightInsertionPointColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
}

+ (uint64_t)siriui_platterOverlayBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.6);
}

+ (uint64_t)siriui_platterOverlayDarkBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.1, 0.1, 0.1, 0.8);
}

+ (uint64_t)siriui_sashOverlayBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.956, 0.956, 0.956, 1.0);
}

+ (id)siriui_colorWithAceColor:()UIKit_SiriUIFrameworkAdditions
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF6950];
  v5 = (double)objc_msgSend(v3, "redValue") / 255.0;
  v6 = (double)objc_msgSend(v3, "greenValue") / 255.0;
  v7 = (double)objc_msgSend(v3, "blueValue") / 255.0;
  objc_msgSend(v3, "alpha");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "alpha");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v4, "colorWithRed:green:blue:alpha:", v5, v6, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "colorWithRed:green:blue:alpha:", v5, v6, v7, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (uint64_t)siriui_blendEffectColor
{
  _BOOL4 v0;
  double v1;

  v0 = UIAccessibilityDarkerSystemColorsEnabled();
  v1 = 0.596;
  if (v0)
    v1 = 0.792078431;
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v1, v1, v1, 1.0);
}

@end
