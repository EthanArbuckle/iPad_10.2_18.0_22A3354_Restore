@implementation PXStoryRelatedLayoutGenerator

- (PXStoryRelatedLayoutGenerator)initWithMetrics:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryRelatedLayoutGenerator;
  return -[PXStoryRelatedLayoutGenerator initWithMetrics:](&v4, sel_initWithMetrics_, a3);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_itemFrames);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedLayoutGenerator;
  -[PXStoryRelatedLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedLayoutGenerator;
  -[PXStoryRelatedLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_isPrepared = 0;
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

  -[PXStoryRelatedLayoutGenerator metrics](self, "metrics");
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

  -[PXStoryRelatedLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)scrollableOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  -[PXStoryRelatedLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  top = self->_scrollableOutsets.top;
  left = self->_scrollableOutsets.left;
  bottom = self->_scrollableOutsets.bottom;
  right = self->_scrollableOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isContentScrolledIntoView
{
  -[PXStoryRelatedLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  return self->_isContentScrolledIntoView;
}

- (void)adjustTargetScrollOffset:(CGPoint *)a3 forVelocity:(CGPoint)a4 currentScrollOffset:(CGPoint)a5 shouldHideContent:(BOOL *)a6
{
  CGFloat v6;
  CGFloat *p_right;

  *a6 = 0;
  v6 = 0.0;
  if (a5.x >= 0.0)
  {
    if (a4.x >= 0.0)
    {
      if (a4.x <= 0.0)
        return;
      p_right = &self->_scrollableOutsets.right;
      goto LABEL_7;
    }
  }
  else if (a4.x <= 0.0)
  {
    *a6 = 1;
    p_right = &self->_scrollableOutsets.left;
LABEL_7:
    v6 = *p_right;
  }
  a3->x = v6;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  const CGRect *v9;
  CGFloat *p_height;
  uint64_t *p_size;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  length = a4.length;
  location = a4.location;
  v9 = -[PXStoryRelatedLayoutGenerator _framesForItemInRange:](self, "_framesForItemInRange:", a4.location, a4.length);
  if (length)
  {
    p_height = &a3->var7.height;
    p_size = (uint64_t *)&v9->size;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v20 = *MEMORY[0x1E0C9BAA8];
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v16 = *(_OWORD *)off_1E50B86D0;
    v17 = *((_OWORD *)off_1E50B86D0 + 1);
    do
    {
      v12 = *p_size;
      v13 = p_size[1];
      p_size += 4;
      PXRectGetCenter();
      *((_QWORD *)p_height - 18) = location;
      *((_QWORD *)p_height - 17) = v14;
      *((_QWORD *)p_height - 16) = v15;
      *((_QWORD *)p_height - 15) = v12;
      *((_QWORD *)p_height - 14) = v13;
      *(_OWORD *)(p_height - 13) = v20;
      *(_OWORD *)(p_height - 11) = v19;
      *(_OWORD *)(p_height - 9) = v18;
      *(p_height - 7) = 0.0;
      *((_QWORD *)p_height - 6) = a5;
      *(_OWORD *)(p_height - 3) = v17;
      *(_OWORD *)(p_height - 5) = v16;
      ++location;
      *((_QWORD *)p_height - 1) = v12;
      *(_QWORD *)p_height = v13;
      p_height += 19;
      --length;
    }
    while (length);
  }
}

- (void)getFrames:(CGRect *)a3 forItemsInRange:(_NSRange)a4
{
  memcpy(a3, -[PXStoryRelatedLayoutGenerator _framesForItemInRange:](self, "_framesForItemInRange:", a4.location, a4.length), 32 * a4.length);
}

- (const)_framesForItemInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v7;
  unint64_t v9;
  void *v10;
  void *v11;
  NSRange v12;

  length = a3.length;
  location = a3.location;
  v7 = -[PXStoryRelatedLayoutGenerator itemCount](self, "itemCount");
  if (location + length > v7)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12.location = location;
    v12.length = length;
    NSStringFromRange(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedLayoutGenerator.m"), 182, CFSTR("range %@ out of bounds (0..<%li)"), v11, v9);

  }
  -[PXStoryRelatedLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  return &self->_itemFrames[location];
}

- (void)_prepareIfNeeded
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect **p_itemFrames;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MaxX;
  double MinY;
  CGRect *v47;
  uint64_t v48;
  unint64_t v49;
  double *p_height;
  double x;
  CGRect *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  BOOL v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  int64_t capacity;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  if (!self->_isPrepared)
  {
    v4 = -[PXStoryRelatedLayoutGenerator itemCount](self, "itemCount");
    -[PXStoryRelatedLayoutGenerator metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceSize");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "interitemSpacing");
    v67 = v10;
    objc_msgSend(v5, "margins");
    v12 = v11;
    v14 = v13;
    v64 = v9;
    v65 = v7;
    v17 = v7 - (v15 + v16);
    v18 = v9 - (v11 + v13);
    switch(objc_msgSend(v5, "layoutMode"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedLayoutGenerator.m"), 211, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
        v59 = v14;
        v19 = (v67 + v18) * 0.5 - v67;
        v20 = 0x7FFFFFFFFFFFFFFFLL;
        v21 = 2;
        goto LABEL_13;
      case 2:
        if (v17 / 0.75 < v18)
          v18 = v17 / 0.75;
        v22 = v9 - v14 - v12 - v18;
        v23 = v22 * 0.5;
        v24 = v22 <= 0.0;
        v25 = 0.0;
        if (!v24)
          v25 = v23;
        v62 = v14 + v25;
        v19 = (v67 + v18) * 0.5 - v67;
        v20 = 0x7FFFFFFFFFFFFFFFLL;
        v21 = 2;
        objc_msgSend(v5, "scrollOffset", *(_QWORD *)&v62);
        break;
      case 3:
        v59 = v14;
        PXSizeGetAspectRatio();
        v19 = (((v17 + v26 * v67) / 3.0 - v67) / v26 - v67) * 0.5;
        v21 = 2;
        v20 = 2;
        goto LABEL_13;
      case 4:
        v59 = v14;
        v19 = 213.0;
        v20 = 0x7FFFFFFFFFFFFFFFLL;
        v21 = 1;
LABEL_13:
        objc_msgSend(v5, "scrollOffset", *(_QWORD *)&v59);
        break;
      default:
        v60 = v14;
        v20 = 0x7FFFFFFFFFFFFFFFLL;
        v21 = 2;
        v19 = 0.0;
        objc_msgSend(v5, "scrollOffset", *(_QWORD *)&v60);
        break;
    }
    objc_msgSend(v5, "offscreenFraction");
    v28 = v27;
    PXClamp();
    v66 = v29;
    PXSizeByLinearlyInterpolatingSize();
    v31 = v30;
    v33 = v32;
    objc_msgSend(v5, "layoutMode");
    v63 = v28;
    PXFloatByLinearlyInterpolatingFloats();
    if (v4 >= 1)
    {
      v35 = v9 - v61 - v33;
      if (v28 >= 1.0)
        v36 = v34 + v65 * 100.0;
      else
        v36 = v34;
      capacity = self->_capacity;
      p_itemFrames = &self->_itemFrames;
      _PXGArrayCapacityResizeToCount();
      v38 = 0;
      self->_capacity = capacity;
      do
      {
        v39 = (uint64_t)&(*p_itemFrames)[v38];
        *(double *)v39 = v36;
        *(double *)(v39 + 8) = v35;
        *(CGFloat *)(v39 + 16) = v31;
        *(double *)(v39 + 24) = v33;
        v40 = v19;
        PXSizeByLinearlyInterpolatingSize();
        v42 = v41;
        v44 = v43;
        v69.origin.x = v36;
        v69.origin.y = v64 - v61 - v33;
        v69.size.width = v31;
        v69.size.height = v33;
        MaxX = CGRectGetMaxX(v69);
        v70.origin.x = v36;
        v70.origin.y = v64 - v61 - v33;
        v70.size.width = v31;
        v70.size.height = v33;
        MinY = CGRectGetMinY(v70);
        v47 = *p_itemFrames;
        v48 = v4 - (v38 + 1);
        if (v4 <= v38 + 1)
        {
          x = v47[v38++].origin.x;
        }
        else
        {
          v49 = 0;
          if (v48 >= v20)
            v48 = v20;
          if (v48 <= 1)
            v48 = 1;
          p_height = &v47[v38 + 1].size.height;
          do
          {
            x = v67 + MaxX + (double)(uint64_t)(v49 / v21) * (v67 + v42);
            *(p_height - 3) = x;
            *(p_height - 2) = MinY + (double)(uint64_t)(v49 & (v21 - 1)) * (v67 + v44);
            *(p_height - 1) = v42;
            *p_height = v44;
            ++v49;
            p_height += 4;
          }
          while (v48 != v49);
          v38 += 1 + v49;
        }
        v19 = v40;
        v52 = &v47[v38];
        v71.origin.y = v52[-1].origin.y;
        v71.size.width = v52[-1].size.width;
        v71.size.height = v52[-1].size.height;
        v71.origin.x = x;
        v36 = v67 + CGRectGetMaxX(v71);
      }
      while (v38 < v4);
    }
    self->_size.width = v65;
    self->_size.height = v64;
    PXEdgeInsetsMake();
    self->_scrollableOutsets.top = v53;
    self->_scrollableOutsets.left = v54;
    self->_scrollableOutsets.bottom = v55;
    self->_scrollableOutsets.right = v56;
    v57 = v66 > 0.01;
    if (v63 > 0.0)
      v57 = 0;
    self->_isContentScrolledIntoView = v57;
    self->_isPrepared = 1;

  }
}

+ (int64_t)preferredNumberOfItemsForExtendedTraitCollection:(id)a3
{
  return objc_msgSend(a1, "_preferredNumberOfItemsForUserInterfaceIdiom:", objc_msgSend(a3, "userInterfaceIdiom"));
}

+ (int64_t)_preferredNumberOfItemsForUserInterfaceIdiom:(int64_t)a3
{
  void *v6;

  if ((unint64_t)a3 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryRelatedLayoutGenerator.m"), 88, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return qword_1A7C096E0[a3];
}

+ (BOOL)isExpectedKeyItemAtIndex:(int64_t)a3
{
  BOOL v4;
  BOOL v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXStoryRelatedLayoutGenerator_isExpectedKeyItemAtIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isExpectedKeyItemAtIndex__onceToken != -1)
    dispatch_once(&isExpectedKeyItemAtIndex__onceToken, block);
  if (a3)
    v4 = a3 == 3;
  else
    v4 = 1;
  v5 = v4;
  if (isExpectedKeyItemAtIndex__numberOfItemsOnCurrentDevice == 6)
    return v5;
  else
    return a3 == 0;
}

uint64_t __58__PXStoryRelatedLayoutGenerator_isExpectedKeyItemAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");
  if (v3 > 6)
    v4 = 0;
  else
    v4 = qword_1A7C09B68[v3];

  result = objc_msgSend(*(id *)(a1 + 32), "_preferredNumberOfItemsForUserInterfaceIdiom:", v4);
  isExpectedKeyItemAtIndex__numberOfItemsOnCurrentDevice = result;
  return result;
}

@end
