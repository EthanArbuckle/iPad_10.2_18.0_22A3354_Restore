@implementation PXStoryMultipartPanoramaCropFinder

- (PXStoryMultipartPanoramaCropFinder)init
{
  return -[PXStoryMultipartPanoramaCropFinder initWithSaliencyAreas:](self, "initWithSaliencyAreas:", 0);
}

- (PXStoryMultipartPanoramaCropFinder)initWithSaliencyAreas:(id)a3
{
  id v4;
  PXStoryMultipartPanoramaCropFinder *v5;
  uint64_t v6;
  NSArray *saliencyAreas;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMultipartPanoramaCropFinder;
  v5 = -[PXStoryMultipartPanoramaCropFinder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    saliencyAreas = v5->_saliencyAreas;
    v5->_saliencyAreas = (NSArray *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_possibleRects);
  free(self->_bestRects);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMultipartPanoramaCropFinder;
  -[PXStoryMultipartPanoramaCropFinder dealloc](&v3, sel_dealloc);
}

- (id)bestCropContentsRectsWithAspectRatio:(double)a3 axis:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t rectCapacity;

  +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumNumberOfParts");

  rectCapacity = self->_rectCapacity;
  v9 = _PXGArrayCapacityResizeToCount();
  self->_rectCapacity = rectCapacity;
  if (v9)
    _PXGArrayResize();
  self->_axis = a4;
  v10 = -[PXStoryMultipartPanoramaCropFinder _findBestRectsWithMaximumCount:aspectRatio:](self, "_findBestRectsWithMaximumCount:aspectRatio:", v8, a3);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10 >= 1)
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_bestRects[v12].origin.x, self->_bestRects[v12].origin.y, self->_bestRects[v12].size.width, self->_bestRects[v12].size.height);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      ++v12;
      --v10;
    }
    while (v10);
  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

- (int64_t)_findBestRectsWithMaximumCount:(int64_t)a3 aspectRatio:(double)a4
{
  CGSize v6;
  uint64_t v7;
  uint64_t v8;
  CGRect *possibleRects;
  int64_t v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];

  v6 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  self->_referenceContentsRect.origin = *(CGPoint *)off_1E50B86D0;
  self->_referenceContentsRect.size = v6;
  if (self->_axis == 2)
    self->_referenceContentsRect.size.width = self->_referenceContentsRect.size.height * a4;
  else
    self->_referenceContentsRect.size.height = self->_referenceContentsRect.size.width / a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0xC12E848000000000;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (a3 < 1)
  {
    v10 = 0;
  }
  else
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      ++v7;
      possibleRects = self->_possibleRects;
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __81__PXStoryMultipartPanoramaCropFinder__findBestRectsWithMaximumCount_aspectRatio___block_invoke;
      v12[3] = &unk_1E5140068;
      v12[4] = self;
      v12[5] = v17;
      v12[6] = &v13;
      v12[7] = v7;
      -[PXStoryMultipartPanoramaCropFinder _enumeratePossibleContentsRects:count:usingBlock:](self, "_enumeratePossibleContentsRects:count:usingBlock:", possibleRects, v7, v12);
    }
    while (a3 != v7);
    v10 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  return v10;
}

- (void)_enumeratePossibleContentsRects:(CGRect *)a3 count:(int64_t)a4 usingBlock:(id)a5
{
  void (**v9)(_QWORD);
  CGSize size;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CGSize v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CGPoint v25;
  CGSize v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGPoint origin;
  CGSize v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(_QWORD))a5;
  if (a4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMultipartPanoramaCropFinder.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  size = self->_referenceContentsRect.size;
  origin = self->_referenceContentsRect.origin;
  v32 = size;
  PXSizeValueForAxis();
  -[PXStoryMultipartPanoramaCropFinder saliencyAreas](self, "saliencyAreas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "contentsRect");
        PXRectGetMidForAxis();
        PXClamp();
        PXPointSetValueForAxis();
        v16 = v32;
        a3->origin = origin;
        a3->size = v16;
        if (a4 == 1)
          v9[2](v9);
        else
          -[PXStoryMultipartPanoramaCropFinder _enumeratePossibleContentsRects:count:usingBlock:](self, "_enumeratePossibleContentsRects:count:usingBlock:", &a3[1], a4 - 1, v9);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v13);
  }
  v17 = objc_msgSend(v11, "count");
  if (a4 >= 2)
  {
    v18 = v17;
    if (v17 >= 2)
    {
      v19 = 0;
      v25 = self->_referenceContentsRect.origin;
      v26 = self->_referenceContentsRect.size;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "contentsRect");
        PXRectGetMaxForAxis();
        v20 = v19 + 1;
        v24 = v19 + 1;
        if (v19 + 1 < v18)
        {
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "contentsRect");
            PXRectGetMinForAxis();
            PXPointSetValueForAxis();
            PXPointSetValueForAxis();
            a3->origin = v25;
            a3->size = v26;
            a3[1].origin = v25;
            a3[1].size = v26;
            if ((unint64_t)a4 > 2)
              -[PXStoryMultipartPanoramaCropFinder _enumeratePossibleContentsRects:count:usingBlock:](self, "_enumeratePossibleContentsRects:count:usingBlock:", &a3[2], a4 - 2, v9);
            else
              v9[2](v9);

            ++v20;
          }
          while (v18 != v20);
        }

        v19 = v24;
      }
      while (v24 != v18);
    }
  }

}

- (double)_scoreContentsRects:(const CGRect *)a3 count:(int64_t)a4
{
  uint64_t v7;
  char *p_height;
  double result;
  const CGRect *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  char *v17;
  uint64_t v18;
  char *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  float v35;
  double v36;
  double v37;
  float v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v49 = *MEMORY[0x1E0C80C00];
  if (a4 < 1)
    return 0.0;
  v7 = 0;
  p_height = (char *)&a3[1].size.height;
  result = 0.0;
  do
  {
    v42 = result;
    v10 = &a3[v7];
    x = v10->origin.x;
    y = v10->origin.y;
    width = v10->size.width;
    height = v10->size.height;
    PXRectGetMinForAxis();
    if (v15 < 0.0)
      return -1000000.0;
    PXRectGetMaxForAxis();
    if (v16 > 1.0)
      return -1000000.0;
    v17 = p_height;
    v18 = v7;
    while (++v18 < a4)
    {
      v19 = v17 + 32;
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v20 = CGRectIntersectsRect(v50, *(CGRect *)(v17 - 24));
      v17 = v19;
      if (v20)
        return -1000000.0;
    }
    v43 = v42 + 1.0;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[PXStoryMultipartPanoramaCropFinder saliencyAreas](self, "saliencyAreas");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (!v22)
      goto LABEL_24;
    v23 = v22;
    v24 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v26, "contentsRect");
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;
        objc_msgSend(v26, "confidence");
        if (v35 <= 0.5)
        {
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = height;
          v56.origin.x = v28;
          v56.origin.y = v30;
          v56.size.width = v32;
          v56.size.height = v34;
          if (!CGRectIntersectsRect(v52, v56))
            continue;
          v53.origin.x = x;
          v53.origin.y = y;
          v53.size.width = width;
          v53.size.height = height;
          v57.origin.x = v28;
          v57.origin.y = v30;
          v57.size.width = v32;
          v57.size.height = v34;
          CGRectIntersection(v53, v57);
          PXSizeGetArea();
          v40 = v43 + v39;
        }
        else
        {
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = width;
          v51.size.height = height;
          v55.origin.x = v28;
          v55.origin.y = v30;
          v55.size.width = v32;
          v55.size.height = v34;
          if (CGRectContainsRect(v51, v55))
          {
            PXSizeGetArea();
            v37 = v36 * 0.1;
            objc_msgSend(v26, "confidence");
            v43 = v43 + 10.0 + v37 * v38;
            continue;
          }
          v54.origin.x = x;
          v54.origin.y = y;
          v54.size.width = width;
          v54.size.height = height;
          v58.origin.x = v28;
          v58.origin.y = v30;
          v58.size.width = v32;
          v58.size.height = v34;
          v41 = CGRectIntersectsRect(v54, v58);
          v40 = v43;
          if (v41)
            v40 = v43 + -5.0;
        }
        v43 = v40;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v23);
LABEL_24:

    ++v7;
    p_height += 32;
    result = v43;
  }
  while (v7 != a4);
  return result;
}

- (NSArray)saliencyAreas
{
  return self->_saliencyAreas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saliencyAreas, 0);
}

void *__81__PXStoryMultipartPanoramaCropFinder__findBestRectsWithMaximumCount_aspectRatio___block_invoke(uint64_t a1)
{
  void *result;
  double v3;
  double v4;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "_scoreContentsRects:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 56));
  v4 = v3;
  if (v3 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    result = memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(*(_QWORD *)(a1 + 32) + 8), 32 * *(_QWORD *)(a1 + 56));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 56);
  }
  return result;
}

@end
