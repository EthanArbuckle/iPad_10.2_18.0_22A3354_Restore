@implementation _UICollectionLayoutSectionEstimatedSolver

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (NSCollectionLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (CGRect)contentFrameIncludingAuxiliaries
{
  _UICollectionLayoutSolutionState *v2;
  _UICollectionLayoutSolutionState *v3;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  _UICollectionLayoutSectionGeometryTranslator *v5;
  double *p_x;
  double *p_y;
  double *p_width;
  double *p_height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (self)
  {
    v2 = self->_solutionState;
    v3 = v2;
    if (v2)
    {
      sectionGeometryTranslator = v2->_sectionGeometryTranslator;
      goto LABEL_4;
    }
  }
  else
  {
    v3 = 0;
  }
  sectionGeometryTranslator = 0;
LABEL_4:
  v5 = sectionGeometryTranslator;

  p_x = (double *)MEMORY[0x1E0C9D648];
  p_y = (double *)(MEMORY[0x1E0C9D648] + 8);
  p_width = (double *)(MEMORY[0x1E0C9D648] + 16);
  p_height = (double *)(MEMORY[0x1E0C9D648] + 24);
  if (v5)
  {
    p_height = &v5->_contentFrameIncludingAuxiliaries.size.height;
    p_width = &v5->_contentFrameIncludingAuxiliaries.size.width;
    p_y = &v5->_contentFrameIncludingAuxiliaries.origin.y;
    p_x = &v5->_contentFrameIncludingAuxiliaries.origin.x;
  }
  v10 = *p_x;
  v11 = *p_y;
  v12 = *p_width;
  v13 = *p_height;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)sectionSupplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  _UICollectionLayoutAuxillaryItemSolver *sectionSupplementarySolution;
  void *v10;
  void *v11;

  if (objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index>=0"));

    if (self)
      goto LABEL_4;
LABEL_8:
    sectionSupplementarySolution = 0;
    return -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:]((id *)&sectionSupplementarySolution->super.isa, a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  if (a4 < 0)
    goto LABEL_7;
LABEL_3:
  if (!self)
    goto LABEL_8;
LABEL_4:
  sectionSupplementarySolution = self->_sectionSupplementarySolution;
  return -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:]((id *)&sectionSupplementarySolution->super.isa, a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)frameForIndex:(int64_t)a3
{
  _UICollectionLayoutSolutionState *solutionState;
  _UIOrderedRangeIndexer *v6;
  _UICollectionLayoutSolutionState *v7;
  _UICollectionLayoutSolutionState *v8;
  NSArray *bookmarks;
  NSArray *v10;
  _UIOrderedRangeIndexerImpl *ptr;
  id *v12;
  uint64_t v13;
  double *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  _UICollectionLayoutSolutionState *v18;
  _UICollectionLayoutSolutionState *v19;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double *v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double Width;
  double Height;
  _QWORD v36[2];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  if (self && (solutionState = self->_solutionState) != 0)
  {
    v6 = solutionState->_itemRangeIndexer;
    v7 = self->_solutionState;
    v8 = v7;
    if (v7)
      bookmarks = v7->_bookmarks;
    else
      bookmarks = 0;
    v10 = bookmarks;

    if (!v6
      || (ptr = v6->_orderedRangeIndexerImpl.__ptr_,
          v36[0] = 0,
          v36[1] = 0,
          v37 = 0,
          _UIOrderedRangeIndexerImpl::binarySearchForLocation(ptr, a3, (uint64_t)v36),
          v12 = 0,
          v37 != 0x7FFFFFFFFFFFFFFFLL))
    {
      -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (double *)v13;
      if (v13)
      {
        v15 = a3 - *(_QWORD *)(v13 + 24);
        v13 = *(_QWORD *)(v13 + 8);
      }
      else
      {
        v15 = a3;
      }
      -[_UICollectionLayoutItemSolver itemFrames](v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = self->_solutionState;
      v19 = v18;
      if (v18)
        sectionGeometryTranslator = v18->_sectionGeometryTranslator;
      else
        sectionGeometryTranslator = 0;
      v21 = sectionGeometryTranslator;

      v22 = 0.0;
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      v26 = 0.0;
      if (v17)
      {
        v26 = *(double *)(v17 + 64);
        v23 = *(double *)(v17 + 72);
        v24 = *(double *)(v17 + 80);
        v25 = *(double *)(v17 + 88);
      }
      v27 = 0.0;
      if (v21)
      {
        v27 = v21[9];
        v22 = v21[10];
      }

      if (v14)
      {
        v29 = v14[5];
        v28 = v14[6];
      }
      else
      {
        v28 = 0.0;
        v29 = 0.0;
      }
      v30 = v22 + v28;
      v31 = v26 + v27 + v29;
      v32 = v23 + v30;
      v38.origin.x = v26;
      v38.origin.y = v23;
      v38.size.width = v24;
      v38.size.height = v25;
      Width = CGRectGetWidth(v38);
      v39.origin.x = v26;
      v39.origin.y = v23;
      v39.size.width = v24;
      v39.size.height = v25;
      Height = CGRectGetHeight(v39);
      v12 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)v17, (void *)a3, v31, v32, Width, Height);

    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)queryFramesIntersectingRect:(CGRect)a3 frameOffset:(CGPoint)a4
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  _UICollectionLayoutSolutionState *solutionState;
  id v12;
  id v13;
  uint64_t sectionGeometryTranslator;
  double v15;
  double v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _UIRTree *geometricIndexer;
  NSArray *bookmarks;
  unint64_t v25;
  int64_t v26;
  void *v27;
  id v28;
  _QWORD *ptr;
  float64x2_t v30;
  float64x2_t v31;
  _UICollectionLayoutAuxillaryItemSolver *sectionSupplementarySolution;
  void *v33;
  __int128 v35;
  float64_t v36;
  float64_t v37;
  float64_t v38;
  float64_t v39;
  _QWORD v40[4];
  id v41;
  NSArray *v42;
  unint64_t v43;
  float64_t v44;
  float64_t v45;
  float64_t v46;
  float64_t v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  int64_t v52;
  double v53;
  double v54;
  float64x2_t v55[2];
  char v56;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  if (self)
    solutionState = self->_solutionState;
  else
    solutionState = 0;
  v12 = -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  if (solutionState && (objc_msgSend(v12, "_isEmptySection") & 1) == 0)
  {
    sectionGeometryTranslator = (uint64_t)solutionState->_sectionGeometryTranslator;
    v15 = -[_UICollectionLayoutSectionGeometryTranslator contentRectForSectionRect:](sectionGeometryTranslator, v9, v8, width, height);
    v38 = v16;
    v39 = v15;
    v35 = v17;
    v37 = v18;
    if (sectionGeometryTranslator)
    {
      v20 = *(double *)(sectionGeometryTranslator + 72);
      v19 = *(double *)(sectionGeometryTranslator + 80);
    }
    else
    {
      v19 = 0.0;
      v20 = 0.0;
    }
    v21 = x + v20;
    v22 = y + v19;
    bookmarks = solutionState->_bookmarks;
    geometricIndexer = solutionState->_geometricIndexer;
    v25 = -[_UICollectionLayoutSectionEstimatedSolver layoutAxis](self, "layoutAxis", v35);
    v26 = -[_UICollectionLayoutSectionEstimatedSolver frameCount](self, "frameCount");
    v27 = (void *)objc_opt_new();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __85___UICollectionLayoutSectionEstimatedSolver_queryFramesIntersectingRect_frameOffset___block_invoke;
    v40[3] = &unk_1E16B8FF8;
    v42 = bookmarks;
    v43 = v25;
    v44 = v39;
    v45 = v36;
    v46 = v38;
    v47 = v37;
    v48 = v9;
    v49 = v8;
    v50 = width;
    v51 = height;
    v52 = v26;
    v53 = v21;
    v54 = v22;
    v28 = v27;
    v41 = v28;
    if (geometricIndexer)
    {
      v56 = 0;
      ptr = geometricIndexer->_root.__ptr_;
      v31.f64[0] = v38;
      v30.f64[0] = v39;
      v30.f64[1] = v36;
      v31.f64[1] = v37;
      v55[0] = vaddq_f64(v30, vminnmq_f64(v31, (float64x2_t)0));
      v55[1] = vabsq_f64(v31);
      _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(ptr, v55, &v56, (uint64_t)v40);
    }
    if (self)
      sectionSupplementarySolution = self->_sectionSupplementarySolution;
    else
      sectionSupplementarySolution = 0;
    -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:]((uint64_t)sectionSupplementarySolution, v9, v8, width, height, x, y);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
      objc_msgSend(v28, "addObjectsFromArray:", v33);
    v13 = v28;

  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  return v13;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 2;
}

- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  _UICollectionLayoutSolutionState *solutionState;
  double *v9;
  void *v10;
  id *v11;
  id *v12;
  void *v13;
  _UICollectionLayoutSolutionState *v14;
  _UICollectionLayoutSolutionState *v15;
  _UICollectionLayoutSolutionState *v16;
  _UICollectionLayoutSolutionState *v17;
  NSArray *bookmarks;
  NSArray *v19;
  uint64_t v20;
  void *v21;
  _UIOrderedRangeIndexerImpl *v22;
  uint64_t v23;
  _QWORD *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  double v30;
  id *v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  uint64_t v37;

  if (!self || !self->_solutionState)
  {
    v12 = 0;
    return v12;
  }
  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_5;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absoluteIndex >= 0"));

    goto LABEL_5;
  }
  if (a4 < 0)
    goto LABEL_29;
LABEL_5:
  solutionState = self->_solutionState;
  if (solutionState)
    solutionState = (_UICollectionLayoutSolutionState *)solutionState->_sectionGeometryTranslator;
  v9 = solutionState;
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:]((id *)&self->_sectionSupplementarySolution->super.isa, a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = v11;
  }
  else
  {
    -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_solutionState;
    if (v14)
      v14 = (_UICollectionLayoutSolutionState *)v14->_auxillaryRangeIndexerKindDict;
    v15 = v14;
    v16 = self->_solutionState;
    v17 = v16;
    if (v16)
      bookmarks = v16->_bookmarks;
    else
      bookmarks = 0;
    v19 = bookmarks;

    -[_UICollectionLayoutSolutionState objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", a3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
    {
      v22 = *(_UIOrderedRangeIndexerImpl **)(v20 + 8);
      v36[0] = 0;
      v36[1] = 0;
      v37 = 0;
      _UIOrderedRangeIndexerImpl::binarySearchForLocation(v22, a4, (uint64_t)v36);
      v11 = 0;
      v12 = 0;
      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v35 = v13;
        -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (_QWORD *)v23;
        v25 = 0.0;
        if (v23)
        {
          v26 = *(double *)(v23 + 40);
          v27 = *(double *)(v23 + 48);
          v28 = *(id *)(v23 + 8);
          v23 = v24[2];
        }
        else
        {
          v28 = 0;
          v26 = 0.0;
          v27 = 0.0;
        }
        v29 = a4 - objc_msgSend((id)v23, "offsetForElementKind:", a3);
        v30 = 0.0;
        if (v9)
        {
          v30 = v9[9];
          v25 = v9[10];
        }
        -[_UICollectionLayoutItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:](v28, a3, v29, v26 + v30, v27 + v25);
        v31 = (id *)objc_claimAutoreleasedReturnValue();
        v11 = v31;
        if (v31)
          v12 = -[_UICollectionLayoutFramesQueryResult copyWithIndex:](v31, (void *)a4);
        else
          v12 = 0;

        v13 = v35;
      }
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)auxillaryHostLayoutAxis
{
  if (self)
    return *(_QWORD *)(self + 112);
  return self;
}

- (id)auxillaryHostAuxillaryItems
{
  void *v2;
  void *v3;

  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundarySupplementaryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)auxillaryHostSupplementaryEnroller
{
  return objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
}

- (id)auxillaryHostPreferredSizes
{
  if (self)
    self = (_UICollectionLayoutSectionEstimatedSolver *)self->_preferredSizes;
  return self;
}

- (double)auxillaryHostPaddingBeforeBoundarySupplementaries
{
  void *v2;
  double v3;
  double v4;

  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_paddingToBoundarySupplementaries");
    v3 = v4;
  }

  return v3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3
{
  self->_orthogonalScrollingPrefetchingUnitVector = a3;
}

- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9
{
  id v16;
  void *v17;
  int v18;
  unint64_t v19;
  void *v20;
  id v21;

  objc_storeStrong((id *)&self->_container, a3);
  if (a4)
    v16 = a4;
  else
    v16 = a3;
  objc_storeStrong((id *)&self->_supplementaryContainer, v16);
  objc_storeStrong((id *)&self->_traitCollection, a5);
  self->_containerLayoutAxis = a6;
  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "scrollsOrthogonally");
  v19 = a6 == 2;
  if (a6 == 1)
    v19 = 2;
  if (!v18)
    v19 = a6;
  self->_layoutAxis = v19;

  self->_frameCount = a7;
  objc_storeStrong((id *)&self->_preferredSizes, a8);
  self->_layoutRTL = a9;
  +[_UICollectionLayoutSolveParameters parametersForFullResolve]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:](self, "_solveWithParameters:", v20);

  -[_UICollectionLayoutSectionEstimatedSolver _configureInitialOrthogonalPrefetchingUnitVector](self, "_configureInitialOrthogonalPrefetchingUnitVector");
}

- (id)initWithLayoutSection:(void *)a1
{
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  __int128 v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)_UICollectionLayoutSectionEstimatedSolver;
  v3 = (id *)objc_msgSendSuper2(&v9, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 2, a2);
    v4[5] = 0;
    if ((objc_msgSend(a2, "_isEmptySection") & 1) == 0)
    {
      objc_msgSend(a2, "group");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v4 + 9) = objc_msgSend(v6, "isContainerSize") ^ 1;

    }
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *((_OWORD *)v4 + 10) = *MEMORY[0x1E0C9D628];
    *((_OWORD *)v4 + 11) = v7;
  }
  objc_msgSend(v4[2], "_checkForDuplicateSupplementaryItemKindsAndThrowIfFound");
  return v4;
}

- (unint64_t)containerSizeDependentAxes
{
  return self->_containerSizeDependentAxes;
}

- (void)_configureInitialOrthogonalPrefetchingUnitVector
{
  _BOOL4 v3;
  double v4;
  double v5;
  unint64_t layoutAxis;
  double v7;

  v3 = -[NSCollectionLayoutSection scrollsOrthogonally](self->_layoutSection, "scrollsOrthogonally");
  v4 = 0.0;
  v5 = 0.0;
  if (v3)
  {
    layoutAxis = self->_layoutAxis;
    v5 = 1.0;
    if (layoutAxis == 2)
      v7 = 1.0;
    else
      v7 = 0.0;
    if (layoutAxis != 1)
    {
      v4 = v7;
      v5 = 0.0;
    }
  }
  -[_UICollectionLayoutSectionEstimatedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v4, v5);
}

- (void)_updateSolutionAuxillaryRangeIndexerKindDict:(id)a3 fromBookmark:(id)a4
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  if (a4)
  {
    if (a3)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1060, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solutionAuxillaryRangeIndexerKindDict"));

    if (a4)
      goto LABEL_4;
LABEL_8:
    v8 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solutionBookmark"));

  if (!a3)
    goto LABEL_7;
LABEL_3:
  if (!a4)
    goto LABEL_8;
LABEL_4:
  v8 = (void *)*((_QWORD *)a4 + 2);
LABEL_5:
  v9 = v8;
  objc_msgSend(v9, "elementKinds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103___UICollectionLayoutSectionEstimatedSolver__updateSolutionAuxillaryRangeIndexerKindDict_fromBookmark___block_invoke;
  v14[3] = &unk_1E16B9228;
  v15 = v9;
  v16 = a3;
  v13 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (void)setOrthogonalOffset:(CGPoint)a3
{
  unint64_t layoutAxis;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double x;
  double y;
  BOOL v12;
  BOOL v13;
  double v14;

  layoutAxis = self->_layoutAxis;
  if (layoutAxis == 1)
    v5 = 2;
  else
    v5 = layoutAxis == 2;
  v6 = _UISetPointValueForAxis(v5, a3.x, a3.y, 0.0);
  v8 = v7;
  v9 = 1.0;
  x = self->_orthogonalOffset.x;
  y = self->_orthogonalOffset.y;
  v12 = v6 < x;
  v13 = v6 <= x;
  v14 = -1.0;
  if (!v12)
    v14 = 0.0;
  if (!v13)
    v14 = 1.0;
  if (v8 <= y)
  {
    v9 = 0.0;
    if (v8 < y)
      v9 = -1.0;
  }
  -[_UICollectionLayoutSectionEstimatedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v14, v9);
  self->_orthogonalOffset.x = v6;
  self->_orthogonalOffset.y = v8;
}

- (CGPoint)orthogonalOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_orthogonalOffset.x;
  y = self->_orthogonalOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGVector)orthogonalScrollingPrefetchingUnitVector
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_orthogonalScrollingPrefetchingUnitVector.dx;
  dy = self->_orthogonalScrollingPrefetchingUnitVector.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[_UICollectionLayoutSectionEstimatedSolver _sectionContainer](self, "_sectionContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutSectionEstimatedSolver traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_effectiveSizeForContainer:displayScale:ignoringInsets:", v5, 0, v8);
  v13 = v12;
  v15 = v14;

  v16 = _UISizeValueForAxis(a3, v13, v15);
  return v16;
}

- (id)auxillaryHostContainer
{
  _UICollectionLayoutContainer *v3;
  unint64_t containerLayoutAxis;
  uint64_t v5;
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
  _UICollectionLayoutContainer *v16;
  _UICollectionLayoutContainer *v17;
  double v18;
  double v19;
  void *memoizedSupplementaryHostContainer;

  if (!self || (v3 = self->_memoizedSupplementaryHostContainer) == 0)
  {
    if (-[NSCollectionLayoutSection supplementariesFollowContentInsets](self->_layoutSection, "supplementariesFollowContentInsets"))
    {
      containerLayoutAxis = self->_containerLayoutAxis;
      if (containerLayoutAxis == 1)
        v5 = 2;
      else
        v5 = containerLayoutAxis == 2;
      -[NSCollectionLayoutSection contentInsets](self->_layoutSection, "contentInsets");
      if (v5 == 2)
        v10 = 0.0;
      else
        v10 = v9;
      if (v5 == 2)
        v11 = 0.0;
      else
        v11 = v7;
      if (v5 == 1)
        v8 = 0.0;
      else
        v9 = v10;
      if (v5 == 1)
        v6 = 0.0;
      else
        v7 = v11;
      if (v5)
        v12 = v9;
      else
        v12 = 0.0;
      if (v5)
        v13 = v8;
      else
        v13 = 0.0;
      if (v5)
        v14 = v7;
      else
        v14 = 0.0;
      if (v5)
        v15 = v6;
      else
        v15 = 0.0;
      v16 = [_UICollectionLayoutContainer alloc];
      -[_UICollectionLayoutSectionEstimatedSolver supplementaryContainer](self, "supplementaryContainer");
      v17 = (_UICollectionLayoutContainer *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionLayoutContainer contentSize](v17, "contentSize");
      memoizedSupplementaryHostContainer = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v16, v18, v19, v15, v14, v13, v12);
      objc_storeStrong((id *)&self->_memoizedSupplementaryHostContainer, memoizedSupplementaryHostContainer);
    }
    else
    {
      -[_UICollectionLayoutSectionEstimatedSolver supplementaryContainer](self, "supplementaryContainer");
      v17 = (_UICollectionLayoutContainer *)(id)objc_claimAutoreleasedReturnValue();
      memoizedSupplementaryHostContainer = self->_memoizedSupplementaryHostContainer;
      self->_memoizedSupplementaryHostContainer = v17;
    }

    v3 = self->_memoizedSupplementaryHostContainer;
  }
  return v3;
}

- (CGSize)auxillaryHostContentSize
{
  uint64_t v3;
  _UICollectionLayoutSolutionState *v4;
  _UICollectionLayoutSolutionState *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  if (self && self->_solutionState)
  {
    v3 = -[_UICollectionLayoutSectionEstimatedSolver layoutAxis](self, "layoutAxis");
    v4 = self->_solutionState;
    v5 = v4;
    if (v4)
      v4 = (_UICollectionLayoutSolutionState *)v4->_sectionGeometryTranslator;
    v6 = -[_UICollectionLayoutSectionGeometryTranslator auxillaryHostContentSize]((uint64_t)v4);
    v8 = v7;

    -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "scrollsOrthogonally");
    v11 = v3 == 2;
    if (v3 == 1)
      v11 = 2;
    if (!v10)
      v3 = v11;
    -[_UICollectionLayoutSectionEstimatedSolver supplementaryContainer](self, "supplementaryContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentSize");
    v15 = _UISizeValueForAxis(v3, v13, v14);

    v16 = _UISetSizeValueForAxis(v3, v6, v8, v15);
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (_UICollectionLayoutContainer)supplementaryContainer
{
  return self->_supplementaryContainer;
}

- (id)_sectionContainer
{
  void *v4;
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
  void *v18;
  _UICollectionLayoutContainer *v19;
  void *v20;
  double v21;
  double v22;
  double *v23;

  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutSectionEstimatedSolver container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (-[_UICollectionLayoutSectionEstimatedSolver layoutAxis](self, "layoutAxis") == 2)
  {
    objc_msgSend(v4, "contentInsets");
    v9 = v9 + v14;
    objc_msgSend(v4, "contentInsets");
    v13 = v13 + v15;
  }
  else if (-[_UICollectionLayoutSectionEstimatedSolver layoutAxis](self, "layoutAxis") == 1)
  {
    objc_msgSend(v4, "contentInsets");
    v7 = v7 + v16;
    objc_msgSend(v4, "contentInsets");
    v11 = v11 + v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1051, CFSTR("Unknown layout axis."));

  }
  v19 = [_UICollectionLayoutContainer alloc];
  -[_UICollectionLayoutSectionEstimatedSolver container](self, "container");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentSize");
  v23 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v19, v21, v22, v7, v9, v11, v13);

  return v23;
}

- (_UICollectionLayoutContainer)container
{
  return self->_container;
}

- (CGRect)primaryContentFrame
{
  _UICollectionLayoutSolutionState *v2;
  _UICollectionLayoutSolutionState *v3;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  _UICollectionLayoutSectionGeometryTranslator *v5;
  double *p_x;
  double *p_y;
  double *p_width;
  double *p_height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (self)
  {
    v2 = self->_solutionState;
    v3 = v2;
    if (v2)
    {
      sectionGeometryTranslator = v2->_sectionGeometryTranslator;
      goto LABEL_4;
    }
  }
  else
  {
    v3 = 0;
  }
  sectionGeometryTranslator = 0;
LABEL_4:
  v5 = sectionGeometryTranslator;

  p_x = (double *)MEMORY[0x1E0C9D648];
  p_y = (double *)(MEMORY[0x1E0C9D648] + 8);
  p_width = (double *)(MEMORY[0x1E0C9D648] + 16);
  p_height = (double *)(MEMORY[0x1E0C9D648] + 24);
  if (v5)
  {
    p_height = &v5->_primaryContentFrame.size.height;
    p_width = &v5->_primaryContentFrame.size.width;
    p_y = &v5->_primaryContentFrame.origin.y;
    p_x = &v5->_primaryContentFrame.origin.x;
  }
  v10 = *p_x;
  v11 = *p_y;
  v12 = *p_width;
  v13 = *p_height;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (_NSRange)_rangeOfBookmarksAffectedByResolveItems:(id)a3
{
  _UICollectionLayoutSolutionState *solutionState;
  _UICollectionLayoutSolutionState **p_solutionState;
  _UICollectionLayoutSolutionState *v8;
  _UICollectionLayoutSolutionState *v9;
  _UICollectionLayoutSolutionState *v10;
  NSDictionary *auxillaryRangeIndexerKindDict;
  NSDictionary *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _UICollectionLayoutSolutionState *v16;
  id v17;
  void *v18;
  NSDictionary *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  NSDictionary *v32;
  id v33;
  _UICollectionLayoutSectionEstimatedSolver *v34;
  id v35;
  SEL v36;
  _QWORD v37[4];
  _UICollectionLayoutSolutionState *v38;
  id v39;
  _NSRange result;

  if (a3)
  {
    if (self)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 981, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solutionState"));

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 980, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolveItems"));

  if (!self)
    goto LABEL_15;
LABEL_3:
  p_solutionState = &self->_solutionState;
  solutionState = self->_solutionState;
  if (solutionState)
  {
LABEL_4:
    solutionState = (_UICollectionLayoutSolutionState *)solutionState->_itemRangeIndexer;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 981, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solutionState"));

  if (!self)
  {
LABEL_21:
    v10 = 0;
    v8 = 0;
    goto LABEL_22;
  }
  p_solutionState = &self->_solutionState;
  solutionState = self->_solutionState;
  if (solutionState)
    goto LABEL_4;
LABEL_5:
  v8 = solutionState;
  v9 = *p_solutionState;
  v10 = v9;
  if (v9)
  {
    auxillaryRangeIndexerKindDict = v9->_auxillaryRangeIndexerKindDict;
    goto LABEL_7;
  }
LABEL_22:
  auxillaryRangeIndexerKindDict = 0;
LABEL_7:
  v12 = auxillaryRangeIndexerKindDict;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 985, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemRangeIndexer"));

    if (v12)
      goto LABEL_9;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxillaryRangeIndexerKindDict"));

    goto LABEL_9;
  }
  if (!v12)
    goto LABEL_17;
LABEL_9:
  v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[UIBarButtonItemGroup _items]((id *)a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke;
  v37[3] = &unk_1E16B2978;
  v16 = v8;
  v38 = v16;
  v17 = v13;
  v39 = v17;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", v37);

  -[_UICollectionLayoutSolveResult invalidatedAuxillaryKinds]((uint64_t)a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_2;
  v31[3] = &unk_1E16B9200;
  v19 = v12;
  v32 = v19;
  v33 = a3;
  v36 = a2;
  v34 = self;
  v20 = v17;
  v35 = v20;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v31);

  if (objc_msgSend(v20, "count")
    && (v21 = objc_msgSend(v20, "firstIndex"), v22 = objc_msgSend(v20, "lastIndex"), v22 >= v21))
  {
    v23 = v22 - v21 + 1;
  }
  else
  {
    v23 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v24 = v21;
  v25 = v23;
  result.length = v25;
  result.location = v24;
  return result;
}

- (id)_solveWithParameters:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  _UICollectionLayoutSolutionState *v7;
  _UICollectionLayoutSolutionState *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  BOOL v28;
  NSUInteger frameCount;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _UIOrderedRangeIndexer *v47;
  id v48;
  uint64_t v49;
  _UICollectionEstimatedSolutionBookmark *v50;
  uint64_t v51;
  char **v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  _UICollectionEstimatedSolutionBookmark *v67;
  double v68;
  double v69;
  NSUInteger v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  id v74;
  unint64_t v75;
  uint64_t v76;
  _UICollectionLayoutAuxillaryOffsets *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  _QWORD *v82;
  void *v83;
  void *v84;
  _UICollectionLayoutAuxillaryOffsets *v85;
  _UICollectionLayoutAuxillaryOffsets *supplementaryOffsets;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  _NSRange itemRange;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  uint64_t v96;
  NSUInteger v97;
  NSUInteger v98;
  NSUInteger length;
  _UICollectionLayoutAuxillaryOffsets *v100;
  _UICollectionLayoutAuxillaryOffsets *v101;
  double MaxX;
  double MaxY;
  double v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  double v117;
  double v118;
  double v119;
  uint64_t containerLayoutAxis;
  _UICollectionLayoutSectionGeometryTranslator *v121;
  _BOOL4 layoutRTL;
  double v123;
  double v124;
  double v125;
  double v126;
  char *v127;
  int v128;
  _UICollectionLayoutSolutionState *v129;
  _UICollectionLayoutSectionEstimatedSolver *v130;
  _BOOL4 IsEmpty;
  _UICollectionLayoutSupplementaryEnroller *v132;
  uint64_t v133;
  double *v134;
  int v135;
  double v136;
  double v137;
  _UICollectionLayoutSectionGeometryTranslator *v138;
  _BOOL4 v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  char *v148;
  uint64_t k;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  char *v155;
  void *v156;
  id v157;
  id v158;
  id v159;
  double v160;
  double v161;
  void (**v162)(void);
  void (**v163)(void);
  void (**v164)(void);
  void (**v165)(void);
  id *location;
  void *v167;
  NSUInteger v168;
  _UICollectionPreferredSizes *v169;
  void *v170;
  id v171;
  id obj;
  double v173;
  double v174;
  uint64_t v175;
  double v176;
  double v177;
  uint64_t v178;
  uint64_t v179;
  int v180;
  _UICollectionLayoutAuxillaryOffsets *v181;
  id v182;
  _UIRTree *v183;
  uint64_t v184;
  uint64_t layoutAxis;
  void *v186;
  _UICollectionLayoutSolveResult *v187;
  _BYTE v188[32];
  _UIOrderedRangeIndexer *v189;
  char v190;
  id v191;
  void *v192;
  uint64_t v193;
  _UICollectionEstimatedSolutionBookmark *v195;
  _UICollectionLayoutSectionEstimatedSolver *v196;
  void *v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  _QWORD v208[4];
  id v209;
  uint64_t *v210;
  _QWORD v211[7];
  _QWORD v212[5];
  id v213;
  uint64_t *v214;
  _QWORD *v215;
  _QWORD *v216;
  _QWORD *v217;
  _QWORD *v218;
  uint64_t v219;
  uint64_t v220;
  _QWORD v221[5];
  id v222;
  uint64_t v223;
  uint64_t v224;
  _QWORD v225[4];
  id v226;
  uint64_t *v227;
  _QWORD v228[8];
  __int128 v229;
  uint64_t v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  uint64_t v247;
  _QWORD v248[9];
  _QWORD v249[6];
  id v250;
  _QWORD *v251;
  _QWORD *v252;
  uint64_t *v253;
  _QWORD *v254;
  _QWORD *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  double v259;
  uint64_t v260;
  _QWORD v261[4];
  id v262;
  _QWORD v263[6];
  _QWORD v264[6];
  id v265;
  uint64_t *v266;
  _QWORD *v267;
  uint64_t v268;
  double v269;
  uint64_t v270;
  _QWORD v271[7];
  id v272;
  _QWORD *v273;
  uint64_t *v274;
  char v275;
  _QWORD aBlock[5];
  id v277;
  _QWORD *v278;
  uint64_t v279;
  _QWORD v280[5];
  id v281;
  _QWORD v282[5];
  _UICollectionLayoutAuxillaryOffsets *v283;
  uint64_t v284;
  uint64_t *v285;
  uint64_t v286;
  uint64_t (*v287)(uint64_t, uint64_t);
  void (*v288)(uint64_t);
  id v289;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  NSUInteger v293;
  uint64_t v294;
  uint64_t *v295;
  uint64_t v296;
  uint64_t v297;
  _QWORD v298[3];
  char v299;
  _QWORD v300[4];
  _QWORD v301[4];
  _QWORD v302[4];
  objc_super v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  _BYTE v308[128];
  _BYTE v309[128];
  objc_super v310;
  uint64_t v311;
  _NSRange v312;
  _NSRange v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;

  v311 = *MEMORY[0x1E0C80C00];
  v187 = objc_alloc_init(_UICollectionLayoutSolveResult);
  v196 = self;
  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isEmptySection");

  if ((v5 & 1) != 0)
    return v187;
  layoutAxis = v196->_layoutAxis;
  -[_UICollectionLayoutContainer contentSize](v196->_container, "contentSize");
  -[_UICollectionLayoutSectionEstimatedSolver _sectionContainer](v196, "_sectionContainer");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v196->_preferredSizes;
  -[NSCollectionLayoutSection group](v196->_layoutSection, "group");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "layoutSize");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v167, "_axesUniformAcrossSiblings");
  if (v6)
    v180 = objc_msgSend(v170, "containsEstimatedSizeItem");
  else
    v180 = 0;
  v302[0] = 0;
  v302[1] = v302;
  v302[2] = 0x2020000000;
  v302[3] = 0;
  v301[0] = 0;
  v301[1] = v301;
  v301[2] = 0x2020000000;
  v301[3] = 0x7FFFFFFFFFFFFFFFLL;
  v300[0] = 0;
  v300[1] = v300;
  v300[2] = 0x2020000000;
  v300[3] = 0x7FFFFFFFFFFFFFFFLL;
  v298[0] = 0;
  v298[1] = v298;
  v298[2] = 0x2020000000;
  v299 = 0;
  location = (id *)&v196->_solutionState;
  v7 = v196->_solutionState;
  if (v7)
  {
    v8 = v7;
    if (v6)
    {
      v9 = v7->_bookmarks;
      v184 = -[NSArray count](v9, "count");

      v10 = 0;
LABEL_9:
      v12 = -[_UICollectionPreferredSizes largestItemSize]((uint64_t)v196->_preferredSizes);
      v14 = v13;
      objc_msgSend(v170, "subitems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") == 1;

      goto LABEL_16;
    }
    if (a3 && (objc_msgSend(*((id *)a3 + 1), "count") || objc_msgSend(*((id *)a3 + 2), "count")))
    {
      v10 = -[_UICollectionLayoutSectionEstimatedSolver _rangeOfBookmarksAffectedByResolveItems:](v196, "_rangeOfBookmarksAffectedByResolveItems:", a3);
      v11 = v17;
    }
    else
    {
      v11 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v184 = 0;
    v11 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6)
      goto LABEL_9;
  }
  v16 = 0;
  v12 = *MEMORY[0x1E0C9D820];
  v14 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  v184 = v11;
LABEL_16:
  objc_msgSend(v170, "subitems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!(_DWORD)v16)
  {
    v26 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widthDimension");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEstimated");
  if (v23
    && (objc_msgSend(v21, "widthDimension"),
        v16 = objc_claimAutoreleasedReturnValue(),
        (objc_msgSend((id)v16, "isUniformAcrossSiblings") & 1) == 0))
  {

    v26 = 0;
  }
  else
  {
    objc_msgSend(v21, "heightDimension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEstimated"))
    {
      objc_msgSend(v21, "heightDimension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = objc_msgSend(v25, "isUniformAcrossSiblings");

      if ((v23 & 1) != 0)
      if ((v190 & 1) == 0)
      {
        v26 = 0;
        goto LABEL_35;
      }
    }
    else
    {

      if (v23)
    }
    v27 = objc_msgSend(v167, "_axesUniformAcrossSiblings");
    objc_msgSend(v20, "auxillaryItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
      v28 = 0;
    else
      v28 = v27 == v6;
    v26 = v28;
  }

LABEL_35:
LABEL_36:

  frameCount = v196->_frameCount;
  v294 = 0;
  v295 = &v294;
  v296 = 0x2020000000;
  v297 = 0;
  v290 = 0;
  v291 = &v290;
  v292 = 0x2020000000;
  v168 = frameCount;
  v293 = frameCount;
  v284 = 0;
  v285 = &v284;
  v286 = 0x3032000000;
  v287 = __Block_byref_object_copy__32;
  v288 = __Block_byref_object_dispose__32;
  v289 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v282[0] = 0;
  v282[1] = v282;
  v282[2] = 0x3032000000;
  v282[3] = __Block_byref_object_copy__32;
  v282[4] = __Block_byref_object_dispose__32;
  v283 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
  v280[0] = 0;
  v280[1] = v280;
  v280[2] = 0x3032000000;
  v280[3] = __Block_byref_object_copy__32;
  v280[4] = __Block_byref_object_dispose__32;
  v281 = 0;
  v30 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke;
  aBlock[3] = &unk_1E16B9020;
  v278 = v280;
  aBlock[4] = v196;
  v31 = v192;
  v277 = v31;
  v279 = layoutAxis;
  v271[0] = v30;
  v271[1] = 3221225472;
  v271[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_2;
  v271[3] = &unk_1E16B9048;
  v275 = v26;
  v32 = _Block_copy(aBlock);
  v273 = v282;
  v274 = &v294;
  v271[4] = v196;
  v271[5] = v169;
  v272 = v32;
  v271[6] = a3;
  v33 = _Block_copy(v271);
  v264[0] = v30;
  v264[1] = 3221225472;
  v264[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_3;
  v264[3] = &unk_1E16B9070;
  v264[4] = v196;
  v264[5] = v169;
  v266 = &v294;
  v267 = v282;
  v34 = v31;
  v265 = v34;
  v268 = layoutAxis;
  v269 = v12;
  v270 = v14;
  v163 = (void (**)(void))_Block_copy(v264);
  v263[0] = v30;
  v263[1] = 3221225472;
  v263[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_4;
  v263[3] = &unk_1E16B9098;
  v263[5] = v300;
  v263[4] = v196;
  v162 = (void (**)(void))_Block_copy(v263);
  v261[0] = v30;
  v261[1] = 3221225472;
  v261[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_5;
  v261[3] = &unk_1E16B90C0;
  v159 = v32;
  v262 = v159;
  v164 = (void (**)(void))_Block_copy(v261);
  v249[0] = v30;
  v249[1] = 3221225472;
  v249[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_6;
  v249[3] = &unk_1E16B90E8;
  v256 = v10;
  v257 = v184;
  v251 = v302;
  v252 = v301;
  v249[4] = v196;
  v249[5] = v169;
  v253 = &v294;
  v254 = v282;
  v258 = layoutAxis;
  v259 = v12;
  v260 = v14;
  v157 = v34;
  v250 = v157;
  v255 = v298;
  v165 = (void (**)(void))_Block_copy(v249);
  v248[0] = v30;
  v248[1] = 3221225472;
  v248[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_7;
  v248[3] = &unk_1E16B9110;
  v248[5] = &v290;
  v248[4] = v196;
  v248[6] = v282;
  v248[7] = &v294;
  v248[8] = &v284;
  v35 = _Block_copy(v248);
  v229 = xmmword_1866799D0;
  v246 = 0u;
  v231 = 0u;
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  v235 = 0u;
  v236 = 0u;
  v237 = 0u;
  v238 = 0u;
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  v243 = 0u;
  v244 = 0u;
  v245 = 0u;
  v230 = 1;
  v247 = 0;
  v228[0] = v30;
  v228[1] = 3221225472;
  v228[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_8;
  v228[3] = &unk_1E16B9138;
  v228[5] = v168;
  v228[4] = a3;
  v228[6] = v10;
  v228[7] = v184;
  *((_QWORD *)&v234 + 1) = _Block_copy(v228);
  v225[0] = v30;
  v225[1] = 3221225472;
  v225[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_9;
  v225[3] = &unk_1E16B9160;
  v227 = &v290;
  v36 = v33;
  v226 = v36;
  *((_QWORD *)&v236 + 1) = _Block_copy(v225);
  v221[0] = v30;
  v221[1] = 3221225472;
  v221[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_10;
  v221[3] = &unk_1E16B9188;
  v224 = v184;
  v223 = v10;
  v221[4] = v196;
  v171 = v35;
  v222 = v171;
  *((_QWORD *)&v237 + 1) = _Block_copy(v221);
  v212[0] = v30;
  v212[1] = 3221225472;
  v212[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_11;
  v212[3] = &unk_1E16B91B0;
  v214 = &v290;
  v215 = v302;
  v220 = v184;
  v219 = v10;
  v216 = v298;
  v37 = v36;
  v213 = v37;
  v212[4] = v196;
  v217 = v301;
  v218 = v300;
  *((_QWORD *)&v238 + 1) = _Block_copy(v212);
  v211[0] = v30;
  v211[1] = 3221225472;
  v211[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_12;
  v211[3] = &unk_1E16B91D8;
  v211[6] = v300;
  v211[5] = &v290;
  v211[4] = v196;
  *((_QWORD *)&v240 + 1) = _Block_copy(v211);
  v208[0] = v30;
  v208[1] = 3221225472;
  v208[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_13;
  v208[3] = &unk_1E16B9160;
  v210 = &v290;
  v158 = v37;
  v209 = v158;
  v38 = 1;
  *((_QWORD *)&v242 + 1) = _Block_copy(v208);
  v207 = 1;
  while (2)
  {
    handleEvent(&v229, v38, 0, 0, &v207);
    v38 = v207;
    switch(v207)
    {
      case 2:
        v163[2]();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v171 + 2))(v171, v39);
        goto LABEL_44;
      case 3:
        v165[2]();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v171 + 2))(v171, v39);
        goto LABEL_44;
      case 4:
        v162[2]();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v171 + 2))(v171, v39);
        goto LABEL_44;
      case 5:
        v164[2]();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v171 + 2))(v171, v39);
        goto LABEL_44;
      case 6:
        goto LABEL_45;
      case 7:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v196, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 783, CFSTR("Estimated section solver state machine failure. Please file a radar on UICollectionView."));

        goto LABEL_43;
      default:
LABEL_43:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v196, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 813, CFSTR("Unexpected state while performing resolve."));

        v39 = 0;
LABEL_44:

        if (v38 != 6)
          continue;
LABEL_45:
        -[_UICollectionLayoutSectionEstimatedSolver layoutSection](v196, "layoutSection");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "interGroupSpacing");
        v43 = *MEMORY[0x1E0C9D538];
        v42 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v45 = _UISetPointValueForAxis(layoutAxis, *MEMORY[0x1E0C9D538], v42, v44);
        v176 = v46;
        v177 = v45;
        v183 = objc_alloc_init(_UIRTree);
        v189 = objc_alloc_init(_UIOrderedRangeIndexer);
        v47 = objc_alloc_init(_UIOrderedRangeIndexer);
        v181 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
        v182 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v295[3] = 0;
        v291[3] = v168;
        v48 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v191 = (id)objc_msgSend(v48, "initWithCapacity:", objc_msgSend((id)v285[5], "count"));
        v196->_containerSizeDependentAxes = 0;
        v205 = 0u;
        v206 = 0u;
        v203 = 0u;
        v204 = 0u;
        obj = (id)v285[5];
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v309, 16);
        *(_QWORD *)v188 = *MEMORY[0x1E0C9D648];
        *(_QWORD *)&v188[8] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
        *(_QWORD *)&v188[16] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
        *(_QWORD *)&v188[24] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
        v160 = v42;
        v161 = v43;
        if (v49)
        {
          v178 = v49;
          v50 = 0;
          v179 = *(_QWORD *)v204;
          v51 = 2;
          if (layoutAxis != 1)
            v51 = layoutAxis == 2;
          v175 = v51;
          v52 = &selRef__screenInterfaceOrientationChanged_;
          v173 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          v174 = *MEMORY[0x1E0C9D820];
          do
          {
            v193 = 0;
            v195 = v50;
            v155 = v52[76];
            do
            {
              if (*(_QWORD *)v204 != v179)
                objc_enumerationMutation(obj);
              if (v291[3] < 1)
              {
                v50 = v195;
                goto LABEL_131;
              }
              v53 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * v193);
              if (v195)
                v54 = v177;
              else
                v54 = -0.0;
              if (v195)
                v55 = v176;
              else
                v55 = -0.0;
              -[_UICollectionLayoutItemSolver layoutFrame](*(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * v193));
              v57 = v56;
              v59 = v58;
              v60 = -[_UICollectionLayoutItemSolver offsetForEdgeSpacing](v53);
              v62 = _UIPointValueForAxis(v175, v60, v61);
              v63 = _UISetSizeValueForAxis(v175, v174, v173, v62);
              v65 = v64;
              -[_UICollectionLayoutItemSolver supplementaryOffsets]((_QWORD **)v53);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "offsetsByApplyingOffsets:", v181);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UICollectionLayoutAuxillaryOffsets incrementCountsFromOffsets:]((id *)&v181->super.isa, v66);
              v186 = v66;
              v67 = [_UICollectionEstimatedSolutionBookmark alloc];
              v68 = v43 + v54;
              v69 = v42 + v55;
              if (v67)
              {
                v70 = v295[3];
                v71 = v291[3];
                if (!v53)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "handleFailureInMethod:object:file:lineNumber:description:", v155, v67, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solution"));

                }
                if (v71 <= 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "handleFailureInMethod:object:file:lineNumber:description:", v155, v67, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxItemFrameCount > 0"));

                }
                if (!v198)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "handleFailureInMethod:object:file:lineNumber:description:", v155, v67, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryOffsets"));

                }
                if (v53 && (v72 = *(_QWORD *)(v53 + 48)) != 0)
                  v73 = *(_QWORD *)(v72 + 56);
                else
                  v73 = 0;
                v303.receiver = v67;
                v303.super_class = (Class)_UICollectionEstimatedSolutionBookmark;
                v74 = -[_UICollectionLayoutSectionEstimatedSolver init](&v303, sel_init);
                v67 = (_UICollectionEstimatedSolutionBookmark *)v74;
                if (v74)
                {
                  if (v73 >= v71)
                    v75 = v71;
                  else
                    v75 = v73;
                  objc_storeStrong((id *)v74 + 1, (id)v53);
                  v67->_solutionFrame.origin.x = v68;
                  v67->_solutionFrame.origin.y = v69;
                  v67->_solutionFrame.size.width = v57;
                  v67->_solutionFrame.size.height = v59;
                  v67->_itemRange.location = v70;
                  v67->_itemRange.length = v75;
                  if (v53 && (v76 = *(_QWORD *)(v53 + 48)) != 0 && v75 < *(_QWORD *)(v76 + 56))
                  {
                    v77 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
                    -[_UICollectionLayoutItemSolver queryFramesWithItemLimit:]((void *)v53, v75);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v307 = 0u;
                    v306 = 0u;
                    v305 = 0u;
                    v304 = 0u;
                    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v304, &v310, 16);
                    if (v79)
                    {
                      v80 = *(_QWORD *)v305;
                      do
                      {
                        for (i = 0; i != v79; ++i)
                        {
                          if (*(_QWORD *)v305 != v80)
                            objc_enumerationMutation(v78);
                          v82 = *(_QWORD **)(*((_QWORD *)&v304 + 1) + 8 * i);
                          if (v82 && (v82[4] & 0xFFFFFFFFFFFFFFFELL) == 2)
                          {
                            -[_UICollectionLayoutFramesQueryResult auxillaryItem](v82);
                            v83 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v83, "elementKind");
                            v84 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UICollectionLayoutAuxillaryOffsets incrementCountForElementKind:]((uint64_t)v77, v84);

                          }
                        }
                        v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v304, &v310, 16);
                      }
                      while (v79);
                    }
                    -[_UICollectionLayoutAuxillaryOffsets offsetsByRebasingOnOffsets:](v77, "offsetsByRebasingOnOffsets:", v198);
                    v85 = (_UICollectionLayoutAuxillaryOffsets *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v85 = v198;
                  }
                  supplementaryOffsets = v67->_supplementaryOffsets;
                  v67->_supplementaryOffsets = v85;

                }
              }
              if (v53)
                v87 = *(_QWORD *)(v53 + 40);
              else
                v87 = 0;
              v196->_containerSizeDependentAxes |= v87;
              v88 = objc_msgSend(v191, "count");
              objc_msgSend(v191, "addObject:", v67);
              v89 = v57 + v63;
              v90 = v59 + v65;
              -[_UIRTree insertFrame:forIndex:](v183, v88, v68, v69, v89, v90);
              if (v67)
              {
                itemRange = v67->_itemRange;
              }
              else
              {
                itemRange.length = 0;
                itemRange.location = 0;
              }
              if (v189)
                _UIOrderedRangeIndexerImpl::appendRange(v189->_orderedRangeIndexerImpl.__ptr_, itemRange);
              if ((v180 & 1) == 0)
              {
                v201 = 0u;
                v202 = 0u;
                v199 = 0u;
                v200 = 0u;
                -[_UICollectionLayoutItemSolver preferredSizeGroupingRanges]((_QWORD *)v53);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v199, v308, 16);
                if (v93)
                {
                  v94 = *(_QWORD *)v200;
                  do
                  {
                    for (j = 0; j != v93; ++j)
                    {
                      if (*(_QWORD *)v200 != v94)
                        objc_enumerationMutation(v92);
                      v96 = objc_msgSend(*(id *)(*((_QWORD *)&v199 + 1) + 8 * j), "rangeValue");
                      if (v47)
                      {
                        v312.length = v97;
                        v312.location = v295[3] + v96;
                        _UIOrderedRangeIndexerImpl::appendRange(v47->_orderedRangeIndexerImpl.__ptr_, v312);
                      }
                    }
                    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v199, v308, 16);
                  }
                  while (v93);
                }

              }
              -[_UICollectionLayoutSectionEstimatedSolver _updateSolutionAuxillaryRangeIndexerKindDict:fromBookmark:](v196, "_updateSolutionAuxillaryRangeIndexerKindDict:fromBookmark:", v182, v67);
              if (v184)
              {
                if (v67)
                {
                  v98 = v67->_itemRange.location;
                  length = v67->_itemRange.length;
                }
                else
                {
                  length = 0;
                  v98 = 0;
                }
                if (v187)
                  -[NSMutableIndexSet addIndexesInRange:](v187->_invalidatedIndexes, "addIndexesInRange:", v98, length);
                if (v67)
                  v100 = v67->_supplementaryOffsets;
                else
                  v100 = 0;
                v101 = v100;
                -[_UICollectionLayoutSolveResult addInvalidatedSupplementariesWithOffsets:]((uint64_t)v187, v101);

              }
              v50 = v67;

              v317.origin.x = v68;
              v317.origin.y = v69;
              v317.size.width = v89;
              v317.size.height = v90;
              *(CGRect *)v188 = CGRectUnion(*(CGRect *)v188, v317);
              v314.origin.x = v68;
              v314.origin.y = v69;
              v314.size.width = v89;
              v314.size.height = v90;
              MaxX = CGRectGetMaxX(v314);
              v315.origin.x = v68;
              v315.origin.y = v69;
              v315.size.width = v89;
              v315.size.height = v90;
              MaxY = CGRectGetMaxY(v315);
              v104 = _UIPointValueForAxis(layoutAxis, MaxX, MaxY);
              v43 = _UISetPointValueForAxis(layoutAxis, v43, v42, v104);
              v42 = v105;
              if (v53)
              {
                v106 = *(_QWORD *)(v53 + 48);
                if (v106)
                  v106 = *(_QWORD *)(v106 + 56);
                v295[3] += v106;
                v107 = *(_QWORD *)(v53 + 48);
                if (v107)
                  v107 = *(_QWORD *)(v107 + 56);
              }
              else
              {
                v107 = 0;
              }
              v291[3] = (v291[3] - v107) & ~((v291[3] - v107) >> 63);

              ++v193;
              v195 = v50;
            }
            while (v193 != v178);
            v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v309, 16);
            v178 = v111;
            v52 = &selRef__screenInterfaceOrientationChanged_;
          }
          while (v111);
        }
        else
        {
          v50 = 0;
        }
LABEL_131:

        -[_UICollectionLayoutSectionEstimatedSolver _adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:bookmarks:](v196, "_adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:bookmarks:", v191, *(double *)v188, *(double *)&v188[8], *(double *)&v188[16], *(double *)&v188[24]);
        v113 = v112;
        v115 = v114;
        v117 = v116;
        v119 = v118;
        containerLayoutAxis = v196->_containerLayoutAxis;
        v121 = [_UICollectionLayoutSectionGeometryTranslator alloc];
        layoutRTL = v196->_layoutRTL;
        -[NSCollectionLayoutSection contentInsets](v196->_layoutSection, "contentInsets");
        v127 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v121, containerLayoutAxis, layoutRTL, v117, v119, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v123, v124, v125, v126, v161, v160);
        v128 = v180;
        if (!v47)
          v128 = 0;
        if (v128 == 1)
        {
          v313.location = 0;
          v313.length = v168;
          _UIOrderedRangeIndexerImpl::appendRange(v47->_orderedRangeIndexerImpl.__ptr_, v313);
        }
        v129 = [_UICollectionLayoutSolutionState alloc];
        if (v129)
        {
          if (!v191)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v129, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmarks"));

          }
          if (!v183)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v129, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("geometricIndexer"));

          }
          if (!v189)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v129, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemRangeIndexer"));

          }
          if (!v182)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v129, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxillaryRangeIndexerDict"));

          }
          v310.receiver = v129;
          v310.super_class = (Class)_UICollectionLayoutSolutionState;
          v130 = -[_UICollectionLayoutSectionEstimatedSolver init](&v310, sel_init);
          v129 = (_UICollectionLayoutSolutionState *)v130;
          if (v130)
          {
            objc_storeStrong((id *)&v130->_layoutSection, v191);
            objc_storeStrong((id *)&v129->_geometricIndexer, v183);
            objc_storeStrong((id *)&v129->_itemRangeIndexer, v189);
            objc_storeStrong((id *)&v129->_preferredSizeGroupingIndexer, v47);
            objc_storeStrong((id *)&v129->_auxillaryRangeIndexerKindDict, v182);
            objc_storeStrong((id *)&v129->_sectionGeometryTranslator, v127);
          }
        }
        objc_storeStrong(location, v129);
        v316.origin.x = v113;
        v316.origin.y = v115;
        v316.size.width = v117;
        v316.size.height = v119;
        IsEmpty = CGRectIsEmpty(v316);
        v132 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
        objc_storeStrong((id *)&v196->_sectionSupplementaryEnroller, v132);

        v133 = -[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], v196);
        v134 = (double *)v133;
        if (!v133)
        {
          v136 = 0.0;
          v137 = 0.0;
          if (!IsEmpty)
            goto LABEL_160;
          goto LABEL_155;
        }
        v196->_containerSizeDependentAxes |= *(_QWORD *)(v133 + 56);
        if (*(double *)(v133 + 144) != 0.0
          || *(double *)(v133 + 160) != 0.0
          || *(double *)(v133 + 152) != 0.0
          || (*(double *)(v133 + 168) != 0.0 ? (v135 = 1) : (v135 = IsEmpty), v135 == 1))
        {
          v137 = *(double *)(v133 + 112);
          v136 = *(double *)(v133 + 120);
LABEL_155:
          v138 = [_UICollectionLayoutSectionGeometryTranslator alloc];
          v139 = v196->_layoutRTL;
          -[NSCollectionLayoutSection contentInsets](v196->_layoutSection, "contentInsets");
          v143 = v142;
          v145 = v144;
          if (v134)
          {
            v147 = v134[16];
            v146 = v134[17];
          }
          else
          {
            v146 = 0.0;
            v147 = 0.0;
          }
          v148 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v138, containerLayoutAxis, v139, v117, v119, v137, v136, v143, v145, v140, v141, v147, v146);
          if (*location)
            objc_storeStrong((id *)*location + 1, v148);

        }
LABEL_160:
        objc_storeStrong((id *)&v196->_sectionSupplementarySolution, v134);

        for (k = 32; k != 288; k += 32)
          __destructor_8_sb0_AB8s24n1_S_sb8_sb16_AE((id *)((char *)&v229 + k));

        _Block_object_dispose(v280, 8);
        _Block_object_dispose(v282, 8);

        _Block_object_dispose(&v284, 8);
        _Block_object_dispose(&v290, 8);
        _Block_object_dispose(&v294, 8);
        _Block_object_dispose(v298, 8);
        _Block_object_dispose(v300, 8);
        _Block_object_dispose(v301, 8);
        _Block_object_dispose(v302, 8);

        break;
    }
    return v187;
  }
}

- (CGRect)_adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:(CGRect)a3 bookmarks:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  uint64_t v11;
  double *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat MinX;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(a4, "count")
    && -[_UICollectionLayoutSectionEstimatedSolver shouldAdjustContentSizeForPartialLastGroupSolution](self, "shouldAdjustContentSizeForPartialLastGroupSolution"))
  {
    objc_msgSend(a4, "lastObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (double *)v11;
    if (v11)
      v13 = *(void **)(v11 + 8);
    else
      v13 = 0;
    v14 = v13;
    v15 = -[_UICollectionLayoutSectionEstimatedSolver layoutAxis](self, "layoutAxis");
    if ((unint64_t)(v15 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1093, CFSTR("Unknown layout axis."));

      if (v12)
        goto LABEL_7;
    }
    else if (v12)
    {
LABEL_7:
      v16 = *((_QWORD *)v12 + 4);
      if (v14)
      {
        v17 = v14[6];
        if (v17)
          v17 = *(_QWORD *)(v17 + 56);
      }
      else
      {
        v17 = 0;
      }
      if (v16 >= v17)
        goto LABEL_13;
      v18 = v12[7];
      v19 = v12[8];
      goto LABEL_12;
    }
    if (!v14)
      goto LABEL_13;
    v35 = v14[6];
    if (!v35 || *(uint64_t *)(v35 + 56) <= 0)
      goto LABEL_13;
    v16 = 0;
    v18 = 0.0;
    v19 = 0.0;
LABEL_12:
    v20 = -[_UICollectionLayoutItemSolver contentSizeForFrameCount:layoutAxis:]((uint64_t)v14, v16, v15);
    v22 = v21;
    v23 = _UISizeValueForAxis(v15, v18, v19);
    v24 = _UISizeValueForAxis(v15, v20, v22) - v23;
    v25 = _UISizeValueForAxis(v15, width, height);
    v26 = _UISetSizeValueForAxis(v15, width, height, v25 + v24);
    v28 = v27;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MinX = CGRectGetMinX(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    y = CGRectGetMinY(v37);
    height = v28;
    width = v26;
    x = MinX;
LABEL_13:

  }
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution
{
  return self->_shouldAdjustContentSizeForPartialLastGroupSolution;
}

- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4
{
  objc_storeStrong((id *)&self->_preferredSizes, a4);
  return -[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:](self, "_solveWithParameters:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryContainer, 0);
  objc_storeStrong((id *)&self->_solutionState, 0);
  objc_storeStrong((id *)&self->_memoizedSupplementaryHostContainer, 0);
  objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_sectionSupplementarySolution, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
}

- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3
{
  _UICollectionLayoutSectionEstimatedSolver *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  if (self)
  {
    self = self->_solutionState;
    v4 = self;
    if (self)
      self = (_UICollectionLayoutSectionEstimatedSolver *)self->_layoutAxis;
  }
  else
  {
    v4 = 0;
  }
  v5 = -[_UIOrderedRangeIndexer rangeContainingLocation:]((uint64_t)self, a3);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[_UICollectionLayoutSectionEstimatedSolver solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:](self, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", a3, 0, a4, a5, a6, 0, v6);
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[_UICollectionLayoutSectionEstimatedSolver solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:](self, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", a3, 0, a4, a5, a6, a7, v7);
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  char v9;
  _UICollectionLayoutAuxillaryItemSolver *sectionSupplementarySolution;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UICollectionLayoutSectionEstimatedSolver layoutSection](self, "layoutSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isEmptySection");

  if ((v9 & 1) == 0)
  {
    if (self)
      sectionSupplementarySolution = self->_sectionSupplementarySolution;
    else
      sectionSupplementarySolution = 0;
    -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:]((id *)&sectionSupplementarySolution->super.isa, x, y, width, height);
  }
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4
{
  CGSize v5;

  self->_overrideContentRectForPinning = a4;
  -[_UICollectionLayoutSectionEstimatedSolver updatePinnedSupplementaryItemsWithVisibleBounds:](self, "updatePinnedSupplementaryItemsWithVisibleBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_overrideContentRectForPinning.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_overrideContentRectForPinning.size = v5;
}

- (id)queryFramesIntersectingRect:(CGRect)a3
{
  return -[_UICollectionLayoutSectionEstimatedSolver queryFramesIntersectingRect:frameOffset:](self, "queryFramesIntersectingRect:frameOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)sectionSupplementaryFrameForIndex:(int64_t)a3
{
  _UICollectionLayoutAuxillaryItemSolver *sectionSupplementarySolution;
  void *v7;
  unint64_t v8;
  _UICollectionLayoutAuxillaryItemSolver *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  if (self)
  {
    if (self->_solutionState
      || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solutionState")), v14, self))
    {
      sectionSupplementarySolution = self->_sectionSupplementarySolution;
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solutionState"));

  }
  sectionSupplementarySolution = 0;
LABEL_4:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&sectionSupplementarySolution->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < self.sectionSupplementarySolution.supplementaryFrames.count"));

    if (self)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    goto LABEL_7;
  }
  if (!self)
    goto LABEL_9;
LABEL_6:
  v9 = self->_sectionSupplementarySolution;
LABEL_7:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&v9->super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unpinnedSectionSupplementaryFrameForIndex:(int64_t)a3
{
  _UICollectionLayoutAuxillaryItemSolver *sectionSupplementarySolution;
  id *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  if (self)
    sectionSupplementarySolution = self->_sectionSupplementarySolution;
  else
    sectionSupplementarySolution = 0;
  v7 = sectionSupplementarySolution;
  -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!self || !self->_solutionState)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solutionState"));

    }
    -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < sectionSupplementarySolution.unpinnedFramesOfPinnedSupplementaries.count"));

    }
    -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UICollectionLayoutSectionEstimatedSolver sectionSupplementaryFrameForIndex:](self, "sectionSupplementaryFrameForIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)unpinnedSectionSupplementaryFrameWithKind:(id)a3 forIndex:(int64_t)a4
{
  _UICollectionLayoutAuxillaryItemSolver *sectionSupplementarySolution;
  void *v10;
  void *v11;

  if (a3 && objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_4;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    if (self)
      goto LABEL_5;
LABEL_9:
    sectionSupplementarySolution = 0;
    return -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionSupplementarySolution->super.isa, a3, a4);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil && kind.length > 0"));

  if (a4 < 0)
    goto LABEL_8;
LABEL_4:
  if (!self)
    goto LABEL_9;
LABEL_5:
  sectionSupplementarySolution = self->_sectionSupplementarySolution;
  return -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionSupplementarySolution->super.isa, a3, a4);
}

- (int64_t)sectionSupplementaryKindIndexForEnrollmentIdentifier:(id)a3
{
  _UICollectionLayoutSupplementaryEnroller *sectionSupplementaryEnroller;
  void *v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentIdentifier"));

    if (self)
      goto LABEL_3;
LABEL_6:
    sectionSupplementaryEnroller = 0;
    return -[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:]((uint64_t)sectionSupplementaryEnroller, (uint64_t)a3);
  }
  if (!self)
    goto LABEL_6;
LABEL_3:
  sectionSupplementaryEnroller = self->_sectionSupplementaryEnroller;
  return -[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:]((uint64_t)sectionSupplementaryEnroller, (uint64_t)a3);
}

- (id)visualDescription
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIASCIIArtFramesRenderer *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[_UICollectionLayoutContainer contentSize](self->_container, "contentSize");
  v4 = v3;
  -[_UICollectionLayoutContainer contentSize](self->_container, "contentSize");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutSectionEstimatedSolver queryFramesIntersectingRect:](self, "queryFramesIntersectingRect:", 0.0, 0.0, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("frame"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_UIASCIIArtFramesRenderer initWithFrames:]([_UIASCIIArtFramesRenderer alloc], "initWithFrames:", v11);
  -[_UIASCIIArtFramesRenderer description](v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSIndexSet)pinnedSupplementaryIndexes
{
  NSUInteger location;

  if (self)
  {
    location = self[2]._internal._singleRange._range.location;
    if (location)
      return *(NSIndexSet **)(location + 40);
    else
      return 0;
  }
  return self;
}

- (CGRect)_rectWithContentInsetTrailingLayoutDimensionAddedToToRect:(CGRect)a3 insets:(NSDirectionalEdgeInsets)a4 layoutAxis:(unint64_t)a5
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v23;
  CGRect result;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutAxis == UIAxisVertical || layoutAxis == UIAxisHorizontal"));

  }
  v14 = _UITrailingOffsetForInsetsAlongAxis(a5, top, leading, bottom, trailing);
  v15 = _UISizeValueForAxis(a5, width, height);
  v16 = _UISetSizeValueForAxis(a5, width, height, v14 + v15);
  v18 = v17;
  v19 = x;
  v20 = y;
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)auxillaryHostPinningRect
{
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  _UICollectionLayoutSolutionState *v7;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  if (self && self->_solutionState)
  {
    x = self->_overrideContentRectForPinning.origin.x;
    y = self->_overrideContentRectForPinning.origin.y;
    width = self->_overrideContentRectForPinning.size.width;
    height = self->_overrideContentRectForPinning.size.height;
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    if (CGRectIsNull(v13))
    {
      v7 = self->_solutionState;
      y = 0.0;
      if (v7)
      {
        sectionGeometryTranslator = v7->_sectionGeometryTranslator;
        width = 0.0;
        height = 0.0;
        x = 0.0;
        if (sectionGeometryTranslator)
        {
          x = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.x;
          y = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.y;
          width = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.width;
          height = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.height;
        }
      }
      else
      {
        width = 0.0;
        height = 0.0;
        x = 0.0;
      }

    }
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return !CGRectIsNull(self->_overrideContentRectForPinning);
}

- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3
{
  self->_shouldAdjustContentSizeForPartialLastGroupSolution = a3;
}

- (void)setSupplementaryContainer:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryContainer, a3);
}

@end
