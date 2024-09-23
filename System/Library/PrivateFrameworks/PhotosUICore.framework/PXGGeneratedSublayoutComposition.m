@implementation PXGGeneratedSublayoutComposition

- (void)dealloc
{
  objc_super v3;

  free(self->_layoutGeometries);
  v3.receiver = self;
  v3.super_class = (Class)PXGGeneratedSublayoutComposition;
  -[PXGGeneratedSublayoutComposition dealloc](&v3, sel_dealloc);
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGGeneratedSublayoutComposition;
  -[PXGSublayoutComposition referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
}

- (void)updateEstimatedSublayoutGeometries
{
  PXLayoutGenerator *v4;
  PXLayoutGenerator *layoutGenerator;
  uint64_t v6;
  PXGGeneratedSublayoutComposition *v7;
  uint64_t v8;
  uint64_t layoutGeometriesCapacity;
  int64_t v10;
  uint64_t v11;
  _PXLayoutGeometry *v12;
  uint64_t v13;
  double var4;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  -[PXGGeneratedSublayoutComposition configuredLayoutGenerator](self, "configuredLayoutGenerator");
  v4 = (PXLayoutGenerator *)objc_claimAutoreleasedReturnValue();
  layoutGenerator = self->_layoutGenerator;
  self->_layoutGenerator = v4;

  v6 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  v7 = objc_retainAutorelease(self);
  v8 = -[PXGSublayoutComposition sublayoutGeometries](v7, "sublayoutGeometries");
  if (-[PXLayoutGenerator numberOfGeometriesWithKind:](self->_layoutGenerator, "numberOfGeometriesWithKind:", 0) != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXGGeneratedSublayoutComposition.m"), 44, CFSTR("count mismatch"));

  }
  layoutGeometriesCapacity = v7->_layoutGeometriesCapacity;
  if (v6 > layoutGeometriesCapacity)
  {
    v10 = v6;
    if (layoutGeometriesCapacity >= 1)
    {
      v10 = v7->_layoutGeometriesCapacity;
      do
        v10 *= 2;
      while (v10 < v6);
    }
    v7->_layoutGeometriesCapacity = v10;
    _PXGArrayResize();
  }
  -[PXLayoutGenerator getGeometries:inRange:withKind:](self->_layoutGenerator, "getGeometries:inRange:withKind:", v7->_layoutGeometries, 0, v6, 0);
  if (v6 >= 1)
  {
    v11 = 0;
    do
    {
      v12 = &v7->_layoutGeometries[v11];
      v13 = v8 + 136 * v12->var0;
      PXRectWithCenterAndSize();
      var4 = v12->var4;
      *(_QWORD *)(v13 + 48) = v15;
      *(_QWORD *)(v13 + 56) = v16;
      *(double *)(v13 + 64) = var4;
      *(_QWORD *)(v13 + 32) = v17;
      *(_QWORD *)(v13 + 40) = v18;
      *(_OWORD *)v13 = *(_OWORD *)(v13 + 32);
      *(_WORD *)(v13 + 24) = v12->var5;
      ++v11;
      --v6;
    }
    while (v6);
  }
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, int64_t);
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  _QWORD aBlock[4];
  id v14;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PXGGeneratedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke;
  aBlock[3] = &unk_1E5149140;
  v7 = v6;
  v14 = v7;
  v8 = (void (**)(void *, int64_t))_Block_copy(aBlock);
  v8[2](v8, a3);
  if (a3 >= 1)
  {
    v9 = 0;
    do
      v8[2](v8, v9++);
    while (a3 != v9);
  }
  v10 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  v11 = a3 + 1;
  if (v11 < v10)
  {
    v12 = v10;
    do
      v8[2](v8, v11++);
    while (v12 != v11);
  }

}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXLayoutGenerator size](self->_layoutGenerator, "size");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (PXLayoutGenerator)configuredLayoutGenerator
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGeneratedSublayoutComposition.m"), 89, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGGeneratedSublayoutComposition configuredLayoutGenerator]", v6);

  abort();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
}

uint64_t __112__PXGGeneratedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
