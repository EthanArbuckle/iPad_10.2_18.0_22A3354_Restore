@implementation PXGadgetSpec

- (BOOL)shouldInsetContentForTraitCollection:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") != 1 || objc_msgSend(v3, "verticalSizeClass") != 2;

  return v4;
}

- (UIEdgeInsets)acccessoryViewInsetForTraitCollection:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v3 = a3;
  PXEdgeInsetsMake();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (objc_msgSend(v13, "horizontalSizeClass") == 1 && objc_msgSend(v13, "verticalSizeClass") == 2)
  {
    PXEdgeInsetsMake();
    v5 = v14;
    v7 = v15;
    v9 = v16;
    v11 = v17;
  }

  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v11;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

+ (PXLayoutMetricInterpolator)horizontalContentInsetsInterpolator
{
  if (horizontalContentInsetsInterpolator_onceToken != -1)
    dispatch_once(&horizontalContentInsetsInterpolator_onceToken, &__block_literal_global_14228);
  return (PXLayoutMetricInterpolator *)(id)horizontalContentInsetsInterpolator_interpolator;
}

void __69__PXGadgetSpec_PlatformSpecific__horizontalContentInsetsInterpolator__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PXLayoutMetricInterpolator layoutMarginWidthInterpolator](PXLayoutMetricInterpolator, "layoutMarginWidthInterpolator");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)horizontalContentInsetsInterpolator_interpolator;
  horizontalContentInsetsInterpolator_interpolator = v0;

}

- (PXGadgetSpec)initWithTraitCollection:(id)a3 scrollAxis:(int64_t)a4
{
  id v8;
  PXGadgetSpec *v9;
  PXGadgetSpec *v10;
  double v11;
  double v12;
  __int128 v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  UIColor *backgroundColor;
  void *v27;
  objc_super v28;

  v8 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSpec.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollAxis != PXAxisUndefined"));

  }
  v28.receiver = self;
  v28.super_class = (Class)PXGadgetSpec;
  v9 = -[PXGadgetSpec init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extendedTraitCollection, a3);
    v10->_scrollAxis = a4;
    objc_msgSend(v8, "layoutReferenceSize");
    v10->_layoutReferenceWidth = v11;
    objc_msgSend(v8, "layoutReferenceSize");
    v10->_layoutReferenceHeight = v12;
    v13 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v10->_layoutInsets.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v10->_layoutInsets.bottom = v13;
    v10->_fixedColumnWidth = 164.0;
    objc_msgSend((id)objc_opt_class(), "horizontalContentInsetsInterpolator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForMetric:", v10->_layoutReferenceWidth);
    objc_msgSend(v8, "displayScale");
    PXFloatRoundToPixel();
    PXEdgeInsetsMake();
    v10->_contentInsets.top = v15;
    v10->_contentInsets.left = v16;
    v10->_contentInsets.bottom = v17;
    v10->_contentInsets.right = v18;
    v10->_interItemSpacing = 6.0;
    v10->_userInterfaceIdiom = objc_msgSend(v8, "userInterfaceIdiom");
    v10->_layoutSizeClass = objc_msgSend(v8, "layoutSizeClass");
    v10->_layoutOrientation = objc_msgSend(v8, "layoutOrientation");
    v10->_layoutDirection = objc_msgSend(v8, "layoutDirection");
    v10->_shouldUseAccessibilityLayout = (unint64_t)(objc_msgSend(v8, "contentSizeCategory") - 8) < 5;
    objc_msgSend(v8, "displayScale");
    v10->_displayScale = v19;
    v10->_shouldInsetAllContent = -[PXGadgetSpec shouldInsetContentForTraitCollection:](v10, "shouldInsetContentForTraitCollection:", v8);
    -[PXGadgetSpec acccessoryViewInsetForTraitCollection:](v10, "acccessoryViewInsetForTraitCollection:", v8);
    v10->_accessoryViewInset.top = v20;
    v10->_accessoryViewInset.left = v21;
    v10->_accessoryViewInset.bottom = v22;
    v10->_accessoryViewInset.right = v23;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v24 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v24;

  }
  return v10;
}

- (PXExtendedTraitCollection)rootExtendedTraitCollection
{
  void *v2;
  void *v3;

  -[PXGadgetSpec extendedTraitCollection](self, "extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootExtendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXExtendedTraitCollection *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToGadgetSpec:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToGadgetSpec:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "layoutReferenceWidth");
  if (v5 == self->_layoutReferenceWidth
    && self->_shouldInsetAllContent == objc_msgSend(v4, "shouldInsetAllContent")
    && (objc_msgSend(v4, "interItemSpacing"), v6 == self->_interItemSpacing)
    && objc_msgSend(v4, "scrollAxis") == self->_scrollAxis
    && objc_msgSend(v4, "layoutSizeClass") == self->_layoutSizeClass
    && objc_msgSend(v4, "layoutOrientation") == self->_layoutOrientation
    && objc_msgSend(v4, "layoutDirection") == self->_layoutDirection
    && (objc_msgSend(v4, "fixedColumnWidth"), v7 == self->_fixedColumnWidth)
    && self->_shouldUseAccessibilityLayout == objc_msgSend(v4, "shouldUseAccessibilityLayout")
    && (objc_msgSend(v4, "accessoryViewInset"), PXEdgeInsetsApproximatelyEqualToEdgeInsets()))
  {
    objc_msgSend(v4, "contentInsets");
    v8 = PXEdgeInsetsApproximatelyEqualToEdgeInsets();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)columnWidthForColumnSpan:(int64_t)a3
{
  BOOL v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double result;
  void *v23;
  double v24;

  v5 = -[PXGadgetSpec shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout");
  v6 = 0.0;
  switch(a3)
  {
    case 0:
      if (v5)
        goto LABEL_10;
      +[PXLayoutMetricInterpolator gadgetColumnWidthSpanSingleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnWidthSpanSingleSetAInterpolator");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      goto LABEL_9;
    case 2:
      if (v5)
        goto LABEL_9;
LABEL_10:
      +[PXLayoutMetricInterpolator gadgetColumnWidthSpanDoubleSetBInterpolator](PXLayoutMetricInterpolator, "gadgetColumnWidthSpanDoubleSetBInterpolator");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      -[PXGadgetSpec layoutReferenceWidth](self, "layoutReferenceWidth");
      v9 = v8;
      -[PXGadgetSpec contentInsets](self, "contentInsets");
      v11 = v9 - v10;
      -[PXGadgetSpec contentInsets](self, "contentInsets");
      return v11 - v12;
    case 4:
      if (-[PXGadgetSpec userInterfaceIdiom](self, "userInterfaceIdiom") == 1)
      {
        -[PXGadgetSpec layoutReferenceWidth](self, "layoutReferenceWidth");
        v14 = v13;
        -[PXGadgetSpec layoutReferenceHeight](self, "layoutReferenceHeight");
        v16 = v15;
        -[PXGadgetSpec contentInsets](self, "contentInsets");
        v18 = v17;
        -[PXGadgetSpec contentInsets](self, "contentInsets");
        v20 = v18 + v19;
        -[PXGadgetSpec columnSpacingForColumnSpan:](self, "columnSpacingForColumnSpan:", 4);
        +[PXLayoutMetricInterpolator locketGadgetColumnWidthForLayoutWidth:layoutMargins:interSpacing:isPhone:](PXLayoutMetricInterpolator, "locketGadgetColumnWidthForLayoutWidth:layoutMargins:interSpacing:isPhone:", 1, v14, v16, v20, v21);
      }
      else
      {
LABEL_9:
        +[PXLayoutMetricInterpolator gadgetColumnWidthSpanDoubleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnWidthSpanDoubleSetAInterpolator");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v23 = (void *)v7;
        if (v7)
        {
          -[PXGadgetSpec layoutReferenceWidth](self, "layoutReferenceWidth");
          objc_msgSend(v23, "valueForMetric:");
          v6 = v24;

        }
        return v6;
      }
      return result;
    case 5:
      -[PXGadgetSpec fixedColumnWidth](self, "fixedColumnWidth");
      return result;
    default:
      return v6;
  }
}

- (double)columnSpacingForColumnSpan:(int64_t)a3
{
  BOOL v5;
  uint64_t v6;
  void *v7;
  double result;
  double v9;
  double v10;

  v5 = -[PXGadgetSpec shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout");
  switch(a3)
  {
    case 0:
      if (v5)
        goto LABEL_8;
      +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanSingleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnSpacingSpanSingleSetAInterpolator");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
    case 3:
    case 4:
      goto LABEL_2;
    case 2:
      if (v5)
      {
LABEL_2:
        +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanDoubleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnSpacingSpanDoubleSetAInterpolator");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_8:
        +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanDoubleSetBInterpolator](PXLayoutMetricInterpolator, "gadgetColumnSpacingSpanDoubleSetBInterpolator");
        v6 = objc_claimAutoreleasedReturnValue();
      }
LABEL_9:
      v7 = (void *)v6;
      goto LABEL_10;
    case 5:
      -[PXGadgetSpec interItemSpacing](self, "interItemSpacing");
      return result;
    default:
      v7 = 0;
LABEL_10:
      -[PXGadgetSpec layoutReferenceWidth](self, "layoutReferenceWidth");
      objc_msgSend(v7, "valueForMetric:");
      v10 = v9;

      return v10;
  }
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (BOOL)shouldInsetAllContent
{
  return self->_shouldInsetAllContent;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (double)layoutReferenceWidth
{
  return self->_layoutReferenceWidth;
}

- (double)layoutReferenceHeight
{
  return self->_layoutReferenceHeight;
}

- (UIEdgeInsets)layoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutInsets.top;
  left = self->_layoutInsets.left;
  bottom = self->_layoutInsets.bottom;
  right = self->_layoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)fixedColumnWidth
{
  return self->_fixedColumnWidth;
}

- (BOOL)shouldUseAccessibilityLayout
{
  return self->_shouldUseAccessibilityLayout;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIEdgeInsets)accessoryViewInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_accessoryViewInset.top;
  left = self->_accessoryViewInset.left;
  bottom = self->_accessoryViewInset.bottom;
  right = self->_accessoryViewInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (double)sectionHeaderHeightForStyle:(unint64_t)a3 dividerHidden:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  +[PXGadgetSpec sectionHeaderTitleHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderTitleHeightForStyle:dividerHidden:");
  v7 = v6;
  +[PXGadgetSpec sectionHeaderTitleBottomSpacingForStyle:](PXGadgetSpec, "sectionHeaderTitleBottomSpacingForStyle:", a3);
  v9 = v7 + v8;
  if (!a4)
  {
    +[PXGadgetSpec sectionHeaderTopSpacingForStyle:](PXGadgetSpec, "sectionHeaderTopSpacingForStyle:", a3);
    return v9 + v10;
  }
  return v9;
}

+ (double)sectionHeaderTitleHeightForStyle:(unint64_t)a3 dividerHidden:(BOOL)a4
{
  double v6;
  void *v7;
  double v8;
  double v9;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      PXScaledValueForTextStyleWithSymbolicTraits();
      v6 = v9;
      goto LABEL_6;
    case 6uLL:
      PXScaledValueForTextStyleWithSymbolicTraits();
      v6 = v8 * 1.5;
LABEL_6:
      if (v6 > 0.0)
        return v6;
      goto LABEL_3;
    default:
      v6 = 0.0;
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGadgetSpec.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("titleHeight > 0.0"));

      return v6;
  }
}

+ (double)sectionHeaderTopSpacingForStyle:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;

  v5 = 0.0;
  if (a3 > 6 || (PXScaledValueForTextStyleWithSymbolicTraits(), v5 = v6, v6 <= 0.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGadgetSpec.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topSpacing > 0.0"));

  }
  return v5;
}

+ (double)sectionHeaderTitleBottomSpacingForStyle:(unint64_t)a3
{
  double result;

  if (a3 > 6 || ((1 << a3) & 0x4D) == 0 && a3 != 4 && a3 != 5)
    return 0.0;
  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

@end
