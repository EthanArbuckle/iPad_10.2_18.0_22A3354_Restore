@implementation TSDShapeStyle

+ (void)initialize
{
  TSDStroke *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (!sDefaultStroke)
  {
    objc_sync_enter(a1);
    if (!sDefaultStroke)
    {
      v3 = objc_alloc_init(TSDStroke);
      __dmb(0xBu);
      sDefaultStroke = (uint64_t)v3;
      if (!v3)
      {
        v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShapeStyle initialize]");
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 36, CFSTR("Couldn't initialize lazy variable %s"), "sDefaultStroke");
      }
    }
    objc_sync_exit(a1);
  }
  if (!sNSNullNull)
  {
    objc_sync_enter(a1);
    if (!sNSNullNull)
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      __dmb(0xBu);
      sNSNullNull = (uint64_t)v6;
      if (!v6)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShapeStyle initialize]");
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 40, CFSTR("Couldn't initialize lazy variable %s"), "sNSNullNull");
      }
    }
    objc_sync_exit(a1);
  }
}

+ (id)properties
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)properties_sProperties;
  if (!properties_sProperties)
  {
    objc_sync_enter(a1);
    if (!properties_sProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 516, 517, 518, 519, 520, 0);
      __dmb(0xBu);
      properties_sProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShapeStyle properties]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 57, CFSTR("Couldn't initialize lazy variable %s"), "sProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)properties_sProperties;
  }
  return result;
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  float result;

  result = INFINITY;
  if (a3 == 518)
    return 1.0;
  return result;
}

+ (id)defaultValueForProperty:(int)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 516:
      result = +[TSDColorFill clearColor](TSDColorFill, "clearColor");
      break;
    case 517:
      result = (id)sDefaultStroke;
      break;
    case 519:
    case 520:
      result = (id)sNSNullNull;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)propertiesAllowingNSNull
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)propertiesAllowingNSNull_sNullProperties;
  if (!propertiesAllowingNSNull_sNullProperties)
  {
    objc_sync_enter(a1);
    if (!propertiesAllowingNSNull_sNullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 516, 519, 520, 0);
      __dmb(0xBu);
      propertiesAllowingNSNull_sNullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShapeStyle propertiesAllowingNSNull]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 109, CFSTR("Couldn't initialize lazy variable %s"), "sNullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)propertiesAllowingNSNull_sNullProperties;
  }
  return result;
}

+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  unsigned int v6;
  double v7;
  BOOL v8;
  float v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  objc_class *v15;
  NSString *v16;
  objc_super v18;

  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___TSDShapeStyle;
  v6 = objc_msgSendSuper2(&v18, sel_validateFloatValue_forProperty_);
  v8 = v6;
  if (a4 == 518 && v6)
  {
    *(float *)&v7 = *a3;
    if (*a3 < 0.0)
    {
      v9 = 0.0;
      v10 = 121;
LABEL_7:
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v7);
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShapeStyle validateFloatValue:forProperty:]");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m");
      v14 = *a3;
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, v10, CFSTR("Unexpected float value %g for %@ property %@ out of range [0.0, 1.0]."), *(_QWORD *)&v14, v16, String(518));
      *a3 = v9;
      return v8;
    }
    v9 = 1.0;
    if (*(float *)&v7 > 1.0)
    {
      v10 = 125;
      goto LABEL_7;
    }
  }
  return v8;
}

+ (id)p_magicMoveProperties
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)p_magicMoveProperties_s_magicMoveProperties;
  if (!p_magicMoveProperties_s_magicMoveProperties)
  {
    objc_sync_enter(a1);
    if (!p_magicMoveProperties_s_magicMoveProperties)
    {
      v4 = +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 512, 513, 515, 516, 517, 518, 519, 520, 522, 523, 526, 528, 529, 0);
      __dmb(0xBu);
      p_magicMoveProperties_s_magicMoveProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShapeStyle p_magicMoveProperties]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 156, CFSTR("Couldn't initialize lazy variable %s"), "s_magicMoveProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)p_magicMoveProperties_s_magicMoveProperties;
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSDShapeStyle_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDShapeStyle_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeStyle mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 166, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend((id)objc_opt_class(), "p_magicMoveProperties");
  v6 = +[TSSPropertySet propertySet](TSSMutablePropertySet, "propertySet");
  objc_msgSend(v6, "addProperties:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "propertyMap"), "allProperties"));
  objc_msgSend(v6, "addProperties:", objc_msgSend((id)objc_msgSend(v2, "propertyMap"), "allProperties"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__TSDShapeStyle_mixingTypeWithObject___block_invoke_2;
  v10[3] = &unk_24D82BEE8;
  v7 = *(_QWORD *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  v10[6] = v2;
  v10[7] = &v11;
  objc_msgSend(v6, "enumeratePropertiesUsingBlock:", v10);
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __38__TSDShapeStyle_mixingTypeWithObject___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  result = objc_msgSend(*(id *)(a1 + 32), "containsProperty:", a2);
  if ((_DWORD)result)
  {
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "boxedValueForProperty:", a2);
    v8 = objc_msgSend(*(id *)(a1 + 48), "boxedValueForProperty:", a2);
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "propertiesAllowingNSNull"), "containsProperty:", a2))v9 = TSDMixingTypeWithPossiblyNilObjects((unint64_t)v7, v8);
    else
      v9 = objc_msgSend(v7, "mixingTypeWithObject:", v8);
    if (v9 == 1 && (_DWORD)a2 == 516)
      v11 = 2;
    else
      v11 = v9;
    result = TSDMixingTypeBestFromMixingTypes(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
    *a3 = 1;
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v8[9];

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copyWithContext:", objc_msgSend(*(id *)(a1 + 40), "context"));
  v4 = objc_msgSend((id)objc_opt_class(), "p_magicMoveProperties");
  v5 = +[TSSPropertySet propertySet](TSSMutablePropertySet, "propertySet");
  objc_msgSend(v5, "addProperties:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "propertyMap"), "allProperties"));
  objc_msgSend(v5, "addProperties:", objc_msgSend((id)objc_msgSend(v2, "propertyMap"), "allProperties"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke_2;
  v8[3] = &unk_24D82BF10;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v4;
  v8[5] = v6;
  v8[8] = *(_QWORD *)(a1 + 48);
  v8[6] = v2;
  v8[7] = v3;
  objc_msgSend(v5, "enumeratePropertiesUsingBlock:", v8);
  return v3;
}

uint64_t __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  BOOL v6;

  result = objc_msgSend(*(id *)(a1 + 32), "containsProperty:", a2);
  if ((_DWORD)result)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "boxedValueForProperty:", a2);
    result = objc_msgSend(*(id *)(a1 + 48), "boxedValueForProperty:", a2);
    if (v5)
      v6 = result == 0;
    else
      v6 = 1;
    if (!v6)
      return objc_msgSend(*(id *)(a1 + 56), "setBoxedValue:forProperty:", objc_msgSend(v5, "mixedObjectWithFraction:ofObject:", result, *(double *)(a1 + 64)), a2);
  }
  return result;
}

- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5
{
  id v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a4;
  if (a3 == 517)
  {
    if (a4 && (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null") != a4)
    {
      v9 = *(_OWORD *)&a5->c;
      v13 = *(_OWORD *)&a5->a;
      v14 = v9;
      v15 = *(_OWORD *)&a5->tx;
      return (id)objc_msgSend(v6, "strokeByTransformingByTransform:", &v13);
    }
  }
  else
  {
    if (a3 != 520)
    {
      v12.receiver = self;
      v12.super_class = (Class)TSDShapeStyle;
      v10 = *(_OWORD *)&a5->c;
      v13 = *(_OWORD *)&a5->a;
      v14 = v10;
      v15 = *(_OWORD *)&a5->tx;
      return -[TSSStyle boxedValueForProperty:oldBoxedValue:transformedByTransform:](&v12, sel_boxedValueForProperty_oldBoxedValue_transformedByTransform_, *(_QWORD *)&a3, a4, &v13);
    }
    if (a4 && (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null") != a4)
    {
      v7 = *(_OWORD *)&a5->c;
      v13 = *(_OWORD *)&a5->a;
      v14 = v7;
      v15 = *(_OWORD *)&a5->tx;
      return (id)objc_msgSend(v6, "shadowByTransformingByTransform:", &v13);
    }
  }
  return v6;
}

- (BOOL)wantsHighContrastBackgroundColor
{
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v9;

  v3 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 516);
  v4 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 517);
  -[TSSStyle CGFloatValueForProperty:](self, "CGFloatValueForProperty:", 518);
  v6 = v5;
  if (v3 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
  {
    v7 = (void *)objc_msgSend(v4, "color");
    if ((objc_msgSend(v7, "isAlmostEqualToColor:", objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor")) & 1) != 0)
      return 1;
  }
  v9 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  return v6 != 1.0 && v3 != (id)v9;
}

- (void)fixImageFillTechniqueForSwatchOfSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  id v11;

  height = a3.height;
  width = a3.width;
  v6 = -[TSSStyle boxedValueForProperty:](self, "boxedValueForProperty:", 516);
  if (v6)
  {
    if (v6 != (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        v7 = (void *)TSUDynamicCast();
        if (objc_msgSend(v7, "technique") == 4
          || !objc_msgSend(v7, "technique")
          && ((objc_msgSend(v7, "fillSize"), v9 >= width) ? (v10 = v8 < height) : (v10 = 1), v10))
        {
          v11 = (id)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v11, "setTechnique:", 3);
          -[TSSStyle setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", v11, 516);

        }
      }
    }
  }
}

@end
