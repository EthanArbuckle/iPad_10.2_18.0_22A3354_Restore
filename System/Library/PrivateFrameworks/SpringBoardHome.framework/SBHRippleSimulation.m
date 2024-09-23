@implementation SBHRippleSimulation

- (SBHRippleSimulation)initWithRows:(unint64_t)a3 columns:(unint64_t)a4 resolution:(unint64_t)a5 style:(unint64_t)a6
{
  char *v10;
  SBHRippleSimulation *v11;
  int32x2_t v12;
  int64x2_t v13;
  double v14;
  double rippleTouchRadius;
  unint64_t v16;
  double v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBHRippleSimulation;
  v10 = -[SBHRippleSimulation init](&v20, sel_init);
  v11 = (SBHRippleSimulation *)v10;
  if (v10)
  {
    v10[80] = 1;
    *((_QWORD *)v10 + 3) = a5;
    *((_QWORD *)v10 + 4) = a6;
    v12 = vdup_n_s32(a6 == 1);
    v13.i64[0] = v12.u32[0];
    v13.i64[1] = v12.u32[1];
    *(int8x16_t *)(v10 + 40) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v13, 0x3FuLL)), (int8x16_t)xmmword_1D0191530, (int8x16_t)xmmword_1D0191520);
    objc_msgSend(v10, "convertGridToRippleCoordinate:", (double)a4, (double)a3);
    rippleTouchRadius = v11->_rippleTouchRadius;
    v16 = (unint64_t)(rippleTouchRadius + ceil(v14) + 1.0);
    v18 = rippleTouchRadius + ceil(v17) + 1.0;
    v11->_rippleWidth = v16;
    v11->_rippleHeight = (unint64_t)v18;
    v11->_positionBuffer = (double *)malloc_type_calloc(v16 * (unint64_t)v18, 8uLL, 0x100004000313F17uLL);
    v11->_velocityBuffer = (double *)malloc_type_calloc(v11->_rippleHeight * v11->_rippleWidth, 8uLL, 0x100004000313F17uLL);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_positionBuffer);
  free(self->_velocityBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SBHRippleSimulation;
  -[SBHRippleSimulation dealloc](&v3, sel_dealloc);
}

- (void)clear
{
  unint64_t rippleWidth;
  uint64_t v3;
  unint64_t rippleHeight;
  double *velocityBuffer;
  double *positionBuffer;
  int v7;
  unint64_t v8;
  int v9;

  rippleWidth = self->_rippleWidth;
  if (rippleWidth)
  {
    v3 = 0;
    rippleHeight = self->_rippleHeight;
    do
    {
      if (rippleHeight)
      {
        positionBuffer = self->_positionBuffer;
        velocityBuffer = self->_velocityBuffer;
        v7 = v3;
        v8 = rippleHeight;
        do
        {
          v9 = v7 & ~(v7 >> 31);
          if ((int)rippleHeight * (int)rippleWidth - 1 < v9)
            v9 = rippleHeight * rippleWidth - 1;
          velocityBuffer[v9] = 0.0;
          positionBuffer[v9] = 0.0;
          v7 += rippleWidth;
          --v8;
        }
        while (v8);
      }
      ++v3;
    }
    while (v3 != rippleWidth);
  }
}

- (CGPoint)convertGridToRippleCoordinate:(CGPoint)a3
{
  double rippleResolution;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  rippleResolution = (double)(uint64_t)self->_rippleResolution;
  v4 = (a3.x + -1.0) * rippleResolution;
  v5 = (a3.y + -1.0) * rippleResolution;
  v6 = ceil(self->_rippleTouchRadius);
  v7 = v4 + v6 + 0.5;
  v8 = v5 + v6 + 0.5;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)createRippleAtGridCoordinate:(CGPoint)a3 strength:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double rippleTouchRadius;
  uint64_t v10;
  int64_t v11;
  double rippleTouchHeight;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int rippleWidth;
  int v24;
  int v25;

  self->_rippleTouchHeight = *(double *)&SBHRippleDefaultTouchHeight * a4;
  -[SBHRippleSimulation convertGridToRippleCoordinate:](self, "convertGridToRippleCoordinate:", a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  self->_settled = 0;
  -[SBHRippleSimulation clear](self, "clear");
  rippleTouchRadius = self->_rippleTouchRadius;
  v10 = (uint64_t)(v6 - rippleTouchRadius + 1.0);
  v11 = vcvtpd_s64_f64(v6 + rippleTouchRadius + 1.0);
  if (v10 < v11)
  {
    rippleTouchHeight = self->_rippleTouchHeight;
    v13 = vcvtpd_s64_f64(v8 + rippleTouchRadius + 1.0);
    do
    {
      if ((uint64_t)(v8 - rippleTouchRadius + 1.0) < v13)
      {
        v14 = (uint64_t)(v8 - rippleTouchRadius + 1.0);
        do
        {
          v15 = ((double)v10 - v6) * ((double)v10 - v6) + ((double)v14 - v8) * ((double)v14 - v8);
          v16 = self->_rippleTouchRadius;
          if (v15 < v16 * v16)
          {
            v17 = sqrt(v15);
            v18 = fmin(fmax(1.0 - v17 / v16, 0.0), 1.0);
            v19 = rippleTouchHeight * (v18 * v18 * (v18 * -2.0 + 3.0));
            v20 = v17 / (v16 + 1.0) * (v17 / (v16 + 1.0));
            if (v20 <= 1.0)
              v21 = 1.0 - v20;
            else
              v21 = 0.0;
            v22 = v19 * v21;
            rippleWidth = self->_rippleWidth;
            v24 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
            v25 = (v10 + rippleWidth * v14) & ~(((int)v10 + rippleWidth * (int)v14) >> 31);
            if (v24 < v25)
              v25 = v24;
            self->_positionBuffer[v25] = v22;
          }
          ++v14;
        }
        while (v13 != v14);
      }
      ++v10;
    }
    while (v10 != v11);
  }
}

- (void)step:(double)a3
{
  unint64_t rippleHeight;
  int64_t v5;
  double v6;
  float v7;
  double v8;
  float v9;
  float v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  int rippleWidth;
  int v18;
  double *velocityBuffer;
  double *positionBuffer;
  uint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  double v26;
  int v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  int v33;
  uint64_t v34;
  char v35;
  int v36;
  int v37;
  double *v38;
  double *v39;
  int v40;
  unint64_t v41;
  int v42;
  double v43;

  rippleHeight = self->_rippleHeight;
  v5 = self->_rippleWidth - 1;
  v6 = a3 * 60.0 * self->_rippleTimeStep;
  UIAnimationDragCoefficient();
  v8 = v6 / v7;
  v9 = v8;
  v10 = powf(0.72, v9);
  if (v5 < 2)
  {
    v35 = 1;
LABEL_29:
    if ((v35 & 1) != 0)
      self->_settled = 1;
    return;
  }
  v11 = rippleHeight - 1;
  v12 = v10;
  v13 = rippleHeight - 2;
  v14 = 1;
  v15 = 1;
  do
  {
    if (v11 <= 1)
    {
      v21 = v15 + 1;
    }
    else
    {
      v16 = 0;
      rippleWidth = self->_rippleWidth;
      v18 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
      positionBuffer = self->_positionBuffer;
      velocityBuffer = self->_velocityBuffer;
      v21 = v15 + 1;
      v22 = v13;
      do
      {
        v23 = (v15 + rippleWidth + v16) & ~(((int)v15 + rippleWidth + v16) >> 31);
        if (v18 < v23)
          v23 = v18;
        v24 = (v15 + rippleWidth - 1 + v16) & ~(((int)v15 + rippleWidth - 1 + v16) >> 31);
        if (v18 < v24)
          v24 = v18;
        v25 = (v15 + 1 + rippleWidth + v16) & ~(((int)v15 + 1 + rippleWidth + v16) >> 31);
        if (v18 < v25)
          v25 = v18;
        v26 = velocityBuffer[v24];
        v27 = (v15 + 2 * rippleWidth + v16) & ~(((int)v15 + 2 * rippleWidth + v16) >> 31);
        v28 = v26 + velocityBuffer[v25];
        if (v18 < v27)
          v27 = v18;
        v29 = velocityBuffer[v27];
        v30 = (v15 + v16) & ~(((int)v15 + v16) >> 31);
        v31 = v28 + v29;
        if (v18 < v30)
          v30 = v18;
        v32 = (positionBuffer[v23] + v8 * -(velocityBuffer[v23] - (v31 + velocityBuffer[v30]) * 0.25)) * v12;
        positionBuffer[v23] = v32;
        v14 &= fabs(v32) <= 0.05;
        v16 += rippleWidth;
        --v22;
      }
      while (v22);
    }
    v15 = v21;
  }
  while (v21 != v5);
  v33 = 1;
  v34 = 1;
  v35 = 1;
  do
  {
    if (v11 >= 2)
    {
      v36 = self->_rippleWidth;
      v37 = LODWORD(self->_rippleHeight) * v36 - 1;
      v38 = self->_positionBuffer;
      v39 = self->_velocityBuffer;
      v40 = v33 + v36;
      v41 = v13;
      do
      {
        v42 = v40 & ~(v40 >> 31);
        if (v37 < v42)
          v42 = v37;
        v43 = v39[v42] + v8 * v38[v42];
        v39[v42] = v43;
        v35 &= fabs(v43) <= dbl_1D0191540[self->_rippleStyle == 1];
        v40 += v36;
        --v41;
      }
      while (v41);
    }
    ++v34;
    ++v33;
  }
  while (v34 != v5);
  if ((v14 & 1) != 0)
    goto LABEL_29;
}

- (double)zPositionForGridCoordinate:(CGPoint)a3
{
  double v4;
  double v5;
  unint64_t rippleWidth;
  int v7;
  double v8;
  double *positionBuffer;
  int v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  int v16;
  double v17;
  int v18;
  double v19;
  double v20;
  int v21;
  double v22;
  int v23;
  double v24;
  double v25;
  int v26;
  double v27;
  int v28;
  double v29;
  double v30;
  int v31;
  double v32;
  int v33;
  double v34;
  int v35;
  double v36;
  int v37;
  double v38;
  int v39;
  double v40;
  int v41;
  double v42;
  int v43;

  -[SBHRippleSimulation convertGridToRippleCoordinate:](self, "convertGridToRippleCoordinate:", a3.x, a3.y);
  rippleWidth = self->_rippleWidth;
  v7 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v8 = (double)(rippleWidth * (int)v5);
  positionBuffer = self->_positionBuffer;
  v10 = (int)(v4 + v8) & ~((int)(v4 + v8) >> 31);
  if (v7 < v10)
    v10 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v11 = positionBuffer[v10];
  v12 = v4 + 1.0;
  v13 = (int)(v4 + 1.0 + v8) & ~((int)(v4 + 1.0 + v8) >> 31);
  if (v7 < v13)
    v13 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v14 = positionBuffer[v13];
  v15 = (double)(rippleWidth * (int)(v5 + 1.0));
  v16 = (int)(v4 + v15) & ~((int)(v4 + v15) >> 31);
  if (v7 < v16)
    v16 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v17 = positionBuffer[v16];
  v18 = (int)(v12 + v15) & ~((int)(v12 + v15) >> 31);
  if (v7 < v18)
    v18 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v19 = positionBuffer[v18];
  v20 = v4 + -1.0;
  v21 = (int)(v4 + -1.0 + v8) & ~((int)(v4 + -1.0 + v8) >> 31);
  if (v7 < v21)
    v21 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v22 = positionBuffer[v21];
  v23 = (int)(v20 + v15) & ~((int)(v20 + v15) >> 31);
  if (v7 < v23)
    v23 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v24 = positionBuffer[v23];
  v25 = v4 + 2.0;
  v26 = (int)(v4 + 2.0 + v8) & ~((int)(v4 + 2.0 + v8) >> 31);
  if (v7 < v26)
    v26 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v27 = positionBuffer[v26];
  v28 = (int)(v25 + v15) & ~((int)(v25 + v15) >> 31);
  if (v7 < v28)
    v28 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v29 = positionBuffer[v28];
  v30 = (double)(rippleWidth * (int)(v5 + -1.0));
  v31 = (int)(v4 + v30) & ~((int)(v4 + v30) >> 31);
  if (v7 < v31)
    v31 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v32 = positionBuffer[v31];
  v33 = (int)(v12 + v30) & ~((int)(v12 + v30) >> 31);
  if (v7 < v33)
    v33 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v34 = (double)(rippleWidth * (int)(v5 + 2.0));
  v35 = (int)(v4 + v34) & ~((int)(v4 + v34) >> 31);
  if (v7 < v35)
    v35 = v7;
  v36 = positionBuffer[v35];
  v37 = (int)(v12 + v34) & ~((int)(v12 + v34) >> 31);
  if (v7 < v37)
    v37 = v7;
  v38 = positionBuffer[v37];
  v39 = (int)(v20 + v30) & ~((int)(v20 + v30) >> 31);
  if (v7 < v39)
    v39 = v7;
  v40 = positionBuffer[v39];
  v41 = (int)(v25 + v30) & ~((int)(v25 + v30) >> 31);
  if (v7 < v41)
    v41 = v7;
  v42 = positionBuffer[v41];
  v43 = (int)(v20 + v34) & ~((int)(v20 + v34) >> 31);
  if (v7 < v43)
    v43 = v7;
  if (v7 >= ((int)(v25 + v34) & ~((int)(v25 + v34) >> 31)))
    v7 = (int)(v25 + v34) & ~((int)(v25 + v34) >> 31);
  return *(double *)&SBHRippleHeight
       * (((v22 + v24 + v27 + v29 + v32 + positionBuffer[v33] + v36 + v38) * 3.0
         + (v11 + v14 + v17 + v19) * 9.0
         + v40
         + v42
         + positionBuffer[v43]
         + positionBuffer[v7])
        * 0.015625);
}

- (CATransform3D)transformForGridCoordinate:(SEL)a3
{
  double v6;
  double v7;
  double *positionBuffer;
  unint64_t rippleWidth;
  int v10;
  double v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  double v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  double v23;
  int v24;
  double v25;
  int v26;
  double v27;
  int v28;
  double v29;
  double v30;
  int v31;
  double v32;
  int v33;
  double v34;
  int v35;
  double v36;
  float v37;
  CGFloat v38;
  float v39;
  CGFloat v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CATransform3D *result;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CATransform3D v50;
  CATransform3D v51;

  -[SBHRippleSimulation convertGridToRippleCoordinate:](self, "convertGridToRippleCoordinate:", a4.x, a4.y);
  positionBuffer = self->_positionBuffer;
  rippleWidth = self->_rippleWidth;
  v10 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v11 = (double)(rippleWidth * (int)v7);
  v12 = v6 + 1.0;
  v13 = (int)(v6 + 1.0 + v11) & ~((int)(v6 + 1.0 + v11) >> 31);
  if (v10 < v13)
    v13 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v14 = positionBuffer[v13];
  v15 = (int)(v6 + v11) & ~((int)(v6 + v11) >> 31);
  if (v10 < v15)
    v15 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v16 = positionBuffer[v15];
  v17 = (double)(rippleWidth * (int)(v7 + 1.0));
  v18 = (int)(v12 + v17) & ~((int)(v12 + v17) >> 31);
  if (v10 < v18)
    v18 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v19 = positionBuffer[v18];
  v20 = (int)(v6 + v17) & ~((int)(v6 + v17) >> 31);
  if (v10 < v20)
    v20 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v21 = positionBuffer[v20];
  v22 = (int)(v6 + 2.0 + v11) & ~((int)(v6 + 2.0 + v11) >> 31);
  if (v10 < v22)
    v22 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v23 = positionBuffer[v22];
  v24 = (int)(v6 + 2.0 + v17) & ~((int)(v6 + 2.0 + v17) >> 31);
  if (v10 < v24)
    v24 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v25 = positionBuffer[v24];
  v26 = (int)(v6 + -1.0 + v11) & ~((int)(v6 + -1.0 + v11) >> 31);
  if (v10 < v26)
    v26 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v27 = positionBuffer[v26];
  v28 = (int)(v6 + -1.0 + v17) & ~((int)(v6 + -1.0 + v17) >> 31);
  if (v10 < v28)
    v28 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v29 = positionBuffer[v28];
  v30 = (double)(rippleWidth * (int)(v7 + 2.0));
  v31 = (int)(v6 + v30) & ~((int)(v6 + v30) >> 31);
  if (v10 < v31)
    v31 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v32 = positionBuffer[v31];
  v33 = (int)(v12 + v30) & ~((int)(v12 + v30) >> 31);
  if (v10 < v33)
    v33 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  v34 = (double)(rippleWidth * (int)(v7 + -1.0));
  v35 = (int)(v6 + v34) & ~((int)(v6 + v34) >> 31);
  if (v10 < v35)
    v35 = v10;
  if (v10 >= ((int)(v12 + v34) & ~((int)(v12 + v34) >> 31)))
    v10 = (int)(v12 + v34) & ~((int)(v12 + v34) >> 31);
  v36 = ((positionBuffer[v33] - v19) * 0.5
       + (v32 - v21) * 0.5
       + ((v19 - v14) * 0.5 + (v21 - v16) * 0.5) * 2.0
       + (v14 - positionBuffer[v10]) * 0.5
       + (v16 - positionBuffer[v35]) * 0.5)
      * 0.25;
  v37 = ((v25 - v19) * 0.5
       + (v23 - v14) * 0.5
       + ((v19 - v21) * 0.5 + (v14 - v16) * 0.5) * 2.0
       + (v21 - v29) * 0.5
       + (v16 - v27) * 0.5)
      * 0.25;
  v38 = (float)-atanf(v37);
  v39 = v36;
  v40 = atanf(v39);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  CATransform3DMakeRotation(retstr, v38, 0.0, 1.0, 0.0);
  v41 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v50.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v50.m33 = v41;
  v42 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v50.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v50.m43 = v42;
  v43 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v50.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v50.m13 = v43;
  v44 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v50.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v50.m23 = v44;
  result = CATransform3DRotate(&v51, &v50, v40, 1.0, 0.0, 0.0);
  v46 = *(_OWORD *)&v51.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v51.m31;
  *(_OWORD *)&retstr->m33 = v46;
  v47 = *(_OWORD *)&v51.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v51.m41;
  *(_OWORD *)&retstr->m43 = v47;
  v48 = *(_OWORD *)&v51.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v51.m11;
  *(_OWORD *)&retstr->m13 = v48;
  v49 = *(_OWORD *)&v51.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v51.m21;
  *(_OWORD *)&retstr->m23 = v49;
  return result;
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (void)setSettled:(BOOL)a3
{
  self->_settled = a3;
}

@end
