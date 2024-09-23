@implementation _UIHyperInteractor

- (const)_presentationPoint
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;
  const double *result;

  clean = self->_clean;
  if ((*(_DWORD *)&clean & 0x10000) != 0)
    return self->__presentationPoint;
  if (self->__overridingPresentationPoint)
  {
    result = self->__overridePresentationPoint;
  }
  else
  {
    result = -[_UIHyperInteractor _constrainedPoint](self, "_constrainedPoint");
    clean = self->_clean;
  }
  self->__presentationPoint = result;
  self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean | 0x10000);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;
  $2EBF6573070EC26E3189A7B4CB61B0F7 v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (_MergedGlobals_895 == a6)
  {
    clean = self->_clean;
    if ((*(_BYTE *)&clean & 1) != 0)
    {
      self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFE);
      _UIHyperInteractorDirtyClosestPoint(self);
    }
  }
  else if (off_1ECD75D40 == a6)
  {
    v14 = self->_clean;
    if ((*(_BYTE *)&v14 & 2) != 0)
    {
      self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&v14 & 0xFFFFFFFD);
      _UIHyperInteractorDirtyExtentVector(self);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIHyperInteractor;
    -[_UIHyperInteractor observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_copyUnconstrainedPoint:(const double *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46___UIHyperInteractor__copyUnconstrainedPoint___block_invoke;
  v3[3] = &unk_1E16B3EF0;
  v3[4] = self;
  v3[5] = a3;
  -[_UIHyperInteractor _mutateUnconstrainedPoint:](self, "_mutateUnconstrainedPoint:", v3);
}

- (void)_mutateUnconstrainedPoint:(id)a3
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;

  -[_UIHyperInteractor _mutateInternalUnconstrainedPoint:](self, "_mutateInternalUnconstrainedPoint:", a3);
  clean = self->_clean;
  if ((*(_BYTE *)&clean & 4) != 0)
  {
    self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFB);
    _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
  }
}

- (void)_mutateInternalUnconstrainedPoint:(id)a3
{
  id v4;

  (*((void (**)(id, double *))a3 + 2))(a3, self->__unconstrainedPoint);
  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_broadcastIfPossible");

}

- (_UIHyperInteractorBroadcaster)_broadcaster
{
  return self->__broadcaster;
}

- (const)_extentVector
{
  void *v3;

  if ((*((_BYTE *)&self->_clean + 1) & 2) == 0)
  {
    if (!memcmp(-[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"), -[_UIHyperInteractor _closestPoint](self, "_closestPoint"), 8 * self->__dimensions))
    {
      catlas_dset_NEWLAPACK();
    }
    else
    {
      -[_UIHyperInteractor _extender](self, "_extender");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_getExtentVector:forUnconstrainedPoint:closestPoint:", self->__extentVector, -[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"), -[_UIHyperInteractor _closestPoint](self, "_closestPoint"));

    }
    *(_DWORD *)&self->_clean |= 0x200u;
  }
  return self->__extentVector;
}

- (const)_constrainedPoint
{
  double *constrainedPoint;
  const double *v4;
  double v5;
  double v6;
  const double *v7;
  vDSP_Length dimensions;
  double __B;

  if ((*((_BYTE *)&self->_clean + 1) & 0x40) == 0)
  {
    constrainedPoint = self->__constrainedPoint;
    v4 = -[_UIHyperInteractor _unconstrainedExtentVector](self, "_unconstrainedExtentVector");
    -[_UIHyperInteractor _constrainedFraction](self, "_constrainedFraction");
    v6 = v5;
    v7 = -[_UIHyperInteractor _closestPoint](self, "_closestPoint");
    dimensions = self->__dimensions;
    __B = v6;
    vDSP_vsmaD(v4, 1, &__B, v7, 1, constrainedPoint, 1, dimensions);
    *(_DWORD *)&self->_clean |= 0x4000u;
  }
  return self->__constrainedPoint;
}

- (const)_closestPoint
{
  void *v3;

  if ((*(_BYTE *)&self->_clean & 0x40) == 0)
  {
    -[_UIHyperInteractor _region](self, "_region");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_closestPoint:toPoint:", self->__closestPoint, -[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"));

    *(_DWORD *)&self->_clean |= 0x40u;
  }
  return self->__closestPoint;
}

- (const)_translatedUnconstrainedPoint
{
  if ((*(_BYTE *)&self->_clean & 8) == 0)
  {
    vDSP_vaddD(-[_UIHyperInteractor _unconstrainedPoint](self, "_unconstrainedPoint"), 1, self->__initialTranslation, 1, self->__translatedUnconstrainedPoint, 1, self->__dimensions);
    vDSP_vaddD(self->__translatedUnconstrainedPoint, 1, self->__translation, 1, self->__translatedUnconstrainedPoint, 1, self->__dimensions);
    *(_DWORD *)&self->_clean |= 8u;
  }
  return self->__translatedUnconstrainedPoint;
}

- (_UIHyperregion)_region
{
  void (**regionGetter)(id, SEL);
  void *v4;
  _UIHyperspace *v5;

  if ((*(_BYTE *)&self->_clean & 1) == 0)
  {
    regionGetter = (void (**)(id, SEL))self->__regionGetter;
    if (regionGetter)
    {
      regionGetter[2](regionGetter, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIHyperInteractor _setInternalRegion:](self, "_setInternalRegion:", v4);

    }
    if (!self->__region)
    {
      v5 = -[_UIHyperspace initWithDimensions:]([_UIHyperspace alloc], "initWithDimensions:", self->__dimensions);
      -[_UIHyperInteractor _setInternalRegion:](self, "_setInternalRegion:", v5);

    }
    *(_DWORD *)&self->_clean |= 1u;
  }
  return self->__region;
}

- (const)_unconstrainedPoint
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;

  clean = self->_clean;
  if ((*(_BYTE *)&clean & 4) == 0)
  {
    if (self->__unconstrainedPointGetter)
    {
      -[_UIHyperInteractor _mutateInternalUnconstrainedPoint:](self, "_mutateInternalUnconstrainedPoint:");
      clean = self->_clean;
    }
    self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean | 4);
  }
  return self->__unconstrainedPoint;
}

- (double)_constrainedFraction
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;
  double v9;

  if ((*((_BYTE *)&self->_clean + 1) & 0x20) != 0)
    return self->__constrainedFraction;
  -[_UIHyperInteractor _extent](self, "_extent");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[_UIHyperInteractor _unconstrainedExtent](self, "_unconstrainedExtent", 0.0);
    v7 = v6;
    v8 = v6 / v4;
    -[_UIHyperInteractor _rubberBandCoefficient](self, "_rubberBandCoefficient");
    result = v4 * (1.0 - 1.0 / (v8 * v9 + 1.0)) / v7;
  }
  self->__constrainedFraction = result;
  *(_DWORD *)&self->_clean |= 0x2000u;
  return result;
}

- (const)_unconstrainedExtentVector
{
  double *unconstrainedExtentVector;
  double v4;
  const double *v5;
  const double *v6;
  vDSP_Length dimensions;
  double __B;

  if ((*((_BYTE *)&self->_clean + 1) & 8) == 0)
  {
    -[_UIHyperInteractor _extent](self, "_extent");
    unconstrainedExtentVector = self->__unconstrainedExtentVector;
    if (v4 == 0.0)
    {
      catlas_dset_NEWLAPACK();
    }
    else
    {
      v5 = -[_UIHyperInteractor _unconstrainedVector](self, "_unconstrainedVector");
      v6 = -[_UIHyperInteractor _extentVector](self, "_extentVector");
      dimensions = self->__dimensions;
      __B = _UIHyperFractionOfProjectionOnto(v5, v6, dimensions);
      vDSP_vsmulD(v6, 1, &__B, unconstrainedExtentVector, 1, dimensions);
    }
    *(_DWORD *)&self->_clean |= 0x800u;
  }
  return self->__unconstrainedExtentVector;
}

- (double)_extent
{
  double result;

  if ((*((_BYTE *)&self->_clean + 1) & 4) != 0)
    return self->__extent;
  -[_UIHyperInteractor _extentVector](self, "_extentVector");
  cblas_dnrm2_NEWLAPACK();
  self->__extent = result;
  *(_DWORD *)&self->_clean |= 0x400u;
  return result;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (void)_setUnconstrainedPointGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)_setRegionGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)_setPresentationPointWasInvalidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)_setExtenderGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (void)_setDecelerationRate:(double)a3
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;
  id v4;

  if (self->__decelerationRate != a3)
  {
    self->__decelerationRate = a3;
    clean = self->_clean;
    if ((*(_BYTE *)&clean & 0x20) != 0)
      self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFDF);
    -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_broadcastIfPossible");

  }
}

- (void)_setAnimator:(id)a3
{
  _UIHyperAnimator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIHyperAnimator *v12;

  v6 = (_UIHyperAnimator *)a3;
  if (self->__animator != v6)
  {
    v12 = v6;
    if (-[_UIHyperAnimator _dimensions](v6, "_dimensions") != self->__dimensions)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperInteractor.m"), 250, CFSTR("Tried to set _animator %@ (%lu) with unequal dimensions to %@ (%lu)"), v12, -[_UIHyperAnimator _dimensions](v12, "_dimensions"), self, self->__dimensions);

    }
    -[_UIHyperAnimator _interactor](v12, "_interactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIHyperAnimator _interactor](v12, "_interactor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperInteractor.m"), 251, CFSTR("Cannot set _animator %@ on %@ that is already assigned to %@."), v12, self, v11);

    }
    -[_UIHyperAnimator _setInteractor:](self->__animator, "_setInteractor:", 0);
    objc_storeStrong((id *)&self->__animator, a3);
    -[_UIHyperAnimator _setInteractor:](self->__animator, "_setInteractor:", self);
    -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_broadcastIfPossible");

    v6 = v12;
  }

}

- (void)_setInternalExtender:(id)a3
{
  id v5;
  _UIHyperExtender *extender;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  if (objc_msgSend(v5, "_dimensions") != self->__dimensions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperInteractor.m"), 226, CFSTR("Tried to set _extender %@ (%lu) with unequal dimensions to %@ (%lu)"), v5, objc_msgSend(v5, "_dimensions"), self, self->__dimensions);

  }
  -[_UIHyperExtender removeObserver:forKeyPath:context:](self->__extender, "removeObserver:forKeyPath:context:", self, CFSTR("self"), off_1ECD75D40);
  extender = self->__extender;
  self->__extender = (_UIHyperExtender *)v5;
  v7 = v5;

  -[_UIHyperExtender addObserver:forKeyPath:options:context:](self->__extender, "addObserver:forKeyPath:options:context:", self, CFSTR("self"), 0, off_1ECD75D40);
  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_broadcastIfPossible");

}

- (void)_invalidateUnconstrainedPoint
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;

  clean = self->_clean;
  if ((*(_BYTE *)&clean & 4) != 0)
  {
    self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFB);
    _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
  }
}

- (_UIHyperInteractor)initWithDimensions:(unint64_t)a3
{
  _UIHyperInteractor *v4;
  _UIHyperInteractor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHyperInteractor;
  v4 = -[_UIHyperInteractor init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    *(_OWORD *)&v4->__minimumSpeed = xmmword_186678850;
    v4->__rubberBandCoefficient = _UIScrollViewRubberBandCoefficient(0);
    v5->__unconstrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__initialTranslation = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__translation = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__translatedUnconstrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__velocity = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__effectiveVelocity = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__projectedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__closestPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__unconstrainedVector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__extentVector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__unconstrainedExtentVector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__constrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__constrainedVelocity = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__overridePresentationPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__lastConstrainedPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)_setRegion:(id)a3
{
  _UIHyperregion *v4;
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;
  _UIHyperregion *v6;

  v4 = (_UIHyperregion *)a3;
  if (self->__region != v4)
  {
    v6 = v4;
    -[_UIHyperInteractor _setInternalRegion:](self, "_setInternalRegion:", v4);
    v4 = v6;
    clean = self->_clean;
    if ((*(_BYTE *)&clean & 1) != 0)
    {
      self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFE);
      _UIHyperInteractorDirtyClosestPoint(self);
      v4 = v6;
    }
  }

}

- (void)_setInternalRegion:(id)a3
{
  id v5;
  _UIHyperregion *region;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  if (objc_msgSend(v5, "_dimensions") != self->__dimensions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperInteractor.m"), 186, CFSTR("Tried to set _region %@ (%lu) with unequal dimensions to %@ (%lu)"), v5, objc_msgSend(v5, "_dimensions"), self, self->__dimensions);

  }
  -[_UIHyperregion removeObserver:forKeyPath:context:](self->__region, "removeObserver:forKeyPath:context:", self, CFSTR("self"), _MergedGlobals_895);
  region = self->__region;
  self->__region = (_UIHyperregion *)v5;
  v7 = v5;

  -[_UIHyperregion addObserver:forKeyPath:options:context:](self->__region, "addObserver:forKeyPath:options:context:", self, CFSTR("self"), 0, _MergedGlobals_895);
  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_broadcastIfPossible");

}

- (void)_setExtender:(id)a3
{
  _UIHyperExtender *v4;
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;
  _UIHyperExtender *v6;

  v4 = (_UIHyperExtender *)a3;
  if (self->__extender != v4)
  {
    v6 = v4;
    -[_UIHyperInteractor _setInternalExtender:](self, "_setInternalExtender:", v4);
    v4 = v6;
    clean = self->_clean;
    if ((*(_BYTE *)&clean & 2) != 0)
    {
      self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFD);
      _UIHyperInteractorDirtyExtentVector(self);
      v4 = v6;
    }
  }

}

- (_UIHyperExtender)_extender
{
  void (**extenderGetter)(id, SEL);
  void *v4;
  _UIHyperConstantExtender *v5;

  if ((*(_BYTE *)&self->_clean & 2) == 0)
  {
    extenderGetter = (void (**)(id, SEL))self->__extenderGetter;
    if (extenderGetter)
    {
      extenderGetter[2](extenderGetter, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIHyperInteractor _setInternalExtender:](self, "_setInternalExtender:", v4);

    }
    if (!self->__extender)
    {
      v5 = -[_UIHyperConstantExtender initWithDimensions:]([_UIHyperConstantExtender alloc], "initWithDimensions:", self->__dimensions);
      -[_UIHyperInteractor _setInternalExtender:](self, "_setInternalExtender:", v5);

    }
    *(_DWORD *)&self->_clean |= 2u;
  }
  return self->__extender;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIHyperregion removeObserver:forKeyPath:context:](self->__region, "removeObserver:forKeyPath:context:", self, CFSTR("self"), _MergedGlobals_895);
  -[_UIHyperExtender removeObserver:forKeyPath:context:](self->__extender, "removeObserver:forKeyPath:context:", self, CFSTR("self"), off_1ECD75D40);
  free(self->__unconstrainedPoint);
  free(self->__initialTranslation);
  free(self->__translation);
  free(self->__translatedUnconstrainedPoint);
  free(self->__velocity);
  free(self->__effectiveVelocity);
  free(self->__projectedPoint);
  free(self->__closestPoint);
  free(self->__unconstrainedVector);
  free(self->__extentVector);
  free(self->__unconstrainedExtentVector);
  free(self->__constrainedPoint);
  free(self->__constrainedVelocity);
  free(self->__overridePresentationPoint);
  free(self->__lastConstrainedPoint);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperInteractor;
  -[_UIHyperInteractor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__broadcaster, 0);
  objc_storeStrong(&self->__presentationPointWasInvalidated, 0);
  objc_storeStrong(&self->__unconstrainedPointGetter, 0);
  objc_storeStrong(&self->__extenderGetter, 0);
  objc_storeStrong(&self->__regionGetter, 0);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__extender, 0);
  objc_storeStrong((id *)&self->__region, 0);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_opt_class();
  -[_UIHyperInteractor _region](self, "_region");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInteractor _extender](self, "_extender");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInteractor _animator](self, "_animator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInteractor _minimumSpeed](self, "_minimumSpeed");
  v4 = v3;
  -[_UIHyperInteractor _decelerationRate](self, "_decelerationRate");
  v6 = v5;
  -[_UIHyperInteractor _rubberBandCoefficient](self, "_rubberBandCoefficient");
  v8 = v7;
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _unconstrainedPoint](self, "_unconstrainedPoint"), self->__dimensions);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _initialTranslation](self, "_initialTranslation"), self->__dimensions);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _translation](self, "_translation"), self->__dimensions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _velocity](self, "_velocity"), self->__dimensions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _effectiveVelocity](self, "_effectiveVelocity"), self->__dimensions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _projectedPoint](self, "_projectedPoint"), self->__dimensions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _closestPoint](self, "_closestPoint"), self->__dimensions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _constrainedPoint](self, "_constrainedPoint"), self->__dimensions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)-[_UIHyperInteractor _constrainedVelocity](self, "_constrainedVelocity"), self->__dimensions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; region = %@; extender = %@; animator = %@; minimumSpeed = %g; decelerationRate = %g; rubberBandCoefficient = %g; unconstrainedPoint = %@; initialTranslation = %@; translation = %@; velocity = %@; effectiveVelocity = %@; projectedPoint = %@; closestPoint = %@; constrainedPoint = %@; constrainedVelocity = %@>"),
    v22,
    self,
    v21,
    v20,
    v19,
    v4,
    v6,
    v8,
    v24,
    v18,
    v17,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_invalidateRegion
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;

  clean = self->_clean;
  if ((*(_BYTE *)&clean & 1) != 0)
  {
    self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFE);
    _UIHyperInteractorDirtyClosestPoint(self);
  }
}

- (void)_invalidateExtender
{
  $2EBF6573070EC26E3189A7B4CB61B0F7 clean;

  clean = self->_clean;
  if ((*(_BYTE *)&clean & 2) != 0)
  {
    self->_clean = ($2EBF6573070EC26E3189A7B4CB61B0F7)(*(_DWORD *)&clean & 0xFFFFFFFD);
    _UIHyperInteractorDirtyExtentVector(self);
  }
}

- (_UIHyperAnimator)_animator
{
  _UIHyperAnimator *animator;
  _UIHyperOutOfProcessViewAnimator *v4;

  animator = self->__animator;
  if (!animator)
  {
    v4 = -[_UIHyperOutOfProcessViewAnimator initWithDimensions:]([_UIHyperOutOfProcessViewAnimator alloc], "initWithDimensions:", self->__dimensions);
    -[_UIHyperInteractor _setAnimator:](self, "_setAnimator:", v4);

    animator = self->__animator;
  }
  return animator;
}

- (void)_setBroadcaster:(id)a3
{
  _UIHyperInteractorBroadcaster *v5;
  _UIHyperInteractorBroadcaster *broadcaster;
  _UIHyperInteractorBroadcaster **p_broadcaster;
  _UIHyperInteractor *v8;
  void *v9;
  void *v10;
  _UIHyperInteractorBroadcaster *v11;

  v5 = (_UIHyperInteractorBroadcaster *)a3;
  broadcaster = self->__broadcaster;
  if (broadcaster != v5)
  {
    v11 = v5;
    p_broadcaster = &self->__broadcaster;
    -[_UIHyperInteractorBroadcaster _interactor](broadcaster, "_interactor");
    v8 = (_UIHyperInteractor *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[_UIHyperInteractorBroadcaster _setInteractor:](*p_broadcaster, "_setInteractor:", 0);
    objc_storeStrong((id *)&self->__broadcaster, a3);
    -[_UIHyperInteractorBroadcaster _interactor](*p_broadcaster, "_interactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[_UIHyperInteractorBroadcaster _interactor](*p_broadcaster, "_interactor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setBroadcaster:", 0);

    }
    -[_UIHyperInteractorBroadcaster _setInteractor:](self->__broadcaster, "_setInteractor:", self);
    v5 = v11;
  }

}

- (void)_setMinimumSpeed:(double)a3
{
  id v4;

  if (self->__minimumSpeed != a3)
  {
    self->__minimumSpeed = a3;
    _UIHyperInteractorDirtyEffectiveVelocity(self);
    -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_broadcastIfPossible");

  }
}

- (void)_setRubberBandCoefficient:(double)a3
{
  id v4;

  if (self->__rubberBandCoefficient != a3)
  {
    self->__rubberBandCoefficient = a3;
    _UIHyperInteractorDirtyConstrainedFraction(self);
    -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_broadcastIfPossible");

  }
}

- (void)_copyInitialTranslation:(const double *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46___UIHyperInteractor__copyInitialTranslation___block_invoke;
  v3[3] = &unk_1E16B3EF0;
  v3[4] = self;
  v3[5] = a3;
  -[_UIHyperInteractor _mutateInitialTranslation:](self, "_mutateInitialTranslation:", v3);
}

- (void)_mutateInitialTranslation:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__initialTranslation);
  _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
}

- (void)_copyTranslation:(const double *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39___UIHyperInteractor__copyTranslation___block_invoke;
  v3[3] = &unk_1E16B3EF0;
  v3[4] = self;
  v3[5] = a3;
  -[_UIHyperInteractor _mutateTranslation:](self, "_mutateTranslation:", v3);
}

- (void)_mutateTranslation:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__translation);
  _UIHyperInteractorDirtyTranslatedUnconstrainedPoint(self);
}

- (void)_commitTranslation
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___UIHyperInteractor__commitTranslation__block_invoke;
  v6[3] = &unk_1E16B2FB8;
  v6[4] = self;
  -[_UIHyperInteractor _mutateUnconstrainedPoint:](self, "_mutateUnconstrainedPoint:", v6);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __40___UIHyperInteractor__commitTranslation__block_invoke_2;
  v5[3] = &unk_1E16B2FB8;
  v5[4] = self;
  -[_UIHyperInteractor _mutateInitialTranslation:](self, "_mutateInitialTranslation:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __40___UIHyperInteractor__commitTranslation__block_invoke_3;
  v4[3] = &unk_1E16B2FB8;
  v4[4] = self;
  -[_UIHyperInteractor _mutateTranslation:](self, "_mutateTranslation:", v4);
}

- (const)_velocity
{
  return self->__velocity;
}

- (void)_copyVelocity:(const double *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36___UIHyperInteractor__copyVelocity___block_invoke;
  v3[3] = &unk_1E16B3EF0;
  v3[4] = self;
  v3[5] = a3;
  -[_UIHyperInteractor _mutateVelocity:](self, "_mutateVelocity:", v3);
}

- (void)_mutateVelocity:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__velocity);
  _UIHyperInteractorDirtyEffectiveVelocity(self);
}

- (void)_copyOverridePresentationPoint:(const double *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53___UIHyperInteractor__copyOverridePresentationPoint___block_invoke;
  v3[3] = &unk_1E16B3EF0;
  v3[4] = self;
  v3[5] = a3;
  -[_UIHyperInteractor _mutateOverridePresentationPoint:](self, "_mutateOverridePresentationPoint:", v3);
}

- (void)_mutateOverridePresentationPoint:(id)a3
{
  (*((void (**)(id, double *))a3 + 2))(a3, self->__overridePresentationPoint);
  _UIHyperInteractorDirtyPresentationPoint(self);
}

- (void)_setOverridingPresentationPoint:(BOOL)a3
{
  if (self->__overridingPresentationPoint != a3)
  {
    self->__overridingPresentationPoint = a3;
    _UIHyperInteractorDirtyPresentationPoint(self);
  }
}

- (void)_interactionBegan
{
  void *v3;
  id v4;

  -[_UIHyperInteractor _setInteractive:](self, "_setInteractive:", 1);
  -[_UIHyperInteractor _animator](self, "_animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_interactionBegan");

  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_interactionDidBegin");

}

- (void)_interactionChangedCopyingTranslation:(const double *)a3 velocity:(const double *)a4
{
  -[_UIHyperInteractor _interactionChangedCopyingTranslation:velocity:mutatingState:](self, "_interactionChangedCopyingTranslation:velocity:mutatingState:", a3, a4, 0);
}

- (void)_interactionChangedCopyingTranslation:(const double *)a3 velocity:(const double *)a4 mutatingState:(id)a5
{
  _QWORD v5[6];
  _QWORD v6[6];

  v5[5] = a4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83___UIHyperInteractor__interactionChangedCopyingTranslation_velocity_mutatingState___block_invoke;
  v6[3] = &unk_1E16B3EF0;
  v6[4] = self;
  v6[5] = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83___UIHyperInteractor__interactionChangedCopyingTranslation_velocity_mutatingState___block_invoke_2;
  v5[3] = &unk_1E16B3EF0;
  v5[4] = self;
  -[_UIHyperInteractor _interactionChangedMutatingTranslation:velocity:mutatingState:](self, "_interactionChangedMutatingTranslation:velocity:mutatingState:", v6, v5, a5);
}

- (void)_interactionChangedMutatingTranslation:(id)a3 velocity:(id)a4
{
  -[_UIHyperInteractor _interactionChangedMutatingTranslation:velocity:mutatingState:](self, "_interactionChangedMutatingTranslation:velocity:mutatingState:", a3, a4, 0);
}

- (void)_interactionChangedMutatingTranslation:(id)a3 velocity:(id)a4 mutatingState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  v12 = (void (**)(void))a5;
  v8 = a4;
  v9 = a3;
  -[_UIHyperInteractor _constrainedPoint](self, "_constrainedPoint");
  cblas_dcopy_NEWLAPACK();
  -[_UIHyperInteractor _mutateTranslation:](self, "_mutateTranslation:", v9);

  -[_UIHyperInteractor _mutateVelocity:](self, "_mutateVelocity:", v8);
  if (v12)
    v12[2]();
  -[_UIHyperInteractor _animator](self, "_animator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_interactionChanged");

  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_interactionDidChange");

}

- (void)_interactionEnded
{
  -[_UIHyperInteractor _interactionEndedMutatingState:](self, "_interactionEndedMutatingState:", 0);
}

- (void)_interactionEndedMutatingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_interactionWillEnd");

  -[_UIHyperInteractor _animator](self, "_animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___UIHyperInteractor__interactionEndedMutatingState___block_invoke;
  v9[3] = &unk_1E16B2F48;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "_interactionEndedMutatingState:", v9);

  -[_UIHyperInteractor _broadcaster](self, "_broadcaster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_interactionDidEnd");

}

- (void)_setInteractive:(BOOL)a3
{
  if (self->__interactive != a3)
    self->__interactive = a3;
}

- (const)_effectiveVelocity
{
  double v3;
  double v4;
  double v5;

  if ((*(_BYTE *)&self->_clean & 0x10) == 0)
  {
    -[_UIHyperInteractor _velocity](self, "_velocity");
    cblas_dnrm2_NEWLAPACK();
    v4 = v3;
    -[_UIHyperInteractor _minimumSpeed](self, "_minimumSpeed");
    if (v4 >= v5)
      cblas_dcopy_NEWLAPACK();
    else
      catlas_dset_NEWLAPACK();
    *(_DWORD *)&self->_clean |= 0x10u;
  }
  return self->__effectiveVelocity;
}

- (const)_projectedPoint
{
  double v3;
  double v4;
  double *projectedPoint;
  const double *v6;
  const double *v7;
  vDSP_Length dimensions;
  double __B;

  if ((*(_BYTE *)&self->_clean & 0x20) == 0)
  {
    -[_UIHyperInteractor _decelerationRate](self, "_decelerationRate");
    v4 = v3;
    projectedPoint = self->__projectedPoint;
    v6 = -[_UIHyperInteractor _effectiveVelocity](self, "_effectiveVelocity");
    v7 = -[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint");
    dimensions = self->__dimensions;
    __B = v4 / (1.0 - v4) / 1000.0;
    vDSP_vsmaD(v6, 1, &__B, v7, 1, projectedPoint, 1, dimensions);
    *(_DWORD *)&self->_clean |= 0x20u;
  }
  return self->__projectedPoint;
}

- (BOOL)_isRubberBanding
{
  BOOL result;

  if ((*(_BYTE *)&self->_clean & 0x80) != 0)
    return self->__rubberBanding;
  result = memcmp(-[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"), -[_UIHyperInteractor _closestPoint](self, "_closestPoint"), 8 * self->__dimensions) != 0;
  self->__rubberBanding = result;
  *(_DWORD *)&self->_clean |= 0x80u;
  return result;
}

- (const)_unconstrainedVector
{
  if ((*((_BYTE *)&self->_clean + 1) & 1) == 0)
  {
    vDSP_vsubD(-[_UIHyperInteractor _closestPoint](self, "_closestPoint"), 1, -[_UIHyperInteractor _translatedUnconstrainedPoint](self, "_translatedUnconstrainedPoint"), 1, self->__unconstrainedVector, 1, self->__dimensions);
    *(_DWORD *)&self->_clean |= 0x100u;
  }
  return self->__unconstrainedVector;
}

- (double)_unconstrainedExtent
{
  double result;

  if ((*((_BYTE *)&self->_clean + 1) & 0x10) != 0)
    return self->__unconstrainedExtent;
  -[_UIHyperInteractor _unconstrainedExtentVector](self, "_unconstrainedExtentVector");
  cblas_dnrm2_NEWLAPACK();
  self->__unconstrainedExtent = result;
  *(_DWORD *)&self->_clean |= 0x1000u;
  return result;
}

- (const)_constrainedVelocity
{
  double v3;
  double v4;
  double *constrainedVelocity;
  const double *v6;
  double v7;
  double *v8;
  const double *v9;
  double v10;

  if ((*((_BYTE *)&self->_clean + 1) & 0x80) == 0)
  {
    vDSP_vsubD(-[_UIHyperInteractor _unconstrainedExtentVector](self, "_unconstrainedExtentVector"), 1, -[_UIHyperInteractor _unconstrainedVector](self, "_unconstrainedVector"), 1, self->__constrainedVelocity, 1, self->__dimensions);
    cblas_dnrm2_NEWLAPACK();
    v4 = v3;
    constrainedVelocity = self->__constrainedVelocity;
    v6 = -[_UIHyperInteractor _effectiveVelocity](self, "_effectiveVelocity");
    if (v4 == 0.0)
      cblas_dcopy_NEWLAPACK();
    else
      _UIHyperFractionalProjectionOntoHyperplane(constrainedVelocity, v6, self->__constrainedVelocity, self->__dimensions, 1.0);
    -[_UIHyperInteractor _unconstrainedExtent](self, "_unconstrainedExtent");
    if (v7 != 0.0)
    {
      v8 = self->__constrainedVelocity;
      v9 = -[_UIHyperInteractor _unconstrainedExtentVector](self, "_unconstrainedExtentVector");
      -[_UIHyperInteractor _constrainedFraction](self, "_constrainedFraction");
      _UIHyperFractionalProjectionOntoHyperplane(v8, v8, v9, self->__dimensions, 1.0 - v10);
    }
    *(_DWORD *)&self->_clean |= 0x8000u;
  }
  return self->__constrainedVelocity;
}

- (const)_overridePresentationPoint
{
  return self->__overridePresentationPoint;
}

- (void)_getUnconstrainedPoint:(double *)a3 forConstrainedPoint:(const double *)a4
{
  void *v7;
  size_t v8;
  uint64_t v9;
  const double *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double *v16;
  vDSP_Length v17;
  vDSP_Length dimensions;
  double v19;
  double v20;
  double v21;
  double v22;
  vDSP_Length v23;
  double __B[2];

  __B[1] = *(double *)MEMORY[0x1E0C80C00];
  -[_UIHyperInteractor _region](self, "_region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_closestPoint:toPoint:", a3, a4);

  v8 = 8 * self->__dimensions;
  v9 = memcmp(a3, a4, v8);
  if ((_DWORD)v9)
  {
    v10 = (double *)((char *)__B - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    -[_UIHyperInteractor _extender](self, "_extender", MEMORY[0x1E0C80A78](v9).n128_f64[0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_getExtentVector:forUnconstrainedPoint:closestPoint:", v10, a4, a3);

    v12 = cblas_dnrm2_NEWLAPACK();
    if (v13 == 0.0)
      goto LABEL_5;
    v14 = v13;
    MEMORY[0x1E0C80A78](v12);
    v16 = (double *)((char *)__B - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    vDSP_vsubD(a3, 1, a4, 1, v16, 1, v17);
    dimensions = self->__dimensions;
    __B[0] = _UIHyperFractionOfProjectionOnto(v16, v10, dimensions);
    vDSP_vsmulD(v10, 1, __B, v16, 1, dimensions);
    cblas_dnrm2_NEWLAPACK();
    v20 = v19;
    v21 = v19 / v14;
    if (v19 / v14 >= 1.0)
    {
LABEL_5:
      cblas_dcopy_NEWLAPACK();
    }
    else
    {
      -[_UIHyperInteractor _rubberBandCoefficient](self, "_rubberBandCoefficient");
      v23 = self->__dimensions;
      __B[0] = v14 * ((-1.0 / (v21 + -1.0) + -1.0) / v22) / v20;
      vDSP_vsmaD(v16, 1, __B, a3, 1, a3, 1, v23);
    }
  }
}

- (double)_minimumSpeed
{
  return self->__minimumSpeed;
}

- (double)_decelerationRate
{
  return self->__decelerationRate;
}

- (double)_rubberBandCoefficient
{
  return self->__rubberBandCoefficient;
}

- (BOOL)_isInteractive
{
  return self->__interactive;
}

- (_UIHyperInteractorDelegate)_delegate
{
  return (_UIHyperInteractorDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (const)_initialTranslation
{
  return self->__initialTranslation;
}

- (BOOL)_isOverridingPresentationPoint
{
  return self->__overridingPresentationPoint;
}

- (const)_lastConstrainedPoint
{
  return self->__lastConstrainedPoint;
}

- (id)_regionGetter
{
  return self->__regionGetter;
}

- (id)_extenderGetter
{
  return self->__extenderGetter;
}

- (id)_unconstrainedPointGetter
{
  return self->__unconstrainedPointGetter;
}

- (id)_presentationPointWasInvalidated
{
  return self->__presentationPointWasInvalidated;
}

- (const)_translation
{
  return self->__translation;
}

@end
