@implementation TSTTableStyle

+ (id)properties
{
  id result;

  result = (id)+[TSTTableStyle properties]::sProperties;
  if (!+[TSTTableStyle properties]::sProperties)
  {
    result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784,
               785,
               786,
               787,
               799,
               800,
               801,
               802,
               803,
               804,
               805,
               806,
               788,
               789,
               790,
               791,
               792,
               793,
               794,
               795,
               796,
               797,
               798,
               0);
    +[TSTTableStyle properties]::sProperties = (uint64_t)result;
  }
  return result;
}

+ (id)propertiesAllowingNSNull
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties;
  if (!+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 0);
      __dmb(0xBu);
      +[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyle propertiesAllowingNSNull]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 164, CFSTR("Couldn't initialize lazy variable %s"), "s_nullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties;
  }
  return result;
}

+ (id)nonEmphasisTableProperties
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties;
  if (!+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784,
             785,
             786,
             787,
             788,
             789,
             790,
             791,
             792,
             793,
             794,
             795,
             796,
             797,
             798,
             799,
             800,
             801,
             802,
             803,
             804,
             805,
             806,
             0);
      __dmb(0xBu);
      +[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyle nonEmphasisTableProperties]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 232, CFSTR("Couldn't initialize lazy variable %s"), "s_nonEmphasisProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties;
  }
  return result;
}

+ (id)styleIDForPreset:(unint64_t)a3
{
  return (id)String((uint64_t)CFSTR("table"), a3, (uint64_t)CFSTR("tableStyle"));
}

+ (void)initDefaultStrokePresetListInPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5
{
  objc_msgSend(a3, "setObject:forProperty:", +[TSTTableStrokePresetList strokePresetListForDefaultPropertyMapForTablePresetIndex:colors:](TSTTableStrokePresetList, "strokePresetListForDefaultPropertyMapForTablePresetIndex:colors:", a4, a5), 787);
}

+ (void)initDefaultPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  p_setStrokeColors((TSSPropertyMap *)a3, a4, (NSArray *)a5);
  objc_msgSend(a3, "setIntValue:forProperty:", 1, 799);
  objc_msgSend(a3, "setIntValue:forProperty:", 0, 768);
  objc_msgSend(a3, "setIntValue:forProperty:", 0, 769);
  objc_msgSend(a3, "setIntValue:forProperty:", 0, 798);
  objc_msgSend(a3, "setObject:forProperty:", +[TSTTableStrokePresetList strokePresetListForDefaultPropertyMapForTablePresetIndex:colors:](TSTTableStrokePresetList, "strokePresetListForDefaultPropertyMapForTablePresetIndex:colors:", a4, a5), 787);
}

+ (void)p_populateParagraphStyle:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = +[TSWPParagraphStyle properties](TSWPParagraphStyle, "properties");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__TSTTableStyle_p_populateParagraphStyle___block_invoke;
  v5[3] = &unk_24D82AF28;
  v5[4] = a3;
  objc_msgSend(v4, "enumeratePropertiesUsingBlock:", v5);
}

uint64_t __42__TSTTableStyle_p_populateParagraphStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "definesProperty:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setBoxedValue:forProperty:", +[TSSStyle boxedDefaultValueForProperty:](TSWPParagraphStyle, "boxedDefaultValueForProperty:", a2), a2);
  return result;
}

- (TSTTableStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTTableStyle;
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:](&v7, sel_initWithContext_name_overridePropertyMap_isVariation_, a3, a4, a5, a6);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTTableStyle;
  -[TSSStyle dealloc](&v2, sel_dealloc);
}

- (id)strokeForStrokePreset:(unint64_t)a3
{
  return (id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 787), "horizontalStrokeForStrokePreset:", a3);
}

- (id)horizontalStrokeForStrokePreset:(unint64_t)a3
{
  return (id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 787), "horizontalStrokeForStrokePreset:", a3);
}

- (id)verticalStrokeForStrokePreset:(unint64_t)a3
{
  return (id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 787), "verticalStrokeForStrokePreset:", a3);
}

- (id)exteriorStrokeForStrokePreset:(unint64_t)a3
{
  return (id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 787), "exteriorStrokeForStrokePreset:", a3);
}

- (unsigned)maskForStrokePreset:(unint64_t)a3
{
  return objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 787), "maskForStrokePreset:", a3);
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
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyle validate]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 571, CFSTR("orphaned table style %@"), self);
  }
  if (!-[TSSStylesheet containsStyle:](-[TSSStyle stylesheet](self, "stylesheet"), "containsStyle:", self)
    || (v5 = -[TSSStyle stylesheet](self, "stylesheet"), v5 != -[TSSStyle stylesheet](self, "stylesheet")))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyle validate]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 574, CFSTR("Table style not in its stylesheet"));
  }
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tstMapTableStylePropertyMap_;
}

@end
