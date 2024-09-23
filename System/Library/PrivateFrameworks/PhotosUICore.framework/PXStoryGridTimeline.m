@implementation PXStoryGridTimeline

- (PXStoryGridTimeline)initWithOriginalTimeline:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryGridTimeline.m"), 32, CFSTR("%s is not available as initializer"), "-[PXStoryGridTimeline initWithOriginalTimeline:]");

  abort();
}

- (PXStoryGridTimeline)initWithOriginalTimeline:(id)a3 layoutSpec:(id)a4 viewportSize:(CGSize)a5
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  PXStoryGridTimeline *v13;
  void *v14;
  size_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  PXStoryGridTimeline *v25;
  PXExploreLayoutGenerator *v26;
  PXStoryGridTimeline *v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  PXCArrayStore *rectsStore;
  void *v33;
  _QWORD v34[4];
  PXStoryGridTimeline *v35;
  id v36;
  _QWORD v37[4];
  PXStoryGridTimeline *v38;
  _QWORD *v39;
  _OWORD v40[3];
  _QWORD v41[4];
  objc_super v42;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "browserGridLayoutMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryGridTimeline.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSpec.browserGridLayoutMetrics"));

  }
  v42.receiver = self;
  v42.super_class = (Class)PXStoryGridTimeline;
  v13 = -[PXStoryDerivedTimeline initWithOriginalTimeline:](&v42, sel_initWithOriginalTimeline_, v10);
  if (v13)
  {
    objc_msgSend(v11, "browserGridLayoutMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setReferenceSize:", width, height);
    v15 = objc_msgSend(v10, "numberOfClipsWithResourceKind:", 1);
    v13->_numberOfAssetClips = v15;
    v13->_assetClipIdentifiers = (int64_t *)malloc_type_calloc(v15, 8uLL, 0x100004000313F17uLL);
    v13->_assetClipGeometries = (_PXLayoutGeometry *)malloc_type_calloc(v13->_numberOfAssetClips, 0x98uLL, 0x100004050011849uLL);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    if (v10)
      objc_msgSend(v10, "timeRange");
    else
      memset(v40, 0, sizeof(v40));
    objc_msgSend(v10, "size");
    PXRectWithOriginAndSize();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __72__PXStoryGridTimeline_initWithOriginalTimeline_layoutSpec_viewportSize___block_invoke;
    v37[3] = &unk_1E513EA30;
    v25 = v13;
    v38 = v25;
    v39 = v41;
    objc_msgSend(v10, "enumerateClipsInTimeRange:rect:usingBlock:", v40, v37, v17, v19, v21, v23);
    v26 = -[PXExploreLayoutGenerator initWithMetrics:]([PXExploreLayoutGenerator alloc], "initWithMetrics:", v14);
    -[PXExploreLayoutGenerator setItemCount:](v26, "setItemCount:", v13->_numberOfAssetClips);
    v34[0] = v24;
    v34[1] = 3221225472;
    v34[2] = __72__PXStoryGridTimeline_initWithOriginalTimeline_layoutSpec_viewportSize___block_invoke_2;
    v34[3] = &unk_1E512ECA0;
    v27 = v25;
    v35 = v27;
    v36 = v10;
    -[PXExploreLayoutGenerator setItemLayoutInfoBlock:](v26, "setItemLayoutInfoBlock:", v34);
    -[PXExploreLayoutGenerator getGeometries:inRange:withKind:](v26, "getGeometries:inRange:withKind:", v13->_assetClipGeometries, 0, v13->_numberOfAssetClips, 0);
    -[PXExploreLayoutGenerator size](v26, "size");
    v27->_size.width = v28;
    v27->_size.height = v29;
    v30 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 32);
    rectsStore = v27->_rectsStore;
    v27->_rectsStore = (PXCArrayStore *)v30;

    _Block_object_dispose(v41, 8);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_assetClipIdentifiers);
  free(self->_assetClipGeometries);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryGridTimeline;
  -[PXStoryGridTimeline dealloc](&v3, sel_dealloc);
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  id v22;
  _OWORD v23[3];
  _QWORD v24[5];
  id v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  PXRectWithOriginAndSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v24[3] = &unk_1E512ECF0;
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  v24[4] = self;
  v25 = v11;
  v21 = *(_OWORD *)&a3->var0.var3;
  v23[0] = *(_OWORD *)&a3->var0.var0;
  v23[1] = v21;
  v23[2] = *(_OWORD *)&a3->var1.var1;
  v22 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v23, v24, v14, v16, v18, v20);

}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  __int128 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _OWORD v16[3];
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  CGRect result;

  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x4010000000;
  v24 = &unk_1A7E74EE7;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *MEMORY[0x1E0C9D648];
  v26 = v5;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  if (v6)
    objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", a3);
  -[PXStoryGridTimeline size](self, "size");
  PXRectWithOriginAndSize();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__PXStoryGridTimeline_frameForSegmentWithIdentifier___block_invoke;
  v17[3] = &unk_1E51353D0;
  v17[4] = &v21;
  v16[0] = v18;
  v16[1] = v19;
  v16[2] = v20;
  -[PXStoryGridTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v16, v17);
  v8 = v22[4];
  v9 = v22[5];
  v10 = v22[6];
  v11 = v22[7];

  _Block_object_dispose(&v21, 8);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
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

- (PXExploreLayoutGenerator)layoutGenerator
{
  return self->_layoutGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_rectsStore, 0);
}

void __53__PXStoryGridTimeline_frameForSegmentWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v7;
  char *v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a4[1];
  *(_OWORD *)(v4 + 32) = *a4;
  *(_OWORD *)(v4 + 48) = v5;
  if (a2 >= 2)
  {
    v7 = a2 - 1;
    v8 = (char *)a4 + 56;
    do
    {
      *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), *(CGRect *)(v8 - 24));
      v8 += 32;
      --v7;
    }
    while (v7);
  }
}

void __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v13[3] = &unk_1E512ECC8;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(v9 + 40);
  v13[1] = 3221225472;
  v15 = a2;
  v16 = a5;
  v13[4] = v9;
  v12 = *(_OWORD *)(a1 + 64);
  v17 = *(_OWORD *)(a1 + 48);
  v18 = v12;
  v14 = v10;
  v19 = a3;
  v20 = a6;
  objc_msgSend(v11, "accessArrayWithElementsCount:accessBlock:", a2, v13);

}

uint64_t __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v3 = result;
  v4 = *(_QWORD *)(result + 48);
  if (v4 < 1)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = (_QWORD *)(*(_QWORD *)(result + 56) + 8);
    while (*v6 != 1)
    {
      v6 += 96;
      if (v4 == ++v5)
        goto LABEL_5;
    }
  }
  v7 = *(_QWORD *)(result + 32);
  v8 = *(_QWORD *)(v7 + 32);
  if (v8 < 1)
  {
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v9 = *(_QWORD **)(v7 + 16);
    v10 = *(_QWORD *)(*(_QWORD *)(result + 56) + 768 * v5);
    if (*v9 == v10)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v13 = 1;
      while (v8 != v13)
      {
        v14 = v9[v13++];
        if (v14 == v10)
        {
          v11 = v13 - 1;
          goto LABEL_15;
        }
      }
      v11 = v8;
LABEL_15:
      v12 = v11 >= v8;
    }
  }
  if (v4 >= 1)
  {
    v15 = 0;
    v16 = 0;
    v17 = (_OWORD *)MEMORY[0x1E0C9D648];
    do
    {
      while (1)
      {
        if (*(_QWORD *)(*(_QWORD *)(v3 + 56) + 768 * v15 + 8) != 1 || v12)
        {
          v19 = (uint64_t *)(a2 + 32 * v15);
          v20 = v17[1];
          *(_OWORD *)v19 = *v17;
          *((_OWORD *)v19 + 1) = v20;
          v21 = *v19;
          v22 = v19[1];
          v23 = v19[2];
          v24 = v19[3];
        }
        else
        {
          PXRectWithCenterAndSize();
          v25 = (_QWORD *)(a2 + 32 * v15);
          *v25 = v21;
          v25[1] = v22;
          v25[2] = v23;
          v25[3] = v24;
          ++v11;
        }
        result = CGRectIntersectsRect(*(CGRect *)&v21, *(CGRect *)(v3 + 64));
        v16 += result;
        if ((result & 1) != 0 || v16 < 1)
          break;
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 40) + 16))();
        if (!**(_BYTE **)(v3 + 104))
        {
          v16 = 0;
          if (++v15 < *(_QWORD *)(v3 + 48))
            continue;
        }
        return result;
      }
      ++v15;
    }
    while (v15 < *(_QWORD *)(v3 + 48));
    if (v16 >= 1 && !**(_BYTE **)(v3 + 104))
      return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 40) + 16))();
  }
  return result;
}

uint64_t __72__PXStoryGridTimeline_initWithOriginalTimeline_layoutSpec_viewportSize___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  if (a2 >= 1)
  {
    v5 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v5 == 1)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16)
                  + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))++) = *(v5 - 1);
      v5 += 96;
      --a2;
    }
    while (a2);
  }
  return result;
}

id __72__PXStoryGridTimeline_initWithOriginalTimeline_layoutSpec_viewportSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;

  if (a2 < 1)
    v2 = &PXStoryClipIdentifierNull;
  else
    v2 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8 * a2 - 8);
  objc_msgSend(*(id *)(a1 + 40), "clipWithResourceKind:afterClipIdentifier:", 1, *v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
