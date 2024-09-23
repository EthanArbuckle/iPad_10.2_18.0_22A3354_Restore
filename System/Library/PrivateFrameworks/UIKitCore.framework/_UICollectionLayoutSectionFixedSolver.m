@implementation _UICollectionLayoutSectionFixedSolver

- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  _UICollectionLayoutSectionGeometryTranslator *v8;
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;
  void *v10;
  _UICollectionLayoutItemSolver *solution;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double x;
  double y;
  _UICollectionLayoutItemSolver *v21;
  uint64_t v22;
  void *v24;
  void *v25;

  if (objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    if (self)
      goto LABEL_4;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  if (a4 < 0)
    goto LABEL_20;
LABEL_3:
  if (self)
  {
LABEL_4:
    v8 = self->_sectionGeometryTranslator;
    sectionAuxillarySolution = self->_sectionAuxillarySolution;
    goto LABEL_5;
  }
LABEL_21:
  v8 = 0;
  sectionAuxillarySolution = 0;
LABEL_5:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:]((id *)&sectionAuxillarySolution->super.isa, a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_18;
  if (self)
    solution = self->_solution;
  else
    solution = 0;
  -[_UICollectionLayoutItemSolver supplementaryOffsets](solution);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "elementKinds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", a3);

  if (!v14)
  {
    v10 = 0;
    goto LABEL_18;
  }
  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UICollectionLayoutSectionFixedSolver layoutAxis](self, "layoutAxis");
  objc_msgSend(v15, "interGroupSpacing");
  v18 = v17;
  if (v8)
  {
    x = v8->_primaryContentFrame.origin.x;
    y = v8->_primaryContentFrame.origin.y;
    if (self)
    {
LABEL_11:
      v21 = self->_solution;
      goto LABEL_12;
    }
  }
  else
  {
    y = 0.0;
    x = 0.0;
    if (self)
      goto LABEL_11;
  }
  v21 = 0;
LABEL_12:
  -[_UICollectionLayoutItemSolver supplementaryFrameWithKind:absoluteIndex:additionalFrameOffset:interSolutionSpacing:repeatAxis:](v21, a3, a4, v16, x, y, v18);
  v22 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v22;
  if (v22
    && *(_QWORD *)(v22 + 56) == 4
    && -[_UICollectionLayoutSectionFixedSolver frameCount](self, "frameCount") <= a4)
  {

    v10 = 0;
  }

LABEL_18:
  return v10;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 2;
}

- (id)auxillaryHostAuxillaryItems
{
  void *v2;
  void *v3;

  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundarySupplementaryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)auxillaryHostSupplementaryEnroller
{
  if (self)
    self = (_UICollectionLayoutSectionFixedSolver *)self->_sectionSupplementaryEnroller;
  return self;
}

- (id)auxillaryHostPreferredSizes
{
  return 0;
}

- (double)auxillaryHostPaddingBeforeBoundarySupplementaries
{
  void *v2;
  double v3;
  double v4;

  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_paddingToBoundarySupplementaries");
    v3 = v4;
  }

  return v3;
}

- (id)frameForIndex:(int64_t)a3
{
  void *v5;
  _UICollectionLayoutItemSolver *solution;
  _UICollectionLayoutItemSolverState *solveResult;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double x;
  double y;

  v5 = 0;
  if (-[_UICollectionLayoutSectionFixedSolver frameCount](self, "frameCount") > a3 && self)
  {
    solution = self->_solution;
    if (solution && (solveResult = solution->_solveResult) != 0 && solveResult->_itemFrameCount >= 1)
    {
      -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_UICollectionLayoutSectionFixedSolver layoutAxis](self, "layoutAxis");
      objc_msgSend(v8, "interGroupSpacing");
      v11 = v10;
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      if (sectionGeometryTranslator)
      {
        x = sectionGeometryTranslator->_primaryContentFrame.origin.x;
        y = sectionGeometryTranslator->_primaryContentFrame.origin.y;
      }
      else
      {
        y = 0.0;
        x = 0.0;
      }
      -[_UICollectionLayoutItemSolver frameForAbsoluteIndex:additionalFrameOffset:interSolutionSpacing:repeatAxis:](self->_solution, a3, v9, x, y, v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (CGRect)contentFrameIncludingAuxiliaries
{
  _UICollectionLayoutSectionGeometryTranslator *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (self && (v2 = self->_sectionGeometryTranslator) != 0)
  {
    x = v2->_contentFrameIncludingAuxiliaries.origin.x;
    y = v2->_contentFrameIncludingAuxiliaries.origin.y;
    width = v2->_contentFrameIncludingAuxiliaries.size.width;
    height = v2->_contentFrameIncludingAuxiliaries.size.height;

  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9
{
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  _UICollectionLayoutItemSolver *v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  char v28;
  double v29;
  double v30;
  _QWORD *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int64_t v38;
  int64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _UICollectionLayoutSectionGeometryTranslator *v55;
  uint64_t v56;
  _BOOL4 layoutRTL;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  char *v63;
  _UICollectionLayoutSupplementaryEnroller *v64;
  void *v65;
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;
  double width;
  double height;
  _UICollectionLayoutSectionGeometryTranslator *v69;
  uint64_t v70;
  _BOOL4 v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  _UICollectionLayoutAuxillaryItemSolver *v79;
  double y;
  double x;
  char *v82;
  _BOOL4 v83;
  double v84;
  double v85;
  unint64_t layoutAxis;
  id v87;

  -[_UICollectionLayoutSectionFixedSolver setContainer:](self, "setContainer:", a3, a4, a5, a6, a7, a8);
  if (a4)
    v15 = a4;
  else
    v15 = a3;
  -[_UICollectionLayoutSectionFixedSolver setSupplementaryContainer:](self, "setSupplementaryContainer:", v15);
  -[_UICollectionLayoutSectionFixedSolver setTraitCollection:](self, "setTraitCollection:", a5);
  -[_UICollectionLayoutSectionFixedSolver setContainerLayoutAxis:](self, "setContainerLayoutAxis:", a6);
  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scrollsOrthogonally");
  v18 = a6 == 2;
  if (a6 == 1)
    v18 = 2;
  if (v17)
    v19 = v18;
  else
    v19 = a6;
  -[_UICollectionLayoutSectionFixedSolver setLayoutAxis:](self, "setLayoutAxis:", v19);

  -[_UICollectionLayoutSectionFixedSolver setFrameCount:](self, "setFrameCount:", a7);
  -[_UICollectionLayoutSectionFixedSolver setLayoutRTL:](self, "setLayoutRTL:", a9);
  if (self)
  {
    -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "_isEmptySection");

    if ((v21 & 1) == 0)
    {
      -[_UICollectionLayoutSectionFixedSolver _sectionContainer]((double *)self);
      v87 = (id)objc_claimAutoreleasedReturnValue();
      v22 = -[_UICollectionLayoutSectionFixedSolver layoutAxis](self, "layoutAxis");
      v23 = [_UICollectionLayoutItemSolver alloc];
      -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "group");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[_UICollectionLayoutItemSolver initWithItem:](v23, v25);

      -[_UICollectionLayoutSectionFixedSolver traitCollection](self, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[_UICollectionLayoutSectionFixedSolver layoutRTL](self, "layoutRTL");
      if (v26)
      {
        v29 = *MEMORY[0x1E0C9D820];
        v30 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:]((uint64_t)v26, v87, v22, v27, 0x7FFFFFFFFFFFFFFFLL, v28, 0, 0, *MEMORY[0x1E0C9D820], v30);

        objc_storeStrong((id *)&self->_solution, v26);
        v31 = v26[6];
        if (!v31)
          goto LABEL_24;
        v32 = v31[7];
        if (!v32)
          goto LABEL_24;
        -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v26);
        v34 = v33;
        v36 = v35;
        v37 = _UISizeValueForAxis(v22, v33, v35);
        v38 = -[_UICollectionLayoutSectionFixedSolver frameCount](self, "frameCount") / v32;
        v39 = -[_UICollectionLayoutSectionFixedSolver frameCount](self, "frameCount") % v32;
        v40 = -[_UICollectionLayoutItemSolver contentSizeForFrameCount:layoutAxis:]((uint64_t)v26, v39, v22);
        if (v39)
        {
          v42 = v40;
          v43 = v41;
          v44 = v37;
          if (-[_UICollectionLayoutSectionFixedSolver shouldAdjustContentSizeForPartialLastGroupSolution](self, "shouldAdjustContentSizeForPartialLastGroupSolution"))
          {
            v44 = _UISizeValueForAxis(v22, v42, v43);
          }
        }
        else
        {
          v44 = 0.0;
        }
        v45 = v39 <= 0 ? v38 : v38 + 1;
        v46 = v45 < 1;
        v47 = v45 - 1;
        if (!v46)
        {
          v48 = (double)v47;
          -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "interGroupSpacing");
          v51 = v50 * v48;

          v52 = _UISetSizeValueForAxis(v22, v34, v36, v37 * (double)v38 + v44 + v51);
          v54 = v53;
        }
        else
        {
LABEL_24:
          v52 = v29;
          v54 = v30;
        }
      }
      else
      {

        objc_storeStrong((id *)&self->_solution, 0);
        v52 = *MEMORY[0x1E0C9D820];
        v54 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v29 = *MEMORY[0x1E0C9D820];
        v30 = v54;
      }
      v55 = [_UICollectionLayoutSectionGeometryTranslator alloc];
      v56 = -[_UICollectionLayoutSectionFixedSolver containerLayoutAxis](self, "containerLayoutAxis");
      layoutRTL = self->_layoutRTL;
      -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "contentInsets");
      v63 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v55, v56, layoutRTL, v52, v54, v29, v30, v59, v60, v61, v62, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      objc_storeStrong((id *)&self->_sectionGeometryTranslator, v63);

      v64 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
      objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, v64);

      v65 = (void *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], self);
      objc_storeStrong((id *)&self->_sectionAuxillarySolution, v65);

      sectionAuxillarySolution = self->_sectionAuxillarySolution;
      if (sectionAuxillarySolution
        && (sectionAuxillarySolution->_hostContentSizeInsets.top != 0.0
         || sectionAuxillarySolution->_hostContentSizeInsets.bottom != 0.0
         || sectionAuxillarySolution->_hostContentSizeInsets.leading != 0.0
         || sectionAuxillarySolution->_hostContentSizeInsets.trailing != 0.0))
      {
        width = sectionAuxillarySolution->_contentSize.width;
        height = sectionAuxillarySolution->_contentSize.height;
        v69 = [_UICollectionLayoutSectionGeometryTranslator alloc];
        v70 = -[_UICollectionLayoutSectionFixedSolver containerLayoutAxis](self, "containerLayoutAxis");
        v71 = self->_layoutRTL;
        -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "contentInsets");
        v76 = v75;
        v78 = v77;
        v79 = self->_sectionAuxillarySolution;
        if (v79)
        {
          x = v79->_hostContentOffset.x;
          y = v79->_hostContentOffset.y;
        }
        else
        {
          y = 0.0;
          x = 0.0;
        }
        v82 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v69, v70, v71, v52, v54, width, height, v76, v78, v73, v74, x, y);
        objc_storeStrong((id *)&self->_sectionGeometryTranslator, v82);

      }
      v83 = -[NSCollectionLayoutSection scrollsOrthogonally](self->_layoutSection, "scrollsOrthogonally");
      v84 = 0.0;
      v85 = 0.0;
      if (v83)
      {
        layoutAxis = self->_layoutAxis;
        if (layoutAxis == 1)
        {
          v85 = 1.0;
        }
        else if (layoutAxis == 2)
        {
          v84 = 1.0;
        }
      }
      -[_UICollectionLayoutSectionFixedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v84, v85);

    }
  }
}

- (NSCollectionLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)containerLayoutAxis
{
  return self->_containerLayoutAxis;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void)setSupplementaryContainer:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryContainer, a3);
}

- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3
{
  self->_orthogonalScrollingPrefetchingUnitVector = a3;
}

- (void)setLayoutRTL:(BOOL)a3
{
  self->_layoutRTL = a3;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_layoutAxis = a3;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (void)setContainerLayoutAxis:(unint64_t)a3
{
  self->_containerLayoutAxis = a3;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (id)initWithLayoutSection:(id *)a1
{
  id *v2;
  void *v4;
  int v5;
  id *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v11;
  objc_super v12;

  v2 = a1;
  if (a1)
  {
    if ((objc_msgSend(a2, "_isEmptySection") & 1) == 0)
    {
      objc_msgSend(a2, "group");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "containsEstimatedSizeItem");

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLayoutSection_, v2, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!layoutSection.group.containsEstimatedSizeItem"));

      }
    }
    v12.receiver = v2;
    v12.super_class = (Class)_UICollectionLayoutSectionFixedSolver;
    v6 = (id *)objc_msgSendSuper2(&v12, sel_init);
    v2 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 8, a2);
      v2[12] = 0;
      objc_msgSend(a2, "group");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v2 + 8) = objc_msgSend(v8, "isContainerSize") ^ 1;

      v9 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v2 + 19) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v2 + 21) = v9;
      objc_msgSend(v2[8], "_checkForDuplicateSupplementaryItemKindsAndThrowIfFound");
    }
  }
  return v2;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (unint64_t)containerSizeDependentAxes
{
  unint64_t solution;
  unint64_t sectionAuxillarySolution;

  solution = (unint64_t)self->_solution;
  if (solution)
    solution = *(_QWORD *)(solution + 40);
  sectionAuxillarySolution = (unint64_t)self->_sectionAuxillarySolution;
  if (sectionAuxillarySolution)
    sectionAuxillarySolution = *(_QWORD *)(sectionAuxillarySolution + 56);
  return sectionAuxillarySolution | solution;
}

- (double)_sectionContainer
{
  double *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  _UICollectionLayoutContainer *v18;
  void *v19;
  double v20;
  double v21;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "container");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

    if (objc_msgSend(v1, "layoutAxis") == 2)
    {
      objc_msgSend(v1, "layoutSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentInsets");
      v6 = v6 + v12;

      objc_msgSend(v1, "layoutSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentInsets");
      v10 = v10 + v14;
    }
    else if (objc_msgSend(v1, "layoutAxis") == 1)
    {
      objc_msgSend(v1, "layoutSection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentInsets");
      v4 = v4 + v16;

      objc_msgSend(v1, "layoutSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentInsets");
      v8 = v8 + v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__sectionContainer, v1, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 494, CFSTR("Unknown layout axis."));
    }

    v18 = [_UICollectionLayoutContainer alloc];
    objc_msgSend(v1, "container");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentSize");
    v1 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v18, v20, v21, v4, v6, v8, v10);

  }
  return v1;
}

- (_UICollectionLayoutContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_supplementaryContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
  objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
  objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_sectionAuxillarySolution, 0);
  objc_storeStrong((id *)&self->_solution, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

- (id)_queryFramesIntersectingRect:(CGFloat)a3 frameOffset:(CGFloat)a4
{
  id v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double i;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat Width;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat Height;
  void *v61;
  uint64_t v62;
  void *v63;
  float64_t v65;
  float64_t v66;
  float64_t v67;
  float64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  CGRect rect2;
  void *v79;
  _QWORD *v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  _QWORD v84[5];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  if (a1)
  {
    v14 = (id)objc_msgSend(a1, "layoutSection");
    if ((objc_msgSend(v14, "_isEmptySection") & 1) != 0)
    {
      v15 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = a1[6];
      v17 = (_QWORD *)a1[3];
      if (v16)
      {
        v18 = *(double *)(v16 + 72);
        rect2.origin.x = *(CGFloat *)(v16 + 80);
      }
      else
      {
        rect2.origin.x = 0.0;
        v18 = 0.0;
      }
      v65 = a2;
      v66 = a3;
      v67 = a4;
      v68 = a5;
      v19 = -[_UICollectionLayoutSectionGeometryTranslator contentRectForSectionRect:](v16, a2, a3, a4, a5);
      v21 = v20;
      v76 = v23;
      v77 = v22;
      v24 = objc_msgSend(a1, "layoutAxis");
      v25 = objc_msgSend(a1, "frameCount");
      -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v17);
      v27 = v26;
      v29 = v28;
      v30 = _UISizeValueForAxis(v24, v26, v28);
      objc_msgSend(v14, "interGroupSpacing");
      v32 = v30 + v31;
      v33 = _UISetSizeValueForAxis(v24, v27, v29, v32);
      v35 = v34;
      v36 = _UIPointValueForAxis(v24, v19, v21);
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_2;
      v84[3] = &__block_descriptor_40_e8_d16__0q8l;
      *(double *)&v84[4] = v32;
      *(_QWORD *)&rect2.origin.y = MEMORY[0x1E0C809B0];
      *(_QWORD *)&rect2.size.width = 3221225472;
      *(_QWORD *)&rect2.size.height = __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_3;
      v79 = &__block_descriptor_64_e39__CGRect__CGPoint_dd__CGSize_dd__16__0q8lu32l8;
      v80 = v84;
      v81 = v24;
      v82 = v33;
      v83 = v35;
      if (v36 >= 0.0)
        v37 = (uint64_t)(v36 / v32);
      else
        v37 = 0;
      v73 = v36;
      if (v17)
      {
        v38 = v17[6];
        if (v38)
          v38 = *(_QWORD *)(v38 + 56);
      }
      else
      {
        v38 = 0;
      }
      v69 = a6;
      v70 = a7;
      v71 = a7 + rect2.origin.x;
      v72 = a6 + v18;
      v39 = v38 * v37;
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = -[_UICollectionLayoutItemSolver offsetForEdgeSpacing]((uint64_t)v17);
      v74 = v41;
      v75 = v40;
      for (i = ((double (*)(CGFloat *, uint64_t))__82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_3)(&rect2.origin.y, v37); ; i = (*(double (**)(CGFloat *, uint64_t))&rect2.size.height)(&rect2.origin.y, v37))
      {
        v46 = i;
        v47 = v43;
        v48 = v44;
        v49 = v45;
        rect2.origin.x = v75 + i;
        v50 = v74 + v43;
        Width = CGRectGetWidth(*(CGRect *)&i);
        v85.origin.x = v46;
        v85.origin.y = v47;
        v85.size.width = v48;
        v85.size.height = v49;
        v89.size.height = CGRectGetHeight(v85);
        v86.origin.x = v19;
        v86.origin.y = v21;
        v86.size.width = v77;
        v86.size.height = v76;
        v89.origin.x = rect2.origin.x;
        v89.origin.y = v50;
        v89.size.width = Width;
        if (!CGRectIntersectsRect(v86, v89) || v25 <= v39)
          break;
        v53 = v71 + v47;
        v54 = _UIPointValueForAxis(v24, v46, v47);
        v55 = _UISetPointValueForAxis(v24, v19, v21, v73 - v54);
        v57 = v56;
        v87.origin.x = v19;
        v87.origin.y = v21;
        v87.size.width = v77;
        v87.size.height = v76;
        v58 = CGRectGetWidth(v87);
        v88.size.width = v77;
        v59 = v58;
        v88.origin.x = v19;
        v88.origin.y = v21;
        v88.size.height = v76;
        Height = CGRectGetHeight(v88);
        -[_UICollectionLayoutItemSolver queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:itemLimit:supplementaryRepeatOffset:](v17, v39, v25 - v39, v37, v55, v57, v59, Height, v72 + v46, v53);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v61, *(_QWORD *)&v65, *(_QWORD *)&v66, *(_QWORD *)&v67, *(_QWORD *)&v68, *(_QWORD *)&v69, *(_QWORD *)&v70);
        if (v17)
        {
          v62 = v17[6];
          if (v62)
            v62 = *(_QWORD *)(v62 + 56);
        }
        else
        {
          v62 = 0;
        }
        v39 += v62;

        ++v37;
      }
      -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:](a1[4], v65, v66, v67, v68, v69, v70);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v63);

    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)auxillaryHostContainer
{
  NSCollectionLayoutContainer *v3;
  unint64_t v4;
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
  id v17;
  double v18;
  double v19;
  void *memoizedAuxillaryHostContainer;

  if (!self || (v3 = self->_memoizedAuxillaryHostContainer) == 0)
  {
    if (-[NSCollectionLayoutSection supplementariesFollowContentInsets](self->_layoutSection, "supplementariesFollowContentInsets"))
    {
      v4 = -[_UICollectionLayoutSectionFixedSolver containerLayoutAxis](self, "containerLayoutAxis");
      if (v4 == 1)
        v5 = 2;
      else
        v5 = v4 == 2;
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
      -[_UICollectionLayoutSectionFixedSolver supplementaryContainer](self, "supplementaryContainer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentSize");
      memoizedAuxillaryHostContainer = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v16, v18, v19, v15, v14, v13, v12);
      objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, memoizedAuxillaryHostContainer);
    }
    else
    {
      -[_UICollectionLayoutSectionFixedSolver supplementaryContainer](self, "supplementaryContainer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      memoizedAuxillaryHostContainer = self->_memoizedAuxillaryHostContainer;
      self->_memoizedAuxillaryHostContainer = (NSCollectionLayoutContainer *)v17;
    }

    v3 = self->_memoizedAuxillaryHostContainer;
  }
  return v3;
}

- (CGSize)auxillaryHostContentSize
{
  uint64_t v3;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v3 = -[_UICollectionLayoutSectionFixedSolver layoutAxis](self, "layoutAxis");
  if (self)
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
  else
    sectionGeometryTranslator = 0;
  v5 = -[_UICollectionLayoutSectionGeometryTranslator auxillaryHostContentSize]((uint64_t)sectionGeometryTranslator);
  v7 = v6;
  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "scrollsOrthogonally");
  v10 = v3 == 2;
  if (v3 == 1)
    v10 = 2;
  if (!v9)
    v3 = v10;
  -[_UICollectionLayoutSectionFixedSolver supplementaryContainer](self, "supplementaryContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v14 = _UISizeValueForAxis(v3, v12, v13);

  v15 = _UISetSizeValueForAxis(v3, v5, v7, v14);
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (_UICollectionLayoutContainer)supplementaryContainer
{
  return self->_supplementaryContainer;
}

- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution
{
  return self->_shouldAdjustContentSizeForPartialLastGroupSolution;
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[_UICollectionLayoutSectionFixedSolver solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:](self, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", a3, 0, a4, a5, a6, 0, v6);
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[_UICollectionLayoutSectionFixedSolver solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:](self, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", a3, 0, a4, a5, a6, a7, v7);
}

- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 94, CFSTR("This solver does not handle estimated items so this method does nothing. Are you calling this in error?"));

  return objc_alloc_init(_UICollectionLayoutSolveResult);
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  char v9;
  _UICollectionLayoutSupplementaryEnroller *v10;
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isEmptySection");

  if ((v9 & 1) == 0)
  {
    v10 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
    -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self, v10);

    if (self)
      sectionAuxillarySolution = self->_sectionAuxillarySolution;
    else
      sectionAuxillarySolution = 0;
    -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:]((id *)&sectionAuxillarySolution->super.isa, x, y, width, height);
  }
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4
{
  CGSize v5;

  self->_overrideContentRectForPinning = a4;
  -[_UICollectionLayoutSectionFixedSolver updatePinnedSupplementaryItemsWithVisibleBounds:](self, "updatePinnedSupplementaryItemsWithVisibleBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_overrideContentRectForPinning.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_overrideContentRectForPinning.size = v5;
}

- (id)queryFramesIntersectingRect:(CGRect)a3
{
  return -[_UICollectionLayoutSectionFixedSolver _queryFramesIntersectingRect:frameOffset:](self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)visualDescription
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _UIASCIIArtFramesRenderer *v25;
  void *v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[_UICollectionLayoutSectionFixedSolver container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[_UICollectionLayoutSectionFixedSolver container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;

  -[_UICollectionLayoutSectionFixedSolver contentFrameIncludingAuxiliaries](self, "contentFrameIncludingAuxiliaries");
  v10 = v9;
  v12 = v11;
  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsets");
  v15 = v14;
  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInsets");
  v18 = v17;

  -[_UICollectionLayoutSectionFixedSolver _queryFramesIntersectingRect:frameOffset:](self, 0.0, 0.0, v10, v12, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v5, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v15, v18, v10, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v28[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", CFSTR("frame"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[_UIASCIIArtFramesRenderer initWithFrames:]([_UIASCIIArtFramesRenderer alloc], "initWithFrames:", v24);
  -[_UIASCIIArtFramesRenderer description](v25, "description");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (NSIndexSet)pinnedSupplementaryIndexes
{
  Class isa;

  if (self)
  {
    isa = self[1].super.isa;
    if (isa)
      return (NSIndexSet *)*((_QWORD *)isa + 5);
    else
      return 0;
  }
  return self;
}

- (CGRect)primaryContentFrame
{
  _UICollectionLayoutSectionGeometryTranslator *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (self && (v2 = self->_sectionGeometryTranslator) != 0)
  {
    x = v2->_primaryContentFrame.origin.x;
    y = v2->_primaryContentFrame.origin.y;
    width = v2->_primaryContentFrame.size.width;
    height = v2->_primaryContentFrame.size.height;

  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)sectionSupplementaryFrameForIndex:(int64_t)a3
{
  _UICollectionLayoutSectionFixedSolver *v5;
  void *v6;
  unint64_t v7;
  id *p_isa;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v5 = self;
  if (self)
    self = (_UICollectionLayoutSectionFixedSolver *)self->_sectionAuxillarySolution;
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < self.sectionAuxillarySolution.supplementaryFrames.count"));

    if (v5)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

    p_isa = 0;
    goto LABEL_8;
  }
  if (!v5)
    goto LABEL_10;
LABEL_5:
  if (!v5->_sectionGeometryTranslator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

  }
  p_isa = (id *)&v5->_sectionAuxillarySolution->super.isa;
LABEL_8:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](p_isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)unpinnedSectionSupplementaryFrameForIndex:(int64_t)a3
{
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;
  id *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  if (self)
    sectionAuxillarySolution = self->_sectionAuxillarySolution;
  else
    sectionAuxillarySolution = 0;
  v7 = sectionAuxillarySolution;
  -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[_UICollectionLayoutSectionFixedSolver sectionSupplementaryFrameForIndex:](self, "sectionSupplementaryFrameForIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < sectionAuxillarySolution.unpinnedFramesOfPinnedSupplementaries.count"));

    if (!self)
      goto LABEL_11;
  }
  else if (!self)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

    goto LABEL_7;
  }
  if (!self->_sectionGeometryTranslator)
    goto LABEL_11;
LABEL_7:
  -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (id)unpinnedSectionSupplementaryFrameWithKind:(id)a3 forIndex:(int64_t)a4
{
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;
  void *v10;
  void *v11;

  if (a3 && objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_4;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    if (self)
      goto LABEL_5;
LABEL_9:
    sectionAuxillarySolution = 0;
    return -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil && kind.length > 0"));

  if (a4 < 0)
    goto LABEL_8;
LABEL_4:
  if (!self)
    goto LABEL_9;
LABEL_5:
  sectionAuxillarySolution = self->_sectionAuxillarySolution;
  return -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
}

- (int64_t)sectionSupplementaryKindIndexForEnrollmentIdentifier:(id)a3
{
  _UICollectionLayoutSupplementaryEnroller *sectionSupplementaryEnroller;
  void *v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentIdentifier"));

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

- (id)sectionSupplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index>=0"));

    if (self)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

    sectionAuxillarySolution = 0;
    return -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  if (a4 < 0)
    goto LABEL_9;
LABEL_3:
  if (!self)
    goto LABEL_10;
LABEL_4:
  if (!self->_sectionGeometryTranslator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionFixedSolver.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

  }
  sectionAuxillarySolution = self->_sectionAuxillarySolution;
  return -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
}

- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (CGRect)auxillaryHostPinningRect
{
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  if (self)
  {
    x = self->_overrideContentRectForPinning.origin.x;
    y = self->_overrideContentRectForPinning.origin.y;
    width = self->_overrideContentRectForPinning.size.width;
    height = self->_overrideContentRectForPinning.size.height;
  }
  else
  {
    y = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (CGRectIsNull(v12))
  {
    width = 0.0;
    if (self)
    {
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      height = 0.0;
      y = 0.0;
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
      height = 0.0;
      y = 0.0;
      x = 0.0;
    }
  }
  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return !CGRectIsNull(self->_overrideContentRectForPinning);
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
  -[_UICollectionLayoutSectionFixedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v14, v9);
  self->_orthogonalOffset.x = v6;
  self->_orthogonalOffset.y = v8;
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

  -[_UICollectionLayoutSectionFixedSolver _sectionContainer]((double *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutSectionFixedSolver traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  -[_UICollectionLayoutSectionFixedSolver layoutSection](self, "layoutSection");
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

- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3
{
  self->_shouldAdjustContentSizeForPartialLastGroupSolution = a3;
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

- (void)setLayoutSection:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSection, a3);
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

@end
