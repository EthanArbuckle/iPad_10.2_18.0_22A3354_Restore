@implementation IKViewElementStyle(TVMLKitAdditions)

- (TVViewElementStyle)tv_associatedViewElementStyle
{
  TVViewElementStyle *v2;

  objc_getAssociatedObject(a1, "TVAssociatedViewElementStyle");
  v2 = (TVViewElementStyle *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[TVViewElementStyle initWithStyle:]([TVViewElementStyle alloc], "initWithStyle:", a1);
    objc_setAssociatedObject(a1, "TVAssociatedViewElementStyle", v2, (void *)0x301);
  }
  return v2;
}

- (id)tv_styleMetrics
{
  return objc_getAssociatedObject(a1, sel_tv_styleMetrics);
}

- (void)tv_setStyleMetrics:()TVMLKitAdditions
{
  void *v4;
  id value;

  value = a3;
  objc_msgSend(value, "valuesByStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setOverridingValuesByStyle:", v4);

  objc_setAssociatedObject(a1, sel_tv_styleMetrics, value, (void *)1);
}

- (uint64_t)tv_edgeFlagForStyle:()TVMLKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (objc_msgSend(a1, "typeForStyle:", v4) == 7)
  {
    objc_msgSend(a1, "tv_styleMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForStyle:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = 15;
    else
      v7 = objc_msgSend(a1, "edgeFlagForStyle:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tv_transform
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("transform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "CGAffineTransformValue");
    v3 = v6;
  }
  else
  {
    v4 = MEMORY[0x24BDBD8B8];
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *a2 = *MEMORY[0x24BDBD8B8];
    a2[1] = v5;
    a2[2] = *(_OWORD *)(v4 + 32);
  }

}

- (void)tv_focusTransform
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-focus-transform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "CGAffineTransformValue");
    v3 = v6;
  }
  else
  {
    v4 = MEMORY[0x24BDBD8B8];
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *a2 = *MEMORY[0x24BDBD8B8];
    a2[1] = v5;
    a2[2] = *(_OWORD *)(v4 + 32);
  }

}

- (uint64_t)tv_fontFamily
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("font-family"));
}

- (double)tv_fontSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("font-size"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_height
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (BOOL)tv_hasHeight
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (double)tv_interitemSpacing
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-interitem-spacing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_lineSpacing
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-line-spacing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_maxHeight
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("max-height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_maxWidth
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("max-width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_minHeight
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("min-height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_minWidth
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("min-width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_transitionInterval
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-transition-interval"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_adjustsFontSizeToFitWidth
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-minimum-scale-factor"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (double)tv_minimumScaleFactor
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-minimum-scale-factor"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (double)tv_width
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (BOOL)tv_hasWidth
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)tv_backgroundColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("background-color"));
}

- (uint64_t)tv_backgroundHighlightStyle
{
  return objc_msgSend(a1, "valueForStyle:", CFSTR("tv-background-highlight-style"));
}

- (uint64_t)tv_backgroundHighlightColor
{
  return objc_msgSend(a1, "valueForStyle:", CFSTR("tv-background-highlight-color"));
}

- (uint64_t)tv_borderColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("border-color"));
}

- (uint64_t)tv_color
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("color"));
}

- (uint64_t)tv_highlightColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-highlight-color"));
}

- (uint64_t)tv_tintColor2
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-tint-color2"));
}

- (uint64_t)tv_tintColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-tint-color"));
}

- (uint64_t)tv_darkTintColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-dark-tint-color"));
}

- (uint64_t)tv_columnColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-column-color"));
}

- (double)tv_columnPadding
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-column-padding"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_textShadow
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("text-shadow"));
}

- (uint64_t)tv_textTransform
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("text-transform"));
}

- (uint64_t)tv_fontWeight
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("font-weight"));
}

- (uint64_t)tv_fontStretch
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("font-stretch"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("condensed")) & 1) != 0)
  {
    v3 = 64;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("expanded")))
  {
    v3 = 32;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)tv_imageTreatment
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-img-treatment"));
}

- (uint64_t)tv_textHighlightStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-text-highlight-style"));
}

- (uint64_t)tv_textStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-text-style"));
}

- (void)tv_textHyphenationFactor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-text-hyphenation-factor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-text-hyphenation-factor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  }
}

- (uint64_t)tv_transition
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-transition"));
}

- (uint64_t)tv_ratingStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-rating-style"));
}

- (uint64_t)tv_visualEffect
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-visual-effect"));
}

- (uint64_t)tv_textAlignment
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (tv_textAlignment_onceToken != -1)
    dispatch_once(&tv_textAlignment_onceToken, &__block_literal_global_46);
  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("text-align"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)tv_textAlignment_sAlignmentKeysMap, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 4;
  }

  return v4;
}

- (uint64_t)tv_columnCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("column-count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)tv_rowCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("row-count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)tv_maxTextLines
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-text-max-lines"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)tv_alignment
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (tv_alignment_onceToken != -1)
    dispatch_once(&tv_alignment_onceToken, &__block_literal_global_328);
  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-align"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)tv_alignment_sAlignmentKeysMap, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_position
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-position"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (tv_position_onceToken != -1)
    dispatch_once(&tv_position_onceToken, &__block_literal_global_334);
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend((id)tv_position_sPositionKeysMap, "objectForKeyedSubscript:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedIntegerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (double)tv_borderWidths
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("border-width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIEdgeInsetsValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_borderRadius
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("border-radius"));
}

- (uint64_t)tv_borderContinuous
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-border-continuous"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("true"));

  return v2;
}

- (double)tv_margin
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("margin"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIEdgeInsetsValue");
  v3 = v2;

  return v3;
}

- (BOOL)tv_hasFocusMargin
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-focus-margin"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (double)tv_focusMargin
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-focus-margin"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIEdgeInsetsValue");
  v3 = v2;

  return v3;
}

- (double)tv_padding
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("padding"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIEdgeInsetsValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_contentAlignment
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (tv_contentAlignment_onceToken != -1)
    dispatch_once(&tv_contentAlignment_onceToken, &__block_literal_global_373);
  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-content-align"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)tv_contentAlignment_sAlignmentKeysMap, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_searchStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-search-style"));
}

- (double)tv_imageUpscaleFactor
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-img-upscale-factor"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_shadow
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-shadow"));
}

- (uint64_t)tv_focusAlign
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-focus-align"));
}

- (double)tv_focusSizeIncrease
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-focus-size-increase"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_progressStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-progress-style"));
}

- (uint64_t)tv_overflow
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-overflow"));
}

- (uint64_t)tv_acceptsFocus
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-accepts-focus"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)tv_highlightStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-highlight-style"));
}

- (uint64_t)tv_scrollMode
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-scroll-mode"));
}

- (double)tv_scrollableBoundsInset
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-scrollable-bounds-inset"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIEdgeInsetsValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_layerFlipMode
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-layer-flip-mode"));
}

- (uint64_t)tv_indexDisplayMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForStyle:", CFSTR("tv-index-display"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("hidden")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("visible")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)tv_maxLines
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-max-lines"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)tv_group
{
  return objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-group"));
}

- (double)tv_symbolPointSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-symbol-point-size"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_symbolWeight
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (tv_symbolWeight_onceToken != -1)
    dispatch_once(&tv_symbolWeight_onceToken, &__block_literal_global_374);
  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-symbol-weight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_symbolScale
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (tv_symbolScale_onceToken != -1)
    dispatch_once(&tv_symbolScale_onceToken, &__block_literal_global_375);
  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-symbol-scale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)tv_symbolScale_sSymbolScaleMap, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)tv_symbolTextStyle
{
  void *v2;
  void *v3;

  if (tv_symbolTextStyle_onceToken != -1)
    dispatch_once(&tv_symbolTextStyle_onceToken, &__block_literal_global_381);
  objc_msgSend(a1, "tv_valueForStyle:", CFSTR("tv-symbol-text-style"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
