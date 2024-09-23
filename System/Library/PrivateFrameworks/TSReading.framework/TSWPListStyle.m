@implementation TSWPListStyle

+ (int)pLabelTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4 includeDegenerateLevels:(BOOL)a5
{
  int result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForProperty:", 180), "objectAtIndexedSubscript:", a3), "intValue");
  if (!a5)
  {
    if (result == 1)
    {
      v12 = (void *)objc_msgSend(a4, "objectForProperty:", 182);
      if (v12)
      {
        v13 = v12;
        if (objc_msgSend(v12, "count") > (unint64_t)a3
          && (objc_msgSend(a1, "isDefaultMissingBulletImage:", objc_msgSend(v13, "objectAtIndexedSubscript:", a3)) & 1) == 0)
        {
          v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
          if (v14 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
            return 1;
        }
      }
    }
    else
    {
      if (result != 2)
        return result;
      v10 = (void *)objc_msgSend(a4, "objectForProperty:", 183);
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "count") > (unint64_t)a3
          && !objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", a3), "isEqualToString:", &stru_24D82FEB0))
        {
          return 2;
        }
      }
    }
    return 0;
  }
  return result;
}

- (int)effectiveTypeForLevel:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "pLabelTypeForLevel:forPropertyMapping:includeDegenerateLevels:", a3, self, 0);
}

- (double)labelIndentForLevel:(unint64_t)a3
{
  double result;

  if (a3 > 8)
    return 0.0;
  objc_msgSend((id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 177), "objectAtIndexedSubscript:", a3), "doubleValue");
  return result;
}

- (int)labelTypeForLevel:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "pLabelTypeForLevel:forPropertyMapping:includeDegenerateLevels:", a3, self, 1);
}

- (double)textIndentForLevel:(unint64_t)a3 fontSize:(double)a4
{
  double v5;

  v5 = 0.0;
  if (a3 <= 8)
    objc_msgSend((id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 176, 0.0), "objectAtIndexedSubscript:", a3), "doubleValue");
  return v5 * a4;
}

+ (id)properties
{
  if (+[TSWPListStyle properties]::onceToken != -1)
    dispatch_once(&+[TSWPListStyle properties]::onceToken, &__block_literal_global_7);
  return (id)+[TSWPListStyle properties]::s_properties;
}

- (TSWPListStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPListStyle;
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:](&v7, sel_initWithContext_name_overridePropertyMap_isVariation_, a3, a4, a5, a6);
}

+ (id)defaultPropertyMap
{
  TSWPListLabelGeometry *v3;
  uint64_t v4;
  TSSPropertyMap *v5;
  uint64_t v6;
  TSSPropertyMap *v7;
  _QWORD v9[10];

  v9[9] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSWPListLabelGeometry initWithScale:scaleWithText:baselineOffset:]([TSWPListLabelGeometry alloc], "initWithScale:scaleWithText:baselineOffset:", 1, 1.0, 0.0);
  v4 = objc_msgSend(a1, "defaultLabelIndents");
  v5 = [TSSPropertyMap alloc];
  v6 = objc_msgSend(a1, "pLabelTypeArrayForType:", 0);
  v9[0] = v3;
  v9[1] = v3;
  v9[2] = v3;
  v9[3] = v3;
  v9[4] = v3;
  v9[5] = v3;
  v9[6] = v3;
  v9[7] = v3;
  v9[8] = v3;
  v7 = -[TSSPropertyMap initWithPropertiesAndValues:](v5, "initWithPropertiesAndValues:", 180, v6, 176, v4, 177, &unk_24D8FA338, 181, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 9), 0);

  return v7;
}

+ (id)pLabelTypeArrayForType:(int)a3
{
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  v4[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4[1] = v4[0];
  v4[2] = v4[0];
  v4[3] = v4[0];
  v4[4] = v4[0];
  v4[5] = v4[0];
  v4[6] = v4[0];
  v4[7] = v4[0];
  v4[8] = v4[0];
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 9);
}

+ (id)defaultLabelIndents
{
  id result;
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  result = (id)+[TSWPListStyle defaultLabelIndents]::s_defaultLabelIndents;
  if (!+[TSWPListStyle defaultLabelIndents]::s_defaultLabelIndents)
  {
    memset_pattern16(v3, &unk_24D82DD30, 0x48uLL);
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", v3, 9);
    +[TSWPListStyle defaultLabelIndents]::s_defaultLabelIndents = (uint64_t)result;
  }
  return result;
}

TSSPropertySet *__27__TSWPListStyle_properties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 18, 16, 44, 178, 181, 182, 177, 184, 185, 183, 180, 176, 40, 179, 186, 0);
  +[TSWPListStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)stickyOverrideProperties
{
  if (+[TSWPListStyle stickyOverrideProperties]::onceToken != -1)
    dispatch_once(&+[TSWPListStyle stickyOverrideProperties]::onceToken, &__block_literal_global_71);
  return (id)+[TSWPListStyle stickyOverrideProperties]::s_properties;
}

TSSPropertySet *__41__TSWPListStyle_stickyOverrideProperties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 181, 182, 184, 185, 183, 180, 176, 0);
  +[TSWPListStyle stickyOverrideProperties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  if (+[TSWPListStyle propertiesAllowingNSNull]::onceToken != -1)
    dispatch_once(&+[TSWPListStyle propertiesAllowingNSNull]::onceToken, &__block_literal_global_8_0);
  return (id)+[TSWPListStyle propertiesAllowingNSNull]::s_nullProperties;
}

TSSPropertySet *__41__TSWPListStyle_propertiesAllowingNSNull__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 18, 16, 40, 0);
  +[TSWPListStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (BOOL)isDefaultMissingBulletImage:(id)a3
{
  void *v3;

  objc_opt_class();
  v3 = (void *)TSUDynamicCast();
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend(v3, "filename"), "isEqualToString:", CFSTR("TSWPMissingBulletImage.png"));
  return (char)v3;
}

+ (int)effectiveTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4
{
  return objc_msgSend((id)objc_opt_class(), "pLabelTypeForLevel:forPropertyMapping:includeDegenerateLevels:", a3, a4, 0);
}

+ (int)labelTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4
{
  return objc_msgSend((id)objc_opt_class(), "pLabelTypeForLevel:forPropertyMapping:includeDegenerateLevels:", a3, a4, 1);
}

- (int)firstLabelType
{
  return objc_msgSend((id)objc_opt_class(), "firstLabelTypeForPropertyMapping:", self);
}

+ (int)firstLabelTypeForPropertyMapping:(id)a3
{
  uint64_t v4;
  int result;

  v4 = 0;
  do
  {
    result = objc_msgSend((id)objc_opt_class(), "pLabelTypeForLevel:forPropertyMapping:includeDegenerateLevels:", v4, a3, 1);
    if (result)
      break;
  }
  while (v4++ != 8);
  return result;
}

+ (id)defaultLabelString
{
  id result;

  result = (id)+[TSWPListStyle defaultLabelString]::s_defaultLabelString;
  if (!+[TSWPListStyle defaultLabelString]::s_defaultLabelString)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8226);
    +[TSWPListStyle defaultLabelString]::s_defaultLabelString = (uint64_t)result;
  }
  return result;
}

+ (int)defaultLabelNumberType
{
  return 0;
}

+ (BOOL)defaultTieredNumber
{
  return 0;
}

+ (void)pGetDefaultTextIndentFloats:(double)a3[9]
{
  uint64_t v3;
  int64x2_t v4;
  uint64x2_t v5;
  int64x2_t v6;

  v3 = 0;
  v4 = (int64x2_t)xmmword_217C27AF0;
  v5 = (uint64x2_t)vdupq_n_s64(9uLL);
  v6 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v5, (uint64x2_t)v4)).u8[0] & 1) != 0)
      a3[v3] = (float)((float)v3 * 36.0);
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v4)).i32[1] & 1) != 0)
      a3[v3 + 1] = (float)((float)(v3 + 1) * 36.0);
    v3 += 2;
    v4 = vaddq_s64(v4, v6);
  }
  while (v3 != 10);
}

+ (id)defaultTextIndents
{
  id result;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  result = (id)+[TSWPListStyle defaultTextIndents]::s_defaultTextIndents;
  if (!+[TSWPListStyle defaultTextIndents]::s_defaultTextIndents)
  {
    objc_msgSend(a1, "pGetDefaultTextIndentFloats:", v4);
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithCGFloats:count:", v4, 9);
    +[TSWPListStyle defaultTextIndents]::s_defaultTextIndents = (uint64_t)result;
  }
  return result;
}

+ (id)defaultLabelGeometries
{
  id result;
  id v3;
  uint64_t i;
  _BYTE v5[72];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  result = (id)+[TSWPListStyle defaultLabelGeometries]::s_defaultLabelGeometries;
  if (!+[TSWPListStyle defaultLabelGeometries]::s_defaultLabelGeometries)
  {
    v3 = +[TSWPListLabelGeometry listLabelGeometry](TSWPListLabelGeometry, "listLabelGeometry");
    for (i = 0; i != 72; i += 8)
      *(_QWORD *)&v5[i] = v3;
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", v5, 9);
    +[TSWPListStyle defaultLabelGeometries]::s_defaultLabelGeometries = (uint64_t)result;
  }
  return result;
}

+ (id)defaultMissingBulletImage
{
  return +[TSPData readOnlyDataFromURL:context:](TSPData, "readOnlyDataFromURL:context:", objc_msgSend((id)TSWPBundle(), "URLForResource:withExtension:", objc_msgSend(CFSTR("TSWPMissingBulletImage.png"), "stringByDeletingPathExtension"), objc_msgSend(CFSTR("TSWPMissingBulletImage.png"), "pathExtension")), 0);
}

+ (id)defaultStyleWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, objc_msgSend(a1, "defaultPropertyMap"), 0);
}

+ (id)defaultStyleWithContext:(id)a3 type:(int)a4
{
  uint64_t v4;
  TSWPListLabelGeometry *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  TSSPropertyMap *v12;
  uint64_t v13;
  TSSPropertyMap *v14;
  id v15;
  _QWORD v17[9];
  _QWORD v18[9];
  _QWORD v19[10];

  v4 = *(_QWORD *)&a4;
  v19[9] = *MEMORY[0x24BDAC8D0];
  v7 = -[TSWPListLabelGeometry initWithScale:scaleWithText:baselineOffset:]([TSWPListLabelGeometry alloc], "initWithScale:scaleWithText:baselineOffset:", 1, dbl_217C2AEC8[a4], 0.0);
  if ((v4 - 1) >= 2)
  {
    if ((_DWORD)v4 != 3)
    {
      v10 = objc_msgSend(a1, "defaultLabelIndents");
      goto LABEL_7;
    }
    v18[0] = &unk_24D8FB830;
    v18[1] = &unk_24D8FB830;
    v18[2] = &unk_24D8FB830;
    v18[3] = &unk_24D8FB830;
    v18[4] = &unk_24D8FB830;
    v18[5] = &unk_24D8FB830;
    v18[6] = &unk_24D8FB830;
    v18[7] = &unk_24D8FB830;
    v18[8] = &unk_24D8FB830;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = v18;
  }
  else
  {
    v19[0] = &unk_24D8FB820;
    v19[1] = &unk_24D8FB820;
    v19[2] = &unk_24D8FB820;
    v19[3] = &unk_24D8FB820;
    v19[4] = &unk_24D8FB820;
    v19[5] = &unk_24D8FB820;
    v19[6] = &unk_24D8FB820;
    v19[7] = &unk_24D8FB820;
    v19[8] = &unk_24D8FB820;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = v19;
  }
  v10 = objc_msgSend(v8, "arrayWithObjects:count:", v9, 9);
LABEL_7:
  v11 = v10;
  v12 = [TSSPropertyMap alloc];
  v13 = objc_msgSend(a1, "pLabelTypeArrayForType:", v4);
  v17[0] = v7;
  v17[1] = v7;
  v17[2] = v7;
  v17[3] = v7;
  v17[4] = v7;
  v17[5] = v7;
  v17[6] = v7;
  v17[7] = v7;
  v17[8] = v7;
  v14 = -[TSSPropertyMap initWithPropertiesAndValues:](v12, "initWithPropertiesAndValues:", 180, v13, 176, v11, 177, &unk_24D8FA350, 181, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 9), 0);

  if ((_DWORD)v4)
  {
    -[TSSPropertyMap setObject:forProperty:](v14, "setObject:forProperty:", objc_msgSend(a1, "pDefaultLabelValuesForLabelTypeProperty:", +[TSWPListStyle defaultStyleWithContext:type:]::labelSpecificProperties[v4]), +[TSWPListStyle defaultStyleWithContext:type:]::labelSpecificProperties[v4]);
    if ((_DWORD)v4 == 3)
      -[TSSPropertyMap setObject:forProperty:](v14, "setObject:forProperty:", objc_msgSend(a1, "pDefaultLabelValuesForLabelTypeProperty:", 185), 185);
  }
  v15 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, v14, 0);

  return v15;
}

+ (id)harvardStyleWithContext:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  TSSPropertyMap *v7;
  id v8;

  v5 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithInts:count:", &sHarvardNumberFormats, 9);
  v6 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithCGFloats:count:", &sHarvardLabelIndents, 9);
  v7 = -[TSSPropertyMap initWithPropertiesAndValues:]([TSSPropertyMap alloc], "initWithPropertiesAndValues:", 180, objc_msgSend(a1, "pLabelTypeArrayForType:", 3), 176, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithCGFloats:count:", &sHarvardTextIndents, 9), 177, v6, 181, objc_msgSend((id)objc_opt_class(), "defaultLabelGeometries"), 184, v5, 185, objc_msgSend(a1, "pDefaultLabelValuesForLabelTypeProperty:", 185), 0);
  v8 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, v7, 0);

  return v8;
}

+ (id)numberedlistStyleForPresets:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v20;
  do
  {
    v7 = 0;
LABEL_4:
    if (*(_QWORD *)v20 != v6)
      objc_enumerationMutation(a3);
    v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
    v9 = (void *)objc_msgSend(v8, "objectForProperty:", 180);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (!v10)
      break;
    v11 = v10;
    v12 = *(_QWORD *)v16;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v9);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "intValue") != 3)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
          goto LABEL_8;
        return v8;
      }
    }
    if (++v7 != v5)
      goto LABEL_4;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    v8 = 0;
  }
  while (v5);
  return v8;
}

- (id)pOverrideArrayWithValue:(id)a3 forProperty:(int)a4 atParagraphLevels:(id)a5 withContext:(id)a6
{
  uint64_t v7;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v7 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[TSSStyle valueForProperty:](self, "valueForProperty:", v7);
  v10 = TSUDynamicCast();
  if (!v10)
    v10 = objc_msgSend((id)objc_opt_class(), "pDefaultLabelValuesForLabelTypeProperty:", v7);
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v10);
  if (a3)
  {
    v22 = 0u;
    v23 = 0u;
    if (!a5)
      a5 = &unk_24D8FA368;
    v20 = 0uLL;
    v21 = 0uLL;
    v12 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(a5);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "intValue");
          if (objc_msgSend(v11, "count") <= (unint64_t)v16)
          {
            v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:]");
            objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"), 784, CFSTR("out of paragraph level bounds"));
          }
          if (objc_msgSend(v11, "count") > (unint64_t)v16)
            objc_msgSend(v11, "setObject:atIndexedSubscript:", a3, v16);
        }
        v13 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }
  }
  return v11;
}

- (id)overridePropertyMapWithValue:(id)a3 forProperty:(int)a4 atParagraphLevels:(id)a5 withContext:(id)a6
{
  uint64_t v8;
  TSSPropertyMap *v11;
  id v12;
  TSSPropertyMap *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v8 = *(_QWORD *)&a4;
  v11 = objc_alloc_init(TSSPropertyMap);
  switch((int)v8)
  {
    case 180:
      switch(objc_msgSend(a3, "intValue"))
      {
        case 0u:
          goto LABEL_9;
        case 1u:
          v12 = -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", -[TSWPImageBulletProvider dataForDefaultImageBulletWithContext:](+[TSWPImageBulletProvider sharedInstance](TSWPImageBulletProvider, "sharedInstance"), "dataForDefaultImageBulletWithContext:", a6), 182, a5, a6);
          v13 = v11;
          v14 = 182;
          goto LABEL_8;
        case 2u:
          v12 = -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", +[TSWPListStyle defaultLabelString](TSWPListStyle, "defaultLabelString"), 183, a5, a6);
          v13 = v11;
          v14 = 183;
          goto LABEL_8;
        case 3u:
          -[TSSPropertyMap setObject:forProperty:](v11, "setObject:forProperty:", -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[TSWPListStyle defaultLabelNumberType](TSWPListStyle, "defaultLabelNumberType")), 184, a5, a6), 184);
          v12 = -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[TSWPListStyle defaultTieredNumber](TSWPListStyle, "defaultTieredNumber")), 185, a5, a6);
          v13 = v11;
          v14 = 185;
          goto LABEL_8;
        default:
          v23 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPListStyle overridePropertyMapWithValue:forProperty:atParagraphLevels:withContext:]");
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm");
          v18 = CFSTR("Not covering a list type in inspector setter");
          v19 = (void *)v23;
          v20 = v24;
          v21 = 828;
          goto LABEL_5;
      }
    case 182:
    case 183:
      break;
    case 184:
      -[TSSPropertyMap setObject:forProperty:](v11, "setObject:forProperty:", -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", 0, 185, a5, a6), 185);
      goto LABEL_7;
    case 185:
LABEL_7:
      v12 = -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", 0, 184, a5, a6);
      v13 = v11;
      v14 = 184;
LABEL_8:
      -[TSSPropertyMap setObject:forProperty:](v13, "setObject:forProperty:", v12, v14);
      break;
    default:
      v15 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPListStyle overridePropertyMapWithValue:forProperty:atParagraphLevels:withContext:]");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm");
      v18 = CFSTR("Unhandled override property in list");
      v19 = (void *)v15;
      v20 = v16;
      v21 = 849;
LABEL_5:
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, v17, v21, v18);
      break;
  }
LABEL_9:
  -[TSSPropertyMap setObject:forProperty:](v11, "setObject:forProperty:", -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", a3, v8, a5, a6), v8);
  return v11;
}

+ (TSWPListStyle)listStyleWithNumberType:(int)a3 inStyleSheet:(id)a4 withNumberedPresetStyle:(id)a5
{
  id v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  TSWPListStyle *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v9 = (float)a3;
  v10 = (void *)objc_msgSend(v8, "initWithFloat:", v9);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = (void *)objc_msgSend(a4, "childrenOfStyle:", a5, 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(TSWPListStyle **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (-[TSWPListStyle effectiveTypeForLevel:](v16, "effectiveTypeForLevel:", 0) == 3)
        {
          v17 = -[TSSStyle valueForProperty:](v16, "valueForProperty:", 184);
          v18 = 0;
          while ((objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", v18), "isEqual:", v10) & 1) != 0)
          {
            if (++v18 == 9)
              goto LABEL_16;
          }
        }
        else
        {
          v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPListStyle listStyleWithNumberType:inStyleSheet:withNumberedPresetStyle:]");
          objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"), 871, CFSTR("Expected numbered list style"));
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v16 = 0;
    }
    while (v13);
  }
  else
  {
    v16 = 0;
  }
LABEL_16:

  return v16;
}

+ (id)propertyMapForListNumberType:(int)a3
{
  id v5;
  double v6;
  void *v7;
  TSSPropertyMap *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;

  v5 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v6 = (float)a3;
  v7 = (void *)objc_msgSend(v5, "initWithFloat:", v6);
  v8 = objc_alloc_init(TSSPropertyMap);
  -[TSSPropertyMap setObject:forProperty:](v8, "setObject:forProperty:", objc_msgSend(a1, "pLabelTypeArrayForType:", 3), 180);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 9;
  v12 = MEMORY[0x24BDBD1C0];
  do
  {
    objc_msgSend(v9, "addObject:", v7);
    objc_msgSend(v10, "addObject:", v12);
    --v11;
  }
  while (v11);
  -[TSSPropertyMap setObject:forProperty:](v8, "setObject:forProperty:", v9, 184);
  -[TSSPropertyMap setObject:forProperty:](v8, "setObject:forProperty:", v10, 185);

  return v8;
}

+ (id)CJKListNameForNumberType:(int)a3
{
  const __CFString *v3;

  if (a3 > 32)
  {
    switch(a3)
    {
      case '*':
        v3 = CFSTR("Chinese Financial Numerals - Trad.");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case '+':
      case ',':
      case '.':
      case '/':
      case '2':
      case '3':
      case '5':
      case '6':
      case '8':
      case '9':
      case ';':
      case '<':
        return 0;
      case '-':
        v3 = CFSTR("Korean");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case '0':
        v3 = CFSTR("Circled Numbers");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case '1':
        v3 = CFSTR("Arabic");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case '4':
        v3 = CFSTR("Arabic Alpha");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case '7':
        v3 = CFSTR("Arabic Abjad");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case ':':
        v3 = CFSTR("Hebrew Alpha");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      case '=':
        v3 = CFSTR("Hebrew Biblical");
        return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
      default:
        if (a3 == 33)
        {
          v3 = CFSTR("Chinese Numerals - Trad.");
        }
        else
        {
          if (a3 != 39)
            return 0;
          v3 = CFSTR("Chinese Financial Numerals - Simp.");
        }
        break;
    }
    return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
  }
  if (a3 <= 20)
  {
    if (a3 == 15)
    {
      v3 = CFSTR("Kanji");
      return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
    }
    if (a3 == 18)
    {
      v3 = CFSTR("Hiragana");
      return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
    }
    return 0;
  }
  if (a3 == 21)
  {
    v3 = CFSTR("Katakana");
    return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
  }
  if (a3 == 27)
  {
    v3 = CFSTR("Katakana Iroha");
    return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
  }
  if (a3 != 30)
    return 0;
  v3 = CFSTR("Chinese Numerals - Simp.");
  return (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v3, &stru_24D82FEB0, CFSTR("TSText"));
}

+ (id)pDefaultLabelValuesForLabelTypeProperty:(int)a3
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  id result;
  _QWORD v8[9];
  _QWORD v9[9];
  _QWORD v10[9];
  _QWORD v11[10];

  v11[9] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 182:
      v8[0] = objc_msgSend(a1, "defaultMissingBulletImage");
      v8[1] = v8[0];
      v8[2] = v8[0];
      v8[3] = v8[0];
      v8[4] = v8[0];
      v8[5] = v8[0];
      v8[6] = v8[0];
      v8[7] = v8[0];
      v8[8] = v8[0];
      v3 = (void *)MEMORY[0x24BDBCE30];
      v4 = v8;
      goto LABEL_7;
    case 183:
      v11[0] = objc_msgSend(a1, "defaultLabelString");
      v11[1] = v11[0];
      v11[2] = v11[0];
      v11[3] = v11[0];
      v11[4] = v11[0];
      v11[5] = v11[0];
      v11[6] = v11[0];
      v11[7] = v11[0];
      v11[8] = v11[0];
      v3 = (void *)MEMORY[0x24BDBCE30];
      v4 = v11;
      goto LABEL_7;
    case 184:
      v10[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[TSWPListStyle defaultLabelNumberType](TSWPListStyle, "defaultLabelNumberType"));
      v10[1] = v10[0];
      v10[2] = v10[0];
      v10[3] = v10[0];
      v10[4] = v10[0];
      v10[5] = v10[0];
      v10[6] = v10[0];
      v10[7] = v10[0];
      v10[8] = v10[0];
      v3 = (void *)MEMORY[0x24BDBCE30];
      v4 = v10;
      goto LABEL_7;
    case 185:
      v9[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[TSWPListStyle defaultTieredNumber](TSWPListStyle, "defaultTieredNumber"));
      v9[1] = v9[0];
      v9[2] = v9[0];
      v9[3] = v9[0];
      v9[4] = v9[0];
      v9[5] = v9[0];
      v9[6] = v9[0];
      v9[7] = v9[0];
      v9[8] = v9[0];
      v3 = (void *)MEMORY[0x24BDBCE30];
      v4 = v9;
LABEL_7:
      result = (id)objc_msgSend(v3, "arrayWithObjects:count:", v4, 9);
      break;
    default:
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPListStyle pDefaultLabelValuesForLabelTypeProperty:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"), 1029, CFSTR("Unhandled array property in list"));
      result = 0;
      break;
  }
  return result;
}

- (NSString)presetKind
{
  return (NSString *)String;
}

+ (id)presetStyleDescriptor
{
  return CFSTR("liststyle");
}

@end
