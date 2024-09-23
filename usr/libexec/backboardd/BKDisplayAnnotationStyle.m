@implementation BKDisplayAnnotationStyle

+ (id)minimalStyle
{
  return objc_alloc_init(BKDisplayAnnotationMinimalStyle);
}

+ (id)ellipseStyle
{
  return objc_alloc_init(BKDisplayAnnotationEllipseStyle);
}

+ (id)rectangleStyle
{
  return objc_alloc_init(BKDisplayAnnotationRectangleStyle);
}

+ (id)pointerStyle
{
  return objc_alloc_init(BKDisplayAnnotationPointerStyle);
}

+ (id)textStyle
{
  return objc_alloc_init(BKDisplayAnnotationTextStyle);
}

+ (id)textBackgroundStyle
{
  return objc_alloc_init(BKDisplayAnnotationTextBackgroundStyle);
}

+ (id)emphasizedStyle
{
  return objc_alloc_init(BKDisplayAnnotationEmphasizedStyle);
}

+ (id)crosshatchedBackgroundStyle
{
  return objc_alloc_init(BKDisplayAnnotationCrosshatchedBackgroundStyle);
}

+ (id)canceledStyle
{
  return objc_alloc_init(BKDisplayAnnotationCanceledStyle);
}

+ (id)colorVariationStyleWithIndex:(int64_t)a3
{
  return +[BKDisplayAnnotationColorVariationStyle colorVariationWithIndex:](BKDisplayAnnotationColorVariationStyle, "colorVariationWithIndex:", a3);
}

@end
