@implementation _UIPickerViewStyle

- (CGSize)defaultSizeForTraitCollection:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forTraitCollection:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)sizeIsValid:(CGSize)a3
{
  return 1;
}

- (double)defaultRowHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (double)paddingBetweenWheels
{
  return 0.0;
}

- (double)paddingAroundWheels
{
  return 0.0;
}

- (CATransform3D)perspectiveTransform
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = (_OWORD *)MEMORY[0x1E0CD2610];
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v4;
  v5 = v3[7];
  *(_OWORD *)&retstr->m41 = v3[6];
  *(_OWORD *)&retstr->m43 = v5;
  v6 = v3[1];
  *(_OWORD *)&retstr->m11 = *v3;
  *(_OWORD *)&retstr->m13 = v6;
  v7 = v3[3];
  *(_OWORD *)&retstr->m21 = v3[2];
  *(_OWORD *)&retstr->m23 = v7;
  return self;
}

- (CATransform3D)transformForCellAtY:(SEL)a3 inBounds:(double)a4 rowHeight:(CGRect)a5 selectionBarRect:(double)a6
{
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v7 = (_OWORD *)MEMORY[0x1E0CD2610];
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v8;
  v9 = v7[7];
  *(_OWORD *)&retstr->m41 = v7[6];
  *(_OWORD *)&retstr->m43 = v9;
  v10 = v7[1];
  *(_OWORD *)&retstr->m11 = *v7;
  *(_OWORD *)&retstr->m13 = v10;
  v11 = v7[3];
  *(_OWORD *)&retstr->m21 = v7[2];
  *(_OWORD *)&retstr->m23 = v11;
  return self;
}

- (double)horizontalBiasForEndTablesWithColumnFrame:(CGRect)a3 tableFrame:(CGRect)a4
{
  return 0.0;
}

- (void)configureMaskGradientLayer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIColor blackColor](UIColor, "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

- (id)createCenterHighlightView
{
  return 0;
}

- (double)horizontalPaddingForCenterHighlightView
{
  return 0.0;
}

- (double)verticalPaddingForCenterHighlightView
{
  return 0.0;
}

- (double)horizontalPaddingForContents
{
  return 0.0;
}

- (double)selectionBarSideInset
{
  return 0.0;
}

- (double)labelSideOffset
{
  return 0.0;
}

- (id)selectionFeedbackGeneratorConfiguration
{
  return +[_UISelectionFeedbackGeneratorConfiguration pickerConfiguration](_UISelectionFeedbackGeneratorConfiguration, "pickerConfiguration");
}

- (UIEdgeInsets)columnContentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -1.0;
  v3 = -1.0;
  v4 = -1.0;
  v5 = -1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)columnHighlightCornerRadius
{
  return 0.0;
}

- (void)_resetFontCacheForLegibilityWeightIfNeeded:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (_MergedGlobals_1302 != a3)
  {
    v3 = (void *)qword_1ECD82250;
    _MergedGlobals_1302 = a3;
    qword_1ECD82250 = 0;

    v4 = (void *)qword_1ECD82258;
    qword_1ECD82258 = 0;

    v5 = (void *)qword_1ECD82260;
    qword_1ECD82260 = 0;

    v6 = (void *)qword_1ECD82268;
    qword_1ECD82268 = 0;

  }
}

- (id)centerCellFontWithTraitCollection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", objc_msgSend(a3, "legibilityWeight"));
  v3 = (void *)qword_1ECD82250;
  if (!qword_1ECD82250)
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 23.5);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD82250;
    qword_1ECD82250 = v4;

    v3 = (void *)qword_1ECD82250;
  }
  return v3;
}

- (id)nonCenterCellFontWithTraitCollection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", objc_msgSend(a3, "legibilityWeight"));
  v3 = (void *)qword_1ECD82258;
  if (!qword_1ECD82258)
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 21.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD82258;
    qword_1ECD82258 = v4;

    v3 = (void *)qword_1ECD82258;
  }
  return v3;
}

- (id)centerCellDigitFontWithTraitCollection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", objc_msgSend(a3, "legibilityWeight"));
  v3 = (void *)qword_1ECD82260;
  if (!qword_1ECD82260)
  {
    objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 23.5, *(double *)off_1E167DC70);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD82260;
    qword_1ECD82260 = v4;

    v3 = (void *)qword_1ECD82260;
  }
  return v3;
}

- (id)nonCenterCellDigitFontWithTraitCollection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", objc_msgSend(a3, "legibilityWeight"));
  v3 = (void *)qword_1ECD82268;
  if (!qword_1ECD82268)
  {
    objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 21.0, *(double *)off_1E167DC70);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD82268;
    qword_1ECD82268 = v4;

    v3 = (void *)qword_1ECD82268;
  }
  return v3;
}

- (BOOL)highlightViewIsOverlay
{
  return 1;
}

- (void)setHighlightViewIsOverlay:(BOOL)a3
{
  self->_highlightViewIsOverlay = a3;
}

@end
