@implementation PXZoomablePhotosAlphaAnimator

- (void)didPerformChanges
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  -[PXZoomablePhotosAlphaAnimator didPerformChanges](&v12, sel_didPerformChanges);
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosAlphaAnimator didPerformChanges]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXZoomablePhotosAlphaAnimator _updateTransitionInfo](self, "_updateTransitionInfo");
      if (!self->_updateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosAlphaAnimator didPerformChanges]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXZoomablePhotosAlphaAnimator _updatePresentationValue](self, "_updatePresentationValue");
      v5 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosAlphaAnimator didPerformChanges]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 374, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
}

- (void)setMaxColumnsForAspectFit:(int64_t)a3
{
  void *v3;
  void *v4;

  if (self->_maxColumnsForAspectFit != a3)
  {
    self->_maxColumnsForAspectFit = a3;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosAlphaAnimator setMaxColumnsForAspectFit:]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 162, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    self->_updateFlags.needsUpdate |= 1uLL;
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    -[PXDisplayLink setPaused:](self->_displayLink, "setPaused:", !a3);
    if (!a3)
      self->_lastTickTime = 0.0;
    -[PXZoomablePhotosAlphaAnimator signalChange:](self, "signalChange:", 4);
  }
}

- (PXZoomablePhotosAlphaAnimator)init
{
  PXZoomablePhotosAlphaAnimator *v2;
  uint64_t v3;
  PXDisplayLink *displayLink;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  v2 = -[PXZoomablePhotosAlphaAnimator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)off_1E50B2330), "initWithWeakTarget:selector:deferredStart:", v2, sel__tick_, 1);
    displayLink = v2->_displayLink;
    v2->_displayLink = (PXDisplayLink *)v3;

    -[PXDisplayLink setFrameRateRangeType:](v2->_displayLink, "setFrameRateRangeType:", 2);
    -[PXDisplayLink setHighFrameRateReason:](v2->_displayLink, "setHighFrameRateReason:", 2228226);
    -[PXDisplayLink setPaused:](v2->_displayLink, "setPaused:", 1);
  }
  return v2;
}

- (void)performChangesWithAnimation:(BOOL)a3 changeBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PXZoomablePhotosAlphaAnimator_performChangesWithAnimation_changeBlock___block_invoke;
  v8[3] = &unk_1E513ECF0;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PXZoomablePhotosAlphaAnimator performChanges:](self, "performChanges:", v8);

}

- (void)performChanges:(id)a3
{
  BOOL isBeingMutated;
  objc_super v5;

  isBeingMutated = self->_isBeingMutated;
  self->_isBeingMutated = 1;
  v5.receiver = self;
  v5.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  -[PXZoomablePhotosAlphaAnimator performChanges:](&v5, sel_performChanges_, a3);
  self->_isBeingMutated = isBeingMutated;
}

- (double)presentationColumnIndex
{
  return self->_presentationColumnIndex;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)_updateTransitionInfo
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;
  double v16;
  double v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  id v30;

  -[PXZoomablePhotosAlphaAnimator allowedColumns](self, "allowedColumns");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v30, "count");
  self->_layerCount = v3;
  v4 = 176;
  v5 = 576;
  v6 = v3 - 1;
  if (v3 >= 1)
  {
    v7 = 0;
    v8 = 176;
    v9 = 576;
    do
    {
      objc_msgSend(v30, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      v12 = (char *)self + v8;
      v13 = (char *)self + v9;
      v14 = (char *)self + v9 - 48;
      if (!v7)
        v14 = 0;
      if (v6 == v7)
        v13 = 0;
      *(_QWORD *)v12 = v7;
      *((_QWORD *)v12 + 1) = v11;
      *((double *)v12 + 2) = 1.0 / (double)v11;
      *((_QWORD *)v12 + 3) = v14;
      *((_QWORD *)v12 + 4) = v13;
      ++v7;
      v9 += 48;
      v8 += 40;
    }
    while (v3 != v7);
  }
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minAcceptableCoverage");
  v17 = v16;
  v18 = -[PXZoomablePhotosAlphaAnimator maxColumnsForAspectFit](self, "maxColumnsForAspectFit");
  if (v3 >= 2)
  {
    v19 = v18;
    v20 = 0;
    do
    {
      v21 = (char *)self + v4;
      if (*(int64_t *)((char *)&self->super._nestedChanges + v4) <= v19 != *(uint64_t *)((char *)&self->super._observersQueue
                                                                                              + v4) > v19)
      {
        objc_msgSend(v15, "alphaMaxAcceptableScale");
        objc_msgSend(v15, "alphaMinAcceptableCoverage");
      }
      PXFloatSaturate();
      v23 = fmax(1.0 - v22, 0.1);
      if (v17 + v23 <= 1.0)
        v24 = v23;
      else
        v24 = 1.0 - v17;
      v25 = 0.7;
      if (*((_QWORD *)v21 + 1) != 1)
      {
        PXFloatProgressBetween();
        PXFloatSaturate();
        v25 = 1.0 - v26;
      }
      if (v25 > 0.9)
        v25 = 0.9;
      if (v25 < v17 + v24)
        v25 = v17 + v24;
      v27 = (double *)((char *)self + v5);
      v28 = v24 + (double)v20;
      v29 = v25 + (double)v20;
      *v27 = v28;
      v27[1] = v29;
      v27[2] = v29;
      v27[3] = v28;
      *((_QWORD *)v27 + 4) = v21;
      *((_QWORD *)v27 + 5) = v21 + 40;
      v5 += 48;
      v4 += 40;
      ++v20;
    }
    while (v6 != v20);
  }
  -[PXZoomablePhotosAlphaAnimator columnIndex](self, "columnIndex");
  -[PXZoomablePhotosAlphaAnimator setAutoFadeColumnIndex:](self, "setAutoFadeColumnIndex:");
  -[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");

}

- (NSArray)allowedColumns
{
  return self->_allowedColumns;
}

- (int64_t)maxColumnsForAspectFit
{
  return self->_maxColumnsForAspectFit;
}

- (void)_invalidatePresentationValue
{
  void *v3;
  void *v4;

  -[PXZoomablePhotosAlphaAnimator signalChange:](self, "signalChange:", 0);
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 448, CFSTR("invalidating %lu after it already has been updated"), 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
}

uint64_t __73__PXZoomablePhotosAlphaAnimator_performChangesWithAnimation_changeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 1008);
  *(_BYTE *)(v2 + 1008) = *(_BYTE *)(a1 + 48) ^ 1;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!*(_BYTE *)(a1 + 48))
    result = objc_msgSend(*(id *)(a1 + 32), "_resetAnimatedValues");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = v3;
  return result;
}

- (void)setPresentationAutoFadeAmount:(double)a3
{
  if (self->_presentationAutoFadeAmount != a3)
  {
    self->_presentationAutoFadeAmount = a3;
    -[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");
  }
}

- (void)setAutoFadeAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_autoFadeAmount = a3;
    -[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");
  }
}

- (void)setTargetColumnIndex:(double)a3
{
  if (self->_targetColumnIndex != a3)
  {
    self->_targetColumnIndex = a3;
    -[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");
  }
}

- (void)setColumnIndex:(double)a3
{
  double columnIndex;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  columnIndex = self->_columnIndex;
  if (columnIndex != a3)
  {
    v6 = a3 - columnIndex;
    PXFloatSign();
    v8 = v7;
    if (!self->_isPerformingChangesWithoutAnimation)
      self->_columnIndexDelta = v6 + self->_columnIndexDelta;
    if (v7 == self->_currentDirection)
    {
      self->_directionAnchorColumnIndex = a3;
    }
    else
    {
      v9 = vabdd_f64(self->_directionAnchorColumnIndex, a3);
      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alphaDistanceForDirectionChange");
      v12 = v11;

      if (v9 >= v12)
      {
        self->_directionAnchorColumnIndex = a3;
        self->_currentDirection = v8;
      }
    }
    self->_columnIndex = a3;
    -[PXZoomablePhotosAlphaAnimator signalChange:](self, "signalChange:", 1);
    -[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");
  }
}

- (void)setAllowedColumns:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *allowedColumns;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;

  v14 = (NSArray *)a3;
  v5 = self->_allowedColumns;
  if (v5 == v14)
  {

LABEL_9:
    v8 = v14;
    goto LABEL_10;
  }
  v6 = v5;
  v7 = -[NSArray isEqual:](v5, "isEqual:", v14);

  v8 = v14;
  if ((v7 & 1) == 0)
  {
    if (-[NSArray count](v14, "count") >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allowedColumns.count <= PXZoomablePhotosMaxLayers"));

    }
    v9 = (NSArray *)-[NSArray copy](v14, "copy");
    allowedColumns = self->_allowedColumns;
    self->_allowedColumns = v9;

    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosAlphaAnimator setAllowedColumns:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXZoomablePhotosAlphaAnimator.m"), 154, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    self->_updateFlags.needsUpdate |= 1uLL;
    goto LABEL_9;
  }
LABEL_10:

}

- (double)_targetColumnIndex
{
  double v3;
  double v4;
  PXAlphaTransitionInfo *v5;

  -[PXZoomablePhotosAlphaAnimator columnIndex](self, "columnIndex");
  v4 = v3;
  -[PXZoomablePhotosAlphaAnimator columnIndex](self, "columnIndex");
  v5 = -[PXZoomablePhotosAlphaAnimator _transitionInfoForValue:](self, "_transitionInfoForValue:");
  if (v5)
  {
    if (self->_currentDirection <= 0.0)
    {
      if (v4 < v5->autoFadeLeftValue && v5->fadeRangeMin < v4)
        return v5->fadeRangeMin;
    }
    else if (v4 > v5->autoFadeRightValue && v5->fadeRangeMax >= v4)
    {
      return v5->fadeRangeMax;
    }
  }
  return v4;
}

- (void)_resetAnimatedValues
{
  -[PXZoomablePhotosAlphaAnimator columnIndex](self, "columnIndex");
  -[PXZoomablePhotosAlphaAnimator setAutoFadeColumnIndex:](self, "setAutoFadeColumnIndex:");
  -[PXZoomablePhotosAlphaAnimator autoFadeAmount](self, "autoFadeAmount");
  -[PXZoomablePhotosAlphaAnimator setPresentationAutoFadeAmount:](self, "setPresentationAutoFadeAmount:");
}

- (double)columnIndex
{
  return self->_columnIndex;
}

- (void)setAutoFadeColumnIndex:(double)a3
{
  if (self->_autoFadeColumnIndex != a3)
  {
    self->_autoFadeColumnIndex = a3;
    -[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");
  }
}

- (double)autoFadeAmount
{
  return self->_autoFadeAmount;
}

- (void)_updatePresentationValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;
  double v9;

  -[PXZoomablePhotosAlphaAnimator columnIndex](self, "columnIndex");
  -[PXZoomablePhotosAlphaAnimator autoFadeColumnIndex](self, "autoFadeColumnIndex");
  v4 = v3;
  -[PXZoomablePhotosAlphaAnimator presentationAutoFadeAmount](self, "presentationAutoFadeAmount");
  v6 = v5;
  -[PXZoomablePhotosAlphaAnimator _targetColumnIndex](self, "_targetColumnIndex");
  if (v4 == v7)
  {
    -[PXZoomablePhotosAlphaAnimator autoFadeAmount](self, "autoFadeAmount");
    v8 = v9 != v6;
  }
  else
  {
    v8 = 1;
  }
  if (-[PXZoomablePhotosAlphaAnimator _transitionInfoForValue:](self, "_transitionInfoForValue:", v4))
  {
    PXFloatProgressBetween();
    PXFloatSaturate();
  }
  PXFloatByLinearlyInterpolatingFloats();
  -[PXZoomablePhotosAlphaAnimator setPresentationColumnIndex:](self, "setPresentationColumnIndex:");
  -[PXZoomablePhotosAlphaAnimator setIsAnimating:](self, "setIsAnimating:", v8);
}

- (PXAlphaTransitionInfo)_transitionInfoForValue:(double)a3
{
  int64_t layerCount;
  BOOL v4;
  uint64_t v5;
  int64_t v7;

  layerCount = self->_layerCount;
  v4 = layerCount < 2;
  v5 = layerCount - 2;
  if (v4)
    return 0;
  v7 = vcvtmd_s64_f64(a3);
  if (v5 >= v7)
    v5 = v7;
  return &self->_transitionInfos[v5 & ~(v5 >> 63)];
}

- (void)setPresentationColumnIndex:(double)a3
{
  if (self->_presentationColumnIndex != a3)
  {
    self->_presentationColumnIndex = a3;
    -[PXZoomablePhotosAlphaAnimator signalChange:](self, "signalChange:", 2);
  }
}

- (double)presentationAutoFadeAmount
{
  return self->_presentationAutoFadeAmount;
}

- (double)autoFadeColumnIndex
{
  return self->_autoFadeColumnIndex;
}

- (void)dealloc
{
  objc_super v3;

  -[PXDisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  -[PXZoomablePhotosAlphaAnimator dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t layerCount;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  int64_t v14;
  PXAlphaLayer *layers;
  void *v16;
  int64_t v17;
  PXAlphaTransitionInfo *transitionInfos;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosAlphaAnimator columnIndex](self, "columnIndex");
  v7 = v6;
  -[PXZoomablePhotosAlphaAnimator presentationColumnIndex](self, "presentationColumnIndex");
  v9 = v8;
  layerCount = self->_layerCount;
  v11 = -[PXZoomablePhotosAlphaAnimator isAnimating](self, "isAnimating");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  v13 = v12;
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p; columnIndex:%.2f presentationColumnIndex:%.2f layers:%ld isAnimating:%@\n"),
    v5,
    self,
    v7,
    v9,
    layerCount,
    v13);

  if (self->_layerCount >= 1)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\nlayers:\n"));
    if (self->_layerCount >= 1)
    {
      v14 = 0;
      layers = self->_layers;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%p: columnIndex:%ld, columns:%ld, itemWidth:%.3f, leftTransition:%p, rightTransition:%p}"), layers, layers->columnIndex, layers->columns, *(_QWORD *)&layers->itemWidth, layers->leftTransition, layers->rightTransition);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" %ld: %@\n"), v14, v16);

        ++v14;
        ++layers;
      }
      while (v14 < self->_layerCount);
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("transitionInfos:\n"));
    if (self->_layerCount > 1)
    {
      v17 = 0;
      transitionInfos = self->_transitionInfos;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%p: fadeRange:[%.2f, %.2f] autoFadeLeft:%.2f autoFadeRight:%.2f leftLayer:%p rightLayer:%p}"), transitionInfos, *(_QWORD *)&transitionInfos->fadeRangeMin, *(_QWORD *)&transitionInfos->fadeRangeMax, *(_QWORD *)&transitionInfos->autoFadeLeftValue, *(_QWORD *)&transitionInfos->autoFadeRightValue, transitionInfos->leftLayer, transitionInfos->rightLayer);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" %ld: %@\n"), v17, v19);

        ++v17;
        ++transitionInfos;
      }
      while (v17 < self->_layerCount - 1);
    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void)_tick:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PXZoomablePhotosAlphaAnimator *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __39__PXZoomablePhotosAlphaAnimator__tick___block_invoke;
  v5[3] = &unk_1E513ED18;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[PXZoomablePhotosAlphaAnimator performChanges:](&v4, sel_performChanges_, v5);

}

- (double)targetColumnIndex
{
  return self->_targetColumnIndex;
}

- (BOOL)isBeingMutated
{
  return self->_isBeingMutated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedColumns, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

void __39__PXZoomablePhotosAlphaAnimator__tick___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  if (*(double *)(*(_QWORD *)(a1 + 32) + 128) == 0.0)
  {
    objc_msgSend(v2, "duration");
    v5 = v6;
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    objc_msgSend(v2, "currentMediaTime");
    v3 = *(_QWORD *)(a1 + 32);
    v5 = v4 - *(double *)(v3 + 128);
  }
  v7 = *(double *)(v3 + 152);
  *(_QWORD *)(v3 + 152) = 0;
  *(double *)(*(_QWORD *)(a1 + 32) + 160) = *(double *)(*(_QWORD *)(a1 + 32) + 160) * 0.8 + v7 / v5 * 0.2;
  objc_msgSend(*(id *)(a1 + 32), "_targetColumnIndex");
  v9 = v8;
  objc_msgSend(v25, "alphaCrossfadeMaxDuration");
  v11 = v10;
  objc_msgSend(v25, "alphaCrossfadeMinDuration");
  v12 = *(double **)(a1 + 32);
  v14 = 1.0 / v13;
  v15 = fabs(v12[20]);
  if (v15 < 1.0 / v11)
    v15 = 1.0 / v11;
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  objc_msgSend(v12, "autoFadeColumnIndex");
  v18 = v17;
  v19 = v9 - v17;
  PXFloatSign();
  v21 = v5 * (v20 * v16);
  if (v21 <= 0.0 || v7 <= 0.0)
  {
    if (v21 >= v7)
      v23 = v7;
    else
      v23 = v21;
    if (v7 >= 0.0)
      v23 = v21;
    if (v21 < 0.0)
      v22 = v23;
    else
      v22 = v21;
  }
  else if (v21 >= v7)
  {
    v22 = v21;
  }
  else
  {
    v22 = v7;
  }
  if ((PXFloatEqualToFloatWithTolerance() & 1) != 0 || fabs(v22) > fabs(v19))
    PXFloatEqualToFloatWithTolerance();
  else
    v9 = v18 + v22;
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "autoFadeColumnIndex");
  objc_msgSend(*(id *)(a1 + 32), "setAutoFadeColumnIndex:", v9);
  objc_msgSend(*(id *)(a1 + 32), "autoFadeAmount");
  objc_msgSend(v25, "alphaModeTransitionDuration");
  objc_msgSend(*(id *)(a1 + 32), "presentationAutoFadeAmount");
  PXFloatSign();
  objc_msgSend(*(id *)(a1 + 32), "autoFadeColumnIndex");
  objc_msgSend(*(id *)(a1 + 32), "targetColumnIndex");
  PXFloatEqualToFloatWithTolerance();
  PXFloatSaturate();
  objc_msgSend(*(id *)(a1 + 32), "setPresentationAutoFadeAmount:");
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePresentationValue");
  objc_msgSend(*(id *)(a1 + 40), "currentMediaTime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = v24;

}

@end
