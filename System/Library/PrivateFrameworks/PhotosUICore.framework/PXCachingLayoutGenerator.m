@implementation PXCachingLayoutGenerator

- (void)dealloc
{
  objc_super v3;

  free(self->_itemRects);
  free(self->_itemKinds);
  free(self->_zPositions);
  v3.receiver = self;
  v3.super_class = (Class)PXCachingLayoutGenerator;
  -[PXCachingLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXCachingLayoutGenerator _updateIfNeeded](self, "_updateIfNeeded");
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  CGFloat *p_height;
  CGRect *v11;
  int64_t v12;
  CGFloat width;
  CGFloat height;
  float v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  length = a4.length;
  location = a4.location;
  -[PXCachingLayoutGenerator _updateIfNeeded](self, "_updateIfNeeded", a3, a4.location, a4.length, a5);
  if (length)
  {
    v9 = location;
    p_height = &a3->var7.height;
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v22 = *MEMORY[0x1E0C9BAA8];
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v18 = *((_OWORD *)off_1E50B86D0 + 1);
    v19 = *(_OWORD *)off_1E50B86D0;
    do
    {
      v11 = &self->_itemRects[v9];
      v12 = self->_itemKinds[location];
      width = v11->size.width;
      height = v11->size.height;
      PXRectGetCenter();
      v15 = self->_zPositions[location];
      *((_QWORD *)p_height - 18) = location;
      *((_QWORD *)p_height - 17) = v16;
      *((_QWORD *)p_height - 16) = v17;
      *(p_height - 15) = width;
      *(p_height - 14) = height;
      *(_OWORD *)(p_height - 13) = v22;
      *(_OWORD *)(p_height - 11) = v21;
      *(_OWORD *)(p_height - 9) = v20;
      *((float *)p_height - 14) = v15;
      *((_DWORD *)p_height - 13) = 0;
      *((_QWORD *)p_height - 6) = v12;
      *(_OWORD *)(p_height - 3) = v18;
      *(_OWORD *)(p_height - 5) = v19;
      *(p_height - 1) = width;
      *p_height = height;
      ++location;
      ++v9;
      p_height += 19;
      --length;
    }
    while (length);
  }
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCachingLayoutGenerator;
  -[PXCachingLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_isValid = 0;
}

- (void)_updateIfNeeded
{
  uint64_t v3;
  int64_t itemCapacity;

  if (!self->_isValid)
  {
    v3 = -[PXCachingLayoutGenerator itemCount](self, "itemCount");
    itemCapacity = self->_itemCapacity;
    if (v3 > itemCapacity)
    {
      if (itemCapacity)
      {
        do
          itemCapacity *= 2;
        while (itemCapacity < v3);
      }
      else
      {
        itemCapacity = v3;
      }
      self->_itemCapacity = itemCapacity;
      _PXGArrayResize();
      _PXGArrayResize();
      _PXGArrayResize();
    }
    -[PXCachingLayoutGenerator updateContentSize:itemRects:itemKinds:zPositions:](self, "updateContentSize:itemRects:itemKinds:zPositions:", &self->_contentSize, self->_itemRects, self->_itemKinds, self->_zPositions);
    self->_isValid = 1;
  }
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCachingLayoutGenerator.m"), 74, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCachingLayoutGenerator updateContentSize:itemRects:]", v8);

  abort();
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5
{
  uint64_t v9;

  v9 = -[PXCachingLayoutGenerator itemCount](self, "itemCount");
  if (v9 >= 1)
    bzero(a5, 8 * v9);
  -[PXCachingLayoutGenerator updateContentSize:itemRects:](self, "updateContentSize:itemRects:", a3, a4);
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6
{
  uint64_t v11;

  v11 = -[PXCachingLayoutGenerator itemCount](self, "itemCount");
  if (v11 >= 1)
    bzero(a6, 4 * v11);
  -[PXCachingLayoutGenerator updateContentSize:itemRects:itemKinds:](self, "updateContentSize:itemRects:itemKinds:", a3, a4, a5);
}

@end
