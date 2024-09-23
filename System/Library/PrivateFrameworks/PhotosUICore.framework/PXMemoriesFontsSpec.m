@implementation PXMemoriesFontsSpec

- (id)_initWithIdentifier:(PXMemoryFontsSpecIdentifier *)a3
{
  PXMemoriesFontsSpec *v4;
  int64_t var0;
  int64_t var1;
  int64_t var2;
  double width;
  double height;
  _BOOL8 var5;
  uint64_t v11;
  NSDictionary *titleTextAttributes;
  uint64_t v13;
  NSDictionary *fallbackTitleTextAttributes;
  uint64_t v15;
  NSDictionary *subtitleTextAttributes;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PXMemoriesFontsSpec;
  v4 = -[PXMemoriesFontsSpec init](&v27, sel_init);
  if (v4)
  {
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    width = a3->var3.width;
    height = a3->var3.height;
    var5 = a3->var5;
    objc_msgSend((id)objc_opt_class(), "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", a3->var0, var1, 0, var2, var5, width, height);
    v11 = objc_claimAutoreleasedReturnValue();
    titleTextAttributes = v4->_titleTextAttributes;
    v4->_titleTextAttributes = (NSDictionary *)v11;

    objc_msgSend((id)objc_opt_class(), "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", 1, var1, 0, var2, var5, width, height);
    v13 = objc_claimAutoreleasedReturnValue();
    fallbackTitleTextAttributes = v4->_fallbackTitleTextAttributes;
    v4->_fallbackTitleTextAttributes = (NSDictionary *)v13;

    objc_msgSend((id)objc_opt_class(), "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", var0, var1, 1, var2, var5, width, height);
    v15 = objc_claimAutoreleasedReturnValue();
    subtitleTextAttributes = v4->_subtitleTextAttributes;
    v4->_subtitleTextAttributes = (NSDictionary *)v15;

    objc_msgSend((id)objc_opt_class(), "baselineDistanceForFontSet:specSet:variant:size:shouldScale:", var0, var1, var2, var5, width, height);
    v4->_baselineDistance = v17;
    PXEdgeInsetsMake();
    objc_msgSend((id)objc_opt_class(), "paddingForFontSet:specSet:variant:layoutMargins:width:shouldScale:forHeaderTile:", var0, var1, var2, var5, var2 == 0, v18, v19, v20, v21, round(width));
    v4->_padding.top = v22;
    v4->_padding.left = v23;
    v4->_padding.bottom = v24;
    v4->_padding.right = v25;
  }
  return v4;
}

- (NSDictionary)titleTextAttributes
{
  return self->_titleTextAttributes;
}

- (NSDictionary)fallbackTitleTextAttributes
{
  return self->_fallbackTitleTextAttributes;
}

- (NSDictionary)subtitleTextAttributes
{
  return self->_subtitleTextAttributes;
}

- (double)baselineDistance
{
  return self->_baselineDistance;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_fallbackTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_titleTextAttributes, 0);
}

+ (void)preloadFontsSpecsForExtendedTraitCollection:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a3)
  {
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke;
    v6[3] = &unk_1E5144EB8;
    v7 = v4;
    v8 = a1;
    v5 = v4;
    objc_msgSend(v5, "scheduleTaskWithQoS:block:", 0, v6);

  }
}

+ (id)_fontSpecCache
{
  if (_fontSpecCache_onceToken != -1)
    dispatch_once(&_fontSpecCache_onceToken, &__block_literal_global_182696);
  return (id)_fontSpecCache_cache;
}

+ (int64_t)capitalizationStyleForLabelKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (!a3)
    return 1;
  if (a3 != 1)
  {
    v13 = v4;
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMemoriesFontsSpec.m"), 413, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 3;
}

+ (int64_t)numberOfLinesForLabelKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (!a3)
    return 2;
  if (a3 != 1)
  {
    v13 = v4;
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMemoriesFontsSpec.m"), 423, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 1;
}

+ (id)textAttributesForFontName:(id)a3 fontSize:(double)a4 lineHeight:(double)a5 tracking:(double)a6 stroke:(double)a7 shadow:(id)a8 capitalizationStyle:(int64_t)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v15 = a3;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PXFontCreate();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DC1138]);

  }
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v19, "setMinimumLineHeight:", a5);
    objc_msgSend(v19, "setMaximumLineHeight:", a5);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC1178]);

  }
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4 * a6 / 1000.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1150]);

  }
  if (a7 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DC11B8]);

  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DC1198]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *(_QWORD *)off_1E50B7E50);

  return v17;
}

+ (id)textAttributesForFontSet:(int64_t)a3 specSet:(int64_t)a4 labelKind:(int64_t)a5 variant:(int64_t)a6 size:(CGSize)a7 shouldScale:(BOOL)a8
{
  _BOOL4 v8;
  double width;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  double v22;
  _BOOL4 v23;
  double *v24;
  id v25;
  void *v26;
  void *v27;

  v8 = a8;
  width = a7.width;
  _FontNameForFontSetSpecSetVariant(a5, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "capitalizationStyleForLabelKind:", a5);
  v17 = (double)_FontSizeForFontSetSpecSetVariant(a5, a3, a4, a6);
  v18 = _TrackingForSpecSet(a5, a3);
  v19 = _LineHeightForSpecSet(a5, a3, a4, a6);
  if (a3 && v8)
  {
    v20 = 0.913999975;
    if (a6 != 4)
      v20 = 1.0;
    if (width <= 0.0)
      goto LABEL_15;
    if (a4 == 2)
      v21 = 1;
    else
      v21 = a4;
    if (v21 == 1)
    {
      v23 = a6 == 2;
      v24 = (double *)&unk_1A7C0C700;
    }
    else
    {
      v22 = 0.0;
      if (v21)
      {
LABEL_14:
        v20 = v20 * (width / v22);
LABEL_15:
        v19 = round(v19 * v20);
        v17 = round(v20 * v17);
        goto LABEL_16;
      }
      v23 = a6 == 4;
      v24 = (double *)&unk_1A7C0C710;
    }
    v22 = v24[v23];
    goto LABEL_14;
  }
LABEL_16:
  v25 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(v25, "setShadowBlurRadius:", 5.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.100000001);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShadowColor:", v26);

  objc_msgSend(v25, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(a1, "textAttributesForFontName:fontSize:lineHeight:tracking:stroke:shadow:capitalizationStyle:", v15, v25, v16, v17, v19, v18, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (double)baselineDistanceForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 size:(CGSize)a6 shouldScale:(BOOL)a7
{
  _BOOL4 v7;
  double width;
  double result;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  _BOOL4 v16;
  double *v17;

  v7 = a7;
  width = a6.width;
  _BaselineDistanceForFontSetSpecSetVariant(a3, a4);
  if (v7)
  {
    v12 = round(width);
    v13 = 0.913999975;
    if (a5 != 4)
      v13 = 1.0;
    if (v12 <= 0.0)
      return round(result * v13);
    if (a4 == 2)
      v14 = 1;
    else
      v14 = a4;
    if (v14 == 1)
    {
      v16 = a5 == 2;
      v17 = (double *)&unk_1A7C0C700;
    }
    else
    {
      v15 = 0.0;
      if (v14)
      {
LABEL_13:
        v13 = v13 * (v12 / v15);
        return round(result * v13);
      }
      v16 = a5 == 4;
      v17 = (double *)&unk_1A7C0C710;
    }
    v15 = v17[v16];
    goto LABEL_13;
  }
  return result;
}

+ (UIEdgeInsets)paddingForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 layoutMargins:(UIEdgeInsets)a6 width:(double)a7 shouldScale:(BOOL)a8 forHeaderTile:(BOOL)a9
{
  _BOOL8 v9;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v9 = a9;
  _DisplayMarginForLayoutMarginSpecSetVariant();
  objc_msgSend(a1, "_playButtonPaddingForFontSet:specSet:variant:deviceMargin:forHeaderTile:", a3, a4, a5, v9);
  if (!a4 && a5 != 4)
  {
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enableIPadWideHeader");

  }
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  PXEdgeInsetsMake();
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

+ (id)memoriesFontsSpecForDescriptor:(PXViewSpecDescriptor *)a3 extendedTraitCollection:(id)a4
{
  id v6;
  CGSize var2;
  double v8;
  double v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  double v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  CGSize v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[56];

  v6 = a4;
  memset(&v28[8], 0, 48);
  *(_QWORD *)v28 = 2;
  var2 = a3->var2;
  v24 = *(_OWORD *)&a3->var0;
  v25 = var2;
  objc_msgSend(a1, "_getSpecSet:variant:forDescriptor:extendedTraitCollection:", &v28[8], &v28[16], &v24, v6);
  *(CGSize *)&v28[24] = a3->var2;
  objc_msgSend(v6, "layoutMargins");
  v9 = v8;
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "enableIPadWideHeader");
  v12 = *(_QWORD *)&v28[8] == 0;

  v13 = fmin(v9, 20.0);
  if ((v11 & v12) != 0)
    v13 = v9;
  if (v13 == 0.0)
  {
    v14 = *(_QWORD *)&v28[16] == 4 && *(_QWORD *)&v28[8] == 0;
    v13 = 24.0;
    if (!v14)
      v13 = 20.0;
  }
  *(double *)&v28[40] = v13;
  v15 = 1;
  if (v6 && (a3->var1 & 0x1000) == 0 && !*(_QWORD *)&v28[8])
  {
    v16 = objc_msgSend(v6, "userInterfaceIdiom");
    v17 = objc_msgSend(v6, "userInterfaceIdiom") == 1 && objc_msgSend(v6, "layoutOrientation") == 2;
    v18 = !v17;
    if (v16 == 2)
      v15 = 0;
    else
      v15 = v18;
  }
  v28[48] = v15;
  +[PXMemoriesFontsSpec _fontSpecCache](PXMemoriesFontsSpec, "_fontSpecCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_OWORD *)v28;
  v25 = *(CGSize *)&v28[16];
  v26 = *(_OWORD *)&v28[32];
  v27 = *(_QWORD *)&v28[48];
  objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithMemoryFontsSpecIdentifier:", &v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = objc_alloc((Class)a1);
    v24 = *(_OWORD *)v28;
    v25 = *(CGSize *)&v28[16];
    v26 = *(_OWORD *)&v28[32];
    v27 = *(_QWORD *)&v28[48];
    v21 = (void *)objc_msgSend(v22, "_initWithIdentifier:", &v24);
    objc_msgSend(v19, "setObject:forKey:", v21, v20);
  }

  return v21;
}

+ (id)_fontSetByTitleFontName
{
  if (_fontSetByTitleFontName_onceToken != -1)
    dispatch_once(&_fontSetByTitleFontName_onceToken, &__block_literal_global_35);
  return (id)_fontSetByTitleFontName_fontSets;
}

+ (id)_titleFontNameByFontSet
{
  if (_titleFontNameByFontSet_onceToken != -1)
    dispatch_once(&_titleFontNameByFontSet_onceToken, &__block_literal_global_39_182683);
  return (id)_titleFontNameByFontSet_titleFontNameByFontSet;
}

+ (id)supportedTitleFontNames
{
  if (supportedTitleFontNames_onceToken != -1)
    dispatch_once(&supportedTitleFontNames_onceToken, &__block_literal_global_41_182679);
  return (id)supportedTitleFontNames_supportedFontNames;
}

+ (void)_getSpecSet:(int64_t *)a3 variant:(int64_t *)a4 forDescriptor:(PXViewSpecDescriptor *)a5 extendedTraitCollection:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;

  v9 = a6;
  v10 = objc_msgSend(v9, "userInterfaceIdiom");
  v11 = objc_msgSend(v9, "layoutSizeClass");
  v12 = objc_msgSend(v9, "layoutOrientation");

  if ((unint64_t)(a5->var0 - 1900) >= 0x64)
    v13 = 0;
  else
    v13 = (LOBYTE(a5->var0) - 108) % 0xFu;
  v14 = PXMemorySpecSetForTileKind(v13, v10, v11, v12);
  v15 = PXMemorySpecVariantForTileKind(v13, v10, v11, v12);
  if (a3)
    *a3 = v14;
  if (a4)
    *a4 = v15;
}

+ (int64_t)_memoryLabelKindForDescriptor:(PXViewSpecDescriptor *)a3
{
  int64_t v3;
  uint64_t v4;
  void *v8;

  v3 = 0;
  if ((unint64_t)(a3->var0 - 1900) >= 0x64)
    v4 = 0;
  else
    v4 = (LOBYTE(a3->var0) - 108) / 0xFu;
  if (v4 != 2)
  {
    if (v4 != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMemoriesFontsSpec.m"), 624, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    return 1;
  }
  return v3;
}

+ (double)_playButtonPaddingForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 deviceMargin:(double)a6 forHeaderTile:(BOOL)a7
{
  _BOOL4 v7;
  double v9;
  double v10;
  double result;

  v7 = a7;
  PXEdgeInsetsMake();
  result = v10 + v9 + 28.0;
  if (!v7)
    return result + a6 * -2.0;
  return result;
}

void __46__PXMemoriesFontsSpec_supportedTitleFontNames__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[PXMemoriesFontsSpec _fontSetByTitleFontName](PXMemoriesFontsSpec, "_fontSetByTitleFontName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedTitleFontNames_supportedFontNames;
  supportedTitleFontNames_supportedFontNames = v1;

}

void __46__PXMemoriesFontsSpec__titleFontNameByFontSet__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  +[PXMemoriesFontsSpec _fontSetByTitleFontName](PXMemoriesFontsSpec, "_fontSetByTitleFontName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PXMemoriesFontsSpec__titleFontNameByFontSet__block_invoke_2;
  v5[3] = &unk_1E513E138;
  v6 = v0;
  v1 = v0;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)_titleFontNameByFontSet_titleFontNameByFontSet;
  _titleFontNameByFontSet_titleFontNameByFontSet = v2;

}

uint64_t __46__PXMemoriesFontsSpec__titleFontNameByFontSet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __46__PXMemoriesFontsSpec__fontSetByTitleFontName__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *(_QWORD *)off_1E50B8730;
  v3[0] = *(_QWORD *)off_1E50B8738;
  v3[1] = v0;
  v4[0] = &unk_1E53EE550;
  v4[1] = &unk_1E53EE568;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_fontSetByTitleFontName_fontSets;
  _fontSetByTitleFontName_fontSets = v1;

}

void __37__PXMemoriesFontsSpec__fontSpecCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_fontSpecCache_cache;
  _fontSpecCache_cache = (uint64_t)v0;

}

void __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  _QWORD v14[9];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  uint64_t v23;

  +[PXMemoriesFontsSpec _fontSpecCache](PXMemoriesFontsSpec, "_fontSpecCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = 1;
  v13 = *MEMORY[0x1E0C9D820];
  do
  {
    v5 = 0;
    v12 = v4;
    v6 = (uint64_t *)*((_QWORD *)&xmmword_1A7BE4B20 + v3);
    v7 = 1;
    do
    {
      v8 = v5;
      v18 = v7;
      v19 = v6;
      v20 = 0;
      v21 = v13;
      v22 = 0;
      v23 = 0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithMemoryFontsSpecIdentifier:", &v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      *(_QWORD *)&v21 = __Block_byref_object_copy__182699;
      *((_QWORD *)&v21 + 1) = __Block_byref_object_dispose__182700;
      objc_msgSend(v2, "objectForKey:", v9);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19[5])
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke_26;
        v14[3] = &unk_1E5132608;
        v10 = *(void **)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 40);
        v14[4] = &v18;
        v14[5] = v11;
        v14[6] = v7;
        v14[7] = v6;
        v14[8] = 0;
        v15 = v13;
        v16 = 0;
        v17 = 0;
        objc_msgSend(v10, "scheduleMainQueueTaskAndWait:", v14);
        objc_msgSend(v2, "setObject:forKey:", v19[5], v9);
      }
      _Block_object_dispose(&v18, 8);

      v5 = 1;
      v7 = 2;
    }
    while ((v8 & 1) == 0);
    v4 = 0;
    v3 = 1;
  }
  while ((v12 & 1) != 0);

}

void __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke_26(uint64_t a1)
{
  id v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _OWORD v7[3];
  uint64_t v8;

  v2 = objc_alloc(*(Class *)(a1 + 40));
  v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 96);
  v4 = objc_msgSend(v2, "_initWithIdentifier:", v7);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
