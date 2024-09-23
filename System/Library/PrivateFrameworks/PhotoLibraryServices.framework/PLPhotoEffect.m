@implementation PLPhotoEffect

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLPhotoEffect;
  -[PLPhotoEffect description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLPhotoEffect displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)latestVersion
{
  id v2;
  void *v3;
  int64_t v4;

  v2 = -[PLPhotoEffect newEffectFilter](self, "newEffectFilter");
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C9E288]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)newEffectFilter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLPhotoEffect CIFilterName](self, "CIFilterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)MEMORY[0x1E0C9DDB8];
  -[PLPhotoEffect CIFilterName](self, "CIFilterName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)filterIdentifier
{
  return self->_filterIdentifier;
}

- (NSString)relatedVersionIdentifier
{
  return self->_relatedVersionIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)CIFilterName
{
  return self->_CIFilterName;
}

- (int64_t)lightingVersion
{
  return self->_lightingVersion;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (BOOL)isLegacy
{
  return self->_isLegacy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CIFilterName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_relatedVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_filterIdentifier, 0);
}

+ (id)_legacyEffectWithIdentifier:(id)a3 CIFilterName:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = objc_msgSend(v5, "copy");
  v11 = (void *)v7[5];
  v7[5] = v10;

  *((_WORD *)v7 + 4) = 256;
  return v7;
}

+ (id)_effectWithIdentifier:(id)a3 CIFilterName:(id)a4 displayName:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = objc_msgSend(v9, "copy");

  v12 = (void *)v10[2];
  v10[2] = v11;

  v13 = objc_msgSend(v8, "copy");
  v14 = (void *)v10[5];
  v10[5] = v13;

  v15 = objc_msgSend(v7, "copy");
  v16 = (void *)v10[4];
  v10[4] = v15;

  *((_WORD *)v10 + 4) = 0;
  return v10;
}

+ (id)_lightingEffectWithIdentifier:(id)a3 relatedVersionIdentifier:(id)a4 CIFilterName:(id)a5 lightingVersion:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init((Class)objc_opt_class());
  v13 = objc_msgSend(v11, "copy");

  v14 = (void *)v12[2];
  v12[2] = v13;

  v15 = objc_msgSend(v10, "copy");
  v16 = (void *)v12[3];
  v12[3] = v15;

  v17 = objc_msgSend(v9, "copy");
  v18 = (void *)v12[5];
  v12[5] = v17;

  *((_BYTE *)v12 + 8) = 1;
  v12[6] = a6;
  return v12;
}

+ (id)allEffects
{
  pl_dispatch_once();
  return (id)allEffects_allPhotoEffects;
}

+ (id)standardSupportedEffects
{
  pl_dispatch_once();
  return (id)standardSupportedEffects_standardEffects;
}

+ (id)allSupportedEffects
{
  pl_dispatch_once();
  return (id)allSupportedEffects_supportedEffects;
}

+ (BOOL)isEffectNoneForIdentifier:(id)a3
{
  BOOL result;

  result = objc_msgSend(a3, "isEqualToString:", CFSTR("PUPhotoEffectNone"));
  if (!a3)
    return 1;
  return result;
}

+ (BOOL)isEffectWithIdentifier:(id)a3 equalToEffectWithIdentifier:(id)a4
{
  id v6;
  id v7;
  char v8;
  char v9;
  char v10;
  char v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "isEffectNoneForIdentifier:", v6);
  v9 = objc_msgSend(a1, "isEffectNoneForIdentifier:", v7);
  if (v6)
    v10 = objc_msgSend(v6, "isEqualToString:", v7);
  else
    v10 = 0;
  v11 = v10 | v8 & v9;

  return v11;
}

+ (unint64_t)_indexOfEffectWithIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  unint64_t v8;
  _QWORD v10[4];
  __CFString *v11;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("PUPhotoEffectNone");
  objc_msgSend(a1, "allEffects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__PLPhotoEffect__indexOfEffectWithIdentifier___block_invoke;
  v10[3] = &unk_1E36747B8;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);

  return v8;
}

+ (id)effectWithIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_msgSend(a1, "_indexOfEffectWithIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    objc_msgSend(a1, "allEffects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)effectWithCIFilterName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(a1, "allEffects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__PLPhotoEffect_effectWithCIFilterName___block_invoke;
  v11[3] = &unk_1E36747E0;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[PLPhotoEffect effectWithIdentifier:](PLPhotoEffect, "effectWithIdentifier:", CFSTR("PUPhotoEffectNone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "allEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)equivalentEffectForIdentifier:(id)a3 version:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "effectWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relatedVersionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "lightingVersion") == a4)
  {
    v8 = v6;
  }
  else if (v7)
  {
    objc_msgSend(a1, "effectWithIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "lightingVersion") == a4)
      v8 = v9;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  v10 = v8;

  return v10;
}

uint64_t __40__PLPhotoEffect_effectWithCIFilterName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "CIFilterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a4 = v7;

  return v7;
}

uint64_t __46__PLPhotoEffect__indexOfEffectWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "filterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a4 = v7;

  return v7;
}

void __36__PLPhotoEffect_allSupportedEffects__block_invoke()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[PLPhotoEffect allEffects](PLPhotoEffect, "allEffects");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isLegacy", (_QWORD)v9) & 1) == 0)
          objc_msgSend(v1, "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v8 = (void *)allSupportedEffects_supportedEffects;
  allSupportedEffects_supportedEffects = (uint64_t)v1;

}

void __41__PLPhotoEffect_standardSupportedEffects__block_invoke()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[PLPhotoEffect allEffects](PLPhotoEffect, "allEffects");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPortrait", (_QWORD)v9) & 1) == 0 && (objc_msgSend(v7, "isLegacy") & 1) == 0)
          objc_msgSend(v1, "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v8 = (void *)standardSupportedEffects_standardEffects;
  standardSupportedEffects_standardEffects = (uint64_t)v1;

}

void __27__PLPhotoEffect_allEffects__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[29];

  v39[27] = *MEMORY[0x1E0C80C00];
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("StageWhite"), 0, CFSTR("CIPortraitEffectStageWhite"), 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v38;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("StageMonoV2"), CFSTR("BlackoutMono"), CFSTR("CIPortraitEffectStageMonoV2"), 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v37;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("StageV2"), CFSTR("Black"), CFSTR("CIPortraitEffectStageV2"), 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v36;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("ContourV2"), CFSTR("Contour"), CFSTR("CIPortraitEffectContourV2"), 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v35;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("StudioV2"), CFSTR("Commercial"), CFSTR("CIPortraitEffectStudioV2"), 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v34;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("BlackoutMono"), CFSTR("StageMonoV2"), CFSTR("CIPortraitEffectStageMono"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v33;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("Black"), CFSTR("StageV2"), CFSTR("CIPortraitEffectStage"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v32;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("Contour"), CFSTR("ContourV2"), CFSTR("CIPortraitEffectContour"), 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v31;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("Commercial"), CFSTR("StudioV2"), CFSTR("CIPortraitEffectStudio"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v30;
  +[PLPhotoEffect _lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:](PLPhotoEffect, "_lightingEffectWithIdentifier:relatedVersionIdentifier:CIFilterName:lightingVersion:", CFSTR("Light"), 0, CFSTR("CIPortraitEffectLight"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v29;
  PLServicesLocalizedFrameworkString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("PUPhotoEffectNone"), 0, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v27;
  PLServicesLocalizedFrameworkString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DVivid"), CFSTR("CIPhotoEffect3DVivid"), v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v25;
  PLServicesLocalizedFrameworkString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DVividWarm"), CFSTR("CIPhotoEffect3DVividWarm"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v23;
  PLServicesLocalizedFrameworkString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DVividCool"), CFSTR("CIPhotoEffect3DVividCool"), v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v21;
  PLServicesLocalizedFrameworkString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DDramatic"), CFSTR("CIPhotoEffect3DDramatic"), v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v19;
  PLServicesLocalizedFrameworkString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DDramaticWarm"), CFSTR("CIPhotoEffect3DDramaticWarm"), v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v17;
  PLServicesLocalizedFrameworkString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DDramaticCool"), CFSTR("CIPhotoEffect3DDramaticCool"), v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[16] = v15;
  PLServicesLocalizedFrameworkString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("Mono"), CFSTR("CIPhotoEffectMono"), v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[17] = v13;
  PLServicesLocalizedFrameworkString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DSilverplate"), CFSTR("CIPhotoEffect3DSilverplate"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[18] = v11;
  PLServicesLocalizedFrameworkString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEffect _effectWithIdentifier:CIFilterName:displayName:](PLPhotoEffect, "_effectWithIdentifier:CIFilterName:displayName:", CFSTR("3DNoir"), CFSTR("CIPhotoEffect3DNoir"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v39[19] = v1;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Tonal"), CFSTR("CIPhotoEffectTonal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39[20] = v2;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Fade"), CFSTR("CIPhotoEffectFade"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39[21] = v3;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Chrome"), CFSTR("CIPhotoEffectChrome"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[22] = v4;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Process"), CFSTR("CIPhotoEffectProcess"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[23] = v5;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Transfer"), CFSTR("CIPhotoEffectTransfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[24] = v6;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Instant"), CFSTR("CIPhotoEffectInstant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[25] = v7;
  +[PLPhotoEffect _legacyEffectWithIdentifier:CIFilterName:](PLPhotoEffect, "_legacyEffectWithIdentifier:CIFilterName:", CFSTR("Noir"), CFSTR("CIPhotoEffectNoir"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[26] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 27);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)allEffects_allPhotoEffects;
  allEffects_allPhotoEffects = v9;

}

@end
