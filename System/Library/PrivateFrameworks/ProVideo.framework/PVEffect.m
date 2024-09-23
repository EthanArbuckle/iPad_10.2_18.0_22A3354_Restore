@implementation PVEffect

+ (double)defaultPlayableAspectRatio
{
  return 1.0;
}

+ (int)defaultPlayableAspectRatioPreservationMode
{
  return 0;
}

- (double)playableAspectRatio
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PVEffect_PlayableAspectRatio__playableAspectRatio__block_invoke;
  v4[3] = &unk_1E64D4730;
  v4[4] = self;
  v4[5] = &v5;
  -[PVEffect runWithInspectableProperties:](self, "runWithInspectableProperties:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __52__PVEffect_PlayableAspectRatio__playableAspectRatio__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playableAspectRatio_NoLock:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (void)setPlayableAspectRatio:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:");

}

- (int)playableAspectRatioPreservationMode
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PVEffect_PlayableAspectRatio__playableAspectRatioPreservationMode__block_invoke;
  v4[3] = &unk_1E64D4730;
  v4[4] = self;
  v4[5] = &v5;
  -[PVEffect runWithInspectableProperties:](self, "runWithInspectableProperties:", v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __68__PVEffect_PlayableAspectRatio__playableAspectRatioPreservationMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "playableAspectRatioPreservationMode_NoLock:");

}

- (void)setPlayableAspectRatioPreservationMode:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:");

}

- (CGRect)playableRectInView:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGSize v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)();
  void *v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x5012000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = &unk_1B3948866;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PVEffect_PlayableAspectRatio__playableRectInView___block_invoke;
  v11[3] = &unk_1E64D4758;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  -[PVEffect runWithInspectableProperties:](self, "runWithInspectableProperties:", v11);
  v3 = v14[6];
  v4 = v14[7];
  v5 = v14[8];
  v6 = v14[9];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

void __52__PVEffect_PlayableAspectRatio__playableRectInView___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playableRectInView_NoLock:properties:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  v3[9] = v7;

}

- (double)playableScaleInView:(CGSize)a3
{
  double v3;
  _QWORD v5[6];
  CGSize v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PVEffect_PlayableAspectRatio__playableScaleInView___block_invoke;
  v5[3] = &unk_1E64D4758;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  -[PVEffect runWithInspectableProperties:](self, "runWithInspectableProperties:", v5);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __53__PVEffect_PlayableAspectRatio__playableScaleInView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playableScaleInView_NoLock:properties:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (double)playableAspectRatio_NoLock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVPlayableAspectRatioKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "doubleValue");
  else
    objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatio");
  v8 = v7;

  return v8;
}

- (int)playableAspectRatioPreservationMode_NoLock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;

  v4 = a3;
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVPlayableAspectRatioPreservationModeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "intValue");
  else
    v7 = objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatioPreservationMode");
  v8 = v7;

  return v8;
}

- (CGRect)playableRectInView_NoLock:(CGSize)a3 properties:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  -[PVEffect playableAspectRatio_NoLock:](self, "playableAspectRatio_NoLock:", v7);
  v9 = v8;
  v10 = 1.0;
  switch(-[PVEffect playableAspectRatioPreservationMode_NoLock:](self, "playableAspectRatioPreservationMode_NoLock:", v7))
  {
    case 0:
    case 3:
      v9 = width;
      goto LABEL_11;
    case 1:
      if (width <= height)
      {
        v10 = height;
        if (height * v9 < width)
          v10 = width / v9;
      }
      else
      {
        v10 = width / v9;
        if (width / v9 < height)
          v10 = height;
      }
      goto LABEL_14;
    case 2:
      if (width / v9 <= height)
        v10 = width / v9;
      else
        v10 = height;
LABEL_14:
      v9 = v9 * v10;
      break;
    case 0xD:
      v10 = width / v9;
      v9 = width;
      break;
    case 0xE:
      v9 = height * v9;
LABEL_11:
      v10 = height;
      break;
    default:
      break;
  }

  v11 = (width - v9) * 0.5 + 0.0;
  v12 = (height - v10) * 0.5 + 0.0;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)playableScaleInView_NoLock:(CGSize)a3 properties:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  -[PVEffect playableAspectRatio_NoLock:](self, "playableAspectRatio_NoLock:", v7);
  v9 = v8;
  v10 = -[PVEffect playableAspectRatioPreservationMode_NoLock:](self, "playableAspectRatioPreservationMode_NoLock:", v7);
  v11 = 1.0;
  if (!v10)
    goto LABEL_16;
  if (v9 > -0.0000001)
  {
    v11 = 1.0;
    if (v9 < 0.0000001)
      goto LABEL_16;
  }
  v12 = height * v9;
  if (v10 > 2)
  {
    if (v10 == 3 || v10 == 13)
    {
      v9 = width;
    }
    else if (v10 == 14)
    {
      v9 = height * v9;
    }
    goto LABEL_15;
  }
  if (v10 == 1)
  {
    if (width <= height)
    {
      v13 = height;
      if (v12 < width)
        v13 = width / v9;
    }
    else
    {
      v13 = width / v9;
      if (width / v9 < height)
        v13 = height;
    }
    goto LABEL_13;
  }
  if (v10 == 2)
  {
    v13 = width / v9;
    if (width / v9 > height)
      v13 = height;
LABEL_13:
    v9 = v9 * v13;
  }
LABEL_15:
  v11 = v9 / v12;
LABEL_16:
  if (v11 >= 0.0000001 || v11 <= -0.0000001)
    v15 = v11;
  else
    v15 = 1.0;

  return v15;
}

- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  return 0;
}

- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  return 0;
}

- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11
{
  return 0;
}

- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (unsigned)timelineDurationInFrames
{
  return 0;
}

- (double)timelineDurationInSeconds
{
  return 0.0;
}

- (double)timelineFrameRate
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3
{
  uint64_t v4;
  __int128 v5;

  v4 = MEMORY[0x1E0CA2E40];
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v4 + 32);
  return self;
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3
{
  uint64_t v4;
  __int128 v5;

  v4 = MEMORY[0x1E0CA2E40];
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v4 + 32);
  return self;
}

- (id)timelineMarkers
{
  return 0;
}

- (id)timelineMarkersOfType:(int)a3
{
  return 0;
}

- (id)posterFrameMarker
{
  return 0;
}

- (BOOL)loopTimeOverrideEnabled
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (BOOL)forceDisableLoop
{
  return 0;
}

- (BOOL)forceDisableBuildAnimation
{
  return 0;
}

- (BOOL)useLocalLoopTime
{
  return 1;
}

- (id)handleForOZID:(unsigned int)a3
{
  return 0;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8
{
  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  return self;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix", a3, a4, *(_QWORD *)&a6, a5.width, a5.height);
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix", a3, a4, a5, *(_QWORD *)&a7, a6.width, a6.height);
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix", a3, a4, a5, a6, *(_QWORD *)&a8, a7.width, a7.height);
}

- (id)addToTopLevelTransform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
}

- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:
{
  double v8;
  double v9;
  CGPoint result;

  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)convertPointToView:withEffectToViewTransform:viewSize:
{
  return *MEMORY[0x1E0C9D538];
}

- (double)convertPointFromView:(_OWORD *)a1@<X8> atTime:viewSize:viewOrigin:
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix", a4, *(_QWORD *)&a6, a7, a3.x, a3.y, a5.width, a5.height);
}

- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix", a4, a5, *(_QWORD *)&a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6.width, a6.height);
}

- (id)topLevelGroupTransform
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
}

- (__n128)getScale
{
  __n128 result;

  __asm { FMOV            V0.2D, #1.0 }
  *a1 = result;
  a1[1] = result;
  return result;
}

- (id)cameraTransform
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
}

- (id)cameraProjection
{
  return +[PVMatrix44Double matrix](PVMatrix44Double, "matrix");
}

- (BOOL)isCameraOverrideEnabled
{
  return 0;
}

- (BOOL)transformUnitsAreInMeters
{
  return 0;
}

- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  CGSize v7;

  if (a3)
  {
    v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    a3->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    a3->size = v7;
  }
  return a3 != 0;
}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:", v8, v7);

}

- (double)doubleForKey:(id)a3 defaultValue:(double)a4
{
  void *v5;
  void *v6;
  double v7;

  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v7;
  }

  return a4;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:", v8, v7);

}

- (CGPoint)pointForKey:(id)a3 defaultValue:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGPointValue");
    x = v8;
    y = v9;
  }

  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setPoint:(CGPoint)a3 forKey:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = a4;
  objc_msgSend(v7, "valueWithCGPoint:", x, y);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:", v9, v8);

}

- (CGSize)sizeForKey:(id)a3 defaultValue:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGSizeValue");
    width = v8;
    height = v9;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setSize:(CGSize)a3 forKey:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  id v9;

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = a4;
  objc_msgSend(v7, "valueWithCGSize:", width, height);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:", v9, v8);

}

- (CGRect)rectForKey:(id)a3 defaultValue:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "CGRectValue");
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setRect:(CGRect)a3 forKey:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)MEMORY[0x1E0CB3B18];
  v10 = a4;
  objc_msgSend(v9, "valueWithCGRect:", x, y, width, height);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:", v11, v10);

}

- (void)matrixDouble4x4ForKey:(void *)a1@<X0>
{
  void *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;

  objc_msgSend(a1, "transformObjectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "SIMDDouble4x4");
    v3 = v9;
  }
  else
  {
    v4 = (_OWORD *)MEMORY[0x1E0C83FD8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
    a2[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
    a2[5] = v5;
    v6 = v4[7];
    a2[6] = v4[6];
    a2[7] = v6;
    v7 = v4[1];
    *a2 = *v4;
    a2[1] = v7;
    v8 = v4[3];
    a2[2] = v4[2];
    a2[3] = v8;
  }

}

- (void)setMatrixDouble4x4:(__int128 *)a3 forKey:(void *)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = a3[5];
  v15 = a3[4];
  v16 = v5;
  v6 = a3[7];
  v17 = a3[6];
  v18 = v6;
  v7 = a3[1];
  v11 = *a3;
  v12 = v7;
  v8 = a3[3];
  v13 = a3[2];
  v14 = v8;
  v9 = a4;
  +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setInspectableProperty:forKey:", v10, v9, v11, v12, v13, v14, v15, v16, v17, v18);

}

- (__n128)matrixFloat4x4ForKey:(void *)a1
{
  void *v1;
  void *v2;
  __int128 v3;
  __int128 v5;

  objc_msgSend(a1, "transformObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "SIMDFloat4x4");
    v5 = v3;
  }
  else
  {
    v5 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v5;
}

- (void)setMatrixFloat4x4:(double)a3 forKey:(double)a4
{
  id v8;
  void *v13;

  v8 = a7;
  +[PVMatrix44Double matrixWithSIMDFloat4x4:](PVMatrix44Double, "matrixWithSIMDFloat4x4:", a2, a3, a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setInspectableProperty:forKey:", v13, v8);

}

- (id)transformAnimation
{
  return -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", CFSTR("kPVTransformAnimationKey"));
}

- (void)setTransformAnimation:(id)a3
{
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:", a3, CFSTR("kPVTransformAnimationKey"));
}

- (double)outputAspectRatio
{
  double v3;
  double v4;
  double result;

  -[PVEffect outputSize](self, "outputSize");
  -[PVEffect doubleForKey:defaultValue:](self, "doubleForKey:defaultValue:", CFSTR("kPVOutputAspectKey"), v3 / v4);
  return result;
}

- (void)setOutputAspectRatio:(double)a3
{
  -[PVEffect setDouble:forKey:](self, "setDouble:forKey:", CFSTR("kPVOutputAspectKey"), a3);
}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (id)attributedStringForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVEffect)initWithEffectID:(id)a3
{
  id v5;
  PVEffect *v6;
  PVEffect *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *contentProperties;
  uint64_t v11;
  NSString *effectType;
  uint64_t v13;
  NSString *displayName;
  __int128 v15;
  __int128 v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *inspectableProperties;
  NSLock *v19;
  NSLock *inspectablePropertiesLock;
  uint64_t v21;
  NSMutableDictionary *effectParameters;
  _DWORD *v23;
  uint64_t v24;
  NSMutableArray *components;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PVEffect;
  v6 = -[PVEffect init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_effectID, a3);
    -[PVEffect effectID](v7, "effectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVEffect propertiesForEffect:](PVEffect, "propertiesForEffect:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    contentProperties = v7->_contentProperties;
    v7->_contentProperties = (NSDictionary *)v9;

    -[NSDictionary objectForKey:](v7->_contentProperties, "objectForKey:", CFSTR("FFEffectProperty_EffectType"));
    v11 = objc_claimAutoreleasedReturnValue();
    effectType = v7->_effectType;
    v7->_effectType = (NSString *)v11;

    -[NSDictionary objectForKey:](v7->_contentProperties, "objectForKey:", CFSTR("FFEffectProperty_DisplayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v13;

    v16 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v15 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    *(_OWORD *)&v7->_effectRange.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&v7->_effectRange.start.epoch = v16;
    *(_OWORD *)&v7->_effectRange.duration.timescale = v15;
    v7->_conformToInputAspect = 0;
    *(_WORD *)&v7->_isInInteractiveMode = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inspectableProperties = v7->_inspectableProperties;
    v7->_inspectableProperties = v17;

    v19 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    inspectablePropertiesLock = v7->_inspectablePropertiesLock;
    v7->_inspectablePropertiesLock = v19;

    v21 = objc_opt_new();
    effectParameters = v7->_effectParameters;
    v7->_effectParameters = (NSMutableDictionary *)v21;

    v23 = (_DWORD *)operator new();
    *v23 = 0;
    v7->_loadCount = v23;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    components = v7->_components;
    v7->_components = (NSMutableArray *)v24;

    -[PVEffect _configureComponents](v7, "_configureComponents");
  }

  return v7;
}

- (PVEffect)initWithContentID:(id)a3 andDictionary:(id)a4
{
  id v7;
  id v8;
  PVEffect *v9;
  PVEffect *v10;
  uint64_t v11;
  NSDictionary *contentProperties;
  uint64_t v13;
  NSString *effectType;
  uint64_t v15;
  NSString *displayName;
  __int128 v17;
  __int128 v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *inspectableProperties;
  NSLock *v21;
  NSLock *inspectablePropertiesLock;
  uint64_t v23;
  NSMutableDictionary *effectParameters;
  _DWORD *v25;
  uint64_t v26;
  NSMutableArray *components;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PVEffect;
  v9 = -[PVEffect init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_effectID, a3);
    objc_msgSend(v8, "valueForKey:", CFSTR("contentProperties"));
    v11 = objc_claimAutoreleasedReturnValue();
    contentProperties = v10->_contentProperties;
    v10->_contentProperties = (NSDictionary *)v11;

    objc_msgSend(v8, "valueForKey:", CFSTR("contentType"));
    v13 = objc_claimAutoreleasedReturnValue();
    effectType = v10->_effectType;
    v10->_effectType = (NSString *)v13;

    -[NSDictionary objectForKey:](v10->_contentProperties, "objectForKey:", CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v15;

    v18 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v17 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    *(_OWORD *)&v10->_effectRange.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&v10->_effectRange.start.epoch = v18;
    *(_OWORD *)&v10->_effectRange.duration.timescale = v17;
    v10->_conformToInputAspect = 0;
    *(_WORD *)&v10->_isInInteractiveMode = 0;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inspectableProperties = v10->_inspectableProperties;
    v10->_inspectableProperties = v19;

    v21 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    inspectablePropertiesLock = v10->_inspectablePropertiesLock;
    v10->_inspectablePropertiesLock = v21;

    v23 = objc_opt_new();
    effectParameters = v10->_effectParameters;
    v10->_effectParameters = (NSMutableDictionary *)v23;

    v25 = (_DWORD *)operator new();
    *v25 = 0;
    v10->_loadCount = v25;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    components = v10->_components;
    v10->_components = (NSMutableArray *)v26;

    -[PVEffect _configureComponents](v10, "_configureComponents");
  }

  return v10;
}

- (void)dealloc
{
  void *loadCount;
  objc_super v4;

  -[PVEffect releaseResources](self, "releaseResources");
  loadCount = self->_loadCount;
  if (loadCount)
    MEMORY[0x1B5E29170](loadCount, 0x1000C4052888210);
  v4.receiver = self;
  v4.super_class = (Class)PVEffect;
  -[PVEffect dealloc](&v4, sel_dealloc);
}

- (void)_configureComponents
{
  PVEffectTimedPropertiesComponent *v3;
  PVEffectTimedPropertiesComponent *timedPropertiesComponent;

  v3 = -[PVEffectTimedPropertiesComponent initWithEffect:]([PVEffectTimedPropertiesComponent alloc], "initWithEffect:", self);
  timedPropertiesComponent = self->_timedPropertiesComponent;
  self->_timedPropertiesComponent = v3;

  -[NSMutableArray addObject:](self->_components, "addObject:", self->_timedPropertiesComponent);
}

- (id)effectID
{
  return self->_effectID;
}

- (id)effectType
{
  return self->_effectType;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)debugDisplayName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect effectID](self, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)categoryName
{
  return -[NSDictionary objectForKey:](self->_contentProperties, "objectForKey:", CFSTR("FFEffectProperty_Category"));
}

- (BOOL)forceRenderAtPosterFrame
{
  return 0;
}

- (BOOL)isBuildInAnimationEnabled
{
  return 0;
}

- (BOOL)isBuildOutAnimationEnabled
{
  return 0;
}

- (BOOL)isLoopedRangeRenderCacheable
{
  return 0;
}

- (BOOL)isEphemeralProperty:(id)a3
{
  return 0;
}

- (BOOL)isTemporalProperty:(id)a3
{
  return 0;
}

- (CGSize)outputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)outputROI
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)origin
{
  return 0;
}

- (BOOL)isReady
{
  return 1;
}

- (BOOL)resourcesAreReady
{
  return 1;
}

- (BOOL)loadEffect
{
  unsigned int *loadCount;
  unsigned int v4;
  BOOL v5;
  unsigned int *v6;
  unsigned int v7;
  NSMutableArray *components;
  _QWORD v10[5];
  BOOL v11;

  loadCount = (unsigned int *)self->_loadCount;
  if (loadCount)
  {
    do
      v4 = __ldaxr(loadCount);
    while (__stlxr(v4 + 1, loadCount));
  }
  v5 = -[PVEffect loadResources](self, "loadResources");
  v6 = (unsigned int *)self->_loadCount;
  if (v6)
  {
    v7 = atomic_load(v6);
    if (v7 == 1)
    {
      components = self->_components;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __22__PVEffect_loadEffect__block_invoke;
      v10[3] = &unk_1E64D64E8;
      v10[4] = self;
      v11 = v5;
      -[NSMutableArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v10);
    }
  }
  return v5;
}

uint64_t __22__PVEffect_loadEffect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "effectDidLoad:isReady:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)loadEffectOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PVEffect_loadEffectOnQueue_completion___block_invoke;
  v8[3] = &unk_1E64D6510;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);

}

uint64_t __41__PVEffect_loadEffectOnQueue_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "loadEffect");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)loadResources
{
  return 1;
}

- (void)loadResourcesOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PVEffect_loadResourcesOnQueue_completion___block_invoke;
  v8[3] = &unk_1E64D6510;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);

}

uint64_t __44__PVEffect_loadResourcesOnQueue_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "loadResources");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)releaseEffect
{
  unsigned int *loadCount;
  unsigned int v4;
  NSMutableArray *components;
  _QWORD v7[5];

  loadCount = (unsigned int *)self->_loadCount;
  if (loadCount)
  {
    do
      v4 = __ldaxr(loadCount);
    while (__stlxr(v4 - 1, loadCount));
    if (!atomic_load((unsigned int *)self->_loadCount))
    {
      -[PVEffect releaseResources](self, "releaseResources");
      components = self->_components;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __25__PVEffect_releaseEffect__block_invoke;
      v7[3] = &unk_1E64D6538;
      v7[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v7);
    }
  }
}

uint64_t __25__PVEffect_releaseEffect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "effectDidUnload:", *(_QWORD *)(a1 + 32));
}

- (id)inspectablePropertyForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_inspectableProperties, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");

  return v5;
}

- (void)setInspectableProperty:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *inspectableProperties;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  inspectableProperties = self->_inspectableProperties;
  if (v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](inspectableProperties, "setObject:forKeyedSubscript:", v8, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](inspectableProperties, "removeObjectForKey:", v6);
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");

}

- (NSDictionary)inspectableProperties
{
  void *v3;

  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  v3 = (void *)-[NSMutableDictionary copy](self->_inspectableProperties, "copy");
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setInspectableProperties:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  -[NSMutableDictionary setDictionary:](self->_inspectableProperties, "setDictionary:", v4);
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");

}

- (void)addEntriesToInspectableProperties:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  -[NSMutableDictionary addEntriesFromDictionary:](self->_inspectableProperties, "addEntriesFromDictionary:", v4);
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");

}

- (id)descriptionOfInspectableProperties
{
  void *v3;

  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  -[NSMutableDictionary description](self->_inspectableProperties, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");
  return v3;
}

- (BOOL)supportsExtendedRangeInputs
{
  return 1;
}

- (NSMutableDictionary)effectParameters
{
  return self->_effectParameters;
}

- (void)setEffectParameters:(id)a3
{
  objc_storeStrong((id *)&self->_effectParameters, a3);
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
  self->_isInInteractiveMode = a3;
}

- (float)proxyRenderScale
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  PVEffect *v9;
  int v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0)
  {
    v9 = self;
    self = v9;
    if (v10)
    {
      v11 = CFSTR("197A9506-9198-4FBD-A7BF-955118A07AE2");
      v12[0] = &unk_1E6649378;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      -[PVEffect proxyRenderScale]::sEffectProxyResMap = objc_claimAutoreleasedReturnValue();
      self = v9;
    }
  }
  v3 = (void *)-[PVEffect proxyRenderScale]::sEffectProxyResMap;
  -[PVEffect effectID](self, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }

  return v7;
}

- (void)setHidden:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:");

}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[PVEffect inspectablePropertyForKey:](self, "inspectablePropertyForKey:", CFSTR("kPVHiddenKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)topLevelOpacity
{
  return 1.0;
}

- (BOOL)isVisible
{
  double v4;

  if (-[PVEffect isHidden](self, "isHidden"))
    return 0;
  -[PVEffect topLevelOpacity](self, "topLevelOpacity");
  return v4 > 0.0;
}

- (id)contentRegistryProperties
{
  void *v3;
  void *v4;
  void *v5;

  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect effectID](self, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPropertiesForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentRegistryPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PVEffect contentRegistryProperties](self, "contentRegistryProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contentPropertyForKey:(id)a3
{
  id v4;
  NSDictionary *contentProperties;
  void *v6;

  v4 = a3;
  contentProperties = self->_contentProperties;
  if (contentProperties)
  {
    -[NSDictionary valueForKey:](contentProperties, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)contentBundle
{
  void *v2;
  void *v3;

  -[PVEffect contentPropertyForKey:](self, "contentPropertyForKey:", CFSTR("_contentBundleID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hasBuiltInEnvironment
{
  return 0;
}

- (void)_postInit:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("effectType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_storeStrong((id *)&self->_effectType, v4);
  objc_msgSend(v6, "objectForKey:", CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_displayName, v5);

}

- (void)_copyWithZone:(_NSZone *)a3 into:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setValue:forKey:", self->_effectType, CFSTR("effectType"));
  objc_msgSend(v5, "setValue:forKey:", self->_displayName, CFSTR("displayName"));

}

- (void)_decodeFromCoder:(id)a3 into:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("effectType"));
  objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("displayName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v12[3];

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PVEffect _copyWithZone:into:](self, "_copyWithZone:into:", a3, v5);
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect effectID](self, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createContentInstance:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PVEffect inspectableProperties](self, "inspectableProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInspectableProperties:", v9);

  v10 = *(_OWORD *)&self->_effectRange.start.epoch;
  v12[0] = *(_OWORD *)&self->_effectRange.start.value;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&self->_effectRange.duration.timescale;
  objc_msgSend(v8, "setEffectRange:", v12);
  objc_msgSend(v8, "setConformToInputAspect:", self->_conformToInputAspect);
  objc_msgSend(v8, "_postInit:", v5);

  return v8;
}

- (PVEffect)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PVEffect *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createContentInstance:", v5);
  v7 = (PVEffect *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PVEffect _decodeFromCoder:into:](v7, "_decodeFromCoder:into:", v4, v8);
    -[PVEffect _postInit:](v7, "_postInit:", v8);

  }
  return v7;
}

- (BOOL)usesDefaultChannelDataEncoding
{
  return 1;
}

- (BOOL)writeDefaultChannels
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PVEffect effectID](self, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("effectID"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_effectType, CFSTR("effectType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;

  return (HGRef<HGNode>)PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, v6);
}

- (id)effectDescription
{
  __int128 v3;
  CFDictionaryRef v4;
  void *v5;
  NSMutableDictionary *inspectableProperties;
  id v7;
  const __CFString *displayName;
  const __CFString *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  CMTimeRange range;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_effectRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_effectRange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_effectRange.duration.timescale;
  v4 = CMTimeRangeCopyAsDictionary(&range, 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  inspectableProperties = self->_inspectableProperties;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__PVEffect_effectDescription__block_invoke;
  v12[3] = &unk_1E64D6568;
  v7 = v5;
  v13 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](inspectableProperties, "enumerateKeysAndObjectsUsingBlock:", v12);
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");
  v15[0] = CFSTR("effectID");
  v15[1] = CFSTR("effectName");
  displayName = (const __CFString *)self->_displayName;
  if (!displayName)
    displayName = &stru_1E65EDDA0;
  v16[0] = self->_effectID;
  v16[1] = displayName;
  v9 = CFSTR("NO");
  if (self->_conformToInputAspect)
    v9 = CFSTR("YES");
  v15[2] = CFSTR("conformToInputAspect");
  v15[3] = CFSTR("inspectableProperties");
  v16[2] = v9;
  v16[3] = v7;
  v15[4] = CFSTR("effectRange");
  v16[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v4);

  return v10;
}

void __29__PVEffect_effectDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PVEffect effectDescription](self, "effectDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- ($202A6A048D39AE170264FF71A65A9479)effectRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setEffectRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_effectRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_effectRange.duration.timescale = v4;
  *(_OWORD *)&self->_effectRange.start.value = v3;
}

- (BOOL)conformToInputAspect
{
  return self->_conformToInputAspect;
}

- (void)setConformToInputAspect:(BOOL)a3
{
  self->_conformToInputAspect = a3;
}

- (NSDictionary)contentProperties
{
  return self->_contentProperties;
}

- (void)setContentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_contentProperties, a3);
}

- (BOOL)isPreview
{
  return self->_isPreview;
}

- (void)setIsPreview:(BOOL)a3
{
  self->_isPreview = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)isInInteractiveMode
{
  return self->_isInInteractiveMode;
}

- (BOOL)shouldDisableFadeOut
{
  return self->_shouldDisableFadeOut;
}

- (void)setShouldDisableFadeOut:(BOOL)a3
{
  self->_shouldDisableFadeOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProperties, 0);
  objc_storeStrong((id *)&self->_timedPropertiesComponent, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_effectParameters, 0);
  objc_storeStrong((id *)&self->_inspectablePropertiesLock, 0);
  objc_storeStrong((id *)&self->_inspectableProperties, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_effectType, 0);
  objc_storeStrong((id *)&self->_effectID, 0);
}

- (BOOL)applyTimedPropertiesForTime:(id *)a3
{
  PVEffectTimedPropertiesComponent *timedPropertiesComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  timedPropertiesComponent = self->_timedPropertiesComponent;
  v5 = *a3;
  return -[PVEffectTimedPropertiesComponent applyTimedPropertiesForTime:](timedPropertiesComponent, "applyTimedPropertiesForTime:", &v5);
}

- (void)addTimedPropertiesDelegate:(id)a3 userContext:(id)a4
{
  -[PVEffectTimedPropertiesComponent addTimedPropertiesDelegate:userContext:](self->_timedPropertiesComponent, "addTimedPropertiesDelegate:userContext:", a3, a4);
}

- (void)removeTimedPropertiesDelegate:(id)a3
{
  -[PVEffectTimedPropertiesComponent removeTimedPropertiesDelegate:](self->_timedPropertiesComponent, "removeTimedPropertiesDelegate:", a3);
}

- (void)removeAllTimedPropertiesDelegates
{
  -[PVEffectTimedPropertiesComponent removeAllTimedPropertiesDelegates](self->_timedPropertiesComponent, "removeAllTimedPropertiesDelegates");
}

- (id)timedPropertiesDelegates
{
  return -[PVEffectTimedPropertiesComponent timedPropertiesDelegates](self->_timedPropertiesComponent, "timedPropertiesDelegates");
}

- (BOOL)hasTimedPropertiesDelegates
{
  return -[PVEffectTimedPropertiesComponent hasTimedPropertiesDelegates](self->_timedPropertiesComponent, "hasTimedPropertiesDelegates");
}

- (BOOL)hasTimedPropertiesDelegate:(id)a3
{
  return -[PVEffectTimedPropertiesComponent hasTimedPropertiesDelegate:](self->_timedPropertiesComponent, "hasTimedPropertiesDelegate:", a3);
}

- (id)userContextForTimedPropertiesDelegate:(id)a3
{
  -[PVEffectTimedPropertiesComponent userContextForTimedPropertiesDelegate:](self->_timedPropertiesComponent, "userContextForTimedPropertiesDelegate:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)runWithInspectableProperties:(id)a3
{
  void (**v4)(id, NSMutableDictionary *);

  v4 = (void (**)(id, NSMutableDictionary *))a3;
  -[NSLock lock](self->_inspectablePropertiesLock, "lock");
  v4[2](v4, self->_inspectableProperties);
  -[NSLock unlock](self->_inspectablePropertiesLock, "unlock");

}

- (void)runWithInspectableProperties_NoLock:(id)a3
{
  void (**v4)(id, NSMutableDictionary *);

  v4 = (void (**)(id, NSMutableDictionary *))a3;
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  v4[2](v4, self->_inspectableProperties);

}

- (BOOL)hasAllNecessaryResources
{
  return 1;
}

- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  return 0;
}

- (id)textEditingBounds:(id *)a3
{
  return 0;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  return 0;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  return 0;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  return 0;
}

- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9
{
  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  return self;
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)defaultAttributedString:(unint64_t)a3
{
  return 0;
}

- (id)mainTitle
{
  return 0;
}

- (id)subtitle
{
  return 0;
}

- (BOOL)supportsFlippingText
{
  return 0;
}

- (BOOL)supportsOrientation
{
  return 0;
}

- (BOOL)isTextFlipped
{
  return 0;
}

- (BOOL)isTitleCard
{
  return 0;
}

- (int)orientation
{
  return 0;
}

+ (id)attributeForName:(id)a3 fromAttributedString:(id)a4 defaultAttributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v7, 0, 0);
  else
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (int64_t)verticalAlignmentFromAttributedString:(id)a3 defaultAttributes:(id)a4
{
  void *v4;
  void *v5;
  unint64_t v6;
  int64_t v7;

  objc_msgSend(a1, "attributeForName:fromAttributedString:defaultAttributes:", CFSTR("TXTextVerticalAlignment"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    if (v6 >= 3)
      v7 = -1;
    else
      v7 = v6;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (double)textHeightFromAttributedString:(id)a3 defaultAttributes:(id)a4
{
  double result;

  objc_msgSend(a1, "textHeightFromAttributedString:defaultAttributes:scale:", a3, a4, 1.0);
  return result;
}

+ (double)textHeightFromAttributedString:(id)a3 defaultAttributes:(id)a4 scale:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("TXTextHeight"), 0, 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        (v10 = v9) != 0))
  {
    objc_msgSend(v9, "doubleValue");
    v12 = v11;
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("TXTextDynamicLineSpacing"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v12 * a5 + v14 * a5;

  }
  else
  {
    v16 = *MEMORY[0x1E0CEA098];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(v7, "attribute:atIndex:effectiveRange:", v16, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }
    objc_msgSend(v10, "ascender");
    v18 = v17;
    objc_msgSend(v10, "descender");
    v20 = v19;
    objc_msgSend(v10, "leading");
    v15 = v18 - v20 + v21;
  }

  return v15;
}

+ (id)shadowFromAttributedString:(id)a3 defaultAttributes:(id)a4
{
  objc_msgSend(a1, "attributeForName:fromAttributedString:defaultAttributes:", *MEMORY[0x1E0CEA0F0], a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (double)xOffsetForTextTrackingFromAttributedString:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "attribute:atIndex:effectiveRange:", CFSTR("TXTrackingValue"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    v7 = v6 * 0.5;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (BOOL)isAllCapsFromAttributes:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MotionTextStyleAllCapsAttributeName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") > 0;

  return v4;
}

+ (double)baselineOffsetFromAttributedString:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA068], 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = -v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

+ (void)modifyAttributedStringByAdjustingFontSize:(id)a3 scale:(double)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    v5 = *MEMORY[0x1E0CEA098];
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA098], 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "pointSize");
      objc_msgSend(v7, "fontWithSize:", fabs(a4) * v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v11, "length");
      objc_msgSend(v11, "removeAttribute:range:", v5, 0, v10);
      objc_msgSend(v11, "addAttribute:value:range:", v5, v9, 0, v10);
    }
    else
    {
      v9 = 0;
    }

  }
}

+ (void)modifyAttributedStringByAdjustingShadow:(id)a3 effectTransform:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  float64x2_t v11[2];
  _QWORD v12[2];
  double v13;
  _OWORD v14[8];
  _OWORD v15[2];
  float64x2_t v16;
  float64x2_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(" "));

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0F0], 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v18 = xmmword_1B304F040;
        v19 = xmmword_1B304F050;
        v20 = xmmword_1B304F060;
        v21 = *(_OWORD *)&qword_1B304F070;
        memset(v15, 0, sizeof(v15));
        v16 = (float64x2_t)xmmword_1B304F020;
        v17 = *(float64x2_t *)&qword_1B304F030;
        if (v7)
          objc_msgSend(v7, "SIMDDouble4x4");
        else
          memset(v14, 0, sizeof(v14));
        pv_transform_info_make((uint64_t)v14, (uint64_t)v15);
        v12[1] = 0;
        v13 = 0.0;
        v12[0] = 0;
        v11[0] = v16;
        v11[1] = v17;
        pv_simd_quaternion_get_euler_angles(v11, 4, (uint64_t)v12);
        objc_msgSend(a1, "modifyAttributedStringByAdjustingShadow:scale:rotation:", v6, *(double *)&v18, v13 + 3.14159265);
      }

    }
  }

}

+ (void)modifyAttributedStringByAdjustingOutline:(id)a3 attributes:(id)a4 range:(_NSRange)a5
{
  objc_msgSend(a1, "modifyAttributedStringByAdjustingOutline:attributes:range:scale:", a3, a4, a5.location, a5.length, 1.0);
}

+ (void)modifyAttributedStringByAdjustingForNegativeLineSpacing:(id)a3
{
  objc_msgSend(a1, "modifyAttributedStringByAdjustingForNegativeLineSpacing:scale:", a3, 1.0);
}

+ (void)modifyAttributedStringByAdjustingShadow:(id)a3 scale:(double)a4 rotation:(double)a5
{
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  float64x2_t v21;
  double v22;
  double v23;
  float64x2_t v24;
  double v26;
  float64x2_t v27;
  __double2 v28;
  uint64_t v29;
  float64_t v30;
  float64_t v31;
  double v32;
  float64x2_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(" "));

    if ((v9 & 1) == 0)
    {
      v10 = *MEMORY[0x1E0CEA0F0];
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0F0], 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
LABEL_26:

        goto LABEL_27;
      }
      v37 = 0.0;
      v38 = 0.0;
      v35 = 0.0;
      v36 = 0.0;
      objc_msgSend(v11, "shadowColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getRed:green:blue:alpha:", &v38, &v37, &v36, &v35);
      v35 = v35 * v35;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v38, v37, v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShadowColor:", v14);

      objc_msgSend(v12, "shadowBlurRadius");
      objc_msgSend(v12, "setShadowBlurRadius:", v15 * 0.5);
      objc_msgSend(v12, "shadowBlurRadius");
      v32 = fabs(a4);
      objc_msgSend(v12, "setShadowBlurRadius:", v32 * v16);
      objc_msgSend(v12, "shadowOffset");
      v30 = v18;
      v31 = v17;
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("TXTextDropShadowIsFixedSource"), 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");
      v21.f64[0] = v31;
      v21.f64[1] = v30;
      v33 = vmulq_n_f64(v21, v32);

      if (!v20)
      {
        v24.f64[0] = v33.f64[0];
        v24.f64[1] = -v33.f64[1];
LABEL_25:
        objc_msgSend(v12, "setShadowOffset:", *(_OWORD *)&v24);
        v29 = objc_msgSend(v7, "length");
        objc_msgSend(v7, "removeAttribute:range:", v10, 0, v29);
        objc_msgSend(v7, "addAttribute:value:range:", v10, v12, 0, v29);

        goto LABEL_26;
      }
      v22 = -v33.f64[1];
      if (v33.f64[0] == 0.0)
      {
        v23 = 4.71238898;
        if (v33.f64[1] <= 0.0)
          v23 = 0.0;
        if (v33.f64[1] < 0.0)
          v23 = 1.57079633;
      }
      else
      {
        v23 = atan(-v33.f64[1] / v33.f64[0]);
        v22 = v33.f64[0];
        if ((v33.f64[0] >= 0.0 || v33.f64[1] >= 0.0) && (v33.f64[0] >= 0.0 || v33.f64[1] <= 0.0))
        {
          if (v33.f64[1] > 0.0 && v33.f64[0] > 0.0)
            v23 = v23 + 6.28318531;
        }
        else
        {
          v23 = v23 + 3.14159265;
        }
        if (v33.f64[1] != 0.0)
        {
          v26 = sqrt(v33.f64[1] * v33.f64[1] + vmulq_f64(v33, v33).f64[0]);
          goto LABEL_24;
        }
      }
      v26 = fabs(v22);
LABEL_24:
      v34 = v26;
      v28 = __sincos_stret(v23 - a5);
      v27.f64[0] = v28.__cosval;
      v27.f64[1] = v28.__sinval;
      v24 = vmulq_n_f64(v27, v34);
      goto LABEL_25;
    }
  }
LABEL_27:

}

+ (void)modifyAttributedStringByAdjustingOutline:(id)a3 attributes:(id)a4 range:(_NSRange)a5 scale:(double)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  length = a5.length;
  location = a5.location;
  v19 = a3;
  v10 = a4;
  if (objc_msgSend(v19, "length"))
  {
    v11 = *MEMORY[0x1E0CEA138];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA138]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pointSize");
      v15 = v14;
      if (v14 == 0.0)
      {
        objc_msgSend(v19, "removeAttribute:range:", v11, location, length);
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v16, "numberWithDouble:", fabs(a6) * (100.0 / v15 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeAttribute:range:", v11, location, length);
        objc_msgSend(v19, "addAttribute:value:range:", v11, v18, location, length);

      }
    }

  }
}

+ (void)modifyAttributedStringByAdjustingKerning:(id)a3 attributes:(id)a4 range:(_NSRange)a5 scale:(double)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  length = a5.length;
  location = a5.location;
  v17 = a3;
  v10 = a4;
  if (objc_msgSend(v17, "length"))
  {
    v11 = *MEMORY[0x1E0CEA0B0];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v14, "numberWithDouble:", fabs(a6) * v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeAttribute:range:", v11, location, length);
      objc_msgSend(v17, "addAttribute:value:range:", v11, v16, location, length);

    }
  }

}

+ (void)modifyAttributedStringByAdjustingForNegativeLineSpacing:(id)a3 scale:(double)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  if (objc_msgSend(v37, "length"))
  {
    v5 = *MEMORY[0x1E0CEA0D0];
    objc_msgSend(v37, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0D0], 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "lineSpacing");
      if (v8 != 0.0)
      {
        v9 = objc_msgSend(v37, "length");
        v10 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v7, "lineSpacing");
        v11 = fabs(a4);
        objc_msgSend(v10, "setLineSpacing:", v11 * v12);
        objc_msgSend(v37, "removeAttribute:range:", v5, 0, v9);
        objc_msgSend(v37, "addAttribute:value:range:", v5, v10, 0, v9);
        objc_msgSend(v7, "lineSpacing");
        if (v13 <= 0.0)
        {
          objc_msgSend(v37, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "count"))
          {
            v36 = v10;
            objc_msgSend(v37, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA098], 0, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "ascender");
            v18 = v17;
            objc_msgSend(v35, "descender");
            v20 = v19;
            objc_msgSend(v35, "leading");
            v22 = v21;
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "length");

            v25 = objc_msgSend(v16, "count");
            v26 = v25 - 2;
            if (v25 >= 2)
            {
              v27 = 0;
              v28 = v18 - v20 + v22;
              v29 = v24 + 1;
              v30 = v25 - 1;
              do
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", v27 + 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (void *)objc_msgSend(v7, "mutableCopy");
                objc_msgSend(v32, "setLineSpacing:", 0.0);
                objc_msgSend(v7, "lineSpacing");
                objc_msgSend(v32, "setMaximumLineHeight:", v28 + v11 * v33);
                if (v26 == v27)
                  v34 = objc_msgSend(v31, "length");
                else
                  v34 = objc_msgSend(v31, "length") + 1;
                objc_msgSend(v37, "addAttribute:value:range:", v5, v32, v29, v34);
                v29 += v34;

                ++v27;
              }
              while (v30 != v27);
            }

            v10 = v36;
          }

        }
      }
    }

  }
}

+ (void)modifyAttributedStringByAdjustingFont:(id)a3 toFitSize:(CGSize)a4
{
  double width;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  char v10;
  unsigned int v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  double v17;
  int v18;
  double v19;
  double v20;
  int v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  double v27;

  width = a4.width;
  v24 = a3;
  if (objc_msgSend(v24, "length"))
  {
    v5 = *MEMORY[0x1E0CEA098];
    objc_msgSend(v24, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA098], 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v24, "length");
    v7 = objc_msgSend(v23, "pointSize");
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v13 = v8;
    v14 = v8;
    do
    {
      v15 = (void *)MEMORY[0x1B5E29C50](v7);
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __75__PVEffect_TextUtilities__modifyAttributedStringByAdjustingFont_toFitSize___block_invoke;
      v25[3] = &unk_1E64D7098;
      v27 = v9;
      v16 = v24;
      v26 = v16;
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v25);
      objc_msgSend(v16, "size");
      if (v17 <= width)
      {
        v20 = width - v17;
        if (v20 >= 0.05)
          v19 = (v9 + v13) * 0.5;
        else
          v19 = v9;
        if (v20 < 0.05)
        {
          v18 = 1;
        }
        else
        {
          v14 = v9;
          v18 = 0;
        }
        if (v20 >= 0.05)
          v10 = 1;
      }
      else
      {
        v18 = 0;
        if ((v10 & 1) != 0)
        {
          v19 = (v9 + v14) * 0.5;
          v10 = 1;
        }
        else
        {
          v10 = 0;
          v19 = v9 + -0.2;
        }
        v13 = v9;
      }

      objc_autoreleasePoolPop(v15);
      if (v11++ > 0x1D)
        v22 = 1;
      else
        v22 = v18;
      v9 = v19;
    }
    while (v22 != 1);

  }
}

void __75__PVEffect_TextUtilities__modifyAttributedStringByAdjustingFont_toFitSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, "fontWithSize:", *(double *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CEA098];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0CEA098], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v9, v8, a3, a4);

    v7 = v10;
  }

}

+ (void)modifyAttributedStringByApplyingSubstituteFont:(id)a3 attributes:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  length = a5.length;
  location = a5.location;
  v13 = a3;
  v8 = a4;
  if (objc_msgSend(v13, "length"))
  {
    v9 = *MEMORY[0x1E0CEA098];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TXSubstituteFont"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "pointSize");
        objc_msgSend(v11, "fontWithSize:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v13, "removeAttribute:range:", v9, location, length);
          objc_msgSend(v13, "addAttribute:value:range:", v9, v12, location, length);
        }

      }
    }

  }
}

+ (id)_effectRegistry
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)gRegistry;
  if (!gRegistry)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)gRegistry;
    gRegistry = (uint64_t)v3;

    v2 = (void *)gRegistry;
  }
  return v2;
}

+ (void)ensureEffectsRegistered
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id *j;
  id *v8;
  id *v9;
  uint64_t v10;
  id **v11;

  if ((gCalledDeferredRegistrations & 1) == 0)
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v2);
    if ((gCalledDeferredRegistrations & 1) == 0)
    {
      if (gDeferredRegistrationClients)
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        std::vector<objc_class * {__strong}>::__init_with_size[abi:ne180100]<objc_class * {__strong}*,objc_class * {__strong}*>((char *)&v8, *(void ***)gDeferredRegistrationClients, *(void ***)(gDeferredRegistrationClients + 8), (uint64_t)(*(_QWORD *)(gDeferredRegistrationClients + 8) - *(_QWORD *)gDeferredRegistrationClients) >> 3);
        v3 = gDeferredRegistrationClients;
        v4 = *(_QWORD *)gDeferredRegistrationClients;
        for (i = *(_QWORD *)(gDeferredRegistrationClients + 8); i != v4; i -= 8)
        {
          v6 = *(void **)(i - 8);

        }
        *(_QWORD *)(v3 + 8) = v4;
        for (j = v8; j != v9; ++j)
          objc_msgSend(*j, "runDeferredRegistration");
        v11 = &v8;
        std::vector<objc_class * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
      }
      gCalledDeferredRegistrations = 1;
    }
    objc_sync_exit(v2);

  }
}

+ (id)_effectRegistryForLookup
{
  objc_msgSend(a1, "ensureEffectsRegistered");
  return (id)objc_msgSend(a1, "_effectRegistry");
}

+ (void)deferEffectRegistrationForClass:(Class)a3
{
  void *v4;
  char **v5;
  Class v6;

  v6 = a3;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  if ((gCalledDeferredRegistrations & 1) != 0)
  {
    objc_sync_exit(v4);

    -[objc_class runDeferredRegistration](a3, "runDeferredRegistration");
  }
  else
  {
    v5 = (char **)gDeferredRegistrationClients;
    if (!gDeferredRegistrationClients)
    {
      v5 = (char **)operator new(0x18uLL, MEMORY[0x1E0DE4E10]);
      if (v5)
      {
        *v5 = 0;
        v5[1] = 0;
        v5[2] = 0;
      }
      gDeferredRegistrationClients = (uint64_t)v5;
    }
    std::vector<objc_class * {__strong}>::push_back[abi:ne180100](v5, (id *)&v6);
    objc_sync_exit(v4);

  }
}

+ (void)registerEffectClass:(Class)a3 forEffectID:(id)a4 withProperties:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const char *ClassName;
  const char *v13;
  PVEffectRegistryEntry *v14;
  const char *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  if (a3 && v16)
  {
    objc_msgSend(a1, "_effectRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "objectForKey:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ClassName = object_getClassName((id)objc_msgSend(v11, "effectClass"));
      v13 = object_getClassName(a3);
      NSLog(CFSTR("PVEffect: Warning: a provider class is already registered for effect ID \"%@\".\nReplacing old provider class %s with new provider class %s"), v16, ClassName, v13);

    }
    v14 = -[PVEffectRegistryEntry initWithClass:andProperties:]([PVEffectRegistryEntry alloc], "initWithClass:andProperties:", a3, v8);
    objc_msgSend(v9, "setObject:forKey:", v14, v16);

  }
  else
  {
    v15 = object_getClassName(a3);
    NSLog(CFSTR("PVEffect: Warning: asked to register a nil effectID and/or a nil class\n\tEffect ID: %@\n\tClass ID: %s"), v16, v15);
  }

}

+ (id)newEffectWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_effectRegistryForLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "effectClass")), "initWithEffectID:", v4);
    objc_msgSend(v7, "_postInit:", 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)newEffectWithURL:(id)a3
{
  id v3;

  v3 = +[PVMotionEffect newEffectWithURL:](PVMotionEffect, "newEffectWithURL:", a3);
  objc_msgSend(v3, "_postInit:", 0);
  return v3;
}

+ (id)newEffectWithData:(id)a3
{
  id v3;

  v3 = +[PVMotionEffect newEffectWithData:](PVMotionEffect, "newEffectWithData:", a3);
  objc_msgSend(v3, "_postInit:", 0);
  return v3;
}

+ (BOOL)effectIDIsRegistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_effectRegistryForLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

+ (BOOL)effectIDIsNone:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (+[PVEffect(PVEffectRegistry) effectIDIsNone:]::onceToken != -1)
    dispatch_once(&+[PVEffect(PVEffectRegistry) effectIDIsNone:]::onceToken, &__block_literal_global_16);
  v4 = objc_msgSend((id)+[PVEffect(PVEffectRegistry) effectIDIsNone:]::noneEffectIDs, "containsObject:", v3);

  return v4;
}

void __45__PVEffect_PVEffectRegistry__effectIDIsNone___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("737C8717-70E0-4CCE-8F19-17A0532E836F"), CFSTR("4390FE7A-3408-4EB5-A049-AA394C03A911"), CFSTR("67EB7544-E4A1-4508-9733-E201AADFBC15"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[PVEffect(PVEffectRegistry) effectIDIsNone:]::noneEffectIDs;
  +[PVEffect(PVEffectRegistry) effectIDIsNone:]::noneEffectIDs = v0;

}

+ (id)_registryEntryForEffectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_effectRegistryForLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    NSLog(CFSTR("PVEffect: Warning: no class registered for effect ID \"%@\"), v4);

  return v6;
}

+ (id)propertiesForEffect:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_registryEntryForEffectID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allRegisteredEffectIDs
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_effectRegistryForLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)userVisibleEffectIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[PVEffect allRegisteredEffectIDs](PVEffect, "allRegisteredEffectIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v15 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[PVEffect propertiesForEffect:](PVEffect, "propertiesForEffect:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("FFEffectProperty_HiddenInUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");

        objc_msgSend(v6, "objectForKey:", CFSTR("FFEffectProperty_AvailableInSimpleMode"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if (((v8 | v10 ^ 1) & 1) == 0)
          objc_msgSend(v12, "addObject:", v5);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v2);
  }

  return v12;
}

+ (id)effectTypeForEffectID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "propertiesForEffect:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FFEffectProperty_EffectType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)registeredEffectIDsForEffectType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allRegisteredEffectIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "effectTypeForEffectID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)registeredEffectIDsForEffectTypes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "registeredEffectIDsForEffectType:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)firstRegisteredEffectIDContainingSubstring:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[PVEffect allRegisteredEffectIDs](PVEffect, "allRegisteredEffectIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "rangeOfString:", v3) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (Class)classForEffectID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_registryEntryForEffectID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (id)registeredEffectIDsForClass:(Class)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allRegisteredEffectIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((Class)objc_msgSend(a1, "classForEffectID:", v10) == a3)
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)displayNameForEffectType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.filter")) & 1) != 0)
  {
    v4 = CFSTR("Effects");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.generator")) & 1) != 0)
  {
    v4 = CFSTR("Generators");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.transition")) & 1) != 0)
  {
    v4 = CFSTR("Transitions");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.compositor")) & 1) != 0)
  {
    v4 = CFSTR("Composite Operations");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.multiplexor")) & 1) != 0)
  {
    v4 = CFSTR("Multiplexor Operations");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.title")) & 1) != 0)
  {
    v4 = CFSTR("Titles");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.audio.effect")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.audio.generator")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.audio.transition")) & 1) != 0)
  {
    v4 = CFSTR("Audio Effects");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.audio.offline-effect")) & 1) != 0)
  {
    v4 = CFSTR("Audio Offline Effect");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.audio.music-instrument")))
  {
    v4 = CFSTR("Audio Instrument");
  }
  else
  {
    v4 = CFSTR("All Types");
  }

  return (id)v4;
}

+ (id)displayNameForEffectID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "propertiesForEffect:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FFEffectProperty_DisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)categoryForEffectID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "propertiesForEffect:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FFEffectProperty_Category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)themeForEffectID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "propertiesForEffect:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kFFEffectProperty_Theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)descriptionForEffectID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "propertiesForEffect:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FFEffectProperty_Description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isVideoForEffectID:(id)a3
{
  void *v3;
  char v4;

  +[PVEffect effectTypeForEffectID:](PVEffect, "effectTypeForEffectID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.filter")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.generator")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.transition")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.title")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.compositor"));
  }

  return v4;
}

+ (id)defaultVideoTransitionEffectID
{
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("FFDefaultVideoTransition"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", CFSTR("FxPlug:4731E73A-8DAC-4113-9A30-AE85B1761265"), CFSTR("FFDefaultVideoTransition"));

    v3 = CFSTR("FxPlug:4731E73A-8DAC-4113-9A30-AE85B1761265");
  }
  return v3;
}

+ (id)_registeredEffectClasses
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered;
  if (!+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered)
  {
    v3 = objc_opt_new();
    v4 = (void *)+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered;
    +[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered = v3;

    v2 = (void *)+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered;
  }
  return v2;
}

+ (void)_registerEffectsInBundle:(id)a3 atPath:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_msgSend(v9, "principalClass");
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(a1, "_registeredEffectClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "registerEffects");
      objc_msgSend(a1, "_registeredEffectClasses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v5);

    }
  }

}

+ (void)initEffectRegistry
{
  objc_msgSend(a1, "initEffectRegistryWithHostDelegate:", 0);
}

+ (void)initEffectRegistryWithHostDelegate:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void);
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__PVEffect_RuntimeBundleLoading__initEffectRegistryWithHostDelegate___block_invoke;
    v7[3] = &unk_1E64D47C0;
    v8 = v4;
    v6 = (void (**)(void))MEMORY[0x1B5E29E00](v7);
    v6[2]();

  }
}

void __69__PVEffect_RuntimeBundleLoading__initEffectRegistryWithHostDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostApplicationDelegate:", *(_QWORD *)(a1 + 32));
  +[PVEffect _registerBuiltInEffects](PVEffect, "_registerBuiltInEffects");
  +[PVHeliumEffect registerEffects](PVHeliumEffect, "registerEffects");
  +[PVMotionEffect registerEffects](PVMotionEffect, "registerEffects");
  +[PVCompositeDelegateEffect registerEffects](PVCompositeDelegateEffect, "registerEffects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", v3, sel_willTerminate_, *MEMORY[0x1E0CEB360], 0);

}

+ (void)willTerminate:(id)a3
{
  id v4;

  objc_opt_self();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == a1)
  {
    +[PVEffect handleApplicationWillTerminate](PVEffect, "handleApplicationWillTerminate");
    +[PVMotionEffect handleApplicationWillTerminate](PVMotionEffect, "handleApplicationWillTerminate");
  }
}

+ (void)clearPreviewStats
{
  if ((id)objc_opt_class() == a1)
    +[PVMotionEffect clearPreviewStats](PVMotionEffect, "clearPreviewStats");
}

+ (void)noteApplicationWillTerminate
{
  objc_msgSend(a1, "willTerminate:", 0);
}

+ (void)cleanupEffectsCache
{
  +[PVEffectResources cleanupEffectsCache](PVEffectResources, "cleanupEffectsCache");
}

+ (void)setInteractiveMode:(BOOL)a3
{
  +[PVEffectResources setInteractiveMode:](PVEffectResources, "setInteractiveMode:", a3);
}

+ (BOOL)isInteractiveMode
{
  return +[PVEffectResources isInteractiveMode](PVEffectResources, "isInteractiveMode");
}

+ (void)noteApplicationDidReceiveMemoryWarning
{
  +[PVEffectResources clearAllCachesAndPools](PVEffectResources, "clearAllCachesAndPools");
}

- (BOOL)isTranscription
{
  return 0;
}

- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

@end
