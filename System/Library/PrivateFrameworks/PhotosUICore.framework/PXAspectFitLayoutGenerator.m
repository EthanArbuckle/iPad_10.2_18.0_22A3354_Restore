@implementation PXAspectFitLayoutGenerator

- (PXAspectFitLayoutGenerator)initWithMetrics:(id)a3
{
  PXAspectFitLayoutGenerator *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAspectFitLayoutGenerator;
  result = -[PXAspectFitLayoutGenerator initWithMetrics:](&v4, sel_initWithMetrics_, a3);
  if (result)
  {
    result->_geometries = 0;
    result->_lastGeometryIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  _PXLayoutGeometry *geometries;
  objc_super v4;

  geometries = self->_geometries;
  if (geometries)
  {
    free(geometries);
    self->_geometries = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXAspectFitLayoutGenerator;
  -[PXAspectFitLayoutGenerator dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAspectFitLayoutGenerator;
  -[PXAspectFitLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_geometriesCount = 0;
}

- (CGSize)estimatedSize
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PXAspectFitLayoutGenerator metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXAspectFitLayoutGenerator itemCount](self, "itemCount"))
    v4 = -[PXAspectFitLayoutGenerator itemCount](self, "itemCount");
  else
    v4 = 10;
  objc_msgSend(v3, "referenceSize");
  v6 = v5;
  v7 = v4 / objc_msgSend(v3, "maxTilesPerRow");
  objc_msgSend(v3, "minRowAspectRatio");
  v9 = v6 / v8 * (double)v7;

  v10 = v6;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)size
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

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  int64_t location;
  double v11;
  uint64_t v12;
  int64_t v13;
  _PXLayoutGeometry *v14;
  _PXLayoutGeometry *v15;
  __int128 v16;
  __int128 v17;
  CGFloat height;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSRange v29;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    -[PXAspectFitLayoutGenerator metrics](self, "metrics");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "referenceSize");
    if (v11 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAspectFitLayoutGenerator.m"), 95, &stru_1E5149688);

    }
    if (!-[PXAspectFitLayoutGenerator itemCount](self, "itemCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAspectFitLayoutGenerator.m"), 96, &stru_1E5149688);

    }
    v12 = length + location - 1;
    if (v12 < 0 || v12 >= (unint64_t)-[PXAspectFitLayoutGenerator itemCount](self, "itemCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29.location = location;
      v29.length = length;
      NSStringFromRange(v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAspectFitLayoutGenerator.m"), 98, CFSTR("range %@ out of bounds %ld"), v24, -[PXAspectFitLayoutGenerator itemCount](self, "itemCount"));

    }
    -[PXAspectFitLayoutGenerator _computeGeometriesIfNeeded](self, "_computeGeometriesIfNeeded");
    if (-[PXAspectFitLayoutGenerator itemCount](self, "itemCount") != self->_geometriesCount)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAspectFitLayoutGenerator.m"), 102, CFSTR("The number of geometries should be the "));

    }
    if (location <= v12)
    {
      v13 = location;
      do
      {
        v14 = &a3[v13];
        v15 = &self->_geometries[v13];
        v17 = *(_OWORD *)&v15->var6.origin.y;
        v16 = *(_OWORD *)&v15->var6.size.height;
        height = v15->var7.height;
        *(_OWORD *)&v14->var5 = *(_OWORD *)&v15->var5;
        v19 = *(_OWORD *)&v15->var1.y;
        *(_OWORD *)&v14->var0 = *(_OWORD *)&v15->var0;
        *(_OWORD *)&v14->var1.y = v19;
        v20 = *(_OWORD *)&v15->var2.height;
        v21 = *(_OWORD *)&v15->var3.b;
        v22 = *(_OWORD *)&v15->var3.ty;
        *(_OWORD *)&v14->var3.d = *(_OWORD *)&v15->var3.d;
        *(_OWORD *)&v14->var3.ty = v22;
        *(_OWORD *)&v14->var2.height = v20;
        *(_OWORD *)&v14->var3.b = v21;
        v14->var7.height = height;
        *(_OWORD *)&v14->var6.origin.y = v17;
        *(_OWORD *)&v14->var6.size.height = v16;
        v14->var5 = a5;
        ++v13;
        --length;
      }
      while (length);
    }

  }
}

- (void)_prepareGeometriesForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_geometriesCount = a3;
  }
}

- (_PXLayoutGeometry)_lastGeometry
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGFloat c;
  _PXLayoutGeometry *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v16;

  v4 = *((_OWORD *)off_1E50B8498 + 7);
  *(_OWORD *)&retstr->var5 = *((_OWORD *)off_1E50B8498 + 6);
  *(_OWORD *)&retstr->var6.origin.y = v4;
  *(_OWORD *)&retstr->var6.size.height = *((_OWORD *)off_1E50B8498 + 8);
  retstr->var7.height = *((CGFloat *)off_1E50B8498 + 18);
  v5 = *((_OWORD *)off_1E50B8498 + 3);
  *(_OWORD *)&retstr->var2.height = *((_OWORD *)off_1E50B8498 + 2);
  *(_OWORD *)&retstr->var3.b = v5;
  v6 = *((_OWORD *)off_1E50B8498 + 5);
  *(_OWORD *)&retstr->var3.d = *((_OWORD *)off_1E50B8498 + 4);
  *(_OWORD *)&retstr->var3.ty = v6;
  v7 = *((_OWORD *)off_1E50B8498 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)off_1E50B8498;
  *(_OWORD *)&retstr->var1.y = v7;
  c = self->var3.c;
  if (c != NAN)
  {
    v9 = self;
    if (*(_QWORD *)&c >= *(_QWORD *)&self->var3.b)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, v9, CFSTR("PXAspectFitLayoutGenerator.m"), 120, CFSTR("last Geometry index is out of bounds %ld >= %ld"), *(_QWORD *)&v9->var3.c, *(_QWORD *)&v9->var3.b);

      c = v9->var3.c;
    }
    v10 = *(_QWORD *)&v9->var3.a + 152 * *(_QWORD *)&c;
    v11 = *(_OWORD *)(v10 + 112);
    *(_OWORD *)&retstr->var5 = *(_OWORD *)(v10 + 96);
    *(_OWORD *)&retstr->var6.origin.y = v11;
    *(_OWORD *)&retstr->var6.size.height = *(_OWORD *)(v10 + 128);
    retstr->var7.height = *(CGFloat *)(v10 + 144);
    v12 = *(_OWORD *)(v10 + 48);
    *(_OWORD *)&retstr->var2.height = *(_OWORD *)(v10 + 32);
    *(_OWORD *)&retstr->var3.b = v12;
    v13 = *(_OWORD *)(v10 + 80);
    *(_OWORD *)&retstr->var3.d = *(_OWORD *)(v10 + 64);
    *(_OWORD *)&retstr->var3.ty = v13;
    v14 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v10;
    *(_OWORD *)&retstr->var1.y = v14;
  }
  return self;
}

- (void)_computeGeometriesIfNeeded
{
  void *v3;
  uint64_t v4;
  unint64_t geometriesCount;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGSize *p_contentSize;
  CGFloat v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  if (!self->_geometries || -[PXAspectFitLayoutGenerator itemCount](self, "itemCount") > self->_geometriesCount)
  {
    -[PXAspectFitLayoutGenerator _prepareGeometriesForCount:](self, "_prepareGeometriesForCount:", -[PXAspectFitLayoutGenerator itemCount](self, "itemCount"));
    -[PXAspectFitLayoutGenerator metrics](self, "metrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lastGeometryIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4 = objc_msgSend(v3, "minTilesPerRow");
    *(_QWORD *)&v17 = 0;
    geometriesCount = self->_geometriesCount;
    if (geometriesCount)
    {
      v6 = v4;
      v7 = 0;
      do
      {
        v8 = geometriesCount - v7;
        v9 = objc_msgSend(v3, "maxTilesPerRow", (_QWORD)v17);
        if (v9 >= v8)
          v10 = v8;
        else
          v10 = v9;
        if (v9 < v8)
        {
          v11 = v8 - v6;
          if (v6 > v8 - v6)
            v11 = v6;
          if (v10 >= v11)
            v10 = v11;
        }
        -[PXAspectFitLayoutGenerator _fillRowFromIndex:withCount:](self, "_fillRowFromIndex:withCount:", &v17, v10);
        v12 = v17;
        self->_lastGeometryIndex = v17;
        v7 = v12 + 1;
        *(_QWORD *)&v17 = v7;
        geometriesCount = self->_geometriesCount;
      }
      while (v7 < geometriesCount);
    }
    v26 = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PXAspectFitLayoutGenerator _lastGeometry](self, "_lastGeometry", 0, 0);
    objc_msgSend(v3, "referenceSize");
    p_contentSize = &self->_contentSize;
    p_contentSize->width = v14;
    v15 = *(double *)&v18 + *(double *)&v19 * 0.5;
    objc_msgSend(v3, "contentInsets");
    p_contentSize->height = v15 + v16;

  }
}

- (void)_fillRowFromIndex:(int64_t *)a3 withCount:(int64_t)a4
{
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _PXLayoutGeometry *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGFloat v39;

  -[PXAspectFitLayoutGenerator metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAspectFitLayoutGenerator _lastGeometry](self, "_lastGeometry");
  v8 = *a3;
  if (*a3 < 1)
    objc_msgSend(v7, "contentInsets");
  else
    objc_msgSend(v7, "interTileSpacing");
  v10 = v9;
  -[PXAspectFitLayoutGenerator _rowHeightForItemsInRange:](self, "_rowHeightForItemsInRange:", v8, a4);
  v12 = v11;
  self->_currentRowUnmodifiedHeight = v11;
  objc_msgSend(v7, "referenceSize");
  v14 = v13;
  objc_msgSend(v7, "minRowAspectRatio");
  v16 = v14 / v15;
  if (v12 < v16)
    v16 = v12;
  self->_currentRowFinalHeight = v16;
  if (a4 < 1)
  {
    v17 = 0;
LABEL_16:
    if (v17 <= 1)
      v29 = 1;
    else
      v29 = v17;
    *a3 = (v8 + v29 - 1) & ~((v8 + v29 - 1) >> 63);
  }
  else
  {
    v17 = 0;
    v18 = v10 + 0.0 * 0.5 + 0.0;
    v19 = v8;
    v20 = 0.0;
    while (1)
    {
      if (v17)
      {
        objc_msgSend(v7, "interTileSpacing");
        v22 = v21;
      }
      else
      {
        objc_msgSend(v7, "contentInsets");
        v22 = v23;
      }
      -[PXAspectFitLayoutGenerator _geometryForItemAtIndex:atPosition:withHorizontalGap:](self, "_geometryForItemAtIndex:atPosition:withHorizontalGap:", v8 + v17, v20, v18, v22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0);
      v24 = &self->_geometries[v19];
      *(_OWORD *)&v24->var0 = v30;
      *(_OWORD *)&v24->var1.y = v31;
      *(_OWORD *)&v24->var3.d = v34;
      *(_OWORD *)&v24->var3.ty = v35;
      *(_OWORD *)&v24->var2.height = v32;
      *(_OWORD *)&v24->var3.b = v33;
      v24->var7.height = v39;
      *(_OWORD *)&v24->var6.origin.y = v37;
      *(_OWORD *)&v24->var6.size.height = v38;
      *(_OWORD *)&v24->var5 = v36;
      PXRectWithCenterAndSize();
      v18 = v25;
      v20 = v26 + v27;
      objc_msgSend(v7, "referenceSize");
      if (v17)
      {
        if (v20 + -1.0 > v28)
          break;
      }
      ++v17;
      ++v19;
      if ((uint64_t)(v8 + v17) >= v8 + a4)
        goto LABEL_16;
    }
    -[PXAspectFitLayoutGenerator _fillRowFromIndex:withCount:](self, "_fillRowFromIndex:withCount:", a3, v8 + v17);
  }

}

- (double)_rowHeightForItemsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  double v7;
  NSUInteger v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  length = a3.length;
  location = a3.location;
  -[PXAspectFitLayoutGenerator metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (location < location + length)
  {
    v8 = length;
    do
    {
      -[PXAspectFitLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, location);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "size");
      PXSizeGetAspectRatio();
      v7 = v7 + v11;

      ++location;
      --v8;
    }
    while (v8);
  }
  objc_msgSend(v6, "interTileSpacing");
  v13 = v12;
  objc_msgSend(v6, "contentInsets");
  v15 = v14 + ((double)length + -1.0) * v13;
  objc_msgSend(v6, "contentInsets");
  v17 = v15 + v16;
  objc_msgSend(v6, "referenceSize");
  v19 = (v18 - v17) / v7;

  return v19;
}

- (_PXLayoutGeometry)_geometryForItemAtIndex:(SEL)a3 atPosition:(unint64_t)a4 withHorizontalGap:(CGPoint)a5
{
  void (**v9)(_QWORD, _QWORD);
  double v10;
  CGFloat v11;
  double currentRowFinalHeight;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  __int128 v16;
  CGSize v17;
  _PXLayoutGeometry *result;
  id v19;

  -[PXAspectFitLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9[2](v9, a4);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "size");
  PXSizeGetAspectRatio();
  v11 = v10 * self->_currentRowUnmodifiedHeight;
  currentRowFinalHeight = self->_currentRowFinalHeight;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tx = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var6.origin = 0u;
  retstr->var6.size = 0u;
  retstr->var7 = 0u;
  retstr->var0 = a4;
  PXRectGetCenter();
  retstr->var1.x = v13;
  retstr->var1.y = v14;
  retstr->var2.width = v11;
  retstr->var2.height = currentRowFinalHeight;
  v15 = MEMORY[0x1E0C9BAA8];
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->var3.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->var3.c = v16;
  *(_OWORD *)&retstr->var3.tx = *(_OWORD *)(v15 + 32);
  retstr->var4 = 0.0;
  retstr->var5 = 0;
  v17 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  retstr->var6.origin = *(CGPoint *)off_1E50B86D0;
  retstr->var6.size = v17;
  retstr->var7.width = v11;
  retstr->var7.height = currentRowFinalHeight;

  return result;
}

@end
