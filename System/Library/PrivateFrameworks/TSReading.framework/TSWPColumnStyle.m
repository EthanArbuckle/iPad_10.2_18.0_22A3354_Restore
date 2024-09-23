@implementation TSWPColumnStyle

- (CGSize)adjustedInsets
{
  id v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 146);
  objc_msgSend(v3, "leftInset");
  v5 = v4;
  -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", 147);
  v7 = v6;
  if (v5 < v7)
    v5 = v7;
  objc_msgSend(v3, "topInset");
  v9 = v8;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

+ (id)defaultValueForProperty:(int)a3
{
  objc_super v4;

  if (a3 == 145 || a3 == 146)
    return +[TSWPPadding padding](TSWPPadding, "padding");
  if (a3 == 148)
    return +[TSWPColumns columns](TSWPColumns, "columns");
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSWPColumnStyle;
  return objc_msgSendSuper2(&v4, sel_defaultValueForProperty_);
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  float result;

  result = INFINITY;
  if (a3 == 147)
    return 0.0;
  return result;
}

- (unint64_t)columnCount
{
  unint64_t result;

  result = objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 148), "columnCount");
  if (result >= 0xA)
    return 10;
  return result;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  double result;

  objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 148), "positionForColumnIndex:bodyWidth:outWidth:outGap:", a3, a5, a6, a4);
  return result;
}

+ (id)properties
{
  if (+[TSWPColumnStyle properties]::s_onceToken != -1)
    dispatch_once(&+[TSWPColumnStyle properties]::s_onceToken, &__block_literal_global_64);
  return (id)+[TSWPColumnStyle properties]::s_properties;
}

+ (int)defaultIntValueForProperty:(int)a3
{
  int result;

  result = 0x80000000;
  switch(a3)
  {
    case 149:
    case 152:
    case 153:
      result = 0;
      break;
    case 150:
      return result;
    case 151:
      result = 1;
      break;
    default:
      if (a3 == 44)
        result = 0;
      else
        result = 0x80000000;
      break;
  }
  return result;
}

TSSPropertySet *__29__TSWPColumnStyle_properties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 148, 151, 145, 147, 146, 152, 149, 153, 44, 0);
  +[TSWPColumnStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  if (+[TSWPColumnStyle propertiesAllowingNSNull]::s_onceToken != -1)
    dispatch_once(&+[TSWPColumnStyle propertiesAllowingNSNull]::s_onceToken, &__block_literal_global_1_3);
  return (id)+[TSWPColumnStyle propertiesAllowingNSNull]::s_nullProperties;
}

TSSPropertySet *__43__TSWPColumnStyle_propertiesAllowingNSNull__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 148, 145, 146, 0);
  +[TSWPColumnStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (id)defaultStyleWithContext:(id)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend(v4, "initWithContext:name:overridePropertyMap:isVariation:", a3, objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSText")), 0, 0);
}

- (TSWPPadding)layoutMargins
{
  objc_opt_class();
  -[TSSStyle valueForProperty:](self, "valueForProperty:", 145);
  return (TSWPPadding *)TSUDynamicCast();
}

- (BOOL)equalWidth
{
  id v2;

  v2 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 148);
  if (v2)
    return objc_msgSend(v2, "equalWidth");
  else
    return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double result;

  objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 148), "widthForColumnIndex:bodyWidth:", a3, a4);
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double result;

  objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 148), "gapForColumnIndex:bodyWidth:", a3, a4);
  return result;
}

- (BOOL)alwaysStartsNewTarget
{
  return -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 151) == 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 44) != 1;
}

@end
