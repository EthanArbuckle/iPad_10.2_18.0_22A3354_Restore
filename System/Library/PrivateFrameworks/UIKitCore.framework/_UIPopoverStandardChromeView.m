@implementation _UIPopoverStandardChromeView

+ (Class)standardChromeViewClass
{
  _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ShapeLayerPopoverChromeView, (uint64_t)CFSTR("ShapeLayerPopoverChromeView"));
  return (Class)(id)objc_opt_class();
}

+ (Class)legacyChromeViewClass
{
  return (Class)objc_opt_class();
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)arrowHeight
{
  return 0.0;
}

- (_UIPopoverStandardChromeView)initWithFrame:(CGRect)a3
{
  _UIPopoverStandardChromeView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverStandardChromeView;
  result = -[UIPopoverBackgroundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_arrowDirection = -1;
  return result;
}

- (BOOL)isPinned
{
  return -[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:", self->_arrowOffset);
}

- (BOOL)wouldPinForOffset:(double)a3
{
  double v4;
  double v6;

  if (a3 >= 0.0)
  {
    -[_UIPopoverStandardChromeView maxNonPinnedOffset](self, "maxNonPinnedOffset");
    return v6 < a3;
  }
  else
  {
    -[_UIPopoverStandardChromeView minNonPinnedOffset](self, "minNonPinnedOffset");
    return v4 > a3;
  }
}

- (BOOL)usesImagesForShapeMasking
{
  return 1;
}

- (double)minNonPinnedOffset
{
  return 0.0;
}

- (double)maxNonPinnedOffset
{
  return 0.0;
}

- (BOOL)isRightArrowPinnedToTop
{
  _BOOL4 v3;

  v3 = -[_UIPopoverStandardChromeView isPinned](self, "isPinned");
  if (v3)
    LOBYTE(v3) = self->_arrowOffset < 0.0;
  return v3;
}

- (BOOL)isRightArrowPinnedToBottom
{
  _BOOL4 v3;

  v3 = -[_UIPopoverStandardChromeView isPinned](self, "isPinned");
  if (v3)
    LOBYTE(v3) = self->_arrowOffset > 0.0;
  return v3;
}

- (BOOL)_shouldUseEqualContentInsetsOnAllSides
{
  return (byte_1EDDA84DC != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_EqualPopoverContentInsetsOnAllSides, (uint64_t)CFSTR("EqualPopoverContentInsetsOnAllSides"));
}

- (UIEdgeInsets)safeAreaInsetsForContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  UIEdgeInsets result;

  -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "arrowHeight");
    v6 = v5;
    if (-[_UIPopoverStandardChromeView _shouldUseEqualContentInsetsOnAllSides](self, "_shouldUseEqualContentInsetsOnAllSides"))
    {
      v7 = v6;
      v8 = v6;
      v9 = v6;
LABEL_4:
      v4 = v6;
    }
    else
    {
      v10 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
      v7 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
      switch(v10)
      {
        case 1uLL:
          goto LABEL_4;
        case 2uLL:
          v8 = v6;
          break;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 4uLL:
          v9 = v6;
          break;
        case 8uLL:
          v7 = v6;
          break;
        default:
          goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  v11 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v9;
  result.top = v11;
  return result;
}

- (CGRect)_contentViewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v22;
  objc_super v23;
  objc_super v24;
  CGRect result;

  -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v24.receiver = self;
    v24.super_class = (Class)_UIPopoverStandardChromeView;
    -[UIPopoverBackgroundView _contentViewFrame](&v24, sel__contentViewFrame);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[_UIPopoverStandardChromeView safeAreaInsetsForContentView](self, "safeAreaInsetsForContentView");
    v13 = v12;
    v15 = v14;
    v17 = -v16;
    v19 = v5 - v14;
    v20 = v7 - v13;
    v21 = v9 - (-v18 - v15);
    v22 = v11 - (v17 - v13);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIPopoverStandardChromeView;
    -[UIPopoverBackgroundView _contentViewFrame](&v23, sel__contentViewFrame);
  }
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int64_t)_resolvedBackgroundStyle
{
  return 100;
}

- (BOOL)useShortMode
{
  return self->useShortMode;
}

- (void)setUseShortMode:(BOOL)a3
{
  self->useShortMode = a3;
}

- (BOOL)isDebugModeEnabled
{
  return self->_debugMode;
}

- (void)setDebugModeEnabled:(BOOL)a3
{
  self->_debugMode = a3;
}

- (UIView)viewToMaskWhenContentExtendsOverArrow
{
  return (UIView *)objc_loadWeakRetained((id *)&self->viewToMaskWhenContentExtendsOverArrow);
}

- (void)setViewToMaskWhenContentExtendsOverArrow:(id)a3
{
  objc_storeWeak((id *)&self->viewToMaskWhenContentExtendsOverArrow, a3);
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirection = a3;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (void)setArrowOffset:(double)a3
{
  self->_arrowOffset = a3;
}

- (UIColor)arrowBackgroundColor
{
  return self->_arrowBackgroundColor;
}

- (void)setArrowBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (UIColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (UIColor)contentBlendingColor
{
  return self->_contentBlendingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBlendingColor, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundColor, 0);
  objc_destroyWeak((id *)&self->viewToMaskWhenContentExtendsOverArrow);
}

@end
