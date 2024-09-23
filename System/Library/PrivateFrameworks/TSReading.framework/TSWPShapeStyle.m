@implementation TSWPShapeStyle

+ (id)presetStyleDescriptor
{
  return CFSTR("shapestyle");
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__TSWPShapeStyle_properties__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[TSWPShapeStyle properties]::onceToken != -1)
    dispatch_once(&+[TSWPShapeStyle properties]::onceToken, block);
  return (id)+[TSWPShapeStyle properties]::s_properties;
}

id __28__TSWPShapeStyle_properties__block_invoke(uint64_t a1)
{
  id result;
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
  result = (id)objc_msgSend(objc_msgSendSuper2(&v2, sel_properties), "propertySetByAddingPropertiesFromSet:", +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 148, 146, 152, 149, 211, 153, 154, 155, 212, 0));
  +[TSWPShapeStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)layoutProperties
{
  if (+[TSWPShapeStyle layoutProperties]::onceToken != -1)
    dispatch_once(&+[TSWPShapeStyle layoutProperties]::onceToken, &__block_literal_global_70);
  return (id)+[TSWPShapeStyle layoutProperties]::s_layoutProperties;
}

TSSPropertySet *__34__TSWPShapeStyle_layoutProperties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 148, 146, 152, 149, 153, 154, 155, 0);
  +[TSWPShapeStyle layoutProperties]::s_layoutProperties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[TSWPShapeStyle propertiesAllowingNSNull]::onceToken != -1)
    dispatch_once(&+[TSWPShapeStyle propertiesAllowingNSNull]::onceToken, block);
  return (id)+[TSWPShapeStyle propertiesAllowingNSNull]::s_nullProperties;
}

void __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[6];
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
  v2 = (void *)objc_msgSend(objc_msgSendSuper2(&v5, sel_propertiesAllowingNSNull), "mutableCopy");
  v3 = +[TSWPColumnStyle propertiesAllowingNSNull](TSWPColumnStyle, "propertiesAllowingNSNull");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke_2;
  v4[3] = &unk_24D82AF00;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  objc_msgSend(v3, "enumeratePropertiesUsingBlock:", v4);
  objc_msgSend(v2, "addProperty:", 212);
  +[TSWPShapeStyle propertiesAllowingNSNull]::s_nullProperties = objc_msgSend(v2, "copy");

}

uint64_t __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "properties"), "containsProperty:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addProperty:", a2);
  return result;
}

+ (int)defaultIntValueForProperty:(int)a3
{
  char v3;
  objc_super v5;

  v3 = a3 + 107;
  if ((a3 - 149) > 0x3E)
    goto LABEL_6;
  if (((1 << v3) & 0x4000000000000070) != 0)
    return 0;
  if (((1 << v3) & 9) != 0)
    return +[TSWPColumnStyle defaultIntValueForProperty:](TSWPColumnStyle, "defaultIntValueForProperty:");
LABEL_6:
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
  return objc_msgSendSuper2(&v5, sel_defaultIntValueForProperty_);
}

+ (id)defaultValueForProperty:(int)a3
{
  objc_super v4;

  switch(a3)
  {
    case 146:
      return +[TSWPColumnStyle defaultValueForProperty:](TSWPColumnStyle, "defaultValueForProperty:");
    case 212:
      return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    case 148:
      return +[TSWPColumnStyle defaultValueForProperty:](TSWPColumnStyle, "defaultValueForProperty:");
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
  return objc_msgSendSuper2(&v4, sel_defaultValueForProperty_);
}

- (NSString)presetKind
{
  NSString *v3;
  NSString *v4;
  void *v5;
  void *v7;

  v3 = (NSString *)String;
  v4 = -[TSSStyle styleIdentifier](self, "styleIdentifier");
  if (v4)
  {
    v5 = (void *)String(v4);
    return (NSString *)TSWPShapePresetKindForPackageString(v5);
  }
  else
  {
    objc_opt_class();
    -[TSSStyle parent](self, "parent");
    v7 = (void *)TSUDynamicCast();
    if (v7)
      return (NSString *)objc_msgSend(v7, "presetKind");
    else
      return v3;
  }
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tsdMapShapeStylePropertyMap_;
}

- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5
{
  id v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;
  _OWORD v11[3];
  _OWORD v12[3];

  if (a3 == 146)
  {
    v6 = (id)objc_msgSend(a4, "copy");
    v7 = *(_OWORD *)&a5->c;
    v12[0] = *(_OWORD *)&a5->a;
    v12[1] = v7;
    v12[2] = *(_OWORD *)&a5->tx;
    objc_msgSend(v6, "transform:", v12);
  }
  else
  {
    v8 = *(_OWORD *)&a5->c;
    v11[0] = *(_OWORD *)&a5->a;
    v11[1] = v8;
    v11[2] = *(_OWORD *)&a5->tx;
    v10.receiver = self;
    v10.super_class = (Class)TSWPShapeStyle;
    return -[TSDShapeStyle boxedValueForProperty:oldBoxedValue:transformedByTransform:](&v10, sel_boxedValueForProperty_oldBoxedValue_transformedByTransform_, *(_QWORD *)&a3, a4, v11);
  }
  return v6;
}

- (void)setDefaultParagraphStyle:(id)a3
{
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  -[TSSStyle setValue:forProperty:](self, "setValue:forProperty:", a3, 212);
}

- (id)defaultParagraphStyle
{
  id v2;

  v2 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 212);
  if (objc_msgSend(v2, "isEqual:", objc_msgSend(MEMORY[0x24BDBCEF8], "null")))
    return 0;
  else
    return v2;
}

@end
