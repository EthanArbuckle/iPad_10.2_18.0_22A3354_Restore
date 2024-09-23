@implementation _UIImageContentLayoutDrawingTarget

- (double)preferredContentScaleFactor
{
  return self->_preferredContentScaleFactor;
}

- (int64_t)contentMode
{
  return 0;
}

- (BOOL)_hasContentGravity
{
  return 0;
}

- (int64_t)semanticContentAttribute
{
  return 0;
}

- (id)_symbolConfigurationForSource:(id)a3
{
  return (id)objc_msgSend(a3, "symbolConfiguration");
}

- (BOOL)_layoutShouldFlipHorizontalOrientations
{
  return 1;
}

- (BOOL)_supportsContents
{
  return 0;
}

+ (id)targetWithSize:(double)a3 scale:
{
  uint64_t v6;

  objc_opt_self();
  v6 = objc_opt_new();
  if (v6)
  {
    *(_OWORD *)(v6 + 16) = *MEMORY[0x1E0C9D538];
    *(double *)(v6 + 32) = a1;
    *(double *)(v6 + 40) = a2;
    *(double *)(v6 + 8) = a3;
  }
  return (id)v6;
}

- (int64_t)_effectiveRenderingModeForSource:(id)a3 symbolConfiguration:(id)a4
{
  return objc_msgSend(a3, "_effectiveRenderingModeWithSymbolConfiguration:", a4);
}

- (UIEdgeInsets)_additionalAlignmentRectInsetsForRenderingSource:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_renditionForSource:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5 withRenditionResult:(id)a6
{
  id v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "_colorForFlattening");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (-[_UIImageContentLayoutDrawingTarget _effectiveRenderingModeForSource:symbolConfiguration:](self, "_effectiveRenderingModeForSource:symbolConfiguration:", v9, v10) != 2|| objc_msgSend(v10, "_hasSpecifiedHierarchicalColors")&& (objc_msgSend(v9, "_isHierarchicalColorSymbolImage") & 1) != 0)
    {
      goto LABEL_14;
    }
    if (objc_msgSend(v10, "_hasSpecifiedPaletteColors"))
    {
      objc_msgSend(v10, "_colors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v13, "count") > 1)
      {
        v14 = objc_msgSend(v9, "_isPaletteColorSymbolImage");

        v12 = 0;
        if (!v10 || (v14 & 1) != 0)
          goto LABEL_15;
LABEL_12:
        if (v10[7])
        {
          objc_msgSend(v10, "_colors");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
LABEL_14:
        v12 = 0;
        goto LABEL_15;
      }

    }
    if (!v10)
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_15:
  +[_UIImageContentRendition renditionWithResult:color:]((uint64_t)_UIImageContentRendition, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (UITraitCollection)traitCollection
{
  return +[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection");
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
