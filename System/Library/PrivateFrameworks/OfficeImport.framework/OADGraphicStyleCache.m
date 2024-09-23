@implementation OADGraphicStyleCache

- (OADGraphicStyleCache)init
{
  OADGraphicStyleCache *v2;
  uint64_t i;
  OADGraphicFeatureCache *v4;
  void *v5;
  OADGraphicFeatureCache *v6;
  OADGraphicFeatureCache *mStrokeCache;
  OADGraphicFeatureCache *v8;
  OADGraphicFeatureCache *mShadowCache;
  OADGraphicFeatureCache *v10;
  OADGraphicFeatureCache *mColorCache;
  OADGraphicFeatureCache *v12;
  OADGraphicFeatureCache *mFontFaceCache;
  OADGraphicFeatureCache *v14;
  OADGraphicFeatureCache *mTextStyleCache;
  OADGraphicFeatureCache *v16;
  OADGraphicFeatureCache *mTableIdCache;
  NSMutableDictionary *v18;
  NSMutableDictionary *mTableStyleCache;
  OADGraphicFeatureCache *v20;
  OADGraphicFeatureCache *mChartIdCache;
  uint64_t j;
  OADGraphicFeatureCache *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)OADGraphicStyleCache;
  v2 = -[OADGraphicStyleCache init](&v26, sel_init);
  if (v2)
  {
    for (i = 8; i != 40; i += 8)
    {
      v4 = objc_alloc_init(OADGraphicFeatureCache);
      v5 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = (Class)v4;

    }
    v6 = objc_alloc_init(OADGraphicFeatureCache);
    mStrokeCache = v2->mStrokeCache;
    v2->mStrokeCache = v6;

    v8 = objc_alloc_init(OADGraphicFeatureCache);
    mShadowCache = v2->mShadowCache;
    v2->mShadowCache = v8;

    v10 = objc_alloc_init(OADGraphicFeatureCache);
    mColorCache = v2->mColorCache;
    v2->mColorCache = v10;

    v12 = objc_alloc_init(OADGraphicFeatureCache);
    mFontFaceCache = v2->mFontFaceCache;
    v2->mFontFaceCache = v12;

    v14 = objc_alloc_init(OADGraphicFeatureCache);
    mTextStyleCache = v2->mTextStyleCache;
    v2->mTextStyleCache = v14;

    v16 = objc_alloc_init(OADGraphicFeatureCache);
    mTableIdCache = v2->mTableIdCache;
    v2->mTableIdCache = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mTableStyleCache = v2->mTableStyleCache;
    v2->mTableStyleCache = v18;

    v20 = objc_alloc_init(OADGraphicFeatureCache);
    mChartIdCache = v2->mChartIdCache;
    v2->mChartIdCache = v20;

    for (j = 104; j != 136; j += 8)
    {
      v23 = objc_alloc_init(OADGraphicFeatureCache);
      v24 = *(Class *)((char *)&v2->super.isa + j);
      *(Class *)((char *)&v2->super.isa + j) = (Class)v23;

    }
  }
  return v2;
}

- (unint64_t)cacheStroke:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "fill");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[OADGraphicStyleCache fillCatagory:](OADGraphicStyleCache, "fillCatagory:", v5);

  if (v6 == 4)
    v7 = 0;
  else
    v7 = -[OADGraphicFeatureCache cacheFeature:](self->mStrokeCache, "cacheFeature:", v4);

  return v7;
}

+ (int)fillCatagory:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  float v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  float v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = objc_opt_class();
    TSUDynamicCast(v5, (uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OADColor alphaWithColor:](OADColor, "alphaWithColor:", v8);
      v10 = v9;

      if (v10 <= 0.08)
        v4 = 4;
      else
        v4 = 0;
    }
    else
    {
      v11 = objc_opt_class();
      TSUDynamicCast(v11, (uint64_t)v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v12, "stops", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v33 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "color");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[OADColor alphaWithColor:](OADColor, "alphaWithColor:", v18);
              v20 = v19 <= 0.08;

              if (!v20)
              {
                v4 = 1;
                goto LABEL_19;
              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v15)
              continue;
            break;
          }
        }
        v4 = 4;
LABEL_19:

      }
      else
      {
        v21 = objc_opt_class();
        TSUDynamicCast(v21, (uint64_t)v3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "blipRef");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "effectCount");
          if (v25)
          {
            v26 = 0;
            while (1)
            {
              v27 = objc_opt_class();
              objc_msgSend(v24, "effectAtIndex:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              TSUDynamicCast(v27, (uint64_t)v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                objc_msgSend(v29, "alpha");
                if (v30 <= 0.08)
                  break;
              }

              if (v25 == ++v26)
                goto LABEL_26;
            }

            v4 = 4;
          }
          else
          {
LABEL_26:
            v4 = 2;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v4 = 3;
          else
            v4 = 4;
        }

      }
    }

  }
  else
  {
    v4 = 4;
  }

  return v4;
}

- (unint64_t)cacheShadow:(id)a3
{
  return -[OADGraphicFeatureCache cacheFeature:](self->mShadowCache, "cacheFeature:", a3);
}

- (void)dealloc
{
  uint64_t i;
  void *v4;
  OADGraphicFeatureCache *mStrokeCache;
  OADGraphicFeatureCache *mShadowCache;
  OADGraphicFeatureCache *mColorCache;
  OADGraphicFeatureCache *mFontFaceCache;
  OADGraphicFeatureCache *mTextStyleCache;
  OADGraphicFeatureCache *mTableIdCache;
  NSMutableDictionary *mTableStyleCache;
  OADGraphicFeatureCache *mChartIdCache;
  uint64_t j;
  void *v14;
  objc_super v15;

  for (i = 8; i != 40; i += 8)
  {
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;

  }
  mStrokeCache = self->mStrokeCache;
  self->mStrokeCache = 0;

  mShadowCache = self->mShadowCache;
  self->mShadowCache = 0;

  mColorCache = self->mColorCache;
  self->mColorCache = 0;

  mFontFaceCache = self->mFontFaceCache;
  self->mFontFaceCache = 0;

  mTextStyleCache = self->mTextStyleCache;
  self->mTextStyleCache = 0;

  mTableIdCache = self->mTableIdCache;
  self->mTableIdCache = 0;

  mTableStyleCache = self->mTableStyleCache;
  self->mTableStyleCache = 0;

  mChartIdCache = self->mChartIdCache;
  self->mChartIdCache = 0;

  for (j = 104; j != 136; j += 8)
  {
    v14 = *(Class *)((char *)&self->super.isa + j);
    *(Class *)((char *)&self->super.isa + j) = 0;

  }
  v15.receiver = self;
  v15.super_class = (Class)OADGraphicStyleCache;
  -[OADGraphicStyleCache dealloc](&v15, sel_dealloc);
}

- (unint64_t)cacheFill:(id)a3 returnCategory:(int *)a4
{
  id v6;
  int v7;
  unint64_t v8;

  v6 = a3;
  v7 = +[OADGraphicStyleCache fillCatagory:](OADGraphicStyleCache, "fillCatagory:", v6);
  if (a4)
    *a4 = v7;
  if (v7 > 3)
    v8 = 0;
  else
    v8 = -[OADGraphicFeatureCache cacheFeature:](self->mFillCacheArray[v7], "cacheFeature:", v6);

  return v8;
}

- (id)fontFaceCache
{
  return self->mFontFaceCache;
}

- (id)colorCache
{
  return self->mColorCache;
}

- (void)cacheTableStyle:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("{"))
    && objc_msgSend(v4, "hasSuffix:", CFSTR("}"))
    && objc_msgSend(v4, "length") == 38)
  {
    objc_msgSend(v4, "substringWithRange:", 1, objc_msgSend(v4, "length") - 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (v4)
  {
    -[OADGraphicFeatureCache cacheFeature:](self->mTableIdCache, "cacheFeature:", v4);
    -[NSMutableDictionary setObject:forKey:](self->mTableStyleCache, "setObject:forKey:", v6, v4);
  }

}

- (void)cacheChartStyleId:(int)a3
{
  OADGraphicFeatureCache *mChartIdCache;
  id v4;

  mChartIdCache = self->mChartIdCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OADGraphicFeatureCache cacheFeature:](mChartIdCache, "cacheFeature:");

}

- (id)tableStyleForId:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mTableStyleCache, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)cacheDrawablePropertiesOfCategory:(int)a3 withFillCategory:(int)a4 fillIndex:(unint64_t)a5 strokeIndex:(unint64_t)a6 shadowIndex:(unint64_t)a7 reflectionOpacity:(float)a8 textStyleIndex:(unint64_t)a9
{
  OADCachedDrawableStyle *v11;
  unint64_t v12;

  v11 = -[OADCachedDrawableStyle initWithFillCategory:mFillIndex:strokeIndex:shadowIndex:reflectionOpacity:textStyleIndex:]([OADCachedDrawableStyle alloc], "initWithFillCategory:mFillIndex:strokeIndex:shadowIndex:reflectionOpacity:textStyleIndex:", *(_QWORD *)&a4, a5, a6, a7, (int)(a8 * 255.0), a9);
  v12 = -[OADGraphicFeatureCache cacheFeature:](self->mDrawableStyleCacheArray[a3], "cacheFeature:", v11);

  return v12;
}

- (unint64_t)cacheDrawablePropertiesOfCategory:(int)a3 withGraphicProperties:(id)a4 textBodyProperties:(id)a5 paragraphProperties:(id)a6 characterProperties:(id)a7 colorContext:(id)a8
{
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  char v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  double v30;
  int v31;
  uint64_t v32;
  OADCachedTextStyle *v33;
  unint64_t v35;
  OADGraphicStyleCache *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unsigned int v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v37 = a5;
  v38 = a6;
  v39 = a7;
  v40 = a8;
  v41 = v14;
  v46 = 4;
  if (a3)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v14, "fill");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[OADGraphicStyleCache cacheFill:returnCategory:](self, "cacheFill:returnCategory:", v16, &v46);

    if (!v15)
    {
      v19 = 0;
      goto LABEL_35;
    }
  }
  objc_msgSend(v14, "stroke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[OADGraphicStyleCache cacheStroke:](self, "cacheStroke:", v17);

  if (v18
    || ((v19 = 0, !a3) ? (v20 = v15 == 0) : (v20 = 0),
        !v20 ? (v21 = 0) : (v21 = 1),
        (a3 - 1) >= 2 && (v21 & 1) == 0))
  {
    objc_msgSend(v14, "effects");
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    v35 = v18;
    v36 = self;
    v24 = 0;
    v25 = 0;
    if (!v23)
      goto LABEL_31;
    v26 = *(_QWORD *)v43;
    while (1)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (v24)
        {
          if (v25)
            continue;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v24 = v28;
            if (v25)
              continue;
          }
          else
          {
            v24 = 0;
            if (v25)
              continue;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v28;
        else
          v25 = 0;
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (!v23)
      {
LABEL_31:

        v29 = -[OADGraphicStyleCache cacheShadow:](v36, "cacheShadow:", v24);
        objc_msgSend(v25, "startOpacity");
        v31 = LODWORD(v30);
        if ((a3 & 0xFFFFFFFD) == 1)
        {
          v32 = 0;
        }
        else
        {
          v33 = -[OADCachedTextStyle initWithTextBodyProperties:paragraphProperties:characterProperties:colorContext:graphicStyleCache:]([OADCachedTextStyle alloc], "initWithTextBodyProperties:paragraphProperties:characterProperties:colorContext:graphicStyleCache:", v37, v38, v39, v40, v36);
          v32 = -[OADGraphicFeatureCache cacheFeature:](v36->mTextStyleCache, "cacheFeature:", v33);

        }
        LODWORD(v30) = v31;
        v19 = -[OADGraphicStyleCache cacheDrawablePropertiesOfCategory:withFillCategory:fillIndex:strokeIndex:shadowIndex:reflectionOpacity:textStyleIndex:](v36, "cacheDrawablePropertiesOfCategory:withFillCategory:fillIndex:strokeIndex:shadowIndex:reflectionOpacity:textStyleIndex:", a3, v46, v15, v35, v29, v32, v30);

        break;
      }
    }
  }
LABEL_35:

  return v19;
}

- (id)countedDrawableStyleOfCategory:(int)a3 atIndex:(unint64_t)a4
{
  return -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mDrawableStyleCacheArray[a3], "countedFeatureAtIndex:", a4);
}

- (id)strokes
{
  return -[OADGraphicFeatureCache featuresSortedByUsageCount](self->mStrokeCache, "featuresSortedByUsageCount");
}

- (id)shadows
{
  return -[OADGraphicFeatureCache featuresSortedByUsageCount](self->mShadowCache, "featuresSortedByUsageCount");
}

- (id)fillsOfCategory:(int)a3
{
  return -[OADGraphicFeatureCache featuresSortedByUsageCount](self->mFillCacheArray[a3], "featuresSortedByUsageCount");
}

- (id)tableStyleIds
{
  return -[OADGraphicFeatureCache featuresSortedByUsageCount](self->mTableIdCache, "featuresSortedByUsageCount");
}

- (id)chartStyleIds
{
  return -[OADGraphicFeatureCache featuresSortedByUsageCount](self->mChartIdCache, "featuresSortedByUsageCount");
}

- (id)cachedDrawableStylesOfCategory:(int)a3
{
  return -[OADGraphicFeatureCache featuresSortedByUsageCount](self->mDrawableStyleCacheArray[a3], "featuresSortedByUsageCount");
}

- (void)applyCachedDrawableStyle:(id)a3 toGraphicProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  OADReflectionEffect *v15;
  double v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if ((int)objc_msgSend(v18, "fillCategory") > 3
    || (-[OADGraphicFeatureCache countedFeatureAtIndex:](self->mFillCacheArray[objc_msgSend(v18, "fillCategory")], "countedFeatureAtIndex:", objc_msgSend(v18, "fillIndex")), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "feature"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mStrokeCache, "countedFeatureAtIndex:", objc_msgSend(v18, "strokeIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "feature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[OADStroke nullStroke](OADStroke, "nullStroke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mShadowCache, "countedFeatureAtIndex:", objc_msgSend(v18, "shadowIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "feature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "arrayByAddingObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  if (objc_msgSend(v18, "reflectionOpacity"))
  {
    v15 = objc_alloc_init(OADReflectionEffect);
    *(float *)&v16 = (float)objc_msgSend(v18, "reflectionOpacity");
    -[OADReflectionEffect setStartOpacity:](v15, "setStartOpacity:", v16);
    objc_msgSend(v11, "arrayByAddingObject:", v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
  }
  objc_msgSend(v6, "setFill:", v8);
  objc_msgSend(v6, "setStroke:", v10);
  objc_msgSend(v6, "setEffects:", v11);

}

- (void)applyCachedDrawableStyle:(id)a3 toParagraphProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mTextStyleCache, "countedFeatureAtIndex:", objc_msgSend(v9, "textStyleIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "applyToParagraphProperties:graphicStyleCache:", v6, self);
}

- (void)applyCachedDrawableStyle:(id)a3 toTextBodyProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mTextStyleCache, "countedFeatureAtIndex:", objc_msgSend(v9, "textStyleIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "applyToTextBodyProperties:graphicStyleCache:", v6, self);
}

- (void).cxx_destruct
{
  uint64_t v3;
  OADGraphicFeatureCache **v4;
  uint64_t v5;

  v3 = 0;
  v4 = &self->mDrawableStyleCacheArray[3];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -4);
  objc_storeStrong((id *)&self->mChartIdCache, 0);
  objc_storeStrong((id *)&self->mTableStyleCache, 0);
  objc_storeStrong((id *)&self->mTableIdCache, 0);
  objc_storeStrong((id *)&self->mTextStyleCache, 0);
  objc_storeStrong((id *)&self->mFontFaceCache, 0);
  objc_storeStrong((id *)&self->mColorCache, 0);
  objc_storeStrong((id *)&self->mShadowCache, 0);
  objc_storeStrong((id *)&self->mStrokeCache, 0);
  v5 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v5), 0);
    v5 -= 8;
  }
  while (v5);
}

@end
