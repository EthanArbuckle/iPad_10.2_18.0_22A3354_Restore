@implementation PXStoryRecipeClipMotionStyleProvider

- (PXStoryRecipeClipMotionStyleProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeClipMotionStyleProvider.m"), 31, CFSTR("%s is not available as initializer"), "-[PXStoryRecipeClipMotionStyleProvider init]");

  abort();
}

- (PXStoryRecipeClipMotionStyleProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6 storyConfiguration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXStoryRecipeClipMotionStyleProvider *v17;
  PXStoryRecipeClipMotionStyleProvider *v18;
  void *v19;
  uint64_t v20;
  PFStoryAutoEditFrequencyTable *frequencyTable;
  void *v22;
  void *v23;
  uint64_t v24;
  PFStoryAutoEditFrequencyTable *diptychFrequencyTable;
  void *v26;
  void *v27;
  uint64_t v28;
  PFStoryAutoEditFrequencyTable *triptychFrequencyTable;
  void *v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXStoryRecipeClipMotionStyleProvider;
  v17 = -[PXStoryRecipeClipMotionStyleProvider init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_configuration, a3);
    objc_storeStrong((id *)&v18->_storyConfiguration, a7);
    objc_storeStrong((id *)&v18->_randomNumberGenerator, a6);
    -[PFStoryAutoEditConfiguration motionStyleTable](v18->_configuration, "motionStyleTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "motionStylesForColorGrade:songPace:", v14, a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v31, v15, &unk_1E53EAEF0);
    frequencyTable = v18->_frequencyTable;
    v18->_frequencyTable = (PFStoryAutoEditFrequencyTable *)v20;

    -[PFStoryAutoEditConfiguration diptychMotionStyleTable](v18->_configuration, "diptychMotionStyleTable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "motionStylesForColorGrade:songPace:", v14, a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v23, v15, &unk_1E53EAEF0);
    diptychFrequencyTable = v18->_diptychFrequencyTable;
    v18->_diptychFrequencyTable = (PFStoryAutoEditFrequencyTable *)v24;

    -[PFStoryAutoEditConfiguration triptychMotionStyleTable](v18->_configuration, "triptychMotionStyleTable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "motionStylesForColorGrade:songPace:", v14, a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v27, v15, &unk_1E53EAEF0);
    triptychFrequencyTable = v18->_triptychFrequencyTable;
    v18->_triptychFrequencyTable = (PFStoryAutoEditFrequencyTable *)v28;

  }
  return v18;
}

- (int64_t)_nextMotionStyleForDisplayAssetCount:(int64_t)a3 excluding:(id)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeClipMotionStyleProvider.m"), 71, CFSTR("Unsupported display asset count: %ld"), a3);

    abort();
  }
  v8 = v7;
  v9 = *((id *)&self->super.isa + a3);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__PXStoryRecipeClipMotionStyleProvider__nextMotionStyleForDisplayAssetCount_excluding___block_invoke;
  v15[3] = &unk_1E513F6B8;
  v16 = v8;
  v10 = v8;
  objc_msgSend(v9, "nextValuePassingTest:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  return v12;
}

- ($DD059F4CECBB3D9089CC1CCE969C159D)nextMotionInfoForDisplayAssetCount:(SEL)a3 displayAssets:(int64_t)a4 excluding:(id)a5
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void (**v15)(void *, uint64_t, uint64_t);
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  $DD059F4CECBB3D9089CC1CCE969C159D *result;
  void *v25;
  char v26;
  __int128 v27;
  unint64_t var1;
  __int128 v29;
  unint64_t v30;
  _QWORD aBlock[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v11 = a5;
  v12 = a6;
  retstr->var1.var0.var0 = 0;
  retstr->var1.var0.var1 = 0;
  retstr->var0 = 0;
  -[PXStoryRecipeClipMotionStyleProvider storyConfiguration](self, "storyConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "disabledClipMotionStyles");
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9955;
  v36 = __Block_byref_object_dispose__9956;
  v37 = (id)objc_msgSend(v12, "mutableCopy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForDisplayAssetCount_displayAssets_excluding___block_invoke;
  aBlock[3] = &unk_1E5117D88;
  aBlock[4] = &v32;
  aBlock[5] = v14;
  v15 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v15[2](v15, 1, 1);
  v15[2](v15, 2, 2);
  v15[2](v15, 4, 3);
  v16 = -[PXStoryRecipeClipMotionStyleProvider _nextMotionStyleForDisplayAssetCount:excluding:](self, "_nextMotionStyleForDisplayAssetCount:excluding:", a4, v33[5]);
  retstr->var0 = v16;
  if (v16 == 3)
  {
    retstr->var1.var0.var0 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2)+ 1;
    goto LABEL_18;
  }
  if (v16 != 2)
  {
    if (v16 != 1)
      goto LABEL_18;
    if (a4 == 2)
    {
      if ((unint64_t)-[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 3) >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStoryRecipeClipMotionStyleProvider.m"), 133, CFSTR("Impossible case"));

        abort();
      }
    }
    else if (a4 != 3)
    {
      v17 = 1;
LABEL_17:
      retstr->var1.var0.var0 = v17;
      retstr->var1.var0.var1 = 2;
      goto LABEL_18;
    }
    v22 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2);
    v17 = 3;
    if (v22)
      v17 = 4;
    goto LABEL_17;
  }
  v18 = objc_msgSend(v13, "forcedKenBurnsScaleDirection");
  if (!v18)
  {
    v19 = objc_msgSend(v13, "keyAssetKenBurnsScaleDirection");
    if (a4 != 1)
      goto LABEL_11;
    v18 = v19;
    if (!v19
      || (objc_msgSend(v11, "firstObject"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "keyAsset"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v20, "isEqual:", v21),
          v21,
          v20,
          (v26 & 1) == 0))
    {
LABEL_11:
      v18 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2)+ 1;
    }
  }
  retstr->var1.var0.var0 = v18;
LABEL_18:
  if (a4 == 1)
  {
    objc_msgSend(v11, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "aspectRatio");
    if (PXAspectRatioIsPortrait())
    {
      v27 = *(_OWORD *)&retstr->var0;
      var1 = retstr->var1.var0.var1;
      -[PXStoryRecipeClipMotionStyleProvider updatedMotionForPortraitAspectAsset:motionInfo:](self, "updatedMotionForPortraitAspectAsset:motionInfo:", v23, &v27);
      *(_OWORD *)&retstr->var0 = v29;
      retstr->var1.var0.var1 = v30;
    }

  }
  _Block_object_dispose(&v32, 8);

  return result;
}

- ($DD059F4CECBB3D9089CC1CCE969C159D)updatedMotionForPortraitAspectAsset:(SEL)a3 motionInfo:(id)a4
{
  void *v8;
  char IsPortrait;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t var0;
  char v17;
  $DD059F4CECBB3D9089CC1CCE969C159D *result;
  id v19;

  v19 = a4;
  -[PXStoryRecipeClipMotionStyleProvider storyConfiguration](self, "storyConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset"))
  {
    objc_msgSend(v19, "aspectRatio");
    IsPortrait = PXAspectRatioIsPortrait();

    if ((IsPortrait & 1) != 0)
    {
      -[PXStoryRecipeClipMotionStyleProvider storyConfiguration](self, "storyConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v19, "isEqual:", v11);

      -[PXStoryRecipeClipMotionStyleProvider storyConfiguration](self, "storyConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "keyAssetKenBurnsPanDirection");

      v15 = v14 - 3;
      if (a5->var0 == 1)
      {
        var0 = a5->var1.var0.var0;
        if (v15 < 2)
          v17 = v12;
        else
          v17 = 0;
        if ((v17 & 1) != 0 && var0 != v14)
          goto LABEL_18;
        if (var0 - 3 < 2)
          goto LABEL_19;
LABEL_16:
        if ((v17 & 1) == 0)
          v14 = 3;
LABEL_18:
        a5->var0 = 1;
        a5->var1.var0.var0 = v14;
        a5->var1.var0.var1 = 0;
        goto LABEL_19;
      }
      if (+[PXStoryRecipeClipUtilities assetIsPortraitAspectWithLargeVerticalFaceArea:](PXStoryRecipeClipUtilities, "assetIsPortraitAspectWithLargeVerticalFaceArea:", v19))
      {
        if (v15 < 2)
          v17 = v12;
        else
          v17 = 0;
        goto LABEL_16;
      }
    }
  }
  else
  {

  }
LABEL_19:
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  retstr->var1.var0.var1 = a5->var1.var0.var1;

  return result;
}

- ($DD059F4CECBB3D9089CC1CCE969C159D)nextMotionInfoForDisplayAssetCount:(SEL)a3 displayAssets:(int64_t)a4
{
  return -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:excluding:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:excluding:", a4, a5, 0);
}

- ($DD059F4CECBB3D9089CC1CCE969C159D)nextMotionInfoForModuleExcludingMomentMotion:(SEL)a3 previousModuleMotion:(int64_t)a4 displayAssets:(int64_t)a5
{
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, int64_t, int64_t);
  uint64_t (**v14)(_QWORD);
  uint64_t *v15;
  $DD059F4CECBB3D9089CC1CCE969C159D *result;
  _QWORD v17[5];
  _QWORD aBlock[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v10 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3810000000;
  v24 = &unk_1A7E74EE7;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke;
  aBlock[3] = &unk_1E5117DB0;
  v20 = &v21;
  aBlock[4] = self;
  v12 = v10;
  v19 = v12;
  v13 = (void (**)(void *, int64_t, int64_t))_Block_copy(aBlock);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_3;
  v17[3] = &unk_1E5117DD8;
  v17[4] = &v21;
  v14 = (uint64_t (**)(_QWORD))_Block_copy(v17);
  v13[2](v13, a4, a5);
  if ((v14[2](v14) & 1) == 0)
    v13[2](v13, a4, 0);
  if ((v14[2](v14) & 1) == 0)
    v13[2](v13, 0, 0);
  v15 = v22;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v22 + 2);
  retstr->var1.var0.var1 = v15[6];

  _Block_object_dispose(&v21, 8);
  return result;
}

- (void)provideMotionStylesForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _QWORD *v10;
  void *v11;
  BOOL v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  void *v21;
  void *v22;
  void (*v23)(_QWORD *, _BYTE *, NSUInteger);
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void (*v42)(_QWORD *, __int128 *, NSUInteger);
  void *v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  SEL v49;
  NSUInteger v50;
  NSUInteger v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[24];
  __int128 v64;
  __int128 v65;
  _OWORD v66[2];

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v11, "autoEditRotateMotionMax");

  v66[0] = 0uLL;
  v65 = 0uLL;
  v50 = length;
  v51 = location;
  v64 = 0uLL;
  v12 = __CFADD__(length - 1, location);
  v13 = length - 1 + location;
  if (!v12)
  {
    v49 = a2;
    v14 = 0;
    v52 = 0;
    v56 = 0;
    v15 = v51;
    while (1)
    {
      objc_msgSend(v9, "clipAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayAssets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 == 3)
      {
        if ((unint64_t)(v14 - 1) >= 3)
        {
          objc_msgSend(v16, "displayAssets");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:", 3, v21);
          v19 = *(_QWORD *)v63;
          v64 = *(_OWORD *)&v63[8];
          v20 = &v64;
          v14 = *(_QWORD *)v63;
LABEL_19:

          goto LABEL_20;
        }
        v20 = &v64;
        v19 = v14;
      }
      else if (v18 == 2)
      {
        v19 = v52;
        if ((unint64_t)(v52 - 1) >= 3)
        {
          objc_msgSend(v16, "displayAssets");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:", 2, v21);
          v19 = *(_QWORD *)v63;
          v65 = *(_OWORD *)&v63[8];
          v20 = &v65;
          v52 = *(_QWORD *)v63;
          goto LABEL_19;
        }
        v20 = &v65;
      }
      else
      {
        v19 = v56;
        if (v18 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "displayAssets");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v49, self, CFSTR("PXStoryRecipeClipMotionStyleProvider.m"), 295, CFSTR("Invalid number of display assets (%ld) in clip"), objc_msgSend(v48, "count"));

          abort();
        }
        if ((unint64_t)(v56 - 1) >= 3)
        {
          if (+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", v51, v50, v9, v54))
          {
            objc_msgSend(v16, "displayAssets");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:", 1, v21);
            v19 = *(_QWORD *)v63;
            v66[0] = *(_OWORD *)&v63[8];
          }
          else
          {
            objc_msgSend(v16, "displayAssets");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E53EAF08);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:excluding:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:excluding:", 1, v21, v22);
            v19 = *(_QWORD *)v63;
            v66[0] = *(_OWORD *)&v63[8];

          }
          v20 = v66;
          v56 = v19;
          goto LABEL_19;
        }
        v20 = v66;
      }
LABEL_20:
      v58 = *v20;
      v23 = (void (*)(_QWORD *, _BYTE *, NSUInteger))v10[2];
      *(_QWORD *)v63 = v19;
      *(_OWORD *)&v63[8] = v58;
      v23(v10, v63, v15);

      if (++v15 > v13)
      {
        v24 = 0;
        v25 = v51;
        while (1)
        {
          v26 = v25 + 1;
          objc_msgSend(v9, "clipAtIndex:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "displayAssets");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (v29 == 1)
          {
            objc_msgSend(v27, "moduleInfo");
            if ((v30 & 1) != 0)
              break;
          }
LABEL_43:

          v25 = v26;
          if (v26 > v13)
            goto LABEL_3;
        }
        v53 = v24;
        objc_msgSend(v9, "clipAtIndex:", v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "moduleInfo");
        v26 = v25;
        v33 = v56;
        while (1)
        {
          v34 = objc_msgSend(v31, "moduleInfo");
          if (v26 > v13 || v34 != v32)
            break;
          if (++v26 <= v13)
          {
            objc_msgSend(v9, "clipAtIndex:", v26);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = 0;
          }

          objc_msgSend(v35, "moduleInfo");
          v31 = v35;
          if ((v36 & 1) != 0)
            goto LABEL_33;
        }
        v35 = v31;
LABEL_33:
        if ((unint64_t)(v56 - 1) >= 3)
        {
          if (+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", v25, v26 - v25, v9, v54))
          {
            objc_msgSend(v27, "displayAssets");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:", 1, v37);
            v33 = *(_QWORD *)v63;
            v66[0] = *(_OWORD *)&v63[8];
          }
          else
          {
            objc_msgSend(v27, "displayAssets");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E53EAF08);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForDisplayAssetCount:displayAssets:excluding:](self, "nextMotionInfoForDisplayAssetCount:displayAssets:excluding:", 1, v37, v38);
            v57 = *(_QWORD *)v63;
            v66[0] = *(_OWORD *)&v63[8];

            v33 = v57;
          }

        }
        v56 = v33;
        if (+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", v25, v26 - v25, v9, v54))
        {
          v39 = v33;
          v40 = v53;
        }
        else
        {
          v39 = v33;
          v40 = 3;
          if ((unint64_t)(v53 - 1) <= 2 && v25 != v51)
          {
            if (v53 == 3)
            {
              v39 = v56;
            }
            else
            {
              v39 = v56;
              if (v56 != 3)
              {
                objc_msgSend(v9, "clipAtIndex:", v25 - 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "displayAssets");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "count");

                if (v45 <= 1)
                {
                  v39 = v56;
                  if (v43)
                  {
                    objc_msgSend(v43, "motionInfo");
                    v46 = v60;
                  }
                  else
                  {
                    v46 = 0;
                    v60 = 0;
                    v61 = 0;
                    v62 = 0;
                  }
                  if (v46 == v56)
                  {
                    v39 = 3;
                    v40 = v53;
                  }
                  else
                  {
                    v40 = 3;
                  }
                }
                else
                {
                  v39 = v56;
                  v40 = 3;
                }

                goto LABEL_40;
              }
            }
            v40 = v53;
          }
        }
LABEL_40:
        memset(v63, 0, sizeof(v63));
        objc_msgSend(v27, "displayAssets");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryRecipeClipMotionStyleProvider nextMotionInfoForModuleExcludingMomentMotion:previousModuleMotion:displayAssets:](self, "nextMotionInfoForModuleExcludingMomentMotion:previousModuleMotion:displayAssets:", v39, v40, v41);

        if (v26 > v25)
        {
          do
          {
            v42 = (void (*)(_QWORD *, __int128 *, NSUInteger))v10[2];
            v58 = *(_OWORD *)v63;
            v59 = *(_QWORD *)&v63[16];
            v42(v10, &v58, v25++);
          }
          while (v26 != v25);
        }
        v24 = *(_QWORD *)v63;

        goto LABEL_43;
      }
    }
  }
LABEL_3:

}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_triptychFrequencyTable, 0);
  objc_storeStrong((id *)&self->_diptychFrequencyTable, 0);
  objc_storeStrong((id *)&self->_frequencyTable, 0);
}

void __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  void (**v8)(void *, _QWORD);
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD aBlock[4];
  id v13;

  v6 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_2;
  aBlock[3] = &unk_1E51438B0;
  v13 = v6;
  v7 = v6;
  v8 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v8[2](v8, a2);
  v8[2](v8, a3);
  objc_msgSend(*(id *)(a1 + 32), "nextMotionInfoForDisplayAssetCount:displayAssets:excluding:", 1, *(_QWORD *)(a1 + 40), v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_OWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 48) = v11;

}

BOOL __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_3(uint64_t a1)
{
  return (unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) - 1) < 3;
}

void __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void __99__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForDisplayAssetCount_displayAssets_excluding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if ((a2 & ~*(_QWORD *)(a1 + 40)) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
}

uint64_t __87__PXStoryRecipeClipMotionStyleProvider__nextMotionStyleForDisplayAssetCount_excluding___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

@end
