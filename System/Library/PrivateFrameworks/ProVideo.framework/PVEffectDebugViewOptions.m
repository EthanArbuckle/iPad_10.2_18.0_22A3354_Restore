@implementation PVEffectDebugViewOptions

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  +[PVEffectDebugViewOptions persistedProperties](PVEffectDebugViewOptions, "persistedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PVEffectDebugViewOptions_dealloc__block_invoke;
  v5[3] = &unk_1E64D4EE0;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)PVEffectDebugViewOptions;
  -[PVEffectDebugViewOptions dealloc](&v4, sel_dealloc);
}

uint64_t __35__PVEffectDebugViewOptions_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), a2);
}

+ (id)options
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyToDefaultKeyMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optionsWithUserDefaults:propertyToKeyMap:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (PVEffectDebugViewOptions)optionsWithUserDefaults:(id)a3 propertyToKeyMap:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optionsWithDictionary:propertyToKeyMap:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVEffectDebugViewOptions *)v8;
}

+ (id)remapKeysToPropertyKeys:(id)a3 propertyToKeyMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PVEffectDebugViewOptions_remapKeysToPropertyKeys_propertyToKeyMap___block_invoke;
  v16[3] = &unk_1E64D8B50;
  v17 = v7;
  v10 = v8;
  v18 = v10;
  v19 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

void __69__PVEffectDebugViewOptions_remapKeysToPropertyKeys_propertyToKeyMap___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = v5;
  objc_msgSend(a1[6], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v4, v5);

}

+ (PVEffectDebugViewOptions)optionsWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "propertyToDefaultKeyMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optionsWithDictionary:propertyToKeyMap:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVEffectDebugViewOptions *)v6;
}

+ (PVEffectDebugViewOptions)optionsWithDictionary:(id)a3 propertyToKeyMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPropertyToKeyMap:", v5);
  v8 = objc_msgSend(v7, "saveToUserDefaultsOnUpdate");
  objc_msgSend(v7, "setSaveToUserDefaultsOnUpdate:", 0);
  +[PVEffectDebugViewOptions remapKeysToPropertyKeys:propertyToKeyMap:](PVEffectDebugViewOptions, "remapKeysToPropertyKeys:propertyToKeyMap:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValuesForKeysWithDictionary:", v9);
  objc_msgSend(v7, "setSaveToUserDefaultsOnUpdate:", v8);
  return (PVEffectDebugViewOptions *)v7;
}

- (PVEffectDebugViewOptions)init
{
  PVEffectDebugViewOptions *v2;
  void *v3;
  PVEffectDebugViewOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  PVEffectDebugViewOptions *v26;
  objc_super v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PVEffectDebugViewOptions;
  v2 = -[PVEffectDebugViewOptions init](&v27, sel_init);
  if (v2)
  {
    +[PVEffectDebugViewOptions persistedProperties](PVEffectDebugViewOptions, "persistedProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __32__PVEffectDebugViewOptions_init__block_invoke;
    v25 = &unk_1E64D4EE0;
    v4 = v2;
    v26 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v22);

    objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor", v22, v23, v24, v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setDocumentBoundingBoxColor:](v4, "setDocumentBoundingBoxColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setOutputROIColor:](v4, "setOutputROIColor:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "cyanColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setObjectAlignedBoundingBoxColor:](v4, "setObjectAlignedBoundingBoxColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setTextBoundingBoxColors:](v4, "setTextBoundingBoxColors:", v9);

    objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setHitAreaShapeColor:](v4, "setHitAreaShapeColor:", v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "cyanColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setMidpointColor:](v4, "setMidpointColor:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setOriginColor:](v4, "setOriginColor:", v12);

    objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    v30[1] = v13;
    v30[2] = v13;
    v30[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setCornerPointColors:](v4, "setCornerPointColors:", v15);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.215686275, 0.431372549, 0.0, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = v16;
    v29[2] = v16;
    v29[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setTextCornerPointColors:](v4, "setTextCornerPointColors:", v18);

    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugViewOptions setHitAreaPointColors:](v4, "setHitAreaPointColors:", v20);

    -[PVEffectDebugViewOptions setSaveToUserDefaultsOnUpdate:](v4, "setSaveToUserDefaultsOnUpdate:", 1);
  }
  return v2;
}

void __32__PVEffectDebugViewOptions_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], v4);
  objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), v4, 1, 0);

}

- (id)anyPersistedPropertyChanged
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_saveToUserDefaultsOnUpdate)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_propertyToKeyMap, "objectForKeyedSubscript:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *MEMORY[0x1E0CB2CB8];
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBool:forKey:", v16, v11);

      }
    }

  }
}

+ (NSArray)persistedProperties
{
  if (persistedProperties_onceToken != -1)
    dispatch_once(&persistedProperties_onceToken, &__block_literal_global_19);
  return (NSArray *)(id)persistedProperties_s_persistedProperties;
}

void __47__PVEffectDebugViewOptions_persistedProperties__block_invoke()
{
  void *v0;

  v0 = (void *)persistedProperties_s_persistedProperties;
  persistedProperties_s_persistedProperties = (uint64_t)&unk_1E6649830;

}

+ (id)propertyToDefaultKeyMap
{
  if (propertyToDefaultKeyMap_onceToken != -1)
    dispatch_once(&propertyToDefaultKeyMap_onceToken, &__block_literal_global_60);
  return (id)propertyToDefaultKeyMap_s_propertyToDefaultKeyMap;
}

void __51__PVEffectDebugViewOptions_propertyToDefaultKeyMap__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewEnabled"), CFSTR("enabled"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowDocumentBoundingBox"), CFSTR("showDocumentBoundingBox"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowOutputROI"), CFSTR("showOutputROI"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowObjectAlignedBoundingBox"), CFSTR("showObjectAlignedBoundingBox"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowTextBoundingBoxes"), CFSTR("showTextBoundingBoxes"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowHitAreaShape"), CFSTR("showHitAreaShape"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowOrigin"), CFSTR("showOrigin"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowMidpoint"), CFSTR("showMidpoint"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowCornerPoints"), CFSTR("showCornerPoints"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowTextCornerPoints"), CFSTR("showTextCornerPoints"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowHitAreaPoints"), CFSTR("showHitAreaPoints"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowUserRects"), CFSTR("showUserRects"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("kPVEffectDebugViewOption_ShowUserPoints"), CFSTR("showUserPoints"));
  v1 = (void *)propertyToDefaultKeyMap_s_propertyToDefaultKeyMap;
  propertyToDefaultKeyMap_s_propertyToDefaultKeyMap = (uint64_t)v0;

}

+ (id)keyPathsForValuesAffectingAnyPersistedPropertyChanged
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "persistedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  PVEffectDebugViewOptions *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[4];
  objc_super v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v22.receiver = self;
  v22.super_class = (Class)PVEffectDebugViewOptions;
  -[PVEffectDebugViewOptions description](&v22, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  +[PVEffectDebugViewOptions persistedProperties](PVEffectDebugViewOptions, "persistedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  +[PVEffectDebugViewOptions persistedProperties](PVEffectDebugViewOptions, "persistedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __39__PVEffectDebugViewOptions_description__block_invoke;
  v20[3] = &unk_1E64D8BB8;
  v20[4] = v21;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);

  +[PVEffectDebugViewOptions persistedProperties](PVEffectDebugViewOptions, "persistedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __39__PVEffectDebugViewOptions_description__block_invoke_2;
  v15[3] = &unk_1E64D8BE0;
  v18 = v21;
  v12 = v6;
  v16 = v12;
  v17 = self;
  v19 = v8 - 1;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

  v13 = v12;
  _Block_object_dispose(v21, 8);

  return v13;
}

void __39__PVEffectDebugViewOptions_description__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "length") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "length");

}

void __39__PVEffectDebugViewOptions_description__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 4;
  v6 = a2;
  objc_msgSend(v6, "stringByPaddingToLength:withString:startingAtIndex:", v5, CFSTR(" "), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(&stru_1E65EDDA0, "stringByPaddingToLength:withString:startingAtIndex:", 4, CFSTR(" "), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56) <= a3)
    v10 = &stru_1E65EDDA0;
  else
    v10 = CFSTR("\n");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@%@%@%@"), v8, v11, v9, v10);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)showDocumentBoundingBox
{
  return self->_showDocumentBoundingBox;
}

- (void)setShowDocumentBoundingBox:(BOOL)a3
{
  self->_showDocumentBoundingBox = a3;
}

- (BOOL)showOutputROI
{
  return self->_showOutputROI;
}

- (void)setShowOutputROI:(BOOL)a3
{
  self->_showOutputROI = a3;
}

- (BOOL)showObjectAlignedBoundingBox
{
  return self->_showObjectAlignedBoundingBox;
}

- (void)setShowObjectAlignedBoundingBox:(BOOL)a3
{
  self->_showObjectAlignedBoundingBox = a3;
}

- (BOOL)showTextBoundingBoxes
{
  return self->_showTextBoundingBoxes;
}

- (void)setShowTextBoundingBoxes:(BOOL)a3
{
  self->_showTextBoundingBoxes = a3;
}

- (BOOL)showHitAreaShape
{
  return self->_showHitAreaShape;
}

- (void)setShowHitAreaShape:(BOOL)a3
{
  self->_showHitAreaShape = a3;
}

- (BOOL)showOrigin
{
  return self->_showOrigin;
}

- (void)setShowOrigin:(BOOL)a3
{
  self->_showOrigin = a3;
}

- (BOOL)showMidpoint
{
  return self->_showMidpoint;
}

- (void)setShowMidpoint:(BOOL)a3
{
  self->_showMidpoint = a3;
}

- (BOOL)showCornerPoints
{
  return self->_showCornerPoints;
}

- (void)setShowCornerPoints:(BOOL)a3
{
  self->_showCornerPoints = a3;
}

- (BOOL)showTextCornerPoints
{
  return self->_showTextCornerPoints;
}

- (void)setShowTextCornerPoints:(BOOL)a3
{
  self->_showTextCornerPoints = a3;
}

- (BOOL)showHitAreaPoints
{
  return self->_showHitAreaPoints;
}

- (void)setShowHitAreaPoints:(BOOL)a3
{
  self->_showHitAreaPoints = a3;
}

- (BOOL)showUserRects
{
  return self->_showUserRects;
}

- (void)setShowUserRects:(BOOL)a3
{
  self->_showUserRects = a3;
}

- (BOOL)showUserPoints
{
  return self->_showUserPoints;
}

- (void)setShowUserPoints:(BOOL)a3
{
  self->_showUserPoints = a3;
}

- (UIColor)documentBoundingBoxColor
{
  return self->_documentBoundingBoxColor;
}

- (void)setDocumentBoundingBoxColor:(id)a3
{
  objc_storeStrong((id *)&self->_documentBoundingBoxColor, a3);
}

- (UIColor)outputROIColor
{
  return self->_outputROIColor;
}

- (void)setOutputROIColor:(id)a3
{
  objc_storeStrong((id *)&self->_outputROIColor, a3);
}

- (UIColor)objectAlignedBoundingBoxColor
{
  return self->_objectAlignedBoundingBoxColor;
}

- (void)setObjectAlignedBoundingBoxColor:(id)a3
{
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxColor, a3);
}

- (NSArray)textBoundingBoxColors
{
  return self->_textBoundingBoxColors;
}

- (void)setTextBoundingBoxColors:(id)a3
{
  objc_storeStrong((id *)&self->_textBoundingBoxColors, a3);
}

- (UIColor)hitAreaShapeColor
{
  return self->_hitAreaShapeColor;
}

- (void)setHitAreaShapeColor:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaShapeColor, a3);
}

- (UIColor)midpointColor
{
  return self->_midpointColor;
}

- (void)setMidpointColor:(id)a3
{
  objc_storeStrong((id *)&self->_midpointColor, a3);
}

- (UIColor)originColor
{
  return self->_originColor;
}

- (void)setOriginColor:(id)a3
{
  objc_storeStrong((id *)&self->_originColor, a3);
}

- (NSArray)cornerPointColors
{
  return self->_cornerPointColors;
}

- (void)setCornerPointColors:(id)a3
{
  objc_storeStrong((id *)&self->_cornerPointColors, a3);
}

- (NSArray)textCornerPointColors
{
  return self->_textCornerPointColors;
}

- (void)setTextCornerPointColors:(id)a3
{
  objc_storeStrong((id *)&self->_textCornerPointColors, a3);
}

- (NSArray)hitAreaPointColors
{
  return self->_hitAreaPointColors;
}

- (void)setHitAreaPointColors:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaPointColors, a3);
}

- (BOOL)saveToUserDefaultsOnUpdate
{
  return self->_saveToUserDefaultsOnUpdate;
}

- (void)setSaveToUserDefaultsOnUpdate:(BOOL)a3
{
  self->_saveToUserDefaultsOnUpdate = a3;
}

- (NSDictionary)propertyToKeyMap
{
  return self->_propertyToKeyMap;
}

- (void)setPropertyToKeyMap:(id)a3
{
  objc_storeStrong((id *)&self->_propertyToKeyMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyToKeyMap, 0);
  objc_storeStrong((id *)&self->_hitAreaPointColors, 0);
  objc_storeStrong((id *)&self->_textCornerPointColors, 0);
  objc_storeStrong((id *)&self->_cornerPointColors, 0);
  objc_storeStrong((id *)&self->_originColor, 0);
  objc_storeStrong((id *)&self->_midpointColor, 0);
  objc_storeStrong((id *)&self->_hitAreaShapeColor, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxColors, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxColor, 0);
  objc_storeStrong((id *)&self->_outputROIColor, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxColor, 0);
}

@end
