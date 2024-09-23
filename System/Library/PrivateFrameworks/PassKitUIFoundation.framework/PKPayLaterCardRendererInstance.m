@implementation PKPayLaterCardRendererInstance

- (PKPayLaterCardRendererInstance)initWithPosition:(double)a3 scale:(int64_t)a4 category:
{
  PKPayLaterCardRendererInstance *v5;
  PKPayLaterCardRendererInstance *v6;
  __int128 v8;
  objc_super v9;

  v8 = *(_OWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterCardRendererInstance;
  v5 = -[PKPayLaterCardRendererInstance init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)v5->_position = v8;
    *(_OWORD *)v5->_velocity = 0u;
    v5->_angularyVelocity = (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * 2.0 + -1.0;
    v6->_size = (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * 0.25 + 1.0;
    *(_OWORD *)&v6->_explodeTime = xmmword_213A5D9C0;
    v6->_mass = (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * 0.1 + 0.9;
    v6->_scale = 1.0;
    v6->_category = a4;
    *(_OWORD *)v6->_axis = xmmword_213A5D9D0;
    *(_OWORD *)v6->_forces = 0u;
    *(_OWORD *)v6->_smoothedPosition = v8;
  }
  return v6;
}

- (void)explodeAtTime:(double)a3
{
  self->_explodeTime = a3;
}

- (BOOL)isIgnoredAtTime:(double)a3
{
  double explodeTime;

  explodeTime = self->_explodeTime;
  return explodeTime + 0.4 < a3 && explodeTime >= 0.0;
}

- (void)addForces:(PKPayLaterCardRendererInstance *)self
{
  float32x4_t v2;

  *(float32x4_t *)self->_forces = vaddq_f32(*(float32x4_t *)self->_forces, v2);
}

- (void)applyForces
{
  double mass;
  double angle;
  float v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  double v9;

  angle = self->_angle;
  mass = self->_mass;
  v4 = mass;
  v5 = *(float32x4_t *)self->_smoothedPosition;
  v6 = vmlaq_n_f32(*(float32x4_t *)self->_velocity, *(float32x4_t *)self->_forces, v4);
  v7 = vaddq_f32(v6, *(float32x4_t *)self->_position);
  v8 = vmlaq_f32(vmulq_f32(v7, (float32x4_t)vdupq_n_s32(0x3DCCCCCDu)), (float32x4_t)vdupq_n_s32(0x3F666666u), v5);
  v9 = self->_angularyVelocity + (float)(v8.f32[0] - v5.f32[0]) * -0.005;
  *(float32x4_t *)self->_position = v7;
  *(float32x4_t *)self->_velocity = vmulq_f32(v6, (float32x4_t)vdupq_n_s32(0x3F6B851Fu));
  *(_OWORD *)self->_forces = 0u;
  *(float32x4_t *)self->_smoothedPosition = v8;
  self->_angle = angle + v9 * mass;
  self->_angularyVelocity = v9 * 0.92;
}

- (void)setPosition:(PKPayLaterCardRendererInstance *)self andVelocity:(SEL)a2
{
  __int128 v2;
  __int128 v3;

  *(_OWORD *)self->_position = v2;
  *(_OWORD *)self->_velocity = v3;
}

- (__n128)uniformWithSkew:(double)a3@<D0> now:(double)a4@<D1> waveAmplitude:(double)a5@<D2>
{
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  float v19;
  double v20;
  double v21;
  unint64_t v22;
  __CFString *v23;
  id v24;
  __int128 v25;
  id v26;
  __n128 v27;
  double v28;
  float v29;
  unsigned int v30;
  __double2 v36;
  unsigned int v37;
  unsigned int v38;
  unint64_t v39;
  unsigned int v40;
  __int128 v41;
  __n128 result;
  float v43;
  float v44;
  float v45;
  __n128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v8 = *(double *)(a1 + 24);
  if (v8 >= 0.0)
  {
    v11 = a4 - v8;
    v12 = 1.0 - pow(1.0 - fmin(fmax((a4 - v8 + -0.04) / 0.28, 0.0), 1.0), 3.0);
    v13 = (1.0 - pow(1.0 - fmin(fmax(v11 / 0.08, 0.0), 1.0), 3.0)) * 0.1 + 1.0;
    v14 = v13 + pow(fmin(fmax((v11 + -0.08) / 0.24, 0.0), 1.0), 3.0) * -0.6;
    v15 = fmin(fmax((v11 + -0.32) / 0.08, 0.0), 1.0);
    v16 = v14 + pow(v15, 3.0) * 0.5;
    if (v11 >= 0.4)
      v17 = 0.0;
    else
      v17 = 1.0;
    v9 = v17 * v16;
    v18 = pow(1.0 - v15, 3.0) + -1.0 + 1.0;
    v19 = v12 * 1.05;
    v44 = v19;
    v10 = v18;
  }
  else
  {
    v44 = 0.0;
    v9 = 1.0;
    v10 = 1.0;
  }
  v45 = v10;
  v20 = *(double *)(a1 + 48);
  v21 = *(double *)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 56) - 1;
  v48 = 0u;
  v49 = *(_OWORD *)(a1 + 128);
  v47 = 0u;
  if (v22 <= 6)
  {
    v23 = off_24D0A0F50[v22];
    objc_msgSend(MEMORY[0x24BE6EA88], "colorFromString:", off_24D0A0F18[v22]);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(double *)&v25 = PKMakeFloat4FromCGColor((CGColor *)objc_msgSend(v24, "CGColor"));
    v48 = v25;
    objc_msgSend(MEMORY[0x24BE6EA88], "colorFromString:", v23);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27.n128_f64[0] = PKMakeFloat4FromCGColor((CGColor *)objc_msgSend(v26, "CGColor"));
    v47 = v27;

  }
  v28 = *((float *)&v49 + 2) + -0.5;
  v29 = *(float *)&v49 - v28 * *(float *)&a3;
  v43 = v29;
  *(float *)&v30 = *((float *)&v49 + 1) - v28 * *((float *)&a3 + 1) - cos(*(float *)&v49 / v20 * 0.25) * a5;
  __asm { FMOV            V1.4S, #1.0 }
  *(_QWORD *)&_Q1 = __PAIR64__(v30, LODWORD(v43));
  DWORD2(_Q1) = DWORD2(v49);
  v50 = _Q1;
  v36 = __sincos_stret(v21);
  *(float *)&v37 = v9 * v20 * v36.__sinval;
  *(float *)&v38 = v9 * v20 * v36.__cosval;
  *(float *)&v39 = -*(float *)&v37;
  HIDWORD(v39) = v38;
  *(_OWORD *)a2 = __PAIR64__(v37, v38);
  *(_OWORD *)(a2 + 16) = v39;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 48) = v50;
  *(_OWORD *)(a2 + 64) = v48;
  *(float *)&v40 = v9 * v20 * 1.5;
  *(_QWORD *)&v41 = __PAIR64__(v40, LODWORD(v44));
  *((_QWORD *)&v41 + 1) = LODWORD(v45);
  result = v47;
  *(__n128 *)(a2 + 80) = v47;
  *(_OWORD *)(a2 + 96) = v41;
  return result;
}

- (__n128)position
{
  return a1[4];
}

- (__n128)velocity
{
  return a1[5];
}

- (double)angularyVelocity
{
  return self->_angularyVelocity;
}

- (double)size
{
  return self->_size;
}

- (double)explodeTime
{
  return self->_explodeTime;
}

- (double)angle
{
  return self->_angle;
}

- (double)mass
{
  return self->_mass;
}

- (double)scale
{
  return self->_scale;
}

- (__n128)axis
{
  return a1[6];
}

- (int64_t)category
{
  return self->_category;
}

- (__n128)forces
{
  return a1[7];
}

- (__n128)smoothedPosition
{
  return a1[8];
}

@end
