@implementation PIParallaxSegmentationItem

- (PIParallaxSegmentationItem)init
{
  PIParallaxSegmentationItem *v2;
  CGSize v3;
  NSDictionary *scores;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PIParallaxSegmentationItem;
  v2 = -[PIParallaxSegmentationItem init](&v6, sel_init);
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v2->_settlingEffectNormalizedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v2->_settlingEffectNormalizedBounds.size = v3;
  scores = v2->_scores;
  v2->_scores = (NSDictionary *)MEMORY[0x1E0C9AA70];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PIParallaxSegmentationItem *v4;
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

  v4 = -[PIParallaxSegmentationItem init](+[PIParallaxSegmentationItem allocWithZone:](PIParallaxSegmentationItem, "allocWithZone:", a3), "init");
  -[PIParallaxSegmentationItem resource](self, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setResource:](v4, "setResource:", v5);

  -[PIParallaxSegmentationItem composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setComposition:](v4, "setComposition:", v6);

  -[PIParallaxSegmentationItem setClassification:](v4, "setClassification:", -[PIParallaxSegmentationItem classification](self, "classification"));
  -[PIParallaxSegmentationItem segmentationMatte](self, "segmentationMatte");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setSegmentationMatte:](v4, "setSegmentationMatte:", v7);

  -[PIParallaxSegmentationItem segmentationConfidenceMap](self, "segmentationConfidenceMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setSegmentationConfidenceMap:](v4, "setSegmentationConfidenceMap:", v8);

  -[PIParallaxSegmentationItem segmentationBackground](self, "segmentationBackground");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setSegmentationBackground:](v4, "setSegmentationBackground:", v9);

  -[PIParallaxSegmentationItem regions](self, "regions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setRegions:](v4, "setRegions:", v10);

  -[PIParallaxSegmentationItem originalLayout](self, "originalLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setOriginalLayout:](v4, "setOriginalLayout:", v11);

  -[PIParallaxSegmentationItem headroomLayout](self, "headroomLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setHeadroomLayout:](v4, "setHeadroomLayout:", v12);

  -[PIParallaxSegmentationItem defaultLayout](self, "defaultLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setDefaultLayout:](v4, "setDefaultLayout:", v13);

  -[PIParallaxSegmentationItem settlingEffectLayout](self, "settlingEffectLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setSettlingEffectLayout:](v4, "setSettlingEffectLayout:", v14);

  -[PIParallaxSegmentationItem scores](self, "scores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setScores:](v4, "setScores:", v15);

  -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setColorAnalysis:](v4, "setColorAnalysis:", v16);

  -[PIParallaxSegmentationItem localLightData](self, "localLightData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setLocalLightData:](v4, "setLocalLightData:", v17);

  -[PIParallaxSegmentationItem settlingEffectNormalizedBounds](self, "settlingEffectNormalizedBounds");
  -[PIParallaxSegmentationItem setSettlingEffectNormalizedBounds:](v4, "setSettlingEffectNormalizedBounds:");
  -[PIParallaxSegmentationItem settlingEffectVideoData](self, "settlingEffectVideoData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setSettlingEffectVideoData:](v4, "setSettlingEffectVideoData:", v18);

  -[PIParallaxSegmentationItem setSettlingEffectStatus:](v4, "setSettlingEffectStatus:", -[PIParallaxSegmentationItem settlingEffectStatus](self, "settlingEffectStatus"));
  -[PIParallaxSegmentationItem contextInfo](self, "contextInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem setContextInfo:](v4, "setContextInfo:", v19);

  return v4;
}

- (void)_invalidateCachedData
{
  -[PIParallaxSegmentationItem setSegmentationDataURL:](self, "setSegmentationDataURL:", 0);
}

- (void)setSettlingEffectNormalizedBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PIParallaxSegmentationItem _invalidateCachedData](self, "_invalidateCachedData");
  self->_settlingEffectNormalizedBounds.origin.x = x;
  self->_settlingEffectNormalizedBounds.origin.y = y;
  self->_settlingEffectNormalizedBounds.size.width = width;
  self->_settlingEffectNormalizedBounds.size.height = height;
}

- (void)setSettlingEffectStatus:(unint64_t)a3
{
  -[PIParallaxSegmentationItem _invalidateCachedData](self, "_invalidateCachedData");
  self->_settlingEffectStatus = a3;
}

- (void)setSettlingEffectVideoData:(id)a3
{
  id v4;
  NSData *v5;
  NSData *settlingEffectVideoData;

  v4 = a3;
  -[PIParallaxSegmentationItem _invalidateCachedData](self, "_invalidateCachedData");
  v5 = (NSData *)objc_msgSend(v4, "copy");

  settlingEffectVideoData = self->_settlingEffectVideoData;
  self->_settlingEffectVideoData = v5;

}

- (BOOL)isSettlingEffectAvailable
{
  return -[PIParallaxSegmentationItem settlingEffectStatus](self, "settlingEffectStatus") - 3 < 3;
}

- (BOOL)settlingEffectFailedAnyGating
{
  void *v2;
  void *v3;

  -[PIParallaxSegmentationItem scores](self, "scores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D75820]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "unsignedIntegerValue") != 0;
  return (char)v2;
}

- (NSArray)settlingEffectGatingDiagnostics
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[14];
  _QWORD v13[15];

  v13[14] = *MEMORY[0x1E0C80C00];
  -[PIParallaxSegmentationItem scores](self, "scores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D75820]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12[0] = &unk_1E5051058;
    v12[1] = &unk_1E5051070;
    v13[0] = CFSTR("Missing required metadata");
    v13[1] = CFSTR("Failed L1 stabilization");
    v12[2] = &unk_1E5051088;
    v12[3] = &unk_1E50510A0;
    v13[2] = CFSTR("Failed video quality gating");
    v13[3] = CFSTR("Failed metadata integrity check");
    v12[4] = &unk_1E50510B8;
    v12[5] = &unk_1E50510D0;
    v13[4] = CFSTR("Failed FRC gating");
    v13[5] = CFSTR("Failed still transition gating");
    v12[6] = &unk_1E50510E8;
    v12[7] = &unk_1E5051100;
    v13[6] = CFSTR("Unsupported Photos adjustments");
    v13[7] = CFSTR("Feature is disabled/unsupported");
    v12[8] = &unk_1E5051118;
    v12[9] = &unk_1E5051130;
    v13[8] = CFSTR("Asset resources are unavailable");
    v13[9] = CFSTR("Generic error");
    v12[10] = &unk_1E5051148;
    v12[11] = &unk_1E5051160;
    v13[10] = CFSTR("Failed to apply adjustments to FRC");
    v13[11] = CFSTR("Failed hardware support check");
    v12[12] = &unk_1E5051178;
    v12[13] = &unk_1E5051190;
    v13[12] = CFSTR("User-selected keyframe is out of the supported bounds");
    v13[13] = CFSTR("Failed to load AVAsset from URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__PIParallaxSegmentationItem_settlingEffectGatingDiagnostics__block_invoke;
    v9[3] = &unk_1E5015C58;
    v11 = v5;
    v7 = v6;
    v10 = v7;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v7;
}

- (BOOL)settlingEffectHasInterestingMotion
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  void *v6;
  float v7;
  float v8;

  -[PIParallaxSegmentationItem scores](self, "scores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D75830]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settlingEffectMinimumMotionScore");
  v8 = v7;

  return v5 >= v8;
}

- (BOOL)isComplete
{
  void *v2;
  BOOL v3;

  -[PIParallaxSegmentationItem originalLayout](self, "originalLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSArray)availableStyles
{
  PIParallaxSegmentationItem *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[PIParallaxSegmentationItem _availableStyles](v2, "_availableStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PIParallaxSegmentationItem _populateAvailableStyles](v2, "_populateAvailableStyles");
  objc_sync_exit(v2);

  return -[PIParallaxSegmentationItem _availableStyles](v2, "_availableStyles");
}

- (void)_populateAvailableStyles
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  -[PIParallaxSegmentationItem originalStyle](self, "originalStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v3);

  -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[PIParallaxSegmentationItem supportsBackgroundlessStyles](self, "supportsBackgroundlessStyles"))
    {
      v5 = *MEMORY[0x1E0D755E8];
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "bakedStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v8);

      v9 = *MEMORY[0x1E0D755E0];
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "bakedStyle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v12);

      v13 = *MEMORY[0x1E0D755F8];
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "bakedStyle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v16);

      v17 = *MEMORY[0x1E0D755F0];
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "bakedStyle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v20);

    }
    else
    {
      v19 = 0;
    }
    if (-[PIParallaxSegmentationItem supportsSegmentedStyles](self, "supportsSegmentedStyles"))
    {
      v21 = *MEMORY[0x1E0D75608];
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "bakedStyle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v24);

      v25 = *MEMORY[0x1E0D755B8];
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v25, v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "bakedStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v27);

      v28 = (uint64_t *)MEMORY[0x1E0D755C8];
    }
    else
    {
      v28 = (uint64_t *)MEMORY[0x1E0D755B0];
    }
    v29 = *v28;
    -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "bakedStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v32);

    v33 = *MEMORY[0x1E0D755D0];
    -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "bakedStyle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v36);

    v37 = *MEMORY[0x1E0D755D8];
    -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "bakedStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v40);

  }
  -[PIParallaxSegmentationItem set_availableStyles:](self, "set_availableStyles:", v41);

}

- (BOOL)supportsSegmentedStyles
{
  void *v3;
  unsigned int v4;

  -[PIParallaxSegmentationItem scores](self, "scores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", v3);

  return (-[PIParallaxSegmentationItem classification](self, "classification") == 1) & (v4 >> 2);
}

- (BOOL)supportsBackgroundlessStyles
{
  void *v3;
  int v4;

  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "parallaxStyleEnableGreenScreen");

  return v4 && -[PIParallaxSegmentationItem supportsSegmentedStyles](self, "supportsSegmentedStyles");
}

- (PFParallaxLayerStyle)originalStyle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *MEMORY[0x1E0D75600];
  -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PIParallaxSegmentationItem classification](self, "classification") != 1)
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClockColor:", v6);

  }
  objc_msgSend(v5, "bakedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFParallaxLayerStyle *)v7;
}

- (id)adjustedStyleForHeadroom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D75600];

  if (v5 == v6)
  {
    -[PIParallaxSegmentationItem originalStyle](self, "originalStyle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D755B0];

    if (v7 == v8)
    {
      -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bakedStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v9 = v4;
  }
  v10 = v9;
LABEL_7:

  return v10;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  void *v2;
  void *v3;

  -[PIParallaxSegmentationItem contextInfo](self, "contextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFWallpaperCompoundDeviceConfiguration *)v3;
}

- (id)availableStyleOfKind:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;

  v4 = a3;
  -[PIParallaxSegmentationItem availableStyles](self, "availableStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v4;
  PFFind();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultStyleOfKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bakedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)defaultStyles
{
  PIParallaxSegmentationItem *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[PIParallaxSegmentationItem _defaultStyles](v2, "_defaultStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PIParallaxSegmentationItem _populateDefaultStyles](v2, "_populateDefaultStyles");
  objc_sync_exit(v2);

  return -[PIParallaxSegmentationItem _defaultStyles](v2, "_defaultStyles");
}

- (void)_populateDefaultStyles
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  -[PIParallaxSegmentationItem originalStyle](self, "originalStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v3);

  -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *MEMORY[0x1E0D755B0];
    -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bakedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v8);

    v9 = *MEMORY[0x1E0D755D0];
    -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bakedStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

    v13 = *MEMORY[0x1E0D755D8];
    -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle defaultStyleForKind:colorAnalysis:](PIParallaxStyle, "defaultStyleForKind:colorAnalysis:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "bakedStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v16);

  }
  -[PIParallaxSegmentationItem set_defaultStyles:](self, "set_defaultStyles:", v17);

}

- (id)suggestedStyleForCategory:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  PIParallaxSegmentationItem *v39;
  SEL v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[6];

  v54[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41 = v4;
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D756B8]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D756C0]))
    {
      v9 = *MEMORY[0x1E0D755C8];
      v53[0] = *MEMORY[0x1E0D755E0];
      v53[1] = v9;
      v10 = *MEMORY[0x1E0D755D8];
      v53[2] = *MEMORY[0x1E0D755D0];
      v53[3] = v10;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v53;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D756B0]))
      {
        if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D756A8]))
        {
          NUAssertLogger_3386();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported style category: %@"), v4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v27;
            _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

          }
          v28 = (const void **)MEMORY[0x1E0D51D48];
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
          NUAssertLogger_3386();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v31)
            {
              v34 = dispatch_get_specific(*v28);
              v35 = (void *)MEMORY[0x1E0CB3978];
              v36 = v34;
              objc_msgSend(v35, "callStackSymbols");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v48 = v34;
              v49 = 2114;
              v50 = v38;
              _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            }
          }
          else if (v31)
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v33;
            _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
          v39 = (PIParallaxSegmentationItem *)_NUAssertFailHandler();
          return -[PIParallaxSegmentationItem debugDescription](v39, v40);
        }
        v25 = *MEMORY[0x1E0D755B8];
        v51[0] = *MEMORY[0x1E0D755F8];
        v51[1] = v25;
        v51[2] = *MEMORY[0x1E0D755B0];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v7 = v51;
        goto LABEL_3;
      }
      v11 = *MEMORY[0x1E0D755C8];
      v52[0] = *MEMORY[0x1E0D755F0];
      v52[1] = v11;
      v12 = *MEMORY[0x1E0D755D0];
      v52[2] = *MEMORY[0x1E0D755D8];
      v52[3] = v12;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v52;
    }
    v8 = 4;
    goto LABEL_9;
  }
  v5 = *MEMORY[0x1E0D75608];
  v54[0] = *MEMORY[0x1E0D755E8];
  v54[1] = v5;
  v54[2] = *MEMORY[0x1E0D75600];
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = v54;
LABEL_3:
  v8 = 3;
LABEL_9:
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v13);
        -[PIParallaxSegmentationItem availableStyles](self, "availableStyles");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PFFind();
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {

          v20 = v41;
          goto LABEL_23;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v15)
        continue;
      break;
    }
  }

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_662);
  v20 = v41;
  v21 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v41;
    _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Couldn't find a single candidate style for category %{public}@, falling back to Original", buf, 0xCu);
  }
  -[PIParallaxSegmentationItem originalStyle](self, "originalStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  +[PIParallaxStyle styleWithBakedStyle:](PIParallaxStyle, "styleWithBakedStyle:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "configureForCategory:", v20);
  objc_msgSend(v22, "bakedStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIParallaxSegmentationItem classification](self, "classification");
  PFPosterClassificationName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem segmentationMatte](self, "segmentationMatte");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem segmentationConfidenceMap](self, "segmentationConfidenceMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem segmentationBackground](self, "segmentationBackground");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem originalLayout](self, "originalLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem resource](self, "resource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxSegmentationItem composition](self, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p class=%@ matte=%@ conf=%@ infill=%@ layout=%@ resource=%@ composition=%@>"), v4, self, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v17;
  const void **v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  const void **v25;
  void *v26;
  int v27;
  void *v28;
  const void **v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  const void **v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_3386();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "archiveURL != nil");
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v30 = dispatch_get_specific(*v19);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v19 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = (const void **)v30;
        v44 = 2114;
        v45 = v33;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v19;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v21 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_27;
    }
LABEL_25:
    if (v27)
    {
      v34 = dispatch_get_specific(*v19);
      v35 = (void *)MEMORY[0x1E0CB3978];
      v36 = v34;
      objc_msgSend(v35, "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = (const void **)v34;
      v44 = 2114;
      v45 = v38;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_27:

    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 0, 0, &v41);
  v10 = v41;

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("asset.resource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v12 = -[PIParallaxSegmentationItem saveAssetResourceToURL:error:](self, "saveAssetResourceToURL:error:", v11, &v40);
    v13 = v40;

    if (v12)
    {
      objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("segmentation.data.aar"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v15 = -[PIParallaxSegmentationItem saveSegmentationDataToURL:error:](self, "saveSegmentationDataToURL:error:", v14, &v39);
      v10 = v39;

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to archive segmentation data"), self, v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to archive asset resource"), self, v13);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v13;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create archive directory"), v7, v10);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v16;
  const void **v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  const void **v24;
  void *v25;
  int v26;
  void *v27;
  const void **v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const void **v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_3386();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "archiveURL != nil");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v29 = dispatch_get_specific(*v18);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v18 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v29;
        v42 = 2114;
        v43 = v32;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v18;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v20 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_25;
    }
LABEL_23:
    if (v26)
    {
      v33 = dispatch_get_specific(*v18);
      v34 = (void *)MEMORY[0x1E0CB3978];
      v35 = v33;
      objc_msgSend(v34, "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v33;
      v42 = 2114;
      v43 = v37;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_25:

    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0D75160]);
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("asset.resource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v10 = objc_msgSend(v8, "loadFromArchiveURL:error:", v9, &v39);
  v11 = v39;
  if ((v10 & 1) != 0)
  {
    -[PIParallaxSegmentationItem setResource:](self, "setResource:", v8);
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("segmentation.data.aar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v13 = -[PIParallaxSegmentationItem loadSegmentationDataFromURL:error:](self, "loadSegmentationDataFromURL:error:", v12, &v38);
    v14 = v38;

    if (v13)
    {
      -[PIParallaxSegmentationItem setFileURL:](self, "setFileURL:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load segmentation data"), v12, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load asset resource"), v9, v11);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v11;
  }

  return v13;
}

- (BOOL)saveAssetResourceToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v19;
  const void **v20;
  const void **v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  NSObject *v26;
  const void **v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  const void **v32;
  void *v33;
  int v34;
  void *v35;
  const void **v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  const void **v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_3386();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v37 = dispatch_get_specific(*v21);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v21 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = (const void **)v37;
        v52 = 2114;
        v53 = v40;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v21;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v29 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    v28 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v23 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v21;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_31:

      v34 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v29)
    {
      v41 = dispatch_get_specific(*v21);
      v42 = (void *)MEMORY[0x1E0CB3978];
      v43 = v41;
      objc_msgSend(v42, "callStackSymbols");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = (const void **)v41;
      v52 = 2114;
      v53 = v44;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_31;
  }
  v7 = v6;
  -[PIParallaxSegmentationItem resource](self, "resource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_3386();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing asset resource"));
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v23 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v36;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_34;
    }
LABEL_32:
    if (v34)
    {
      v45 = dispatch_get_specific(*v21);
      v46 = (void *)MEMORY[0x1E0CB3978];
      v47 = v45;
      objc_msgSend(v46, "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = (const void **)v45;
      v52 = 2114;
      v53 = v49;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_34:

    _NUAssertFailHandler();
  }
  -[PIParallaxSegmentationItem resource](self, "resource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "archiveURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIParallaxSegmentationItem resource](self, "resource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    v15 = objc_msgSend(v11, "saveToArchiveURL:error:", v7, a4);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v11, "archiveURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxSegmentationItem resource](self, "resource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "archiveURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v17, v7, a4);

    goto LABEL_9;
  }
  v15 = 1;
LABEL_10:

  return v15;
}

- (BOOL)saveSegmentationDataToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  char v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v45;
  void *v46;
  NSObject *v47;
  const void **v48;
  const void **v49;
  void *specific;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  NSObject *v54;
  const void **v55;
  void *v56;
  int v57;
  void *v58;
  const void **v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  const void **v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_3386();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "archiveURL != nil");
      v48 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v48;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v49 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v60 = dispatch_get_specific(*v49);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v49 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = (const void **)v60;
        v80 = 2114;
        v81 = v63;
        _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v52)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v49;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v57 = _NUAssertFailHandler();
    goto LABEL_53;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v55 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v55;
      _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v49 = (const void **)MEMORY[0x1E0D51D48];
    v56 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v51 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v59;
        _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_55;
    }
LABEL_53:
    if (v57)
    {
      v64 = dispatch_get_specific(*v49);
      v65 = (void *)MEMORY[0x1E0CB3978];
      v66 = v64;
      objc_msgSend(v65, "callStackSymbols");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = (const void **)v64;
      v80 = 2114;
      v81 = v68;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_55:

    _NUAssertFailHandler();
  }
  v7 = v6;
  -[PIParallaxSegmentationItem segmentationDataURL](self, "segmentationDataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_7;
  -[PIParallaxSegmentationItem segmentationDataURL](self, "segmentationDataURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxSegmentationItem segmentationDataURL](self, "segmentationDataURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v12, v7, 0);

    if ((v13 & 1) == 0)
    {
LABEL_7:
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75098]), "initWithArchiveURL:", v7);
      objc_msgSend(v15, "setCompression:", -1);
      v77 = 0;
      v16 = objc_msgSend(v15, "openForWriting:", &v77);
      v17 = v77;
      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to write segmentation archive"), v7, v17);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

        goto LABEL_38;
      }
      -[PIParallaxSegmentationItem contentsDictionary](self, "contentsDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v18, 200, 0, &v76);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v76;

      if (!v19)
      {
        v36 = (void *)MEMORY[0x1E0D520A0];
        v37 = CFSTR("Failed to serialize contents plist");
        v38 = v18;
        goto LABEL_25;
      }
      v75 = v20;
      v21 = objc_msgSend(v15, "encodeData:filename:error:", v19, CFSTR("contents.plist"), &v75);
      v22 = v75;

      if ((v21 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to archive contents plist data"), v19, v22);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v20 = v22;
        goto LABEL_36;
      }
      -[PIParallaxSegmentationItem segmentationMatte](self, "segmentationMatte");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)objc_opt_class();
        -[PIParallaxSegmentationItem segmentationMatte](self, "segmentationMatte");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0;
        objc_msgSend(v24, "dataForImageBuffer:error:", v25, &v74);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v74;

        if (!v26)
        {
          v39 = (void *)MEMORY[0x1E0D520A0];
          -[PIParallaxSegmentationItem segmentationMatte](self, "segmentationMatte");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = CFSTR("Failed to write segmentation matte");
          goto LABEL_30;
        }
        v73 = v20;
        v27 = objc_msgSend(v15, "encodeData:filename:error:", v26, CFSTR("matte.heic"), &v73);
        v22 = v73;

        if ((v27 & 1) == 0)
        {
          v42 = (void *)MEMORY[0x1E0D520A0];
          v43 = CFSTR("Failed to archive segmentation matte data");
LABEL_33:
          objc_msgSend(v42, "errorWithCode:reason:object:underlyingError:", 1, v43, v26, v22);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          goto LABEL_34;
        }

      }
      -[PIParallaxSegmentationItem segmentationBackground](self, "segmentationBackground");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
LABEL_18:
        -[PIParallaxSegmentationItem settlingEffectVideoData](self, "settlingEffectVideoData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
LABEL_21:
          v69 = v22;
          v35 = objc_msgSend(v15, "close:", &v69);
          v20 = v69;

          if ((v35 & 1) != 0)
          {
            -[PIParallaxSegmentationItem setSegmentationDataURL:](self, "setSegmentationDataURL:", v7);
            v14 = 1;
LABEL_36:

            v17 = v20;
            goto LABEL_37;
          }
          v36 = (void *)MEMORY[0x1E0D520A0];
          v37 = CFSTR("Failed to close archive file");
          v38 = v15;
LABEL_25:
          objc_msgSend(v36, "errorWithCode:reason:object:underlyingError:", 1, v37, v38, v20);
          v14 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        -[PIParallaxSegmentationItem settlingEffectVideoData](self, "settlingEffectVideoData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v22;
        v34 = objc_msgSend(v15, "encodeData:filename:error:", v33, CFSTR("settlingEffect.mov"), &v70);
        v20 = v70;

        if ((v34 & 1) != 0)
        {
          v22 = v20;
          goto LABEL_21;
        }
        v45 = (void *)MEMORY[0x1E0D520A0];
        -[PIParallaxSegmentationItem settlingEffectVideoData](self, "settlingEffectVideoData");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to archive settling effect video data"), v46, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
        v14 = 0;
        goto LABEL_36;
      }
      v29 = (void *)objc_opt_class();
      -[PIParallaxSegmentationItem segmentationBackground](self, "segmentationBackground");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      objc_msgSend(v29, "dataForImageBuffer:error:", v30, &v72);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v72;

      if (v26)
      {
        v71 = v20;
        v31 = objc_msgSend(v15, "encodeData:filename:error:", v26, CFSTR("background.heic"), &v71);
        v22 = v71;

        if ((v31 & 1) != 0)
        {

          goto LABEL_18;
        }
        v42 = (void *)MEMORY[0x1E0D520A0];
        v43 = CFSTR("Failed to archive segmentation background data");
        goto LABEL_33;
      }
      v39 = (void *)MEMORY[0x1E0D520A0];
      -[PIParallaxSegmentationItem segmentationBackground](self, "segmentationBackground");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("Failed to write segmentation background");
LABEL_30:
      objc_msgSend(v39, "errorWithCode:reason:object:underlyingError:", 1, v41, v40, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_34:
      goto LABEL_35;
    }
  }
  v14 = 1;
LABEL_38:

  return v14;
}

- (BOOL)loadSegmentationDataFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_matteImageLoadingBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_backgroundImageLoadingBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_settlingEffectDataLoadingBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PIParallaxSegmentationItem _loadSegmentationDataFromURL:error:matteImageLoadingBlock:backgroundImageLoadingBlock:settingEffectDataLoadingBlock:](self, "_loadSegmentationDataFromURL:error:matteImageLoadingBlock:backgroundImageLoadingBlock:settingEffectDataLoadingBlock:", v6, a4, v7, v8, v9);

  return (char)a4;
}

- (BOOL)_loadSegmentationDataFromURL:(id)a3 error:(id *)a4 matteImageLoadingBlock:(id)a5 backgroundImageLoadingBlock:(id)a6 settingEffectDataLoadingBlock:(id)a7
{
  void *v7;
  void *v8;
  void *v9;
  NSObject *v15;
  void (**v16)(_QWORD, void *);
  const void **v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  char *v35;
  BOOL v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  NSObject *v41;
  const void **v42;
  void *specific;
  _BOOL4 v44;
  void *v45;
  NSObject *v46;
  const void **v47;
  void *v48;
  int v49;
  void *v50;
  NSObject *v51;
  const void **v52;
  void *v53;
  int v54;
  void *v55;
  NSObject *v56;
  const void **v57;
  void *v58;
  int v59;
  void *v60;
  NSObject *v61;
  const void **v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void (**v80)(_QWORD, void *);
  id v81;
  id v82;
  id v83;
  __int16 v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  uint8_t buf[4];
  const void **v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (void (**)(_QWORD, void *))a5;
  v17 = (const void **)a6;
  v18 = a7;
  if (!v15)
  {
    NUAssertLogger_3386();
    v41 = objc_claimAutoreleasedReturnValue();
    v35 = "archiveURL != nil";
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "archiveURL != nil");
      v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v42;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v15 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v66 = dispatch_get_specific(*v17);
        v67 = (void *)MEMORY[0x1E0CB3978];
        a7 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v91 = (const void **)v66;
        v92 = 2114;
        v93 = v7;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v17;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v49 = _NUAssertFailHandler();
    goto LABEL_67;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v46 = objc_claimAutoreleasedReturnValue();
    v35 = "error != NULL";
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v47 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v47;
      _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v48 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v15 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v48)
    {
      if (v49)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_69:

      v54 = _NUAssertFailHandler();
      goto LABEL_70;
    }
LABEL_67:
    if (v49)
    {
      v68 = dispatch_get_specific(*v17);
      v69 = (void *)MEMORY[0x1E0CB3978];
      a7 = v68;
      objc_msgSend(v69, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v91 = (const void **)v68;
      v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_69;
  }
  if (!v16)
  {
    NUAssertLogger_3386();
    v51 = objc_claimAutoreleasedReturnValue();
    v35 = "matteImageLoadingBlock != nil";
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "matteImageLoadingBlock != nil");
      v52 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v52;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v53 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v15 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v53)
    {
      if (v54)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_72:

      v59 = _NUAssertFailHandler();
      goto LABEL_73;
    }
LABEL_70:
    if (v54)
    {
      v70 = dispatch_get_specific(*v17);
      v71 = (void *)MEMORY[0x1E0CB3978];
      a7 = v70;
      objc_msgSend(v71, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v91 = (const void **)v70;
      v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_72;
  }
  if (!v17)
  {
    NUAssertLogger_3386();
    v56 = objc_claimAutoreleasedReturnValue();
    v35 = "backgroundImageLoadingBlock != nil";
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "backgroundImageLoadingBlock != nil");
      v57 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v57;
      _os_log_error_impl(&dword_1A6382000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v58 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v15 = objc_claimAutoreleasedReturnValue();
    v59 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v58)
    {
      if (v59)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_75:

      v64 = _NUAssertFailHandler();
      goto LABEL_76;
    }
LABEL_73:
    if (v59)
    {
      v72 = dispatch_get_specific(*v17);
      v73 = (void *)MEMORY[0x1E0CB3978];
      a7 = v72;
      objc_msgSend(v73, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v91 = (const void **)v72;
      v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_75;
  }
  a7 = v18;
  if (!v18)
  {
    NUAssertLogger_3386();
    v61 = objc_claimAutoreleasedReturnValue();
    v35 = "settingEffectDataLoadingBlock != nil";
    a7 = &unk_1A64D6000;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "settingEffectDataLoadingBlock != nil");
      v62 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v62;
      _os_log_error_impl(&dword_1A6382000, v61, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v63 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v15 = objc_claimAutoreleasedReturnValue();
    v64 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v63)
    {
      if (v64)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_78:

      _NUAssertFailHandler();
      goto LABEL_79;
    }
LABEL_76:
    if (v64)
    {
      v74 = dispatch_get_specific(*v17);
      v75 = (void *)MEMORY[0x1E0CB3978];
      a7 = v74;
      objc_msgSend(v75, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v91 = (const void **)v74;
      v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_78;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75098]), "initWithArchiveURL:", v15);
  objc_msgSend(v7, "setCompression:", -1);
  v89 = 0;
  v19 = objc_msgSend(v7, "openForReading:", &v89);
  v20 = v89;
  v21 = v20;
  if ((v19 & 1) != 0)
  {
    v80 = v16;
    v87 = 0;
    v88 = 0;
    v86 = v20;
    v22 = objc_msgSend(v7, "decodeData:filename:error:", &v88, &v87, &v86);
    v81 = v88;
    v23 = v87;
    v24 = v86;

    if ((v22 & 1) != 0)
    {
      v8 = v23;
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("contents.plist")) & 1) != 0)
      {
        v78 = v23;
        v85 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v81, 0, 0, &v85);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v85;

        v79 = (void *)v25;
        if (v25)
        {
          v9 = v81;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v84 = 0;
            v83 = 0;
            v27 = -[PIParallaxSegmentationItem loadContentsFromDictionary:hasMatte:hasBackground:error:](self, "loadContentsFromDictionary:hasMatte:hasBackground:error:", v79, (char *)&v84 + 1, &v84, &v83);
            v28 = v83;

            if (v27)
            {
              v77 = v28;
              v8 = v78;
              if (HIBYTE(v84))
              {
                v29 = v79;
                v80[2](v80, v7);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v30, "success"))
                {
                  v37 = (void *)MEMORY[0x1E0D520A0];
                  objc_msgSend(v30, "error");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = CFSTR("Failed to load matte image");
                  goto LABEL_34;
                }
                objc_msgSend(v30, "object");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[PIParallaxSegmentationItem setSegmentationMatte:](self, "setSegmentationMatte:", v31);

                v8 = v78;
              }
              if (!(_BYTE)v84)
              {
LABEL_18:
                if (!-[PIParallaxSegmentationItem isSettlingEffectAvailable](self, "isSettlingEffectAvailable"))
                  goto LABEL_21;
                v29 = v79;
                (*((void (**)(id, void *))a7 + 2))(a7, v7);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v30, "success"))
                {
                  objc_msgSend(v30, "object");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PIParallaxSegmentationItem setSettlingEffectVideoData:](self, "setSettlingEffectVideoData:", v33);

                  v8 = v78;
LABEL_21:
                  -[PIParallaxSegmentationItem setSegmentationDataURL:](self, "setSegmentationDataURL:", v15);
                  v82 = v77;
                  v34 = objc_msgSend(v7, "close:", &v82);
                  v76 = v82;

                  if ((v34 & 1) != 0)
                  {
LABEL_24:
                    v36 = 1;
                    v24 = v76;
LABEL_36:

                    goto LABEL_37;
                  }
                  NULogger_3444();
                  v35 = (char *)objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
                  {
LABEL_23:

                    goto LABEL_24;
                  }
LABEL_79:
                  *(_DWORD *)buf = 138477827;
                  v91 = (const void **)v76;
                  _os_log_error_impl(&dword_1A6382000, (os_log_t)v35, OS_LOG_TYPE_ERROR, "Failed to close the stream due to %{private}@", buf, 0xCu);
                  goto LABEL_23;
                }
                v37 = (void *)MEMORY[0x1E0D520A0];
                objc_msgSend(v30, "error");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = CFSTR("Failed to load settling effect data");
                goto LABEL_34;
              }
              v29 = v79;
              ((void (*)(const void **, void *))v17[2])(v17, v7);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "success"))
              {
                objc_msgSend(v30, "object");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[PIParallaxSegmentationItem setSegmentationBackground:](self, "setSegmentationBackground:", v32);

                v8 = v78;
                goto LABEL_18;
              }
              v37 = (void *)MEMORY[0x1E0D520A0];
              objc_msgSend(v30, "error");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = CFSTR("Failed to load background image");
LABEL_34:
              objc_msgSend(v37, "errorWithCode:reason:object:underlyingError:", 1, v39, v29, v38);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              v9 = v81;
              v36 = 0;
              v24 = v77;
              goto LABEL_35;
            }
            objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load contents dictionary"), v79, v28);
            v36 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            v24 = v28;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid contents plist"), v79);
            v36 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            v24 = v26;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize contents plist"), v81, v26);
          v36 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          v24 = v26;
          v9 = v81;
        }
LABEL_35:
        v8 = v78;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Expected contents.plist data"), v23);
      v36 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v81;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode contents plist data"), v7, v24);
      v36 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v81;
      v8 = v23;
    }
LABEL_37:

    v21 = v24;
    v16 = v80;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read segmentation archive"), v15, v20);
  v36 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v36;
}

- (id)contentsDictionary
{
  id v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CFDictionaryRef DictionaryRepresentation;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v39;
  void *v40;
  const void **v41;
  void *specific;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[3];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  CGRect v58;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PIParallaxSegmentationItem contextInfo](self, "contextInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NUAssertLogger_3386();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing context info!"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v40;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v41 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v47 = dispatch_get_specific(*v41);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v47;
        v55 = 2114;
        v56 = v51;
        _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v46;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("version"));

  -[PIParallaxSegmentationItem classification](self, "classification");
  PFPosterClassificationName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("classification"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PIParallaxSegmentationItem segmentationMatte](self, "segmentationMatte");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasMatte"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PIParallaxSegmentationItem segmentationBackground](self, "segmentationBackground");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", v12 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasBackground"));

  -[PIParallaxSegmentationItem regions](self, "regions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[PIParallaxSegmentationItem regions](self, "regions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISegmentationLayoutRegions dictionaryFromRegions:](PISegmentationLayoutRegions, "dictionaryFromRegions:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("regions"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("regions"));
  }

  -[PIParallaxSegmentationItem originalLayout](self, "originalLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("layout"));

  -[PIParallaxSegmentationItem scores](self, "scores");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("scores"));

  -[PIParallaxSegmentationItem colorAnalysis](self, "colorAnalysis");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentsDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("colorAnalysis"));

  -[PIParallaxSegmentationItem localLightData](self, "localLightData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("localLightData"));

  objc_msgSend(v5, "systemName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v23;
  objc_msgSend(v5, "systemVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v24;
  objc_msgSend(v5, "systemBuildVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("systemVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "sourceMode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("sourceMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "infillAlgorithm"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("infillAlgorithm"));

  objc_msgSend(v5, "layoutConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryRepresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("layoutConfiguration"));

  if (objc_msgSend(v5, "segmentationDisabled"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("segmentationDisabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PIParallaxSegmentationItem settlingEffectStatus](self, "settlingEffectStatus"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("settlingEffectStatus"));

  -[PIParallaxSegmentationItem settlingEffectNormalizedBounds](self, "settlingEffectNormalizedBounds");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v58);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("settlingEffectBounds"));

  -[PIParallaxSegmentationItem settlingEffectLayout](self, "settlingEffectLayout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dictionaryRepresentation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("settlingEffectLayout"));

  -[PIParallaxSegmentationItem headroomLayout](self, "headroomLayout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryRepresentation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("headroomLayout"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "role"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("role"));

  return v3;
}

- (unint64_t)version
{
  void *v2;
  unint64_t v3;

  -[PIParallaxSegmentationItem contextInfo](self, "contextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version");

  return v3;
}

- (BOOL)supportsManualClockIntersectionTolerance
{
  return -[PIParallaxSegmentationItem version](self, "version") > 0x20;
}

- (BOOL)loadContentsFromDictionary:(id)a3 hasMatte:(BOOL *)a4 hasBackground:(BOOL *)a5 error:(id *)a6
{
  void *v6;
  CGRect *p_buf;
  NSObject *v12;
  NSObject *v13;
  void *specific;
  unint64_t v15;
  void *v16;
  BOOL v17;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double x;
  double y;
  double width;
  double height;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  PISegmentationContextInfo *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  const void **v54;
  _BOOL4 v55;
  NSObject *v56;
  void *v57;
  int v58;
  NSObject *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  BOOL v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t j;
  uint64_t v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t k;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  char *v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  char v124;
  uint64_t v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  id v137;
  void *v138;
  void *v139;
  id obj;
  id obja;
  id objb;
  id objc;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  id v148;
  id v149;
  int v150;
  id v151;
  void *v152;
  uint64_t v153;
  PISegmentationContextInfo *v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  uint64_t v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  CGRect buf;
  uint64_t v175;

  p_buf = &buf;
  v175 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    NUAssertLogger_3386();
    v52 = objc_claimAutoreleasedReturnValue();
    v19 = "contents != nil";
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "contents != nil");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v53;
      _os_log_error_impl(&dword_1A6382000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v54 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v13 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        specific = dispatch_get_specific(*v54);
        v72 = (void *)MEMORY[0x1E0CB3978];
        a6 = specific;
        objc_msgSend(v72, "callStackSymbols");
        v54 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        self = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = specific;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = self;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (const void **)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v54;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v58 = _NUAssertFailHandler();
    goto LABEL_95;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v56 = objc_claimAutoreleasedReturnValue();
    v19 = "hasMatte != NULL";
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "hasMatte != NULL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v57;
      _os_log_error_impl(&dword_1A6382000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v54 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v13 = objc_claimAutoreleasedReturnValue();
    v58 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v58)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (const void **)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543362;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v54;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

      }
LABEL_97:

      v61 = _NUAssertFailHandler();
      goto LABEL_98;
    }
LABEL_95:
    if (v58)
    {
      specific = dispatch_get_specific(*v54);
      v73 = (void *)MEMORY[0x1E0CB3978];
      a6 = specific;
      objc_msgSend(v73, "callStackSymbols");
      v54 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      self = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543618;
      *(_QWORD *)((char *)&buf.origin.x + 4) = specific;
      WORD2(buf.origin.y) = 2114;
      *(_QWORD *)((char *)&buf.origin.y + 6) = self;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

    }
    goto LABEL_97;
  }
  if (!a5)
  {
    NUAssertLogger_3386();
    v59 = objc_claimAutoreleasedReturnValue();
    v19 = "hasBackground != NULL";
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "hasBackground != NULL");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v60;
      _os_log_error_impl(&dword_1A6382000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v54 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v13 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v61)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (const void **)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543362;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v54;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

      }
LABEL_100:

      v64 = _NUAssertFailHandler();
      goto LABEL_101;
    }
LABEL_98:
    if (v61)
    {
      specific = dispatch_get_specific(*v54);
      v74 = (void *)MEMORY[0x1E0CB3978];
      a6 = specific;
      objc_msgSend(v74, "callStackSymbols");
      v54 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      self = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543618;
      *(_QWORD *)((char *)&buf.origin.x + 4) = specific;
      WORD2(buf.origin.y) = 2114;
      *(_QWORD *)((char *)&buf.origin.y + 6) = self;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

    }
    goto LABEL_100;
  }
  if (!a6)
  {
    NUAssertLogger_3386();
    v62 = objc_claimAutoreleasedReturnValue();
    v19 = "error != NULL";
    a6 = (id *)&unk_1A64D6000;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v63;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v54 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v13 = objc_claimAutoreleasedReturnValue();
    v64 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v64)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543362;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v65;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

      }
LABEL_103:

      v118 = v19;
      _NUAssertFailHandler();
      goto LABEL_104;
    }
LABEL_101:
    if (v64)
    {
      specific = dispatch_get_specific(*v54);
      v75 = (void *)MEMORY[0x1E0CB3978];
      a6 = specific;
      objc_msgSend(v75, "callStackSymbols");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      self = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543618;
      *(_QWORD *)((char *)&buf.origin.x + 4) = specific;
      WORD2(buf.origin.y) = 2114;
      *(_QWORD *)((char *)&buf.origin.y + 6) = self;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

    }
    goto LABEL_103;
  }
  v13 = v12;
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("version"));
  specific = (void *)objc_claimAutoreleasedReturnValue();
  if (!specific)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing version info"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid version info"), specific);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v15 = objc_msgSend(specific, "unsignedIntegerValue");
  if (v15 >= 0x33)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unsupported version"), specific);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = 0;
    *a6 = v16;
    goto LABEL_12;
  }
  p_buf = (CGRect *)v15;
  if (v15 < 3)
  {
    v153 = 0;
    v154 = 0;
    goto LABEL_29;
  }
  v154 = objc_alloc_init(PISegmentationContextInfo);
  -[PISegmentationContextInfo setVersion:](v154, "setVersion:", p_buf);
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("systemVersion"));
  v19 = (char *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v19, "count") != 3)
  {
    v45 = (void *)MEMORY[0x1E0D520A0];
    v46 = CFSTR("Invalid system version info");
LABEL_48:
    objc_msgSend(v45, "invalidError:object:", v46, v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
    *a6 = v47;
LABEL_50:

LABEL_51:
    v17 = 0;
    v48 = v154;
    goto LABEL_228;
  }
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid system name"), v20);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_50;
  }
  v152 = v20;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid system version"), v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v150 = 1;
    goto LABEL_110;
  }
  v146 = v21;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v144 = v22;
    -[PISegmentationContextInfo setSystemName:](v154, "setSystemName:", v152);
    -[PISegmentationContextInfo setSystemVersion:](v154, "setSystemVersion:", v146);
    -[PISegmentationContextInfo setSystemBuildVersion:](v154, "setSystemBuildVersion:", v22);
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("sourceMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid source mode"), v6);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v150 = 1;
LABEL_108:

      v22 = v144;
      goto LABEL_109;
    }
    v138 = v6;
    -[PISegmentationContextInfo setSourceMode:](v154, "setSourceMode:", objc_msgSend(v6, "integerValue"));
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("segmentationDisabled"));
    v23 = objc_claimAutoreleasedReturnValue();
    obj = (id)v23;
    if (v23)
    {
      v24 = (void *)v23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid segmentation disabled flag"), v24);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v150 = 1;
        v6 = v138;
LABEL_107:

        goto LABEL_108;
      }
      -[PISegmentationContextInfo setSegmentationDisabled:](v154, "setSegmentationDisabled:", objc_msgSend(v24, "BOOLValue"));
    }
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("infillAlgorithm"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid infill algorithm"), v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v150 = 1;
      v67 = v25;
      v6 = v138;
LABEL_106:

      goto LABEL_107;
    }
    v132 = v25;
    -[PISegmentationContextInfo setInfillAlgorithm:](v154, "setInfillAlgorithm:", objc_msgSend(v25, "integerValue"));
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("layoutConfiguration"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v135 = (void *)v26;
    v6 = v138;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v170 = 0;
      objc_msgSend(MEMORY[0x1E0D75340], "compoundDeviceConfigurationFromDictionary:error:", v135, &v170);
      v148 = (id)objc_claimAutoreleasedReturnValue();
      -[PISegmentationContextInfo setLayoutConfiguration:](v154, "setLayoutConfiguration:", v148);

      -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("role"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v149 = v27;
        -[PISegmentationContextInfo setRole:](v154, "setRole:", objc_msgSend(v27, "integerValue"));
        v27 = v149;
      }

      v150 = 0;
      v28 = v135;
      goto LABEL_105;
    }
LABEL_104:
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid layout configuration"), v135, v118);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v135;
    v150 = 1;
LABEL_105:

    v67 = v132;
    goto LABEL_106;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid system build version"), v22);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  v150 = 1;
LABEL_109:

  v21 = v146;
LABEL_110:

  if (v150)
    goto LABEL_51;
  if ((unint64_t)p_buf >= 0x26)
  {
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("settlingEffectStatus"));
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v153 = objc_msgSend(v19, "unsignedIntegerValue");

        goto LABEL_121;
      }
      v84 = (void *)MEMORY[0x1E0D520A0];
      v85 = CFSTR("Expected a number");
LABEL_138:
      objc_msgSend(v84, "mismatchError:object:", v85, v19);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    v82 = (void *)MEMORY[0x1E0D520A0];
    v83 = CFSTR("Missing settling effect status");
LABEL_136:
    objc_msgSend(v82, "missingError:object:", v83, v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if ((unint64_t)p_buf < 0x22)
  {
    v153 = 0;
    goto LABEL_29;
  }
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("hasSettlingEffect"));
  v19 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v82 = (void *)MEMORY[0x1E0D520A0];
    v83 = CFSTR("Missing settling effect info");
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v84 = (void *)MEMORY[0x1E0D520A0];
    v85 = CFSTR("Expected BOOLean");
    goto LABEL_138;
  }
  v77 = objc_msgSend(v19, "BOOLValue");
  v78 = 3;
  if (!v77)
    v78 = 1;
  v153 = v78;

  if ((unint64_t)p_buf < 0x24)
  {
LABEL_29:
    v29 = 0;
    x = *MEMORY[0x1E0D71110];
    y = *(double *)(MEMORY[0x1E0D71110] + 8);
    width = *(double *)(MEMORY[0x1E0D71110] + 16);
    height = *(double *)(MEMORY[0x1E0D71110] + 24);
    goto LABEL_30;
  }
LABEL_121:
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("settlingEffectBounds"));
  v19 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v82 = (void *)MEMORY[0x1E0D520A0];
    v83 = CFSTR("Missing settling effect bounds");
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v84 = (void *)MEMORY[0x1E0D520A0];
    v85 = CFSTR("Expected dictionary");
    goto LABEL_138;
  }
  memset(&buf, 0, sizeof(buf));
  v19 = v19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_177;
  }
  v79 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v19, &buf);

  if (!v79)
  {
LABEL_177:
    v45 = (void *)MEMORY[0x1E0D520A0];
    v46 = CFSTR("Invalid settling effect bounds value");
    goto LABEL_48;
  }
  x = buf.origin.x;
  y = buf.origin.y;
  width = buf.size.width;
  height = buf.size.height;

  if ((unint64_t)p_buf < 0x27)
  {
    v29 = 0;
  }
  else
  {
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("settlingEffectLayout"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected layout dictionary"), v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_211;
      }
      objc_msgSend(MEMORY[0x1E0D75208], "layoutWithDictionaryRepresentation:", v80);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to deserialize settling effect layout info"), v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_211:
        *a6 = v81;

        goto LABEL_51;
      }
    }
    else
    {
      v29 = 0;
    }

  }
LABEL_30:
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("classification"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing classification info"), v13);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:
    v17 = 0;
    *a6 = v49;
    v48 = v154;
    goto LABEL_227;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected classification string"), v34);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  v151 = v29;
  v147 = PFPosterClassificationNamed();
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("hasMatte"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing matte image info"), v13);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:
    v17 = 0;
    *a6 = v50;
    v48 = v154;
    goto LABEL_226;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected BOOLean"), v35);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v145 = v35;
  *a4 = objc_msgSend(v35, "BOOLValue");
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("hasBackground"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing background image info"), v13);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_63:
    v17 = 0;
    *a6 = v51;
    v48 = v154;
    goto LABEL_225;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected BOOLean"), v36);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  *a5 = objc_msgSend(v36, "BOOLValue");
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("regions"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (!v37)
    goto LABEL_39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected regions dictionary"), v38);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:
    v48 = v154;
    goto LABEL_224;
  }
  v169 = 0;
  +[PISegmentationLayoutRegions regionsFromDictionary:error:](PISegmentationLayoutRegions, "regionsFromDictionary:error:", v38, &v169);
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    v68 = (void *)MEMORY[0x1E0D520A0];
    v69 = v169;
    objc_msgSend(v68, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize regions info"), v38, v69);
    v70 = v38;
    v71 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    *a6 = v71;
    v38 = v70;
    goto LABEL_91;
  }
LABEL_39:
  v139 = (void *)v37;
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("layout"));
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (v39)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D75208], "layoutWithDictionaryRepresentation:", v40);
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
        goto LABEL_42;
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to deserialize layout info"), v40);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected layout dictionary"), v40);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = 0;
    *a6 = v66;
    v48 = v154;
    v86 = v40;
    v35 = v145;
    goto LABEL_223;
  }
LABEL_42:
  v130 = v40;
  v131 = (void *)v39;
  v129 = v38;
  if ((unint64_t)p_buf < 0x32)
  {
    v134 = 0;
  }
  else
  {
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("headroomLayout"));
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected headroom layout dictionary"), v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)v41;
        goto LABEL_175;
      }
      v133 = (void *)v41;
      objc_msgSend(MEMORY[0x1E0D75208], "layoutWithDictionaryRepresentation:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
        v43 = (void *)v41;
        objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to deserialize headroom layout info"), v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v129;
LABEL_175:
        v17 = 0;
        *a6 = v44;
        v48 = v154;
        v35 = v145;
        goto LABEL_222;
      }
    }
    else
    {
      v133 = 0;
      v42 = 0;
    }

    v134 = (void *)v42;
    v38 = v129;
  }
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("scores"));
  v87 = objc_claimAutoreleasedReturnValue();
  v128 = (void *)v87;
  if (v87)
  {
    v88 = (void *)v87;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected score dictionary"), v88);
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v48 = v154;
      v35 = v145;
      goto LABEL_221;
    }
    v127 = v36;
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    obja = v88;
    v89 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v165, v173, 16);
    if (v89)
    {
      v90 = v89;
      v136 = *(_QWORD *)v166;
      do
      {
        for (i = 0; i != v90; ++i)
        {
          if (*(_QWORD *)v166 != v136)
            objc_enumerationMutation(obja);
          v92 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid score key"), v92);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_180;
          }
          objc_msgSend(obja, "objectForKeyedSubscript:", v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid score value"), v93);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_180:
LABEL_219:
            v17 = 0;
            v48 = v154;
            v35 = v145;
            v36 = v127;
            goto LABEL_220;
          }

        }
        v90 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v165, v173, 16);
      }
      while (v90);
    }

    v36 = v127;
  }
  if ((unint64_t)p_buf >= 7)
  {
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("colorAnalysis"));
    v94 = objc_claimAutoreleasedReturnValue();
    v127 = v36;
    if (v94)
    {
      v95 = (void *)v94;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid color analysis info"), v95);
        v99 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_193;
      }
      v164 = 0;
      v96 = v95;
      +[PIParallaxColorAnalysis loadFromContentsDictionary:error:](PIParallaxColorAnalysis, "loadFromContentsDictionary:error:", v95, &v164);
      objb = (id)objc_claimAutoreleasedReturnValue();
      if (!objb)
      {
        v97 = (void *)MEMORY[0x1E0D520A0];
        v98 = v164;
        objc_msgSend(v97, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize color analysis info"), v95, v98);
        v99 = (id)objc_claimAutoreleasedReturnValue();

LABEL_193:
        *a6 = v99;
LABEL_218:

        goto LABEL_219;
      }
    }
    else
    {
      v96 = 0;
      objb = 0;
    }
    v137 = 0;
    goto LABEL_183;
  }
  -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("styles"));
  v100 = objc_claimAutoreleasedReturnValue();
  if (!v100)
  {
    v137 = 0;
    v109 = 0;
    v107 = 0;
    v110 = v153;
    v48 = v154;
    goto LABEL_190;
  }
  v95 = (void *)v100;
  v127 = v36;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected styles array"), v95);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_218;
  }
  v120 = v95;
  PFParallaxLayerStyleSupportedKinds();
  objc = (id)objc_claimAutoreleasedReturnValue();
  v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((unint64_t)p_buf <= 3)
  {
    v162 = 0uLL;
    v163 = 0uLL;
    v160 = 0uLL;
    v161 = 0uLL;
    v123 = v95;
    v101 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v160, v172, 16);
    if (v101)
    {
      v102 = v101;
      v125 = *(_QWORD *)v161;
      while (2)
      {
        for (j = 0; j != v102; ++j)
        {
          if (*(_QWORD *)v161 != v125)
            objc_enumerationMutation(v123);
          v104 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(objc, "containsObject:", v104))
          {
            v115 = (void *)MEMORY[0x1E0D520A0];
            v116 = v104;
            goto LABEL_213;
          }
          v105 = objc_alloc(MEMORY[0x1E0D751A0]);
          v106 = (void *)objc_msgSend(v105, "initWithKind:parameters:colorSuggestions:", v104, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60]);
          objc_msgSend(v137, "addObject:", v106);

        }
        v102 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v160, v172, 16);
        if (v102)
          continue;
        break;
      }
    }
    goto LABEL_206;
  }
  v158 = 0uLL;
  v159 = 0uLL;
  v156 = 0uLL;
  v157 = 0uLL;
  v119 = v95;
  v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
  if (!v121)
    goto LABEL_206;
  v122 = *(_QWORD *)v157;
  while (2)
  {
    for (k = 0; k != v121; ++k)
    {
      if (*(_QWORD *)v157 != v122)
        objc_enumerationMutation(v119);
      v112 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v115 = (void *)MEMORY[0x1E0D520A0];
        v116 = v112;
LABEL_213:
        objc_msgSend(v115, "invalidError:object:", CFSTR("Invalid style value"), v116);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_217;
      }
      v155 = 0;
      objc_msgSend(MEMORY[0x1E0D751A0], "styleWithDictionary:error:", v112, &v155);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = v155;
      if (!v113)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Invalid style dictionary"), v112, v126);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_216:
        *a6 = v117;

LABEL_217:
        v95 = v120;

        goto LABEL_218;
      }
      objc_msgSend(v113, "kind");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend(objc, "containsObject:", v114);

      if ((v124 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Unsupported style kind"), v113);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_216;
      }
      objc_msgSend(v137, "addObject:", v113);

    }
    v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
    if (v121)
      continue;
    break;
  }
LABEL_206:
  v96 = v120;

  objb = 0;
LABEL_183:

  if ((unint64_t)p_buf < 0xE)
  {
    v107 = 0;
  }
  else
  {
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("localLightData"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid local light data"), v107);
        v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v48 = v154;
        v36 = v127;
        v108 = v137;
        v109 = objb;
        goto LABEL_191;
      }
    }
  }
  v110 = v153;
  v48 = v154;
  v36 = v127;
  v109 = objb;
LABEL_190:
  -[PIParallaxSegmentationItem setClassification:](self, "setClassification:", v147);
  -[PIParallaxSegmentationItem setRegions:](self, "setRegions:", v139);
  -[PIParallaxSegmentationItem setOriginalLayout:](self, "setOriginalLayout:", v131);
  -[PIParallaxSegmentationItem setHeadroomLayout:](self, "setHeadroomLayout:", v134);
  -[PIParallaxSegmentationItem setScores:](self, "setScores:", v128);
  -[PIParallaxSegmentationItem setColorAnalysis:](self, "setColorAnalysis:", v109);
  v108 = v137;
  -[PIParallaxSegmentationItem set_availableStyles:](self, "set_availableStyles:", v137);
  -[PIParallaxSegmentationItem setLocalLightData:](self, "setLocalLightData:", v107);
  -[PIParallaxSegmentationItem setContextInfo:](self, "setContextInfo:", v48);
  -[PIParallaxSegmentationItem setSettlingEffectStatus:](self, "setSettlingEffectStatus:", v110);
  -[PIParallaxSegmentationItem setSettlingEffectNormalizedBounds:](self, "setSettlingEffectNormalizedBounds:", x, y, width, height);
  -[PIParallaxSegmentationItem setSettlingEffectLayout:](self, "setSettlingEffectLayout:", v151);
  v17 = 1;
LABEL_191:

  v35 = v145;
LABEL_220:
  v38 = v129;
LABEL_221:
  v43 = v134;

LABEL_222:
  v86 = v130;
LABEL_223:

LABEL_224:
LABEL_225:

LABEL_226:
  v29 = v151;
LABEL_227:

LABEL_228:
LABEL_12:

  return v17;
}

- (void)resetSettlingEffectGatingFailure
{
  void *v3;
  id v4;

  -[PIParallaxSegmentationItem scores](self, "scores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D75820]);
  -[PIParallaxSegmentationItem setScores:](self, "setScores:", v4);

}

- (void)updateScores:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PIParallaxSegmentationItem scores](self, "scores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  -[PIParallaxSegmentationItem setScores:](self, "setScores:", v6);

}

- (PFParallaxAssetResource)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
  objc_storeStrong((id *)&self->_resource, a3);
}

- (PFParallaxAssetResource)livePhotoResource
{
  return self->_livePhotoResource;
}

- (void)setLivePhotoResource:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoResource, a3);
}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (unint64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(unint64_t)a3
{
  self->_classification = a3;
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (void)setSegmentationMatte:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationMatte, a3);
}

- (NUImageBuffer)segmentationConfidenceMap
{
  return self->_segmentationConfidenceMap;
}

- (void)setSegmentationConfidenceMap:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationConfidenceMap, a3);
}

- (NUImageBuffer)segmentationBackground
{
  return self->_segmentationBackground;
}

- (void)setSegmentationBackground:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationBackground, a3);
}

- (PFParallaxAssetRegions)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (PFPosterLayout)defaultLayout
{
  return self->_defaultLayout;
}

- (void)setDefaultLayout:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLayout, a3);
}

- (PFPosterLayout)originalLayout
{
  return self->_originalLayout;
}

- (void)setOriginalLayout:(id)a3
{
  objc_storeStrong((id *)&self->_originalLayout, a3);
}

- (PFPosterLayout)headroomLayout
{
  return self->_headroomLayout;
}

- (void)setHeadroomLayout:(id)a3
{
  objc_storeStrong((id *)&self->_headroomLayout, a3);
}

- (PFPosterLayout)settlingEffectLayout
{
  return self->_settlingEffectLayout;
}

- (void)setSettlingEffectLayout:(id)a3
{
  objc_storeStrong((id *)&self->_settlingEffectLayout, a3);
}

- (NSDictionary)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PIParallaxColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (void)setColorAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_colorAnalysis, a3);
}

- (NSDictionary)localLightData
{
  return self->_localLightData;
}

- (void)setLocalLightData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CGRect)settlingEffectNormalizedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_settlingEffectNormalizedBounds.origin.x;
  y = self->_settlingEffectNormalizedBounds.origin.y;
  width = self->_settlingEffectNormalizedBounds.size.width;
  height = self->_settlingEffectNormalizedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)settlingEffectStatus
{
  return self->_settlingEffectStatus;
}

- (NSData)settlingEffectVideoData
{
  return self->_settlingEffectVideoData;
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
}

- (NSArray)_availableStyles
{
  return self->__availableStyles;
}

- (void)set_availableStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)_defaultStyles
{
  return self->__defaultStyles;
}

- (void)set_defaultStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSURL)segmentationDataURL
{
  return self->_segmentationDataURL;
}

- (void)setSegmentationDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationDataURL, a3);
}

- (PISegmentationContextInfo)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_contextInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_segmentationDataURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->__defaultStyles, 0);
  objc_storeStrong((id *)&self->__availableStyles, 0);
  objc_storeStrong((id *)&self->_settlingEffectVideoData, 0);
  objc_storeStrong((id *)&self->_localLightData, 0);
  objc_storeStrong((id *)&self->_colorAnalysis, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_settlingEffectLayout, 0);
  objc_storeStrong((id *)&self->_headroomLayout, 0);
  objc_storeStrong((id *)&self->_originalLayout, 0);
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_segmentationBackground, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceMap, 0);
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_livePhotoResource, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

uint64_t __56__PIParallaxSegmentationItem_suggestedStyleForCategory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __51__PIParallaxSegmentationItem_availableStyleOfKind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __61__PIParallaxSegmentationItem_settlingEffectGatingDiagnostics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFString *v6;
  id v7;

  v5 = a3;
  if ((objc_msgSend(a2, "unsignedIntegerValue") & ~*(_QWORD *)(a1 + 40)) != 0)
    v6 = CFSTR("No");
  else
    v6 = CFSTR("Yes");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

+ (id)_matteImageLoadingBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PIParallaxSegmentationItem__matteImageLoadingBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e53___PISegmentationLoadingResult_16__0__PFAppleArchive_8l;
  v3[4] = a1;
  return (id)MEMORY[0x1A85C0174](v3, a2);
}

+ (id)_backgroundImageLoadingBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PIParallaxSegmentationItem__backgroundImageLoadingBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e53___PISegmentationLoadingResult_16__0__PFAppleArchive_8l;
  v3[4] = a1;
  return (id)MEMORY[0x1A85C0174](v3, a2);
}

+ (id)_settlingEffectDataLoadingBlock
{
  return &__block_literal_global_3566;
}

+ (BOOL)writeImageBuffer:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v14;
  const void **v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  const void **v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  const void **v27;
  void *v28;
  int v29;
  void *v30;
  const void **v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  const void **v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    NUAssertLogger_3386();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v32 = dispatch_get_specific(*v16);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v16 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v32;
        v47 = 2114;
        v48 = v35;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v16;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v24 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  v9 = v8;
  if (!v8)
  {
    NUAssertLogger_3386();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destinationURL != nil");
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    v23 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v23)
    {
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v16;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_27:

      v29 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v24)
    {
      v36 = dispatch_get_specific(*v16);
      v37 = (void *)MEMORY[0x1E0CB3978];
      v38 = v36;
      objc_msgSend(v37, "callStackSymbols");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v36;
      v47 = 2114;
      v48 = v39;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_27;
  }
  if (!a5)
  {
    NUAssertLogger_3386();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    v28 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v18 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v31;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_30;
    }
LABEL_28:
    if (v29)
    {
      v40 = dispatch_get_specific(*v16);
      v41 = (void *)MEMORY[0x1E0CB3978];
      v42 = v40;
      objc_msgSend(v41, "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v40;
      v47 = 2114;
      v48 = v44;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_30:

    _NUAssertFailHandler();
  }
  objc_msgSend(v7, "CVPixelBuffer");
  v10 = PFFigEncodeCVPixelBufferToURL();
  if ((_DWORD)v10)
  {
    v11 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "failureError:object:", CFSTR("Failed to encode pixel buffer"), v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (_DWORD)v10 == 0;
}

+ (id)readImageBufferFromURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t CVPixelBufferFromURL;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _BYTE texture[12];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_3386();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageURL != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v25 = dispatch_get_specific(*v14);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)texture = 138543618;
        *(_QWORD *)&texture[4] = v25;
        v35 = 2114;
        v36 = v28;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v14;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);

    }
    v22 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    v21 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)texture = 138543362;
        *(_QWORD *)&texture[4] = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      v30 = (void *)MEMORY[0x1E0CB3978];
      v31 = v29;
      objc_msgSend(v30, "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543618;
      *(_QWORD *)&texture[4] = v29;
      v35 = 2114;
      v36 = v33;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v6 = v5;
  *(_QWORD *)texture = 0;
  CVPixelBufferFromURL = PFFigCreateCVPixelBufferFromURL();
  if ((_DWORD)CVPixelBufferFromURL)
  {
    v8 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CVPixelBufferFromURL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failureError:object:", CFSTR("Failed to decode pixel buffer"), v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52040]), "initWithCVPixelBuffer:", *(_QWORD *)texture);
    CVPixelBufferRelease(*(CVPixelBufferRef *)texture);
  }

  return v10;
}

+ (id)dataForImageBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v14;
  const void **v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  const void **v22;
  void *v23;
  int v24;
  void *v25;
  const void **v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  const void **v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_3386();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v27 = dispatch_get_specific(*v16);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v16 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = (const void **)v27;
        v38 = 2114;
        v39 = v30;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v16;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v24 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    v23 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v23)
    {
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v24)
    {
      v31 = dispatch_get_specific(*v16);
      v32 = (void *)MEMORY[0x1E0CB3978];
      v33 = v31;
      objc_msgSend(v32, "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = (const void **)v31;
      v38 = 2114;
      v39 = v35;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v6 = v5;
  objc_msgSend(v5, "CVPixelBuffer");
  v7 = PFFigEncodeCVPixelBufferToData();
  v8 = 0;
  v9 = v8;
  if ((_DWORD)v7)
  {
    v10 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "failureError:object:", CFSTR("Failed to encode pixel buffer"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  else
  {
    v12 = v8;
  }

  return v12;
}

+ (id)imageBufferFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t CVPixelBufferFromImageData;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _BYTE texture[12];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_3386();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageData != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v25 = dispatch_get_specific(*v14);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)texture = 138543618;
        *(_QWORD *)&texture[4] = v25;
        v35 = 2114;
        v36 = v28;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v14;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);

    }
    v22 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a4)
  {
    NUAssertLogger_3386();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    v21 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)texture = 138543362;
        *(_QWORD *)&texture[4] = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      v30 = (void *)MEMORY[0x1E0CB3978];
      v31 = v29;
      objc_msgSend(v30, "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543618;
      *(_QWORD *)&texture[4] = v29;
      v35 = 2114;
      v36 = v33;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v6 = v5;
  *(_QWORD *)texture = 0;
  CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
  if ((_DWORD)CVPixelBufferFromImageData)
  {
    v8 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CVPixelBufferFromImageData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failureError:object:", CFSTR("Failed to decode pixel buffer"), v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52040]), "initWithCVPixelBuffer:", *(_QWORD *)texture);
    CVPixelBufferRelease(*(CVPixelBufferRef *)texture);
  }

  return v10;
}

+ (void)loadSettlingEffectVideoDataFromURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  PIParallaxSegmentationItem *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    NUAssertLogger_3386();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3386();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v22;
        v30 = 2114;
        v31 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  v8 = objc_alloc_init(PIParallaxSegmentationItem);
  v27 = 0;
  objc_msgSend((id)objc_opt_class(), "_settlingEffectDataLoadingBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PIParallaxSegmentationItem _loadSegmentationDataFromURL:error:matteImageLoadingBlock:backgroundImageLoadingBlock:settingEffectDataLoadingBlock:](v8, "_loadSegmentationDataFromURL:error:matteImageLoadingBlock:backgroundImageLoadingBlock:settingEffectDataLoadingBlock:", v5, &v27, &__block_literal_global_335, &__block_literal_global_335, v9);
  v11 = v27;

  if (v10
    && (-[PIParallaxSegmentationItem settlingEffectVideoData](v8, "settlingEffectVideoData"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    -[PIParallaxSegmentationItem settlingEffectVideoData](v8, "settlingEffectVideoData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load settling effect data"), v5, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v13);
  }

}

PISegmentationLoadingResult *__76__PIParallaxSegmentationItem_loadSettlingEffectVideoDataFromURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;
  id v4;
  id v5;
  id v6;
  PISegmentationLoadingResult *v7;
  void *v8;
  id v10;
  id v11;
  id v12;

  v2 = a2;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  v3 = objc_msgSend(v2, "decodeData:filename:error:", &v12, &v11, &v10);
  v4 = v12;
  v5 = v11;
  v6 = v10;

  if ((v3 & 1) != 0)
  {
    v7 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode image data"), v2, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 0, v8);

  }
  return v7;
}

PISegmentationLoadingResult *__61__PIParallaxSegmentationItem__settlingEffectDataLoadingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;
  id v4;
  id v5;
  id v6;
  PISegmentationLoadingResult *v7;
  uint64_t v8;
  void *v9;
  id v11;
  id v12;
  id v13;

  v2 = a2;
  v12 = 0;
  v13 = 0;
  v11 = 0;
  v3 = objc_msgSend(v2, "decodeData:filename:error:", &v13, &v12, &v11);
  v4 = v13;
  v5 = v12;
  v6 = v11;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode settling effect video data"), v2, v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v8;
    v7 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 0, v8);

    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("settlingEffect.mov")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Expected settlingEffect.mov data"), v5);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", v4, 1, 0);
LABEL_7:

  return v7;
}

PISegmentationLoadingResult *__58__PIParallaxSegmentationItem__backgroundImageLoadingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  PISegmentationLoadingResult *v9;
  uint64_t v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = a2;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v3 = objc_msgSend(v2, "decodeData:filename:error:", &v16, &v15, &v14);
  v4 = v16;
  v5 = v15;
  v6 = v14;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode background image data"), v2, v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v10;
    v9 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 0, v10);
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("background.heic")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Expected background.heic data"), v5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "imageBufferFromData:error:", v4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v7)
  {
    v9 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", v7, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read background image data"), v4, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 0, v11);

  }
  v6 = v8;
LABEL_10:

  return v9;
}

PISegmentationLoadingResult *__53__PIParallaxSegmentationItem__matteImageLoadingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  PISegmentationLoadingResult *v9;
  uint64_t v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = a2;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v3 = objc_msgSend(v2, "decodeData:filename:error:", &v16, &v15, &v14);
  v4 = v16;
  v5 = v15;
  v6 = v14;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode matte image data"), v2, v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v10;
    v9 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 0, v10);
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("matte.heic")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Expected matte.heic data"), v5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "imageBufferFromData:error:", v4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v7)
  {
    v9 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", v7, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read matte image data"), v4, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PISegmentationLoadingResult initWithObject:success:error:]([PISegmentationLoadingResult alloc], "initWithObject:success:error:", 0, 0, v11);

  }
  v6 = v8;
LABEL_10:

  return v9;
}

@end
