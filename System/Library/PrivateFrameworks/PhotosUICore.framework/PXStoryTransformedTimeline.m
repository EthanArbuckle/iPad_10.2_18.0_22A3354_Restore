@implementation PXStoryTransformedTimeline

- (PXStoryTransformedTimeline)initWithOriginalTimeline:(id)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[PXStoryTransformedTimeline initWithOriginalTimeline:transform:](self, "initWithOriginalTimeline:transform:", a3, v5);
}

- (PXStoryTransformedTimeline)initWithOriginalTimeline:(id)a3 transform:(CGAffineTransform *)a4
{
  PXStoryTransformedTimeline *v5;
  PXStoryTransformedTimeline *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  PXCArrayStore *transformedRectsStore;
  uint64_t v11;
  PXCArrayStore *transformedClipInfosStore;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXStoryTransformedTimeline;
  v5 = -[PXStoryDerivedTimeline initWithOriginalTimeline:](&v14, sel_initWithOriginalTimeline_, a3);
  v6 = v5;
  if (v5)
  {
    v8 = *(_OWORD *)&a4->c;
    v7 = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v5->_transform.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v5->_transform.c = v8;
    *(_OWORD *)&v5->_transform.tx = v7;
    v9 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 32);
    transformedRectsStore = v6->_transformedRectsStore;
    v6->_transformedRectsStore = (PXCArrayStore *)v9;

    v11 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 768);
    transformedClipInfosStore = v6->_transformedClipInfosStore;
    v6->_transformedClipInfosStore = (PXCArrayStore *)v11;

  }
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  CGSize v12;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransformedTimeline transform](self, "transform");
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v12.height = v7 * 0.0 + 0.0 * v8;
  v12.width = v12.height;
  NSStringFromCGSize(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %p; Transform: [%g %g %g %g %g %g]; Size: %@; Original Timeline:\n\t%@>"),
                  v6,
                  self,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v9,
                  v3);

  return v10;
}

- (CGRect)_untransformRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXStoryTransformedTimeline transform](self, "transform");
  CGAffineTransformInvert(&v8, &v7);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)transformedRectForOriginalClipInfo:(id *)a3 originalRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v8;
  CGRect v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PXStoryTransformedTimeline transform](self, "transform", a3);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (void)_transformRects:(const CGRect *)a3 clipInfos:(id *)a4 count:(int64_t)a5 resultHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  const $C99EDD0FAA5CC172DE20AC79C6A499CF *v16;
  const CGRect *v17;

  v10 = a6;
  -[PXStoryTransformedTimeline transformedRectsStore](self, "transformedRectsStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke;
  v13[3] = &unk_1E5129820;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "accessArrayWithElementsCount:accessBlock:", a5, v13);

}

- (CGSize)size
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  -[PXStoryTransformedTimeline transform](self, "transform");

  v8 = v7 * v12 + v10 * v5;
  v9 = v7 * v13 + v11 * v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
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

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransformedTimeline _untransformRect:](self, "_untransformRect:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v24[3] = &unk_1E5129870;
  v24[4] = self;
  v25 = v11;
  v21 = *(_OWORD *)&a3->var0.var3;
  v23[0] = *(_OWORD *)&a3->var0.var0;
  v23[1] = v21;
  v23[2] = *(_OWORD *)&a3->var1.var1;
  v22 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v23, v24, v14, v16, v18, v20);

}

- (id)clipWithIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  _BYTE __dst[768];
  _QWORD v10[5];
  _OWORD v11[2];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[768];
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PXStoryTransformedTimeline;
  -[PXStoryDerivedTimeline clipWithIdentifier:](&v49, sel_clipWithIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  memset(v48, 0, 512);
  if (v4)
    objc_msgSend(v4, "info");
  else
    bzero(v48, 0x300uLL);
  v12 = 0;
  v13 = &v12;
  v14 = 0x32010000000;
  v15 = &unk_1A7E74EE7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v11[0] = *MEMORY[0x1E0C9D628];
  v11[1] = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PXStoryTransformedTimeline_clipWithIdentifier___block_invoke;
  v10[3] = &unk_1E5129898;
  v10[4] = &v12;
  -[PXStoryTransformedTimeline _transformRects:clipInfos:count:resultHandler:](self, "_transformRects:clipInfos:count:resultHandler:", v11, v48, 1, v10);
  memcpy(__dst, v13 + 4, sizeof(__dst));
  v7 = (void *)objc_msgSend(v5, "copyWithInfo:", __dst);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameForSegmentWithIdentifier:", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXStoryTransformedTimeline transform](self, "transform");
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  v24 = CGRectApplyAffineTransform(v23, &v22);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGSize)originalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PXCArrayStore)transformedRectsStore
{
  return self->_transformedRectsStore;
}

- (PXCArrayStore)transformedClipInfosStore
{
  return self->_transformedClipInfosStore;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformedClipInfosStore, 0);
  objc_storeStrong((id *)&self->_transformedRectsStore, 0);
}

void *__49__PXStoryTransformedTimeline_clipWithIdentifier___block_invoke(uint64_t a1, int a2, void *__src)
{
  return memcpy((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), __src, 0x300uLL);
}

void __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v12[3] = &unk_1E5129848;
  v11 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = a2;
  v15 = a3;
  v16 = a6;
  objc_msgSend(v11, "_transformRects:clipInfos:count:resultHandler:", a4, a5, a2, v12);

}

uint64_t __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6], a2, a3, a1[7]);
}

void __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "transformedClipInfosStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke_2;
  v7[3] = &unk_1E51297F8;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = *(_OWORD *)(a1 + 56);
  v11 = a2;
  v8 = v5;
  objc_msgSend(v4, "accessArrayWithElementsCount:accessBlock:", v6, v7);

}

uint64_t __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  BOOL IsEmpty;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  uint64_t v59;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat rect2;
  double rect2a;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "transform");
  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v70 = *((double *)off_1E50B86D0 + 1);
    v71 = *(double *)off_1E50B86D0;
    v68 = *((double *)off_1E50B86D0 + 3);
    v69 = *((double *)off_1E50B86D0 + 2);
    do
    {
      v8 = *(_QWORD *)(a1 + 56);
      v9 = (double *)(*(_QWORD *)(a1 + 64) + v5);
      v10 = *v9;
      v11 = v9[1];
      v12 = v9[2];
      v13 = v9[3];
      v77.origin.x = *v9;
      v77.origin.y = v11;
      v77.size.width = v12;
      v77.size.height = v13;
      if (CGRectIsNull(v77))
      {
        PXRectWithOriginAndSize();
        v10 = v14;
        v11 = v15;
        v12 = v16;
        v13 = v17;
      }
      objc_msgSend(*(id *)(a1 + 32), "transformedRectForOriginalClipInfo:originalRect:", v8 + v6, v10, v11, v12, v13, *(_QWORD *)&v61, *(_QWORD *)&v62, *(_QWORD *)&v63, *(_QWORD *)&v64);
      v19 = v18;
      v21 = v20;
      v22 = (_QWORD *)(*(_QWORD *)(a1 + 72) + v5);
      *v22 = v23;
      v22[1] = v24;
      v22[2] = v18;
      v22[3] = v20;
      v25 = a2 + v6;
      memcpy((void *)(a2 + v6), (const void *)(v8 + v6), 0x300uLL);
      *(_QWORD *)(v25 + 16) = v19;
      *(_QWORD *)(v25 + 24) = v21;
      if (*(_QWORD *)(v8 + v6 + 8) == 1)
      {
        PXStoryRectOuterBounds();
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        PXStoryRectOuterBounds();
        v83.origin.x = v34;
        v83.origin.y = v35;
        v83.size.width = v36;
        v83.size.height = v37;
        v78.origin.x = v27;
        v78.origin.y = v29;
        v78.size.width = v31;
        v78.size.height = v33;
        v79 = CGRectUnion(v78, v83);
        x = v79.origin.x;
        y = v79.origin.y;
        width = v79.size.width;
        height = v79.size.height;
        PXSizeGetAspectRatio();
        PXRectWithAspectRatioFillingRect();
        v43 = v42;
        v45 = v44;
        v47 = v46;
        rect2 = v48;
        if ((PXRectApproximatelyEqualToRect() & 1) == 0)
        {
          v80.origin.y = v70;
          v80.origin.x = v71;
          v80.size.height = v68;
          v80.size.width = v69;
          v84.origin.x = rect2;
          v84.origin.y = v43;
          v84.size.width = v45;
          v84.size.height = v47;
          v49 = x;
          if (!CGRectContainsRect(v80, v84))
          {
            rect2a = *(double *)(a2 + v6 + 176);
            v66 = *(double *)(a2 + v6 + 192);
            v67 = *(double *)(a2 + v6 + 184);
            v50 = *(double *)(a2 + v6 + 208);
            v65 = *(double *)(a2 + v6 + 200);
            v52 = *(double *)(a2 + v6 + 216);
            v51 = *(double *)(a2 + v6 + 224);
            v53 = *(double *)(a2 + v6 + 232);
            v81.origin.x = v50;
            v81.origin.y = v52;
            v81.size.width = v51;
            v81.size.height = v53;
            if (CGRectIsEmpty(v81))
            {
              v53 = v65;
              v51 = v66;
              v52 = v67;
              v50 = rect2a;
            }
            v82.origin.x = v50;
            v82.origin.y = v52;
            v82.size.width = v51;
            v82.size.height = v53;
            IsEmpty = CGRectIsEmpty(v82);
            v55 = v49;
            v56 = y;
            v57 = width;
            v58 = height;
            if (!IsEmpty)
              PXRectFlippedVertically();
            v61 = v55;
            v62 = v56;
            v63 = v57;
            v64 = v58;
            PXRectWithAspectRatioInsideRectContainingAsMuchAsPossibleOfRect();
          }
          PXAffineTransformMakeFromRects();
          PXStoryRectApplyAffineTransform();
          *(_OWORD *)(a2 + v6 + 552) = v74;
          *(_OWORD *)(a2 + v6 + 568) = v75;
          *(_OWORD *)(a2 + v6 + 584) = v76;
          v59 = a2 + v6;
          PXStoryRectApplyAffineTransform();
          *(_OWORD *)(a2 + v6 + 600) = v74;
          *(_OWORD *)(v59 + 616) = v75;
          *(_OWORD *)(v59 + 632) = v76;
        }
      }
      ++v7;
      v6 += 768;
      v5 += 32;
    }
    while (v7 < *(_QWORD *)(a1 + 48));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
