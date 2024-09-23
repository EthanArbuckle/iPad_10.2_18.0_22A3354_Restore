@implementation TSTCellStyle

+ (id)properties
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSTCellStyle properties]::sProperties;
  if (!+[TSTCellStyle properties]::sProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTCellStyle properties]::sProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 896, 897, 898, 899, 900, 901, 902, 903, 904, 0);
      __dmb(0xBu);
      +[TSTCellStyle properties]::sProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTCellStyle properties]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 67, CFSTR("Couldn't initialize lazy variable %s"), "sProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTCellStyle properties]::sProperties;
  }
  return result;
}

+ (id)propertiesAllowingNSNull
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties;
  if (!+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 898, 899, 900, 901, 902, 0);
      __dmb(0xBu);
      +[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTCellStyle propertiesAllowingNSNull]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 83, CFSTR("Couldn't initialize lazy variable %s"), "s_nullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties;
  }
  return result;
}

+ (id)nonEmphasisCellProperties
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties;
  if (!+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 896, 903, 904, 0);
      __dmb(0xBu);
      +[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTCellStyle nonEmphasisCellProperties]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 98, CFSTR("Couldn't initialize lazy variable %s"), "s_nonEmphasisProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties;
  }
  return result;
}

+ (id)regionStringForTableArea:(unsigned int)a3
{
  void *v4;
  uint64_t v5;

  if (a3 < 6)
    return off_24D82F8D8[a3];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTCellStyle regionStringForTableArea:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 129, CFSTR("Unexpected value for region."));
  return 0;
}

+ (id)styleIDForPreset:(unint64_t)a3 andTableArea:(unsigned int)a4
{
  return (id)String((uint64_t)CFSTR("tableCell"), a3, objc_msgSend(a1, "regionStringForTableArea:", *(_QWORD *)&a4));
}

+ (id)textStyleIDForPreset:(unint64_t)a3 andTableArea:(unsigned int)a4
{
  return (id)String((uint64_t)TSTTextStylePrefix, a3, objc_msgSend(a1, "regionStringForTableArea:", *(_QWORD *)&a4));
}

+ (void)p_initBodyRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  id v7;

  if (a6 <= 6 && ((1 << a6) & 0x54) != 0)
    v7 = +[TSDColorFill blackColor](TSDColorFill, "blackColor", a3, a4, a5);
  else
    v7 = +[TSDColorFill whiteColor](TSDColorFill, "whiteColor", a3, a4, a5);
  objc_msgSend(a3, "setObject:forProperty:", v7, 898);
}

+ (void)p_initHeaderRowRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  id v7;

  if (a5)
    v7 = +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", objc_msgSend(a5, "objectAtIndex:", s_TableStyleFills[4 * a4 + 1]));
  else
    v7 = +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", a3, a4, 0, *(_QWORD *)&a6, 0.921500027, 0.921500027, 0.921500027, 1.0);
  objc_msgSend(a3, "setObject:forProperty:", v7, 898);
}

+ (void)p_initHeaderColumnRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  id v7;

  if (a5)
    v7 = +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", objc_msgSend(a5, "objectAtIndex:", s_TableStyleFills[4 * a4 + 2]));
  else
    v7 = +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", a3, a4, 0, *(_QWORD *)&a6, 0.921500027, 0.921500027, 0.921500027, 1.0);
  objc_msgSend(a3, "setObject:forProperty:", v7, 898);
}

+ (void)p_initFooterRowRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  id v7;

  if (a5)
    v7 = +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", objc_msgSend(a5, "objectAtIndex:", s_TableStyleFills[4 * a4 + 3]));
  else
    v7 = +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", a3, a4, 0, *(_QWORD *)&a6, 235.0, 235.0, 235.0, 1.0);
  objc_msgSend(a3, "setObject:forProperty:", v7, 898);
}

+ (void)initDefaultPropertyMap:(id)a3 forTableArea:(unsigned int)a4 presetIndex:(unint64_t)a5 colors:(id)a6 alternate:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  switch(a4)
  {
    case 0u:
      objc_msgSend(a1, "p_initBodyRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(_QWORD *)&a7);
      break;
    case 1u:
      objc_msgSend(a1, "p_initHeaderRowRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(_QWORD *)&a7);
      break;
    case 2u:
      objc_msgSend(a1, "p_initHeaderColumnRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(_QWORD *)&a7);
      break;
    case 3u:
      objc_msgSend(a1, "p_initFooterRowRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(_QWORD *)&a7);
      break;
    case 4u:
    case 5u:
      v7 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTCellStyle initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:]");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm");
      v10 = CFSTR("there is no style for the corner cells");
      v11 = v9;
      v12 = (void *)v7;
      v13 = v8;
      v14 = 258;
      goto LABEL_4;
    default:
      v15 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTCellStyle initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:]");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm");
      v10 = CFSTR("Unexpected value for region.");
      v11 = v17;
      v12 = (void *)v15;
      v13 = v16;
      v14 = 261;
LABEL_4:
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v11, v14, v10);
      break;
  }
}

- (void)validate
{
  void *v3;
  uint64_t v4;
  TSSStylesheet *v5;
  void *v6;
  uint64_t v7;

  if (!-[TSSStyle stylesheet](self, "stylesheet"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellStyle validate]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 373, CFSTR("orphaned cell style %@"), self);
  }
  if (!-[TSSStylesheet containsStyle:](-[TSSStyle stylesheet](self, "stylesheet"), "containsStyle:", self)
    || (v5 = -[TSSStyle stylesheet](self, "stylesheet"), v5 != -[TSSStyle stylesheet](self, "stylesheet")))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellStyle validate]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 375, CFSTR("Cell style not in its stylesheet"));
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTCellStyle;
  -[TSSStyle dealloc](&v2, sel_dealloc);
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tstMapCellStylePropertyMap_;
}

@end
