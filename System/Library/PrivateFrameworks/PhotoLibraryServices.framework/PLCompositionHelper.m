@implementation PLCompositionHelper

+ (id)validatedCompositionCopyFor:(id)a3
{
  return (id)objc_msgSend(a1, "validatedCompositionCopyFor:mediaType:", a3, 0);
}

+ (id)validatedCompositionCopyFor:(id)a3 mediaType:(int64_t)a4
{
  id v5;
  id PIPhotoEditHelperClass;
  void *v7;
  void *v8;

  v5 = a3;
  PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  objc_msgSend(v5, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(PIPhotoEditHelperClass, "validatedCompositionCopyForComposition:mediaType:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)photosSchema
{
  if (photosSchema_onceToken != -1)
    dispatch_once(&photosSchema_onceToken, &__block_literal_global_21221);
  return (id)photosSchema_schema;
}

+ (PIAdjustmentConstants)adjustmentConstants
{
  if (adjustmentConstants_onceToken != -1)
    dispatch_once(&adjustmentConstants_onceToken, &__block_literal_global_2);
  return (PIAdjustmentConstants *)(id)adjustmentConstants_constants;
}

+ (BOOL)isIdentityCompositionController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "availableKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isIdentityCompositionController:forKeys:", v4, v5);

  return (char)a1;
}

+ (BOOL)isIdentityCompositionController:(id)a3 forKeys:(id)a4
{
  id v6;
  id v7;
  id PIPhotoEditHelperClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t *v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v6 = a3;
  v7 = a4;
  PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  v9 = (void *)objc_msgSend(getPIPhotoEditHelperClass(), "newComposition");
  v10 = (void *)objc_msgSend(PIPhotoEditHelperClass, "newCompositionControllerWithComposition:", v9);

  objc_msgSend(a1, "adjustmentConstants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PIOrientationAdjustmentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "containsObject:", v12);

  if (v13)
  {
    objc_msgSend(v6, "orientationAdjustmentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "orientation");
      if (v16 != objc_msgSend(v6, "imageOrientation"))
      {

        v36 = 0;
        goto LABEL_13;
      }
    }

  }
  v17 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(a1, "adjustmentConstants");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "PIOrientationAdjustmentKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v19);

  objc_msgSend(a1, "adjustmentConstants");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "PISlomoAdjustmentKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v21);

  objc_msgSend(v6, "semanticStyleAdjustmentController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v22, "enabled");

  if ((_DWORD)v21)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v51 = 0;
    v52 = &v51;
    v53 = 0x2050000000;
    v24 = (void *)getPISemanticStyleAutoCalculatorClass_softClass;
    v54 = getPISemanticStyleAutoCalculatorClass_softClass;
    v25 = MEMORY[0x1E0C809B0];
    if (!getPISemanticStyleAutoCalculatorClass_softClass)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __getPISemanticStyleAutoCalculatorClass_block_invoke;
      v50[3] = &unk_1E3677580;
      v50[4] = &v51;
      __getPISemanticStyleAutoCalculatorClass_block_invoke((uint64_t)v50);
      v24 = (void *)v52[3];
    }
    v26 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v51, 8);
    v27 = [v26 alloc];
    objc_msgSend(v6, "composition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithComposition:", v28);

    v38 = v25;
    v39 = 3221225472;
    v40 = __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke;
    v41 = &unk_1E3666138;
    v45 = a1;
    v30 = v6;
    v42 = v30;
    v44 = &v46;
    v31 = v23;
    v43 = v31;
    objc_msgSend(v29, "submit:", &v38);
    dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v47 + 24))
    {
      v32 = objc_alloc((Class)getPICompositionControllerClass());
      objc_msgSend(v30, "composition", v38, v39, v40, v41, v42);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v32, "initWithComposition:", v33);

      getPISemanticStyleAdjustmentKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAdjustmentWithKey:", v34);

    }
    else
    {
      v6 = v30;
    }

    _Block_object_dispose(&v46, 8);
  }
  objc_msgSend(v10, "composition", v38, v39, v40, v41);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v6, "isEqual:forKeys:visualChangesOnly:", v35, v17, 1);

LABEL_13:
  return v36;
}

+ (id)newIdentityCompositionController
{
  id PIPhotoEditHelperClass;
  void *v3;
  void *v4;

  PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  v3 = (void *)objc_msgSend(getPIPhotoEditHelperClass(), "newComposition");
  v4 = (void *)objc_msgSend(PIPhotoEditHelperClass, "newCompositionControllerWithComposition:", v3);

  return v4;
}

+ (id)defaultValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getPICompositionControllerClass(), "settingForAdjustmentKey:settingKey:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getNUBoolSettingClass();
  getNUEnumSettingClass();
  getNUNumberSettingClass();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "defaultValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)identityValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getPICompositionControllerClass(), "settingForAdjustmentKey:settingKey:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getNUBoolSettingClass();
  getNUEnumSettingClass();
  getNUNumberSettingClass();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "identityValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)minMaxValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  PLMinMaxSettings *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getPICompositionControllerClass(), "settingForAdjustmentKey:settingKey:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getNUNumberSettingClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = objc_alloc_init(PLMinMaxSettings);
    objc_msgSend(v8, "ui_minimumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PLMinMaxSettings setMin:](v9, "setMin:", v10);
    }
    else
    {
      objc_msgSend(v8, "minimumValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMinMaxSettings setMin:](v9, "setMin:", v11);

    }
    objc_msgSend(v8, "ui_maximumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PLMinMaxSettings setMax:](v9, "setMax:", v12);
    }
    else
    {
      objc_msgSend(v8, "maximumValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMinMaxSettings setMax:](v9, "setMax:", v13);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)minValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "minMaxValueForAdjustmentKey:settingKey:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "min");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)maxValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "minMaxValueForAdjustmentKey:settingKey:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "max");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)valueForType:(int64_t)a3 adjustmentKey:(id)a4 settingKey:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  switch(a3)
  {
    case 0:
      objc_msgSend((id)objc_opt_class(), "defaultValueForAdjustmentKey:settingKey:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend((id)objc_opt_class(), "identityValueForAdjustmentKey:settingKey:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend((id)objc_opt_class(), "minValueForAdjustmentKey:settingKey:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend((id)objc_opt_class(), "maxValueForAdjustmentKey:settingKey:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v9;
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

+ (id)valueForCompositionController:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  objc_msgSend(a3, "adjustmentControllerForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)compositionControllerHasAnyAutoEnhancement:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "smartToneAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAuto") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "smartColorAdjustmentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isAuto") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "rawNoiseReductionAdjustmentController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isAuto") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v3, "smartBWAdjustmentController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isAuto") & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(v3, "sharpenAdjustmentController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isAuto") & 1) != 0)
          {
            v5 = 1;
          }
          else
          {
            objc_msgSend(v3, "whiteBalanceAdjustmentController");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v10, "isAuto") & 1) != 0)
            {
              v5 = 1;
            }
            else
            {
              objc_msgSend(v3, "noiseReductionAdjustmentController");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v11, "isAuto") & 1) != 0)
              {
                v5 = 1;
              }
              else
              {
                objc_msgSend(v3, "definitionAdjustmentController");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = objc_msgSend(v12, "isAuto");

              }
            }

          }
        }

      }
    }

  }
  return v5;
}

+ (id)activeEffectAdjustmentForCompositionController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "effect3DAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "effectAdjustmentController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (BOOL)compositionController:(id)a3 isCropConstraintEqualToCompositionController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentConstants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PICropAdjustmentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__PLCompositionHelper_compositionController_isCropConstraintEqualToCompositionController___block_invoke;
  v12[3] = &__block_descriptor_40_e69_B32__0__NSString_8__PIAdjustmentController_16__NUGenericAdjustment_24l;
  v12[4] = a1;
  LOBYTE(a1) = objc_msgSend(v6, "isEqual:forKeys:comparisonBlock:", v7, v10, v12);

  return (char)a1;
}

+ (BOOL)compositionController:(id)a3 isEffectFilterEqualToCompositionController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "effectAdjustmentController");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectAdjustmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 | v8)
  {
    objc_msgSend((id)v7, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v5, "effect3DAdjustmentController");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effect3DAdjustmentController");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 | v13)
  {
    objc_msgSend((id)v12, "kind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "kind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

  }
  else
  {
    v16 = 1;
  }

  return v11 & v16;
}

+ (BOOL)compositionController:(id)a3 isEffectFilterIntensityEqualToCompositionController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "effectAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effect3DAdjustmentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1.0;
  if (objc_msgSend(v7, "enabled"))
  {
    objc_msgSend(v7, "intensity");
    v9 = v10;
  }
  if (objc_msgSend(v8, "enabled"))
  {
    objc_msgSend(v8, "intensity");
    v9 = v11;
  }
  objc_msgSend(v5, "effectAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effect3DAdjustmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 1.0;
  if (objc_msgSend(v12, "enabled"))
  {
    objc_msgSend(v12, "intensity");
    v14 = v15;
  }
  if (objc_msgSend(v13, "enabled"))
  {
    objc_msgSend(v13, "intensity");
    v14 = v16;
  }

  return v9 == v14;
}

+ (BOOL)compositionController:(id)a3 isPortraitEqualToCompositionController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;

  v5 = a4;
  objc_msgSend(a3, "portraitAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "portraitAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v9))
  {
    v10 = objc_msgSend(v6, "enabled");
    v11 = v10 ^ objc_msgSend(v7, "enabled") ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (BOOL)compositionController:(id)a3 isPortraitIntensityEqualToCompositionController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  objc_msgSend(a3, "portraitAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "portraitAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.5;
  v9 = 0.5;
  if (v6)
  {
    objc_msgSend(v6, "strength");
    v9 = v10;
  }
  if (v7)
  {
    objc_msgSend(v7, "strength");
    v8 = v11;
  }

  return v9 == v8;
}

+ (BOOL)compositionController:(id)a3 isDepthIntensityEqualToCompositionController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v5 = a4;
  objc_msgSend(a3, "depthAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "depthAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aperture");
  v9 = v8;
  objc_msgSend(v7, "aperture");
  LOBYTE(v5) = v9 == v10;

  return (char)v5;
}

+ (BOOL)compositionController:(id)a3 isGeometryEqualToCompositionController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentConstants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PICropAdjustmentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "isEqual:forKeys:visualChangesOnly:", v7, v10, 1);

  return (char)a4;
}

+ (CGSize)synchronousInputSizeForCompositionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGSize result;

  +[PLCompositionHelper validatedCompositionCopyFor:](PLCompositionHelper, "validatedCompositionCopyFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPIPhotoEditHelperClass(), "geometryRequestWithComposition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPIPhotoEditHelperClass(), "pipelineFiltersForOriginalGeometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPipelineFilters:", v5);

  v16 = 0;
  objc_msgSend(v4, "submitSynchronous:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "size");
    v11 = v10;

    v12 = (double)v9;
    v13 = (double)v11;
  }
  else
  {
    _PFAssertContinueHandler();
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (void)compositionController:(id)a3 setEffectFilterName:(id)a4 version:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  int64_t v19;

  v16 = a3;
  v7 = a4;
  objc_msgSend(v16, "adjustmentConstants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v16, "copy");
  v10 = objc_msgSend(getPIPhotoEditHelperClass(), "is3DEffect:", v7);
  objc_msgSend(v8, "PIEffectAdjustmentKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PIEffect3DAdjustmentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "PIEffect3DAdjustmentKey");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "PIEffectAdjustmentKey");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
    v12 = (void *)v14;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__PLCompositionHelper_compositionController_setEffectFilterName_version___block_invoke;
  v17[3] = &unk_1E3666180;
  v18 = v7;
  v19 = a5;
  v15 = v7;
  objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v11, v17);
  objc_msgSend(v9, "removeAdjustmentWithKey:", v12);
  objc_msgSend(v16, "applyChangesFromCompositionController:", v9);

}

+ (void)compositionController:(id)a3 setInputOrientation:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v10 = a3;
  objc_msgSend(v10, "setImageOrientation:", a4);
  v6 = objc_msgSend(v10, "userOrientation");
  objc_msgSend(v10, "orientationAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 1 || v7)
  {
    objc_msgSend(a1, "adjustmentConstants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "PIOrientationAdjustmentKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PLCompositionHelper_compositionController_setInputOrientation___block_invoke;
    v11[3] = &unk_1E36661A8;
    v12 = v10;
    v13 = v6;
    objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v9, v11);

  }
}

+ (void)compositionController:(id)a3 applyAssetVariation:(unsigned __int16)a4 withRecipe:(id)a5
{
  unsigned int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
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
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "copy");
  if (v6)
  {
    objc_msgSend(a1, "adjustmentConstants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PIAutoLoopAdjustmentKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke;
    v34[3] = &unk_1E36661D0;
    v35 = v9;
    v36 = v6;
    objc_msgSend(v8, "modifyAdjustmentWithKey:modificationBlock:", v12, v34);

    if (v6 <= 2)
    {
      objc_msgSend(a1, "adjustmentConstants");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "PIMuteAdjustmentKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAdjustmentWithKey:", v14);

    }
    v33 = 0;
    objc_msgSend(getPIPhotoEditHelperClass(), "updateCropAdjustmentControllerFor:beforeCompositionController:error:", v8, v10, &v33);
    v15 = v33;
    if (v15)
    {
      PLPhotoEditGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to update crop while applying asset variation: %@", buf, 0xCu);
      }

    }
    objc_msgSend(a1, "adjustmentConstants");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "PITrimAdjustmentKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAdjustmentWithKey:", v18);

    objc_msgSend(a1, "adjustmentConstants");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "PILivePhotoKeyFrameAdjustmentKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAdjustmentWithKey:", v20);

    objc_msgSend(v8, "depthAdjustmentController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(a1, "adjustmentConstants");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "PIDepthAdjustmentKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modifyAdjustmentWithKey:modificationBlock:", v23, &__block_literal_global_20);

    }
    objc_msgSend(v8, "portraitAdjustmentController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(a1, "adjustmentConstants");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "PIPortraitAdjustmentKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modifyAdjustmentWithKey:modificationBlock:", v26, &__block_literal_global_22);

    }
    v27 = v35;
  }
  else
  {
    objc_msgSend(a1, "adjustmentConstants");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "PIAutoLoopAdjustmentKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAdjustmentWithKey:", v31);

    v37 = 0;
    objc_msgSend(getPIPhotoEditHelperClass(), "updateCropAdjustmentControllerFor:beforeCompositionController:error:", v8, v10, &v37);
    v32 = v37;
    if (!v32)
      goto LABEL_14;
    v15 = v32;
    PLPhotoEditGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v15;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to update crop while applying asset variation: %@", buf, 0xCu);
    }
  }

LABEL_14:
  objc_msgSend(a1, "adjustmentConstants");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "PIRetouchAdjustmentKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAdjustmentWithKey:", v29);

}

+ (BOOL)isKeyOnlyAdjustmentForCompositionController:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "adjustmentControllerForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "adjustmentKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v6);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)wantsSemanticEnhanceForCameraMetadata:(id)a3
{
  return a3 && (unint64_t)(objc_msgSend(a3, "semanticEnhanceScene") - 1) < 0xFFFFFFFFFFFFFFFELL;
}

+ (void)compositionController:(id)a3 updateSemanticEnhanceFromCameraMetadata:(id)a4 exportProperties:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a1, "wantsSemanticEnhanceForCameraMetadata:", v8))
  {
    objc_msgSend(v12, "adjustmentConstants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "PISemanticEnhanceAdjustmentKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__PLCompositionHelper_compositionController_updateSemanticEnhanceFromCameraMetadata_exportProperties___block_invoke;
    v13[3] = &unk_1E3666238;
    v14 = v9;
    v15 = v8;
    objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v11, v13);

  }
}

void __102__PLCompositionHelper_compositionController_updateSemanticEnhanceFromCameraMetadata_exportProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "baseEXIFOrientation");
  objc_msgSend(v4, "setEnabled:", 1);
  v6 = objc_msgSend(*(id *)(a1 + 40), "semanticEnhanceScene");
  objc_msgSend(*(id *)(a1 + 40), "semanticEnhanceSceneConfidence");
  objc_msgSend(v4, "setScene:confidence:", v6);
  objc_msgSend(*(id *)(a1 + 40), "foodAndDrinkObservations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoundingBoxesFromObservations:orientation:", v7, v5);

  objc_msgSend(*(id *)(a1 + 40), "faceObservations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceBoundingBoxesFromObservations:orientation:", v8, v5);

}

void __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setRecipe:", v3);
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(getPIPhotoEditHelperClass(), "stringForAutoLoopFlavor:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlavor:", v5);

}

uint64_t __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 0);
}

uint64_t __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 0);
}

void __65__PLCompositionHelper_compositionController_setInputOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "imageOrientation");
  v5 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getNUOrientationConcatSymbolLoc_ptr;
  v13 = getNUOrientationConcatSymbolLoc_ptr;
  if (!getNUOrientationConcatSymbolLoc_ptr)
  {
    v7 = NeutrinoCoreLibrary();
    v6 = dlsym(v7, "NUOrientationConcat");
    v11[3] = (uint64_t)v6;
    getNUOrientationConcatSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (v6)
  {
    objc_msgSend(v3, "setOrientation:", ((uint64_t (*)(uint64_t, uint64_t))v6)(v4, v5));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUOrientation SOFT_LINKED_NUOrientationConcat(NUOrientation, NUOrientation)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PLCompositionHelper.m"), 60, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void __73__PLCompositionHelper_compositionController_setEffectFilterName_version___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(getPIPhotoEditHelperClass(), "effectNameForFilterName:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKind:", v4);
  objc_msgSend(v3, "setVersion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setEnabled:", 1);

}

uint64_t __90__PLCompositionHelper_compositionController_isCropConstraintEqualToCompositionController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "adjustmentConstants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PICropAdjustmentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
    v14 = objc_msgSend(v7, "isEqual:forKeys:", v8, &unk_1E37638C0);
  else
    v14 = 1;

  return v14;
}

void __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  objc_msgSend(a2, "result:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (v4)
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "isIdentityCompositionController error while running semantic style autocalc: %@", buf, 0xCu);

    }
LABEL_9:

    goto LABEL_10;
  }
  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v5 = objc_msgSend(*(id *)(a1 + 56), "newIdentityCompositionController");
      getPISemanticStyleAdjustmentKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke_2;
      v17 = &unk_1E3666110;
      v18 = v3;
      -[NSObject modifyAdjustmentWithKey:modificationBlock:](v5, "modifyAdjustmentWithKey:modificationBlock:", v9, &v14);

      objc_msgSend(*(id *)(a1 + 32), "composition", v14, v15, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      getPISemanticStyleAdjustmentKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSObject isEqual:forKeys:visualChangesOnly:](v5, "isEqual:forKeys:visualChangesOnly:", v10, v12, 1);

      if (v13)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

      goto LABEL_9;
    }
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithSemStyleInfo:", *(_QWORD *)(a1 + 32));
}

void __42__PLCompositionHelper_adjustmentConstants__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(getPIPhotoEditHelperClass(), "adjustmentConstants");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)adjustmentConstants_constants;
  adjustmentConstants_constants = v0;

}

void __35__PLCompositionHelper_photosSchema__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(getPIPhotoEditHelperClass(), "photosSchema");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)photosSchema_schema;
  photosSchema_schema = v0;

}

@end
