@implementation _PXGAbsoluteSublayoutComposition

- (void)dealloc
{
  objc_super v3;

  free(self->_sublayoutFrames);
  free(self->_sublayoutZPositions);
  free(self->_sublayoutReferenceDepths);
  free(self->_sublayoutSpriteTransforms);
  v3.receiver = self;
  v3.super_class = (Class)_PXGAbsoluteSublayoutComposition;
  -[_PXGAbsoluteSublayoutComposition dealloc](&v3, sel_dealloc);
}

- (void)insertRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  $8F6F21C65DCD0A0F8AC24DFE540A6236 *v12;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    self->_sublayoutCount += a3.length;
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayInsertRange();
    _PXGArrayInsertRange();
    _PXGArrayInsertRange();
    _PXGArrayInsertRange();
    v6 = location;
    v7 = location;
    v8 = *(_OWORD *)off_1E50B8368;
    v9 = *((_OWORD *)off_1E50B8368 + 1);
    v10 = *((_OWORD *)off_1E50B8368 + 2);
    v11 = *((double *)off_1E50B8368 + 6);
    do
    {
      self->_sublayoutZPositions[v7] = 0.0;
      self->_sublayoutReferenceDepths[v7] = 1.0;
      v12 = &self->_sublayoutSpriteTransforms[v6];
      *(_OWORD *)&v12->var0.a = v8;
      *(_OWORD *)&v12->var0.c = v9;
      *(_OWORD *)&v12->var0.tx = v10;
      v12->var1 = v11;
      ++v6;
      ++v7;
      --length;
    }
    while (length);
  }
}

- (void)removeRange:(_NSRange)a3
{
  NSUInteger length;

  length = a3.length;
  _PXGArrayRemoveRange();
  _PXGArrayRemoveRange();
  _PXGArrayRemoveRange();
  _PXGArrayRemoveRange();
  self->_sublayoutCount -= length;
  _PXGArrayResize();
  _PXGArrayResize();
  _PXGArrayResize();
  _PXGArrayResize();
}

- (void)setOrigins:(const CGPoint *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  CGPoint v9;
  void *v11;
  void *v12;
  NSRange v13;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13.location = location;
    v13.length = length;
    NSStringFromRange(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAbsoluteCompositeLayout.m"), 164, CFSTR("range (%@) not within 0 ..< %li"), v12, self->_sublayoutCount);

    if (!length)
      goto LABEL_5;
  }
  else if (!a4.length)
  {
    goto LABEL_5;
  }
  v8 = location;
  do
  {
    v9 = *a3++;
    self->_sublayoutFrames[v8++].origin = v9;
    --length;
  }
  while (length);
LABEL_5:
  -[_PXGAbsoluteSublayoutComposition updateEstimatedSublayoutGeometries](self, "updateEstimatedSublayoutGeometries");
}

- (void)setFrames:(const CGRect *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  NSRange v11;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11.location = location;
    v11.length = length;
    NSStringFromRange(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAbsoluteCompositeLayout.m"), 172, CFSTR("range (%@) not within 0 ..< %li"), v10, self->_sublayoutCount);

  }
  memcpy(&self->_sublayoutFrames[location], a3, 32 * length);
  -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
}

- (void)setZPositions:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  NSRange v11;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11.location = location;
    v11.length = length;
    NSStringFromRange(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAbsoluteCompositeLayout.m"), 178, CFSTR("range (%@) not within 0 ..< %li"), v10, self->_sublayoutCount);

  }
  memcpy(&self->_sublayoutZPositions[location], a3, 8 * length);
  -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
}

- (void)setReferenceDepths:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  NSRange v11;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11.location = location;
    v11.length = length;
    NSStringFromRange(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAbsoluteCompositeLayout.m"), 184, CFSTR("range (%@) not within 0 ..< %li"), v10, self->_sublayoutCount);

  }
  memcpy(&self->_sublayoutReferenceDepths[location], a3, 8 * length);
  -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
}

- (void)setSpriteTransforms:(id *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  NSRange v11;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11.location = location;
    v11.length = length;
    NSStringFromRange(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAbsoluteCompositeLayout.m"), 190, CFSTR("range (%@) not within 0 ..< %li"), v10, self->_sublayoutCount);

  }
  memcpy(&self->_sublayoutSpriteTransforms[location], a3, 56 * length);
  -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
}

- (void)updateEstimatedSublayoutGeometries
{
  _PXGAbsoluteSublayoutComposition *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  $8F6F21C65DCD0A0F8AC24DFE540A6236 *v14;
  double var1;
  __int128 v16;
  __int128 v17;
  void *v18;

  v3 = objc_retainAutorelease(self);
  v4 = -[PXGSublayoutComposition sublayoutGeometries](v3, "sublayoutGeometries");
  v5 = -[PXGSublayoutComposition numberOfSublayouts](v3, "numberOfSublayouts");
  if (v5 != v3->_sublayoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PXGAbsoluteCompositeLayout.m"), 198, CFSTR("number of sublayouts (%li) doesn't match the number of sublayout frames (%li)"), v5, v3->_sublayoutCount);

  }
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = v4 + 48;
    do
    {
      v10 = (__int128 *)&v3->_sublayoutFrames[v6];
      v11 = v3->_sublayoutZPositions[v8];
      v13 = *v10;
      v12 = v10[1];
      *(_OWORD *)(v9 - 16) = v12;
      *(_OWORD *)v9 = v13;
      *(double *)(v9 + 16) = v11;
      *(_OWORD *)(v9 - 48) = v12;
      *(double *)(v9 - 32) = v3->_sublayoutReferenceDepths[v8];
      v14 = &v3->_sublayoutSpriteTransforms[v7];
      var1 = v14->var1;
      v17 = *(_OWORD *)&v14->var0.c;
      v16 = *(_OWORD *)&v14->var0.tx;
      *(_OWORD *)(v9 + 24) = *(_OWORD *)&v14->var0.a;
      *(_OWORD *)(v9 + 40) = v17;
      ++v8;
      *(_OWORD *)(v9 + 56) = v16;
      *(double *)(v9 + 72) = var1;
      ++v7;
      ++v6;
      v9 += 136;
    }
    while (v5 != v8);
  }
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _QWORD);
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int64_t v12;
  _QWORD aBlock[4];
  id v14;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112___PXGAbsoluteSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke;
  aBlock[3] = &unk_1E5149140;
  v7 = v6;
  v14 = v7;
  v8 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v9 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  if (-[_PXGAbsoluteSublayoutComposition shouldUpdateSublayoutsInStrictOrder](self, "shouldUpdateSublayoutsInStrictOrder"))
  {
    if (v9 >= 1)
    {
      for (i = 0; i != v9; ++i)
        v8[2](v8, i);
    }
  }
  else
  {
    v8[2](v8, a3);
    if (a3 >= 1)
    {
      v11 = 0;
      do
        v8[2](v8, v11++);
      while (a3 != v11);
    }
    v12 = a3 + 1;
    if (v12 < v9)
    {
      do
        v8[2](v8, v12++);
      while (v9 != v12);
    }
  }

}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_PXGAbsoluteSublayoutComposition contentSize](self, "contentSize");
  PXRectWithOriginAndSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (BOOL)shouldUpdateSublayoutsInStrictOrder
{
  return self->_shouldUpdateSublayoutsInStrictOrder;
}

- (void)setShouldUpdateSublayoutsInStrictOrder:(BOOL)a3
{
  self->_shouldUpdateSublayoutsInStrictOrder = a3;
}

@end
