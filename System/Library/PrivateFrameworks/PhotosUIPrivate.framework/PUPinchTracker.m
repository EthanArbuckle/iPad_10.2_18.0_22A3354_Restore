@implementation PUPinchTracker

- (PUPinchTracker)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  _OWORD v8[3];

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[PUPinchTracker initWithInitialCenter:initialSize:initialTransform:](self, "initWithInitialCenter:initialSize:initialTransform:", v8, v2, v3, v4, v5);
}

- (PUPinchTracker)initWithInitialCenter:(CGPoint)a3 initialSize:(CGSize)a4 initialTransform:(CGAffineTransform *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  if (a4.width == 0.0 || a4.height == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPinchTracker.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSize.width != 0.0f && initialSize.height != 0.0f"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PUPinchTracker;
  v12 = -[PUPinchTracker init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    *((CGFloat *)v12 + 1) = x;
    *((CGFloat *)v12 + 2) = y;
    *((CGFloat *)v12 + 3) = width;
    *((CGFloat *)v12 + 4) = height;
    v14 = *(_OWORD *)&a5->a;
    v15 = *(_OWORD *)&a5->c;
    *(_OWORD *)(v12 + 72) = *(_OWORD *)&a5->tx;
    *(_OWORD *)(v12 + 56) = v15;
    *(_OWORD *)(v12 + 40) = v14;
    v16 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v20.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v20.c = v16;
    *(_OWORD *)&v20.tx = *(_OWORD *)&a5->tx;
    CGAffineTransformInvert(&v21, &v20);
    v17 = *(_OWORD *)&v21.c;
    *(_OWORD *)(v13 + 88) = *(_OWORD *)&v21.a;
    *(_OWORD *)(v13 + 104) = v17;
    *(_OWORD *)(v13 + 120) = *(_OWORD *)&v21.tx;
    *((_QWORD *)v13 + 27) = 0x4014000000000000;
  }
  return (PUPinchTracker *)v13;
}

- (void)setPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4
{
  double y;
  double x;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v20;
  double v21;
  double v22;
  double v23;
  double width;
  double height;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  PUValueFilter *pinchRotationValueFilter;
  PUAngleValueFilter *v33;
  PUInitialHysteresisValueFilter *v34;
  double v35;
  PUGroupValueFilter *v36;
  void *v37;
  PUValueFilter *v38;
  double v39;
  CGFloat v40;
  __int128 v41;
  __int128 v42;
  double v43;
  double v44;
  __int128 v45;
  CGPoint initialCenter;
  void *v47;
  _QWORD *v48;
  void (*v49)(_QWORD *, CGAffineTransform *, double, double, double, double);
  CGPoint v50;
  CGFloat angle;
  CGSize initialSize;
  CGPoint v53;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v56;
  CGAffineTransform v57;
  double v58;
  double v59;
  __int128 v60;
  _QWORD v61[3];

  y = a3.y;
  x = a3.x;
  v61[2] = *MEMORY[0x1E0C80C00];
  v7 = (double *)MEMORY[0x1E0C9D538];
  if (!self->_didSetInitialPinchValues)
  {
    v8 = self->_initialCenter.x;
    v9 = self->_initialCenter.y;
    v10 = x - v8;
    v11 = y - v9;
    v50 = a4;
    v12 = a4.x - v8;
    v13 = a4.y - v9;
    a = self->_initialTransformInverse.a;
    b = self->_initialTransformInverse.b;
    c = self->_initialTransformInverse.c;
    d = self->_initialTransformInverse.d;
    tx = self->_initialTransformInverse.tx;
    ty = self->_initialTransformInverse.ty;
    v20 = tx + v11 * c + a * v10;
    v21 = ty + v11 * d + b * v10;
    v57.a = v20;
    v57.b = v21;
    v22 = tx + c * v13 + a * v12;
    v23 = ty + d * v13 + b * v12;
    v56.a = v22;
    v56.b = v23;
    width = self->_initialSize.width;
    height = self->_initialSize.height;
    if (!-[PUPinchTracker allowTrackingOutside](self, "allowTrackingOutside"))
    {
      PUAdjustPointsToBeWithinRect((CGPoint *)&v57, (CGPoint *)&v56, *v7 - width * 0.5, v7[1] - height * 0.5, width, height);
      v20 = v57.a;
      v21 = v57.b;
      v22 = v56.a;
      v23 = v56.b;
    }
    -[PUPinchTracker _transformPinchLocation1:location2:intoCenter:distance:angle:](self, "_transformPinchLocation1:location2:intoCenter:distance:angle:", &self->_initialPinchCenter, &self->_initialPinchDistance, &self->_initialPinchAngle, self->_initialTransform.tx+ v21 * self->_initialTransform.c+ self->_initialTransform.a * v20+ self->_initialCenter.x, self->_initialCenter.y+ self->_initialTransform.ty+ v21 * self->_initialTransform.d+ self->_initialTransform.b * v20, self->_initialTransform.tx+ self->_initialTransform.c * v23+ self->_initialTransform.a * v22+ self->_initialCenter.x, self->_initialCenter.y+ self->_initialTransform.ty
    + self->_initialTransform.d * v23
    + self->_initialTransform.b * v22);
    self->_initialPinchOrigin = (CGPoint)vaddq_f64(*(float64x2_t *)&self->_initialTransformInverse.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_initialTransformInverse.c, self->_initialPinchCenter.y - self->_initialCenter.y), *(float64x2_t *)&self->_initialTransformInverse.a, self->_initialPinchCenter.x - self->_initialCenter.x));
    self->_didSetInitialPinchValues = 1;
    a4 = v50;
  }
  v60 = *(_OWORD *)v7;
  v58 = 0.0;
  v59 = 0.0;
  -[PUPinchTracker _transformPinchLocation1:location2:intoCenter:distance:angle:](self, "_transformPinchLocation1:location2:intoCenter:distance:angle:", &v60, &v59, &v58, x, y, a4.x, a4.y);
  v26 = *(double *)&v60 - self->_initialPinchCenter.x;
  v27 = *((double *)&v60 + 1) - self->_initialPinchCenter.y;
  v28 = self->_initialTransformInverse.tx
      + v27 * self->_initialTransformInverse.c
      + self->_initialTransformInverse.a * v26;
  v29 = self->_initialTransformInverse.ty
      + v27 * self->_initialTransformInverse.d
      + self->_initialTransformInverse.b * v26;
  v30 = v59 / self->_initialPinchDistance;
  v31 = v58 - self->_initialPinchAngle;
  pinchRotationValueFilter = self->_pinchRotationValueFilter;
  if (!pinchRotationValueFilter)
  {
    v33 = objc_alloc_init(PUAngleValueFilter);
    v34 = objc_alloc_init(PUInitialHysteresisValueFilter);
    -[PUPinchTracker rotationHysteresisDegrees](self, "rotationHysteresisDegrees");
    -[PUInitialHysteresisValueFilter setThresholdValue:](v34, "setThresholdValue:", v35 * 3.14159265 / 180.0);
    v36 = objc_alloc_init(PUGroupValueFilter);
    v61[0] = v33;
    v61[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUGroupValueFilter setFilters:](v36, "setFilters:", v37);

    v38 = self->_pinchRotationValueFilter;
    self->_pinchRotationValueFilter = &v36->super;

    pinchRotationValueFilter = self->_pinchRotationValueFilter;
  }
  -[PUValueFilter setInputValue:](pinchRotationValueFilter, "setInputValue:", v31);
  -[PUValueFilter outputValue](self->_pinchRotationValueFilter, "outputValue");
  v40 = v39;
  v41 = *MEMORY[0x1E0C9BAA8];
  v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v57.c = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v57.tx = v42;
  v43 = self->_initialPinchOrigin.x;
  v44 = self->_initialPinchOrigin.y;
  *(_OWORD *)&v56.a = v41;
  *(_OWORD *)&v56.c = *(_OWORD *)&v57.c;
  *(_OWORD *)&v56.tx = v42;
  *(_OWORD *)&v57.a = v41;
  CGAffineTransformTranslate(&v57, &v56, v43, v44);
  t1 = v57;
  v45 = *(_OWORD *)&self->_initialTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_initialTransform.a;
  *(_OWORD *)&t2.c = v45;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_initialTransform.tx;
  CGAffineTransformConcat(&v56, &t1, &t2);
  v57 = v56;
  t1 = v56;
  CGAffineTransformTranslate(&v56, &t1, v28, v29);
  v57 = v56;
  t1 = v56;
  CGAffineTransformScale(&v56, &t1, v30, v30);
  v57 = v56;
  t1 = v56;
  CGAffineTransformRotate(&v56, &t1, v40);
  v57 = v56;
  t1 = v56;
  CGAffineTransformTranslate(&v56, &t1, -v43, -v44);
  v57 = v56;
  initialCenter = self->_initialCenter;
  initialSize = self->_initialSize;
  v53 = initialCenter;
  t2 = v56;
  memset(&t1, 0, sizeof(t1));
  PUComposeTransform(&t2, (uint64_t)&t1, initialCenter.x, initialCenter.y, initialSize.width, initialSize.height, 0.0);
  angle = 0.0;
  t2 = t1;
  PUDecomposeTransform((uint64_t)&t2, &v53, &initialSize.width, &initialSize.height, (long double *)&angle);
  CGAffineTransformMakeRotation(&v56, angle);
  -[PUPinchTracker updateHandler](self, "updateHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[PUPinchTracker updateHandler](self, "updateHandler");
    v48 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v49 = (void (*)(_QWORD *, CGAffineTransform *, double, double, double, double))v48[2];
    t2 = v56;
    v49(v48, &t2, v53.x, v53.y, initialSize.width, initialSize.height);

  }
}

- (void)_transformPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4 intoCenter:(CGPoint *)a5 distance:(double *)a6 angle:(double *)a7
{
  double y;
  double x;
  double v12;
  double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;

  y = a4.y;
  x = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v14 = a4.x - a3.x;
  v15 = a4.y - a3.y;
  v16 = hypot(a4.x - a3.x, a4.y - a3.y);
  v17 = atan2(v15, v14);
  if (a5)
  {
    a5->x = x * 0.5 + v13 * 0.5;
    a5->y = y * 0.5 + v12 * 0.5;
  }
  if (a6)
    *a6 = v16;
  if (a7)
    *a7 = v17;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)allowTrackingOutside
{
  return self->_allowTrackingOutside;
}

- (void)setAllowTrackingOutside:(BOOL)a3
{
  self->_allowTrackingOutside = a3;
}

- (double)rotationHysteresisDegrees
{
  return self->_rotationHysteresisDegrees;
}

- (void)setRotationHysteresisDegrees:(double)a3
{
  self->_rotationHysteresisDegrees = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pinchRotationValueFilter, 0);
}

@end
