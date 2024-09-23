@implementation PBFPosterSnapshotDefinition

+ (id)gallerySnapshotDefinition
{
  if (gallerySnapshotDefinition_onceToken != -1)
    dispatch_once(&gallerySnapshotDefinition_onceToken, &__block_literal_global_22);
  return (id)gallerySnapshotDefinition_gallerySnapshotDefinition;
}

void __56__PBFPosterSnapshotDefinition_gallerySnapshotDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierGallery);
  v2 = (void *)gallerySnapshotDefinition_gallerySnapshotDefinition;
  gallerySnapshotDefinition_gallerySnapshotDefinition = v1;

}

+ (id)gallerySnapshotKeyFrameDefinition
{
  if (gallerySnapshotKeyFrameDefinition_onceToken != -1)
    dispatch_once(&gallerySnapshotKeyFrameDefinition_onceToken, &__block_literal_global_16);
  return (id)gallerySnapshotKeyFrameDefinition_gallerySnapshotKeyFrameDefinition;
}

void __64__PBFPosterSnapshotDefinition_gallerySnapshotKeyFrameDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierGalleryKeyFrame);
  v2 = (void *)gallerySnapshotKeyFrameDefinition_gallerySnapshotKeyFrameDefinition;
  gallerySnapshotKeyFrameDefinition_gallerySnapshotKeyFrameDefinition = v1;

}

+ (id)gallerySnapshotWithComplicationsDefinition
{
  if (gallerySnapshotWithComplicationsDefinition_onceToken != -1)
    dispatch_once(&gallerySnapshotWithComplicationsDefinition_onceToken, &__block_literal_global_17);
  return (id)gallerySnapshotWithComplicationsDefinition_gallerySnapshotDefinition;
}

void __73__PBFPosterSnapshotDefinition_gallerySnapshotWithComplicationsDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierGalleryWithComplications);
  v2 = (void *)gallerySnapshotWithComplicationsDefinition_gallerySnapshotDefinition;
  gallerySnapshotWithComplicationsDefinition_gallerySnapshotDefinition = v1;

}

+ (id)switcherSnapshotDefinition
{
  if (switcherSnapshotDefinition_onceToken != -1)
    dispatch_once(&switcherSnapshotDefinition_onceToken, &__block_literal_global_18);
  return (id)switcherSnapshotDefinition_switcherSnapshotDefinition;
}

void __57__PBFPosterSnapshotDefinition_switcherSnapshotDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierSwitcher);
  v2 = (void *)switcherSnapshotDefinition_switcherSnapshotDefinition;
  switcherSnapshotDefinition_switcherSnapshotDefinition = v1;

}

+ (id)switcherUnlockedSnapshotDefinition
{
  if (switcherUnlockedSnapshotDefinition_onceToken != -1)
    dispatch_once(&switcherUnlockedSnapshotDefinition_onceToken, &__block_literal_global_19);
  return (id)switcherUnlockedSnapshotDefinition_switcherUnlockedSnapshotDefinition;
}

void __65__PBFPosterSnapshotDefinition_switcherUnlockedSnapshotDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierSwitcherUnlocked);
  v2 = (void *)switcherUnlockedSnapshotDefinition_switcherUnlockedSnapshotDefinition;
  switcherUnlockedSnapshotDefinition_switcherUnlockedSnapshotDefinition = v1;

}

+ (id)switcherFloatingLayerSnapshotDefinition
{
  if (switcherFloatingLayerSnapshotDefinition_onceToken != -1)
    dispatch_once(&switcherFloatingLayerSnapshotDefinition_onceToken, &__block_literal_global_20_0);
  return (id)switcherFloatingLayerSnapshotDefinition_switcherFloatingLayerSnapshotDefinition;
}

void __70__PBFPosterSnapshotDefinition_switcherFloatingLayerSnapshotDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierSwitcherFloatingLayer);
  v2 = (void *)switcherFloatingLayerSnapshotDefinition_switcherFloatingLayerSnapshotDefinition;
  switcherFloatingLayerSnapshotDefinition_switcherFloatingLayerSnapshotDefinition = v1;

}

+ (id)editingConfirmationDefinition
{
  if (editingConfirmationDefinition_onceToken[0] != -1)
    dispatch_once(editingConfirmationDefinition_onceToken, &__block_literal_global_21);
  return (id)editingConfirmationDefinition_editingConfirmationDefinition;
}

void __60__PBFPosterSnapshotDefinition_editingConfirmationDefinition__block_invoke()
{
  PBFPosterSnapshotDefinition *v0;
  uint64_t v1;
  void *v2;

  v0 = [PBFPosterSnapshotDefinition alloc];
  v1 = -[PBFPosterSnapshotDefinition initWithUniqueIdentifier:](v0, "initWithUniqueIdentifier:", PRPosterSnapshotDefinitionIdentifierEditingConfirmation);
  v2 = (void *)editingConfirmationDefinition_editingConfirmationDefinition;
  editingConfirmationDefinition_editingConfirmationDefinition = v1;

}

+ (id)defaultPreviewDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  +[PBFPosterSnapshotDefinition gallerySnapshotDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotKeyFrameDefinition", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotWithComplicationsDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultPreviewDefinitionForPreview:(id)a3
{
  PFCurrentDeviceClass();
  return +[PBFPosterSnapshotDefinition gallerySnapshotDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotDefinition");
}

+ (id)defaultConfigurationDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  +[PBFPosterSnapshotDefinition switcherSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherSnapshotDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[PBFPosterSnapshotDefinition switcherFloatingLayerSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherFloatingLayerSnapshotDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[PBFPosterSnapshotDefinition switcherUnlockedSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherUnlockedSnapshotDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotWithComplicationsDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PBFPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PBFPosterSnapshotDefinition *v8;
  PBFPosterSnapshotDefinition *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  char v15;

  v4 = a3;
  v15 = 0;
  v14 = 0.0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  _PBFPosterSnapshotDefinitionAttributesForIdentifier(v4, &v15, (uint64_t)&v11);
  if (v15)
  {
    v5 = v11;
    v6 = BYTE1(v11);
    PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:](self, "initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:", v4, v5, v6, v7, v12, *((_QWORD *)&v12 + 1), v13);

    if (v8)
      v8->_persistenceScale = v14;
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  if (-[PBFPosterSnapshotDefinition shouldBePersistedOnlyTemporarily](self, "shouldBePersistedOnlyTemporarily"))
    v5 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("shouldBePersistedOnlyTemporarily"));
  -[PBFPosterSnapshotDefinition persistenceScale](self, "persistenceScale");
  if ((BSFloatIsOne() & 1) == 0)
  {
    -[PBFPosterSnapshotDefinition persistenceScale](self, "persistenceScale");
    v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("persistenceScale"));
  }
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldBePersistedOnlyTemporarily
{
  void *v2;
  char v3;

  -[PRPosterSnapshotDefinition uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", PRPosterSnapshotDefinitionIdentifierEditingConfirmation);

  return v3;
}

- (id)_persistenceIdentitifer
{
  NSString *persistenceIdentifier;
  NSString *v3;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  id v16;

  persistenceIdentifier = self->_persistenceIdentifier;
  if (persistenceIdentifier)
  {
    v3 = persistenceIdentifier;
    return v3;
  }
  -[PRPosterSnapshotDefinition uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterSnapshotDefinition layerSet](self, "layerSet");
  switch(v6)
  {
    case 0uLL:
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("-noFloatingLayer"));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
LABEL_8:
      v9 = v5;
      if (-[PRPosterSnapshotDefinition includesHeaderElements](self, "includesHeaderElements"))
        v10 = CFSTR("-withHeader");
      else
        v10 = CFSTR("-noHeader");
      objc_msgSend(v5, "stringByAppendingString:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[PRPosterSnapshotDefinition isUnlocked](self, "isUnlocked"))
        break;
      v7 = CFSTR("-unlocked");
      goto LABEL_13;
    case 1uLL:
      v7 = CFSTR("-floatingLayerOnly");
LABEL_13:
      objc_msgSend(v5, "stringByAppendingString:", v7);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
      break;
  }
  if (-[PRPosterSnapshotDefinition previewContent](self, "previewContent") == 2)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("-KeyFrame"));
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  -[PBFPosterSnapshotDefinition persistenceScale](self, "persistenceScale");
  if ((BSFloatIsOne() & 1) == 0)
  {
    -[PBFPosterSnapshotDefinition persistenceScale](self, "persistenceScale");
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("-PS%f"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v14;
  }
  v15 = self->_persistenceIdentifier;
  self->_persistenceIdentifier = (NSString *)v5;
  v16 = v5;

  v3 = self->_persistenceIdentifier;
  return v3;
}

- (double)persistenceScale
{
  return self->_persistenceScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
}

@end
