@implementation PVMotionEffectTransformComponent

- (PVMotionEffectTransformComponent)initWithMotionEffect:(id)a3
{
  PVMotionEffectTransformComponent *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PVMotionEffectTransformComponent;
  result = -[PVMotionEffectComponent initWithMotionEffect:](&v4, sel_initWithMotionEffect_, a3);
  if (result)
  {
    result->_top3DGroupID = 0;
    result->_top3DGroupIDStatus = 1;
    result->_cameraID = 0;
    result->_cameraIDStatus = 1;
    result->_metersToWorldUnitScale = 1.0;
    result->_isFixedSourceDropShadow = 0;
    result->_normalizedFixedShadowSize = (CGSize)*MEMORY[0x1E0C9D820];
  }
  return result;
}

- (BOOL)encloseTopGroupIn3DGroupOnce_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  int top3DGroupIDStatus;
  OZDocument **v8;
  void *v10;
  PCString v11;
  unsigned int v12;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  top3DGroupIDStatus = self->_top3DGroupIDStatus;
  if (top3DGroupIDStatus)
  {
    if (top3DGroupIDStatus != 1)
      return 0;
    if (*((_DWORD *)a3 + 41))
      return 0;
    v12 = 0;
    v8 = *(OZDocument ***)a3;
    v11.var0 = 0;
    PCString::set(&v11, CFSTR("PVEffect Top 3D Group"));
    self->_top3DGroupIDStatus = OZXCreateGroupWithGroup(v8, (uint64_t)&v11, *((_DWORD *)a3 + 40), 1u, &v12);
    PCString::~PCString(&v11);
    if (self->_top3DGroupIDStatus)
      return 0;
    self->_top3DGroupID = v12;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNodeIDToCache:", self->_top3DGroupID);

  }
  return 1;
}

- (BOOL)addCameraToDocumentOnce_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  int cameraIDStatus;
  OZChannelBase *v8;
  PCString v9;
  int v10;
  BOOL result;
  PCString v12;
  unsigned int v13;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  cameraIDStatus = self->_cameraIDStatus;
  if (!cameraIDStatus)
    return 1;
  if (cameraIDStatus != 1)
    return 0;
  v13 = 0;
  v8 = *(OZChannelBase **)a3;
  v12.var0 = 0;
  PCString::set(&v12, CFSTR("PVEffect Camera"));
  v9.var0 = (__CFString *)&v12;
  self->_cameraIDStatus = OZXCreateCamera(v8, v9, &v13);
  PCString::~PCString(&v12);
  v10 = self->_cameraIDStatus;
  result = v10 == 0;
  if (!v10)
    self->_cameraID = v13;
  return result;
}

- (void)applyTransforms_NoLock:(const void *)a3 dirtyProperties:(id)a4 defaultProperties:(id)a5 componentTime:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat x;
  CGFloat y;
  CGSize size;
  double MidX;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  uint64_t v47;
  CGRect v48;
  __int128 v49;
  int64_t var3;
  __int128 v51;
  uint64_t v52;
  CGRect v53;

  v10 = a4;
  v11 = a5;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assertInspectablePropertiesAreLocked");

  if ((a6->var2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVTopLevelTransformKey"), v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffectTransformComponent additionalTopLevelScaleInDictionary:orInDefaultDictionary:](self, "additionalTopLevelScaleInDictionary:orInDefaultDictionary:", v10, v11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v43 = v15;
      v16 = -[PVMotionEffectTransformComponent isForceRenderAtPosterFrameEnabledInDictionary:orInDefaultDictionary:](self, "isForceRenderAtPosterFrameEnabledInDictionary:orInDefaultDictionary:", v10, v11);
      v51 = 0uLL;
      v52 = 0;
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timelineComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v49 = *(_OWORD *)&a6->var0;
      var3 = a6->var3;
      if (v18)
      {
        v20 = v45;
        objc_msgSend(v18, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v49, v16, a3);
      }
      else
      {
        v51 = 0uLL;
        v52 = 0;
        v20 = v45;
      }

      v48.origin.x = 0.0;
      v48.origin.y = 0.0;
      __asm { FMOV            V0.2D, #-1.0 }
      v48.size = _Q0;
      v26 = *((unsigned int *)a3 + 40);
      v46 = v51;
      v47 = v52;
      v15 = v43;
      if (!-[PVMotionEffectTransformComponent objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:](self, "objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:", &v48, v26, &v46, 1, 1, a3))
      {
        objc_msgSend(v20, "CGPointValue");
        v28 = v27;
        v30 = v29;
        x = v48.origin.x;
        y = v48.origin.y;
        size = v48.size;
        MidX = CGRectGetMidX(v48);
        v53.origin.x = x;
        v53.origin.y = y;
        v53.size = size;
        -[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:](self, "applyAdditionalTopLevelScale:aroundPoint:toTransform:", v43, v28, v30, MidX, CGRectGetMidY(v53));
        v35 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v35;
      }
    }
    -[PVMotionEffectTransformComponent applyTopLevelGroupTransform_NoLock:transform:](self, "applyTopLevelGroupTransform_NoLock:transform:", a3, v15);
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVTransformKey"), v10, v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVTransformUnitsAreInMeters"), v10, v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVCameraEnabledKey"), v10, v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "BOOLValue"))
    {
      v44 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVCameraProjectionKey"), v10, v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVCameraTransformKey"), v10, v11);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v41;
      if (v40 && v41)
        -[PVMotionEffectTransformComponent enableCameraOverride_NoLock:transform:projection:transformUnitsAreInMeters:](self, "enableCameraOverride_NoLock:transform:projection:transformUnitsAreInMeters:", a3, v41, v40, v38);
      else
        -[PVMotionEffectTransformComponent disableCameraOverride_NoLock:](self, "disableCameraOverride_NoLock:", a3);

      v15 = v44;
    }
    else
    {
      -[PVMotionEffectTransformComponent disableCameraOverride_NoLock:](self, "disableCameraOverride_NoLock:", a3);
    }
    -[PVMotionEffectTransformComponent setTransform_NoLock:transform:transformUnitsAreInMeters:](self, "setTransform_NoLock:transform:transformUnitsAreInMeters:", a3, v36, v38);

  }
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](self, "transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v7, a4, 1, *(_QWORD *)&a6, a5.width, a5.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  CGFloat height;
  CGFloat width;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  _QWORD v21[8];
  __int128 v22;
  int64_t var3;
  int v24;
  char v25;
  BOOL v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  height = a6.height;
  width = a6.width;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  if (a4)
  {
    v13 = 1;
  }
  else
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timelineComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "isForceRenderAtPosterFrameEnabled");

  }
  +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "wantsToIncludeCoordinateSystemTranslationInEffectViewTransform");
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke;
  v21[3] = &unk_1E64D4888;
  v21[4] = self;
  v21[5] = &v28;
  v22 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v25 = v13;
  v26 = a5;
  v27 = v17;
  *(CGFloat *)&v21[6] = width;
  *(CGFloat *)&v21[7] = height;
  v24 = a7;
  objc_msgSend(v18, "runEnsuringDocumentReadyAndLockingDocument:", v21);

  v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  int v13;
  char v14;
  __int16 v15;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 64);
  v10 = v5;
  v11 = v6;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke_2;
  v7[3] = &unk_1E64D4860;
  v9 = a2;
  v12 = *(_QWORD *)(a1 + 80);
  v14 = *(_BYTE *)(a1 + 92);
  v15 = *(_WORD *)(a1 + 93);
  v13 = *(_DWORD *)(a1 + 88);
  objc_msgSend(v4, "runWithInspectableProperties:", v7);

}

void __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 88);
  LODWORD(v9) = *(_DWORD *)(a1 + 96);
  objc_msgSend(v4, "transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:", v5, &v10, *(unsigned __int8 *)(a1 + 100), *(unsigned __int8 *)(a1 + 101), 1, *(unsigned __int8 *)(a1 + 102), *(double *)(a1 + 56), *(double *)(a1 + 64), v9, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  CGFloat height;
  CGFloat width;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  _QWORD v23[8];
  __int128 v24;
  int64_t var3;
  int v26;
  char v27;
  BOOL v28;
  BOOL v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  height = a7.height;
  width = a7.width;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  v36 = 0;
  if (a4)
  {
    v15 = 1;
  }
  else
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timelineComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "isForceRenderAtPosterFrameEnabled");

  }
  +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "wantsToIncludeCoordinateSystemTranslationInEffectViewTransform");
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke;
  v23[3] = &unk_1E64D48D8;
  v23[4] = self;
  v23[5] = &v31;
  v24 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v27 = v15;
  v28 = a5;
  v29 = a6;
  v30 = v19;
  *(CGFloat *)&v23[6] = width;
  *(CGFloat *)&v23[7] = height;
  v26 = a8;
  objc_msgSend(v20, "runEnsuringDocumentReadyAndLockingDocument:", v23);

  v21 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v21;
}

void __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  int v6;
  int v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  int v15;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2;
  v8[3] = &unk_1E64D48B0;
  v10 = a2;
  v13 = *(_QWORD *)(a1 + 80);
  v7 = *(_DWORD *)(a1 + 88);
  v6 = *(_DWORD *)(a1 + 92);
  v11 = v5;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v4, "runWithInspectableProperties:", v8);

}

void __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 88);
  LODWORD(v9) = *(_DWORD *)(a1 + 96);
  objc_msgSend(v4, "transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:", v5, &v10, *(unsigned __int8 *)(a1 + 100), *(unsigned __int8 *)(a1 + 101), *(unsigned __int8 *)(a1 + 102), *(unsigned __int8 *)(a1 + 103), *(double *)(a1 + 56), *(double *)(a1 + 64), v9, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)addToTopLevelTransform:(double)a3 atTime:(uint64_t)a4 forcePosterFrame:(__int128 *)a5 restrictToBounds:(__int128 *)a6 viewSize:(char)a7 viewOrigin:(char)a8
{
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint64_t *v34;
  double v35;
  double v36;
  __int128 v37;
  uint64_t v38;
  int v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  v47 = 0;
  objc_msgSend(a1, "motionEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke;
  v24[3] = &unk_1E64D4928;
  v33 = a1;
  v34 = &v42;
  v18 = a5[5];
  v29 = a5[4];
  v30 = v18;
  v19 = a5[7];
  v31 = a5[6];
  v32 = v19;
  v20 = a5[1];
  v25 = *a5;
  v26 = v20;
  v21 = a5[3];
  v27 = a5[2];
  v28 = v21;
  v38 = *((_QWORD *)a6 + 2);
  v37 = *a6;
  v40 = a7;
  v41 = a8;
  v35 = a2;
  v36 = a3;
  v39 = a9;
  objc_msgSend(v17, "runEnsuringDocumentReadyAndLockingDocument:", v24);

  v22 = (id)v43[5];
  _Block_object_dispose(&v42, 8);

  return v22;
}

void __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  __int16 v27;

  objc_msgSend(*(id *)(a1 + 160), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 160);
  v5 = *(_OWORD *)(a1 + 176);
  v7 = *(_OWORD *)(a1 + 112);
  v17 = *(_OWORD *)(a1 + 96);
  v18 = v7;
  v8 = *(_OWORD *)(a1 + 144);
  v19 = *(_OWORD *)(a1 + 128);
  v20 = v8;
  v21 = v6;
  v9 = *(_OWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 32);
  v14 = v9;
  v10 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 64);
  v16 = v10;
  v24 = *(_OWORD *)(a1 + 192);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke_2;
  v12[3] = &unk_1E64D4900;
  v11 = *(_QWORD *)(a1 + 208);
  v22 = a2;
  v25 = v11;
  v27 = *(_WORD *)(a1 + 220);
  v23 = v5;
  v26 = *(_DWORD *)(a1 + 216);
  objc_msgSend(v4, "runWithInspectableProperties:", v12);

}

void __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[8];

  v3 = a2;
  v4 = *(void **)(a1 + 160);
  v5 = *(_QWORD *)(a1 + 176);
  v6 = *(_OWORD *)(a1 + 112);
  v15[4] = *(_OWORD *)(a1 + 96);
  v15[5] = v6;
  v7 = *(_OWORD *)(a1 + 144);
  v15[6] = *(_OWORD *)(a1 + 128);
  v15[7] = v7;
  v8 = *(_OWORD *)(a1 + 48);
  v15[0] = *(_OWORD *)(a1 + 32);
  v15[1] = v8;
  v9 = *(_OWORD *)(a1 + 80);
  v15[2] = *(_OWORD *)(a1 + 64);
  v15[3] = v9;
  v14 = *(_QWORD *)(a1 + 216);
  v13 = *(_OWORD *)(a1 + 200);
  objc_msgSend(v4, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", v5, v15, &v13, *(unsigned __int8 *)(a1 + 228), *(unsigned __int8 *)(a1 + 229), *(unsigned int *)(a1 + 224), *(double *)(a1 + 184), *(double *)(a1 + 192), v3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 168) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)addToTopLevelTransform_NoLock:(double)a3 transform:(uint64_t)a4 atTime:(uint64_t)a5 forcePosterFrame:(uint64_t)a6 restrictToBounds:(__int128 *)a7 viewSize:(uint64_t)a8 viewOrigin:(unsigned int)a9 properties:(uint64_t)a10
{
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  double quad_center;
  double v66;
  uint64_t v67;
  float64x2_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  float64x2_t v87;
  float64x2_t v88;
  float64_t v89;
  void *v90;
  uint64_t v92;
  float64_t v93;
  float64_t v94;
  unsigned int v95;
  __int128 vars0;
  float64x2_t vars0a;
  float64_t v98;
  float64x2_t v99;

  v55 = a11;
  objc_msgSend(a1, "motionEffect");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "assertDocumentIsLocked");

  objc_msgSend(a1, "motionEffect");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "assertDocumentStatusIsLoadedOrReady");

  objc_msgSend(a1, "motionEffect");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "assertInspectablePropertiesAreLocked");
  v95 = a9;

  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kPVTopLevelTransformKey"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    *(_OWORD *)&STACK[0x730] = 0u;
    *(_OWORD *)&STACK[0x740] = 0u;
    *(_OWORD *)&STACK[0x710] = 0u;
    *(_OWORD *)&STACK[0x720] = 0u;
    *(_OWORD *)&STACK[0x6F0] = 0u;
    *(_OWORD *)&STACK[0x700] = 0u;
    *(_OWORD *)&STACK[0x6D0] = 0u;
    *(_OWORD *)&STACK[0x6E0] = 0u;
LABEL_4:
    objc_msgSend(v59, "SIMDDouble4x4");
    goto LABEL_5;
  }
  +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&STACK[0x730] = 0u;
  *(_OWORD *)&STACK[0x740] = 0u;
  *(_OWORD *)&STACK[0x710] = 0u;
  *(_OWORD *)&STACK[0x720] = 0u;
  *(_OWORD *)&STACK[0x6F0] = 0u;
  *(_OWORD *)&STACK[0x700] = 0u;
  *(_OWORD *)&STACK[0x6D0] = 0u;
  *(_OWORD *)&STACK[0x6E0] = 0u;
  if (v59)
    goto LABEL_4;
LABEL_5:
  v60 = *a7;
  STACK[0x6C0] = *((_QWORD *)a7 + 2);
  STACK[0x698] = 0;
  STACK[0x690] = 0;
  *(_OWORD *)&STACK[0x6A0] = 0u;
  *(_OWORD *)&STACK[0x6B0] = v60;
  LODWORD(v92) = a10;
  objc_msgSend(a1, "convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:", a5, &STACK[0x690], &STACK[0x6B0], a8, 1, 1, a2, a3, v92);
  vars0 = v62;
  v98 = v61;
  *(_OWORD *)&STACK[0x670] = 0u;
  *(_OWORD *)&STACK[0x680] = 0u;
  a46 = 0u;
  *(_OWORD *)&STACK[0x660] = 0u;
  a43 = *a7;
  a44 = *((_QWORD *)a7 + 2);
  objc_msgSend(a1, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a5, &a43, a8, 1, a10, v55, 1.0, 1.0, a2, a3);
  v63 = *(_OWORD *)&STACK[0x660];
  a39 = a46;
  a40 = v63;
  v64 = *(_OWORD *)&STACK[0x680];
  a41 = *(_OWORD *)&STACK[0x670];
  a42 = v64;
  quad_center = pv_CGPoint_get_quad_center((PVCGPointQuad *)&a39);
  v93 = v66;
  v94 = quad_center;
  v67 = 0;
  v68.f64[0] = v98;
  *(_QWORD *)&v68.f64[1] = vars0;
  v99 = v68;
  v69 = *(_OWORD *)(a6 + 48);
  *(_OWORD *)&STACK[0x770] = *(_OWORD *)(a6 + 32);
  *(_OWORD *)&STACK[0x780] = v69;
  v70 = *(_OWORD *)(a6 + 80);
  *(_OWORD *)&STACK[0x790] = *(_OWORD *)(a6 + 64);
  *(_OWORD *)&STACK[0x7A0] = v70;
  v71 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)&STACK[0x750] = *(_OWORD *)a6;
  *(_OWORD *)&STACK[0x760] = v71;
  *(_QWORD *)&v72 = 0;
  *((_QWORD *)&v72 + 1) = *(_QWORD *)(a6 + 120);
  a37 = 0u;
  a38 = 0u;
  a35 = 0u;
  a36 = 0u;
  a33 = 0u;
  a34 = 0u;
  a31 = 0u;
  a32 = 0u;
  v74 = *(float64x2_t *)&STACK[0x6D0];
  v73 = *(float64x2_t *)&STACK[0x6E0];
  v76 = *(float64x2_t *)&STACK[0x6F0];
  v75 = *(float64x2_t *)&STACK[0x700];
  v78 = *(float64x2_t *)&STACK[0x710];
  v77 = *(float64x2_t *)&STACK[0x720];
  v80 = *(float64x2_t *)&STACK[0x730];
  v79 = *(float64x2_t *)&STACK[0x740];
  STACK[0x7B8] = 0;
  STACK[0x7B0] = 0;
  *(_OWORD *)&STACK[0x7C0] = v72;
  do
  {
    v82 = *(float64x2_t *)((char *)&STACK[0x750] + v67);
    v81 = *(float64x2_t *)((char *)&STACK[0x750] + v67 + 16);
    v83 = (float64x2_t *)((char *)&a31 + v67);
    *v83 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v74, v82.f64[0]), v76, v82, 1), v78, v81.f64[0]), v80, v81, 1);
    v83[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v73, v82.f64[0]), v75, v82, 1), v77, v81.f64[0]), v79, v81, 1);
    v67 += 32;
  }
  while (v67 != 128);
  a27 = a35;
  a28 = a36;
  a29 = a37;
  a30 = a38;
  a23 = a31;
  a24 = a32;
  a25 = a33;
  a26 = a34;
  +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", &a23);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "applyTopLevelGroupTransform_NoLock:transform:", a5, v84);
  objc_msgSend(v55, "setObject:forKeyedSubscript:", v84, CFSTR("kPVTopLevelTransformKey"));
  vars0a = *(float64x2_t *)(a6 + 96);
  *(_OWORD *)&STACK[0x770] = 0u;
  *(_OWORD *)&STACK[0x780] = 0u;
  *(_OWORD *)&STACK[0x750] = 0u;
  *(_OWORD *)&STACK[0x760] = 0u;
  a20 = *a7;
  a21 = *((_QWORD *)a7 + 2);
  objc_msgSend(a1, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a5, &a20, a8, 1, a10, v55, 1.0, 1.0, a2, a3);
  v85 = *(_OWORD *)&STACK[0x760];
  a16 = *(_OWORD *)&STACK[0x750];
  a17 = v85;
  v86 = *(_OWORD *)&STACK[0x780];
  a18 = *(_OWORD *)&STACK[0x770];
  a19 = v86;
  v87.f64[0] = pv_CGPoint_get_quad_center((PVCGPointQuad *)&a16);
  v88.f64[0] = v94;
  v88.f64[1] = v93;
  v87.f64[1] = v89;
  a13 = *a7;
  a14 = *((_QWORD *)a7 + 2);
  objc_msgSend(a1, "setPositionInView_NoLock:viewPoint:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:topLevelTransform:properties:", a5, &a13, a8, a10, v95, v84, vaddq_f64(vars0a, vsubq_f64(v99, vsubq_f64(v87, v88))), a2, a3);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  return v90;
}

- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:
{
  int v8;
  int v9;
  char v10;
  uint64_t v13;
  CGFloat height;
  CGFloat width;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  PVMotionEffectTransformComponent *v27;
  uint64_t *v28;
  CGFloat v29;
  CGFloat v30;
  __int128 v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  BOOL v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  __n128 (*v40)(__n128 *, __n128 *);
  uint64_t (*v41)();
  void *v42;
  CGPoint result;

  v9 = v8;
  v10 = a8;
  v13 = a4;
  height = a7.height;
  width = a7.width;
  v22 = *(_OWORD *)&a3->var0;
  v23 = *(_OWORD *)&a3->var3;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x4012000000;
  v40 = __Block_byref_object_copy__53;
  v41 = __Block_byref_object_dispose__54;
  v42 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke;
  v24[3] = &unk_1E64D4978;
  v27 = self;
  v28 = &v37;
  v25 = v22;
  v26 = v23;
  v31 = *(_OWORD *)v13;
  v32 = *(_QWORD *)(v13 + 16);
  v34 = a5;
  v35 = a6;
  v36 = v10;
  v29 = width;
  v30 = height;
  v33 = v9;
  objc_msgSend(v17, "runEnsuringDocumentReadyAndLockingDocument:", v24);

  v18 = v38[6];
  v19 = v38[7];
  _Block_object_dispose(&v37, 8);
  v20 = v18;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

void __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  __int16 v17;
  char v18;

  objc_msgSend(*(id *)(a1 + 64), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2;
  v8[3] = &unk_1E64D4950;
  v6 = *(_OWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 80);
  v12 = a2;
  v7 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = v6;
  v9 = v7;
  v14 = *(_OWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 112);
  v17 = *(_WORD *)(a1 + 124);
  v18 = *(_BYTE *)(a1 + 126);
  v13 = v5;
  v16 = *(_DWORD *)(a1 + 120);
  objc_msgSend(v4, "runWithInspectableProperties:", v8);

}

void __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];
  __int128 v18;
  uint64_t v19;

  v3 = a2;
  v4 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 104);
  v17[1] = *(_OWORD *)(a1 + 48);
  v18 = v7;
  v19 = *(_QWORD *)(a1 + 120);
  v8 = *(unsigned __int8 *)(a1 + 132);
  v9 = *(unsigned __int8 *)(a1 + 133);
  v10 = *(unsigned __int8 *)(a1 + 134);
  *(_QWORD *)&v7 = *(_QWORD *)(a1 + 88);
  v11 = *(double *)(a1 + 96);
  v12 = *(_DWORD *)(a1 + 128);
  v17[0] = v6;
  LODWORD(v16) = v12;
  objc_msgSend(v4, "convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:", v5, v17, &v18, v8, v9, v10, *(double *)&v7, v11, v16, v3);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  *(_QWORD *)(v13 + 48) = v14;
  *(_QWORD *)(v13 + 56) = v15;

}

- (CGPoint)convertPointToView_NoLock:(const void *)a3 effectPoint:(id *)a4 atTime:(BOOL)a5 forcePosterFrame:(BOOL)a6 includeTransformAnimation:(BOOL)a7 includePlayableAspectScale:(CGSize)a8 viewSize:(int)a9 viewOrigin:(id)a10 properties:
{
  double height;
  double width;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  uint64_t v15;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  _OWORD v34[8];
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  CGPoint result;

  height = a8.height;
  width = a8.width;
  v12 = *(_QWORD *)&a9;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v31 = *(_OWORD *)&a4->var3;
  v32 = *(_OWORD *)&a4->var0;
  v18 = v45;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "assertInspectablePropertiesAreLocked");

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = *(_OWORD *)v15;
  v36 = *(_QWORD *)(v15 + 16);
  LODWORD(v30) = (_DWORD)a10;
  -[PVMotionEffectTransformComponent transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:](self, "transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:", a3, &v35, v14, v13, v12, 1, width, height, v30, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "SIMDDouble4x4");
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
  }

  v34[4] = v41;
  v34[5] = v42;
  v34[6] = v43;
  v34[7] = v44;
  v34[0] = v37;
  v34[1] = v38;
  v34[2] = v39;
  v34[3] = v40;
  v33[0] = v32;
  v33[1] = v31;
  -[PVMotionEffectTransformComponent convertPointToView_NoLock:effectPoint:withEffectToViewTransform:viewSize:](self, "convertPointToView_NoLock:effectPoint:withEffectToViewTransform:viewSize:", a3, v33, v34, width, height);
  v25 = v24;
  v27 = v26;

  v28 = v25;
  v29 = v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (double)convertPointToView:(double)a3 withEffectToViewTransform:(uint64_t)a4 viewSize:(__int128 *)a5
{
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  uint64_t *v31;
  double v32;
  double v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  __n128 (*v37)(__n128 *, __n128 *);
  uint64_t (*v38)();
  void *v39;

  v17 = *a5;
  v18 = a5[1];
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x4012000000;
  v37 = __Block_byref_object_copy__53;
  v38 = __Block_byref_object_dispose__54;
  v39 = &unk_1B3948866;
  objc_msgSend(a1, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__PVMotionEffectTransformComponent_convertPointToView_withEffectToViewTransform_viewSize___block_invoke;
  v19[3] = &unk_1E64D49A0;
  v30 = a1;
  v31 = &v34;
  v20 = v17;
  v21 = v18;
  v11 = a6[5];
  v26 = a6[4];
  v27 = v11;
  v12 = a6[7];
  v28 = a6[6];
  v29 = v12;
  v13 = a6[1];
  v22 = *a6;
  v23 = v13;
  v14 = a6[3];
  v24 = a6[2];
  v25 = v14;
  v32 = a2;
  v33 = a3;
  objc_msgSend(v10, "runEnsuringDocumentReadyAndLockingDocument:", v19);

  v15 = v35[6];
  _Block_object_dispose(&v34, 8);
  return v15;
}

uint64_t __90__PVMotionEffectTransformComponent_convertPointToView_withEffectToViewTransform_viewSize___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  _OWORD v16[8];

  v3 = *(void **)(a1 + 192);
  v5 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 144);
  v16[4] = *(_OWORD *)(a1 + 128);
  v16[5] = v6;
  v7 = *(_OWORD *)(a1 + 176);
  v16[6] = *(_OWORD *)(a1 + 160);
  v16[7] = v7;
  v8 = *(_OWORD *)(a1 + 80);
  v16[0] = *(_OWORD *)(a1 + 64);
  v16[1] = v8;
  v9 = *(_OWORD *)(a1 + 112);
  v16[2] = *(_OWORD *)(a1 + 96);
  v16[3] = v9;
  v10 = *(double *)(a1 + 208);
  *(_QWORD *)&v9 = *(_QWORD *)(a1 + 216);
  v15[0] = v5;
  v15[1] = v4;
  result = objc_msgSend(v3, "convertPointToView_NoLock:effectPoint:withEffectToViewTransform:viewSize:", a2, v15, v16, v10, *(double *)&v9);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8);
  *(_QWORD *)(v12 + 48) = v13;
  *(_QWORD *)(v12 + 56) = v14;
  return result;
}

- (float64_t)convertPointToView_NoLock:(uint64_t)a3 effectPoint:(float64x2_t *)a4 withEffectToViewTransform:(float64x2_t *)a5 viewSize:
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v12[2];
  float64x2_t v13;
  float64x2_t v14[8];

  v5 = *a4;
  v6 = a4[1];
  v7 = a5[5];
  v14[4] = a5[4];
  v14[5] = v7;
  v8 = a5[7];
  v14[6] = a5[6];
  v14[7] = v8;
  v9 = a5[1];
  v14[0] = *a5;
  v14[1] = v9;
  v10 = a5[3];
  v14[2] = a5[2];
  v14[3] = v10;
  v12[0] = v5;
  v12[1] = v6;
  pv_simd_matrix_transform_vector(v14, v12, &v13);
  return v13.f64[0];
}

- (void)convertPointFromView:(int)a3@<W3> atTime:(_OWORD *)a4@<X8> viewSize:(double)a5@<D0> viewOrigin:(double)a6@<D1>
{
  void *v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[10];
  __int128 v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x4020000000;
  v27 = 0;
  v28 = 0;
  v26 = 0;
  objc_msgSend(a1, "motionEffect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke;
  v19[3] = &unk_1E64D49F0;
  v19[4] = a1;
  v19[5] = &v23;
  *(double *)&v19[6] = a5;
  *(double *)&v19[7] = a6;
  v20 = *a2;
  v21 = *((_QWORD *)a2 + 2);
  *(double *)&v19[8] = a7;
  *(double *)&v19[9] = a8;
  v22 = a3;
  objc_msgSend(v16, "runEnsuringDocumentReadyAndLockingDocument:", v19);

  v17 = *((_OWORD *)v24 + 3);
  v18 = *((_OWORD *)v24 + 2);
  _Block_object_dispose(&v23, 8);
  *a4 = v18;
  a4[1] = v17;
}

void __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  v10 = v5;
  v6 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 80);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke_2;
  v7[3] = &unk_1E64D49C8;
  v9 = a2;
  v13 = *(_QWORD *)(a1 + 96);
  v11 = v6;
  v14 = *(_DWORD *)(a1 + 104);
  objc_msgSend(v4, "runWithInspectableProperties:", v7);

}

__n128 __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  __int128 v8;
  int8x16_t v9;
  unint64_t v10;
  uint64_t v11;
  __n128 result;
  int8x16_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 88);
  v15 = v8;
  v16 = *(_QWORD *)(a1 + 104);
  if (v4)
  {
    objc_msgSend(v4, "convertPointFromView_NoLock:viewPoint:atTime:viewSize:viewOrigin:properties:", v5, &v15, *(unsigned int *)(a1 + 112), v3, v6, v7, *(double *)(a1 + 72), *(double *)(a1 + 80));
    v9 = v13;
    v10 = vextq_s8(v9, v9, 8uLL).u64[0];
    *(_QWORD *)&v8 = v14;
  }
  else
  {
    v9.i64[0] = 0;
    v10 = 0;
    *(_QWORD *)&v8 = 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9.i64[1] = v10;
  *(int8x16_t *)(v11 + 32) = v9;
  *(_OWORD *)(v11 + 48) = v8;

  return result;
}

- (__n128)convertPointFromView_NoLock:(__int128 *)a3@<X3> viewPoint:(int)a4@<W4> atTime:(void *)a5@<X5> viewSize:(float64x2_t *)a6@<X8> viewOrigin:(double)a7@<D0> properties:(float64_t)a8@<D1>
{
  unint64_t v10;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  void *v28;
  _BOOL4 v29;
  double v30;
  void *v31;
  int v32;
  double v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  int v42;
  float64x2_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  float64x2_t *v48;
  void *v49;
  int v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  void *v55;
  double v56;
  double v57;
  unint64_t v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  __n128 v64;
  float64x2_t v65;
  int v66;
  float64x2_t v67;
  __n128 result;
  float64x2_t v69;
  float64x2_t v70;
  unint64_t v71;
  float64_t v72;
  void *v73;
  double v74;
  double v75;
  float64x2_t v76;
  float64_t v77;
  double v79;
  float64x2_t v80;
  float64x2_t v82;
  float64x2_t v83;
  unint64_t v84;
  _OWORD v85[2];
  char v86[128];
  CGAffineTransform v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  float64x2_t v91;
  float64x2_t v92;
  CGAffineTransform v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  float64x2_t v97;
  float64x2_t v98;
  CGAffineTransform t1;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  float64x2_t v103;
  float64x2_t v104;
  CGAffineTransform v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  float64x2_t v109;
  float64x2_t v110;
  CGAffineTransform v111;
  CGAffineTransform v112;
  PVTransformAnimationInfo v113;
  __int128 v114;
  uint64_t v115;
  CGAffineTransform t2;
  double v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGPoint v122;

  v18 = a5;
  objc_msgSend(a1, "motionEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertDocumentIsLocked");

  objc_msgSend(a1, "motionEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assertDocumentStatusIsLoadedOrReady");

  objc_msgSend(a1, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "assertInspectablePropertiesAreLocked");

  objc_msgSend(a1, "motionEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "playableScaleInView_NoLock:properties:", v18, a9, a10);
  v24 = v23;
  v25 = a9 * 0.5;
  v26 = a10 * 0.5;

  v27.f64[0] = a7;
  v27.f64[1] = a8;
  v82 = v27;
  if (fabs(v24 + -1.0) >= 0.0001)
  {
    memset(&v120, 0, sizeof(v120));
    CGAffineTransformMakeScale(&v120, 1.0 / v24, 1.0 / v24);
    memset(&v119, 0, sizeof(v119));
    CGAffineTransformMakeTranslation(&t1, -v25, -v26);
    t2 = v120;
    CGAffineTransformConcat(&v105, &t1, &t2);
    CGAffineTransformMakeTranslation(&v121, a9 * 0.5, a10 * 0.5);
    CGAffineTransformConcat(&v119, &v105, &v121);
    v120 = v119;
    v82 = vaddq_f64(*(float64x2_t *)&v119.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v119.a, a7), vmulq_laneq_f64(*(float64x2_t *)&v119.c, v82, 1)));
  }
  v117 = 0.0;
  memset(&t2, 0, sizeof(t2));
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kPVTransformAnimationKey"), PVTransformAnimationInfoIdentity((uint64_t)&t2));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = *a3;
  v115 = *((_QWORD *)a3 + 2);
  v29 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v28, &v114, 14, 0, &t2, a9, a10);

  v30 = v82.f64[1];
  if (v29)
  {
    memset(&v105, 0, sizeof(v105));
    *(_OWORD *)&v113.time.value = *(_OWORD *)&t2.a;
    *(_OWORD *)&v113.time.epoch = *(_OWORD *)&t2.c;
    *(_OWORD *)&v113.translation.y = *(_OWORD *)&t2.tx;
    v113.rotation = v117;
    v122.x = a9 * 0.5;
    v122.y = a10 * 0.5;
    CGAffineTransformFromPointWithPVAnimInfo(&v113, v122, (uint64_t)&v105);
    v111 = v105;
    CGAffineTransformInvert(&v112, &v111);
    v30 = v112.ty + v82.f64[0] * v112.b + v82.f64[1] * v112.d;
    v82.f64[0] = v112.tx + v82.f64[0] * v112.a + v82.f64[1] * v112.c;
  }
  LODWORD(v10) = *(_DWORD *)(a2 + 12);
  LODWORD(v24) = *(_DWORD *)(a2 + 16);
  objc_msgSend(a1, "motionEffect");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "origin");
  v79 = (double)v10;
  v33 = (double)*(unint64_t *)&v24;

  v34 = (double *)MEMORY[0x1E0C9D538];
  v35 = *MEMORY[0x1E0C9D538];
  v36 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (a4 == 2)
  {
    if (v32 != 1)
    {
      v37 = v79;
      if (!v32)
      {
        v35 = a9 * 0.5;
        v36 = a10 * 0.5;
      }
      goto LABEL_17;
    }
    v37 = v79;
  }
  else
  {
    if (a4 != 1)
    {
      v37 = v79;
      if (!a4)
      {
        if (v32 != 1)
        {
          if (v32 == 2)
          {
            v35 = a9 * -0.5;
            v36 = a10 * -0.5;
          }
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v37 = v79;
    if (!v32)
    {
LABEL_18:
      v25 = *MEMORY[0x1E0C9D538];
      v26 = a10;
      goto LABEL_20;
    }
    if (v32 != 2)
    {
LABEL_17:
      memset(&v120, 0, sizeof(v120));
      CGAffineTransformMakeScale(&v120, v37 / a9, v33 / a10);
      t1 = v120;
      CGAffineTransformTranslate(&v105, &t1, v35, v36);
      goto LABEL_21;
    }
    v25 = a9 * -0.5;
  }
LABEL_20:
  memset(&v120, 0, sizeof(v120));
  CGAffineTransformMakeScale(&v120, v37 / a9, v33 / a10);
  t1 = v120;
  CGAffineTransformTranslate(&v105, &t1, v25, v26);
  v120 = v105;
  v121 = v105;
  CGAffineTransformScale(&v105, &v121, 1.0, -1.0);
LABEL_21:
  v120 = v105;
  v38 = *(_OWORD *)&v105.a;
  v39 = *(_OWORD *)&v105.c;
  v40 = *(_OWORD *)&v105.tx;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kPVCameraEnabledKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");
  v43.f64[0] = *(double *)&v40 + v82.f64[0] * *(double *)&v38 + v30 * *(double *)&v39;
  v74 = *((double *)&v40 + 1) + v82.f64[0] * *((double *)&v38 + 1) + v30 * *((double *)&v39 + 1);
  v75 = v43.f64[0];
  v43.f64[1] = v74;
  v83 = v43;
  v76 = 0u;

  if (v42)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kPVTransformKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kPVCameraTransformKey"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kPVCameraProjectionKey"));
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    if (!v44 || !v45 || !v46)
    {
LABEL_36:

      goto LABEL_37;
    }
    v73 = v44;
    v48 = a6;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kPVTransformUnitsAreInMeters"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "BOOLValue");

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v106 = 0u;
    memset(&v105, 0, sizeof(v105));
    objc_msgSend(v73, "SIMDDouble4x4");
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v100 = 0u;
    memset(&t1, 0, sizeof(t1));
    objc_msgSend(v45, "SIMDDouble4x4");
    a6 = v48;
    if (v50)
    {
      v51.f64[0] = (float64_t)a1[5];
      *(_QWORD *)&v52.f64[0] = *(_OWORD *)&vmulq_f64(v110, v51);
      v52.f64[1] = v110.f64[1];
      v109 = vmulq_n_f64(v109, v51.f64[0]);
      v110 = v52;
      v53 = vmulq_n_f64(v103, v51.f64[0]);
      *(_QWORD *)&v54.f64[0] = *(_OWORD *)&vmulq_f64(v51, v104);
      v54.f64[1] = v104.f64[1];
      v103 = v53;
      v104 = v54;
    }
    v44 = v73;
    objc_msgSend(a1, "motionEffect");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "outputROI_NoLock:scale:", a2, 1.0);
    v77 = v56;
    v71 = v58;
    v72 = v57;
    v84 = v59;

    v60 = *v34;
    if (v32)
    {
      v61 = v79;
      if (v32 != 2)
      {
        v63 = v34[1];
        memset(&v118, 0, sizeof(v118));
        CGAffineTransformMakeScale(&v118, v79 / v79, v33 / v33);
        v120 = v118;
        CGAffineTransformTranslate(&v121, &v120, v60, v63);
        goto LABEL_33;
      }
      v60 = v79 * 0.5;
      v62 = v33 * 0.5;
    }
    else
    {
      v62 = v33;
      v61 = v79;
    }
    memset(&v118, 0, sizeof(v118));
    CGAffineTransformMakeScale(&v118, v61 / v61, v33 / v33);
    v120 = v118;
    CGAffineTransformTranslate(&v121, &v120, v60, v62);
    v118 = v121;
    v119 = v121;
    CGAffineTransformScale(&v121, &v119, 1.0, -1.0);
LABEL_33:
    v118 = v121;
    v69 = *(float64x2_t *)&v121.a;
    v70 = *(float64x2_t *)&v121.c;
    v80 = *(float64x2_t *)&v121.tx;
    memset(&v121, 0, 32);
    v95 = v107;
    v96 = v108;
    v97 = v109;
    v98 = v110;
    v93 = v105;
    v94 = v106;
    v89 = v101;
    v90 = v102;
    v91 = v103;
    v92 = v104;
    v87 = t1;
    v88 = v100;
    objc_msgSend(v47, "SIMDDouble4x4");
    v64.n128_u64[0] = v84;
    v64.n128_u64[1] = v71;
    v65.f64[0] = v77;
    v65.f64[1] = v72;
    v85[1] = 0u;
    v83 = vaddq_f64(v80, vaddq_f64(vmulq_n_f64(v69, v75), vmulq_n_f64(v70, v74)));
    v85[0] = vsubq_f64(v83, v65);
    v66 = pv_simd_matrix_unproject_to_plane(v85, 2, &v93, &v87, v86, 1, 0, 1, v64, &v121);
    v67 = 0uLL;
    if (v66)
    {
      v67 = *(float64x2_t *)&v121.c;
      v83 = *(float64x2_t *)&v121.a;
    }
    v76 = v67;
    goto LABEL_36;
  }
LABEL_37:

  result = (__n128)v83;
  *a6 = v83;
  a6[1] = v76;
  return result;
}

- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v15;
  id v16;
  _QWORD v18[10];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  height = a5.height;
  width = a5.width;
  y = a3.y;
  x = a3.x;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke;
  v18[3] = &unk_1E64D4A40;
  v18[4] = self;
  v18[5] = &v22;
  *(CGFloat *)&v18[6] = x;
  *(CGFloat *)&v18[7] = y;
  v19 = *a4;
  *(CGFloat *)&v18[8] = width;
  *(CGFloat *)&v18[9] = height;
  v20 = a6;
  v21 = a7;
  objc_msgSend(v15, "runEnsuringDocumentReadyAndLockingDocument:", v18);

  v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  char v15;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  v10 = v5;
  v6 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 80);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke_2;
  v7[3] = &unk_1E64D4A18;
  v9 = a2;
  v13 = *(_QWORD *)(a1 + 96);
  v11 = v6;
  v14 = *(_DWORD *)(a1 + 104);
  v15 = *(_BYTE *)(a1 + 108);
  objc_msgSend(v4, "runWithInspectableProperties:", v7);

}

void __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kPVTopLevelTransformKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timelineComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isForceRenderAtPosterFrameEnabled:", v3);

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  v11 = *(double *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 88);
  v16 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v8, "setPositionInView_NoLock:viewPoint:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:topLevelTransform:properties:", v9, &v15, v7, *(unsigned int *)(a1 + 112), *(unsigned __int8 *)(a1 + 116), v4, v10, v11, *(double *)(a1 + 72), *(double *)(a1 + 80), v3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)setPositionInView_NoLock:(const void *)a3 viewPoint:(CGPoint)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8 restrictToBounds:(BOOL)a9 topLevelTransform:(id)a10 properties:(id)a11
{
  _BOOL4 v11;
  uint64_t v12;
  double height;
  double width;
  _BOOL8 v15;
  CGFloat v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  double v26;
  double v27;
  double quad_center;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat MaxY;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  double v46;
  uint64_t v47;
  __int128 v48;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MinX;
  float64_t v53;
  float64_t v54;
  float64_t v55;
  float64_t v56;
  __int128 vars0;
  __int128 vars0a;
  CGFloat x;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  int64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  int64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  int64_t var3;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v11 = a9;
  v12 = *(_QWORD *)&a8;
  height = a7.height;
  width = a7.width;
  v15 = a6;
  vars0 = *(__int128 *)&a4.y;
  x = a4.x;
  v19 = a4.x;
  v20 = a10;
  v21 = *(id *)&v19;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "assertInspectablePropertiesAreLocked");

  if (v11)
  {
    v25 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v88 = 0;
    v87 = 0;
    v89 = 0u;
    v90 = v25;
    -[PVMotionEffectTransformComponent convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:](self, "convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:", a3, &v87, &v90, v15, 1, 1, width, height);
    v55 = v27;
    v56 = v26;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v85 = *(_OWORD *)&a5->var0;
    v86 = a5->var3;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v85, v15, 1, v12, v21, 1.0, 1.0, width, height);
    v81 = v69;
    v82 = v70;
    v83 = v71;
    v84 = v72;
    quad_center = pv_CGPoint_get_quad_center((PVCGPointQuad *)&v81);
    v53 = v29;
    v54 = quad_center;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "playableRectInView_NoLock:properties:", v21, width, height);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v92.origin.x = v32;
    v92.origin.y = v34;
    v92.size.width = v36;
    v92.size.height = v38;
    MinX = CGRectGetMinX(v92);
    v93.origin.x = v32;
    v93.origin.y = v34;
    v93.size.width = v36;
    v93.size.height = v38;
    MinY = CGRectGetMinY(v93);
    v94.origin.x = v32;
    v94.origin.y = v34;
    v94.size.width = v36;
    v94.size.height = v38;
    MaxX = CGRectGetMaxX(v94);
    v95.origin.x = v32;
    v95.origin.y = v34;
    v95.size.width = v36;
    v95.size.height = v38;
    MaxY = CGRectGetMaxY(v95);
    v40.f64[0] = v54;
    v40.f64[1] = v53;
    v41.f64[0] = v56;
    v41.f64[1] = v55;
    v42 = vsubq_f64(v40, v41);
    v43.f64[0] = x;
    *(_QWORD *)&v43.f64[1] = vars0;
    v40.f64[0] = MinX;
    v40.f64[1] = MinY;
    v44.f64[0] = MaxX;
    v44.f64[1] = MaxY;
    v45 = vsubq_f64(vminnmq_f64(vmaxnmq_f64(vaddq_f64(v43, v42), v40), v44), v42);
    v46 = v45.f64[1];
  }
  else
  {
    v46 = *(double *)&vars0;
    v45.f64[0] = x;
  }
  v79 = *(_OWORD *)&a5->var0;
  v80 = a5->var3;
  -[PVMotionEffectTransformComponent convertPointFromView_NoLock:viewPoint:atTime:viewSize:viewOrigin:properties:](self, "convertPointFromView_NoLock:viewPoint:atTime:viewSize:viewOrigin:properties:", a3, &v79, v12, v21, v45.f64[0], v46, width, height);
  vars0a = v77;
  v60 = (id)v78;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  if (v20)
  {
    objc_msgSend(v20, "SIMDDouble4x4");
    v47 = *((_QWORD *)&v76 + 1);
  }
  else
  {
    v73 = 0uLL;
    v74 = 0uLL;
    v71 = 0uLL;
    v72 = 0uLL;
    v47 = 0;
    v69 = 0uLL;
    v70 = 0uLL;
  }
  *(_QWORD *)&v48 = v60;
  *((_QWORD *)&v48 + 1) = v47;
  v75 = vars0a;
  v76 = v48;
  v65 = v73;
  v66 = v74;
  v61 = v69;
  v62 = v70;
  v63 = v71;
  v64 = v72;
  v67 = vars0a;
  v68 = v48;
  objc_msgSend(v20, "setSIMDDouble4x4:", &v61);
  -[PVMotionEffectTransformComponent applyTopLevelGroupTransform_NoLock:transform:](self, "applyTopLevelGroupTransform_NoLock:transform:", a3, v20);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("kPVTopLevelTransformKey"));

  return v20;
}

- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v14;
  CGFloat v15;
  CGFloat y;
  CGFloat x;
  void *v19;
  id v20;
  _QWORD v22[12];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  int v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  height = a6.height;
  width = a6.width;
  v14 = a3.size.height;
  v15 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke;
  v22[3] = &unk_1E64D4A90;
  v22[4] = self;
  v22[5] = &v27;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  *(CGFloat *)&v22[8] = v15;
  *(CGFloat *)&v22[9] = v14;
  v23 = *a4;
  v25 = a5;
  *(CGFloat *)&v22[10] = width;
  *(CGFloat *)&v22[11] = height;
  v24 = a7;
  v26 = a8;
  objc_msgSend(v19, "runEnsuringDocumentReadyAndLockingDocument:", v22);

  v20 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v20;
}

void __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 80);
  v12 = v5;
  v13 = v6;
  v8 = *(_OWORD *)(a1 + 96);
  v14 = v7;
  v15 = v8;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke_2;
  v9[3] = &unk_1E64D4A68;
  v11 = a2;
  v16 = *(_QWORD *)(a1 + 112);
  v18 = *(_BYTE *)(a1 + 124);
  v17 = *(_DWORD *)(a1 + 120);
  v19 = *(_BYTE *)(a1 + 125);
  objc_msgSend(v4, "runWithInspectableProperties:", v9);

}

void __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v8 = *(double *)(a1 + 72);
  v9 = *(double *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 104);
  v14 = *(_QWORD *)(a1 + 120);
  objc_msgSend(v4, "scaleToFit_NoLock:rect:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:properties:", v5, &v13, *(unsigned __int8 *)(a1 + 132), *(unsigned int *)(a1 + 128), *(unsigned __int8 *)(a1 + 133), v3, v6, v7, v8, v9, *(double *)(a1 + 88), *(double *)(a1 + 96));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)scaleToFit_NoLock:(const void *)a3 rect:(CGRect)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8 restrictToBounds:(BOOL)a9 properties:(id)a10
{
  _BOOL8 v10;
  uint64_t v11;
  double height;
  double width;
  _BOOL8 v14;
  double v16;
  double v17;
  CGFloat y;
  CGFloat x;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  id v34;
  double MidX;
  double MidY;
  __int128 v37;
  double v38;
  void *v39;
  __int128 v41;
  int64_t v42;
  _OWORD v43[8];
  PVCGPointQuad v44;
  __int128 v45;
  int64_t v46;
  PVCGPointQuad v47;
  __int128 v48;
  int64_t v49;
  _OWORD v50[8];
  __int128 v51;
  int64_t v52;
  PVCGPointQuad v53;
  __int128 v54;
  int64_t var3;
  PVCGPointQuad v56;
  CGRect v57;
  CGRect v58;

  v10 = a9;
  v11 = *(_QWORD *)&a8;
  height = a7.height;
  width = a7.width;
  v14 = a6;
  v16 = a4.size.height;
  v17 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = a10;
  if (self->_isFixedSourceDropShadow)
  {
    v54 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v54, v14, 0, v11, v22, 1.0, 1.0, width, height);
    pv_bounding_CGRect(&v56);
    v24 = v16 - height * self->_normalizedFixedShadowSize.height;
    v25 = (v17 - width * self->_normalizedFixedShadowSize.width) / v23;
    v27 = v26 * v25;
    v28 = v24 / v26;
    v29 = v27 <= v24;
  }
  else
  {
    v51 = *(_OWORD *)&a5->var0;
    v52 = a5->var3;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v51, v14, 1, v11, v22, 1.0, 1.0, width, height);
    pv_bounding_CGRect(&v53);
    v25 = v17 / v23;
    v31 = v30 * (v17 / v23);
    v28 = v16 / v30;
    v29 = v31 <= v16;
  }
  if (!v29)
    v25 = v28;
  v32 = v23 * v25 / v23;
  *(_QWORD *)&v33 = 0;
  *((double *)&v33 + 1) = v32;
  v50[0] = *(unint64_t *)&v32;
  v50[1] = 0u;
  v50[2] = v33;
  memset(&v50[3], 0, 32);
  v50[5] = xmmword_1B304EED0;
  v50[6] = 0u;
  v50[7] = xmmword_1B304EEE0;
  v48 = *(_OWORD *)&a5->var0;
  v49 = a5->var3;
  v34 = -[PVMotionEffectTransformComponent addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:](self, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", a3, v50, &v48, v14, 0, v11, width, height, v22);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = v17;
  v57.size.height = v16;
  MidX = CGRectGetMidX(v57);
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = v17;
  v58.size.height = v16;
  MidY = CGRectGetMidY(v58);
  memset(&v47, 0, sizeof(v47));
  v45 = *(_OWORD *)&a5->var0;
  v46 = a5->var3;
  -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v45, v14, 1, v11, v22, 1.0, 1.0, width, height);
  v44 = v47;
  *(double *)&v37 = MidX - pv_CGPoint_get_quad_center(&v44);
  *((double *)&v37 + 1) = MidY - v38;
  v43[0] = xmmword_1B304EED0;
  v43[1] = 0u;
  v43[2] = xmmword_1B304EEE0;
  memset(&v43[3], 0, 32);
  v43[5] = xmmword_1B304EED0;
  v43[6] = v37;
  v43[7] = xmmword_1B304EEE0;
  v41 = *(_OWORD *)&a5->var0;
  v42 = a5->var3;
  -[PVMotionEffectTransformComponent addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:](self, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", a3, v43, &v41, v14, v10, v11, width, height, v22);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)topLevelGroupTransform
{
  void *v2;
  void *v3;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transformObjectForKey:", CFSTR("kPVTopLevelTransformKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setTopLevelGroupTransform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PVMotionEffectTransformComponent *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[7];
  _QWORD v15[3];
  char v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (v4)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInspectableProperty:forKey:", v4, CFSTR("kPVTopLevelTransformKey"));

    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__0;
    v17[4] = __Block_byref_object_dispose__0;
    v18 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke;
    v14[3] = &unk_1E64D4AB8;
    v14[4] = self;
    v14[5] = v17;
    v14[6] = v15;
    objc_msgSend(v6, "runWithInspectableProperties:", v14);

    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke_2;
    v9[3] = &unk_1E64D4AE0;
    v10 = v4;
    v11 = self;
    v12 = v17;
    v13 = v15;
    objc_msgSend(v8, "runEnsuringDocumentReadyAndLockingDocument:", v9);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v17, 8);

  }
}

void __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "additionalTopLevelScaleInDictionary:orInDefaultDictionary:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isForceRenderAtPosterFrameEnabledInDictionary:orInDefaultDictionary:", v6, 0);
}

void __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGSize size;
  double MidX;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  CGRect v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  CGRect v32;

  v4 = *(id *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v30 = 0uLL;
    v31 = 0;
    objc_msgSend(*(id *)(a1 + 40), "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timelineComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v28 = *MEMORY[0x1E0CA2E68];
    v29 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    if (v6)
    {
      objc_msgSend(v6, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v28, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), a2);
    }
    else
    {
      v30 = 0uLL;
      v31 = 0;
    }

    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    __asm { FMOV            V0.2D, #-1.0 }
    v27.size = _Q0;
    v13 = *(void **)(a1 + 40);
    v14 = *(unsigned int *)(a2 + 160);
    v25 = v30;
    v26 = v31;
    if (!objc_msgSend(v13, "objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:", &v27, v14, &v25, 1, 1, a2))
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "CGPointValue");
      v17 = v16;
      v19 = v18;
      x = v27.origin.x;
      y = v27.origin.y;
      size = v27.size;
      MidX = CGRectGetMidX(v27);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size = size;
      objc_msgSend(v15, "applyAdditionalTopLevelScale:aroundPoint:toTransform:", v4, v17, v19, MidX, CGRectGetMidY(v32));
      v24 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v24;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "applyTopLevelGroupTransform_NoLock:transform:", a2, v4);

}

- (void)applyTopLevelGroupTransform_NoLock:(const void *)a3 transform:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t i;
  void *v12;
  void *v13;
  _OWORD v14[16];
  _OWORD v15[8];
  __int128 v16[8];

  v6 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentStatusIsLoadedOrReady");

  if (v6 && !*((_DWORD *)a3 + 41))
  {
    objc_msgSend(v6, "SIMDDouble4x4");
    v9 = 0;
    v15[4] = v14[12];
    v15[5] = v14[13];
    v15[6] = v14[14];
    v15[7] = v14[15];
    v15[0] = v14[8];
    v15[1] = v14[9];
    v10 = v16;
    v15[2] = v14[10];
    v15[3] = v14[11];
    do
    {
      for (i = 0; i != 4; ++i)
        *((_QWORD *)v10 + i) = *((_QWORD *)&v15[2 * i] + (v9 & 3));
      ++v9;
      v10 += 2;
    }
    while (v9 != 4);
    OZXSetObjectTransform(*(_QWORD *)a3, MEMORY[0x1E0CA2E68], *((_DWORD *)a3 + 40), v16);
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SIMDDouble4x4");
    +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didSetCacheInvalidatingParameter_NoLock:forKey:", v13, CFSTR("kPVTopLevelTransformKey"));

  }
}

- (void)setTransform:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__PVMotionEffectTransformComponent_setTransform___block_invoke;
  v13[3] = &unk_1E64D4730;
  v15 = v16;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "runWithInspectableProperties:", v13);

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__PVMotionEffectTransformComponent_setTransform___block_invoke_2;
  v10[3] = &unk_1E64D4B08;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  v12 = v16;
  objc_msgSend(v8, "runEnsuringDocumentReadyAndLockingDocument:", v10);

  _Block_object_dispose(v16, 8);
}

void __49__PVMotionEffectTransformComponent_setTransform___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVTransformUnitsAreInMeters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("kPVTransformKey"));
}

uint64_t __49__PVMotionEffectTransformComponent_setTransform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransform_NoLock:transform:transformUnitsAreInMeters:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (__n128)getScale
{
  __n128 result;

  __asm { FMOV            V0.2D, #1.0 }
  *a1 = result;
  a1[1] = result;
  return result;
}

- (BOOL)setTransform_NoLock:(const void *)a3 transform:(id)a4 transformUnitsAreInMeters:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t i;
  uint64_t j;
  _OWORD *v20;
  __int128 v21;
  int v22;
  void *v23;
  _OWORD var30[4];
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  float64x2_t v32;
  float64x2_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v5 = a5;
  v8 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentStatusIsLoadedOrReady");

  if (v8
    && !-[PVMotionEffectTransformComponent encloseTopGroupIn3DGroupOnce_NoLock:](self, "encloseTopGroupIn3DGroupOnce_NoLock:", a3)|| self->_top3DGroupIDStatus)
  {
    v11 = 0;
  }
  else
  {
    v43 = 0x3FF0000000000000;
    v40 = 0x3FF0000000000000;
    v37 = 0x3FF0000000000000;
    v34 = 0x3FF0000000000000;
    v35 = 0u;
    v36 = 0u;
    v38 = 0u;
    v39 = 0u;
    v41 = 0u;
    v42 = 0u;
    if (v8)
    {
      v32 = 0uLL;
      v33 = 0uLL;
      v30 = 0uLL;
      v31 = 0uLL;
      v28 = 0uLL;
      v29 = 0uLL;
      v26 = 0uLL;
      v27 = 0uLL;
      objc_msgSend(v8, "SIMDDouble4x4");
      if (v5)
      {
        v13.f64[0] = self->_metersToWorldUnitScale;
        v14 = vmulq_n_f64(v32, v13.f64[0]);
        *(_QWORD *)&v15.f64[0] = *(_OWORD *)&vmulq_f64(v33, v13);
        v15.f64[1] = v33.f64[1];
        v32 = v14;
        v33 = v15;
      }
      v16 = 0;
      var30[0] = v26;
      var30[1] = v27;
      v17 = v25;
      var30[2] = v28;
      var30[3] = v29;
      do
      {
        for (i = 0; i != 4; ++i)
          *(_QWORD *)&v17[8 * i] = *(_QWORD *)((unint64_t)&var30[2 * i] & 0xFFFFFFFFFFFFFFE7 | (8 * (v16 & 3)));
        ++v16;
        v17 += 32;
      }
      while (v16 != 4);
      for (j = 0; j != 128; j += 32)
      {
        v20 = (_OWORD *)((char *)&v34 + j);
        v21 = *(_OWORD *)&v25[j + 16];
        *v20 = *(_OWORD *)&v25[j];
        v20[1] = v21;
      }
    }
    v22 = OZXSetObjectTransform(*(_QWORD *)a3, MEMORY[0x1E0CA2E68], self->_top3DGroupID, (__int128 *)&v34);
    v11 = v22 == 0;
    if (!v22)
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didSetCacheInvalidatingParameter_NoLock:forKey:", v8, CFSTR("kPVTransformKey"));

    }
  }

  return v11;
}

- (BOOL)setCameraTransform_NoLock:(const void *)a3 transform:(id)a4 transformUnitsAreInMeters:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t i;
  uint64_t j;
  _OWORD *v19;
  __int128 v20;
  void *v22;
  _OWORD var30[4];
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  float64x2_t v31;
  float64x2_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v5 = a5;
  v8 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentStatusIsLoadedOrReady");

  if (v8 && self->_cameraIDStatus == 1)
    -[PVMotionEffectTransformComponent addCameraToDocumentOnce_NoLock:](self, "addCameraToDocumentOnce_NoLock:", a3);
  if (!self->_cameraIDStatus)
  {
    v42 = 0x3FF0000000000000;
    v39 = 0x3FF0000000000000;
    v36 = 0x3FF0000000000000;
    v33 = 0x3FF0000000000000;
    v34 = 0u;
    v35 = 0u;
    v37 = 0u;
    v38 = 0u;
    v40 = 0u;
    v41 = 0u;
    if (v8)
    {
      v31 = 0uLL;
      v32 = 0uLL;
      v29 = 0uLL;
      v30 = 0uLL;
      v27 = 0uLL;
      v28 = 0uLL;
      v25 = 0uLL;
      v26 = 0uLL;
      objc_msgSend(v8, "SIMDDouble4x4");
      if (v5)
      {
        v12.f64[0] = self->_metersToWorldUnitScale;
        v13 = vmulq_n_f64(v31, v12.f64[0]);
        *(_QWORD *)&v14.f64[0] = *(_OWORD *)&vmulq_f64(v32, v12);
        v14.f64[1] = v32.f64[1];
        v31 = v13;
        v32 = v14;
      }
      v15 = 0;
      var30[0] = v25;
      var30[1] = v26;
      v16 = v24;
      var30[2] = v27;
      var30[3] = v28;
      do
      {
        for (i = 0; i != 4; ++i)
          *(_QWORD *)&v16[8 * i] = *(_QWORD *)((unint64_t)&var30[2 * i] & 0xFFFFFFFFFFFFFFE7 | (8 * (v15 & 3)));
        ++v15;
        v16 += 32;
      }
      while (v15 != 4);
      for (j = 0; j != 128; j += 32)
      {
        v19 = (_OWORD *)((char *)&v33 + j);
        v20 = *(_OWORD *)&v24[j + 16];
        *v19 = *(_OWORD *)&v24[j];
        v19[1] = v20;
      }
    }
    if (OZXSetCameraTransform(*(_QWORD *)a3, self->_cameraID, (__int128 *)&v33))
    {
      v11 = 0;
      goto LABEL_17;
    }
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didSetCacheInvalidatingParameter_NoLock:forKey:", v8, CFSTR("kPVCameraTransformKey"));

  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (id)cameraTransform
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _OWORD v15[8];
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)();
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v21 = 0;
  v22 = &v21;
  v23 = 0xB012000000;
  v24 = __Block_byref_object_copy__63;
  v25 = __Block_byref_object_dispose__64;
  v36 = 0x3FF0000000000000;
  v33 = 0x3FF0000000000000;
  v30 = 0x3FF0000000000000;
  v26 = &unk_1B3948866;
  v27 = 0x3FF0000000000000;
  v28 = 0u;
  v29 = 0u;
  v31 = 0u;
  v32 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 11;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__PVMotionEffectTransformComponent_cameraTransform__block_invoke;
  v16[3] = &unk_1E64D4B30;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v21;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v16);

  if (*((_DWORD *)v18 + 6))
  {
    +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)&v5 = v22[6];
    *(_QWORD *)&v6 = v22[7];
    *((_QWORD *)&v5 + 1) = v22[10];
    *(_QWORD *)&v7 = v22[14];
    *(_QWORD *)&v8 = v22[15];
    *((_QWORD *)&v7 + 1) = v22[18];
    *((_QWORD *)&v6 + 1) = v22[11];
    *((_QWORD *)&v8 + 1) = v22[19];
    *(_QWORD *)&v9 = v22[8];
    *(_QWORD *)&v10 = v22[9];
    *((_QWORD *)&v9 + 1) = v22[12];
    *(_QWORD *)&v11 = v22[16];
    *(_QWORD *)&v12 = v22[17];
    *((_QWORD *)&v11 + 1) = v22[20];
    *((_QWORD *)&v10 + 1) = v22[13];
    *((_QWORD *)&v12 + 1) = v22[21];
    v15[0] = v5;
    v15[1] = v7;
    v15[2] = v6;
    v15[3] = v8;
    v15[4] = v9;
    v15[5] = v11;
    v15[6] = v10;
    v15[7] = v12;
    +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", v15);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v4;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __51__PVMotionEffectTransformComponent_cameraTransform__block_invoke(uint64_t result, uint64_t *a2)
{
  _QWORD *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 36);
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = (_QWORD *)result;
    result = OZXGetCameraTransform(*a2, *(_DWORD *)(v2[4] + 32), (_QWORD *)(*(_QWORD *)(v2[6] + 8) + 48));
    *(_DWORD *)(*(_QWORD *)(v2[5] + 8) + 24) = result;
  }
  return result;
}

- (BOOL)setCameraProjection_NoLock:(const void *)a3 transform:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t i;
  uint64_t j;
  _OWORD *v14;
  __int128 v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[8];
  _BYTE v27[128];
  double v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v6 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentStatusIsLoadedOrReady");

  if (v6 && self->_cameraIDStatus == 1)
    -[PVMotionEffectTransformComponent addCameraToDocumentOnce_NoLock:](self, "addCameraToDocumentOnce_NoLock:", a3);
  if (!self->_cameraIDStatus)
  {
    v37 = 0x3FF0000000000000;
    v34 = 0x3FF0000000000000;
    v31 = 0x3FF0000000000000;
    v28 = 1.0;
    v29 = 0u;
    v30 = 0u;
    v32 = 0u;
    v33 = 0u;
    v35 = 0u;
    v36 = 0u;
    if (v6)
    {
      objc_msgSend(v6, "SIMDDouble4x4");
      v10 = 0;
      v26[4] = v22;
      v26[5] = v23;
      v26[6] = v24;
      v26[7] = v25;
      v26[0] = v18;
      v26[1] = v19;
      v11 = v27;
      v26[2] = v20;
      v26[3] = v21;
      do
      {
        for (i = 0; i != 4; ++i)
          *(_QWORD *)&v11[8 * i] = *((_QWORD *)&v26[2 * i] + (v10 & 3));
        ++v10;
        v11 += 32;
      }
      while (v10 != 4);
      for (j = 0; j != 128; j += 32)
      {
        v14 = (_OWORD *)((char *)&v28 + j);
        v15 = *(_OWORD *)&v27[j + 16];
        *v14 = *(_OWORD *)&v27[j];
        v14[1] = v15;
      }
    }
    if (OZXSetCameraProjection(*(_QWORD *)a3, self->_cameraID, &v28)
      || OZXGetCameraWorldUnitScaleIgnoringAspect(*(void **)a3, self->_cameraID, &self->_metersToWorldUnitScale))
    {
      v9 = 0;
      goto LABEL_16;
    }
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didSetCacheInvalidatingParameter_NoLock:forKey:", v6, CFSTR("kPVCameraProjectionKey"));

  }
  v9 = 1;
LABEL_16:

  return v9;
}

- (id)cameraProjection
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _OWORD v15[8];
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)();
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v21 = 0;
  v22 = &v21;
  v23 = 0xB012000000;
  v24 = __Block_byref_object_copy__63;
  v25 = __Block_byref_object_dispose__64;
  v36 = 0x3FF0000000000000;
  v33 = 0x3FF0000000000000;
  v30 = 0x3FF0000000000000;
  v26 = &unk_1B3948866;
  v27 = 0x3FF0000000000000;
  v28 = 0u;
  v29 = 0u;
  v31 = 0u;
  v32 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 11;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__PVMotionEffectTransformComponent_cameraProjection__block_invoke;
  v16[3] = &unk_1E64D4B30;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v21;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v16);

  if (*((_DWORD *)v18 + 6))
  {
    +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)&v5 = v22[6];
    *(_QWORD *)&v6 = v22[7];
    *((_QWORD *)&v5 + 1) = v22[10];
    *(_QWORD *)&v7 = v22[14];
    *(_QWORD *)&v8 = v22[15];
    *((_QWORD *)&v7 + 1) = v22[18];
    *((_QWORD *)&v6 + 1) = v22[11];
    *((_QWORD *)&v8 + 1) = v22[19];
    *(_QWORD *)&v9 = v22[8];
    *(_QWORD *)&v10 = v22[9];
    *((_QWORD *)&v9 + 1) = v22[12];
    *(_QWORD *)&v11 = v22[16];
    *(_QWORD *)&v12 = v22[17];
    *((_QWORD *)&v11 + 1) = v22[20];
    *((_QWORD *)&v10 + 1) = v22[13];
    *((_QWORD *)&v12 + 1) = v22[21];
    v15[0] = v5;
    v15[1] = v7;
    v15[2] = v6;
    v15[3] = v8;
    v15[4] = v9;
    v15[5] = v11;
    v15[6] = v10;
    v15[7] = v12;
    +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", v15);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v4;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __52__PVMotionEffectTransformComponent_cameraProjection__block_invoke(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 36);
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = (_QWORD *)result;
    result = OZXGetCameraProjection(*a2, *(unsigned int *)(v2[4] + 32), *(_QWORD *)(v2[6] + 8) + 48);
    *(_DWORD *)(*(_QWORD *)(v2[5] + 8) + 24) = result;
  }
  return result;
}

- (void)disableCameraOverride
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInspectableProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kPVCameraEnabledKey"));

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PVMotionEffectTransformComponent_disableCameraOverride__block_invoke;
  v5[3] = &unk_1E64D4B58;
  v5[4] = self;
  objc_msgSend(v4, "runEnsuringDocumentReadyAndLockingDocument:", v5);

}

uint64_t __57__PVMotionEffectTransformComponent_disableCameraOverride__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "disableCameraOverride_NoLock:", a2);
}

- (void)enableCameraOverride:(id)a3 projection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke;
  v19[3] = &unk_1E64D4B80;
  v10 = v6;
  v20 = v10;
  v11 = v7;
  v21 = v11;
  v22 = v23;
  objc_msgSend(v8, "runWithInspectableProperties:", v19);

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke_2;
  v15[3] = &unk_1E64D4BA8;
  v15[4] = self;
  v13 = v10;
  v16 = v13;
  v14 = v11;
  v17 = v14;
  v18 = v23;
  objc_msgSend(v12, "runEnsuringDocumentReadyAndLockingDocument:", v15);

  _Block_object_dispose(v23, 8);
}

void __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kPVCameraEnabledKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[4], CFSTR("kPVCameraTransformKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[5], CFSTR("kPVCameraProjectionKey"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVTransformUnitsAreInMeters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "BOOLValue");

}

uint64_t __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableCameraOverride_NoLock:transform:projection:transformUnitsAreInMeters:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
}

- (BOOL)disableCameraOverride_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  BOOL result;
  int v8;
  void *v9;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  if (self->_cameraIDStatus)
    return 1;
  v8 = OZXEnableCamera(*(void **)a3, self->_cameraID, 0);
  result = 0;
  if (!v8)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kPVCameraEnabledKey"));

    return 1;
  }
  return result;
}

- (BOOL)enableCameraOverride_NoLock:(const void *)a3 transform:(id)a4 projection:(id)a5 transformUnitsAreInMeters:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int cameraIDStatus;
  BOOL v15;
  void *v17;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertDocumentStatusIsLoadedOrReady");

  cameraIDStatus = self->_cameraIDStatus;
  if (cameraIDStatus == 1)
  {
    -[PVMotionEffectTransformComponent addCameraToDocumentOnce_NoLock:](self, "addCameraToDocumentOnce_NoLock:", a3);
    cameraIDStatus = self->_cameraIDStatus;
  }
  if (!cameraIDStatus)
  {
    if (OZXEnableCamera(*(void **)a3, self->_cameraID, 1))
      goto LABEL_7;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kPVCameraEnabledKey"));

  }
  if (!-[PVMotionEffectTransformComponent setCameraTransform_NoLock:transform:transformUnitsAreInMeters:](self, "setCameraTransform_NoLock:transform:transformUnitsAreInMeters:", a3, v10, v6))
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v15 = -[PVMotionEffectTransformComponent setCameraProjection_NoLock:transform:](self, "setCameraProjection_NoLock:transform:", a3, v11);
LABEL_8:

  return v15;
}

- (BOOL)isCameraOverrideEnabled
{
  PVMotionEffectTransformComponent *v2;
  void *v3;
  _QWORD v5[7];
  _QWORD v6[3];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 11;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PVMotionEffectTransformComponent_isCameraOverrideEnabled__block_invoke;
  v5[3] = &unk_1E64D4B30;
  v5[4] = v2;
  v5[5] = v6;
  v5[6] = &v8;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

uint64_t __59__PVMotionEffectTransformComponent_isCameraOverrideEnabled__block_invoke(uint64_t result, void **a2)
{
  _QWORD *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 36);
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = (_QWORD *)result;
    result = OZXGetIsCameraEnabled(*a2, *(_DWORD *)(v2[4] + 32), (BOOL *)(*(_QWORD *)(v2[6] + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(v2[5] + 8) + 24) = result;
  }
  return result;
}

- (BOOL)transformUnitsAreInMeters
{
  void *v2;
  char v3;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPVTransformUnitsAreInMeters"));

  return v3;
}

- (void)setTransformUnitsAreInMeters:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("kPVTransformUnitsAreInMeters"));

}

- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  char v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  CGSize v23;
  _QWORD v25[7];
  __int128 v26;
  int64_t var3;
  char v28;
  BOOL v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  __n128 (*v38)(uint64_t, uint64_t);
  uint64_t (*v39)();
  void *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;

  if (!a3)
    return 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x5012000000;
  v38 = __Block_byref_object_copy__67;
  v39 = __Block_byref_object_dispose__68;
  v41 = 0;
  v42 = 0;
  v40 = &unk_1B3948866;
  __asm { FMOV            V0.2D, #-1.0 }
  v43 = _Q0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 11;
  if (a5)
  {
    v17 = 1;
  }
  else
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timelineComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v20, "isForceRenderAtPosterFrameEnabled");

  }
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __98__PVMotionEffectTransformComponent_bounds_atTime_forcePosterFrame_includeDropShadow_includeMasks___block_invoke;
  v25[3] = &unk_1E64D4BD0;
  v26 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v28 = v17;
  v25[4] = self;
  v25[5] = &v31;
  v25[6] = &v35;
  v29 = a6;
  v30 = a7;
  objc_msgSend(v21, "runEnsuringDocumentReadyAndLockingDocument:", v25);

  v22 = *((_DWORD *)v32 + 6);
  v18 = v22 == 0;
  if (!v22)
  {
    v23 = (CGSize)*((_OWORD *)v36 + 4);
    a3->origin = (CGPoint)*((_OWORD *)v36 + 3);
    a3->size = v23;
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

uint64_t __98__PVMotionEffectTransformComponent_bounds_atTime_forcePosterFrame_includeDropShadow_includeMasks___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  if (!*(_DWORD *)(a2 + 164))
  {
    v3 = result;
    v14 = 0uLL;
    v15 = 0;
    objc_msgSend(*(id *)(result + 32), "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timelineComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v12 = *(_OWORD *)(v3 + 56);
    v13 = *(_QWORD *)(v3 + 72);
    if (v5)
    {
      objc_msgSend(v5, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v12, *(unsigned __int8 *)(v3 + 80), a2);
    }
    else
    {
      v14 = 0uLL;
      v15 = 0;
    }

    v7 = *(void **)(v3 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 48;
    v9 = *(unsigned int *)(a2 + 160);
    v10 = v14;
    v11 = v15;
    result = objc_msgSend(v7, "objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:", v8, v9, &v10, *(unsigned __int8 *)(v3 + 81), *(unsigned __int8 *)(v3 + 82), a2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = result;
  }
  return result;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  CGPoint *v22;
  CGPoint v23;
  CGPoint v24;
  PVCGPointQuad *result;
  _QWORD v26[10];
  __int128 v27;
  int64_t var3;
  int v29;
  char v30;
  BOOL v31;
  uint64_t v32;
  CGPoint *v33;
  uint64_t v34;
  __n128 (*v35)(uint64_t, uint64_t);
  uint64_t (*v36)();
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  height = a8.height;
  width = a8.width;
  y = a7.y;
  x = a7.x;
  v32 = 0;
  v33 = (CGPoint *)&v32;
  v35 = __Block_byref_object_copy__70;
  v36 = __Block_byref_object_dispose__71;
  v34 = 0x7012000000;
  v37 = &unk_1B3948866;
  v38 = *(_OWORD *)PVCGPointQuadZero;
  v39 = *(_OWORD *)&PVCGPointQuadZero[16];
  v40 = *(_OWORD *)&PVCGPointQuadZero[32];
  v41 = *(_OWORD *)&PVCGPointQuadZero[48];
  if (a5)
  {
    v18 = 1;
  }
  else
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timelineComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v20, "isForceRenderAtPosterFrameEnabled");

  }
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke;
  v26[3] = &unk_1E64D4C20;
  v26[4] = self;
  v26[5] = &v32;
  v27 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v30 = v18;
  v31 = a6;
  *(CGFloat *)&v26[6] = x;
  *(CGFloat *)&v26[7] = y;
  *(CGFloat *)&v26[8] = width;
  *(CGFloat *)&v26[9] = height;
  v29 = a9;
  objc_msgSend(v21, "runEnsuringDocumentReadyAndLockingDocument:", v26);

  v22 = v33;
  v23 = v33[4];
  retstr->a = v33[3];
  retstr->b = v23;
  v24 = v22[6];
  retstr->c = v22[5];
  retstr->d = v24;
  _Block_object_dispose(&v32, 8);
  return result;
}

void __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  __int16 v15;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 80);
  v10 = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2;
  v7[3] = &unk_1E64D4BF8;
  v9 = a2;
  v13 = *(_QWORD *)(a1 + 96);
  v15 = *(_WORD *)(a1 + 108);
  v11 = v6;
  v14 = *(_DWORD *)(a1 + 104);
  objc_msgSend(v4, "runWithInspectableProperties:", v7);

}

void __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 104);
  if (v4)
  {
    objc_msgSend(v4, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", v5, &v10, *(unsigned __int8 *)(a1 + 116), *(unsigned __int8 *)(a1 + 117), *(unsigned int *)(a1 + 112), v3, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v6 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v7 = v13;
  v9 = v14;
  v8 = v15;
  v6[3] = v12;
  v6[4] = v7;
  v6[5] = v9;
  v6[6] = v8;

}

- (PVCGPointQuad)cornersAtTime_NoLock:(SEL)a3 time:(const void *)a4 forcePosterFrame:(id *)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9 properties:(int)a10
{
  unint64_t v11;
  unint64_t v12;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v18;
  _BOOL8 v19;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  CGPoint v34;
  CGPoint v35;
  CGPoint b;
  CGPoint d;
  CGFloat v38;
  CGPoint v39;
  CGPoint v40;
  CGPoint v41;
  CGPoint v42;
  __int128 v43;
  CGPoint v44;
  CGPoint v45;
  CGPoint v46;
  CGPoint v47;
  CGPoint v48;
  CGPoint v49;
  PVCGPointQuad *result;
  int v51;
  id v52;
  __n128 v53[4];
  __int128 v54;
  int64_t v55;
  __int128 v56;
  uint64_t v57;
  _OWORD v58[4];
  PVCGPointQuad v59;
  __int128 v60;
  int64_t v61;
  __int128 v62;
  uint64_t v63;
  CGPoint v64;
  CGPoint v65;
  CGPoint v66;
  CGPoint v67;
  __int128 v68;
  int64_t var3;
  __int128 v70;
  uint64_t v71;

  height = a9.height;
  width = a9.width;
  y = a8.y;
  x = a8.x;
  v18 = a7;
  v19 = a6;
  v24 = a11;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "assertInspectablePropertiesAreLocked");

  LODWORD(v12) = *((_DWORD *)a4 + 3);
  LODWORD(v11) = *((_DWORD *)a4 + 4);
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "origin");

  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  if (!*((_DWORD *)a4 + 41))
  {
    v51 = a10;
    v52 = v24;
    v30 = *((unsigned int *)a4 + 40);
    v70 = 0uLL;
    v71 = 0;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "timelineComponent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v68 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    if (v32)
    {
      objc_msgSend(v32, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v68, v19, a4);
    }
    else
    {
      v70 = 0uLL;
      v71 = 0;
    }

    v62 = v70;
    v63 = v71;
    v60 = *(_OWORD *)&a5->var0;
    v61 = a5->var3;
    -[PVMotionEffectTransformComponent objectCorners_NoLock:timelineTime:componentTime:includeDropShadow:includeMasks:documentInfo:](self, "objectCorners_NoLock:timelineTime:componentTime:includeDropShadow:includeMasks:documentInfo:", v30, &v62, &v60, v18, 1, a4);
    v34 = v65;
    retstr->a = v64;
    retstr->b = v34;
    v35 = v67;
    retstr->c = v66;
    retstr->d = v35;
    b = retstr->b;
    v59.a = retstr->a;
    v59.b = b;
    d = retstr->d;
    v59.c = retstr->c;
    v59.d = d;
    v38 = x;
    d.x = y;
    v24 = v52;
    PVCGPointQuad_scale(&v59, *(CGPoint *)((char *)&d - 8), &v64);
    v39 = v65;
    retstr->a = v64;
    retstr->b = v39;
    v40 = v67;
    retstr->c = v66;
    retstr->d = v40;
    v41 = retstr->b;
    v58[0] = retstr->a;
    v58[1] = v41;
    v42 = retstr->d;
    v58[2] = retstr->c;
    v58[3] = v42;
    v57 = v71;
    v56 = v70;
    v43 = *(_OWORD *)&a5->var0;
    v55 = a5->var3;
    v54 = v43;
    -[PVMotionEffectTransformComponent transformObjectCornersToImage_NoLock:objectID:timelineTime:componentTime:flatten:documentInfo:properties:](self, "transformObjectCornersToImage_NoLock:objectID:timelineTime:componentTime:flatten:documentInfo:properties:", v58, v30, &v56, &v54, 0, a4, v52);
    v44 = v65;
    retstr->a = v64;
    retstr->b = v44;
    v45 = v67;
    retstr->c = v66;
    retstr->d = v45;
    v46 = retstr->b;
    v53[0] = (__n128)retstr->a;
    v53[1] = (__n128)v46;
    v47 = retstr->d;
    v53[2] = (__n128)retstr->c;
    v53[3] = (__n128)v47;
    pv_transform_PVCGPointQuad_between_coordinate_systems(v53, v29, v51, &v64, (double)v12, (double)v11, width, height);
    v48 = v65;
    retstr->a = v64;
    retstr->b = v48;
    v49 = v67;
    retstr->c = v66;
    retstr->d = v49;
  }

  return result;
}

- (PVCGPointQuad)objectCorners_NoLock:(SEL)a3 timelineTime:(unsigned int)a4 componentTime:(id *)a5 includeDropShadow:(id *)a6 includeMasks:(BOOL)a7 documentInfo:(BOOL)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v13;
  void *v16;
  void *v17;
  PVCGPointQuad *result;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29;
  CGFloat v30;
  double v31;
  __int128 v32;

  v10 = a8;
  v11 = a7;
  v13 = *(_QWORD *)&a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect", *(_QWORD *)&a4, a5, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assertDocumentStatusIsLoadedOrReady");

  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  v30 = 0.0;
  v31 = 0.0;
  __asm { FMOV            V0.2D, #-1.0 }
  v32 = _Q0;
  v29 = *a5;
  result = (PVCGPointQuad *)-[PVMotionEffectTransformComponent objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:](self, "objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:", &v30, v13, &v29, v11, v10, a9);
  if (!(_DWORD)result)
  {
    v24 = v30;
    v25 = v31;
    v26 = *(double *)&v32;
    v27 = v31 + *((double *)&v32 + 1);
    retstr->a.x = v30;
    retstr->a.y = v27;
    v28 = v24 + v26;
    retstr->b.x = v28;
    retstr->b.y = v27;
    retstr->c.x = v28;
    retstr->c.y = v25;
    retstr->d.x = v24;
    retstr->d.y = v25;
  }
  return result;
}

- (PVCGPointQuad)transformObjectCornersToImage_NoLock:(SEL)a3 objectID:(PVCGPointQuad *)a4 timelineTime:(unsigned int)a5 componentTime:(id *)a6 flatten:(id *)a7 documentInfo:(BOOL)a8 properties:(const void *)a9
{
  _BOOL8 v11;
  uint64_t v14;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGPoint b;
  CGPoint d;
  _QWORD *v26;
  uint64_t v27;
  CGFloat point_at_index;
  CGPoint *v29;
  CGPoint v30;
  CGPoint v31;
  CGPoint v32;
  CGPoint v33;
  PVCGPointQuad *result;
  _QWORD v35[2];
  CGFloat *(*v36)(uint64_t, int, double, double);
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t *v46;
  PVCGPointQuad v47;
  uint64_t v48;
  CGPoint *v49;
  uint64_t v50;
  __n128 (*v51)(uint64_t, uint64_t);
  uint64_t (*v52)();
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v62;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v63;
  PVCGPointQuad v64;

  v11 = a8;
  v14 = *(_QWORD *)&a5;
  v18 = a10;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "assertInspectablePropertiesAreLocked");

  v63 = *a6;
  v62 = *a7;
  -[PVMotionEffectTransformComponent objectToImageTransform_NoLock:timelineTime:componentTime:flatten:includeTransformAnimation:includePlayableAspectScale:documentInfo:properties:](self, "objectToImageTransform_NoLock:timelineTime:componentTime:flatten:includeTransformAnimation:includePlayableAspectScale:documentInfo:properties:", v14, &v63, &v62, v11, 1, 1, a9, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v22, "SIMDDouble4x4");
    v48 = 0;
    v49 = (CGPoint *)&v48;
    v50 = 0x7012000000;
    v51 = __Block_byref_object_copy__70;
    v52 = __Block_byref_object_dispose__71;
    v53 = &unk_1B3948866;
    b = a4->b;
    v47.a = a4->a;
    v47.b = b;
    d = a4->d;
    v47.c = a4->c;
    v47.d = d;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v36 = __141__PVMotionEffectTransformComponent_transformObjectCornersToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke;
    v37 = &unk_1E64D4C48;
    v40 = v56;
    v41 = v57;
    v38 = v54;
    v39 = v55;
    v44 = v60;
    v45 = v61;
    v42 = v58;
    v43 = v59;
    v46 = &v48;
    v26 = v35;
    v27 = 0;
    do
    {
      v64 = v47;
      point_at_index = PVCGPointQuad_get_point_at_index(&v64, v27);
      ((void (*)(_QWORD *, uint64_t, double))v36)(v26, v27, point_at_index);
      v27 = (v27 + 1);
    }
    while ((_DWORD)v27 != 4);

    v29 = v49;
    v30 = v49[4];
    retstr->a = v49[3];
    retstr->b = v30;
    v31 = v29[6];
    retstr->c = v29[5];
    retstr->d = v31;
    _Block_object_dispose(&v48, 8);
  }
  else
  {
    v32 = a4->b;
    retstr->a = a4->a;
    retstr->b = v32;
    v33 = a4->d;
    retstr->c = a4->c;
    retstr->d = v33;
  }

  return result;
}

CGFloat *__141__PVMotionEffectTransformComponent_transformObjectCornersToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  float64x2_t v4;
  float64x2_t v5;
  int64x2_t v6;
  double v7;
  float64x2_t v8;
  CGPoint v9;
  CGFloat y;

  v4 = vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), a3), *(float64x2_t *)(a1 + 80), a4), (float64x2_t)0, *(float64x2_t *)(a1 + 112));
  v5 = vaddq_f64(*(float64x2_t *)(a1 + 128), vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), a3), *(float64x2_t *)(a1 + 64), a4), (float64x2_t)0, *(float64x2_t *)(a1 + 96)));
  v6 = (int64x2_t)vaddq_f64(*(float64x2_t *)(a1 + 144), v4);
  v7 = *(double *)&v6.i64[1];
  v4.f64[0] = 0.0;
  v8 = (float64x2_t)vdupq_laneq_s64(v6, 1);
  v9 = (CGPoint)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v4, v8).i64[0], 0), (int8x16_t)vnegq_f64(v5), (int8x16_t)v5);
  if (v7 != 0.0)
    v9 = (CGPoint)vdivq_f64((float64x2_t)v9, v8);
  y = v9.y;
  return PVCGPointQuad_set_point_at_index((CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 48), v9, a2);
}

- (id)transformObjectPointsToImage_NoLock:(id)a3 objectID:(unsigned int)a4 timelineTime:(id *)a5 componentTime:(id *)a6 flatten:(BOOL)a7 documentInfo:(const void *)a8 properties:(id)a9
{
  _BOOL8 v10;
  uint64_t v13;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int64_t v44;
  __int128 v45;
  int64_t var3;

  v10 = a7;
  v13 = *(_QWORD *)&a4;
  v15 = a3;
  v16 = a9;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertInspectablePropertiesAreLocked");

  if (objc_msgSend(v15, "count"))
  {
    v45 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v43 = *(_OWORD *)&a6->var0;
    v44 = a6->var3;
    -[PVMotionEffectTransformComponent objectToImageTransform_NoLock:timelineTime:componentTime:flatten:includeTransformAnimation:includePlayableAspectScale:documentInfo:properties:](self, "objectToImageTransform_NoLock:timelineTime:componentTime:flatten:includeTransformAnimation:includePlayableAspectScale:documentInfo:properties:", v13, &v45, &v43, v10, 1, 1, a8, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v20, "SIMDDouble4x4");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __140__PVMotionEffectTransformComponent_transformObjectPointsToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke;
      v25[3] = &unk_1E64D4C70;
      v30 = v39;
      v31 = v40;
      v32 = v41;
      v33 = v42;
      v26 = v35;
      v27 = v36;
      v28 = v37;
      v29 = v38;
      v23 = v22;
      v34 = v23;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v25);

    }
    else
    {
      v23 = v15;
    }

  }
  else
  {
    v23 = v15;
  }

  return v23;
}

void __140__PVMotionEffectTransformComponent_transformObjectPointsToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  float64x2_t v5;
  float64x2_t v6;
  int64x2_t v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  void *v11;
  id v12;

  objc_msgSend(a2, "CGPointValue");
  v5 = vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), v3), *(float64x2_t *)(a1 + 80), v4), (float64x2_t)0, *(float64x2_t *)(a1 + 112));
  v6 = vaddq_f64(*(float64x2_t *)(a1 + 128), vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), v3), *(float64x2_t *)(a1 + 64), v4), (float64x2_t)0, *(float64x2_t *)(a1 + 96)));
  v7 = (int64x2_t)vaddq_f64(*(float64x2_t *)(a1 + 144), v5);
  v8 = *(double *)&v7.i64[1];
  v9 = (float64x2_t)vdupq_laneq_s64(v7, 1);
  v5.f64[0] = 0.0;
  v10 = (float64x2_t)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v5, v9).i64[0], 0), (int8x16_t)vnegq_f64(v6), (int8x16_t)v6);
  if (v8 != 0.0)
    v10 = vdivq_f64(v10, v9);
  v11 = *(void **)(a1 + 160);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(_OWORD *)&v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:");

}

- (int)objectBounds_NoLock:(void *)a3 objectID:(unsigned int)a4 timelineTime:(id *)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7 documentInfo:(const void *)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  void *v15;
  void *v16;
  char v17;
  char v18;

  v9 = a7;
  v10 = a6;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assertDocumentStatusIsLoadedOrReady");

  v17 = 2;
  if (!v10)
    v17 = 0;
  if (v9)
    v18 = v17 | 4;
  else
    v18 = v17;
  return OZXGetObjectBounds(*(_QWORD *)a8, (uint64_t)a5, a4, v18, (uint64_t)a3);
}

- (id)objectToImageTransform_NoLock:(unsigned int)a3 timelineTime:(id *)a4 componentTime:(id *)a5 flatten:(BOOL)a6 includeTransformAnimation:(BOOL)a7 includePlayableAspectScale:(BOOL)a8 documentInfo:(const void *)a9 properties:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t i;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  __int128 v42;
  uint64_t *v43;
  uint64_t j;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[8];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  PVTransformAnimationInfo v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int64_t var3;
  PVTransformAnimationInfo v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v89;

  v10 = a8;
  v11 = a7;
  v17 = a10;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assertInspectablePropertiesAreLocked");

  v89 = *a5;
  -[PVMotionEffectTransformComponent applyTransforms_NoLock:dirtyProperties:defaultProperties:componentTime:](self, "applyTransforms_NoLock:dirtyProperties:defaultProperties:componentTime:", a9, v17, 0, &v89);
  v88 = 0x3FF0000000000000;
  v85 = 0x3FF0000000000000;
  v82 = 0x3FF0000000000000;
  v79 = 0x3FF0000000000000;
  v80 = 0u;
  v81 = 0u;
  v83 = 0u;
  v84 = 0u;
  v86 = 0u;
  v87 = 0u;
  if (OZXGetObjectTransform(*(_QWORD *)a9, (uint64_t)a4, a6, a3, (uint64_t)&v79))
    goto LABEL_3;
  v78 = 0x3FF0000000000000;
  v75 = 0x3FF0000000000000;
  v72 = 0x3FF0000000000000;
  v69 = 0x3FF0000000000000;
  v70 = 0u;
  v71 = 0u;
  v73 = 0u;
  v74 = 0u;
  v76 = 0u;
  v77 = 0u;
  if (OZXGetWorldToFilmTransform(*(uint64_t **)a9, (CMTime *)a4, (__n128 *)&v69))
  {
LABEL_3:
    v21 = 0;
  }
  else
  {
    v23 = PCMatrix44Tmpl<double>::leftMult((uint64_t)&v79, (double *)&v69);
    LODWORD(v23) = *((_DWORD *)a9 + 3);
    LODWORD(v24) = *((_DWORD *)a9 + 4);
    v25 = (double)*(unint64_t *)&v23;
    v26 = (double)v24;
    if (v11)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kPVTransformAnimationKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      if (+[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v27, &v66, 14, 1, &v68, v25, v26))
      {
        v64 = 0u;
        v65 = 0u;
        v63 = 0u;
        v62 = v68;
        CGAffineTransformFromPointWithPVAnimInfo(&v62, *MEMORY[0x1E0C9D538], (uint64_t)&v63);
        v28 = 0;
        v54 = v63;
        v55 = 0u;
        v56 = v64;
        v57 = 0u;
        v58 = 0u;
        v59 = xmmword_1B304EED0;
        v29 = &v69;
        v60 = v65;
        v61 = xmmword_1B304EEE0;
        do
        {
          for (i = 0; i != 4; ++i)
            v29[i] = *((_QWORD *)&v54 + 4 * i + (v28 & 3));
          ++v28;
          v29 += 4;
        }
        while (v28 != 4);
        PCMatrix44Tmpl<double>::leftMult((uint64_t)&v79, (double *)&v69);
      }

    }
    if (v10)
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "hasPlayableAspectOverride_NoLock");

      if (v32)
      {
        -[PVMotionEffectComponent motionEffect](self, "motionEffect");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "playableAspectRatio_NoLock");
        v35 = v34;

        -[PVMotionEffectComponent motionEffect](self, "motionEffect");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "playableContentMode_NoLock");

        v38 = v35 * v26;
        switch(v37)
        {
          case 0:
            goto LABEL_25;
          case 1:
            if (v25 <= v26)
            {
              v39 = v26;
              if (v38 < v25)
                v39 = v25 / v35;
            }
            else
            {
              v39 = v25 / v35;
              if (v25 / v35 < v26)
                v39 = v26;
            }
            goto LABEL_22;
          case 2:
            v39 = v25 / v35;
            if (v25 / v35 > v26)
              v39 = v26;
LABEL_22:
            v35 = v35 * v39;
            goto LABEL_24;
          case 3:
          case 13:
            v35 = v25;
            goto LABEL_24;
          case 14:
            v35 = v35 * v26;
            goto LABEL_24;
          default:
LABEL_24:
            v25 = v35;
LABEL_25:
            v40 = v25 / v38;
            if (fabs(v40 + -1.0) >= 0.0001)
            {
              v41 = 0;
              *(_QWORD *)&v42 = 0;
              *((double *)&v42 + 1) = v40;
              v54 = *(unint64_t *)&v40;
              v55 = 0u;
              v56 = v42;
              v57 = 0u;
              v58 = 0u;
              v59 = xmmword_1B304EED0;
              v60 = 0u;
              v61 = xmmword_1B304EEE0;
              v43 = &v69;
              do
              {
                for (j = 0; j != 4; ++j)
                  v43[j] = *((_QWORD *)&v54 + 4 * j + (v41 & 3));
                ++v41;
                v43 += 4;
              }
              while (v41 != 4);
              PCMatrix44Tmpl<double>::leftMult((uint64_t)&v79, (double *)&v69);
            }
            break;
        }
      }
    }
    *(_QWORD *)&v45 = v79;
    *(_QWORD *)&v46 = v80;
    *((_QWORD *)&v45 + 1) = *((_QWORD *)&v81 + 1);
    *(_QWORD *)&v48 = *((_QWORD *)&v84 + 1);
    *(_QWORD *)&v47 = v84;
    *((_QWORD *)&v47 + 1) = *((_QWORD *)&v86 + 1);
    *((_QWORD *)&v46 + 1) = v82;
    *((_QWORD *)&v48 + 1) = v87;
    *(_QWORD *)&v49 = *((_QWORD *)&v80 + 1);
    *(_QWORD *)&v50 = v81;
    *((_QWORD *)&v49 + 1) = v83;
    *(_QWORD *)&v51 = v85;
    *(_QWORD *)&v52 = v86;
    *((_QWORD *)&v51 + 1) = *((_QWORD *)&v87 + 1);
    *((_QWORD *)&v50 + 1) = *((_QWORD *)&v83 + 1);
    *((_QWORD *)&v52 + 1) = v88;
    v53[0] = v45;
    v53[1] = v47;
    v53[2] = v46;
    v53[3] = v48;
    v53[4] = v49;
    v53[5] = v51;
    v53[6] = v50;
    v53[7] = v52;
    +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", v53);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)additionalTopLevelScaleInDictionary:(id)a3 orInDefaultDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVTopLevelAdditionalScaleKey"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && -[PVMotionEffectTransformComponent isForceRenderAtPosterFrameEnabledInDictionary:orInDefaultDictionary:](self, "isForceRenderAtPosterFrameEnabledInDictionary:orInDefaultDictionary:", v6, v7))
  {
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isForceRenderAtPosterFrameEnabledInDictionary:(id)a3 orInDefaultDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timelineComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isForceRenderAtPosterFrameEnabled:", v6) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timelineComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isForceRenderAtPosterFrameEnabled:", v7);

  }
  return v10;
}

- (id)applyAdditionalTopLevelScale:(CGPoint)a3 aroundPoint:(CGPoint)a4 toTransform:(id)a5
{
  double v5;
  double v6;
  id v7;
  unsigned __int8 v8;
  id v10;
  __int128 v11;
  float64x2_t v12;
  __int128 v13;
  __int128 v14;
  float64x2_t v15;
  float64x2_t v16;
  __int128 v17;
  float64x2_t v18;
  void *v19;
  float64x2_t v25;
  float64x2_t v26;
  CGFloat y;
  float64x2_t v28;
  CGFloat x;
  float64x2_t v30;
  _OWORD v31[8];
  __int128 v32[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41[2];
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44[8];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  float64x2_t v51;
  float64x2_t v52;

  y = a4.y;
  x = a4.x;
  v5 = a3.y;
  v6 = a3.x;
  v7 = a5;
  if ((v8 & 1) == 0
  {
    __asm { FMOV            V0.2D, #1.0 }
    -[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:]::noScale = _Q0;
  }
  if (*(double *)&-[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:]::noScale == v6
    && *((double *)&-[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:]::noScale
       + 1) == v5)
  {
    v10 = v7;
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    if (v7)
    {
      objc_msgSend(v7, "SIMDDouble4x4");
    }
    else
    {
      v11 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
      v49 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
      v50 = v11;
      v12 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112);
      v51 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96);
      v52 = v12;
      v13 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 16);
      v45 = *MEMORY[0x1E0C83FD8];
      v46 = v13;
      v14 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 48);
      v47 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 32);
      v48 = v14;
    }
    v25 = v52;
    v26 = v51;
    v15.f64[0] = 0.0;
    v15.f64[1] = v52.f64[1];
    v51 = 0uLL;
    v52 = v15;
    v16.f64[0] = x;
    v16.f64[1] = y;
    v44[4] = (float64x2_t)v49;
    v44[5] = (float64x2_t)v50;
    v44[0] = (float64x2_t)v45;
    v44[1] = (float64x2_t)v46;
    v44[2] = (float64x2_t)v47;
    v44[3] = (float64x2_t)v48;
    v44[6] = 0uLL;
    v44[7] = v15;
    v41[0] = v16;
    v41[1] = 0u;
    pv_simd_matrix_transform_vector(v44, v41, &v42);
    v28 = v43;
    v30 = v42;
    *(_QWORD *)&v17 = *(_OWORD *)&vnegq_f64(v43);
    *((_QWORD *)&v17 + 1) = *(_QWORD *)&v52.f64[1];
    v51 = vnegq_f64(v42);
    v52 = (float64x2_t)v17;
    v32[4] = v49;
    v32[5] = v50;
    v32[0] = v45;
    v32[1] = v46;
    v32[2] = v47;
    v32[3] = v48;
    v32[6] = (__int128)v51;
    v32[7] = v17;
    pv_simd_matrix_scale(v32, &v33, *(unint64_t *)&v6, v5, COERCE_UNSIGNED_INT64(1.0));
    v49 = v37;
    v50 = v38;
    v45 = v33;
    v46 = v34;
    v47 = v35;
    v48 = v36;
    *(_QWORD *)&v18.f64[0] = *(_OWORD *)&vaddq_f64(vaddq_f64(v25, v28), v40);
    v18.f64[1] = v40.f64[1];
    v51 = vaddq_f64(vaddq_f64(v26, v30), v39);
    v52 = v18;
    v31[2] = v35;
    v31[3] = v36;
    v31[0] = v33;
    v31[1] = v34;
    v31[6] = v51;
    v31[7] = v18;
    v31[4] = v37;
    v31[5] = v38;
    +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", v31);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v10;

  return v19;
}

- (void)updateIsFixedSourceDropShadow_NoLock:(const void *)a3 properties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double width;
  double height;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  __int128 v29;
  uint64_t v30;
  PVCGPointQuad v31;
  __int128 v32;
  uint64_t v33;
  PVCGPointQuad v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[8];
  __int128 v38;
  uint64_t v39;
  PVCGPointQuad v40;
  __int128 v41;
  uint64_t v42;
  PVCGPointQuad v43;
  __int128 v44;
  uint64_t v45;
  CGRect v46;

  v6 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentStatusIsLoadedOrReady");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertInspectablePropertiesAreLocked");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVTopLevelTransformKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = *MEMORY[0x1E0CA2E68];
  v45 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v11 = *((double *)a3 + 22);
  v12 = *((double *)a3 + 23);
  v41 = v44;
  v42 = v45;
  -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v41, 1, 1, 1, v6, 1.0, 1.0, v11, v12);
  pv_bounding_CGRect(&v43);
  width = v46.size.width;
  height = v46.size.height;
  if (!CGRectIsEmpty(v46))
  {
    v38 = v44;
    v39 = v45;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v38, 1, 0, 1, v6, 1.0, 1.0, v11, v12);
    pv_bounding_CGRect(&v40);
    v16 = v15;
    v18 = v17;
    v37[0] = xmmword_1B304EF60;
    v37[1] = 0u;
    v37[2] = xmmword_1B304EF70;
    memset(&v37[3], 0, 32);
    v37[5] = xmmword_1B304EED0;
    v37[6] = 0u;
    v37[7] = xmmword_1B304EEE0;
    v35 = v44;
    v36 = v45;
    v19 = -[PVMotionEffectTransformComponent addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:](self, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", a3, v37, &v35, 1, 0, 1, v11, v12, v6);
    v32 = v44;
    v33 = v45;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v32, 1, 1, 1, v6, 1.0, 1.0, v11, v12);
    pv_bounding_CGRect(&v34);
    v21 = v20;
    v23 = v22;
    v29 = v44;
    v30 = v45;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v29, 1, 0, 1, v6, 1.0, 1.0, v11, v12);
    pv_bounding_CGRect(&v31);
    v24 = vabdd_f64(width, v16);
    v25 = vabdd_f64(height, v18);
    v28 = vabdd_f64(vabdd_f64(v21, v26) * 0.5, v24) > 1.0;
    if (vabdd_f64(vabdd_f64(v23, v27) * 0.5, v25) > 1.0)
      v28 = 1;
    self->_isFixedSourceDropShadow = v28;
    self->_normalizedFixedShadowSize.width = v24 / v11;
    self->_normalizedFixedShadowSize.height = v25 / v12;
    -[PVMotionEffectTransformComponent applyTopLevelGroupTransform_NoLock:transform:](self, "applyTopLevelGroupTransform_NoLock:transform:", a3, v10);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("kPVTopLevelTransformKey"));
  }

}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PVMotionEffectTransformComponent;
  -[PVMotionEffectComponent motionEffect:didBecomeReady:properties:](&v12, sel_motionEffect_didBecomeReady_properties_, v8, a4, v9);
  v10 = *MEMORY[0x1E0CA2E68];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[PVMotionEffectTransformComponent applyTransforms_NoLock:dirtyProperties:defaultProperties:componentTime:](self, "applyTransforms_NoLock:dirtyProperties:defaultProperties:componentTime:", a4, v9, 0, &v10);

}

- (void)motionEffect:(id)a3 willRender:(const void *)a4 properties:(id)a5 time:(id *)a6
{
  id v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  objc_super v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  v10 = a3;
  v11 = a5;
  v14 = *a6;
  v13.receiver = self;
  v13.super_class = (Class)PVMotionEffectTransformComponent;
  -[PVMotionEffectComponent motionEffect:willRender:properties:time:](&v13, sel_motionEffect_willRender_properties_time_, v10, a4, v11, &v14);
  v12 = *a6;
  -[PVMotionEffectTransformComponent applyTransforms_NoLock:dirtyProperties:defaultProperties:componentTime:](self, "applyTransforms_NoLock:dirtyProperties:defaultProperties:componentTime:", a4, v11, 0, &v12);

}

- (void)motionEffectDidUnload:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PVMotionEffectTransformComponent;
  -[PVMotionEffectComponent motionEffectDidUnload:](&v4, sel_motionEffectDidUnload_, a3);
  self->_top3DGroupID = 0;
  self->_top3DGroupIDStatus = 1;
  self->_cameraID = 0;
  self->_cameraIDStatus = 1;
  self->_metersToWorldUnitScale = 1.0;
  self->_isFixedSourceDropShadow = 0;
  self->_normalizedFixedShadowSize = (CGSize)*MEMORY[0x1E0C9D820];
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  BOOL v12;
  void *v14;
  __int128 v15;
  int64_t var3;
  objc_super v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;

  v6 = a6;
  v10 = a4;
  v18 = *a5;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTransformComponent;
  if (-[PVMotionEffectComponent motionEffect:propertiesDisableCache:time:forcePosterFrame:](&v17, sel_motionEffect_propertiesDisableCache_time_forcePosterFrame_, a3, v10, &v18, v6)|| (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kPVTopLevelAdditionalScaleKey")), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kPVTransformAnimationKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v12 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:outInfo:", v14, &v15, 0);

  }
  return v12;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTransformComponent;
  -[PVMotionEffectComponent motionEffectPropertyKeysThatInvalidateCachedRender:](&v10, sel_motionEffectPropertyKeysThatInvalidateCachedRender_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E20];
  v11[0] = CFSTR("kPVTopLevelTransformKey");
  v11[1] = CFSTR("kPVTransformKey");
  v11[2] = CFSTR("kPVCameraProjectionKey");
  v11[3] = CFSTR("kPVCameraTransformKey");
  v11[4] = CFSTR("kPVCameraEnabledKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v7 == 0;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  return v6;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTransformComponent;
  if (!-[PVMotionEffectComponent motionEffect:shouldInvalidateCachedRenderForProperty:oldValue:newValue:](&v17, sel_motionEffect_shouldInvalidateCachedRenderForProperty_oldValue_newValue_, v10, v11, v12, v13))
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("kPVTopLevelTransformKey")))
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("kPVCameraEnabledKey")))
      {
        v15 = PVNumbersAreEqualAsBooleans(v12, v13);
LABEL_10:
        v14 = v15 ^ 1;
        goto LABEL_11;
      }
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("kPVTransformKey")) & 1) == 0
        && (objc_msgSend(v11, "isEqualToString:", CFSTR("kPVCameraProjectionKey")) & 1) == 0
        && !objc_msgSend(v11, "isEqualToString:", CFSTR("kPVCameraTransformKey")))
      {
        v14 = 0;
        goto LABEL_11;
      }
    }
    v15 = objc_msgSend(v12, "isEqual:", v13);
    goto LABEL_10;
  }
  v14 = 1;
LABEL_11:

  return v14;
}

@end
