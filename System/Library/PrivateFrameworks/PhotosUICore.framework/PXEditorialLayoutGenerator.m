@implementation PXEditorialLayoutGenerator

- (PXEditorialLayoutGenerator)initWithMetrics:(id)a3
{
  id v4;
  PXEditorialLayoutGenerator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __objc2_class *v10;
  uint64_t v11;
  PXMagazineLayoutTileMaker *tileMaker;
  void *v13;
  double v14;
  uint64_t v15;
  NSIndexSet *geometrySet;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXEditorialLayoutGenerator;
  v5 = -[PXEditorialLayoutGenerator initWithMetrics:](&v18, sel_initWithMetrics_, v4);
  if (v5)
  {
    objc_msgSend(v4, "referenceSize");
    objc_msgSend(v4, "padding");
    PXEdgeInsetsInsetSize();
    v7 = v6;
    v9 = v8;
    if (objc_msgSend(v4, "useNewImplementation"))
      v10 = PXNewMagazineLayoutTileMaker;
    else
      v10 = PXMagazineLayoutTileMaker;
    v11 = objc_msgSend([v10 alloc], "initWithReferenceSize:numberOfColumns:", objc_msgSend(v4, "numberOfColumns"), v7, v9);
    tileMaker = v5->_tileMaker;
    v5->_tileMaker = (PXMagazineLayoutTileMaker *)v11;

    objc_msgSend(v4, "interTileSpacing");
    -[PXMagazineLayoutTileMaker setInterTileSpacing:](v5->_tileMaker, "setInterTileSpacing:");
    v5->_geometries = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerHeight");
    if (v14 > 0.0)
      objc_msgSend(v13, "addIndex:", 1);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v13);
    geometrySet = v5->_geometrySet;
    v5->_geometrySet = (NSIndexSet *)v15;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_geometries);
  free(self->_rects);
  v3.receiver = self;
  v3.super_class = (Class)PXEditorialLayoutGenerator;
  -[PXEditorialLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (id)geometryKinds
{
  return self->_geometrySet;
}

- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  double v5;
  void *v9;
  objc_super v10;

  if (a3 == 1)
  {
    -[PXEditorialLayoutGenerator metrics](self, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerHeight");
    v3 = v5 > 0.0;

  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialLayoutGenerator.m"), 106, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v10.receiver = self;
    v10.super_class = (Class)PXEditorialLayoutGenerator;
    return -[PXEditorialLayoutGenerator numberOfGeometriesWithKind:](&v10, sel_numberOfGeometriesWithKind_);
  }
  return v3;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXEditorialLayoutGenerator;
  -[PXEditorialLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_isPrepared = 0;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5 == 1)
  {
    -[PXEditorialLayoutGenerator _getHeaderGeometries:inRange:](self, "_getHeaderGeometries:inRange:", a3, a4.location, a4.length);
  }
  else
  {
    if (a5)
    {
      v14 = v6;
      v15 = v5;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.location, a4.length, v8, v7, v14, v15, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialLayoutGenerator.m"), 130, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXEditorialLayoutGenerator _getContentGeometries:inRange:](self, "_getContentGeometries:inRange:", a3, a4.location, a4.length);
  }
}

- (void)_getContentGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  _PXLayoutGeometry *v11;
  _PXLayoutGeometry *v12;
  __int128 v13;
  __int128 v14;
  CGFloat height;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;

  length = a4.length;
  location = a4.location;
  v9 = a4.location + a4.length;
  if (a4.location + a4.length > -[PXEditorialLayoutGenerator itemCount](self, "itemCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialLayoutGenerator.m"), 137, CFSTR("the range must be <= to the number of itemCount"));

  }
  -[PXEditorialLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  if (location < v9)
  {
    v10 = location;
    do
    {
      v11 = &a3[v10];
      v12 = &self->_geometries[v10];
      v14 = *(_OWORD *)&v12->var6.origin.y;
      v13 = *(_OWORD *)&v12->var6.size.height;
      height = v12->var7.height;
      *(_OWORD *)&v11->var5 = *(_OWORD *)&v12->var5;
      v16 = *(_OWORD *)&v12->var1.y;
      *(_OWORD *)&v11->var0 = *(_OWORD *)&v12->var0;
      *(_OWORD *)&v11->var1.y = v16;
      v17 = *(_OWORD *)&v12->var2.height;
      v18 = *(_OWORD *)&v12->var3.b;
      v19 = *(_OWORD *)&v12->var3.ty;
      *(_OWORD *)&v11->var3.d = *(_OWORD *)&v12->var3.d;
      *(_OWORD *)&v11->var3.ty = v19;
      *(_OWORD *)&v11->var2.height = v17;
      *(_OWORD *)&v11->var3.b = v18;
      v11->var7.height = height;
      *(_OWORD *)&v11->var6.origin.y = v14;
      *(_OWORD *)&v11->var6.size.height = v13;
      v11->var5 = 0;
      ++v10;
      --length;
    }
    while (length);
  }
}

- (void)_getHeaderGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  __int128 v20;
  void *v22;

  if (a4.length != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.location);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialLayoutGenerator.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.length == 1"));

  }
  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerHeight");
  v8 = v7;

  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "referenceSize");
  v11 = v10;

  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "padding");
  v14 = v13;
  v16 = v15;

  a3->var2.width = v16 + v11 + v14;
  a3->var2.height = v8;
  a3->var0 = 0;
  PXRectGetCenter();
  a3->var1.x = v17;
  a3->var1.y = v18;
  v19 = MEMORY[0x1E0C9BAA8];
  v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&a3->var3.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&a3->var3.c = v20;
  *(_OWORD *)&a3->var3.tx = *(_OWORD *)(v19 + 32);
  a3->var4 = 0.0;
  a3->var5 = 1;
}

- (CGSize)estimatedSize
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[PXMagazineLayoutTileMaker defaultTileSize](self->_tileMaker, "defaultTileSize");
  v4 = v3;
  v5 = -[PXMagazineLayoutTileMaker maxTilesInFrame](self->_tileMaker, "maxTilesInFrame");
  if (-[PXEditorialLayoutGenerator itemCount](self, "itemCount"))
    v6 = (double)-[PXEditorialLayoutGenerator itemCount](self, "itemCount");
  else
    v6 = 10.0;
  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfColumns");

  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "referenceSize");
  v11 = v10;

  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "headerHeight");
  v14 = v13;

  v15 = v14 + v6 * (v4 * (double)(v5 / v8)) / (double)v8;
  v16 = v11;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXEditorialLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_actualSize.width;
  height = self->_actualSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_prepareBuffersForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_rects = (CGRect *)malloc_type_realloc(self->_rects, 32 * a3, 0x1000040E0EAB150uLL);
    self->_geometriesCount = a3;
  }
}

- (void)_prepareIfNeeded
{
  unint64_t v4;
  void *v5;
  int v6;
  double v7;
  PXVerticalFeedLayoutGenerator *v8;
  uint64_t i;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  _PXLayoutGeometry *geometries;
  _PXLayoutGeometry *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGFloat v53;
  _QWORD v54[6];
  _QWORD v55[5];
  char v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;

  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    v4 = -[PXEditorialLayoutGenerator itemCount](self, "itemCount");
    -[PXEditorialLayoutGenerator metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useSaliency");
    objc_msgSend(v5, "referenceSize");
    if (v7 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialLayoutGenerator.m"), 200, CFSTR("The reference size.width must be > 0"));

    }
    -[PXEditorialLayoutGenerator _prepareBuffersForCount:](self, "_prepareBuffersForCount:", v4);
    v57 = 0;
    v58 = (double *)&v57;
    v59 = 0x2020000000;
    v60 = 0;
    if (v4)
    {
      if (v4 <= objc_msgSend(v5, "lowerItemCountThreshold"))
      {
        v8 = objc_alloc_init(PXVerticalFeedLayoutGenerator);
        -[PXFeedLayoutGenerator setTileCount:](v8, "setTileCount:", v4);
        objc_msgSend(v5, "interTileSpacing");
        v32 = v31;
        objc_msgSend(v5, "interTileSpacing");
        -[PXFeedLayoutGenerator setInterTileSpacing:](v8, "setInterTileSpacing:", v32, v33);
        objc_msgSend(v5, "referenceSize");
        -[PXVerticalFeedLayoutGenerator setReferenceWidth:](v8, "setReferenceWidth:");
        v34 = MEMORY[0x1E0C809B0];
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke;
        v55[3] = &unk_1E5146B40;
        v55[4] = self;
        v56 = v6;
        -[PXFeedLayoutGenerator setTileImageSizeBlock:](v8, "setTileImageSizeBlock:", v55);
        -[PXFeedLayoutGenerator setNumberOfMagneticGuidelines:](v8, "setNumberOfMagneticGuidelines:", 5);
        v54[0] = v34;
        v54[1] = 3221225472;
        v54[2] = __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke_2;
        v54[3] = &unk_1E5146B68;
        v54[4] = self;
        v54[5] = &v57;
        -[PXFeedLayoutGenerator enumerateFramesWithBlock:](v8, "enumerateFramesWithBlock:", v54);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (PXVerticalFeedLayoutGenerator *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != v4; ++i)
        {
          -[PXEditorialLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
          v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v10[2](v10, i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "preferredCropRect");
          if (v6 && (v16 = v14, v17 = v15, !CGRectIsNull(*(CGRect *)&v12)))
          {
            objc_msgSend(v11, "size");
            v19 = v18;
            objc_msgSend(v11, "size");
            v21 = v20;
            v22 = objc_alloc((Class)off_1E50B3218);
            objc_msgSend(v11, "weight");
            v24 = (void *)objc_msgSend(v22, "initWithSize:weight:", v16 * v19, v17 * v21, v23);
            -[PXVerticalFeedLayoutGenerator addObject:](v8, "addObject:", v24);

          }
          else
          {
            -[PXVerticalFeedLayoutGenerator addObject:](v8, "addObject:", v11);
          }

        }
        -[PXMagazineLayoutTileMaker getFrames:withInputs:](self->_tileMaker, "getFrames:withInputs:", self->_rects, v8);
        v25 = 0;
        v26 = 0;
        for (j = 0; j != v4; ++j)
        {
          geometries = self->_geometries;
          -[PXEditorialLayoutGenerator _geometryFromFrame:index:](self, "_geometryFromFrame:index:", j, self->_rects[v25].origin.x, self->_rects[v25].origin.y, self->_rects[v25].size.width, self->_rects[v25].size.height);
          v29 = &geometries[v26];
          *(_OWORD *)&v29->var0 = v44;
          *(_OWORD *)&v29->var1.y = v45;
          *(_OWORD *)&v29->var3.d = v48;
          *(_OWORD *)&v29->var3.ty = v49;
          *(_OWORD *)&v29->var2.height = v46;
          *(_OWORD *)&v29->var3.b = v47;
          v29->var7.height = v53;
          *(_OWORD *)&v29->var6.origin.y = v51;
          *(_OWORD *)&v29->var6.size.height = v52;
          *(_OWORD *)&v29->var5 = v50;
          ++v26;
          ++v25;
        }
        -[PXMagazineLayoutTileMaker height](self->_tileMaker, "height");
        *((_QWORD *)v58 + 3) = v30;
      }

    }
    objc_msgSend(v5, "padding");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v5, "headerHeight");
    v40 = v39;
    objc_msgSend(v5, "referenceSize");
    v41 = v38 + v36 + v40 + v58[3];
    self->_actualSize.width = v42;
    self->_actualSize.height = v41;
    _Block_object_dispose(&v57, 8);

  }
}

- (_PXLayoutGeometry)_geometryFromFrame:(SEL)a3 index:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  _PXLayoutGeometry *result;
  CGFloat v23;
  CGFloat v24;
  uint64_t v25;
  __int128 v26;
  CGSize v27;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "padding");
  v14 = v13;
  v16 = v15;

  -[PXEditorialLayoutGenerator metrics](self, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headerHeight");
  v19 = v18;

  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectOffset(v28, v16, v14 + v19);
  v20 = v29.size.width;
  v21 = v29.size.height;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tx = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var6.origin = 0u;
  retstr->var6.size = 0u;
  retstr->var7 = 0u;
  retstr->var0 = a5;
  result = (_PXLayoutGeometry *)PXRectGetCenter();
  retstr->var1.x = v23;
  retstr->var1.y = v24;
  retstr->var2.width = v20;
  retstr->var2.height = v21;
  v25 = MEMORY[0x1E0C9BAA8];
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->var3.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->var3.c = v26;
  *(_OWORD *)&retstr->var3.tx = *(_OWORD *)(v25 + 32);
  retstr->var4 = 0.0;
  retstr->var5 = 0;
  v27 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  retstr->var6.origin = *(CGPoint *)off_1E50B86D0;
  retstr->var6.size = v27;
  retstr->var7.width = v20;
  retstr->var7.height = v21;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometrySet, 0);
  objc_storeStrong((id *)&self->_tileMaker, 0);
}

double __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(*(id *)(a1 + 32), "itemLayoutInfoBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredCropRect");
  if (*(_BYTE *)(a1 + 40) && (v10 = v8, !CGRectIsNull(*(CGRect *)&v6)))
  {
    objc_msgSend(v5, "size");
    v12 = v10 * v13;
    objc_msgSend(v5, "size");
  }
  else
  {
    objc_msgSend(v5, "size");
    v12 = v11;
  }

  return v12;
}

void __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  _QWORD *v12;
  uint64_t v13;
  double v14;
  double MaxY;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  CGRect v26;

  if (!a3)
  {
    v12 = *(_QWORD **)(a1 + 32);
    v13 = v12[9] + 152 * a2;
    objc_msgSend(v12, "_geometryFromFrame:index:", a2);
    *(_OWORD *)v13 = v16;
    *(_OWORD *)(v13 + 16) = v17;
    *(_OWORD *)(v13 + 64) = v20;
    *(_OWORD *)(v13 + 80) = v21;
    *(_OWORD *)(v13 + 32) = v18;
    *(_OWORD *)(v13 + 48) = v19;
    *(_QWORD *)(v13 + 144) = v25;
    *(_OWORD *)(v13 + 112) = v23;
    *(_OWORD *)(v13 + 128) = v24;
    *(_OWORD *)(v13 + 96) = v22;
    v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v26.origin.x = a4;
    v26.origin.y = a5;
    v26.size.width = a6;
    v26.size.height = a7;
    MaxY = CGRectGetMaxY(v26);
    if (v14 >= MaxY)
      MaxY = v14;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MaxY;
  }
}

@end
