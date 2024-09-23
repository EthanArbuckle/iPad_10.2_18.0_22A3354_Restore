@implementation TSWPCharacterStyle

- (int)writingDirection
{
  int result;
  uint64_t v4;

  result = -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 44);
  if (result == 0x80000000)
  {
    objc_opt_class();
    -[TSSStyle valueForProperty:](self, "valueForProperty:", 39);
    v4 = TSUDynamicCast();
    if (v4)
      return objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v4) == 2;
    else
      return -1;
  }
  return result;
}

+ (id)properties
{
  if (+[TSWPCharacterStyle properties]::s_onceToken != -1)
    dispatch_once(&+[TSWPCharacterStyle properties]::s_onceToken, &__block_literal_global_62);
  return (id)+[TSWPCharacterStyle properties]::s_properties;
}

TSSPropertySet *__32__TSWPCharacterStyle_properties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 33, 21, 19, 18, 20, 16, 17, 34, 39, 41, 32, 31, 40, 28, 26, 27, 36,
             37,
             35,
             24,
             22,
             23,
             29,
             25,
             43,
             53,
             54,
             55,
             56,
             44,
             45,
             46,
             47,
             48,
             49,
             50,
             0);
  +[TSWPCharacterStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)emphasisProperties
{
  if (+[TSWPCharacterStyle emphasisProperties]::s_onceToken != -1)
    dispatch_once(&+[TSWPCharacterStyle emphasisProperties]::s_onceToken, &__block_literal_global_1_2);
  return (id)+[TSWPCharacterStyle emphasisProperties]::s_emphasisProperties;
}

TSSPropertySet *__40__TSWPCharacterStyle_emphasisProperties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 19, 20, 22, 26, 0);
  +[TSWPCharacterStyle emphasisProperties]::s_emphasisProperties = (uint64_t)result;
  return result;
}

+ (id)nonEmphasisCharacterProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__TSWPCharacterStyle_nonEmphasisCharacterProperties__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_onceToken != -1)
    dispatch_once(&+[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_onceToken, block);
  return (id)+[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_nonEmphasisCharacterProperties;
}

void __52__TSWPCharacterStyle_nonEmphasisCharacterProperties__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "properties"), "mutableCopy");
  objc_msgSend(v2, "removeProperties:", objc_msgSend(*(id *)(a1 + 32), "emphasisProperties"));
  +[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_nonEmphasisCharacterProperties = objc_msgSend(v2, "copy");

}

+ (id)propertiesAllowingNSNull
{
  if (+[TSWPCharacterStyle propertiesAllowingNSNull]::s_onceToken != -1)
    dispatch_once(&+[TSWPCharacterStyle propertiesAllowingNSNull]::s_onceToken, &__block_literal_global_2_0);
  return (id)+[TSWPCharacterStyle propertiesAllowingNSNull]::s_nullProperties;
}

TSSPropertySet *__46__TSWPCharacterStyle_propertiesAllowingNSNull__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 18, 16, 39, 32, 40, 28, 37, 24, 43, 53, 54, 55, 45, 46, 47, 0);
  +[TSWPCharacterStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (id)nullStyleName
{
  return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSText"));
}

+ (id)nullStyleWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", a3, objc_msgSend(a1, "nullStyleName"), 0, 0);
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (BOOL)transformsFontSizes
{
  return 1;
}

@end
