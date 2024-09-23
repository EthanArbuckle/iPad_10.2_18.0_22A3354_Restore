@implementation PUPhotoEditEffectsSupport

+ (void)updateCompositionController:(id)a3 withDepthEnabled:(BOOL)a4 livePortraitBehaviorController:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  _QWORD v19[4];
  BOOL v20;
  _QWORD v21[5];
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v7 = a3;
  v18 = a5;
  objc_msgSend(v7, "adjustmentConstants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compositionKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PIDepthAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 || objc_msgSend(v9, "containsObject:", v10))
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke;
    v21[3] = &unk_1E58A3F38;
    v21[4] = &v23;
    v22 = a4;
    objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v10, v21);
    objc_msgSend(v8, "PIPortraitAdjustmentKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v12))
    {
      objc_msgSend(v11, "portraitAdjustmentController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "kind");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Light"));

      if (v15)
      {
        objc_msgSend(v11, "removeAdjustmentWithKey:", v12);
      }
      else
      {
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "apertureSliderHasOffPosition");

        if ((v17 & 1) == 0)
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke_2;
          v19[3] = &__block_descriptor_33_e32_v16__0__PIAdjustmentController_8l;
          v20 = a4;
          objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v12, v19);
        }
      }
    }
    if (v18 && *((_BYTE *)v24 + 24))
      objc_msgSend(v18, "applySideEffectsForAction:compositionController:", 0, v11);
    objc_msgSend(v7, "applyChangesFromCompositionController:", v11);

    _Block_object_dispose(&v23, 8);
  }

}

+ (void)updateCompositionController:(id)a3 withEffect:(id)a4 updateVersion:(BOOL)a5
{
  objc_msgSend(a1, "updateCompositionController:withEffect:intensity:updateVersion:", a3, a4, a5, 1.0);
}

+ (void)updateCompositionController:(id)a3 withEffect:(id)a4 intensity:(double)a5 updateVersion:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v15 = a3;
  v10 = a4;
  v11 = v10;
  if (v6)
    v12 = objc_msgSend(v10, "latestVersion");
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v11, "isPortrait"))
  {
    objc_msgSend(v11, "filterIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setPortraitEffectFilterName:withVersion:forCompositionController:portraitInfo:spillMatteAllowed:", v13, v12, v15, 0, 0);

    objc_msgSend(a1, "_setPortraitEffectEnabled:forCompositionController:", 1, v15);
  }
  else
  {
    objc_msgSend(v11, "CIFilterName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setEffectFilterName:withIntensity:withVersion:forCompositionController:", v14, v12, v15, a5);

  }
}

+ (void)updateCompositionController:(id)a3 withLightingIdentifier:(id)a4 portraitInfo:(id)a5 spillMatteAllowed:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v10 = (void *)MEMORY[0x1E0D719A0];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "effectWithIdentifier:", a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filterIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D723A8]))
  {

    v15 = 0;
    v14 = 0;
LABEL_6:
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  if (!v14)
  {
    v15 = 0;
    goto LABEL_6;
  }
  v16 = objc_msgSend(v17, "latestVersion");
  v15 = 1;
LABEL_7:
  objc_msgSend(a1, "_setPortraitEffectEnabled:forCompositionController:", v15, v13);
  objc_msgSend(a1, "_setPortraitEffectFilterName:withVersion:forCompositionController:portraitInfo:spillMatteAllowed:", v14, v16, v13, v12, v11);

}

+ (id)lightingEffectTypesByIdentifier
{
  pl_dispatch_once();
  return (id)lightingEffectTypesByIdentifier_typeMap;
}

+ (int64_t)lightingEffectTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(a1, "lightingEffectTypesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

+ (id)identifierForLightingType:(int64_t)a3 lightingVersion:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int64_t v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[PUPhotoEditEffectsSupport lightingEffectTypesByIdentifier](PUPhotoEditEffectsSupport, "lightingEffectTypesByIdentifier", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (+[PUPhotoEditEffectsSupport lightingEffectTypeForIdentifier:](PUPhotoEditEffectsSupport, "lightingEffectTypeForIdentifier:", v13) == a3)
        {
          objc_msgSend(MEMORY[0x1E0D719A0], "effectWithIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "lightingVersion");
          if (v15 <= a4 && v15 >= objc_msgSend(v10, "lightingVersion"))
          {
            v16 = v14;

            v10 = v16;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v10, "filterIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)updateCompositionController:(id)a3 withStyleCast:(id)a4 tone:(double)a5 color:(double)a6 intensity:(double)a7
{
  objc_msgSend(a1, "_setStyleWithCast:tone:color:intensity:forCompositionController:", a4, a3, a5, a6, a7);
}

+ (void)_setEffectFilterName:(id)a3 withIntensity:(double)a4 withVersion:(unint64_t)a5 forCompositionController:(id)a6
{
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  unint64_t v26;
  double v27;

  v19 = a3;
  v10 = a6;
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(a1, "_clearPortraitEffectsWithCompositionController:", v11);
  objc_msgSend(a1, "_clearStylesWithCompositionController:", v10);
  v12 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D723B0]);
  if (!v19 || v12)
  {
    objc_msgSend(a1, "_clearStandardEffectsWithCompositionController:", v11, v19);
  }
  else
  {
    v13 = objc_msgSend(MEMORY[0x1E0D71260], "is3DEffect:");
    objc_msgSend(v11, "adjustmentConstants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "PIEffectAdjustmentKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "PIEffect3DAdjustmentKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v14, "PIEffect3DAdjustmentKey");
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "PIEffectAdjustmentKey");
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
      v16 = (void *)v18;
    }
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __101__PUPhotoEditEffectsSupport__setEffectFilterName_withIntensity_withVersion_forCompositionController___block_invoke;
    v24 = &unk_1E58A3FA0;
    v25 = v19;
    v26 = a5;
    v27 = a4;
    objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v15, &v21);
    objc_msgSend(v11, "removeAdjustmentWithKey:", v16);

  }
  objc_msgSend(v10, "applyChangesFromCompositionController:", v11, v19, v21, v22, v23, v24);

}

+ (void)_setPortraitEffectFilterName:(id)a3 withVersion:(unint64_t)a4 forCompositionController:(id)a5 portraitInfo:(id)a6 spillMatteAllowed:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v17 = a3;
  v12 = a6;
  v13 = a7;
  v14 = a5;
  if (v17)
  {
    objc_msgSend(a1, "_clearStandardEffectsWithCompositionController:", v14);
    objc_msgSend(a1, "_clearStylesWithCompositionController:", v14);
    objc_msgSend(v14, "adjustmentConstants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "PIPortraitAdjustmentKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __126__PUPhotoEditEffectsSupport__setPortraitEffectFilterName_withVersion_forCompositionController_portraitInfo_spillMatteAllowed___block_invoke;
    v18[3] = &unk_1E58A3FC8;
    v19 = v17;
    v20 = v12;
    v21 = v13;
    v22 = a4;
    objc_msgSend(v14, "modifyAdjustmentWithKey:modificationBlock:", v16, v18);

    v14 = v19;
  }
  else
  {
    objc_msgSend(a1, "_clearPortraitEffectsWithCompositionController:", v14);
  }

}

+ (void)_setPortraitEffectEnabled:(BOOL)a3 forCompositionController:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  BOOL v11;

  v9 = a4;
  objc_msgSend(v9, "portraitAdjustmentController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 || v5)
  {
    objc_msgSend(v9, "adjustmentConstants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PIPortraitAdjustmentKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__PUPhotoEditEffectsSupport__setPortraitEffectEnabled_forCompositionController___block_invoke;
    v10[3] = &__block_descriptor_33_e32_v16__0__PIAdjustmentController_8l;
    v11 = a3;
    objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v8, v10);

  }
}

+ (void)_setStyleWithCast:(id)a3 tone:(double)a4 color:(double)a5 intensity:(double)a6 forCompositionController:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  double v20;

  v12 = a3;
  v13 = a7;
  objc_msgSend(a1, "_clearPortraitEffectsWithCompositionController:", v13);
  objc_msgSend(a1, "_clearStandardEffectsWithCompositionController:", v13);
  v14 = *MEMORY[0x1E0D71420];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__PUPhotoEditEffectsSupport__setStyleWithCast_tone_color_intensity_forCompositionController___block_invoke;
  v16[3] = &unk_1E58A3FF0;
  v17 = v12;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v15 = v12;
  objc_msgSend(v13, "modifyAdjustmentWithKey:modificationBlock:", v14, v16);

}

+ (void)_clearStandardEffectsWithCompositionController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "adjustmentConstants");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PIEffectAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAdjustmentWithKey:", v4);

  objc_msgSend(v6, "PIEffect3DAdjustmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAdjustmentWithKey:", v5);

}

+ (void)_clearPortraitEffectsWithCompositionController:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "adjustmentConstants");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PIPortraitAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAdjustmentWithKey:", v4);

}

+ (void)_clearStylesWithCompositionController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "semanticStyleAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "modifyAdjustmentWithKey:modificationBlock:", *MEMORY[0x1E0D71420], &__block_literal_global_34_59116);

}

uint64_t __67__PUPhotoEditEffectsSupport__clearStylesWithCompositionController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetToUnstyledOriginal");
}

void __93__PUPhotoEditEffectsSupport__setStyleWithCast_tone_color_intensity_forCompositionController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(v3, "setCast:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTone:", *(double *)(a1 + 40));
  objc_msgSend(v3, "setColor:", *(double *)(a1 + 48));
  objc_msgSend(v3, "setIntensity:", *(double *)(a1 + 56));

}

uint64_t __80__PUPhotoEditEffectsSupport__setPortraitEffectEnabled_forCompositionController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", *(unsigned __int8 *)(a1 + 32));
}

void __126__PUPhotoEditEffectsSupport__setPortraitEffectFilterName_withVersion_forCompositionController_portraitInfo_spillMatteAllowed___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setKind:", a1[4]);
  objc_msgSend(v3, "setPortraitInfo:", a1[5]);
  objc_msgSend(v3, "setSpillMatteAllowed:", a1[6]);
  if (a1[7] != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "setVersion:");

}

void __101__PUPhotoEditEffectsSupport__setEffectFilterName_withIntensity_withVersion_forCompositionController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D71260], "effectNameForFilterName:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_msgSend(v5, "setKind:", v4);
  if (*(_QWORD *)(a1 + 40) != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "setVersion:");
  objc_msgSend(v5, "setIntensity:", *(double *)(a1 + 48));
  objc_msgSend(v5, "setEnabled:", 1);

}

void __60__PUPhotoEditEffectsSupport_lightingEffectTypesByIdentifier__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[10];
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D723B8];
  v7[0] = *MEMORY[0x1E0D723D8];
  v7[1] = v0;
  v8[0] = &unk_1E59BBBF8;
  v8[1] = &unk_1E59BBC10;
  v1 = *MEMORY[0x1E0D723C8];
  v7[2] = *MEMORY[0x1E0D723C0];
  v7[3] = v1;
  v8[2] = &unk_1E59BBC10;
  v8[3] = &unk_1E59BBC28;
  v2 = *MEMORY[0x1E0D72398];
  v7[4] = *MEMORY[0x1E0D723D0];
  v7[5] = v2;
  v8[4] = &unk_1E59BBC28;
  v8[5] = &unk_1E59BBC40;
  v3 = *MEMORY[0x1E0D723E0];
  v7[6] = *MEMORY[0x1E0D723A0];
  v7[7] = v3;
  v8[6] = &unk_1E59BBC40;
  v8[7] = &unk_1E59BBC58;
  v4 = *MEMORY[0x1E0D723A8];
  v7[8] = *MEMORY[0x1E0D723E8];
  v7[9] = v4;
  v8[8] = &unk_1E59BBC58;
  v8[9] = &unk_1E59BBC70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)lightingEffectTypesByIdentifier_typeMap;
  lightingEffectTypesByIdentifier_typeMap = v5;

}

void __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  LOBYTE(v4) = *(_BYTE *)(a1 + 40);
  v5 = v3;
  if ((_BYTE)v4)
    v4 = objc_msgSend(v3, "enabled") ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  objc_msgSend(v5, "setEnabled:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", *(unsigned __int8 *)(a1 + 32));
}

@end
