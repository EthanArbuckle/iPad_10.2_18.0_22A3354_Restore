@implementation PXDisplayAssetViewDemoSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetViewDemoSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXDisplayAssetViewDemoSettings setPreferredDynamicRange:](self, "setPreferredDynamicRange:", 2);
  -[PXDisplayAssetViewDemoSettings setAllowsTextSelection:](self, "setAllowsTextSelection:", 0);
  -[PXDisplayAssetViewDemoSettings setStringToHighlight:](self, "setStringToHighlight:", 0);
  -[PXDisplayAssetViewDemoSettings setSceneIdentifiersToHighlightString:](self, "setSceneIdentifiersToHighlightString:", 0);
  -[PXDisplayAssetViewDemoSettings setAudioIdentifiersToHighlightString:](self, "setAudioIdentifiersToHighlightString:", 0);
  -[PXDisplayAssetViewDemoSettings setHumanActionIdentifiersToHighlightString:](self, "setHumanActionIdentifiersToHighlightString:", 0);
  -[PXDisplayAssetViewDemoSettings setShowDummyTimeRangeHighlight:](self, "setShowDummyTimeRangeHighlight:", 0);
}

- (void)setStringToHighlight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setShowDummyTimeRangeHighlight:(BOOL)a3
{
  self->_showDummyTimeRangeHighlight = a3;
}

- (void)setSceneIdentifiersToHighlightString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setHumanActionIdentifiersToHighlightString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setAudioIdentifiersToHighlightString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  self->_allowsTextSelection = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (NSArray)stringsToHighlight
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PXDisplayAssetViewDemoSettings stringToHighlight](self, "stringToHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSArray)sceneIdentifiersToHighlight
{
  void *v2;
  void *v3;
  void *v4;

  -[PXDisplayAssetViewDemoSettings sceneIdentifiersToHighlightString](self, "sceneIdentifiersToHighlightString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)audioIdentifiersToHighlight
{
  void *v2;
  void *v3;
  void *v4;

  -[PXDisplayAssetViewDemoSettings audioIdentifiersToHighlightString](self, "audioIdentifiersToHighlightString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)humanActionIdentifiersToHighlight
{
  void *v2;
  void *v3;
  void *v4;

  -[PXDisplayAssetViewDemoSettings humanActionIdentifiersToHighlightString](self, "humanActionIdentifiersToHighlightString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)personLocalIdentifiersToHighlight
{
  void *v2;
  void *v3;

  -[PXDisplayAssetViewDemoSettings personLocalIdentifiersToHighlightString](self, "personLocalIdentifiersToHighlightString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)allowsTextSelection
{
  return self->_allowsTextSelection;
}

- (NSString)stringToHighlight
{
  return self->_stringToHighlight;
}

- (NSString)sceneIdentifiersToHighlightString
{
  return self->_sceneIdentifiersToHighlightString;
}

- (NSString)audioIdentifiersToHighlightString
{
  return self->_audioIdentifiersToHighlightString;
}

- (NSString)humanActionIdentifiersToHighlightString
{
  return self->_humanActionIdentifiersToHighlightString;
}

- (NSString)personLocalIdentifiersToHighlightString
{
  return self->_personLocalIdentifiersToHighlightString;
}

- (void)setPersonLocalIdentifiersToHighlightString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)showDummyTimeRangeHighlight
{
  return self->_showDummyTimeRangeHighlight;
}

- (int64_t)preferredDynamicRange
{
  return self->_preferredDynamicRange;
}

- (void)setPreferredDynamicRange:(int64_t)a3
{
  self->_preferredDynamicRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_audioIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_stringToHighlight, 0);
}

uint64_t __67__PXDisplayAssetViewDemoSettings_humanActionIdentifiersToHighlight__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

uint64_t __61__PXDisplayAssetViewDemoSettings_audioIdentifiersToHighlight__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

uint64_t __61__PXDisplayAssetViewDemoSettings_sceneIdentifiersToHighlight__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

+ (PXDisplayAssetViewDemoSettings)sharedInstance
{
  if (sharedInstance_onceToken_105698 != -1)
    dispatch_once(&sharedInstance_onceToken_105698, &__block_literal_global_105699);
  return (PXDisplayAssetViewDemoSettings *)(id)sharedInstance_sharedInstance_105700;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXDisplayAssetViewDemoSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_105690 != -1)
    dispatch_once(&transientProperties_onceToken_105690, block);
  return (id)transientProperties_transientProperties_105691;
}

void __53__PXDisplayAssetViewDemoSettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___PXDisplayAssetViewDemoSettings;
  objc_msgSendSuper2(&v10, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stringsToHighlight);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  NSStringFromSelector(sel_sceneIdentifiersToHighlight);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  NSStringFromSelector(sel_audioIdentifiersToHighlight);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  NSStringFromSelector(sel_humanActionIdentifiersToHighlight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  NSStringFromSelector(sel_personLocalIdentifiersToHighlight);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)transientProperties_transientProperties_105691;
  transientProperties_transientProperties_105691 = v8;

}

void __48__PXDisplayAssetViewDemoSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetViewDemoSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_105700;
  sharedInstance_sharedInstance_105700 = v0;

}

@end
