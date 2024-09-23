@implementation UISegmentedControlDefaultStyleProvider

- (BOOL)useGeneratedImages
{
  return 1;
}

- (BOOL)usesContinuousCurveCorners
{
  return 1;
}

- (double)dividerWidthForControlSize:(int)a3
{
  return 1.0;
}

- (UIVibrancyEffect)unselectedSegmentContentDefaultVibrancyEffect
{
  return 0;
}

- (UIVibrancyEffect)selectedSegmentContentDefaultVibrancyEffect
{
  return 0;
}

- (BOOL)useTVStyleFocusSelection
{
  return 0;
}

- (BOOL)useSelectionIndicatorStyling
{
  return 1;
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a4)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a3, "_disabledColor", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (double)selectionIndicatorInsetForControlSize:(int)a3
{
  return 2.0;
}

- (BOOL)limitInternalLayoutAndInteractionToDefaultHeight
{
  return 0;
}

- (double)defaultTextContentPaddingWidth
{
  return 4.0;
}

- (UIEdgeInsets)contentInsetsForControlSize:(int)a3 position:(unsigned int)a4 bounds:(CGRect)a5 traitCollection:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  double result;

  result = 32.0;
  if (a3 == 1)
    return 26.0;
  return result;
}

- (id)createSegmentBezelView
{
  return 0;
}

- (double)defaultContentPaddingWidth
{
  return 9.0;
}

- (double)cornerRadiusForControlSize:(int)a3
{
  double result;

  result = 8.0;
  if (a3 == 1)
    return 6.0;
  return result;
}

- (BOOL)hasShadowWithSelectedSegmentEffect
{
  return 0;
}

- (BOOL)animateSlidingSelectionByDefault
{
  return 1;
}

- (double)segmentHidingFinalScaleFactor
{
  return 0.88;
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  double v4;
  double *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  if (a3 <= 2)
    v4 = dbl_186684E10[a3];
  v5 = (double *)off_1E167DC68;
  if (!a4)
    v5 = (double *)off_1E167DC70;
  v6 = *v5;
  v7 = *(_QWORD *)off_1E167DC48;
  v18[0] = *(_QWORD *)off_1E167DC38;
  v8 = *(_QWORD *)off_1E167DC80;
  v17[0] = v7;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = *MEMORY[0x1E0CA8348];
  v18[1] = v9;
  v18[2] = &unk_1E1A9ACC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)off_1E167DC10;
  v16 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)supportsDynamicTypeByDefault
{
  return 0;
}

- (UIVibrancyEffect)selectedSegmentDefaultVibrancyEffect
{
  return 0;
}

- (UIBlurEffect)selectedSegmentDefaultBlurEffect
{
  return 0;
}

- (BOOL)hasTransparentBackgroundByDefault
{
  return 0;
}

- (double)defaultInterSegmentSpacing
{
  return 0.0;
}

- (UIColor)defaultBackgroundTintColor
{
  return 0;
}

- (id)createBackdropView
{
  return 0;
}

- (double)segmentSelectionScaleFactor
{
  return 0.95;
}

- (BOOL)supportsAXPopover
{
  return 1;
}

- (id)createSelectedSegmentEffectShadowView
{
  return 0;
}

- (double)mostlyInsideMargin
{
  return 70.0;
}

- (BOOL)maskToCornerRadius
{
  return 1;
}

- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = 0.0;
  v5 = 0.0;
  v6 = 1.0;
  v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4 traitCollection:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 1.0;
  v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

@end
