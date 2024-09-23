@implementation _PRIconListLayout

- (_PRIconListLayout)initWithGridSize:(SBHIconGridSize)a3
{
  _PRIconListLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PRIconListLayout;
  result = -[_PRIconListLayout init](&v5, sel_init);
  if (result)
    result->_gridSize = a3;
  return result;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  return self->_gridSize.rows;
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  return self->_gridSize.columns;
}

- (BOOL)usesAlternateLayout
{
  return 0;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 20.0;
  v4 = 20.0;
  v5 = 20.0;
  v6 = 20.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PRIconGridSizeClassCircular"), CFSTR("PRIconGridSizeClassRectangular"), CFSTR("PRIconGridSizeClassSystemSmall"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA488]), "initWithGridSizeClasses:", v2);

  return (SBHIconGridSizeClassSet *)v3;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return (SBHIconGridSizeClassSizeMap *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA490]), "initWithGridSizeClassesAndGridSizes:", CFSTR("PRIconGridSizeClassCircular"), 65537, CFSTR("PRIconGridSizeClassRectangular"), 65538, CFSTR("PRIconGridSizeClassSystemSmall"), 131074, 0);
}

- (SBIconImageInfo)iconImageInfo
{
  return -[_PRIconListLayout iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", *MEMORY[0x1E0DAA750]);
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  __CFString *v4;
  SBIconImageInfo *result;

  v4 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0D1BC88], "gridUnitSize");
  objc_msgSend(MEMORY[0x1E0D1BC88], "complicationEdgeInset");
  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
  if (CFSTR("PRIconGridSizeClassCircular") != v4
    && (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) == 0
    && CFSTR("PRIconGridSizeClassRectangular") != v4
    && !-[__CFString isEqualToString:](v4, "isEqualToString:")
    && CFSTR("PRIconGridSizeClassSystemSmall") != v4)
  {
    -[__CFString isEqualToString:](v4, "isEqualToString:");
  }
  PRWidgetPlatterCornerRadius();

  return result;
}

@end
