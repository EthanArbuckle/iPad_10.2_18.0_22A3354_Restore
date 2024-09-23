@implementation TSDMediaStyle

+ (void)initialize
{
  if (!sDefaultStroke_0)
    sDefaultStroke_0 = (uint64_t)+[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
}

+ (id)imageStylePresetStyleDescriptor
{
  return CFSTR("imageStyle");
}

+ (id)movieStylePresetStyleDescriptor
{
  return CFSTR("movieStyle");
}

+ (id)properties
{
  id result;

  result = (id)properties_sProperties_0;
  if (!properties_sProperties_0)
  {
    result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 517, 518, 519, 520, 0);
    properties_sProperties_0 = (uint64_t)result;
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
  if (a3 == 520 || a3 == 519)
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  if (a3 == 517)
    return (id)sDefaultStroke_0;
  return 0;
}

+ (id)propertiesAllowingNSNull
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)propertiesAllowingNSNull_s_nullProperties;
  if (!propertiesAllowingNSNull_s_nullProperties)
  {
    objc_sync_enter(a1);
    if (!propertiesAllowingNSNull_s_nullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 519, 520, 0);
      __dmb(0xBu);
      propertiesAllowingNSNull_s_nullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMediaStyle propertiesAllowingNSNull]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 135, CFSTR("Couldn't initialize lazy variable %s"), "s_nullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)propertiesAllowingNSNull_s_nullProperties;
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
  v18.super_class = (Class)&OBJC_METACLASS___TSDMediaStyle;
  v6 = objc_msgSendSuper2(&v18, sel_validateFloatValue_forProperty_);
  v8 = v6;
  if (a4 == 518 && v6)
  {
    *(float *)&v7 = *a3;
    if (*a3 < 0.0)
    {
      v9 = 0.0;
      v10 = 147;
LABEL_7:
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v7);
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMediaStyle validateFloatValue:forProperty:]");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m");
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
      v10 = 151;
      goto LABEL_7;
    }
  }
  return v8;
}

- (NSString)presetKind
{
  TSDMediaStyle *v2;
  NSString *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = self;
  v3 = (NSString *)String;
  if (!-[TSSStyle styleIdentifier](self, "styleIdentifier"))
    v2 = -[TSSStyle firstIdentifiedAncestor](v2, "firstIdentifiedAncestor");
  v4 = (void *)String(-[TSSStyle styleIdentifier](v2, "styleIdentifier"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("image")))
    return (NSString *)String;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("movie")))
    return (NSString *)String;
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMediaStyle presetKind]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 180, CFSTR("Could not compute presetKind because of a bad packageString: %@"), v4);
  return v3;
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tsdMapImageStylePropertyMap_;
}

+ (id)p_magicMoveProperties
{
  id result;
  TSSPropertySet *v4;
  void *v5;
  uint64_t v6;

  result = (id)p_magicMoveProperties_s_magicMoveProperties_0;
  if (!p_magicMoveProperties_s_magicMoveProperties_0)
  {
    objc_sync_enter(a1);
    if (!p_magicMoveProperties_s_magicMoveProperties_0)
    {
      v4 = +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 512, 513, 515, 517, 518, 519, 520, 528, 529, 0);
      __dmb(0xBu);
      p_magicMoveProperties_s_magicMoveProperties_0 = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMediaStyle p_magicMoveProperties]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 211, CFSTR("Couldn't initialize lazy variable %s"), "s_magicMoveProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)p_magicMoveProperties_s_magicMoveProperties_0;
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSDMediaStyle_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDMediaStyle_mixingTypeWithObject___block_invoke(uint64_t a1)
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
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMediaStyle mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 221, CFSTR("nil object after cast"));
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
  v10[2] = __38__TSDMediaStyle_mixingTypeWithObject___block_invoke_2;
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

uint64_t __38__TSDMediaStyle_mixingTypeWithObject___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = objc_msgSend(*(id *)(a1 + 32), "containsProperty:", a2);
  if ((_DWORD)result)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "boxedValueForProperty:", a2);
    v8 = objc_msgSend(*(id *)(a1 + 48), "boxedValueForProperty:", a2);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = TSDMixingTypeWithPossiblyNilObjects(v7, v8);
    result = TSDMixingTypeBestFromMixingTypes(v9, v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
      *a3 = 1;
  }
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
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
  v8[2] = __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke_2;
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

uint64_t __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsProperty:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 56), "setBoxedValue:forProperty:", TSDMixedObjectWithPossiblyNilObjects((void *)objc_msgSend(*(id *)(a1 + 40), "boxedValueForProperty:", a2), (void *)objc_msgSend(*(id *)(a1 + 48), "boxedValueForProperty:", a2), *(double *)(a1 + 64)), a2);
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
      v12.super_class = (Class)TSDMediaStyle;
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

@end
