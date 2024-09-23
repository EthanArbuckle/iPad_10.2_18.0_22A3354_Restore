@implementation PXCuratedLibraryGridLayoutGenerator

- (PXCuratedLibraryGridLayoutGenerator)initWithMetrics:(id)a3
{
  id v4;
  PXCuratedLibraryGridLayoutGenerator *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  objc_super v24;
  double v25;
  double v26;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXCuratedLibraryGridLayoutGenerator;
  v5 = -[PXCuratedLibraryGridLayoutGenerator initWithMetrics:](&v24, sel_initWithMetrics_, v4);
  if (v5)
  {
    objc_msgSend(v4, "padding");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "referenceSize");
    v15 = v14 - v9 - v13;
    v16 = objc_msgSend(v4, "numberOfColumns");
    objc_msgSend(v4, "interitemSpacing");
    v18 = v17;
    v19 = objc_msgSend(v4, "style");
    if (v19 == 1)
    {
      objc_msgSend(v4, "screenScale");
      v25 = 0.0;
      v26 = 0.0;
      +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:](PXLayoutMetricInterpolator, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v16, &v26, &v25, v15, v22);
      v18 = v26;
      v9 = v9 + v25;
      v13 = v13 + v25;
    }
    else if (v19)
    {
      v7 = *(double *)off_1E50B8020;
      v9 = *((double *)off_1E50B8020 + 1);
      v11 = *((double *)off_1E50B8020 + 2);
      v13 = *((double *)off_1E50B8020 + 3);
      v20 = *MEMORY[0x1E0C9D820];
      v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      v20 = (v15 - (double)(v16 - 1) * v18) / (double)v16;
      v21 = v20;
    }
    v5->_itemSize.width = v20;
    v5->_itemSize.height = v21;
    v5->_interItemSpacing = v18;
    v5->_insets.top = v7;
    v5->_insets.left = v9;
    v5->_insets.bottom = v11;
    v5->_insets.right = v13;
    *(_QWORD *)&v5->_cornerSpriteIndexes.topLeft = -1;
    *(_QWORD *)&v5->_cornerSpriteIndexes.bottomLeft = -1;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_geometries);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryGridLayoutGenerator;
  -[PXCuratedLibraryGridLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryGridLayoutGenerator;
  -[PXCuratedLibraryGridLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_isPrepared = 0;
}

- (CGSize)estimatedSize
{
  void *v3;
  uint64_t v4;
  double interItemSpacing;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  CGSize result;

  -[PXCuratedLibraryGridLayoutGenerator metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfColumns");
  interItemSpacing = self->_interItemSpacing;
  v6 = self->_insets.right
     + self->_insets.left
     + fmax(-(interItemSpacing - (double)v4 * (self->_itemSize.width + interItemSpacing)), 0.0);
  v7 = self->_insets.top
     + fmax(-(interItemSpacing - (interItemSpacing + self->_itemSize.height) * 3.0), 0.0)
     + self->_insets.bottom;

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXCuratedLibraryGridLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_actualSize.width;
  height = self->_actualSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)lastFullRowBottomEdge
{
  -[PXCuratedLibraryGridLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  return self->_lastFullRowBottomEdge;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  _PXLayoutGeometry *v13;
  _PXLayoutGeometry *v14;
  __int128 v15;
  __int128 v16;
  CGFloat height;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;

  length = a4.length;
  location = a4.location;
  v11 = a4.location + a4.length;
  if (a4.location + a4.length > -[PXCuratedLibraryGridLayoutGenerator itemCount](self, "itemCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryGridLayoutGenerator.m"), 140, CFSTR("the range must be <= to the number of itemCount"));

  }
  -[PXCuratedLibraryGridLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  if (location < v11)
  {
    v12 = location;
    do
    {
      v13 = &a3[v12];
      v14 = &self->_geometries[v12];
      v16 = *(_OWORD *)&v14->var6.origin.y;
      v15 = *(_OWORD *)&v14->var6.size.height;
      height = v14->var7.height;
      *(_OWORD *)&v13->var5 = *(_OWORD *)&v14->var5;
      v18 = *(_OWORD *)&v14->var1.y;
      *(_OWORD *)&v13->var0 = *(_OWORD *)&v14->var0;
      *(_OWORD *)&v13->var1.y = v18;
      v19 = *(_OWORD *)&v14->var2.height;
      v20 = *(_OWORD *)&v14->var3.b;
      v21 = *(_OWORD *)&v14->var3.ty;
      *(_OWORD *)&v13->var3.d = *(_OWORD *)&v14->var3.d;
      *(_OWORD *)&v13->var3.ty = v21;
      *(_OWORD *)&v13->var2.height = v19;
      *(_OWORD *)&v13->var3.b = v20;
      v13->var7.height = height;
      *(_OWORD *)&v13->var6.origin.y = v16;
      *(_OWORD *)&v13->var6.size.height = v15;
      v13->var5 = a5;
      ++v12;
      --length;
    }
    while (length);
  }
}

- (void)_prepareIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double top;
  CGFloat width;
  double height;
  double interItemSpacing;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  _PXLayoutGeometry *geometries;
  _PXLayoutGeometry *v21;
  _OWORD *v22;
  CGFloat v23;
  CGFloat v24;
  __int128 v25;
  CGSize v26;
  __int128 v27;
  CGPoint v28;
  uint64_t v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  double bottom;
  uint64_t v39;
  id v40;
  uint64_t v41;

  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    v3 = -[PXCuratedLibraryGridLayoutGenerator itemCount](self, "itemCount");
    v4 = -[PXCuratedLibraryGridLayoutGenerator keyItemIndex](self, "keyItemIndex");
    if (v3 <= 1)
      v5 = 1;
    else
      v5 = v3;
    v6 = v5 - 1;
    -[PXCuratedLibraryGridLayoutGenerator _prepareGeometriesBufferForCount:](self, "_prepareGeometriesBufferForCount:", v3);
    -[PXCuratedLibraryGridLayoutGenerator metrics](self, "metrics");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v40, "numberOfColumns");
    objc_msgSend(v40, "referenceSize");
    top = self->_insets.top;
    width = self->_itemSize.width;
    height = self->_itemSize.height;
    interItemSpacing = self->_interItemSpacing;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = v3;
    bottom = self->_insets.bottom;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = self->_insets.top;
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      v13 = v8 - self->_insets.left - self->_insets.right;
      objc_msgSend(v40, "headerAspectRatio");
      v15 = v13 / v14;
      v16 = top + v13 / v14 + self->_interItemSpacing;
    }
    v17 = objc_msgSend(v40, "numberOfPrecedingAssets");
    v37 = v6;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      v39 = 0;
    else
      v39 = v17 % v7;
    v41 = v3;
    if (v3 >= 1)
    {
      v18 = 0;
      v19 = v39;
      geometries = self->_geometries;
      v21 = &geometries[v4];
      v22 = (_OWORD *)MEMORY[0x1E0C9BAA8];
      do
      {
        PXRectGetCenter();
        if (v4 == v18)
        {
          v21->var0 = v4;
          v21->var1.x = v23;
          v21->var1.y = v24;
          v21->var2.width = v13;
          v21->var2.height = v15;
          v25 = v22[1];
          *(_OWORD *)&v21->var3.a = *v22;
          *(_OWORD *)&v21->var3.c = v25;
          *(_OWORD *)&v21->var3.tx = v22[2];
          *(_QWORD *)&v21->var4 = 0;
          v21->var5 = 0;
          v26 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
          v21->var6.origin = *(CGPoint *)off_1E50B86D0;
          v21->var6.size = v26;
          v21->var7.width = v13;
          v21->var7.height = v15;
        }
        else
        {
          geometries->var0 = v18;
          geometries->var1.x = v23;
          geometries->var1.y = v24;
          geometries->var2.width = width;
          geometries->var2.height = height;
          v27 = v22[1];
          *(_OWORD *)&geometries->var3.a = *v22;
          *(_OWORD *)&geometries->var3.c = v27;
          *(_OWORD *)&geometries->var3.tx = v22[2];
          *(_QWORD *)&geometries->var4 = 0;
          geometries->var5 = 0;
          v28 = *(CGPoint *)off_1E50B86D0;
          geometries->var6.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
          geometries->var6.origin = v28;
          ++v19;
          geometries->var7.width = width;
          geometries->var7.height = height;
        }
        ++v18;
        ++geometries;
      }
      while (v41 != v18);
    }
    v29 = (v7 + v39 + v37 - 1) / v7;
    v30 = 0.0;
    if (v29 > 0)
      v30 = self->_interItemSpacing;
    v31 = bottom + v16 + (double)v29 * (height + interItemSpacing) - v30;
    objc_msgSend(v40, "referenceSize", 56);
    self->_actualSize.width = v32;
    self->_actualSize.height = v31;
    if ((v39 + v37) % v7 <= 0)
      v33 = 0.0;
    else
      v33 = height + interItemSpacing;
    self->_lastFullRowBottomEdge = v31 - bottom - v33;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v34 = v7 - v39;
    else
      v34 = v4;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v35 = v39;
    else
      v35 = v4;
    self->_cornerSpriteIndexes.topLeft = v35;
    self->_cornerSpriteIndexes.topRight = v34;
    if (v29)
    {
      self->_cornerSpriteIndexes.bottomLeft = (v29 - 1) * v7 - v39;
      self->_cornerSpriteIndexes.bottomRight = v41;
      if (v4 <= ((v29 - 1) * v7 - v39))
        self->_cornerSpriteIndexes.bottomLeft = (v29 - 1) * v7 - v39 + 1;
      if (v4 > v41)
        goto LABEL_38;
      v36 = (v41 - 1);
      self->_cornerSpriteIndexes.bottomRight = v36;
      if (v4 != v36)
        goto LABEL_38;
      v35 = v41 - 2;
    }
    else
    {
      self->_cornerSpriteIndexes.bottomLeft = v35;
    }
    self->_cornerSpriteIndexes.bottomRight = v35;
LABEL_38:

  }
}

- (void)_prepareGeometriesBufferForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_geometriesCount = a3;
  }
}

- (_NSRange)geometriesRangeCoveringRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  NSUInteger v19;
  _NSRange result;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXCuratedLibraryGridLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  v8 = -[PXCuratedLibraryGridLayoutGenerator itemCount](self, "itemCount");
  v9 = v8 - 1;
  if (v8 < 1)
    goto LABEL_8;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v10 = vcvtmd_s64_f64((CGRectGetMinY(v21) - self->_insets.top + self->_interItemSpacing)/ (self->_interItemSpacing + self->_itemSize.height));
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = (uint64_t)(ceil((CGRectGetMaxY(v22) - self->_insets.top) / (self->_itemSize.height + self->_interItemSpacing))
                + -1.0);
  -[PXCuratedLibraryGridLayoutGenerator metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfColumns");

  v14 = v13 * v10;
  if ((uint64_t)(v13 * v10) >= v9)
    v14 = v9;
  v15 = v14 & ~(v14 >> 63);
  v16 = v13 + v13 * v11 - 1;
  if (v16 >= v9)
    v16 = v9;
  v17 = v16 < v15;
  v18 = v16 - v15;
  if (v17)
  {
LABEL_8:
    v19 = 0;
    v15 = 0;
  }
  else
  {
    v19 = v18 + 1;
  }
  result.length = v19;
  result.location = v15;
  return result;
}

- (_PXCornerSpriteIndexes)cornerSpriteIndexes
{
  _PXCornerSpriteIndexes *p_cornerSpriteIndexes;
  uint64_t v3;
  uint64_t v4;
  _PXCornerSpriteIndexes result;

  p_cornerSpriteIndexes = &self->_cornerSpriteIndexes;
  v3 = *(_QWORD *)&self->_cornerSpriteIndexes.topLeft;
  v4 = *(_QWORD *)&p_cornerSpriteIndexes->bottomLeft;
  result.bottomLeft = v4;
  result.bottomRight = HIDWORD(v4);
  result.topLeft = v3;
  result.topRight = HIDWORD(v3);
  return result;
}

@end
