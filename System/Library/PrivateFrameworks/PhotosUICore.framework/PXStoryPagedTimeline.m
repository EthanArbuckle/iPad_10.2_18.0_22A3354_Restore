@implementation PXStoryPagedTimeline

- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3
{
  return -[PXStoryPagedTimeline initWithOriginalTimeline:interpageSpacing:](self, "initWithOriginalTimeline:interpageSpacing:", a3, 0.0);
}

- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3 interpageSpacing:(double)a4
{
  id v6;
  PXStoryPagedTimelineSpec *v7;
  PXStoryPagedTimeline *v8;
  _QWORD v10[3];

  v6 = a3;
  v7 = objc_alloc_init(PXStoryPagedTimelineSpec);
  -[PXStoryPagedTimelineSpec setRegularInterpageSpacing:](v7, "setRegularInterpageSpacing:", a4);
  objc_msgSend(v6, "size");
  -[PXStoryPagedTimelineSpec setRegularPageSize:](v7, "setRegularPageSize:");
  -[PXStoryPagedTimelineSpec setKeyInterpageSpacing:](v7, "setKeyInterpageSpacing:", a4);
  objc_msgSend(v6, "size");
  -[PXStoryPagedTimelineSpec setKeyPageSize:](v7, "setKeyPageSize:");
  -[PXStoryPagedTimelineSpec setDisplayOneAssetPerPage:](v7, "setDisplayOneAssetPerPage:", 0);
  memset(v10, 0, sizeof(v10));
  v8 = -[PXStoryPagedTimeline initWithOriginalTimeline:keyPage:spec:](self, "initWithOriginalTimeline:keyPage:spec:", v6, v10, v7);

  return v8;
}

- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3 keyPage:(id *)a4 spec:(id)a5
{
  id v8;
  id v9;
  PXStoryPagedTimeline *v10;
  PXStoryPagedTimeline *v11;
  id *p_spec;
  int64_t var2;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  PXCArrayStore *transformedClipInfosStore;
  uint64_t v30;
  PXCArrayStore *transformedRectsStore;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id clipSizeTranformer;
  _QWORD v45[4];
  CMTimeRange v46;
  _QWORD v47[6];
  CMTimeRange v48;
  objc_super v49;
  CMTime duration;
  CMTime start;

  v8 = a3;
  v9 = a5;
  v49.receiver = self;
  v49.super_class = (Class)PXStoryPagedTimeline;
  v10 = -[PXStoryDerivedTimeline initWithOriginalTimeline:](&v49, sel_initWithOriginalTimeline_, v8);
  v11 = v10;
  if (v10)
  {
    p_spec = (id *)&v10->_spec;
    objc_storeStrong((id *)&v10->_spec, a5);
    var2 = a4->var2;
    *(_OWORD *)&v11->_keyPageMix.firstSegmentIdentifier = *(_OWORD *)&a4->var0;
    v11->_keyPageMix.secondSegmentIdentifier = var2;
    *(_OWORD *)&start.value = PXStoryTimeZero;
    start.epoch = 0;
    *(_OWORD *)&duration.value = PXStoryTimeMaximum;
    duration.epoch = 0;
    CMTimeRangeMake(&v48, &start, &duration);
    v14 = *(_OWORD *)&v48.start.value;
    v15 = *(_OWORD *)&v48.duration.timescale;
    *(_OWORD *)&v11->_timeRange.start.epoch = *(_OWORD *)&v48.start.epoch;
    *(_OWORD *)&v11->_timeRange.duration.timescale = v15;
    *(_OWORD *)&v11->_timeRange.start.value = v14;
    v16 = objc_msgSend(v8, "numberOfSegments");
    v11->_numberOfPages = v16;
    v17 = (double)(v16 - 1);
    objc_msgSend(v9, "regularPageSize");
    v19 = v18;
    objc_msgSend(v9, "regularInterpageSpacing");
    v21 = v19 + v20;
    objc_msgSend(v9, "regularInterpageSpacing");
    v23 = -(v22 - v17 * v21);
    objc_msgSend(v9, "keyPageSize");
    v25 = v24;
    objc_msgSend(v9, "keyInterpageSpacing");
    v11->_size.width = v23 + v25 + v26 * 2.0;
    objc_msgSend(v9, "keyPageSize");
    v11->_size.height = v27;
    v28 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 768);
    transformedClipInfosStore = v11->_transformedClipInfosStore;
    v11->_transformedClipInfosStore = (PXCArrayStore *)v28;

    v30 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 32);
    transformedRectsStore = v11->_transformedRectsStore;
    v11->_transformedRectsStore = (PXCArrayStore *)v30;

    if (objc_msgSend(*p_spec, "displayOneAssetPerPage"))
    {
      objc_msgSend(*p_spec, "regularPageSize");
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke;
      v47[3] = &__block_descriptor_48_e28__CGSize_dd_24__0_CGSize_dd_8l;
      v47[4] = v32;
      v47[5] = v33;
      v34 = v47;
    }
    else
    {
      -[PXStoryDerivedTimeline originalTimeline](v11, "originalTimeline");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "size");
      v37 = v36;
      v39 = v38;

      objc_msgSend(*p_spec, "regularPageSize");
      memset(&v48, 0, sizeof(v48));
      CGAffineTransformMakeScale((CGAffineTransform *)&v48, v40 / v37, v41 / v39);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke_2;
      v45[3] = &__block_descriptor_80_e28__CGSize_dd_24__0_CGSize_dd_8l;
      v46 = v48;
      v34 = v45;
    }
    v42 = _Block_copy(v34);
    clipSizeTranformer = v11->_clipSizeTranformer;
    v11->_clipSizeTranformer = v42;

  }
  return v11;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CGSize v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXStoryPagedTimeline numberOfPages](self, "numberOfPages");
  -[PXStoryPagedTimeline size](self, "size");
  NSStringFromCGSize(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Pages: %ld; Size: %@; Original Timeline:\n\t%@>"),
                 v5,
                 self,
                 v6,
                 v7,
                 v8);

  return v9;
}

- (int64_t)_pageIndexAtX:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  char v28;
  double v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  -[PXStoryPagedTimeline spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regularPageSize");
  v7 = v6;
  -[PXStoryPagedTimeline spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regularInterpageSpacing");
  v10 = v7 + v9;

  -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix");
  v11 = &v30;
  if (v29 <= 0.5)
    v11 = (uint64_t *)&v28;
  if (!*v11)
    return (uint64_t)(a3 / v10);
  -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix", v29);
  v12 = &v27;
  if (v26 <= 0.5)
    v12 = &v25;
  v13 = *v12;
  -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](self, "frameForSegmentWithIdentifier:", *v12, v26);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  if (CGRectGetMinX(v31) > a3)
    return (uint64_t)(a3 / v10);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectGetMaxX(v32) > a3)
    return -[PXStoryDerivedTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", v13);
  -[PXStoryPagedTimeline spec](self, "spec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyPageSize");
  v21 = v20;
  -[PXStoryPagedTimeline spec](self, "spec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "keyInterpageSpacing");
  v24 = v21 + v23;

  return (uint64_t)((a3 - v24) / v10) + 1;
}

- (void)_enumerateSegmentsInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  CGFloat MinX;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void (*v23)(_QWORD *, uint64_t, CGAffineTransform *, CGAffineTransform *, char *);
  __int128 v24;
  char v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v11 = -[PXStoryPagedTimeline _pageIndexAtX:](self, "_pageIndexAtX:", CGRectGetMinX(v30));
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v12 = -[PXStoryPagedTimeline _pageIndexAtX:](self, "_pageIndexAtX:", CGRectGetMaxX(v31));
  if (v11 <= v12)
  {
    v13 = v12;
    if (v11 < 0)
      goto LABEL_8;
LABEL_4:
    if (v11 >= -[PXStoryPagedTimeline numberOfPages](self, "numberOfPages"))
      goto LABEL_8;
    v14 = objc_msgSend(v10, "identifierForSegmentAtIndex:", v11);
    memset(&v29, 0, sizeof(v29));
    if (v10)
      objc_msgSend(v10, "timeRangeForSegmentWithIdentifier:", v14);
    -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](self, "frameForSegmentWithIdentifier:", v14);
    v15 = v32.size.width;
    v16 = v32.size.height;
    MinX = CGRectGetMinX(v32);
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeTranslation(&v28, MinX, 0.0);
    -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v20 = v19;
    v22 = v21;

    v26 = v28;
    CGAffineTransformScale(&v27, &v26, v15 / v20, v16 / v22);
    v28 = v27;
    v23 = (void (*)(_QWORD *, uint64_t, CGAffineTransform *, CGAffineTransform *, char *))v9[2];
    v24 = *(_OWORD *)&v27.tx;
    v27 = v29;
    *(_OWORD *)&v26.a = *(_OWORD *)&v28.a;
    *(_OWORD *)&v26.c = *(_OWORD *)&v28.c;
    v25 = 0;
    *(_OWORD *)&v26.tx = v24;
    v23(v9, v14, &v27, &v26, &v25);
    if (!v25)
    {
LABEL_8:
      while (v13 != v11)
      {
        if ((++v11 & 0x8000000000000000) == 0)
          goto LABEL_4;
      }
    }
  }

}

- (int64_t)_bestClipIndexForSegmentWithClipInfos:(id *)a3 frames:(const CGRect *)a4 count:(int64_t)a5
{
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  CGSize *p_size;
  double v11;
  int64_t *p_var1;
  double v13;
  CGFloat width;
  CGFloat height;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  float v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  int64_t v29;
  int64_t v31;
  CGRect v32;
  CGRect v33;

  if (a5 < 2)
    return 0;
  v31 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  p_size = &a4->size;
  v11 = 0.0;
  p_var1 = &a3->var1;
  v13 = 0.0;
  do
  {
    if (*p_var1 == 1)
    {
      width = p_size[-1].width;
      height = p_size[-1].height;
      v16 = p_size->width;
      v17 = p_size->height;
      v32.origin.x = width;
      v32.origin.y = height;
      v32.size.width = p_size->width;
      v32.size.height = v17;
      v18 = CGRectGetWidth(v32);
      v33.origin.x = width;
      v33.origin.y = height;
      v33.size.width = v16;
      v33.size.height = v17;
      v19 = v18 * CGRectGetHeight(v33);
      if (v19 > v11)
      {
        ++v9;
        v7 = v8;
        v11 = v19;
      }
      if (v9 <= 1)
      {
        -[PXStoryPagedTimeline clipWithIdentifier:](self, "clipWithIdentifier:", *(p_var1 - 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "resource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "px_storyResourceDisplayAsset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v22;
          objc_msgSend(v23, "overallAestheticScore");
          v25 = v24;
          objc_msgSend(v23, "curationScore");
          v27 = v26;

          v28 = v27 + v25 <= v13;
          if (v27 + v25 > v13)
            v13 = v27 + v25;
          v29 = v31;
          if (!v28)
            v29 = v8;
          v31 = v29;
        }

      }
    }
    p_var1 += 96;
    ++v8;
    p_size += 2;
  }
  while (a5 != v8);
  if (v9 <= 1)
    return v31;
  else
    return v7;
}

- (void)_transormClips:(id *)a3 frames:(const CGRect *)a4 count:(int64_t)a5 transformHandler:(id)a6 resultHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  const CGRect *v24;
  const $C99EDD0FAA5CC172DE20AC79C6A499CF *v25;

  v12 = a6;
  v13 = a7;
  -[PXStoryPagedTimeline clipSizeTranformer](self, "clipSizeTranformer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPagedTimeline transformedClipInfosStore](self, "transformedClipInfosStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke;
  v19[3] = &unk_1E5118280;
  v19[4] = self;
  v20 = v12;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v21 = v14;
  v22 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v12;
  objc_msgSend(v15, "accessArrayWithElementsCount:accessBlock:", a5, v19);

}

- (id)clipWithIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  double (**v6)(double, double);
  objc_class *v7;
  void *v8;
  _BYTE v10[768];
  objc_super __src[48];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXStoryPagedTimeline;
  -[PXStoryDerivedTimeline clipWithIdentifier:](&v12, sel_clipWithIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  memset(__src, 0, 512);
  if (v4)
    objc_msgSend(v4, "info");
  else
    bzero(__src, 0x300uLL);
  -[PXStoryPagedTimeline clipSizeTranformer](self, "clipSizeTranformer");
  v6 = (double (**)(double, double))objc_claimAutoreleasedReturnValue();
  __src[1].receiver = COERCE_ID(v6[2](*(double *)&__src[1].receiver, *(double *)&__src[1].super_class));
  __src[1].super_class = v7;

  memcpy(v10, __src, sizeof(v10));
  v8 = (void *)objc_msgSend(v5, "copyWithInfo:", v10);

  return v8;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  __int128 v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;

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
  -[PXStoryPagedTimeline spec](self, "spec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "displayOneAssetPerPage");

  v26[1] = 3221225472;
  v23 = *(_OWORD *)&a3->var0.var3;
  v33 = *(_OWORD *)&a3->var0.var0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v26[3] = &unk_1E5118318;
  v36 = v22;
  v26[4] = self;
  v27 = v12;
  v34 = v23;
  v35 = *(_OWORD *)&a3->var1.var1;
  v29 = v14;
  v30 = v16;
  v31 = v18;
  v32 = v20;
  v28 = v11;
  v24 = v11;
  v25 = v12;
  -[PXStoryPagedTimeline _enumerateSegmentsInRect:usingBlock:](self, "_enumerateSegmentsInRect:usingBlock:", v26, x, y, width, height);

}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  int64_t v4;
  uint64_t *v5;
  int64_t v6;
  int64_t v7;
  double v8;
  double MaxX;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  double v47;
  uint64_t v48;
  CGRect v49;
  CGRect result;

  v4 = -[PXStoryDerivedTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", a3);
  -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix");
  v5 = &v48;
  if (v47 <= 0.5)
    v5 = (uint64_t *)&v46;
  if (*v5)
  {
    -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix", v47);
    v6 = -[PXStoryDerivedTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", v45);
    -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix");
    v7 = -[PXStoryDerivedTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", v44);
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    MaxX = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    if (v4 == v6 || v4 == v7)
      -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix");
    PXClamp();
    -[PXStoryPagedTimeline spec](self, "spec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "regularPageSize");
    -[PXStoryPagedTimeline spec](self, "spec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyPageSize");
    PXSizeByLinearlyInterpolatingSize();

    PXRectWithOriginAndSize();
    v15 = v14;
    v8 = v16;
    v10 = v17;
    v11 = v18;
    -[PXStoryPagedTimeline spec](self, "spec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "regularPageSize");
    v21 = v20;
    -[PXStoryPagedTimeline spec](self, "spec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "regularInterpageSpacing");
    v24 = v21 + v23;

    MaxX = v15 + v24 * (double)(v4 - 1);
    if (v4 >= v6)
    {
      if (v4 <= v7)
      {
        if (v4 == v6)
        {
          -[PXStoryPagedTimeline spec](self, "spec");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "regularInterpageSpacing");
          -[PXStoryPagedTimeline spec](self, "spec");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "keyInterpageSpacing");
          PXFloatByLinearlyInterpolatingFloats();
          v37 = v36;

          -[PXStoryPagedTimeline spec](self, "spec");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "regularPageSize");
          v33 = v37 + v38;
        }
        else
        {
          if (v4 != v7)
            goto LABEL_20;
          -[PXStoryPagedTimeline keyPageMix](self, "keyPageMix");
          -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](self, "frameForSegmentWithIdentifier:", v43);
          MaxX = CGRectGetMaxX(v49);
          -[PXStoryPagedTimeline spec](self, "spec");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "keyInterpageSpacing");
        }
      }
      else
      {
        -[PXStoryPagedTimeline spec](self, "spec");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "keyPageSize");
        v27 = v26;
        -[PXStoryPagedTimeline spec](self, "spec");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "keyInterpageSpacing");
        v30 = v27 + v29 * 2.0;

        -[PXStoryPagedTimeline spec](self, "spec");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "regularInterpageSpacing");
        v33 = v30 - v32;
      }
      MaxX = MaxX + v33;

      goto LABEL_20;
    }
    MaxX = v24 + MaxX;
  }
LABEL_20:
  v39 = MaxX;
  v40 = v8;
  v41 = v10;
  v42 = v11;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var1;
  return self;
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

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- ($7DA682ECC7253F641496E0B6E9C98204)keyPageMix
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = ($BC569A352189BBB700BC3B7A67A9BAFC)self[3];
  return self;
}

- (PXStoryPagedTimelineSpec)spec
{
  return self->_spec;
}

- (PXCArrayStore)transformedClipInfosStore
{
  return self->_transformedClipInfosStore;
}

- (PXCArrayStore)transformedRectsStore
{
  return self->_transformedRectsStore;
}

- (id)clipSizeTranformer
{
  return self->_clipSizeTranformer;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clipSizeTranformer, 0);
  objc_storeStrong((id *)&self->_transformedRectsStore, 0);
  objc_storeStrong((id *)&self->_transformedClipInfosStore, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, __int128 *a3, __int128 *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _OWORD v30[3];
  _OWORD v31[3];
  _OWORD v32[3];

  if (*(_BYTE *)(a1 + 136))
  {
    objc_msgSend(*(id *)(a1 + 32), "frameForSegmentWithIdentifier:", a2);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  }
  v15 = *(void **)(a1 + 40);
  v16 = *a3;
  v17 = a3[2];
  v31[1] = a3[1];
  v31[2] = v17;
  v18 = *(_OWORD *)(a1 + 104);
  v30[0] = *(_OWORD *)(a1 + 88);
  v30[1] = v18;
  v30[2] = *(_OWORD *)(a1 + 120);
  v31[0] = v16;
  PXStoryTimeRangeIntersection(v31, v30, v32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v20[3] = &unk_1E51182F0;
  v29 = *(_BYTE *)(a1 + 136);
  v20[4] = *(_QWORD *)(a1 + 32);
  v22 = v8;
  v23 = v10;
  v24 = v12;
  v25 = v14;
  v19 = a4[1];
  v26 = *a4;
  v27 = v19;
  v28 = a4[2];
  v21 = *(id *)(a1 + 48);
  objc_msgSend(v15, "enumerateClipsInTimeRange:rect:usingBlock:", v32, v20, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;

  v12 = *(_BYTE *)(a1 + 128);
  if (v12)
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "_bestClipIndexForSegmentWithClipInfos:frames:count:", a5, a4, a2);
    v12 = *(_BYTE *)(a1 + 128);
  }
  else
  {
    v13 = 0;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v14 = *(_OWORD *)(a1 + 64);
  v23 = *(_OWORD *)(a1 + 48);
  v24 = v14;
  v15 = *(_OWORD *)(a1 + 96);
  v25 = *(_OWORD *)(a1 + 80);
  v22[1] = 3221225472;
  v22[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_3;
  v22[3] = &__block_descriptor_121_e73__CGRect__CGPoint_dd__CGSize_dd__48__0_CGRect__CGPoint_dd__CGSize_dd__8q40l;
  v28 = v12;
  v22[4] = v13;
  v26 = v15;
  v27 = *(_OWORD *)(a1 + 112);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_4;
  v17[3] = &unk_1E51182C8;
  v16 = *(void **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = a2;
  v20 = a3;
  v21 = a6;
  objc_msgSend(v16, "_transormClips:frames:count:transformHandler:resultHandler:", a5, a4, a2, v22, v17);

}

double __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double result;
  __int128 v7;
  CGAffineTransform v8;

  if (*(_BYTE *)(a1 + 120))
  {
    if (*(_QWORD *)(a1 + 32) == a2)
      return *(double *)(a1 + 40);
    else
      return *MEMORY[0x1E0C9D648];
  }
  else
  {
    v7 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&v8.c = v7;
    *(_OWORD *)&v8.tx = *(_OWORD *)(a1 + 104);
    *(_QWORD *)&result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a3, &v8);
  }
  return result;
}

uint64_t __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6], a3, a2, a1[7]);
}

void __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "transformedRectsStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke_2;
  v9[3] = &unk_1E5118258;
  v13 = v5;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v10 = v6;
  v14 = v7;
  v15 = a2;
  v16 = v8;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v4, "accessArrayWithElementsCount:accessBlock:", v5, v9);

}

uint64_t __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((uint64_t)a1[7] >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = 24;
    do
    {
      v7 = (double *)(a2 + v6);
      *(v7 - 3) = (*(double (**)(double, double, double, double))(a1[4] + 16))(*(double *)(a1[8] + v6 - 24), *(double *)(a1[8] + v6 - 16), *(double *)(a1[8] + v6 - 8), *(double *)(a1[8] + v6));
      *((_QWORD *)v7 - 2) = v8;
      *((_QWORD *)v7 - 1) = v9;
      *(_QWORD *)v7 = v10;
      memcpy((void *)(a1[9] + v4), (const void *)(a1[10] + v4), 0x300uLL);
      v11 = a1[9] + v4;
      *(double *)(v11 + 16) = (*(double (**)(double, double))(a1[5] + 16))(*(double *)(v11 + 16), *(double *)(v11 + 24));
      *(_QWORD *)(v11 + 24) = v12;
      ++v5;
      v4 += 768;
      v6 += 32;
    }
    while (v5 < a1[7]);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

double __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke_2(uint64_t a1, double a2, double a3)
{
  return a3 * *(double *)(a1 + 48) + *(double *)(a1 + 32) * a2;
}

@end
