@implementation SXUnitConverter

- (SXUnitConverter)initWithComponentWidth:(double)a3 parentWidth:(double)a4 documentGutter:(double)a5 documentMargin:(double)a6 viewportSize:(CGSize)a7 contentScaleFactor:(double)a8
{
  CGFloat height;
  CGFloat width;
  SXUnitConverter *result;
  objc_super v16;

  height = a7.height;
  width = a7.width;
  v16.receiver = self;
  v16.super_class = (Class)SXUnitConverter;
  result = -[SXUnitConverter init](&v16, sel_init);
  if (result)
  {
    result->_componentWidth = a3;
    result->_parentWidth = a4;
    result->_documentGutter = a5;
    result->_documentMargin = a6;
    result->_viewportSize.width = width;
    result->_viewportSize.height = height;
    result->_contentScaleFactor = a8;
  }
  return result;
}

- (double)convertValueToPoints:(_SXConvertibleValue)a3
{
  double result;

  -[SXUnitConverter convertValueToPoints:allowNegativeValues:](self, "convertValueToPoints:allowNegativeValues:", *(_QWORD *)&a3.value, a3.unit, 0);
  return result;
}

- (double)convertValueToPoints:(_SXConvertibleValue)a3 allowNegativeValues:(BOOL)a4
{
  double v4;
  double height;
  double v7;
  double contentScaleFactor;
  double v9;

  v4 = 0.0;
  if (a3.value > 0.0 || a4)
  {
    switch(a3.unit)
    {
      case 0uLL:
      case 1uLL:
        v4 = self->_contentScaleFactor * a3.value;
        return round(v4);
      case 2uLL:
        if (!self)
          goto LABEL_33;
        height = self->_viewportSize.height;
        goto LABEL_18;
      case 3uLL:
        if (!self)
          goto LABEL_33;
        height = self->_viewportSize.width;
LABEL_18:
        v7 = a3.value / 100.0;
        goto LABEL_22;
      case 4uLL:
        if (!self)
          goto LABEL_33;
        height = self->_viewportSize.height;
        v7 = a3.value / 100.0;
        if (height >= self->_viewportSize.width)
          height = self->_viewportSize.width;
        goto LABEL_22;
      case 5uLL:
        if (self)
        {
          height = self->_viewportSize.height;
          v7 = a3.value / 100.0;
          if (height < self->_viewportSize.width)
            height = self->_viewportSize.width;
LABEL_22:
          v9 = v7 * height;
        }
        else
        {
LABEL_33:
          v9 = 0.0;
        }
        contentScaleFactor = self->_contentScaleFactor;
        goto LABEL_31;
      case 6uLL:
        if (!self)
          return round(v4);
        contentScaleFactor = self->_documentGutter;
        goto LABEL_30;
      case 7uLL:
        if (!self)
          return round(v4);
        contentScaleFactor = self->_componentWidth;
        goto LABEL_30;
      case 8uLL:
        if (!self)
          return round(v4);
        contentScaleFactor = self->_documentMargin;
        goto LABEL_30;
      case 9uLL:
        if (!self)
          return round(v4);
        contentScaleFactor = self->_parentWidth;
        if (contentScaleFactor <= 2.22044605e-16)
          contentScaleFactor = self->_viewportSize.width * self->_contentScaleFactor;
LABEL_30:
        v9 = a3.value / 100.0;
LABEL_31:
        v4 = v9 * contentScaleFactor;
        break;
      default:
        return round(v4);
    }
  }
  return round(v4);
}

@end
