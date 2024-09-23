@implementation PXPinchTracker

- (PXPinchTracker)init
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
  return -[PXPinchTracker initWithCenter:size:transform:](self, "initWithCenter:size:transform:", v8, v2, v3, v4, v5);
}

- (PXPinchTracker)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v10;
  PXPinchTracker *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  PXNumberFilter *horizontalVelocityFilter;
  uint64_t v17;
  PXNumberFilter *verticalVelocityFilter;
  uint64_t v19;
  PXNumberFilter *scaleVelocityFilter;
  uint64_t v21;
  PXNumberFilter *rotationalVelocityFilter;
  double v23;
  objc_super v25;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)PXPinchTracker;
  v10 = -[PXPinchTracker init](&v25, sel_init);
  v11 = (PXPinchTracker *)v10;
  if (v10)
  {
    *((CGFloat *)v10 + 51) = x;
    *((CGFloat *)v10 + 52) = y;
    *((CGFloat *)v10 + 53) = width;
    *((CGFloat *)v10 + 54) = height;
    v12 = *(_OWORD *)&a5->a;
    v13 = *(_OWORD *)&a5->tx;
    *(_OWORD *)(v10 + 488) = *(_OWORD *)&a5->c;
    *(_OWORD *)(v10 + 504) = v13;
    *(_OWORD *)(v10 + 472) = v12;
    v14 = *(_OWORD *)off_1E50B8580;
    *(_OWORD *)(v10 + 376) = *(_OWORD *)off_1E50B8580;
    *(_OWORD *)(v10 + 392) = v14;
    +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter");
    v15 = objc_claimAutoreleasedReturnValue();
    horizontalVelocityFilter = v11->_horizontalVelocityFilter;
    v11->_horizontalVelocityFilter = (PXNumberFilter *)v15;

    +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter");
    v17 = objc_claimAutoreleasedReturnValue();
    verticalVelocityFilter = v11->_verticalVelocityFilter;
    v11->_verticalVelocityFilter = (PXNumberFilter *)v17;

    +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter");
    v19 = objc_claimAutoreleasedReturnValue();
    scaleVelocityFilter = v11->_scaleVelocityFilter;
    v11->_scaleVelocityFilter = (PXNumberFilter *)v19;

    +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter");
    v21 = objc_claimAutoreleasedReturnValue();
    rotationalVelocityFilter = v11->_rotationalVelocityFilter;
    v11->_rotationalVelocityFilter = (PXNumberFilter *)v21;

    PXDegreesToRadians();
    v11->_rotationHysteris = v23;
    v11->_scaleHysteresis = 0.05;
    v11->_shouldResize = 1;
  }
  return v11;
}

- (void)_setCenter:(CGPoint)a3
{
  if (a3.x != self->_center.x || a3.y != self->_center.y)
  {
    self->_center = a3;
    -[PXPinchTracker signalChange:](self, "signalChange:", 1);
  }
}

- (void)_setSize:(CGSize)a3
{
  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    self->_size = a3;
    -[PXPinchTracker signalChange:](self, "signalChange:", 2);
  }
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_transform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_transform = &self->_transform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_transform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_transform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_transform->tx = v9;
    *(_OWORD *)&p_transform->a = v8;
    -[PXPinchTracker signalChange:](self, "signalChange:", 4);
  }
}

- (void)_setVelocity:(PXDisplayVelocity)a3
{
  if (a3.x != self->_velocity.x
    || a3.y != self->_velocity.y
    || a3.scale != self->_velocity.scale
    || a3.rotation != self->_velocity.rotation)
  {
    self->_velocity = a3;
    -[PXPinchTracker signalChange:](self, "signalChange:", 8);
  }
}

- (void)_setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[PXPinchTracker signalChange:](self, "signalChange:", 16);
  }
}

- (void)_setScaleDirection:(int64_t)a3
{
  if (self->_scaleDirection != a3)
  {
    self->_scaleDirection = a3;
    -[PXPinchTracker signalChange:](self, "signalChange:", 32);
  }
}

- (void)_transformPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4 intoCenter:(CGPoint *)a5 distance:(double *)a6 angle:(double *)a7
{
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  long double v16;
  uint64_t v17;

  v10 = a4.x - a3.x;
  v11 = a4.y - a3.y;
  PXPointByLinearlyInterpolatingPoints();
  v13 = v12;
  v15 = v14;
  v16 = hypot(v10, v11);
  MEMORY[0x1A85CCC64](v11, v10);
  if (a5)
  {
    a5->x = v13;
    a5->y = v15;
  }
  if (a6)
    *a6 = v16;
  if (a7)
    *(_QWORD *)a7 = v17;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPinchTracker;
  -[PXPinchTracker performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPinchTracker;
  -[PXPinchTracker didPerformChanges](&v3, sel_didPerformChanges);
  -[PXPinchTracker _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setPinchLocation1:(CGPoint)a3
{
  if (a3.x != self->_pinchLocation1.x || a3.y != self->_pinchLocation1.y)
  {
    self->_pinchLocation1 = a3;
    if (PXPointIsNull())
      -[PXPinchTracker _invalidateInitialValues](self, "_invalidateInitialValues");
    -[PXPinchTracker _invalidateGeometry](self, "_invalidateGeometry");
  }
}

- (void)setPinchLocation2:(CGPoint)a3
{
  if (a3.x != self->_pinchLocation2.x || a3.y != self->_pinchLocation2.y)
  {
    self->_pinchLocation2 = a3;
    if (PXPointIsNull())
      -[PXPinchTracker _invalidateInitialValues](self, "_invalidateInitialValues");
    -[PXPinchTracker _invalidateGeometry](self, "_invalidateGeometry");
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.initialValues || self->_needsUpdateFlags.geometry;
}

- (void)_setNeedsUpdate
{
  -[PXPinchTracker signalChange:](self, "signalChange:", 0);
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PXPinchTracker _needsUpdate](self, "_needsUpdate"))
  {
    -[PXPinchTracker _updateInitialValuesIfNeeded](self, "_updateInitialValuesIfNeeded");
    -[PXPinchTracker _updateGeometryIfNeeded](self, "_updateGeometryIfNeeded");
    if (-[PXPinchTracker _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPinchTracker.m"), 211, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_invalidateInitialValues
{
  self->_needsUpdateFlags.initialValues = 1;
  -[PXPinchTracker _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateInitialValuesIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  if (self->_needsUpdateFlags.initialValues)
  {
    self->_needsUpdateFlags.initialValues = 0;
    if (!self->_didSetInitialValues)
    {
      -[PXPinchTracker pinchLocation1](self, "pinchLocation1");
      v4 = v3;
      v6 = v5;
      -[PXPinchTracker pinchLocation2](self, "pinchLocation2");
      v8 = v7;
      v10 = v9;
      if ((PXPointIsNull() & 1) == 0 && (PXPointIsNull() & 1) == 0)
      {
        -[PXPinchTracker center](self, "center");
        self->_initialCenter.x = v11;
        self->_initialCenter.y = v12;
        -[PXPinchTracker size](self, "size");
        self->_initialSize.width = v13;
        self->_initialSize.height = v14;
        -[PXPinchTracker transform](self, "transform");
        v15 = *(_OWORD *)&v21.c;
        *(_OWORD *)&self->_initialTransform.a = *(_OWORD *)&v21.a;
        *(_OWORD *)&self->_initialTransform.c = v15;
        *(_OWORD *)&self->_initialTransform.tx = *(_OWORD *)&v21.tx;
        v16 = *(_OWORD *)&self->_initialTransform.c;
        *(_OWORD *)&v20.a = *(_OWORD *)&self->_initialTransform.a;
        *(_OWORD *)&v20.c = v16;
        *(_OWORD *)&v20.tx = *(_OWORD *)&self->_initialTransform.tx;
        CGAffineTransformInvert(&v21, &v20);
        v17 = *(_OWORD *)&v21.c;
        *(_OWORD *)&self->_initialTransformInverse.a = *(_OWORD *)&v21.a;
        *(_OWORD *)&self->_initialTransformInverse.c = v17;
        *(_OWORD *)&self->_initialTransformInverse.tx = *(_OWORD *)&v21.tx;
        -[PXPinchTracker _transformPinchLocation1:location2:intoCenter:distance:angle:](self, "_transformPinchLocation1:location2:intoCenter:distance:angle:", &self->_initialPinchCenter, &self->_initialPinchDistance, &self->_initialPinchAngle, v4, v6, v8, v10);
        PXPointSubtract();
        self->_initialPinchOrigin.x = v18;
        self->_initialPinchOrigin.y = v19;
        self->_initialPinchOrigin = (CGPoint)vaddq_f64(*(float64x2_t *)&self->_initialTransformInverse.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_initialTransformInverse.c, v19), *(float64x2_t *)&self->_initialTransformInverse.a, v18));
        self->_didSetInitialValues = 1;
      }
    }
  }
}

- (void)_invalidateGeometry
{
  self->_needsUpdateFlags.geometry = 1;
  -[PXPinchTracker _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGeometryIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PXNumberFilter *pinchRotationFilter;
  PXAngleNumberFilter *v18;
  PXInitialHysteresisNumberFilter *v19;
  PXCompoundNumberFilter *v20;
  void *v21;
  PXNumberFilter *v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  __int128 v26;
  double x;
  double y;
  __int128 v29;
  CGPoint initialCenter;
  double v31;
  uint64_t v32;
  uint64_t v33;
  PXNumberFilter *horizontalVelocityFilter;
  PXNumberFilter *verticalVelocityFilter;
  PXNumberFilter *scaleVelocityFilter;
  PXNumberFilter *rotationalVelocityFilter;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  PXChangeDirectionNumberFilter *scaleDirectionFilter;
  PXChangeDirectionNumberFilter *v47;
  PXChangeDirectionNumberFilter *v48;
  PXChangeDirectionNumberFilter *v49;
  double v50;
  unint64_t v51;
  _QWORD v52[5];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD v55[4];
  CGPoint v56;
  uint64_t v57;
  _QWORD v58[4];
  CGPoint v59;
  uint64_t v60;
  CGFloat angle;
  CGSize initialSize;
  CGPoint v63;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v66;
  CGAffineTransform v67;
  _QWORD v68[5];
  double v69;
  double v70;
  __int128 v71;
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.geometry)
  {
    self->_needsUpdateFlags.geometry = 0;
    -[PXPinchTracker pinchLocation1](self, "pinchLocation1");
    v4 = v3;
    v6 = v5;
    -[PXPinchTracker pinchLocation2](self, "pinchLocation2");
    if (self->_didSetInitialValues)
    {
      v9 = v7;
      v10 = v8;
      if ((PXPointIsNull() & 1) == 0 && (PXPointIsNull() & 1) == 0)
      {
        v71 = *MEMORY[0x1E0C9D538];
        v69 = 0.0;
        v70 = 0.0;
        -[PXPinchTracker _transformPinchLocation1:location2:intoCenter:distance:angle:](self, "_transformPinchLocation1:location2:intoCenter:distance:angle:", &v71, &v70, &v69, v4, v6, v9, v10);
        PXPointSubtract();
        v13 = self->_initialTransformInverse.tx
            + v11 * self->_initialTransformInverse.c
            + self->_initialTransformInverse.a * v12;
        v14 = self->_initialTransformInverse.ty
            + v11 * self->_initialTransformInverse.d
            + self->_initialTransformInverse.b * v12;
        v15 = v70 / self->_initialPinchDistance;
        v16 = v69 - self->_initialPinchAngle;
        pinchRotationFilter = self->_pinchRotationFilter;
        if (!pinchRotationFilter)
        {
          v18 = objc_alloc_init(PXAngleNumberFilter);
          v19 = objc_alloc_init(PXInitialHysteresisNumberFilter);
          -[PXPinchTracker rotationHysteris](self, "rotationHysteris");
          -[PXInitialHysteresisNumberFilter setHysteresis:](v19, "setHysteresis:");
          v20 = objc_alloc_init(PXCompoundNumberFilter);
          v72[0] = v18;
          v72[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXCompoundNumberFilter setFilters:](v20, "setFilters:", v21);

          v22 = self->_pinchRotationFilter;
          self->_pinchRotationFilter = &v20->super;

          pinchRotationFilter = self->_pinchRotationFilter;
        }
        v23 = MEMORY[0x1E0C809B0];
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke;
        v68[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
        *(double *)&v68[4] = v16;
        -[PXNumberFilter performChanges:](pinchRotationFilter, "performChanges:", v68);
        -[PXNumberFilter output](self->_pinchRotationFilter, "output");
        v25 = v24;
        v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v67.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v67.c = v26;
        *(_OWORD *)&v67.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        x = self->_initialPinchOrigin.x;
        y = self->_initialPinchOrigin.y;
        *(_OWORD *)&v66.a = *(_OWORD *)&v67.a;
        *(_OWORD *)&v66.c = v26;
        *(_OWORD *)&v66.tx = *(_OWORD *)&v67.tx;
        CGAffineTransformTranslate(&v67, &v66, x, y);
        t1 = v67;
        v29 = *(_OWORD *)&self->_initialTransform.c;
        *(_OWORD *)&t2.a = *(_OWORD *)&self->_initialTransform.a;
        *(_OWORD *)&t2.c = v29;
        *(_OWORD *)&t2.tx = *(_OWORD *)&self->_initialTransform.tx;
        CGAffineTransformConcat(&v66, &t1, &t2);
        v67 = v66;
        t1 = v66;
        CGAffineTransformTranslate(&v66, &t1, v13, v14);
        v67 = v66;
        t1 = v66;
        CGAffineTransformScale(&v66, &t1, v15, v15);
        v67 = v66;
        t1 = v66;
        CGAffineTransformRotate(&v66, &t1, v25);
        v67 = v66;
        t1 = v66;
        CGAffineTransformTranslate(&v66, &t1, -x, -y);
        v67 = v66;
        initialCenter = self->_initialCenter;
        initialSize = self->_initialSize;
        v63 = initialCenter;
        t2 = v66;
        memset(&t1, 0, sizeof(t1));
        PXAffineTransformMakeWithTranslationScaleRotationTransform();
        angle = 0.0;
        t2 = t1;
        PXAffineTransformDecomposeTranslationScaleRotation();
        v31 = initialSize.width / self->_initialSize.width;
        if (-[PXPinchTracker shouldResize](self, "shouldResize"))
        {
          CGAffineTransformMakeRotation(&v66, angle);
        }
        else
        {
          PXAffineTransformMakeWithTranslationScaleRotation();
          initialSize = self->_initialSize;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v33 = v32;
        horizontalVelocityFilter = self->_horizontalVelocityFilter;
        v58[0] = v23;
        v58[1] = 3221225472;
        v58[2] = __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_2;
        v58[3] = &__block_descriptor_56_e33_v16__0___PXMutableNumberFilter__8l;
        v59 = v63;
        v60 = v32;
        -[PXNumberFilter performChanges:](horizontalVelocityFilter, "performChanges:", v58);
        verticalVelocityFilter = self->_verticalVelocityFilter;
        v55[0] = v23;
        v55[1] = 3221225472;
        v55[2] = __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_3;
        v55[3] = &__block_descriptor_56_e33_v16__0___PXMutableNumberFilter__8l;
        v56 = v63;
        v57 = v33;
        -[PXNumberFilter performChanges:](verticalVelocityFilter, "performChanges:", v55);
        scaleVelocityFilter = self->_scaleVelocityFilter;
        v54[0] = v23;
        v54[1] = 3221225472;
        v54[2] = __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_4;
        v54[3] = &__block_descriptor_48_e33_v16__0___PXMutableNumberFilter__8l;
        *(double *)&v54[4] = v31;
        v54[5] = v33;
        -[PXNumberFilter performChanges:](scaleVelocityFilter, "performChanges:", v54);
        rotationalVelocityFilter = self->_rotationalVelocityFilter;
        v53[0] = v23;
        v53[1] = 3221225472;
        v53[2] = __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_5;
        v53[3] = &__block_descriptor_48_e33_v16__0___PXMutableNumberFilter__8l;
        *(CGFloat *)&v53[4] = angle;
        v53[5] = v33;
        -[PXNumberFilter performChanges:](rotationalVelocityFilter, "performChanges:", v53);
        -[PXNumberFilter output](self->_horizontalVelocityFilter, "output");
        v39 = v38;
        -[PXNumberFilter output](self->_verticalVelocityFilter, "output");
        v41 = v40;
        -[PXNumberFilter output](self->_scaleVelocityFilter, "output");
        v43 = v42;
        -[PXNumberFilter output](self->_rotationalVelocityFilter, "output");
        v45 = v44;
        scaleDirectionFilter = self->_scaleDirectionFilter;
        if (!scaleDirectionFilter)
        {
          v47 = objc_alloc_init(PXChangeDirectionNumberFilter);
          v48 = self->_scaleDirectionFilter;
          self->_scaleDirectionFilter = v47;

          v49 = self->_scaleDirectionFilter;
          -[PXPinchTracker scaleHysteresis](self, "scaleHysteresis");
          -[PXChangeDirectionNumberFilter setMinimumChange:](v49, "setMinimumChange:");
          scaleDirectionFilter = self->_scaleDirectionFilter;
        }
        v52[0] = v23;
        v52[1] = 3221225472;
        v52[2] = __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_6;
        v52[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
        *(double *)&v52[4] = v31;
        -[PXNumberFilter performChanges:](scaleDirectionFilter, "performChanges:", v52);
        -[PXNumberFilter output](self->_scaleDirectionFilter, "output");
        v51 = llround(v50);
        -[PXPinchTracker _setCenter:](self, "_setCenter:", v63);
        -[PXPinchTracker _setSize:](self, "_setSize:", initialSize);
        t2 = v66;
        -[PXPinchTracker _setTransform:](self, "_setTransform:", &t2);
        -[PXPinchTracker _setVelocity:](self, "_setVelocity:", v39, v41, v43, v45);
        -[PXPinchTracker _setScale:](self, "_setScale:", v31);
        -[PXPinchTracker _setScaleDirection:](self, "_setScaleDirection:", v51);
      }
    }
  }
}

- (CGPoint)pinchLocation1
{
  double x;
  double y;
  CGPoint result;

  x = self->_pinchLocation1.x;
  y = self->_pinchLocation1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)pinchLocation2
{
  double x;
  double y;
  CGPoint result;

  x = self->_pinchLocation2.x;
  y = self->_pinchLocation2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[10].d;
  return self;
}

- (PXDisplayVelocity)velocity
{
  double x;
  double y;
  double scale;
  double rotation;
  PXDisplayVelocity result;

  x = self->_velocity.x;
  y = self->_velocity.y;
  scale = self->_velocity.scale;
  rotation = self->_velocity.rotation;
  result.rotation = rotation;
  result.scale = scale;
  result.y = y;
  result.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (int64_t)scaleDirection
{
  return self->_scaleDirection;
}

- (double)rotationHysteris
{
  return self->_rotationHysteris;
}

- (double)scaleHysteresis
{
  return self->_scaleHysteresis;
}

- (BOOL)shouldResize
{
  return self->_shouldResize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleDirectionFilter, 0);
  objc_storeStrong((id *)&self->_rotationalVelocityFilter, 0);
  objc_storeStrong((id *)&self->_scaleVelocityFilter, 0);
  objc_storeStrong((id *)&self->_verticalVelocityFilter, 0);
  objc_storeStrong((id *)&self->_horizontalVelocityFilter, 0);
  objc_storeStrong((id *)&self->_pinchRotationFilter, 0);
}

uint64_t __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInput:", v3);
  objc_msgSend(v4, "setTime:", *(double *)(a1 + 48));

}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setInput:", v3);
  objc_msgSend(v4, "setTime:", *(double *)(a1 + 48));

}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInput:", v3);
  objc_msgSend(v4, "setTime:", *(double *)(a1 + 40));

}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInput:", v3);
  objc_msgSend(v4, "setTime:", *(double *)(a1 + 40));

}

uint64_t __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

@end
