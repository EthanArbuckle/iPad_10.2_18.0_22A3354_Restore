@implementation PUSectionedTilingLayout

- (PUSectionedTilingLayout)initWithDataSource:(id)a3
{
  PUSectionedTilingLayout *v3;
  PUSectionedTilingLayout *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUSectionedTilingLayout;
  v3 = -[PUTilingLayout initWithDataSource:](&v7, sel_initWithDataSource_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_interSectionSpacing = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v3->_numberOfSections = 0x7FFFFFFFFFFFFFFFLL;
    v3->_sectionInfos = 0;
    v3->_computedSections = (_NSRange)xmmword_1AB0EF470;
    v3->_seedSection = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_leftToRight = objc_msgSend(v5, "userInterfaceLayoutDirection") == 0;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sectionInfos);
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedTilingLayout;
  -[PUSectionedTilingLayout dealloc](&v3, sel_dealloc);
}

- (void)setVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  PUTilingLayoutInvalidationContext *v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v9 = v8;
  v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)PUSectionedTilingLayout;
  -[PUTilingLayout setVisibleRect:](&v14, sel_setVisibleRect_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[PUSectionedTilingLayout invalidateSectionInfos](self, "invalidateSectionInfos");
    v13 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    -[PUTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v13);

  }
}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSectionedTilingLayout;
  -[PUTilingLayout prepareLayout](&v5, sel_prepareLayout);
  if (self->_numberOfSections == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUTilingLayout dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberOfSections = objc_msgSend(v3, "numberOfSubItemsAtIndexPath:", v4);

    self->_sectionInfos = (_PUSectionedTilingLayoutSectionInfo *)malloc_type_realloc(self->_sectionInfos, 48 * self->_numberOfSections, 0x1000040AC875A91uLL);
    -[PUSectionedTilingLayout _markAllSectionInfosInvalid](self, "_markAllSectionInfosInvalid");
  }
}

- (CGRect)contentBounds
{
  _BOOL4 v3;
  int64_t location;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  NSUInteger v10;
  double x;
  double width;
  CGFloat height;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  int64_t v28;
  BOOL v29;
  uint64_t v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat y;
  double v39;
  CGRect v40;
  CGRect result;

  -[PUSectionedTilingLayout _computeSeedSectionIfNeeded](self, "_computeSeedSectionIfNeeded");
  -[PUSectionedTilingLayout _ensureComputedSectionsHaveBeenSeeded](self, "_ensureComputedSectionsHaveBeenSeeded");
  v3 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  location = self->_computedSections.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v9 = v3;
    v10 = location + self->_computedSections.length - 1;
    v40 = CGRectUnion((CGRect)-[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", self->_computedSections.location)[16], (CGRect)-[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", v10)[16]);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    v14 = MEMORY[0x1E0DC49E8];
    v15 = *MEMORY[0x1E0DC49E8];
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[PUSectionedTilingLayout estimatedSectionSize](self, "estimatedSectionSize");
    v36 = v19;
    v37 = v18;
    -[PUSectionedTilingLayout interSectionSpacing](self, "interSectionSpacing");
    v21 = v20;
    v23 = v22;
    v39 = height;
    if (location >= 1)
    {
      v24 = -[PUSectionedTilingLayout _scrollsHorizontallyNotVertically](self, "_scrollsHorizontallyNotVertically");
      v25 = (double)location;
      if (v24)
      {
        v26 = (v37 + v21) * v25;
        if (v9)
          v16 = -v26;
        else
          v17 = -(v26 - v21);
      }
      else
      {
        v15 = -((v36 + v23) * v25);
      }
    }
    v27 = *(double *)(v14 + 16);
    v28 = -[PUSectionedTilingLayout _numberOfSections](self, "_numberOfSections") - 1;
    v29 = __OFSUB__(v28, v10);
    v30 = v28 - v10;
    if ((v30 < 0) ^ v29 | (v30 == 0))
    {
      v33 = y;
    }
    else
    {
      v31 = -[PUSectionedTilingLayout _scrollsHorizontallyNotVertically](self, "_scrollsHorizontallyNotVertically");
      v32 = (double)v30;
      v33 = y;
      if (v31)
      {
        v34 = -((v37 + v21) * v32 - v21);
        v35 = -((v37 + v21) * v32);
        if (v9)
          v17 = v34;
        else
          v16 = v35;
      }
      else
      {
        v27 = -(v32 * (v36 + v23) - v23);
      }
    }
    v5 = x + v16;
    v6 = v33 + v15;
    v7 = width - (v16 + v17);
    v8 = v39 - (v15 + v27);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  NSUInteger location;
  NSUInteger i;
  void *v11;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedTilingLayout computeSectionsInRect:](self, "computeSectionsInRect:");
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PUSectionedTilingLayout addLayoutInfosForSupplementaryTilesInRect:toSet:](self, "addLayoutInfosForSupplementaryTilesInRect:toSet:", v8, x, y, width, height);
  location = self->_computedSections.location;
  for (i = self->_computedSections.length + location;
        location < i;
        i = self->_computedSections.length + self->_computedSections.location)
  {
    v13 = (CGRect)-[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", location)[16];
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    if (CGRectIntersectsRect(v13, v14))
      -[PUSectionedTilingLayout addLayoutInfosForTilesInRect:section:toSet:](self, "addLayoutInfosForTilesInRect:section:toSet:", location, v8, x, y, width, height);
    ++location;
  }
  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double Width;
  double v25;
  double MinX;
  double v27;
  double MaxX;
  double v29;
  double v30;
  double Height;
  double v32;
  double MinY;
  double v34;
  double MaxY;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;

  -[PUTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", a3, CFSTR("PUTileKindItemContent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v11 = v10;
  v13 = v12;
  v14 = v7 - v10 * 0.5;
  v15 = v9 - v12 * 0.5;
  v16 = -[PUSectionedTilingLayout layoutInfosForTilesInRect:](self, "layoutInfosForTilesInRect:", v14, v15);
  -[PUSectionedTilingLayout contentBounds](self, "contentBounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v43 = v23;
  v44.origin.x = v14;
  v44.origin.y = v15;
  v44.size.width = v11;
  v44.size.height = v13;
  Width = CGRectGetWidth(v44);
  v45.origin.x = v18;
  v45.origin.y = v20;
  v45.size.width = v22;
  v45.size.height = v43;
  v25 = CGRectGetWidth(v45);
  if (Width >= v25)
    Width = v25;
  v46.origin.x = v14;
  v46.origin.y = v15;
  v46.size.width = Width;
  v46.size.height = v13;
  MinX = CGRectGetMinX(v46);
  v47.origin.x = v18;
  v47.origin.y = v20;
  v47.size.width = v22;
  v47.size.height = v43;
  v27 = CGRectGetMinX(v47);
  if (MinX < v27)
    MinX = v27;
  v48.origin.x = MinX;
  v48.origin.y = v15;
  v48.size.width = Width;
  v48.size.height = v13;
  MaxX = CGRectGetMaxX(v48);
  v49.origin.x = v18;
  v49.origin.y = v20;
  v49.size.width = v22;
  v49.size.height = v43;
  v29 = CGRectGetMaxX(v49);
  if (MaxX >= v29)
    MaxX = v29;
  v50.origin.x = MinX;
  v50.origin.y = v15;
  v50.size.width = Width;
  v50.size.height = v13;
  v30 = MaxX - CGRectGetWidth(v50);
  v51.origin.x = v30;
  v51.origin.y = v15;
  v51.size.width = Width;
  v51.size.height = v13;
  Height = CGRectGetHeight(v51);
  v52.origin.x = v18;
  v52.origin.y = v20;
  v52.size.width = v22;
  v52.size.height = v43;
  v32 = CGRectGetHeight(v52);
  if (Height >= v32)
    Height = v32;
  v53.origin.x = v30;
  v53.origin.y = v15;
  v53.size.width = Width;
  v53.size.height = Height;
  MinY = CGRectGetMinY(v53);
  v54.origin.x = v18;
  v54.origin.y = v20;
  v54.size.width = v22;
  v54.size.height = v43;
  v34 = CGRectGetMinY(v54);
  if (MinY < v34)
    MinY = v34;
  v55.origin.x = v30;
  v55.origin.y = MinY;
  v55.size.width = Width;
  v55.size.height = Height;
  MaxY = CGRectGetMaxY(v55);
  v56.origin.x = v18;
  v56.origin.y = v20;
  v56.size.width = v22;
  v56.size.height = v43;
  v36 = CGRectGetMaxY(v56);
  if (MaxY >= v36)
    v37 = v36;
  else
    v37 = MaxY;
  v57.origin.x = v30;
  v57.origin.y = MinY;
  v57.size.width = Width;
  v57.size.height = Height;
  v38 = v37 - CGRectGetHeight(v57);

  v39 = v30;
  v40 = v38;
  v41 = Width;
  v42 = Height;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (void)invalidateLayoutForUpdateWithItems:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSectionedTilingLayout;
  -[PUTilingLayout invalidateLayoutForUpdateWithItems:](&v4, sel_invalidateLayoutForUpdateWithItems_, a3);
  -[PUSectionedTilingLayout invalidateSectionInfos](self, "invalidateSectionInfos");
  -[PUSectionedTilingLayout _invalidateNumberOfSections](self, "_invalidateNumberOfSections");
}

- (CGRect)boundsForSection:(int64_t)a3
{
  _PUSectionedTilingLayoutSectionInfo *v3;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", a3);
  x = v3->var2.origin.x;
  y = v3->var2.origin.y;
  width = v3->var2.size.width;
  height = v3->var2.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return (uint64_t)-[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", a3)[8];
}

- (_NSRange)computedSections
{
  _NSRange *p_computedSections;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_computedSections = &self->_computedSections;
  location = self->_computedSections.location;
  length = p_computedSections->length;
  result.length = length;
  result.location = location;
  return result;
}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 194, CFSTR("subclass must implement"));

  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_scrollsHorizontallyNotVertically
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v8;

  -[PUTilingLayout preferredScrollInfo](self, "preferredScrollInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "scrollDirections");
  v6 = v5 & 2;
  if (((v5 >> 2) & 1) == ((v5 >> 1) & 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 203, CFSTR("sectioned layout should either scroll horizontally or vertically, but not in both directions"));

  }
  return v6 != 0;
}

- (void)_ensureComputedSectionsHaveBeenSeeded
{
  NSObject *v3;
  int v4;
  PUSectionedTilingLayout *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_computedSections.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLOneUpGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412546;
      v5 = self;
      v6 = 2112;
      v7 = &stru_1E58AD278;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "No sections have been seeded in sectioned layout %@. Seeding with section zero, but performance impact is unbounded. %@", (uint8_t *)&v4, 0x16u);
    }

    self->_seedSection = 0;
    -[PUSectionedTilingLayout _computeSeedSectionIfNeeded](self, "_computeSeedSectionIfNeeded");
  }
}

- (void)_computeSeedSectionIfNeeded
{
  if (self->_computedSections.location == 0x7FFFFFFFFFFFFFFFLL
    && self->_seedSection != 0x7FFFFFFFFFFFFFFFLL
    && self->_numberOfSections >= 1)
  {
    -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:");
  }
  self->_seedSection = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)computeSectionsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL v8;
  int64_t location;
  BOOL v10;
  _PUSectionedTilingLayoutSectionInfo *v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD);
  char v14;
  char v15;
  _PUSectionedTilingLayoutSectionInfo *v16;
  NSUInteger v17;
  NSUInteger length;
  unsigned int (**v19)(_QWORD);
  NSUInteger i;
  _PUSectionedTilingLayoutSectionInfo *v21;
  _QWORD v22[10];
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _PUSectionedTilingLayoutSectionInfo *v27;
  _QWORD aBlock[10];
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _PUSectionedTilingLayoutSectionInfo *v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedTilingLayout _computeSeedSectionIfNeeded](self, "_computeSeedSectionIfNeeded");
  -[PUSectionedTilingLayout _ensureComputedSectionsHaveBeenSeeded](self, "_ensureComputedSectionsHaveBeenSeeded");
  v8 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  location = self->_computedSections.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v11 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", location);
    v12 = MEMORY[0x1E0C809B0];
    v33 = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke;
    aBlock[3] = &unk_1E58A7F60;
    v29 = v10;
    aBlock[4] = self;
    aBlock[5] = &v30;
    *(CGFloat *)&aBlock[6] = x;
    *(CGFloat *)&aBlock[7] = y;
    *(CGFloat *)&aBlock[8] = width;
    *(CGFloat *)&aBlock[9] = height;
    v13 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
    while (1)
    {
      v14 = v13[2](v13);
      v15 = location > 0 ? v14 : 0;
      if ((v15 & 1) == 0)
        break;
      v16 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", --location);
      v31[3] = (uint64_t)v16;
    }
    v17 = self->_computedSections.location;
    length = self->_computedSections.length;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v27 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", v17 + length - 1);
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke_2;
    v22[3] = &unk_1E58A7F60;
    v23 = v10;
    v22[4] = self;
    v22[5] = &v24;
    *(CGFloat *)&v22[6] = x;
    *(CGFloat *)&v22[7] = y;
    *(CGFloat *)&v22[8] = width;
    *(CGFloat *)&v22[9] = height;
    v19 = (unsigned int (**)(_QWORD))_Block_copy(v22);
    for (i = length + v17;
          v19[2](v19) && (uint64_t)(i - 1) < -[PUSectionedTilingLayout _numberOfSections](self, "_numberOfSections") - 1;
          ++i)
    {
      v21 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", i);
      v25[3] = (uint64_t)v21;
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
}

- (_PUSectionedTilingLayoutSectionInfo)_sectionInfoForSection:(int64_t)a3
{
  _PUSectionedTilingLayoutSectionInfo *sectionInfos;
  _PUSectionedTilingLayoutSectionInfo *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _BOOL4 v22;
  _NSRange *p_computedSections;
  NSUInteger location;
  CGPoint *p_seedSectionOrigin;
  _BOOL4 v26;
  double y;
  double x;
  int64_t j;
  _PUSectionedTilingLayoutSectionInfo *v30;
  NSRange v31;
  PUTilingLayoutInvalidationContext *v32;
  unint64_t v34;
  void *v35;
  _PUSectionedTilingLayoutSectionInfo *v36;
  BOOL v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat width;
  CGFloat height;
  int64_t i;
  _PUSectionedTilingLayoutSectionInfo *v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD aBlock[6];
  NSRange v49;
  NSRange v50;

  if (self->_numberOfSections == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 270, CFSTR("_numberOfSections is NSNotFound, this is indicative of the layout not being prepared yet. Make sure the tiling view has performed a layout pass before asking the layout for information."));

    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  else if ((a3 & 0x8000000000000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section >= 0"));

LABEL_3:
  if (self->_numberOfSections <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < _numberOfSections"));

  }
  sectionInfos = self->_sectionInfos;
  v7 = &sectionInfos[a3];
  if (!v7->var0)
  {
    -[PUSectionedTilingLayout interSectionSpacing](self, "interSectionSpacing");
    v9 = v8;
    v11 = v10;
    if (-[PUSectionedTilingLayout _numberOfSections](self, "_numberOfSections") <= a3)
    {
      v14 = 0;
    }
    else
    {
      -[PUTilingLayout dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "numberOfSubItemsAtIndexPath:", v13);

    }
    if (v14)
      v15 = v11;
    else
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v14)
      v16 = v9;
    else
      v16 = *MEMORY[0x1E0C9D820];
    -[PUSectionedTilingLayout sizeForSection:numberOfItems:](self, "sizeForSection:numberOfItems:", a3, v14, *MEMORY[0x1E0C9D820]);
    v18 = v17;
    v20 = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__PUSectionedTilingLayout__sectionInfoForSection___block_invoke;
    aBlock[3] = &unk_1E58A7F88;
    aBlock[4] = self;
    aBlock[5] = a3;
    v21 = _Block_copy(aBlock);
    v22 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
    p_computedSections = &self->_computedSections;
    location = self->_computedSections.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      p_computedSections->location = a3;
      self->_computedSections.length = 1;
      if (self->_seedSection == a3)
        p_seedSectionOrigin = &self->_seedSectionOrigin;
      else
        p_seedSectionOrigin = (CGPoint *)MEMORY[0x1E0C9D538];
      x = p_seedSectionOrigin->x;
      y = p_seedSectionOrigin->y;
      goto LABEL_24;
    }
    v26 = v22;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    if (location <= a3)
    {
      v34 = self->_computedSections.length + location;
      if (a3 < v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 329, CFSTR("unexpected section"));

LABEL_24:
        v30 = &sectionInfos[a3];
        v30->var1 = v14;
        v30->var2.origin.x = x;
        v30->var2.origin.y = y;
        v30->var2.size.width = v18;
        v30->var2.size.height = v20;
        v7->var0 = 1;
        v49.location = p_computedSections->location;
        v49.length = self->_computedSections.length;
        v50.location = a3;
        v50.length = 1;
        v31 = NSUnionRange(v49, v50);
        p_computedSections->location = v31.location;
        self->_computedSections.length = v31.length;
        v32 = objc_alloc_init(PUTilingLayoutInvalidationContext);
        -[PUTilingLayoutInvalidationContext invalidateContentBounds](v32, "invalidateContentBounds");
        -[PUTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v32);

        return v7;
      }
      (*((void (**)(void *, unint64_t))v21 + 2))(v21, a3 - v34);
      for (i = self->_computedSections.length + p_computedSections->location; i < a3 - 1; ++i)
        -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", i);
      v43 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", a3 - 1);
      v44 = -[PUSectionedTilingLayout _scrollsHorizontallyNotVertically](self, "_scrollsHorizontallyNotVertically");
      v38 = v43->var2.origin.x;
      v39 = v43->var2.origin.y;
      width = v43->var2.size.width;
      height = v43->var2.size.height;
      if (!v44)
      {
        y = v15 + CGRectGetMaxY(*(CGRect *)&v38);
        goto LABEL_24;
      }
      if (!v26)
      {
LABEL_30:
        x = CGRectGetMinX(*(CGRect *)&v38) - v16 - v18;
        goto LABEL_24;
      }
    }
    else
    {
      (*((void (**)(void *, NSUInteger))v21 + 2))(v21, location + ~a3);
      for (j = p_computedSections->location - 1; j > a3 + 1; --j)
        -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", j);
      v36 = -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:", a3 + 1);
      v37 = -[PUSectionedTilingLayout _scrollsHorizontallyNotVertically](self, "_scrollsHorizontallyNotVertically");
      v38 = v36->var2.origin.x;
      v39 = v36->var2.origin.y;
      width = v36->var2.size.width;
      height = v36->var2.size.height;
      if (!v37)
      {
        y = CGRectGetMinY(*(CGRect *)&v38) - v15 - v20;
        goto LABEL_24;
      }
      if (v26)
        goto LABEL_30;
    }
    x = v16 + CGRectGetMaxX(*(CGRect *)&v38);
    goto LABEL_24;
  }
  return v7;
}

- (int64_t)_numberOfSections
{
  int64_t result;
  void *v5;

  result = self->_numberOfSections;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedTilingLayout.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_numberOfSections != NSNotFound"));

    return self->_numberOfSections;
  }
  return result;
}

- (void)invalidateSectionInfos
{
  NSUInteger location;

  location = self->_computedSections.location;
  self->_seedSection = location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
    self->_seedSectionOrigin = (CGPoint)-[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:")[16];
  -[PUSectionedTilingLayout _markAllSectionInfosInvalid](self, "_markAllSectionInfosInvalid");
  self->_computedSections = (_NSRange)xmmword_1AB0EF470;
}

- (void)_invalidateNumberOfSections
{
  self->_numberOfSections = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_markAllSectionInfosInvalid
{
  int64_t numberOfSections;
  _PUSectionedTilingLayoutSectionInfo *sectionInfos;

  numberOfSections = self->_numberOfSections;
  if ((unint64_t)(numberOfSections - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    sectionInfos = self->_sectionInfos;
    do
    {
      sectionInfos->var0 = 0;
      ++sectionInfos;
      --numberOfSections;
    }
    while (numberOfSections);
  }
}

- (CGSize)interSectionSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interSectionSpacing.width;
  height = self->_interSectionSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterSectionSpacing:(CGSize)a3
{
  self->_interSectionSpacing = a3;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

void __50__PUSectionedTilingLayout__sectionInfoForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSRange *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  NSRange *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2 >= 21)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(NSRange **)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromRange(v5[7]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218754;
      v9 = a2;
      v10 = 2112;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Computing at once a lot of missing sections (%li) for %@ (section: %li; computed range: %@)",
        (uint8_t *)&v8,
        0x2Au);

    }
  }
}

BOOL __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double MinY;
  double MinX;
  double MaxX;

  if (!objc_msgSend(*(id *)(a1 + 32), "_scrollsHorizontallyNotVertically"))
  {
    MinY = CGRectGetMinY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16));
    MinX = CGRectGetMinY(*(CGRect *)(a1 + 48));
    return MinY > MinX;
  }
  v2 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v3 = v2[2];
  v4 = v2[3];
  v5 = v2[4];
  v6 = v2[5];
  if (*(_BYTE *)(a1 + 80))
  {
    MinY = CGRectGetMinX(*(CGRect *)&v3);
    MinX = CGRectGetMinX(*(CGRect *)(a1 + 48));
    return MinY > MinX;
  }
  MaxX = CGRectGetMaxX(*(CGRect *)&v3);
  return MaxX < CGRectGetMaxX(*(CGRect *)(a1 + 48));
}

BOOL __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double MaxY;
  double MaxX;
  double MinX;

  if (!objc_msgSend(*(id *)(a1 + 32), "_scrollsHorizontallyNotVertically"))
  {
    MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16));
    MaxX = CGRectGetMaxY(*(CGRect *)(a1 + 48));
    return MaxY < MaxX;
  }
  v2 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v3 = v2[2];
  v4 = v2[3];
  v5 = v2[4];
  v6 = v2[5];
  if (*(_BYTE *)(a1 + 80))
  {
    MaxY = CGRectGetMaxX(*(CGRect *)&v3);
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
    return MaxY < MaxX;
  }
  MinX = CGRectGetMinX(*(CGRect *)&v3);
  return MinX > CGRectGetMinX(*(CGRect *)(a1 + 48));
}

@end
