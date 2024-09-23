@implementation NUNIScene

- (NUNIScene)initWithSphereoids:(unint64_t)a3 currentDateBlock:(id)a4
{
  return -[NUNIScene initWithSphereoids:projectionType:currentDateBlock:](self, "initWithSphereoids:projectionType:currentDateBlock:", a3, 0, a4);
}

- (NUNIScene)initWithSphereoids:(unint64_t)a3 projectionType:(unint64_t)a4 currentDateBlock:(id)a5
{
  int v6;
  id v8;
  NUNIScene *v9;
  uint64_t v10;
  NSMutableArray *spheroids;
  unint64_t v12;
  NUNISpheroid *v13;
  NUNISpheroid *v14;
  NUNISpheroid *v15;
  NUNISpheroid *v16;
  NUNISpheroid *v17;
  NUNISpheroid *v18;
  NUNISpheroid *v19;
  uint64_t v20;
  NSMutableArray *animations;
  void *v22;
  id currentDateBlock;
  void *v24;
  double v25;
  unint64_t v27;
  void *aBlock;
  objc_super v29;

  v6 = a3;
  v8 = a5;
  v29.receiver = self;
  v29.super_class = (Class)NUNIScene;
  v9 = -[NUNIScene init](&v29, sel_init);
  if (v9)
  {
    v27 = a4;
    aBlock = v8;
    v10 = objc_opt_new();
    spheroids = v9->_spheroids;
    v9->_spheroids = (NSMutableArray *)v10;

    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (((1 << v12) & v6) == 0)
    {
LABEL_13:
      if (++v12 == 24)
      {
        v20 = objc_opt_new();
        animations = v9->_animations;
        v9->_animations = (NSMutableArray *)v20;

        *(_OWORD *)&v9->_structure.var0 = xmmword_1B0024EF0;
        *(_OWORD *)&v9->_structure.var3 = xmmword_1B0024860;
        *(_OWORD *)&v9->_structure.var5 = xmmword_1B0024890;
        *(_QWORD *)&v9->_structure.var11 = 2;
        v9->_structure.var8.var0.var0 = 5.7588;
        v9->_anon_78[16] = 1;
        *(_QWORD *)&v9->_anon_78[8] = v27;
        *(_DWORD *)&v9->_anon_78[52] = 1097859072;
        -[NUNIScene setSnap:](v9, "setSnap:", 24);
        v8 = aBlock;
        v22 = _Block_copy(aBlock);
        currentDateBlock = v9->_currentDateBlock;
        v9->_currentDateBlock = v22;

        -[NUNIScene date](v9, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        *(float *)&v25 = v25 / 31536000.0;
        *(_DWORD *)&v9->_anon_78[20] = LODWORD(v25);

        goto LABEL_17;
      }
    }
    v15 = 0;
    if (v12 <= 9)
    {
      v16 = v14;
      if (((1 << v12) & 0x3EE) != 0)
      {
LABEL_6:
        v15 = v16;
        goto LABEL_7;
      }
      if (v12 == 4)
      {
        v16 = v13;
        goto LABEL_6;
      }
    }
LABEL_7:
    v17 = -[NUNISpheroid initWithScene:parent:type:]([NUNISpheroid alloc], "initWithScene:parent:type:", v9, v15, v12);
    -[NSMutableArray addObject:](v9->_spheroids, "addObject:", v17);
    if (v12)
    {
      if (v12 != 3)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = v13;
      v13 = v17;
    }
    else
    {
      v18 = v14;
      v14 = v17;
    }
    v19 = v17;

    goto LABEL_12;
  }
LABEL_17:

  return v9;
}

- (void)updateCamera
{
  double v2;
  __int128 v4;
  double v5;
  double v6;
  NUNISpheroid *focus;
  void *v8;
  __int128 v9;
  __int128 v10;

  DWORD2(v10) = 0;
  *(_QWORD *)&v10 = 0;
  DWORD2(v9) = 0;
  *(_QWORD *)&v9 = 0;
  if (*(_QWORD *)&self->_structure.var9 == 24)
  {
    *(float *)&v2 = self->_structure.var8.var0.var1;
    *(_QWORD *)&v4 = 0x3F0000003F000000;
    HIDWORD(v4) = 1056964608;
    *((float *)&v4 + 2) = self->_structure.var8.var0.var0 * 0.5;
    v9 = xmmword_1B0024860;
    v10 = v4;
    v5 = 0.0078125;
    v6 = 0.0000305175853;
  }
  else
  {
    focus = self->_focus;
    (*((void (**)(void))self->_currentDateBlock + 2))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNISpheroid date:toCameraPosition:toCameraTarget:](focus, "date:toCameraPosition:toCameraTarget:", v8, &v10, &v9);

    -[NUNIScene restingCameraRoll](self, "restingCameraRoll");
    *(float *)&v2 = *(float *)&v4 + self->_structure.var8.var0.var1;
    v6 = *(double *)&v9;
    *(_QWORD *)&v4 = v10;
    v5 = 0.0;
  }
  -[NUNIScene setCamera:target:up:roll:](self, "setCamera:target:up:roll:", *(double *)&v4, v6, v5, v2, v9, v10);
}

- (float)restingCameraRoll
{
  void *v2;
  double v3;
  double v4;

  if (*(_QWORD *)&self->_structure.var9 == 4
    && (-[NUNIScene spheroidOfType:](self, "spheroidOfType:", 3),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "homeCoordinate"),
        v4 = v3,
        v2,
        v4 < 0.0))
  {
    return 3.1416;
  }
  else
  {
    return 0.0;
  }
}

- (double)animatedFloatForKey:(uint64_t)a3
{
  __int128 v3;
  const float *v4;

  switch(a3)
  {
    case 0:
      v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 1:
      v3 = *(_OWORD *)(a1 + 64);
      return *(double *)&v3;
    case 2:
      v3 = *(_OWORD *)(a1 + 80);
      return *(double *)&v3;
    case 3:
      v4 = (const float *)(a1 + 100);
      goto LABEL_15;
    case 4:
      v4 = (const float *)(a1 + 140);
      goto LABEL_15;
    case 5:
      v4 = (const float *)(a1 + 96);
      goto LABEL_15;
    case 6:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 144);
      return *(double *)&v3;
    case 7:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 152);
      return *(double *)&v3;
    case 8:
      v4 = (const float *)(a1 + 160);
      goto LABEL_15;
    case 9:
      v4 = (const float *)(a1 + 164);
      goto LABEL_15;
    case 10:
      v4 = (const float *)(a1 + 168);
LABEL_15:
      *(_QWORD *)&v3 = vld1q_dup_f32(v4).u64[0];
      break;
    default:
      *(_QWORD *)&v3 = 0;
      break;
  }
  return *(double *)&v3;
}

- (void)setAnimatedFloat:(unint64_t)a3 forKey:
{
  switch(a3)
  {
    case 0uLL:
      *(float32x4_t *)&self->_structure.var0 = _Q0;
      break;
    case 1uLL:
      *(float32x4_t *)&self->_structure.var3 = _Q0;
      break;
    case 2uLL:
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      *(float32x4_t *)&self->_structure.var5 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
      break;
    case 3uLL:
      LODWORD(self->_structure.var8.var0.var1) = _Q0.i32[0];
      break;
    case 4uLL:
      *(_DWORD *)&self->_anon_78[20] = _Q0.i32[0];
      break;
    case 5uLL:
      LODWORD(self->_structure.var8.var0.var0) = _Q0.i32[0];
      -[NUNIScene updateCamera](self, "updateCamera");
      break;
    case 6uLL:
      *(_QWORD *)&self->_anon_78[24] = _Q0.i64[0];
      break;
    case 7uLL:
      *(_QWORD *)&self->_anon_78[32] = _Q0.i64[0];
      break;
    case 8uLL:
      *(_DWORD *)&self->_anon_78[40] = _Q0.i32[0];
      break;
    case 9uLL:
      *(_DWORD *)&self->_anon_78[44] = _Q0.i32[0];
      break;
    case 0xAuLL:
      *(_DWORD *)&self->_anon_78[48] = _Q0.i32[0];
      break;
    default:
      return;
  }
}

- (void)update:(float)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_animations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        *(float *)&v8 = a3;
        if ((objc_msgSend(v12, "update:", v8, (_QWORD)v14) & 1) == 0)
        {
          objc_msgSend(v5, "addIndex:", -[NSMutableArray indexOfObject:](self->_animations, "indexOfObject:", v12));
          objc_msgSend(v12, "observer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "universeAnimationFinished:", v12);

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
    -[NSMutableArray removeObjectsAtIndexes:](self->_animations, "removeObjectsAtIndexes:", v5);

}

- (BOOL)isAnimating:(id)a3 forKeys:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "key", (_QWORD)v17);
        objc_msgSend(v12, "animatable");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14 == v6)
        {
          v15 = 1;

          if (((1 << v13) & ~a4) == 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)addAnimation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "key");
  objc_msgSend(v4, "animatable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "key", (_QWORD)v15) == v5)
        {
          objc_msgSend(v12, "animatable");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v6)
          {
            v14 = v12;

            if (v14)
              -[NUNIScene removeAnimation:](self, "removeAnimation:", v14);
            goto LABEL_13;
          }
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_13:
  -[NSMutableArray addObject:](self->_animations, "addObject:", v4, (_QWORD)v15);

}

- (void)removeAllAnimationsFor:(id)a3 withKeys:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  id v15;
  NUNIScene *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  v7 = self->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "key");
        objc_msgSend(v13, "animatable");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 == v6)
        {

          if (((1 << v14) & ~a4) == 0)
          {
            if (!v10)
              v10 = (void *)objc_opt_new();
            objc_msgSend(v10, "addIndex:", -[NSMutableArray indexOfObject:](v16->_animations, "indexOfObject:", v13));
          }
        }
        else
        {

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "count"))
    -[NSMutableArray removeObjectsAtIndexes:](v16->_animations, "removeObjectsAtIndexes:", v10);

}

- (void)removeAnimation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universeAnimationRemoved:", v5);

  -[NSMutableArray removeObject:](self->_animations, "removeObject:", v5);
}

- (NSDate)date
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateBlock + 2))();
}

- (void)updateSunLocationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NUNIScene date](self, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NUNIScene updateSunLocationForDate:animated:](self, "updateSunLocationForDate:animated:", v5, v3);

}

- (void)updateSunLocationForDate:(id)a3 animated:(BOOL)a4
{
  id v6;
  double v7;
  int32x2_t v8;
  NUNIAnimation *v9;
  const float *v10;
  double v11;
  NUNIAnimation *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  uint64_t i;
  void *v21;
  float v22;
  int32x2_t v23;
  float v24;
  int32x2_t v25;
  float32x2_t v26;
  int32x2_t v27;
  int32x2_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float32x2_t v39;
  NUNIAnimation *v40;
  const float *v41;
  double v42;
  NUNIAnimation *v43;
  NUNIAnimation *v44;
  const float *v45;
  double v46;
  NUNIAnimation *v47;
  double v48;
  NUNIAnimation *v49;
  NUNIAnimation *v50;
  NUNIAnimation *v51;
  const float *v52;
  double v53;
  NUNIAnimation *v54;
  double v55;
  NUNIAnimation *v56;
  const float *v57;
  double v58;
  NUNIAnimation *v59;
  int32x2_t v60;
  int32x2_t v61;
  int32x2_t v62;
  float32x2_t v63;
  int32x2_t v64;
  float v65;
  int32x2_t v66;
  float32x2_t v67;
  uint64_t v68;
  unint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_isUpdateNeeded = 0;
  objc_msgSend(v6, "timeIntervalSince1970");
  v8.i32[1] = 1098781496;
  *(float *)v8.i32 = v7 / 31536000.0;
  if (a4)
  {
    if (*(float *)&self->_anon_78[20] != *(float *)v8.i32)
    {
      v64 = v8;
      v9 = [NUNIAnimation alloc];
      v10 = (const float *)&self->_anon_78[20];
      *(_QWORD *)&v11 = vld1q_dup_f32(v10).u64[0];
      v12 = -[NUNIAnimation initWithAnimatable:from:to:key:](v9, "initWithAnimatable:from:to:key:", self, 4, v11, *(double *)vdupq_lane_s32(v64, 0).i64);
      -[NUNIScene addAnimation:](self, "addAnimation:", v12);

    }
  }
  else
  {
    v65 = v7 / 31536000.0;
    -[NUNIScene removeAllAnimationsFor:withKeys:](self, "removeAllAnimationsFor:withKeys:", self, 16);
    *(float *)&self->_anon_78[20] = v65;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v13 = self->_spheroids;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v71;
    v17 = (float32x2_t)vdup_n_s32(0x40C90FDBu);
    v18 = (float32x2_t)vdup_n_s32(0xC0C90FDB);
    v19 = (float32x2_t)vdup_n_s32(0x40490FDBu);
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v71 != v16)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        if (a4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "angle");
          *(float *)v23.i32 = v22 + (float)(floorf(v22 / 6.2832) * -6.2832);
          v60 = v23;
          objc_msgSend(v21, "equatorRotation");
          *(float *)v25.i32 = v24 + (float)(floorf(v24 / 6.2832) * -6.2832);
          v66 = v25;
          objc_msgSend(v21, "light");
          v63 = vmla_f32(v26, v18, vrndm_f32(vdiv_f32(v26, v17)));
          objc_msgSend(v21, "distance");
          v61 = v27;
          objc_msgSend(v21, "radius");
          v62 = v28;
          v68 = 0;
          v69 = 0;
          v67 = 0;
          objc_msgSend(v21, "date:toEquatorRotation:toAngle:toLight:toDistance:toRadius:", v6, &v69, (char *)&v69 + 4, &v67, (char *)&v68 + 4, &v68);
          v29 = *((float *)&v69 + 1) + (float)(floorf(*((float *)&v69 + 1) / 6.2832) * -6.2832);
          v30 = vabds_f32(v29, *(float *)v60.i32);
          if (v29 <= *(float *)v60.i32)
            v31 = 6.2832;
          else
            v31 = -6.2832;
          if (v30 <= 3.1416)
            v32 = -0.0;
          else
            v32 = v31;
          v33 = v29 + v32;
          v34 = *(float *)&v69 + (float)(floorf(*(float *)&v69 / 6.2832) * -6.2832);
          v35 = vabds_f32(v34, *(float *)v66.i32);
          if (v34 <= *(float *)v66.i32)
            v36 = 6.2832;
          else
            v36 = -6.2832;
          if (v35 <= 3.1416)
            v37 = -0.0;
          else
            v37 = v36;
          v38 = v34 + v37;
          v69 = __PAIR64__(LODWORD(v33), LODWORD(v38));
          v39 = vmla_f32(v67, v18, vrndm_f32(vdiv_f32(v67, v17)));
          v67 = vadd_f32(v39, (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(vabd_f32(v39, v63), v19), vbsl_s8((int8x8_t)vcgt_f32(v39, v63), (int8x8_t)v18, (int8x8_t)v17), (int8x8_t)0x8000000080000000));
          if (*(float *)v60.i32 != v33)
          {
            v40 = [NUNIAnimation alloc];
            v41 = (const float *)&v69 + 1;
            *(_QWORD *)&v42 = vld1q_dup_f32(v41).u64[0];
            v43 = -[NUNIAnimation initWithAnimatable:from:to:key:](v40, "initWithAnimatable:from:to:key:", v21, 7, *(double *)vdupq_lane_s32(v60, 0).i64, v42);
            -[NUNIScene addAnimation:](self, "addAnimation:", v43);

            LODWORD(v38) = v69;
          }
          if (*(float *)v66.i32 != v38)
          {
            v44 = [NUNIAnimation alloc];
            v45 = (const float *)&v69;
            *(_QWORD *)&v46 = vld1q_dup_f32(v45).u64[0];
            v47 = -[NUNIAnimation initWithAnimatable:from:to:key:](v44, "initWithAnimatable:from:to:key:", v21, 1, *(double *)vdupq_lane_s32(v66, 0).i64, v46);
            -[NUNIScene addAnimation:](self, "addAnimation:", v47);

          }
          v48 = COERCE_DOUBLE(vmvn_s8((int8x8_t)vceq_f32(v63, v67)));
          if ((LOBYTE(v48) & 1) != 0 || (BYTE4(v48) & 1) != 0)
          {
            v49 = [NUNIAnimation alloc];
            v50 = -[NUNIAnimation initWithAnimatable:from:to:key:](v49, "initWithAnimatable:from:to:key:", v21, 3, *(double *)&v63, *(double *)&v67);
            -[NUNIScene addAnimation:](self, "addAnimation:", v50);

          }
          if (*(float *)v61.i32 != *((float *)&v68 + 1))
          {
            v51 = [NUNIAnimation alloc];
            v52 = (const float *)&v68 + 1;
            *(_QWORD *)&v53 = vld1q_dup_f32(v52).u64[0];
            v54 = -[NUNIAnimation initWithAnimatable:from:to:key:](v51, "initWithAnimatable:from:to:key:", v21, 4, *(double *)vdupq_lane_s32(v61, 0).i64, v53);
            -[NUNIScene addAnimation:](self, "addAnimation:", v54);

          }
          LODWORD(v48) = v68;
          v55 = *(double *)&v62;
          if (*(float *)v62.i32 != *(float *)&v68)
          {
            v56 = [NUNIAnimation alloc];
            v57 = (const float *)&v68;
            *(_QWORD *)&v58 = vld1q_dup_f32(v57).u64[0];
            v59 = -[NUNIAnimation initWithAnimatable:from:to:key:](v56, "initWithAnimatable:from:to:key:", v21, 5, *(double *)vdupq_lane_s32(v62, 0).i64, v58);
            -[NUNIScene addAnimation:](self, "addAnimation:", v59);

          }
        }
        else
        {
          -[NUNIScene removeAllAnimationsFor:withKeys:](self, "removeAllAnimationsFor:withKeys:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), 154);
          objc_msgSend(v21, "updateSunLocationForDate:", v6);
        }
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v74, 16, v48, v55);
    }
    while (v15);
  }

}

- (id)spheroidOfType:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v4 = self->_spheroids;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateFromDateIfNeeded
{
  if (self->_isUpdateNeeded)
  {
    if (self->_anon_78[16])
    {
      -[NUNIScene updateSunLocationAnimated:](self, "updateSunLocationAnimated:", 0);
      self->_isUpdateNeeded = 0;
    }
  }
}

- (void)setCamera:(float)a3 target:up:roll:
{
  __int128 v3;
  __int128 v4;
  float v5;

  *(_OWORD *)&self->_structure.var0 = *(_OWORD *)&a3;
  *(_OWORD *)&self->_structure.var3 = v3;
  *(_OWORD *)&self->_structure.var5 = v4;
  self->_structure.var8.var0.var1 = v5;
}

- (__n128)cameraPosition
{
  return a1[3];
}

- (__n128)cameraTarget
{
  return a1[4];
}

- (__n128)cameraUp
{
  return a1[5];
}

- (float)cameraRoll
{
  return self->_structure.var8.var0.var1;
}

- (unint64_t)projectionType
{
  return *(_QWORD *)&self->_anon_78[8];
}

- (float)yearsSince1970
{
  return *(float *)&self->_anon_78[20];
}

- (const)structure
{
  return &self->_structure;
}

- (float)cameraOrbit
{
  return self->_structure.var8.var0.var0;
}

- (unint64_t)snap
{
  return *(_QWORD *)&self->_structure.var9;
}

- (unint64_t)backgroundType
{
  return *(_QWORD *)&self->_structure.var11;
}

- (unint64_t)collectionType
{
  return *(_QWORD *)self->_anon_78;
}

- (double)cameraOffset
{
  return *(double *)(a1 + 144);
}

- (CLLocationCoordinate2D)offsetCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(float *)&self->_anon_78[36];
  v3 = *(float *)&self->_anon_78[32];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (float)locationDotAlpha
{
  return *(float *)&self->_anon_78[40];
}

- (float)locationDotPulse
{
  return *(float *)&self->_anon_78[44];
}

- (float)locationDotPulseOverrideAlpha
{
  return *(float *)&self->_anon_78[48];
}

- (float)locationDotMaximumRadius
{
  return *(float *)&self->_anon_78[52];
}

- (BOOL)isUpdatable
{
  return self->_anon_78[16];
}

- (void)setCameraOrbit:(float)a3
{
  self->_structure.var8.var0.var0 = a3;
}

- (void)setBackgroundType:(unint64_t)a3
{
  *(_QWORD *)&self->_structure.var11 = a3;
}

- (void)setCollectionType:(unint64_t)a3
{
  *(_QWORD *)self->_anon_78 = a3;
}

- (void)setCameraOffset:(NUNIScene *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_anon_78[24] = v2;
}

- (void)setOffsetCoordinate:(CLLocationCoordinate2D)a3
{
  float longitude;
  float latitude;

  longitude = a3.longitude;
  latitude = a3.latitude;
  *(float *)&self->_anon_78[32] = longitude;
  *(float *)&self->_anon_78[36] = latitude;
}

- (void)setLocationDotAlpha:(float)a3
{
  *(float *)&self->_anon_78[40] = a3;
}

- (void)setLocationDotPulse:(float)a3
{
  *(float *)&self->_anon_78[44] = a3;
}

- (void)setLocationDotPulseOverrideAlpha:(float)a3
{
  *(float *)&self->_anon_78[48] = a3;
}

- (void)setLocationDotMaximumRadius:(float)a3
{
  *(float *)&self->_anon_78[52] = a3;
}

- (void)setUpdatable:(BOOL)a3
{
  self->_anon_78[16] = a3;
}

- (void)setSnap:(unint64_t)a3
{
  NUNISpheroid *focus;
  NUNISpheroid *v5;

  if (*(_QWORD *)&self->_structure.var9 != a3)
  {
    *(_QWORD *)&self->_structure.var9 = a3;
    if (a3 == 24)
    {
      focus = self->_focus;
      self->_focus = 0;
    }
    else
    {
      -[NUNIScene spheroidOfType:](self, "spheroidOfType:");
      v5 = (NUNISpheroid *)objc_claimAutoreleasedReturnValue();
      focus = self->_focus;
      self->_focus = v5;
    }

    -[NUNIScene updateCamera](self, "updateCamera");
  }
}

- (NUNISpheroid)focus
{
  return self->_focus;
}

- (NSArray)spheroids
{
  return &self->_spheroids->super;
}

- (id)currentDateBlock
{
  return self->_currentDateBlock;
}

- (void)setCurrentDateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong(&self->_currentDateBlock, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_spheroids, 0);
}

@end
