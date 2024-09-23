@implementation PXSmallCollectionLayoutGenerator

- (PXSmallCollectionLayoutGenerator)initWithNumberOfItems:(int64_t)a3 metrics:(id)a4
{
  id v6;
  PXSmallCollectionLayoutGenerator *v7;
  int64_t v8;
  int64_t v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXSmallCollectionLayoutGenerator;
  v7 = -[PXSmallCollectionLayoutGenerator initWithMetrics:](&v11, sel_initWithMetrics_, v6);
  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsSupportedForStyle:", objc_msgSend(v6, "style"));
    if (v8 >= a3)
      v9 = a3;
    else
      v9 = v8;
    v7->_numberOfItems = v9;
  }

  return v7;
}

- (PXSmallCollectionLayoutGenerator)initWithMetrics:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmallCollectionLayoutGenerator.m"), 38, CFSTR("%s is not available as initializer"), "-[PXSmallCollectionLayoutGenerator initWithMetrics:]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_geometries);
  v3.receiver = self;
  v3.super_class = (Class)PXSmallCollectionLayoutGenerator;
  -[PXSmallCollectionLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (unint64_t)keyItemIndex
{
  if (-[PXSmallCollectionLayoutGenerator numberOfItems](self, "numberOfItems") <= 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 0;
}

- (CGSize)estimatedSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXSmallCollectionLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_pageRect.size.width;
  height = self->_pageRect.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_PXCornerSpriteIndexes)cornerSpriteIndexes
{
  uint64_t v3;
  uint64_t v4;
  _PXCornerSpriteIndexes result;

  -[PXSmallCollectionLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  v3 = *(_QWORD *)&self->_cornerSpriteIndexes.topLeft;
  v4 = *(_QWORD *)&self->_cornerSpriteIndexes.bottomLeft;
  result.bottomLeft = v4;
  result.bottomRight = HIDWORD(v4);
  result.topLeft = v3;
  result.topRight = HIDWORD(v3);
  return result;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  uint64_t v8;
  int64_t i;
  _PXLayoutGeometry *v10;
  _PXLayoutGeometry *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  length = a4.length;
  -[PXSmallCollectionLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded", a3, a4.location, a4.length, a5);
  if (length)
  {
    v8 = 0;
    for (i = 0; i != length; ++i)
    {
      v10 = (_PXLayoutGeometry *)off_1E50B8498;
      if (i < self->_numberOfItems)
        v10 = &self->_geometries[v8];
      v11 = &a3[v8];
      v12 = *(_OWORD *)&v10->var1.y;
      *(_OWORD *)&v11->var0 = *(_OWORD *)&v10->var0;
      *(_OWORD *)&v11->var1.y = v12;
      v13 = *(_OWORD *)&v10->var2.height;
      v14 = *(_OWORD *)&v10->var3.b;
      v15 = *(_OWORD *)&v10->var3.ty;
      *(_OWORD *)&v11->var3.d = *(_OWORD *)&v10->var3.d;
      *(_OWORD *)&v11->var3.ty = v15;
      *(_OWORD *)&v11->var2.height = v13;
      *(_OWORD *)&v11->var3.b = v14;
      v16 = *(_OWORD *)&v10->var5;
      v17 = *(_OWORD *)&v10->var6.origin.y;
      v18 = *(_OWORD *)&v10->var6.size.height;
      v11->var7.height = v10->var7.height;
      *(_OWORD *)&v11->var6.origin.y = v17;
      *(_OWORD *)&v11->var6.size.height = v18;
      *(_OWORD *)&v11->var5 = v16;
      ++v8;
    }
  }
}

- (void)_prepareIfNeeded
{
  void *v3;
  uint64_t v4;

  if (!self->_isPrepared)
  {
    -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "style");

    if (v4 == 2)
    {
      if (-[PXSmallCollectionLayoutGenerator numberOfItems](self, "numberOfItems") != 2)
      {
        -[PXSmallCollectionLayoutGenerator _prepareHighQualityAggregationStyle](self, "_prepareHighQualityAggregationStyle");
        goto LABEL_9;
      }
    }
    else if (v4 != 1)
    {
      if (!v4)
        -[PXSmallCollectionLayoutGenerator _prepareEditorialStyle](self, "_prepareEditorialStyle");
      goto LABEL_9;
    }
    -[PXSmallCollectionLayoutGenerator _prepareLowQualityAggregationStyle](self, "_prepareLowQualityAggregationStyle");
LABEL_9:
    self->_isPrepared = 1;
  }
}

- (void)_prepareEditorialStyle
{
  int64_t v3;
  _PXCornerSpriteIndexes *p_cornerSpriteIndexes;
  void *v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double x;
  double y;
  double width;
  double height;
  _PXLayoutGeometry *geometries;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  __int128 v30;
  CGPoint v31;
  __int128 v32;
  double v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v3 = -[PXSmallCollectionLayoutGenerator numberOfItems](self, "numberOfItems");
  _PXGArrayResize();
  p_cornerSpriteIndexes = &self->_cornerSpriteIndexes;
  *(_QWORD *)&self->_cornerSpriteIndexes.topLeft = -1;
  *(_QWORD *)&self->_cornerSpriteIndexes.bottomLeft = -1;
  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerAspectRatio");
  v7 = v6;
  v8 = PXFloatApproximatelyEqualToFloat();
  v9 = 1.0;
  if (!v8)
    v9 = v7;
  v33 = v9;
  objc_msgSend(v5, "referenceSize");
  PXRectWithOriginAndSize();
  objc_msgSend(v5, "edgesForExtendedLayout");
  -[PXSmallCollectionLayoutGenerator numberOfItems](self, "numberOfItems");
  objc_msgSend(v5, "safeAreaInsets");
  PXEdgeInsetsInsetRectEdges();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "padding");
  v19 = v18;
  objc_msgSend(v5, "padding");
  v21 = v20;
  v42.origin.x = v11;
  v42.origin.y = v13;
  v42.size.width = v15;
  v42.size.height = v17;
  v43 = CGRectOffset(v42, v19, v21);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  v43.origin.x = v11;
  v43.origin.y = v13;
  v43.size.width = v15;
  v43.size.height = v17;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  self->_pageRect = CGRectUnion(v43, v44);
  switch(v3)
  {
    case 1:
      geometries = self->_geometries;
      PXRectGetCenter();
      geometries->var0 = 0;
      geometries->var1.x = v27;
      geometries->var1.y = v28;
      geometries->var2.width = width;
      geometries->var2.height = height;
      v29 = MEMORY[0x1E0C9BAA8];
      v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&geometries->var3.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&geometries->var3.c = v30;
      *(_OWORD *)&geometries->var3.tx = *(_OWORD *)(v29 + 32);
      *(_QWORD *)&geometries->var4 = 0;
      geometries->var5 = 0;
      v31 = *(CGPoint *)off_1E50B86D0;
      geometries->var6.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
      geometries->var6.origin = v31;
      geometries->var7.width = width;
      geometries->var7.height = height;
      *(_QWORD *)&p_cornerSpriteIndexes->topLeft = 0;
      *(_QWORD *)&p_cornerSpriteIndexes->bottomLeft = 0;
      break;
    case 2:
      v40[4] = self;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke;
      v41[3] = &unk_1E5136C58;
      v41[4] = self;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_2;
      v40[3] = &unk_1E5136C58;
      -[PXSmallCollectionLayoutGenerator _sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:](self, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v41, v40, x, y, width, height, v33);
      v32 = xmmword_1A7C0C780;
      goto LABEL_9;
    case 3:
      v38[4] = self;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_3;
      v39[3] = &unk_1E5136C58;
      v39[4] = self;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_4;
      v38[3] = &unk_1E5136C58;
      -[PXSmallCollectionLayoutGenerator _sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:](self, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v39, v38, x, y, width, height, v33);
      v32 = xmmword_1A7C0C770;
      goto LABEL_9;
    case 4:
      v36[4] = self;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_6;
      v37[3] = &unk_1E5136C58;
      v37[4] = self;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_7;
      v36[3] = &unk_1E5136C58;
      -[PXSmallCollectionLayoutGenerator _sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:](self, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v37, v36, x, y, width, height, v33);
      v32 = xmmword_1A7C0C760;
      goto LABEL_9;
    case 5:
      v34[4] = self;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_11;
      v35[3] = &unk_1E5136C58;
      v35[4] = self;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_12;
      v34[3] = &unk_1E5136C58;
      -[PXSmallCollectionLayoutGenerator _sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:](self, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v35, v34, x, y, width, height, v33);
      v32 = xmmword_1A7C0C750;
LABEL_9:
      *p_cornerSpriteIndexes = (_PXCornerSpriteIndexes)v32;
      break;
    default:
      break;
  }

}

- (void)_prepareLowQualityAggregationStyle
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGSize v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[9];
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;

  v3 = -[PXSmallCollectionLayoutGenerator numberOfItems](self, "numberOfItems");
  _PXGArrayResize();
  *(_QWORD *)&self->_cornerSpriteIndexes.topLeft = -1;
  *(_QWORD *)&self->_cornerSpriteIndexes.bottomLeft = -1;
  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x4010000000;
  v35 = &unk_1A7E74EE7;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "referenceSize");
  PXRectWithSize();
  *(_QWORD *)&v36 = v5;
  *((_QWORD *)&v36 + 1) = v6;
  *(_QWORD *)&v37 = v7;
  *((_QWORD *)&v37 + 1) = v8;
  objc_msgSend(v4, "padding");
  PXEdgeInsetsInsetRect();
  v9 = v33;
  v33[4] = v10;
  v9[5] = v11;
  v9[6] = v12;
  v9[7] = v13;
  v14 = &v26;
  v26 = 0;
  v27 = &v26;
  v29 = &unk_1A7E74EE7;
  v28 = 0x4010000000;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v30 = *MEMORY[0x1E0C9D648];
  v31 = v15;
  if (v3 >= 1)
  {
    v21 = v4;
    v16 = 0;
    v17 = v3;
    v18 = v3 + 2;
    v19 = MEMORY[0x1E0C809B0];
    do
    {
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v25 = 0;
      v22[4] = &v32;
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke;
      v23[3] = &unk_1E5136CD0;
      v23[7] = v16;
      v23[8] = v17;
      v23[4] = self;
      v23[5] = v24;
      v23[6] = &v26;
      v22[0] = v19;
      v22[1] = 3221225472;
      v22[2] = __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_3;
      v22[3] = &unk_1E5136CF8;
      -[PXSmallCollectionLayoutGenerator _sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:](self, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v23, v22, *((double *)v33 + 4), *((double *)v33 + 5), *((double *)v33 + 6), *((double *)v33 + 7), 2.0, v21);
      ++v16;
      _Block_object_dispose(v24, 8);
      v18 -= 2;
    }
    while (v18 > 2);
    v14 = v27;
    v4 = v21;
  }
  v20 = (CGSize)*((_OWORD *)v14 + 3);
  self->_pageRect.origin = (CGPoint)*((_OWORD *)v14 + 2);
  self->_pageRect.size = v20;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

- (void)_prepareHighQualityAggregationStyle
{
  int64_t v3;
  void *v4;
  __int128 v5;
  void *v6;
  CGSize v7;
  _QWORD v8[7];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;

  v3 = -[PXSmallCollectionLayoutGenerator numberOfItems](self, "numberOfItems");
  _PXGArrayResize();
  *(_QWORD *)&self->_cornerSpriteIndexes.topLeft = -1;
  *(_QWORD *)&self->_cornerSpriteIndexes.bottomLeft = -1;
  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x4010000000;
  v13 = &unk_1A7E74EE7;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *MEMORY[0x1E0C9D648];
  v15 = v5;
  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceSize");
  PXRectWithSize();

  objc_msgSend(v4, "padding");
  PXEdgeInsetsInsetRect();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke;
  v9[3] = &unk_1E5136D20;
  v9[4] = self;
  v9[5] = &v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_2;
  v8[3] = &unk_1E5136D70;
  v8[5] = &v10;
  v8[6] = v3;
  v8[4] = self;
  -[PXSmallCollectionLayoutGenerator _sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:](self, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v9, v8);
  v7 = (CGSize)*((_OWORD *)v11 + 3);
  self->_pageRect.origin = (CGPoint)*((_OWORD *)v11 + 2);
  self->_pageRect.size = v7;
  _Block_object_dispose(&v10, 8);

}

- (void)_fillEquallyRect:(CGRect)a3 numberOfItems:(int64_t)a4 axis:(int64_t)a5 resultHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v14)(id, _QWORD, double, double, double, double);
  void *v15;
  double v16;
  double v17;
  CGRectEdge v18;
  double v19;
  uint64_t v20;
  void *v21;
  CGRect v22;
  CGRect remainder;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = (void (**)(id, _QWORD, double, double, double, double))a6;
  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interitemSpacing");
  v17 = v16;

  switch(a5)
  {
    case 1:
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v19 = (v17 + CGRectGetHeight(v24)) / (double)a4 - v17;
      v18 = CGRectMinYEdge;
      break;
    case 2:
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v18 = CGRectMinXEdge;
      v19 = (v17 + CGRectGetWidth(v25)) / (double)a4 - v17;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmallCollectionLayoutGenerator.m"), 273, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v18 = CGRectMinXEdge;
      v19 = 0.0;
      break;
  }
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  memset(&v22, 0, sizeof(v22));
  if (a4 >= 1)
  {
    v20 = 0;
    do
    {
      CGRectDivide(remainder, &v22, &remainder, v19, v18);
      v14[2](v14, v20, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
      if (a4 - 1 != v20)
        CGRectDivide(remainder, &v22, &remainder, v17, v18);
      ++v20;
    }
    while (a4 != v20);
  }

}

- (void)_sliceItemFromRect:(CGRect)a3 itemAspectRatio:(double)a4 axis:(int64_t)a5 sliceHandler:(id)a6 remainderHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v16)(_QWORD, double, double, double, double);
  void (**v17)(_QWORD, double, double, double, double);
  CGRectEdge v18;
  double v19;
  void *v20;
  CGFloat v21;
  void *v22;
  CGRect v23;
  CGRect slice;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = (void (**)(_QWORD, double, double, double, double))a6;
  v17 = (void (**)(_QWORD, double, double, double, double))a7;
  switch(a5)
  {
    case 1:
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v19 = floor(CGRectGetWidth(v25) / a4);
      v18 = CGRectMinYEdge;
      break;
    case 2:
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v18 = CGRectMinXEdge;
      v19 = floor(CGRectGetHeight(v26) / a4);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmallCollectionLayoutGenerator.m"), 300, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v18 = CGRectMinXEdge;
      v19 = 0.0;
      break;
  }
  memset(&slice, 0, sizeof(slice));
  memset(&v23, 0, sizeof(v23));
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  CGRectDivide(v27, &slice, &v23, v19, v18);
  v16[2](v16, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[PXSmallCollectionLayoutGenerator metrics](self, "metrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "interitemSpacing");
  CGRectDivide(v23, &slice, &v23, v21, v18);

  v17[2](v17, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

void __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  CGRect *v16;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGRect v20;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)v10 = 0;
  *(_QWORD *)(v10 + 8) = v11;
  *(_QWORD *)(v10 + 16) = v12;
  *(CGFloat *)(v10 + 24) = a4;
  *(CGFloat *)(v10 + 32) = a5;
  v13 = MEMORY[0x1E0C9BAA8];
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v10 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v10 + 56) = v14;
  *(_OWORD *)(v10 + 72) = *(_OWORD *)(v13 + 32);
  *(_QWORD *)(v10 + 88) = 0;
  *(_QWORD *)(v10 + 96) = 0;
  v15 = *(_OWORD *)off_1E50B86D0;
  *(_OWORD *)(v10 + 120) = *((_OWORD *)off_1E50B86D0 + 1);
  *(_OWORD *)(v10 + 104) = v15;
  *(CGFloat *)(v10 + 136) = a4;
  *(CGFloat *)(v10 + 144) = a5;
  v16 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  x = v16[1].origin.x;
  *(CGFloat *)&v15 = v16[1].origin.y;
  width = v16[1].size.width;
  height = v16[1].size.height;
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  v16[1] = CGRectUnion(*(CGRect *)((char *)&v15 - 8), v20);
}

uint64_t __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_3;
  v6[3] = &unk_1E5136D70;
  v6[6] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v6, &__block_literal_global_211547, a2, a3, a4, a5, 2.0);
}

uint64_t __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_3(uint64_t a1)
{
  _QWORD v2[7];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_4;
  v2[3] = &unk_1E5136D48;
  v2[6] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 2, v2);
}

void __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_4(_QWORD *a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  CGRect *v18;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGRect v22;

  v6 = a2 + 1;
  if (a2 + 1 < a1[6])
  {
    v12 = *(_QWORD *)(a1[4] + 40) + 152 * v6;
    PXRectGetCenter();
    *(_QWORD *)v12 = v6;
    *(_QWORD *)(v12 + 8) = v13;
    *(_QWORD *)(v12 + 16) = v14;
    *(CGFloat *)(v12 + 24) = a5;
    *(CGFloat *)(v12 + 32) = a6;
    v15 = MEMORY[0x1E0C9BAA8];
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v12 + 40) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v12 + 56) = v16;
    *(_OWORD *)(v12 + 72) = *(_OWORD *)(v15 + 32);
    *(_QWORD *)(v12 + 88) = 0;
    *(_QWORD *)(v12 + 96) = 0;
    v17 = *(_OWORD *)off_1E50B86D0;
    *(_OWORD *)(v12 + 120) = *((_OWORD *)off_1E50B86D0 + 1);
    *(_OWORD *)(v12 + 104) = v17;
    *(CGFloat *)(v12 + 136) = a5;
    *(CGFloat *)(v12 + 144) = a6;
    v18 = *(CGRect **)(a1[5] + 8);
    x = v18[1].origin.x;
    *(CGFloat *)&v17 = v18[1].origin.y;
    width = v18[1].size.width;
    height = v18[1].size.height;
    v22.origin.x = a3;
    v22.origin.y = a4;
    v22.size.width = a5;
    v22.size.height = a6;
    v18[1] = CGRectUnion(*(CGRect *)((char *)&v17 - 8), v22);
  }
}

void __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;
  CGRect v14;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_2;
  v11[3] = &unk_1E5136CA8;
  v10 = *(_OWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 32);
  v13 = v10;
  objc_msgSend((id)v12, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 2, v11, a2, a3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14.origin.x = a2;
    v14.origin.y = a3;
    v14.size.width = a4;
    v14.size.height = a5;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 32), v14);
  }
}

uint64_t __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_3(uint64_t result, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

_QWORD *__70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_2(_QWORD *result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v6 = a2 + 2 * result[6];
  if (v6 < result[7])
  {
    v9 = result;
    v10 = *(_QWORD *)(result[4] + 40) + 152 * v6;
    result = (_QWORD *)PXRectGetCenter();
    *(_QWORD *)v10 = v6;
    *(_QWORD *)(v10 + 8) = v11;
    *(_QWORD *)(v10 + 16) = v12;
    *(double *)(v10 + 24) = a5;
    *(double *)(v10 + 32) = a6;
    v13 = MEMORY[0x1E0C9BAA8];
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v10 + 40) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v10 + 56) = v14;
    *(_OWORD *)(v10 + 72) = *(_OWORD *)(v13 + 32);
    *(_QWORD *)(v10 + 88) = 0;
    *(_QWORD *)(v10 + 96) = 0;
    v15 = *(_OWORD *)off_1E50B86D0;
    *(_OWORD *)(v10 + 120) = *((_OWORD *)off_1E50B86D0 + 1);
    *(_OWORD *)(v10 + 104) = v15;
    *(double *)(v10 + 136) = a5;
    *(double *)(v10 + 144) = a6;
    *(_BYTE *)(*(_QWORD *)(v9[5] + 8) + 24) = 1;
  }
  return result;
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;
  __int128 v13;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = v8;
  *(_QWORD *)(v7 + 16) = v9;
  *(double *)(v7 + 24) = a4;
  *(double *)(v7 + 32) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 56) = v11;
  *(_OWORD *)(v7 + 72) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 88) = 0;
  *(_QWORD *)(v7 + 96) = 0;
  v13 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v7 + 120) = result;
  *(_OWORD *)(v7 + 104) = v13;
  *(double *)(v7 + 136) = a4;
  *(double *)(v7 + 144) = a5;
  return result;
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)(v7 + 152) = 1;
  *(_QWORD *)(v7 + 160) = v8;
  *(_QWORD *)(v7 + 168) = v9;
  *(double *)(v7 + 176) = a4;
  *(double *)(v7 + 184) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 192) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 208) = v11;
  *(_OWORD *)(v7 + 224) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 240) = 0;
  *(_QWORD *)(v7 + 248) = 0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(_OWORD *)(v7 + 256) = *(_OWORD *)off_1E50B86D0;
  *(__n128 *)(v7 + 272) = result;
  *(double *)(v7 + 288) = a4;
  *(double *)(v7 + 296) = a5;
  return result;
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;
  __int128 v13;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = v8;
  *(_QWORD *)(v7 + 16) = v9;
  *(double *)(v7 + 24) = a4;
  *(double *)(v7 + 32) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 56) = v11;
  *(_OWORD *)(v7 + 72) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 88) = 0;
  *(_QWORD *)(v7 + 96) = 0;
  v13 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v7 + 120) = result;
  *(_OWORD *)(v7 + 104) = v13;
  *(double *)(v7 + 136) = a4;
  *(double *)(v7 + 144) = a5;
  return result;
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_5;
  v3[3] = &unk_1E5136C80;
  v3[4] = v1;
  return objc_msgSend(v1, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 2, v3);
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_6(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;
  __int128 v13;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = v8;
  *(_QWORD *)(v7 + 16) = v9;
  *(double *)(v7 + 24) = a4;
  *(double *)(v7 + 32) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 56) = v11;
  *(_OWORD *)(v7 + 72) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 88) = 0;
  *(_QWORD *)(v7 + 96) = 0;
  v13 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v7 + 120) = result;
  *(_OWORD *)(v7 + 104) = v13;
  *(double *)(v7 + 136) = a4;
  *(double *)(v7 + 144) = a5;
  return result;
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_7(uint64_t a1, double a2, double a3, double a4, double a5)
{
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  v7 = *(id *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_8;
  v8[3] = &unk_1E5136C58;
  v8[4] = v7;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_9;
  v6[3] = &unk_1E5136C58;
  return objc_msgSend(v7, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 2, v8, v6, a2, a3, a4, a5, 1.0);
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_11(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;
  __int128 v13;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = v8;
  *(_QWORD *)(v7 + 16) = v9;
  *(double *)(v7 + 24) = a4;
  *(double *)(v7 + 32) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 56) = v11;
  *(_OWORD *)(v7 + 72) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 88) = 0;
  *(_QWORD *)(v7 + 96) = 0;
  v13 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v7 + 120) = result;
  *(_OWORD *)(v7 + 104) = v13;
  *(double *)(v7 + 136) = a4;
  *(double *)(v7 + 144) = a5;
  return result;
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_12(uint64_t a1, double a2, double a3, double a4, double a5)
{
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  v7 = *(id *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_13;
  v8[3] = &unk_1E5136C58;
  v8[4] = v7;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_15;
  v6[3] = &unk_1E5136C58;
  return objc_msgSend(v7, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v8, v6, a2, a3, a4, a5, 3.0);
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_13(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_14;
  v3[3] = &unk_1E5136C80;
  v3[4] = v1;
  return objc_msgSend(v1, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 3, 2, v3);
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_15(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;
  __int128 v13;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)(v7 + 608) = 4;
  *(_QWORD *)(v7 + 616) = v8;
  *(_QWORD *)(v7 + 624) = v9;
  *(double *)(v7 + 632) = a4;
  *(double *)(v7 + 640) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 648) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 664) = v11;
  *(_OWORD *)(v7 + 680) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 704) = 0;
  *(_QWORD *)(v7 + 696) = 0;
  v13 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v7 + 728) = result;
  *(_OWORD *)(v7 + 712) = v13;
  *(double *)(v7 + 744) = a4;
  *(double *)(v7 + 752) = a5;
  return result;
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_14(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __n128 result;
  __int128 v15;

  v8 = a2 + 1;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 152 * (a2 + 1);
  PXRectGetCenter();
  *(_QWORD *)v9 = v8;
  *(_QWORD *)(v9 + 8) = v10;
  *(_QWORD *)(v9 + 16) = v11;
  *(double *)(v9 + 24) = a5;
  *(double *)(v9 + 32) = a6;
  v12 = MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v9 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v9 + 56) = v13;
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v12 + 32);
  *(_QWORD *)(v9 + 88) = 0;
  *(_QWORD *)(v9 + 96) = 0;
  v15 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v9 + 120) = result;
  *(_OWORD *)(v9 + 104) = v15;
  *(double *)(v9 + 136) = a5;
  *(double *)(v9 + 144) = a6;
  return result;
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __n128 result;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PXRectGetCenter();
  *(_QWORD *)(v7 + 152) = 3;
  *(_QWORD *)(v7 + 160) = v8;
  *(_QWORD *)(v7 + 168) = v9;
  *(double *)(v7 + 176) = a4;
  *(double *)(v7 + 184) = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v7 + 192) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v7 + 208) = v11;
  *(_OWORD *)(v7 + 224) = *(_OWORD *)(v10 + 32);
  *(_QWORD *)(v7 + 240) = 0;
  *(_QWORD *)(v7 + 248) = 0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(_OWORD *)(v7 + 256) = *(_OWORD *)off_1E50B86D0;
  *(__n128 *)(v7 + 272) = result;
  *(double *)(v7 + 288) = a4;
  *(double *)(v7 + 296) = a5;
  return result;
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_9(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_10;
  v3[3] = &unk_1E5136C80;
  v3[4] = v1;
  return objc_msgSend(v1, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 1, v3);
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_10(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __n128 result;
  __int128 v15;

  v8 = a2 + 2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 152 * (a2 + 2);
  PXRectGetCenter();
  *(_QWORD *)v9 = v8;
  *(_QWORD *)(v9 + 8) = v10;
  *(_QWORD *)(v9 + 16) = v11;
  *(double *)(v9 + 24) = a5;
  *(double *)(v9 + 32) = a6;
  v12 = MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v9 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v9 + 56) = v13;
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v12 + 32);
  *(_QWORD *)(v9 + 88) = 0;
  *(_QWORD *)(v9 + 96) = 0;
  v15 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v9 + 120) = result;
  *(_OWORD *)(v9 + 104) = v15;
  *(double *)(v9 + 136) = a5;
  *(double *)(v9 + 144) = a6;
  return result;
}

__n128 __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_5(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __n128 result;
  __int128 v15;

  v8 = a2 + 1;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 152 * (a2 + 1);
  PXRectGetCenter();
  *(_QWORD *)v9 = v8;
  *(_QWORD *)(v9 + 8) = v10;
  *(_QWORD *)(v9 + 16) = v11;
  *(double *)(v9 + 24) = a5;
  *(double *)(v9 + 32) = a6;
  v12 = MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v9 + 40) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v9 + 56) = v13;
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v12 + 32);
  *(_QWORD *)(v9 + 88) = 0;
  *(_QWORD *)(v9 + 96) = 0;
  v15 = *(_OWORD *)off_1E50B86D0;
  result = *((__n128 *)off_1E50B86D0 + 1);
  *(__n128 *)(v9 + 120) = result;
  *(_OWORD *)(v9 + 104) = v15;
  *(double *)(v9 + 136) = a5;
  *(double *)(v9 + 144) = a6;
  return result;
}

+ (int64_t)maximumNumberOfItemsSupportedForStyle:(unint64_t)a3
{
  if (a3 - 1 < 2)
    return 3;
  else
    return 4;
}

@end
