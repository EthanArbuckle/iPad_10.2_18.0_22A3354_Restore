@implementation NUNIAnimation

- (NUNIAnimation)initWithAnimatable:(id)a3 values:count:key:
{
  const void *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  const void *v8;
  id v10;
  NUNIAnimation *v11;
  NUNIAnimation *v12;
  objc_super v14;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NUNIAnimation;
  v11 = -[NUNIAnimation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_animatable, v10);
    v12->_key = v6;
    v12->_function = 3;
    *(_QWORD *)&v12->_startTime = 0x3F800000BF800000;
    if (v7 >= 76)
      -[NUNIAnimation initWithAnimatable:values:count:key:].cold.1();
    memcpy(v12->_values, v8, 16 * v7);
    v12->_valuesCount = v7;
  }

  return v12;
}

- (NUNIAnimation)initWithAnimatable:(id)a3 from:(unint64_t)a4 to:ctrl1:ctrl2:key:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  id v10;
  NUNIAnimation *v11;
  NUNIAnimation *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v16 = v6;
  v17 = v7;
  v14 = v5;
  v15 = v4;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUNIAnimation;
  v11 = -[NUNIAnimation init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_animatable, v10);
    *(_OWORD *)v12->_to = v14;
    *(_OWORD *)v12->_from = v15;
    v12->_key = a4;
    *(_OWORD *)v12->_ctrl1 = v16;
    *(_OWORD *)v12->_ctrl2 = v17;
    v12->_function = 1;
    *(_QWORD *)&v12->_startTime = 0x3F800000BF800000;
  }

  return v12;
}

- (NUNIAnimation)initWithAnimatable:(NUNIAnimation *)self from:(SEL)a2 to:(id)a3 key:(unint64_t)a4
{
  return -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](self, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", a3, a4);
}

- (NUNIAnimation)initWithAnimatable:(id)a3 value:(unint64_t)a4 key:
{
  id v6;
  NUNIAnimation *v7;

  v6 = a3;
  objc_msgSend(v6, "animatedFloatForKey:", a4);
  v7 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](self, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v6, a4);

  return v7;
}

- (BOOL)update:(float)a3
{
  float startTime;
  BOOL v4;

  self->_prevTime = a3;
  startTime = self->_startTime;
  if (startTime < 0.0)
  {
    startTime = self->_delay + a3;
    self->_startTime = startTime;
  }
  if (self->_paused)
    return 1;
  a3 = fmaxf(a3 - startTime, 0.0) / self->_duration;
  if (a3 <= 1.0)
  {
    v4 = 1;
  }
  else if (self->_repeat)
  {
    self->_startTime = -1.0;
    v4 = 1;
    a3 = 0.0;
  }
  else
  {
    v4 = 0;
    a3 = 1.0;
  }
  -[NUNIAnimation apply:](self, "apply:", *(double *)&a3);
  return v4;
}

- (void)apply:(float)a3
{
  unint64_t v4;
  int valuesCount;
  int v6;
  float v7;
  int v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  int v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float32x4_t v22;
  float v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float v31;
  float v32;
  float32x4_t v33;
  int8x16_t v34;
  float32x4_t v35;
  int8x16_t v36;
  float v37;
  float v38;
  BOOL v39;
  float v40;
  uint64_t v41;
  float32x2_t v42;
  float32x2_t v43;
  float v44;
  float32x4_t v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float32x4_t v50;
  int8x16_t v51;
  float32x2_t v52;
  unsigned __int32 v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x4_t v56;
  float v57;
  float v58;
  float32x4_t v59;
  unint64_t v60;
  float32x4_t v61;
  float v62;
  id WeakRetained;

  switch(self->_function)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
      a3 = (float)(a3 * a3) * (float)((float)(a3 * -2.0) + 3.0);
LABEL_3:
      v60 = vmlaq_n_f32(*(float32x4_t *)self->_from, vsubq_f32(*(float32x4_t *)self->_to, *(float32x4_t *)self->_from), a3).u64[0];
      goto LABEL_24;
    case 2uLL:
      v60 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)self->_from, (float)(1.0 - a3) * (float)((float)(1.0 - a3) * (float)(1.0 - a3))), *(float32x4_t *)self->_ctrl1, (float)((float)((float)(1.0 - a3) * (float)(1.0 - a3)) * 3.0) * a3), *(float32x4_t *)self->_ctrl2, (float)(a3 * a3) * (float)((float)(1.0 - a3) * 3.0)), *(float32x4_t *)self->_to, (float)(a3 * a3) * a3).u64[0];
      goto LABEL_24;
    case 3uLL:
      valuesCount = self->_valuesCount;
      v6 = valuesCount - 1;
      v7 = (float)(valuesCount - 1);
      v8 = valuesCount - 2;
      if ((int)(float)(v7 * a3) < v8)
        v8 = (int)(float)(v7 * a3);
      v9 = v8 + 1;
      v10 = (float)v8 / v7;
      v11 = (float)(int)v9 / v7;
      v13 = (float)(a3 - v10) / (float)(v11 - v10);
      v14 = v13 * v13;
      v15 = v13 * (float)(v13 * v13);
      if (v8 <= 1)
        v16 = 1;
      else
        v16 = v8;
      v17 = v16 - 1;
      if (v8 + 2 < v6)
        v6 = v8 + 2;
      v18 = v14 * 3.0;
      v19 = 1.0 - (float)((float)(v14 * 3.0) - (float)(v15 * 2.0));
      v20 = v13 + (float)(v15 + (float)(v14 * -2.0));
      v21 = v15 - v14;
      v22 = *(float32x4_t *)&self->_values[16 * v8];
      v23 = v18 + (float)(v15 * -2.0);
      v24 = *(float32x4_t *)&self->_values[16 * v9];
      v25 = vsubq_f32(v24, v22);
      v12 = v11 - v10;
      v4 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v25, (float)(v10 - (float)((float)v17 / v7)) / (float)(v12 + (float)(v10 - (float)((float)v17 / v7)))), vsubq_f32(v22, *(float32x4_t *)&self->_values[16 * v17]), v12 / (float)(v12 + (float)(v10 - (float)((float)v17 / v7)))), v20), v22, v19), vmlaq_n_f32(vmulq_n_f32(vsubq_f32(*(float32x4_t *)&self->_values[16 * v6], v24), v12 / (float)(v12 + (float)((float)((float)v6 / v7) - v11))), v25, (float)((float)((float)v6 / v7) - v11) / (float)(v12 + (float)((float)((float)v6 / v7) - v11))), v21),
             v24,
             v23).u64[0];
      goto LABEL_23;
    case 4uLL:
      v26 = *(float32x4_t *)self->_from;
      v27 = *(float32x4_t *)self->_to;
      v28 = vmulq_f32(v26, v27);
      v29 = (float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL);
      *(float32x2_t *)v28.f32 = vadd_f32(*(float32x2_t *)v28.f32, *(float32x2_t *)v29.f32);
      v28.f32[0] = vaddv_f32(*(float32x2_t *)v28.f32);
      v29.i32[0] = 0;
      v30 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v28, v29)), 0), (int8x16_t)vnegq_f32(v27), (int8x16_t)v27);
      v31 = 1.0;
      v61 = v26;
      v62 = a3;
      v32 = 1.0 - a3;
      v33 = vsubq_f32(v26, v30);
      v34 = (int8x16_t)vmulq_f32(v33, v33);
      v59 = v30;
      v35 = vaddq_f32(v26, v30);
      v36 = (int8x16_t)vmulq_f32(v35, v35);
      v37 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v36.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL)))));
      v38 = v37 + v37;
      v39 = (float)(v37 + v37) == 0.0;
      v40 = 1.0;
      if (!v39)
        v40 = sinf(v38) / v38;
      v41 = LODWORD(v40);
      v42 = vrecpe_f32((float32x2_t)LODWORD(v40));
      v43 = vmul_f32(v42, vrecps_f32((float32x2_t)v41, v42));
      LODWORD(v44) = vmul_f32(v43, vrecps_f32((float32x2_t)v41, v43)).u32[0];
      if ((float)(v32 * v38) != 0.0)
      {
        v57 = v44;
        v43.f32[0] = sinf(v32 * v38);
        v44 = v57;
        v31 = v43.f32[0] / (float)(v32 * v38);
      }
      v43.f32[0] = v32 * (float)(v44 * v31);
      v45 = (float32x4_t)vdupq_lane_s32((int32x2_t)v43, 0);
      v46 = v62;
      v47 = v38 * v62;
      v48 = 1.0;
      if (v47 != 0.0)
      {
        v56 = v45;
        v58 = v44;
        v49 = sinf(v47);
        v45 = v56;
        v44 = v58;
        v46 = v62;
        v48 = v49 / v47;
      }
      v50 = vmlaq_f32(vmulq_n_f32(v59, (float)(v44 * v48) * v46), v61, v45);
      v51 = (int8x16_t)vmulq_f32(v50, v50);
      v52 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
      if (vaddv_f32(v52) == 0.0)
      {
        v4 = 0;
      }
      else
      {
        v53 = vadd_f32(v52, (float32x2_t)vdup_lane_s32((int32x2_t)v52, 1)).u32[0];
        v54 = vrsqrte_f32((float32x2_t)v53);
        v55 = vmul_f32(v54, vrsqrts_f32((float32x2_t)v53, vmul_f32(v54, v54)));
        v4 = vmulq_n_f32(v50, vmul_f32(v55, vrsqrts_f32((float32x2_t)v53, vmul_f32(v55, v55))).f32[0]).u64[0];
      }
      goto LABEL_23;
    default:
      v4 = 0;
LABEL_23:
      v60 = v4;
LABEL_24:
      WeakRetained = objc_loadWeakRetained((id *)&self->_animatable);
      objc_msgSend(WeakRetained, "setAnimatedFloat:forKey:", self->_key, *(double *)&v60);

      return;
  }
}

- (void)setPaused:(BOOL)a3
{
  float prevTime;

  if (self->_paused != a3)
  {
    self->_paused = a3;
    prevTime = self->_prevTime;
    if (a3)
      self->_pauseTime = prevTime;
    else
      self->_startTime = prevTime - (float)(self->_pauseTime - self->_startTime);
  }
}

- (float)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(float)a3
{
  self->_startTime = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

- (float)delay
{
  return self->_delay;
}

- (void)setDelay:(float)a3
{
  self->_delay = a3;
}

- (__n128)from
{
  return a1[82];
}

- (void)setFrom:(NUNIAnimation *)self
{
  __int128 v2;

  *(_OWORD *)self->_from = v2;
}

- (__n128)to
{
  return a1[83];
}

- (void)setTo:(NUNIAnimation *)self
{
  __int128 v2;

  *(_OWORD *)self->_to = v2;
}

- (BOOL)isRepeat
{
  return self->_repeat;
}

- (void)setRepeat:(BOOL)a3
{
  self->_repeat = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (unint64_t)function
{
  return self->_function;
}

- (void)setFunction:(unint64_t)a3
{
  self->_function = a3;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (NUNIAnimatable)animatable
{
  return (NUNIAnimatable *)objc_loadWeakRetained((id *)&self->_animatable);
}

- (void)setAnimatable:(id)a3
{
  objc_storeWeak((id *)&self->_animatable, a3);
}

- (NUNIAnimationObserver)observer
{
  return (NUNIAnimationObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_animatable);
}

- (void)initWithAnimatable:values:count:key:.cold.1()
{
  __assert_rtn("-[NUNIAnimation initWithAnimatable:values:count:key:]", "NUNIAnimation.m", 30, "false");
}

@end
