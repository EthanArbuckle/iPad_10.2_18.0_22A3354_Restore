@implementation PVCinematicEffect

- (PVCinematicEffect)init
{
  PVCinematicEffect *v2;
  PVCinematicEffect *v3;
  PTGlobalRenderingMetadata *ptGlobalRenderingMetadata;
  __int128 v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PVCinematicEffect;
  v2 = -[PVCinematicEffect init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_quality = 75;
    v2->_isCinematographyScriptReady = 0;
    v2->_isAssetOK = 0;
    ptGlobalRenderingMetadata = v2->_ptGlobalRenderingMetadata;
    v2->_ptGlobalRenderingMetadata = 0;

    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v3->_postEffectTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v3->_postEffectTransform.c = v6;
    *(_OWORD *)&v3->_postEffectTransform.tx = v5;
  }
  return v3;
}

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.filter"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v9, v6);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("displayName"), CFSTR("BuiltIn"), CFSTR("contentGroup"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerContentClass:forID:type:withProperties:", objc_opt_class(), v9, CFSTR("effect.video.filter"), v7);

}

+ (int64_t)memorySize
{
  if (+[PVCinematicEffect memorySize]::onceToken != -1)
    dispatch_once(&+[PVCinematicEffect memorySize]::onceToken, &__block_literal_global_1);
  return +[PVCinematicEffect memorySize]::mem;
}

uint64_t __31__PVCinematicEffect_memorySize__block_invoke()
{
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v2 = 0x1800000006;
  v1 = 8;
  return sysctl(v2, 2u, &+[PVCinematicEffect memorySize]::mem, &v1, 0, 0);
}

+ (BOOL)hasMoreThan2GBOfMemory
{
  return (unint64_t)+[PVCinematicEffect memorySize](PVCinematicEffect, "memorySize") > 0x9E800000;
}

+ (BOOL)enoughMemoryForHDR
{
  return +[PVCinematicEffect hasMoreThan2GBOfMemory](PVCinematicEffect, "hasMoreThan2GBOfMemory");
}

+ (BOOL)hasAppleNeuralEngine
{
  if (+[PVCinematicEffect hasAppleNeuralEngine]::onceToken != -1)
    dispatch_once(&+[PVCinematicEffect hasAppleNeuralEngine]::onceToken, &__block_literal_global_17);
  return +[PVCinematicEffect hasAppleNeuralEngine]::hasANE;
}

uint64_t __41__PVCinematicEffect_hasAppleNeuralEngine__block_invoke()
{
  uint64_t result;
  char v1;
  BOOL v2;
  int v3;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  result = sysctlbyname("hw.cpufamily", &v6, &v5, 0, 0);
  v1 = 0;
  if (v6 <= 747742333)
  {
    v2 = v6 == -1829029944;
    v3 = -400654602;
  }
  else
  {
    v2 = v6 == 747742334 || v6 == 933271106;
    v3 = 1741614739;
  }
  if (!v2 && v6 != v3)
    v1 = 1;
  +[PVCinematicEffect hasAppleNeuralEngine]::hasANE = v1;
  return result;
}

+ (BOOL)deviceSupportsRendering:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PVCinematicEffect_deviceSupportsRendering___block_invoke;
  block[3] = &unk_1E64D47C0;
  v9 = v3;
  v4 = +[PVCinematicEffect deviceSupportsRendering:]::onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&+[PVCinematicEffect deviceSupportsRendering:]::onceToken, block);
  v6 = +[PVCinematicEffect deviceSupportsRendering:]::supported;

  return v6;
}

void __45__PVCinematicEffect_deviceSupportsRendering___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  int v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  if (v1)
    v2 = v1;
  else
    v2 = MTLCreateSystemDefaultDevice();
  v4 = v2;
  v3 = objc_msgSend(MEMORY[0x1E0D7F578], "isMetalDeviceSupported:", v2);
  if (v3)
    LOBYTE(v3) = +[PVCinematicEffect enoughMemoryForHDR](PVCinematicEffect, "enoughMemoryForHDR");
  +[PVCinematicEffect deviceSupportsRendering:]::supported = v3;

}

+ (BOOL)deviceSupportsTracking:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PVCinematicEffect_deviceSupportsTracking___block_invoke;
  block[3] = &unk_1E64D47C0;
  v9 = v3;
  v4 = +[PVCinematicEffect deviceSupportsTracking:]::onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&+[PVCinematicEffect deviceSupportsTracking:]::onceToken, block);
  v6 = +[PVCinematicEffect deviceSupportsTracking:]::supported;

  return v6;
}

uint64_t __44__PVCinematicEffect_deviceSupportsTracking___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    result = objc_msgSend(MEMORY[0x1E0D7F5B0], "isSupported");
    +[PVCinematicEffect deviceSupportsTracking:]::supported = result;
    if (!(_DWORD)result)
      goto LABEL_8;
  }
  else
  {
    +[PVCinematicEffect deviceSupportsTracking:]::supported = +[PVCinematicEffect hasAppleNeuralEngine](PVCinematicEffect, "hasAppleNeuralEngine");
    if ((+[PVCinematicEffect deviceSupportsTracking:]::supported & 1) == 0)
    {
      result = 0;
      goto LABEL_8;
    }
  }
  result = +[PVCinematicEffect deviceSupportsRendering:](PVCinematicEffect, "deviceSupportsRendering:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    result = objc_msgSend(MEMORY[0x1E0C8B2E8], "eligibleForHDRPlayback");
LABEL_8:
  +[PVCinematicEffect deviceSupportsTracking:]::supported = result;
  return result;
}

+ (BOOL)isCinematicSupported:(id)a3
{
  return +[PVCinematicEffect deviceSupportsTracking:](PVCinematicEffect, "deviceSupportsTracking:", a3);
}

+ (BOOL)currentSystemCanRenderAsset:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  char v7;
  id v9;

  v4 = a3;
  v9 = 0;
  v5 = objc_msgSend(a1, "renderingVersionFromAsset:error:", v4, &v9);
  v6 = v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(MEMORY[0x1E0D7F578], "isRenderVersionSupported:", v5);
  else
    v7 = v5 == 1;

  return v7;
}

+ (BOOL)assetIsCinematicVideo:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "cinematicMetadataFromAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)cinematicMetadataFromAsset:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "metadata", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", CFSTR("mdta/com.apple.quicktime.cinematic-video"));

        if ((v9 & 1) != 0)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (unint64_t)renderingVersionFromAsset:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;

  objc_msgSend(a1, "cinematicMetadataFromAsset:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0D7F568];
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deserializeMetadataWithType:fromGlobalMetadata:error:", 2, v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = objc_msgSend(v9, "renderingVersion");
LABEL_11:

          goto LABEL_12;
        }
        v11 = CFSTR("Global rendering metadata does not respond to renderingVersion selector.");
      }
      else
      {
        v11 = CFSTR("Unexpected global rendering metadata class.");
      }
    }
    else
    {
      v11 = CFSTR("Deserialize failed.");
    }
    PVLogError(v11, CFSTR("ProVideo.Cinematic"), a4);
    v10 = 0;
    goto LABEL_11;
  }
  PVLogError(CFSTR("Can't find global cinematic metadata in asset."), CFSTR("ProVideo.Cinematic"), a4);
  v10 = 0;
LABEL_12:

  return v10;
}

- (CGSize)outputSize
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vabsq_f64(vaddq_f64(vmulq_n_f64(*(float64x2_t *)&self->_postEffectTransform.a, self->_videoTrackSize.width), vmulq_n_f64(*(float64x2_t *)&self->_postEffectTransform.c, self->_videoTrackSize.height)));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (void)setupGlobalMetadata
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  PTGlobalRenderingMetadata *v12;
  id v13;
  PTGlobalRenderingMetadata *ptGlobalRenderingMetadata;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AVAsset metadata](self->_avasset, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("mdta/com.apple.quicktime.cinematic-video"));

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0D7F568];
          objc_msgSend(v7, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0;
          objc_msgSend(v10, "deserializeMetadataWithType:fromGlobalMetadata:error:", 2, v11, &v15);
          v12 = (PTGlobalRenderingMetadata *)objc_claimAutoreleasedReturnValue();
          v13 = v15;

          if (v12)
          {
            ptGlobalRenderingMetadata = self->_ptGlobalRenderingMetadata;
            self->_ptGlobalRenderingMetadata = v12;

            goto LABEL_13;
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

- (BOOL)setAsset:(id)a3
{
  AVAsset *v5;
  AVAsset *avasset;
  uint64_t v7;
  _QWORD v9[5];
  AVAsset *v10;

  v5 = (AVAsset *)a3;
  if (self->_avasset != v5)
  {
    objc_storeStrong((id *)&self->_avasset, a3);
    self->_isCinematographyScriptReady = 0;
    self->_isAssetOK = 0;
    avasset = self->_avasset;
    if (avasset)
    {
      v7 = *MEMORY[0x1E0C8A808];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __30__PVCinematicEffect_setAsset___block_invoke;
      v9[3] = &unk_1E64D4810;
      v9[4] = self;
      v10 = v5;
      -[AVAsset loadTracksWithMediaType:completionHandler:](avasset, "loadTracksWithMediaType:completionHandler:", v7, v9);

    }
  }

  return 1;
}

void __30__PVCinematicEffect_setAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  NSObject *v17;

  v5 = a2;
  v6 = a3;
  if (!v6 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "naturalSize");
      v11 = (double *)(*(_QWORD *)(a1 + 32) + 184);
      *v11 = fabs(v9);
      v11[1] = fabs(v10);
    }
    v12 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __30__PVCinematicEffect_setAsset___block_invoke_2;
    v16[3] = &unk_1E64D47E8;
    v13 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v17 = v14;
    objc_msgSend(v13, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E66497D0, v16);
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v15 + 176))
      *(_BYTE *)(v15 + 168) = 1;

  }
}

intptr_t __30__PVCinematicEffect_setAsset___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setupGlobalMetadata");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)isReady
{
  return self->_isAssetOK && self->_isCinematographyScriptReady;
}

- (void)updateDictionary:(id)a3 completion:(id)a4
{
  NSDictionary *v7;
  void (**v8)(id, uint64_t, _QWORD);
  PTCinematographyScript *v9;
  PTCinematographyScript *script;
  PTCinematographyScript *v11;
  AVAsset *avasset;
  id v13;
  _QWORD v14[5];
  NSDictionary *v15;
  void (**v16)(id, uint64_t, _QWORD);

  v7 = (NSDictionary *)a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  if (self->_currentCinemtography == v7 && self->_isCinematographyScriptReady)
  {
LABEL_8:
    if (v8)
      v8[2](v8, 1, 0);
    goto LABEL_10;
  }
  if (!self->_script || !self->_isCinematographyScriptReady)
  {
    self->_isCinematographyScriptReady = 0;
    v9 = (PTCinematographyScript *)objc_alloc_init(MEMORY[0x1E0D7F540]);
    script = self->_script;
    self->_script = v9;

    v11 = self->_script;
    avasset = self->_avasset;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PVCinematicEffect_updateDictionary_completion___block_invoke;
    v14[3] = &unk_1E64D4838;
    v14[4] = self;
    v15 = v7;
    v16 = v8;
    v13 = (id)-[PTCinematographyScript loadWithAsset:changesDictionary:completion:](v11, "loadWithAsset:changesDictionary:completion:", avasset, v15, v14);

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PTCinematographyScript reloadWithChangesDictionary:](self->_script, "reloadWithChangesDictionary:", v7);
    objc_storeStrong((id *)&self->_currentCinemtography, a3);
    goto LABEL_8;
  }
LABEL_10:

}

void __49__PVCinematicEffect_updateDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 169) = 1;
  }
  else
  {
    NSLog(CFSTR("PTCinematographyScript error during loadWithAsset:%@"), v5);
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  _QWORD *v6;
  HGNode *v9;
  PVCinematicEffect *v10;
  HGRenderCinema *v11;
  char *v12;
  PTGlobalRenderingMetadata *ptGlobalRenderingMetadata;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int32 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  unsigned __int32 v29;
  void *v30;
  void *v31;
  char v32;
  PTGlobalRenderingMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char *v38;
  uint64_t v39;
  HGNode *v40;
  HGNode *v41;
  CMTimeValue var0;
  int32_t var1;
  PTCinematographyScript *script;
  void *v45;
  void *v46;
  unsigned __int32 v47;
  unsigned __int32 v48;
  unsigned __int32 v49;
  void *v50;
  unsigned __int32 v51;
  id v52;
  void *v53;
  id v54;
  char *v55;
  unint64_t quality;
  uint64_t v57;
  __n128 v58;
  char *v59;
  __n128 v60;
  char *v61;
  char *v62;
  id v63;
  HGXForm *v64;
  char *v65;
  __int128 v66;
  void (*v67)(HGXForm *);
  void *v68;
  HGNode *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD *v75;
  HGRenderCinema *v76;
  PVCinematicEffect *v77;
  uint64_t v78;
  _OWORD v79[3];
  HGXForm *v80;
  void *__p[2];
  char v82;
  CMTime v83;
  CMTime v84;
  CMTime rhs;
  CMTime lhs;
  CMTime v87;
  CMTime v88;
  CMTime v89;
  CMTime v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  HGNode *v95;
  HGNode *v96;
  uint64_t v97;
  int var3_high;
  _BYTE v99[128];
  uint64_t v100;

  v75 = v6;
  v100 = *MEMORY[0x1E0C80C00];
  if (!self->_isAssetOK || (objc_msgSend((id)objc_opt_class(), "deviceSupportsRendering:", 0) & 1) == 0)
  {
    v40 = (HGNode *)HGObject::operator new(0x1A0uLL);
    v41 = HGNode::HGNode(v40);
    *v75 = v40;
    return (HGRef<HGNode>)v41;
  }
  v77 = self;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v96);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v95);
  v9 = v96;
  *v75 = v96;
  v10 = v77;
  if (v9)
    (*(void (**)(HGNode *))(*(_QWORD *)v9 + 16))(v9);
  v69 = v9;
  v11 = (HGRenderCinema *)HGObject::operator new(0x1C0uLL);
  HGRenderCinema::HGRenderCinema(v11, 0);
  (*(void (**)(HGRenderCinema *, _QWORD, HGNode *))(*(_QWORD *)v11 + 120))(v11, 0, v96);
  (*(void (**)(HGRenderCinema *, uint64_t, HGNode *))(*(_QWORD *)v11 + 120))(v11, 1, v95);
  v76 = v11;
  ptGlobalRenderingMetadata = v77->_ptGlobalRenderingMetadata;
  if (ptGlobalRenderingMetadata)
    HGRenderCinema::SetGlobalRenderingMetadata(v11, ptGlobalRenderingMetadata, v12);
  PVInputHGNodeMap<unsigned int>::GetTimedMetadata((uint64_t)a4, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  PVInputHGNodeMap<unsigned int>::GetTimedMetadata((uint64_t)a4, 1u);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v72;
  v70 = (void *)v14;
  if (!v72)
    v15 = (void *)v14;
  v16 = v15;
  v71 = v16;
  if (!v16)
  {
    v21 = 1.0;
    goto LABEL_38;
  }
  objc_msgSend(v16, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v17;
  if (!v17)
  {
    v21 = 1.0;
    goto LABEL_37;
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v99, 16, v68);
  if (!v19)
  {
    v21 = 1.0;
    goto LABEL_36;
  }
  v20 = *(_QWORD *)v92;
  v78 = *MEMORY[0x1E0CA2440];
  v21 = 1.0;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v92 != v20)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v22);
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("mdta/com.apple.quicktime.disparity-float"));

      if (v25)
      {
        objc_msgSend(v23, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_27;
        objc_msgSend(v23, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "floatValue");
        v21 = v29;
        goto LABEL_26;
      }
      objc_msgSend(v23, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v28, "isEqualToString:", CFSTR("mdta/com.apple.quicktime.cinematic-video.rendering")))goto LABEL_26;
      objc_msgSend(v23, "dataType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqualToString:", v78) & 1) == 0)
      {

LABEL_26:
        goto LABEL_27;
      }
      objc_msgSend(v23, "value");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) != 0)
      {
        v33 = v77->_ptGlobalRenderingMetadata;
        if (v33)
        {
          v34 = -[PTGlobalRenderingMetadata majorVersion](v33, "majorVersion");
          v35 = -[PTGlobalRenderingMetadata minorVersion](v77->_ptGlobalRenderingMetadata, "minorVersion");
          v36 = (void *)MEMORY[0x1E0D7F5C8];
          objc_msgSend(v23, "value");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectFromData:withMajorVersion:minorVersion:", v37, v34, v35);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            HGRenderCinema::SetTimedRenderingMetadata((uint64_t)v76, v28, v38);
          else
            NSLog(CFSTR("ERROR w/ PTTimedRenderingMetadata"));
          goto LABEL_26;
        }
      }
LABEL_27:
      ++v22;
    }
    while (v19 != v22);
    v39 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    v19 = v39;
  }
  while (v39);
LABEL_36:

LABEL_37:
  v10 = v77;
LABEL_38:
  if (v10->_isCinematographyScriptReady)
  {
    var0 = a3->var0;
    var1 = a3->var1;
    v97 = *(_QWORD *)&a3->var2;
    var3_high = HIDWORD(a3->var3);
    memset(&v90, 0, sizeof(v90));
    CMTimeMakeWithSeconds(&v90, v10->_clipOffset, var1);
    memset(&v89, 0, sizeof(v89));
    CMTimeMakeWithSeconds(&v89, v10->_clipStart, var1);
    *(_QWORD *)&lhs.flags = v97;
    lhs.timescale = var1;
    HIDWORD(lhs.epoch) = var3_high;
    rhs = v90;
    lhs.value = var0;
    CMTimeSubtract(&v87, &lhs, &rhs);
    v84 = v89;
    CMTimeAdd(&v88, &v87, &v84);
    v97 = *(_QWORD *)&v88.flags;
    var3_high = HIDWORD(v88.epoch);
    script = v10->_script;
    v83 = v88;
    -[PTCinematographyScript frameNearestTime:](script, "frameNearestTime:", &v83);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "aperture");
      v48 = v47;
      objc_msgSend(v46, "focusDistance");
      v21 = v49;
    }
    else
    {
      v48 = 1068708659;
    }

    v10 = v77;
  }
  else
  {
    v48 = 1068708659;
  }
  -[NSLock lock](v10->super.super._inspectablePropertiesLock, "lock", v68);
  -[NSMutableDictionary objectForKeyedSubscript:](v10->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("CinematicAperture"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](v10->super.super._inspectablePropertiesLock, "unlock");
  if (v50)
  {
    objc_msgSend(v50, "floatValue");
    v48 = v51;
  }
  v52 = (id)*MEMORY[0x1E0CA8EB0];
  PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v53, "isRec709GammaColorSpace") & 1) == 0)
  {
    if (objc_msgSend(v53, "isRec2020LinearColorSpace"))
    {
      v54 = (id)*MEMORY[0x1E0CA2328];

      v52 = v54;
      v10 = v77;
    }
    else
    {
      NSLog(CFSTR("unexpected working color space. assuming Rec. 709 gamma transfer function"));
    }
  }
  HGRenderCinema::SetSingleChannelDepthConversion((uint64_t)v76);
  quality = v10->_quality;
  if (quality)
    v57 = quality;
  else
    v57 = 75;
  HGRenderCinema::SetRenderQuality(v76, (const char *)v57, v55);
  v58.n128_u32[0] = v48;
  HGRenderCinema::SetFXParameter((uint64_t)v76, 0, v59, v58);
  v60.n128_u32[0] = v21;
  HGRenderCinema::SetFXParameter((uint64_t)v76, (const char *)1, v61, v60);
  HGRenderCinema::SetDisplayMode(v76, 0, v62);
  v63 = objc_retainAutorelease(v52);
  v64 = (HGXForm *)v69;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v63, "UTF8String"));
  HGRenderCinema::SetTransferFunction((uint64_t)v76, (uint64_t)__p, v65);
  if (v82 < 0)
    operator delete(__p[0]);
  if (v69 == (HGNode *)v76)
  {
    (*(void (**)(HGNode *))(*(_QWORD *)v69 + 24))(v69);
  }
  else
  {
    if (v69)
      (*(void (**)(HGNode *))(*(_QWORD *)v69 + 24))(v69);
    v64 = (HGXForm *)v76;
    *v75 = v76;
  }
  v80 = v64;
  (*(void (**)(HGXForm *))(*(_QWORD *)v64 + 16))(v64);
  v66 = *(_OWORD *)&v77->_postEffectTransform.c;
  v79[0] = *(_OWORD *)&v77->_postEffectTransform.a;
  v79[1] = v66;
  v79[2] = *(_OWORD *)&v77->_postEffectTransform.tx;
  HGXFormForCGAffineTransform(&v80, v79, 1, (HGXForm **)&v90);
  v67 = *(void (**)(HGXForm *))(*(_QWORD *)v64 + 24);
  if (v64 == (HGXForm *)v90.value)
  {
    v67(v64);
  }
  else
  {
    v67(v64);
    *v75 = v90.value;
    v90.value = 0;
  }
  if (v80)
    (*(void (**)(HGXForm *))(*(_QWORD *)v80 + 24))(v80);

  if (v95)
    (*(void (**)(HGNode *))(*(_QWORD *)v95 + 24))(v95);
  v41 = v96;
  if (v96)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v96 + 24))(v96);
  return (HGRef<HGNode>)v41;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_quality = a3;
}

- (double)clipOffset
{
  return self->_clipOffset;
}

- (void)setClipOffset:(double)a3
{
  self->_clipOffset = a3;
}

- (double)clipStart
{
  return self->_clipStart;
}

- (void)setClipStart:(double)a3
{
  self->_clipStart = a3;
}

- (CGAffineTransform)postEffectTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].c;
  return self;
}

- (void)setPostEffectTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_postEffectTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_postEffectTransform.c = v4;
  *(_OWORD *)&self->_postEffectTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ptGlobalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_currentCinemtography, 0);
  objc_storeStrong((id *)&self->_script, 0);
  objc_storeStrong((id *)&self->_avasset, 0);
}

@end
