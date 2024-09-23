@implementation _UICollectionLayoutSectionListSolver

- (id)frameForIndex:(int64_t)a3
{
  int64_t v5;
  id *v6;
  _UICollectionLayoutItemSolver *solution;
  _UICollectionLayoutItemSolverState *solveResult;
  _UIRegionSolveResult *begin;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  CGFloat y;
  CGFloat x;
  char *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v5 = -[_UICollectionLayoutSectionListSolver frameCount](self, "frameCount");
  v6 = 0;
  if (v5 > a3 && self)
  {
    solution = self->_solution;
    if (solution && (solveResult = solution->_solveResult) != 0 && solveResult->_itemFrameCount == 1)
    {
      begin = self->_regions.__begin_;
      v10 = self->_regions.__end_ - begin;
      if (!v10
        || (v11 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:]((uint64_t)self, a3, 0x86BCA1AF286BCA1BLL * (v10 >> 3) - 1), v11 == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__regionForFrameIndex_, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 881, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionIndex != NSNotFound"));

        begin = self->_regions.__begin_;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v13 = (_QWORD *)((char *)begin + 152 * v11);
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
      if ((unint64_t)a3 < *v13 || (unint64_t)(a3 - *v13) >= v13[1])
      {
        v27 = v11;
        v28 = (_QWORD *)((char *)begin + 152 * v11);
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGRect _UIRegionSolveResult::frameForIndex(NSInteger) const");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSLocationInRange(index, _range)"));

        v11 = v27;
        v13 = v28;
      }
      v18 = (char *)begin + 152 * v11;
      v19 = *((double *)v18 + 4);
      v20 = *((double *)v18 + 5);
      v21 = *((double *)v18 + 6);
      v22 = *((double *)v18 + 7);
      v23 = *((double *)v18 + 2) + (CGRectGetHeight(*((CGRect *)v18 + 2)) + *((double *)v18 + 3)) * (double)(a3 - *v13);
      v29.origin.x = v19;
      v29.origin.y = v20;
      v29.size.width = v21;
      v29.size.height = v22;
      v30 = CGRectOffset(v29, 0.0, v23);
      v31 = CGRectOffset(v30, x, y);
      v6 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:](*((id **)v18 + 18), (void *)a3, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (uint64_t)_regionIndexForFrameIndex:(uint64_t)a1 startRegionIndex:(unint64_t)a2 endRegionIndex:(uint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;

  if (a3 < 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  while (v3 != a3)
  {
    v4 = a3 + v3;
    if (a3 + v3 < 0 != __OFADD__(a3, v3))
      ++v4;
    v5 = v4 >> 1;
    v6 = (unint64_t *)(*(_QWORD *)(a1 + 8) + 152 * (v4 >> 1));
    v7 = *v6;
    v8 = v6[1];
    if (a2 >= v7 && a2 - v7 < v8)
      return v5;
    if (a2 >= v7)
    {
      v3 = v5 + 1;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v5 >= a3)
        return v12;
    }
    else
    {
      a3 = v5 - 1;
      if (v3 >= v5)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v10 = (_QWORD *)(*(_QWORD *)(a1 + 8) + 152 * v3);
  v11 = a2 - *v10 < v10[1] && a2 >= *v10;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
    return v3;
  return v12;
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;
  id v9;
  _UICollectionLayoutItemSolver *solution;
  void *v11;
  void *v12;
  char v13;
  _UIRegionSolveResult *begin;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double y;
  double x;
  char *v22;
  double v23;
  double v24;
  double v25;
  _UIAuxillarySolveResult *v26;
  _UIAuxillarySolveResult *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  _UIAuxillarySolveResult *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CGPoint v37;

  if (objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    if (self)
      goto LABEL_4;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  if (a4 < 0)
    goto LABEL_28;
LABEL_3:
  if (self)
  {
LABEL_4:
    sectionAuxillarySolution = self->_sectionAuxillarySolution;
    goto LABEL_5;
  }
LABEL_29:
  sectionAuxillarySolution = 0;
LABEL_5:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:]((id *)&sectionAuxillarySolution->super.isa, a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    return v9;
  if (self)
    solution = self->_solution;
  else
    solution = 0;
  -[_UICollectionLayoutItemSolver supplementaryOffsets](solution);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementKinds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", a3);

  if ((v13 & 1) == 0)
    goto LABEL_12;
  if (self)
  {
    begin = self->_regions.__begin_;
    v15 = self->_regions.__end_ - begin;
    if (!v15
      || (v16 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:]((uint64_t)self, a4, 0x86BCA1AF286BCA1BLL * (v15 >> 3) - 1), v16 == 0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_12:
      v9 = 0;
      return v9;
    }
    v18 = v16;
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
    if (sectionGeometryTranslator)
    {
      x = sectionGeometryTranslator->_primaryContentFrame.origin.x;
      y = sectionGeometryTranslator->_primaryContentFrame.origin.y;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0;
    begin = (_UIRegionSolveResult *)MEMORY[8];
  }
  y = 0.0;
  x = 0.0;
LABEL_16:
  v22 = (char *)begin + 152 * v18;
  v23 = _UIRegionSolveResult::boundingFrameForIndex((_UIRegionSolveResult *)v22, a4);
  v25 = v24;
  v26 = (_UIAuxillarySolveResult *)*((_QWORD *)v22 + 12);
  v27 = (_UIAuxillarySolveResult *)*((_QWORD *)v22 + 13);
  while (v26 != v27)
  {
    -[_UICollectionLayoutFramesQueryResult auxillaryItem](*((_QWORD **)v26 + 5));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28, "elementKind");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v28) = objc_msgSend(v29, "isEqualToString:", a3);
    if ((v28 & 1) != 0)
    {
LABEL_24:
      v37.x = x + v23;
      v37.y = y + v25;
      _UIAuxillarySolveResult::queryResultForIndexAndOffset(v26, a4, v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    v26 = (_UIAuxillarySolveResult *)((char *)v26 + 48);
  }
  v30 = (char *)begin + 152 * v18;
  v26 = (_UIAuxillarySolveResult *)*((_QWORD *)v30 + 15);
  v31 = (_UIAuxillarySolveResult *)*((_QWORD *)v30 + 16);
  while (v26 != v31)
  {
    -[_UICollectionLayoutFramesQueryResult auxillaryItem](*((_QWORD **)v26 + 5));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v32, "elementKind");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v32) = objc_msgSend(v33, "isEqualToString:", a3);
    if ((v32 & 1) != 0)
      goto LABEL_24;
    v26 = (_UIAuxillarySolveResult *)((char *)v26 + 48);
  }
  v34 = 0;
LABEL_26:
  v9 = v34;
  return v9;
}

- (id)_queryFramesIntersectingRect:(CGFloat)a3 frameOffset:(CGFloat)a4
{
  id v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  unint64_t v24;
  CGFloat MinX;
  CGFloat v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  CGRect *v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double *p_width;
  CGFloat v38;
  double MinY;
  double v40;
  unint64_t v41;
  char *v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  _UIAuxillarySolveResult **v48;
  id **v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  _BOOL4 v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _UIAuxillarySolveResult *v64;
  _UIAuxillarySolveResult *v65;
  void *v66;
  _UIAuxillarySolveResult *v67;
  _UIAuxillarySolveResult *v68;
  void *v69;
  id *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double *v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  uint64_t v86;
  double v87;
  unint64_t v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  BOOL v93;
  uint64_t v95;
  double MaxY;
  double *v97;
  double v100;
  _UIAuxillarySolveResult **v101;
  _UIAuxillarySolveResult **v102;
  _UIAuxillarySolveResult **v103;
  double v104;
  CGFloat *v105;
  double v106;
  CGFloat *v107;
  unint64_t v108;
  CGFloat *v109;
  double v110;
  double Height;
  double v112;
  CGFloat *v113;
  double v114;
  _QWORD *v119;
  CGFloat rect1;
  CGFloat v121;
  double v122;
  double v123;
  CGPoint v124;
  CGPoint v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;

  if (!a1)
  {
    v8 = 0;
    return v8;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (double *)*(id *)(a1 + 80);
  if (v9)
  {
    v104 = v9[9];
    v106 = v9[10];
  }
  else
  {
    v104 = 0.0;
    v106 = 0.0;
  }
  v97 = v9;
  v123 = -[_UICollectionLayoutSectionGeometryTranslator contentRectForSectionRect:]((uint64_t)v9, a2, a3, a4, a5);
  v121 = v11;
  v122 = v10;
  rect1 = v12;
  v119 = (_QWORD *)a1;
  if (objc_msgSend((id)a1, "frameCount") >= 1)
  {
    v14 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16);
    v15 = v13 - v14;
    if (v13 != v14)
    {
      objc_msgSend((id)a1, "contentFrameIncludingAuxiliaries");
      v146.size.width = v16;
      v146.size.height = v17;
      v146.origin.x = 0.0;
      v146.origin.y = 0.0;
      v126.origin.x = v123;
      v126.size.width = v121;
      v126.origin.y = v122;
      v126.size.height = rect1;
      if (CGRectIntersectsRect(v126, v146))
      {
        v18 = *(_QWORD *)(a1 + 8);
        v19 = *(double *)(v18 + 64);
        v20 = *(double *)(v18 + 72);
        v21 = *(double *)(v18 + 80);
        v22 = *(double *)(v18 + 88);
        v127.origin.x = v19;
        v127.origin.y = v20;
        v127.size.width = v21;
        v127.size.height = v22;
        Height = CGRectGetHeight(v127);
        v23 = *(double *)(v18 + 24);
        v24 = *(_QWORD *)(v18 + 8);
        v128.origin.x = v19;
        v128.origin.y = v20;
        v128.size.width = v21;
        v128.size.height = v22;
        MinX = CGRectGetMinX(v128);
        v26 = *(double *)(v18 + 16);
        v129.origin.x = v19;
        v129.origin.y = v20;
        v129.size.width = v21;
        v129.size.height = v22;
        v130.size.width = CGRectGetWidth(v129);
        v130.size.height = (Height + v23) * (double)v24;
        v130.origin.x = MinX;
        v130.origin.y = v26;
        v147.origin.x = v123;
        v147.size.width = v121;
        v147.origin.y = v122;
        v147.size.height = rect1;
        if (CGRectIntersectsRect(v130, v147))
        {
          v27 = 0;
LABEL_9:
          v131.origin.x = v123;
          v131.size.width = v121;
          v131.origin.y = v122;
          v131.size.height = rect1;
          MaxY = CGRectGetMaxY(v131);
          v95 = v15 / 152;
          if (v27 < v15 / 152)
          {
            v100 = a7 + v106;
            v28 = a6 + v104 + 0.0;
            do
            {
              v29 = v119[1];
              v30 = (CGRect *)(v29 + 152 * v27);
              x = v30[2].origin.x;
              y = v30[2].origin.y;
              width = v30[2].size.width;
              v34 = v30[2].size.height;
              v132.origin.x = x;
              v132.origin.y = y;
              v132.size.width = width;
              v132.size.height = v34;
              v112 = CGRectGetHeight(v132);
              v35 = v30->size.height;
              v108 = *(_QWORD *)&v30->origin.y;
              v133.origin.x = x;
              v133.origin.y = y;
              v133.size.width = width;
              v133.size.height = v34;
              v36 = CGRectGetMinX(v133);
              v38 = v30->size.width;
              p_width = &v30->size.width;
              v134.origin.x = x;
              v134.origin.y = y;
              v134.size.width = width;
              v134.size.height = v34;
              v135.size.width = CGRectGetWidth(v134);
              v135.size.height = (v112 + v35) * (double)v108;
              v135.origin.x = v36;
              v135.origin.y = v38;
              if (CGRectGetMinY(v135) > MaxY)
                break;
              if (*(_QWORD *)&v30->origin.y)
              {
                v136.origin.x = v123;
                v136.size.width = v121;
                v136.origin.y = v122;
                v136.size.height = rect1;
                MinY = CGRectGetMinY(v136);
                v40 = CGRectGetHeight(v30[2]);
                v41 = *(_QWORD *)&v30->origin.x;
                v42 = *(char **)&v30->origin.x;
                if (MinY > *p_width)
                {
                  v43 = (MinY - *p_width) / (v40 + v30->size.height) + (double)v41;
                  if ((uint64_t)(v41 + *(_QWORD *)&v30->origin.y - 1) >= (uint64_t)v43)
                    v42 = (char *)(uint64_t)v43;
                  else
                    v42 = (char *)(v41 + *(_QWORD *)&v30->origin.y - 1);
                  if ((unint64_t)v42 < v41)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIRegionSolveResult::firstFrameIndexMatchingQueryRect(CGRect) const");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstIndex >= _range.location && firstIndex <= maxIndex"));

                  }
                }
                if (v42 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v137.origin.x = v123;
                  v137.size.width = v121;
                  v137.origin.y = v122;
                  v137.size.height = rect1;
                  v44 = CGRectGetMaxY(v137);
                  v45 = *(_QWORD *)&v30->origin.x + *(_QWORD *)&v30->origin.y - 1;
                  if ((uint64_t)v42 <= v45)
                  {
                    v46 = v44;
                    v47 = v29 + 152 * v27;
                    v109 = (CGFloat *)(v47 + 40);
                    v113 = (CGFloat *)(v47 + 32);
                    v105 = (CGFloat *)(v47 + 56);
                    v107 = (CGFloat *)(v47 + 48);
                    v102 = (_UIAuxillarySolveResult **)(v47 + 128);
                    v103 = (_UIAuxillarySolveResult **)(v47 + 120);
                    v101 = (_UIAuxillarySolveResult **)(v47 + 96);
                    v48 = (_UIAuxillarySolveResult **)(v47 + 104);
                    v49 = (id **)(v47 + 144);
                    while (1)
                    {
                      v50 = _UIRegionSolveResult::boundingFrameForIndex((_UIRegionSolveResult *)v30, (unint64_t)v42);
                      v52 = v51;
                      v54 = v53;
                      v56 = v55;
                      v138.origin.x = v123;
                      v138.size.width = v121;
                      v138.origin.y = v122;
                      v138.size.height = rect1;
                      v148.origin.x = v50;
                      v148.origin.y = v52;
                      v148.size.width = v54;
                      v148.size.height = v56;
                      v57 = CGRectIntersectsRect(v138, v148);
                      v139.origin.x = v50;
                      v139.origin.y = v52;
                      v139.size.width = v54;
                      v139.size.height = v56;
                      v58 = CGRectGetMinY(v139);
                      if (v57)
                      {
                        v59 = v100 + v58;
                        v140.origin.x = *v113;
                        v140.origin.y = *v109;
                        v140.size.width = *v107;
                        v140.size.height = *v105;
                        v141 = CGRectOffset(v140, v28, v59);
                        v60 = v141.origin.x;
                        v61 = v141.origin.y;
                        v62 = v141.size.width;
                        v63 = v141.size.height;
                        v64 = *v103;
                        v65 = *v102;
                        while (v64 != v65)
                        {
                          v124.x = v28;
                          v124.y = v59;
                          _UIAuxillarySolveResult::queryResultForIndexAndOffset(v64, (uint64_t)v42, v124);
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v8, "addObject:", v66);

                          v64 = (_UIAuxillarySolveResult *)((char *)v64 + 48);
                        }
                        v67 = *v101;
                        v68 = *v48;
                        while (v67 != v68)
                        {
                          v125.x = v28;
                          v125.y = v59;
                          _UIAuxillarySolveResult::queryResultForIndexAndOffset(v67, (uint64_t)v42, v125);
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v8, "addObject:", v69);

                          v67 = (_UIAuxillarySolveResult *)((char *)v67 + 48);
                        }
                        v70 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:](*v49, v42, v60, v61, v62, v63);
                        objc_msgSend(v8, "addObject:", v70);

                        if ((uint64_t)v42 >= v45)
                          break;
                      }
                      else if ((uint64_t)v42 >= v45 || v58 > v46)
                      {
                        break;
                      }
                      ++v42;
                    }
                  }
                }
              }
              ++v27;
            }
            while (v27 != v95);
          }
          goto LABEL_37;
        }
        v73 = v119[2] - v119[1];
        if (v73 >= 152)
        {
          v76 = 0;
          v77 = v73 / 0x98uLL - 1;
          while (1)
          {
            v78 = v119[17];
            v110 = _UIRectMinPointValueAlongAxis(v78, v123, v122);
            v79 = v77 + v76;
            if (v77 + v76 < 0 != __OFADD__(v77, v76))
              ++v79;
            v27 = v79 >> 1;
            v80 = v119[1];
            v81 = (double *)(v80 + 152 * (v79 >> 1));
            v82 = v81[8];
            v83 = v81[9];
            v84 = v81[10];
            v85 = v81[11];
            v142.origin.x = v82;
            v142.origin.y = v83;
            v142.size.width = v84;
            v142.size.height = v85;
            v114 = CGRectGetHeight(v142);
            v86 = v80 + 152 * v27;
            v87 = *(double *)(v86 + 24);
            v88 = *(_QWORD *)(v86 + 8);
            v143.origin.x = v82;
            v143.origin.y = v83;
            v143.size.width = v84;
            v143.size.height = v85;
            v89 = CGRectGetMinX(v143);
            v90 = *(double *)(v80 + 152 * v27 + 16);
            v144.origin.x = v82;
            v144.origin.y = v83;
            v144.size.width = v84;
            v144.size.height = v85;
            v91 = CGRectGetWidth(v144);
            v92 = _UIRectMinPointValueAlongAxis(v78, v89, v90);
            v145.origin.x = v89;
            v145.origin.y = v90;
            v145.size.width = v91;
            v145.size.height = (v114 + v87) * (double)v88;
            v149.origin.x = v123;
            v149.size.width = v121;
            v149.origin.y = v122;
            v149.size.height = rect1;
            v93 = CGRectIntersectsRect(v145, v149);
            if (v110 >= v92 && v93)
              goto LABEL_9;
            if (v110 >= v92)
            {
              v76 = v27 + 1;
              if (v27 >= v77)
                break;
            }
            else
            {
              v77 = v27 - 1;
              if (v76 >= v27)
                break;
            }
          }
        }
      }
    }
  }
LABEL_37:
  -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:](v119[8], a2, a3, a4, a5, a6, a7);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v74);

  return v8;
}

- (double)auxillaryHostPaddingBeforeBoundarySupplementaries
{
  NSCollectionLayoutSection *v2;
  double v3;
  double v4;

  v2 = self->_layoutSection;
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSCollectionLayoutSection _paddingToBoundarySupplementaries](v2, "_paddingToBoundarySupplementaries");
    v3 = v4;
  }

  return v3;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 2;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)_solveSectionAuxiliariesWithSectionContentSize:(double)a3
{
  _UICollectionLayoutSectionGeometryTranslator *v6;
  double v7;
  double v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char *v15;
  void *v16;
  _UICollectionLayoutSupplementaryEnroller *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double *v21;
  double v22;
  double v23;
  _UICollectionLayoutSectionGeometryTranslator *v24;
  uint64_t v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double *v35;
  double *v36;
  double v37;
  double v38;
  char *v39;
  void *v40;
  id v41;
  id v42;

  v6 = [_UICollectionLayoutSectionGeometryTranslator alloc];
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v9 = objc_msgSend((id)a1, "containerLayoutAxis");
  v10 = *(unsigned __int8 *)(a1 + 41);
  objc_msgSend((id)a1, "layoutSection");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "contentInsets");
  v15 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v6, v9, v10 != 0, a2, a3, v7, v8, v11, v12, v13, v14, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v16 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v15;

  v17 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  v18 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v17;

  v19 = -[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
  v20 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v19;

  v21 = *(double **)(a1 + 64);
  if (v21 && (v21[18] != 0.0 || v21[20] != 0.0 || v21[19] != 0.0 || v21[21] != 0.0))
  {
    v22 = v21[14];
    v23 = v21[15];
    v24 = [_UICollectionLayoutSectionGeometryTranslator alloc];
    v25 = objc_msgSend((id)a1, "containerLayoutAxis");
    v26 = *(unsigned __int8 *)(a1 + 41);
    objc_msgSend((id)a1, "layoutSection");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "contentInsets");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = (double *)*(id *)(a1 + 64);
    v36 = v35;
    if (v35)
    {
      v38 = v35[16];
      v37 = v35[17];
    }
    else
    {
      v37 = 0.0;
      v38 = 0.0;
    }
    v39 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v24, v25, v26 != 0, a2, a3, v22, v23, v28, v30, v32, v34, v38, v37);
    v40 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v39;

  }
}

- (unint64_t)containerLayoutAxis
{
  return self->_containerLayoutAxis;
}

- (id)auxillaryHostAuxillaryItems
{
  void *v2;
  void *v3;

  -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundarySupplementaryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)auxillaryHostSupplementaryEnroller
{
  if (self)
    self = (_UICollectionLayoutSectionListSolver *)self->_sectionSupplementaryEnroller;
  return self;
}

- (id)auxillaryHostPreferredSizes
{
  if (self)
    self = (_UICollectionLayoutSectionListSolver *)self->_preferredSizes;
  return self;
}

- (id)auxillaryHostContainer
{
  NSCollectionLayoutContainer *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UICollectionLayoutContainer *v13;
  id v14;
  double v15;
  double v16;
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
  void *memoizedAuxillaryHostContainer;

  if (!self || (v3 = self->_memoizedAuxillaryHostContainer) == 0)
  {
    if (-[NSCollectionLayoutSection supplementariesFollowContentInsets](self->_layoutSection, "supplementariesFollowContentInsets"))
    {
      v4 = -[_UICollectionLayoutSectionListSolver containerLayoutAxis](self, "containerLayoutAxis");
      -[NSCollectionLayoutSection contentInsets](self->_layoutSection, "contentInsets");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v13 = [_UICollectionLayoutContainer alloc];
      -[_UICollectionLayoutSectionListSolver supplementaryContainer](self, "supplementaryContainer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentSize");
      v17 = v4 == 2;
      if (v4 == 1)
        v17 = 2;
      v18 = 0.0;
      if (v17 == 2)
        v19 = 0.0;
      else
        v19 = v12;
      if (v17 == 2)
        v20 = 0.0;
      else
        v20 = v8;
      if (v17 == 1)
      {
        v19 = v12;
        v21 = 0.0;
      }
      else
      {
        v21 = v10;
      }
      if (v17 == 1)
        v22 = v8;
      else
        v22 = v20;
      if (v17 == 1)
        v23 = 0.0;
      else
        v23 = v6;
      if (v17)
        v24 = v19;
      else
        v24 = 0.0;
      if (v17)
        v25 = v21;
      else
        v25 = 0.0;
      if (v17)
        v26 = v22;
      else
        v26 = 0.0;
      if (v17)
        v18 = v23;
      memoizedAuxillaryHostContainer = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v13, v15, v16, v18, v26, v25, v24);
      objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, memoizedAuxillaryHostContainer);
    }
    else
    {
      -[_UICollectionLayoutSectionListSolver supplementaryContainer](self, "supplementaryContainer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      memoizedAuxillaryHostContainer = self->_memoizedAuxillaryHostContainer;
      self->_memoizedAuxillaryHostContainer = (NSCollectionLayoutContainer *)v14;
    }

    v3 = self->_memoizedAuxillaryHostContainer;
  }
  return v3;
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

- (id)initWithLayoutSection:(void *)a1
{
  id *v4;
  id *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v10;
  objc_super v11;

  if (!a1)
    return 0;
  if ((objc_msgSend(a2, "prefersListSolver") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLayoutSection_, a1, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSection.prefersListSolver"));

  }
  v11.receiver = a1;
  v11.super_class = (Class)_UICollectionLayoutSectionListSolver;
  v4 = (id *)objc_msgSendSuper2(&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 13, a2);
    v5[17] = 0;
    objc_msgSend(a2, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v5 + 40) = objc_msgSend(v7, "isContainerSize") ^ 1;

    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *((_OWORD *)v5 + 12) = *MEMORY[0x1E0C9D628];
    *((_OWORD *)v5 + 13) = v8;
    objc_msgSend(v5[13], "_checkForDuplicateSupplementaryItemKindsAndThrowIfFound");
  }
  return v5;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
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

- (CGSize)auxillaryHostContentSize
{
  void *v3;
  int v4;
  unint64_t v5;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
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

  -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrollsOrthogonally");
  v5 = -[_UICollectionLayoutSectionListSolver layoutAxis](self, "layoutAxis");
  if (self)
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
  else
    sectionGeometryTranslator = 0;
  v7 = -[_UICollectionLayoutSectionGeometryTranslator auxillaryHostContentSize]((uint64_t)sectionGeometryTranslator);
  v9 = v8;
  v10 = v5 == 2;
  if (v5 == 1)
    v10 = 2;
  if (v4)
    v11 = v5;
  else
    v11 = v10;
  -[_UICollectionLayoutSectionListSolver supplementaryContainer](self, "supplementaryContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentSize");
  v15 = _UISizeValueForAxis(v11, v13, v14);

  v16 = _UISetSizeValueForAxis(v11, v7, v9, v15);
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (NSCollectionLayoutContainer)supplementaryContainer
{
  return self->_supplementaryContainer;
}

- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9
{
  id v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  _UICollectionLayoutContainer *v37;
  void *v38;
  double v39;
  double v40;
  _UICollectionLayoutItemSolver *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  void *v48;
  double *v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  _QWORD *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 *v77;
  __int128 *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  __int128 *v86;
  __int128 *v87;
  __int128 *v88;
  __int128 *v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  __int128 *v104;
  __int128 *v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  __int128 *v113;
  __int128 *v114;
  __int128 *v115;
  __int128 *v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v128;
  void **value;
  unint64_t begin;
  void **j;
  _UIRegionSolveResult *v132;
  uint64_t v133;
  _UICollectionLayoutSectionListSolver *v134;
  _UIRegionSolveResult *v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __int128 v142;
  _UIRegionSolveResult *v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  double v148;
  unint64_t v149;
  CGFloat v150;
  CGFloat v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  _UICollectionLayoutItemSolver *solution;
  id *v162;
  _UICollectionLayoutSolveParameters *v163;
  id *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  double v169;
  double *v170;
  double *v172;
  uint64_t v173;
  id *v174;
  _UICollectionLayoutSectionListSolver *v175;
  id v176;
  double v177;
  id v178;
  id v179;
  id obj;
  id v181;
  id v182;
  id v183;
  __int128 **v184;
  __int128 *v185;
  __int128 *v186;
  double v187;
  unint64_t *v188;
  CGRect v189;
  uint64_t v190;
  id v191[4];
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 *v200;
  __int128 *v201;
  unint64_t v202;
  __int128 *v203;
  __int128 *v204;
  unint64_t v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  void **v210;
  __int128 v211;
  _UIRegionSolveResult *v212;
  __compressed_pair<_UIRegionSolveResult *, std::allocator<_UIRegionSolveResult>> *p_end_cap;
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  uint64_t v217;
  _NSRange v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;

  v217 = *MEMORY[0x1E0C80C00];
  -[_UICollectionLayoutSectionListSolver setContainer:](self, "setContainer:");
  if (a4)
    v15 = a4;
  else
    v15 = a3;
  -[_UICollectionLayoutSectionListSolver setSupplementaryContainer:](self, "setSupplementaryContainer:", v15);
  -[_UICollectionLayoutSectionListSolver setTraitCollection:](self, "setTraitCollection:", a5);
  -[_UICollectionLayoutSectionListSolver setContainerLayoutAxis:](self, "setContainerLayoutAxis:", a6);
  v175 = self;
  -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
  v181 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v181, "scrollsOrthogonally");
  v17 = a6 == 2;
  if (a6 == 1)
    v17 = 2;
  if (v16)
    v18 = v17;
  else
    v18 = a6;
  -[_UICollectionLayoutSectionListSolver setLayoutAxis:](self, "setLayoutAxis:", v18);

  -[_UICollectionLayoutSectionListSolver setFrameCount:](self, "setFrameCount:", a7);
  -[_UICollectionLayoutSectionListSolver setLayoutRTL:](self, "setLayoutRTL:", a9);
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)self, a8);
  if (self)
  {
    v173 = -[_UICollectionLayoutSectionListSolver layoutAxis](self, "layoutAxis");
    -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionLayoutSectionListSolver container](self, "container");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    if (-[_UICollectionLayoutSectionListSolver layoutAxis](self, "layoutAxis") == 2)
    {
      -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "contentInsets");
      v30 = v29;

      -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "contentInsets");
      v23 = v23 + v30;
      v27 = v27 + v32;
    }
    else if (-[_UICollectionLayoutSectionListSolver layoutAxis](self, "layoutAxis") == 1)
    {
      -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "contentInsets");
      v35 = v34;

      -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "contentInsets");
      v21 = v21 + v35;
      v25 = v25 + v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__sectionContainer, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 872, CFSTR("Unknown layout axis."));
    }

    v37 = [_UICollectionLayoutContainer alloc];
    -[_UICollectionLayoutSectionListSolver container](self, "container");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "contentSize");
    v172 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v37, v39, v40, v21, v23, v25, v27);

    v41 = [_UICollectionLayoutItemSolver alloc];
    -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "group");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = -[_UICollectionLayoutItemSolver initWithItem:](v41, v43);

    -[_UICollectionLayoutSectionListSolver traitCollection](self, "traitCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[_UICollectionLayoutSectionListSolver layoutRTL](self, "layoutRTL");
    if (v174)
      -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:]((uint64_t)v174, v172, v173, v44, 0x7FFFFFFFFFFFFFFFLL, v45, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    -[_UICollectionLayoutItemSolver itemFrames]((uint64_t)v174);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "handleFailureInMethod:object:file:lineNumber:description:", sel__initialSolve, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solution.itemFrames.count == 1"));

    }
    -[_UICollectionLayoutItemSolver itemFrames]((uint64_t)v174);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (double *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v51 = v49[8];
      v50 = v49[9];
      v52 = v49[10];
      v53 = v49[11];
    }
    else
    {
      v50 = 0.0;
      v52 = 0.0;
      v53 = 0.0;
      v51 = 0.0;
    }
    v170 = v49;
    -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v174);
    v55 = v54;
    v57 = v56;
    _UISizeValueForAxis(v173, v52, v53);
    _UISizeValueForAxis(v173, v55, v57);
    -[_UICollectionLayoutItemSolver auxillaryFrames]((uint64_t)v174);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v176 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v208 = 0u;
    v209 = 0u;
    v206 = 0u;
    v207 = 0u;
    obj = v168;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v216, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v207;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v207 != v59)
            objc_enumerationMutation(obj);
          v61 = *(_QWORD **)(*((_QWORD *)&v206 + 1) + 8 * i);
          -[_UICollectionLayoutFramesQueryResult auxillaryItem](v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v62)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", sel__initialSolve, v175, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxilaryItem"));

          }
          if (v61)
          {
            v63 = v61[7];
            v64 = v182;
            if (v63 != 4)
            {
              if (v63 != 3)
                goto LABEL_33;
              v64 = v176;
            }
            objc_msgSend(v64, "addObject:", v61);
          }
LABEL_33:

        }
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v216, 16);
      }
      while (v58);
    }

    -[_UICollectionLayoutSectionListSolver frameCount](v175, "frameCount");
    objc_msgSend(v176, "count");
    objc_msgSend(v182, "count");
    -[_UICollectionLayoutSectionListSolver layoutSection](v175, "layoutSection");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "interGroupSpacing");
    v169 = v67;

    v203 = 0;
    v204 = 0;
    v205 = 0;
    std::vector<_UIAuxillarySolveResult>::reserve(&v203, objc_msgSend(v176, "count"));
    v200 = 0;
    v201 = 0;
    v202 = 0;
    std::vector<_UIAuxillarySolveResult>::reserve(&v200, objc_msgSend(v182, "count"));
    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v179 = v176;
    v68 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v196, v215, 16);
    if (v68)
    {
      v69 = *(_QWORD *)v197;
      do
      {
        v70 = 0;
        do
        {
          if (*(_QWORD *)v197 != v69)
            objc_enumerationMutation(v179);
          v71 = *(_QWORD **)(*((_QWORD *)&v196 + 1) + 8 * v70);
          if (v71)
          {
            v73 = v71[8];
            v72 = v71[9];
            v75 = v71[10];
            v74 = v71[11];
            v76 = v71[2];
          }
          else
          {
            v76 = 0;
            v74 = 0;
            v75 = 0;
            v72 = 0;
            v73 = 0;
          }
          v77 = v204;
          if ((unint64_t)v204 >= v205)
          {
            v79 = 0xAAAAAAAAAAAAAAABLL * (v204 - v203);
            v80 = v79 + 1;
            if (v79 + 1 > 0x555555555555555)
              abort();
            if (0x5555555555555556 * ((uint64_t)(v205 - (_QWORD)v203) >> 4) > v80)
              v80 = 0x5555555555555556 * ((uint64_t)(v205 - (_QWORD)v203) >> 4);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v205 - (_QWORD)v203) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v81 = 0x555555555555555;
            else
              v81 = v80;
            v188 = &v205;
            v82 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIAuxillarySolveResult>>(v81);
            v84 = v83;
            v85 = &v82[48 * v79];
            *((_QWORD *)v85 + 5) = 0;
            *(_QWORD *)v85 = v73;
            *((_QWORD *)v85 + 1) = v72;
            *((_QWORD *)v85 + 2) = v75;
            *((_QWORD *)v85 + 3) = v74;
            *((_QWORD *)v85 + 4) = v76;
            objc_storeStrong((id *)v85 + 5, v71);
            v87 = v203;
            v86 = v204;
            if (v204 == v203)
            {
              v87 = v204;
              v89 = (__int128 *)v85;
            }
            else
            {
              v88 = v204;
              v89 = (__int128 *)v85;
              do
              {
                v90 = *(v88 - 3);
                v91 = *(v88 - 2);
                *((_QWORD *)v89 - 2) = *((_QWORD *)v88 - 2);
                *(v89 - 3) = v90;
                *(v89 - 2) = v91;
                v92 = *((_QWORD *)v88 - 1);
                *((_QWORD *)v88 - 1) = 0;
                *((_QWORD *)v89 - 1) = v92;
                v89 -= 3;
                v88 -= 3;
              }
              while (v88 != v87);
            }
            v78 = (__int128 *)(v85 + 48);
            v203 = v89;
            v204 = v78;
            v93 = v205;
            v205 = (unint64_t)&v82[48 * v84];
            v186 = v86;
            v187 = *(double *)&v93;
            v184 = (__int128 **)v87;
            v185 = v87;
            std::__split_buffer<_UIAuxillarySolveResult>::~__split_buffer((uint64_t)&v184);
          }
          else
          {
            *((_QWORD *)v204 + 5) = 0;
            *(_QWORD *)v77 = v73;
            *((_QWORD *)v77 + 1) = v72;
            *((_QWORD *)v77 + 2) = v75;
            *((_QWORD *)v77 + 3) = v74;
            *((_QWORD *)v77 + 4) = v76;
            objc_storeStrong((id *)v77 + 5, v71);
            v78 = v77 + 3;
          }
          v204 = v78;
          ++v70;
        }
        while (v70 != v68);
        v94 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v196, v215, 16);
        v68 = v94;
      }
      while (v94);
    }

    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    v178 = v182;
    v95 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v192, v214, 16);
    if (v95)
    {
      v96 = *(_QWORD *)v193;
      do
      {
        v97 = 0;
        do
        {
          if (*(_QWORD *)v193 != v96)
            objc_enumerationMutation(v178);
          v98 = *(_QWORD **)(*((_QWORD *)&v192 + 1) + 8 * v97);
          if (v98)
          {
            v100 = v98[8];
            v99 = v98[9];
            v102 = v98[10];
            v101 = v98[11];
            v103 = v98[2];
          }
          else
          {
            v103 = 0;
            v101 = 0;
            v102 = 0;
            v99 = 0;
            v100 = 0;
          }
          v104 = v201;
          if ((unint64_t)v201 >= v202)
          {
            v106 = 0xAAAAAAAAAAAAAAABLL * (v201 - v200);
            v107 = v106 + 1;
            if (v106 + 1 > 0x555555555555555)
              abort();
            if (0x5555555555555556 * ((uint64_t)(v202 - (_QWORD)v200) >> 4) > v107)
              v107 = 0x5555555555555556 * ((uint64_t)(v202 - (_QWORD)v200) >> 4);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v202 - (_QWORD)v200) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v108 = 0x555555555555555;
            else
              v108 = v107;
            v188 = &v202;
            v109 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIAuxillarySolveResult>>(v108);
            v111 = v110;
            v112 = &v109[48 * v106];
            *((_QWORD *)v112 + 5) = 0;
            *(_QWORD *)v112 = v100;
            *((_QWORD *)v112 + 1) = v99;
            *((_QWORD *)v112 + 2) = v102;
            *((_QWORD *)v112 + 3) = v101;
            *((_QWORD *)v112 + 4) = v103;
            objc_storeStrong((id *)v112 + 5, v98);
            v114 = v200;
            v113 = v201;
            if (v201 == v200)
            {
              v114 = v201;
              v116 = (__int128 *)v112;
            }
            else
            {
              v115 = v201;
              v116 = (__int128 *)v112;
              do
              {
                v117 = *(v115 - 3);
                v118 = *(v115 - 2);
                *((_QWORD *)v116 - 2) = *((_QWORD *)v115 - 2);
                *(v116 - 3) = v117;
                *(v116 - 2) = v118;
                v119 = *((_QWORD *)v115 - 1);
                *((_QWORD *)v115 - 1) = 0;
                *((_QWORD *)v116 - 1) = v119;
                v116 -= 3;
                v115 -= 3;
              }
              while (v115 != v114);
            }
            v105 = (__int128 *)(v112 + 48);
            v200 = v116;
            v201 = (__int128 *)(v112 + 48);
            v120 = v202;
            v202 = (unint64_t)&v109[48 * v111];
            v186 = v113;
            v187 = *(double *)&v120;
            v184 = (__int128 **)v114;
            v185 = v114;
            std::__split_buffer<_UIAuxillarySolveResult>::~__split_buffer((uint64_t)&v184);
          }
          else
          {
            *((_QWORD *)v201 + 5) = 0;
            *(_QWORD *)v104 = v100;
            *((_QWORD *)v104 + 1) = v99;
            *((_QWORD *)v104 + 2) = v102;
            *((_QWORD *)v104 + 3) = v101;
            *((_QWORD *)v104 + 4) = v103;
            objc_storeStrong((id *)v104 + 5, v98);
            v105 = v104 + 3;
          }
          v201 = v105;
          ++v97;
        }
        while (v97 != v95);
        v121 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v192, v214, 16);
        v95 = v121;
      }
      while (v121);
    }

    v219.origin.x = v51;
    v219.origin.y = v50;
    v219.size.width = v52;
    v219.size.height = v53;
    MinX = CGRectGetMinX(v219);
    v220.origin.x = v51;
    v220.origin.y = v50;
    v220.size.width = v52;
    v220.size.height = v53;
    MinY = CGRectGetMinY(v220);
    v221.origin.x = -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v174);
    v226.origin.x = MinX;
    v226.origin.y = MinY;
    v226.size.width = v52;
    v226.size.height = v53;
    v222 = CGRectUnion(v221, v226);
    x = v222.origin.x;
    y = v222.origin.y;
    width = v222.size.width;
    height = v222.size.height;
    v128 = operator new();
    *(_OWORD *)(v128 + 64) = 0u;
    *(_OWORD *)(v128 + 80) = 0u;
    *(_OWORD *)(v128 + 96) = 0u;
    *(_QWORD *)(v128 + 112) = 0;
    *(CGFloat *)v128 = MinX;
    *(CGFloat *)(v128 + 8) = MinY;
    *(double *)(v128 + 16) = v52;
    *(double *)(v128 + 24) = v53;
    *(CGFloat *)(v128 + 32) = x;
    *(CGFloat *)(v128 + 40) = y;
    *(CGFloat *)(v128 + 48) = width;
    *(CGFloat *)(v128 + 56) = height;
    objc_storeStrong((id *)(v128 + 112), v170);
    std::vector<_UIAuxillarySolveResult>::__assign_with_size[abi:nn180100]<_UIAuxillarySolveResult*,_UIAuxillarySolveResult*>(v128 + 88, v203, v204, 0xAAAAAAAAAAAAAAABLL * (v204 - v203));
    std::vector<_UIAuxillarySolveResult>::__assign_with_size[abi:nn180100]<_UIAuxillarySolveResult*,_UIAuxillarySolveResult*>(v128 + 64, v200, v201, 0xAAAAAAAAAAAAAAABLL * (v201 - v200));
    value = (void **)v175->_templateItemSolveResult.__ptr_.__value_;
    v175->_templateItemSolveResult.__ptr_.__value_ = (_UIItemSolveResult *)v128;
    if (value)
      std::default_delete<_UIItemSolveResult>::operator()[abi:nn180100](value);
    v218.length = v175->_frameCount;
    v218.location = 0;
    _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)&v184, v218, 0.0, v169, (const _UIItemSolveResult *)v128);
    begin = (unint64_t)v175->_regions.__begin_;
    for (j = (void **)v175->_regions.__end_;
          j != (void **)begin;
          std::__destroy_at[abi:nn180100]<_UIRegionSolveResult,0>(j))
    {
      j -= 19;
    }
    v132 = v175->_regions.__end_cap_.__value_;
    v175->_regions.__end_ = (_UIRegionSolveResult *)begin;
    if (begin >= (unint64_t)v132)
    {
      v135 = v175->_regions.__begin_;
      v136 = 0x86BCA1AF286BCA1BLL * ((uint64_t)(begin - (_QWORD)v135) >> 3);
      if (v136 + 1 > 0x1AF286BCA1AF286)
        abort();
      v137 = 0x86BCA1AF286BCA1BLL * ((v132 - v135) >> 3);
      v138 = 2 * v137;
      if (2 * v137 <= v136 + 1)
        v138 = v136 + 1;
      if (v137 >= 0xD79435E50D7943)
        v139 = 0x1AF286BCA1AF286;
      else
        v139 = v138;
      p_end_cap = &v175->_regions.__end_cap_;
      if (v139)
        v139 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIRegionSolveResult>>(v139);
      else
        v140 = 0;
      v210 = (void **)v139;
      *(_QWORD *)&v211 = v139 + 152 * v136;
      *((_QWORD *)&v211 + 1) = v211;
      v212 = (_UIRegionSolveResult *)(v139 + 152 * v140);
      std::construct_at[abi:nn180100]<_UIRegionSolveResult,_UIRegionSolveResult const&,_UIRegionSolveResult*>(v211, (uint64_t)&v184);
      v133 = *((_QWORD *)&v211 + 1) + 152;
      v134 = v175;
      v141 = std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<_UIRegionSolveResult>,std::reverse_iterator<_UIRegionSolveResult*>,std::reverse_iterator<_UIRegionSolveResult*>,std::reverse_iterator<_UIRegionSolveResult*>>((uint64_t)v175->_regions.__end_, (uint64_t)v175->_regions.__end_, (uint64_t)v175->_regions.__begin_, (uint64_t)v175->_regions.__begin_, v211, v211);
      v142 = *(_OWORD *)&v175->_regions.__begin_;
      v175->_regions.__begin_ = (_UIRegionSolveResult *)v141;
      v175->_regions.__end_ = (_UIRegionSolveResult *)v133;
      v211 = v142;
      v143 = v175->_regions.__end_cap_.__value_;
      v175->_regions.__end_cap_.__value_ = v212;
      v212 = v143;
      v210 = (void **)v142;
      std::__split_buffer<_UIRegionSolveResult>::~__split_buffer((uint64_t)&v210);
    }
    else
    {
      std::construct_at[abi:nn180100]<_UIRegionSolveResult,_UIRegionSolveResult const&,_UIRegionSolveResult*>(begin, (uint64_t)&v184);
      v133 = begin + 152;
      v134 = v175;
      v175->_regions.__end_ = (_UIRegionSolveResult *)(begin + 152);
    }
    v134->_regions.__end_ = (_UIRegionSolveResult *)v133;
    v144 = v189.origin.x;
    v145 = v189.origin.y;
    v146 = v189.size.width;
    v147 = v189.size.height;
    v177 = CGRectGetHeight(v189);
    v148 = v187;
    v149 = (unint64_t)v185;
    v223.origin.x = v144;
    v223.origin.y = v145;
    v223.size.width = v146;
    v223.size.height = v147;
    v150 = CGRectGetMinX(v223);
    v151 = *(double *)&v186;
    v224.origin.x = v144;
    v224.origin.y = v145;
    v224.size.width = v146;
    v224.size.height = v147;
    v152 = CGRectGetWidth(v224);
    if (v134->_frameCount < 1)
    {
      v153 = 0.0;
    }
    else
    {
      v225.size.width = v152;
      v225.size.height = (v177 + v148) * (double)v149;
      v225.origin.x = v150;
      v225.origin.y = v151;
      v153 = CGRectGetHeight(v225) - v169;
    }
    -[_UICollectionLayoutSectionListSolver container](v134, "container");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "effectiveContentSize");
    v156 = v155;
    v158 = v157;

    v159 = _UISetSizeValueForAxis(v173, v156, v158, v153);
    -[_UICollectionLayoutSectionListSolver _solveSectionAuxiliariesWithSectionContentSize:]((uint64_t)v175, v159, v160);
    solution = v175->_solution;
    v175->_solution = (_UICollectionLayoutItemSolver *)v174;
    v162 = v174;

    v210 = v191;
    std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100](&v210);
    v210 = (void **)&v190;
    std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100](&v210);
    v184 = &v200;
    std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v184);
    v184 = &v203;
    std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v184);

  }
  if (a8)
  {
    -[_UICollectionPreferredSizes indexes]((uint64_t)a8);
    v183 = (id)objc_claimAutoreleasedReturnValue();
    v163 = [_UICollectionLayoutSolveParameters alloc];
    v164 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:scrollOffset:visibleBounds:]((id *)&v163->super.isa, v183, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v165 = -[_UICollectionLayoutSectionListSolver _resolveWithParameters:](v175, (uint64_t)v164);

  }
}

- (NSCollectionLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (NSCollectionLayoutContainer)container
{
  return self->_container;
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

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (void)setPreferredSizes:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (_UICollectionLayoutSolveResult)_resolveWithParameters:(_QWORD *)a1
{
  void *v4;
  _UICollectionLayoutSolveResult *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  CGFloat *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  CGFloat MinX;
  CGFloat v24;
  double v25;
  int64_t v26;
  int64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  unint64_t v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  uint64_t v48;
  double v49;
  unint64_t v50;
  CGFloat v51;
  CGFloat v52;
  double Width;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double Height;
  double v69;
  double v70;
  _QWORD v71[5];
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  if (a1)
  {
    if (a1[2] == a1[1])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", sel__resolveWithParameters_, a1, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_regions.size()"));

    }
    -[UIBarButtonItemGroup _items]((id *)a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(_UICollectionLayoutSolveResult);
    if (a2
      && (*(_BYTE *)(a2 + 24) || objc_msgSend(*(id *)(a2 + 8), "count") || objc_msgSend(*(id *)(a2 + 16), "count")))
    {
      if (v5)
        -[NSMutableIndexSet addIndexes:](v5->_invalidatedIndexes, "addIndexes:", v4);
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __63___UICollectionLayoutSectionListSolver__resolveWithParameters___block_invoke;
      v71[3] = &unk_1E16B2AC8;
      v71[4] = a1;
      objc_msgSend(v4, "enumerateIndexesUsingBlock:", v71);
      if (objc_msgSend(v4, "count"))
      {
        v6 = objc_msgSend(v4, "firstIndex");
        v8 = a1[1];
        v7 = a1[2];
        v9 = v7 - v8;
        if (v7 - v8 <= 151)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", sel__recomputeRegionOffsetsStartingAtFrameIndex_, a1, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 806, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionCount > 0"));

          v8 = a1[1];
          v7 = a1[2];
        }
        v10 = v7 - v8;
        if (!v10
          || (v11 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:]((uint64_t)a1, v6, -1 - 0x79435E50D79435E5 * (v10 >> 3)), v11 == 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__recomputeRegionOffsetsStartingAtFrameIndex_, a1, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 810, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionIndex != NSNotFound"));

          v8 = a1[1];
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v13 = v11 - (v11 > 0);
        v14 = (CGFloat *)(v8 + 152 * v13);
        v15 = v14[2];
        v14 += 2;
        v65 = v15;
        v16 = v14[6];
        v17 = v14[7];
        v18 = v14[8];
        v19 = v14[9];
        v72.origin.x = v16;
        v72.origin.y = v17;
        v72.size.width = v18;
        v72.size.height = v19;
        Height = CGRectGetHeight(v72);
        v20 = v8 + 152 * v13;
        v21 = *(double *)(v20 + 24);
        v22 = *(_QWORD *)(v20 + 8);
        v73.origin.x = v16;
        v73.origin.y = v17;
        v73.size.width = v18;
        v73.size.height = v19;
        MinX = CGRectGetMinX(v73);
        v24 = *v14;
        v74.origin.x = v16;
        v74.origin.y = v17;
        v74.size.width = v18;
        v74.size.height = v19;
        v75.size.width = CGRectGetWidth(v74);
        v75.size.height = (Height + v21) * (double)v22;
        v75.origin.x = MinX;
        v75.origin.y = v24;
        v25 = CGRectGetHeight(v75);
        v26 = 0x86BCA1AF286BCA1BLL * (v9 >> 3);
        v27 = v13 + 1;
        if (v13 + 1 < v26)
        {
          v28 = v65 + v25;
          v29 = 152 * v13 + 160;
          do
          {
            v30 = a1[1] + v29;
            v66 = v28;
            *(double *)(v30 + 8) = v28;
            v31 = *(double *)(v30 + 56);
            v32 = *(double *)(v30 + 64);
            v33 = *(double *)(v30 + 72);
            v34 = *(double *)(v30 + 80);
            v76.origin.x = v31;
            v76.origin.y = v32;
            v76.size.width = v33;
            v76.size.height = v34;
            v69 = CGRectGetHeight(v76);
            v35 = *(double *)(v30 + 16);
            v36 = *(_QWORD *)v30;
            v77.origin.x = v31;
            v77.origin.y = v32;
            v77.size.width = v33;
            v77.size.height = v34;
            v37 = CGRectGetMinX(v77);
            v38 = *(double *)(v30 + 8);
            v78.origin.x = v31;
            v78.origin.y = v32;
            v78.size.width = v33;
            v78.size.height = v34;
            v79.size.width = CGRectGetWidth(v78);
            v79.size.height = (v69 + v35) * (double)v36;
            v79.origin.x = v37;
            v79.origin.y = v38;
            v28 = v66 + CGRectGetHeight(v79);
            ++v27;
            v29 += 152;
          }
          while (v27 < v26);
        }
      }
      objc_msgSend(a1, "layoutSection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "interGroupSpacing");
      v70 = v40;

      v41 = a1[1];
      v42 = -1 - 0x79435E50D79435E5 * ((a1[2] - v41) >> 3);
      v43 = (double *)(v41 + 152 * v42);
      v44 = v43[8];
      v45 = v43[9];
      v46 = v43[10];
      v47 = v43[11];
      v80.origin.x = v44;
      v80.origin.y = v45;
      v80.size.width = v46;
      v80.size.height = v47;
      v67 = CGRectGetHeight(v80);
      v48 = v41 + 152 * v42;
      v49 = *(double *)(v48 + 24);
      v50 = *(_QWORD *)(v48 + 8);
      v81.origin.x = v44;
      v81.origin.y = v45;
      v81.size.width = v46;
      v81.size.height = v47;
      v51 = CGRectGetMinX(v81);
      v52 = *(double *)(v41 + 152 * v42 + 16);
      v82.origin.x = v44;
      v82.origin.y = v45;
      v82.size.width = v46;
      v82.size.height = v47;
      Width = CGRectGetWidth(v82);
      if ((uint64_t)a1[19] < 1)
      {
        v54 = 0.0;
      }
      else
      {
        v83.size.width = Width;
        v83.size.height = (v67 + v49) * (double)v50;
        v83.origin.x = v51;
        v83.origin.y = v52;
        v54 = CGRectGetMaxY(v83) - v70;
      }
      objc_msgSend(a1, "container");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "effectiveContentSize");
      v57 = v56;
      v59 = v58;

      v60 = _UISetSizeValueForAxis(a1[17], v57, v59, v54);
      -[_UICollectionLayoutSectionListSolver _solveSectionAuxiliariesWithSectionContentSize:]((uint64_t)a1, v60, v61);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void)setSupplementaryContainer:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryContainer, a3);
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

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UICollectionLayoutSupplementaryEnroller *v8;
  _UICollectionLayoutSupplementaryEnroller *v9;
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  v9 = v8;
  if (self)
  {
    objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, v8);

    sectionAuxillarySolution = self->_sectionAuxillarySolution;
  }
  else
  {

    sectionAuxillarySolution = 0;
  }
  -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:]((id *)&sectionAuxillarySolution->super.isa, x, y, width, height);
}

- (NSIndexSet)pinnedSupplementaryIndexes
{
  _UICollectionLayoutAuxillaryItemSolver *sectionAuxillarySolution;

  if (self)
  {
    sectionAuxillarySolution = self->_sectionAuxillarySolution;
    if (sectionAuxillarySolution)
      sectionAuxillarySolution = (_UICollectionLayoutAuxillaryItemSolver *)sectionAuxillarySolution->_pinnedSupplementaryIndexes;
  }
  else
  {
    sectionAuxillarySolution = 0;
  }
  return (NSIndexSet *)sectionAuxillarySolution;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return !CGRectIsNull(self->_overrideContentRectForPinning);
}

- (CGRect)auxillaryHostPinningRect
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
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
    height = 0.0;
    if (self)
    {
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      width = 0.0;
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
      width = 0.0;
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

- (id)sectionSupplementaryFrameForIndex:(int64_t)a3
{
  _UICollectionLayoutSectionListSolver *v5;
  void *v6;
  unint64_t v7;
  id *p_isa;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v5 = self;
  if (self)
    self = (_UICollectionLayoutSectionListSolver *)self->_sectionAuxillarySolution;
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < self.sectionAuxillarySolution.supplementaryFrames.count"));

    if (v5)
    {
LABEL_5:
      if (v5->_sectionGeometryTranslator)
        goto LABEL_6;
    }
  }
  else if (v5)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

  if (!v5)
  {
    p_isa = 0;
    goto LABEL_7;
  }
LABEL_6:
  p_isa = (id *)&v5->_sectionAuxillarySolution->super.isa;
LABEL_7:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](p_isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4
{
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)self, a4);
  return -[_UICollectionLayoutSectionListSolver _resolveWithParameters:](self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  void **value;
  _UIRegionSolveResult *begin;
  void **end;
  _UIRegionSolveResult *v6;

  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_supplementaryContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
  objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_sectionAuxillarySolution, 0);
  objc_storeStrong((id *)&self->_solution, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  value = (void **)self->_templateItemSolveResult.__ptr_.__value_;
  self->_templateItemSolveResult.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<_UIItemSolveResult>::operator()[abi:nn180100](value);
  begin = self->_regions.__begin_;
  if (begin)
  {
    end = (void **)self->_regions.__end_;
    v6 = self->_regions.__begin_;
    if (end != (void **)begin)
    {
      do
      {
        end -= 19;
        std::__destroy_at[abi:nn180100]<_UIRegionSolveResult,0>(end);
      }
      while (end != (void **)begin);
      v6 = self->_regions.__begin_;
    }
    self->_regions.__end_ = begin;
    operator delete(v6);
  }
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
    -[_UICollectionLayoutSectionListSolver sectionSupplementaryFrameForIndex:](self, "sectionSupplementaryFrameForIndex:", a3);
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < sectionAuxillarySolution.unpinnedFramesOfPinnedSupplementaries.count"));

    if (!self)
      goto LABEL_11;
  }
  else if (!self)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

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

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[_UICollectionLayoutSectionListSolver solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:](self, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", a3, 0, a4, a5, a6, 0, v6);
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[_UICollectionLayoutSectionListSolver solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:](self, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", a3, 0, a4, a5, a6, a7, v7);
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4
{
  CGSize v5;

  self->_overrideContentRectForPinning = a4;
  -[_UICollectionLayoutSectionListSolver updatePinnedSupplementaryItemsWithVisibleBounds:](self, "updatePinnedSupplementaryItemsWithVisibleBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_overrideContentRectForPinning.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_overrideContentRectForPinning.size = v5;
}

- (id)queryFramesIntersectingRect:(CGRect)a3
{
  return -[_UICollectionLayoutSectionListSolver _queryFramesIntersectingRect:frameOffset:]((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
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
  -[_UICollectionLayoutSectionListSolver container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[_UICollectionLayoutSectionListSolver container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;

  -[_UICollectionLayoutSectionListSolver contentFrameIncludingAuxiliaries](self, "contentFrameIncludingAuxiliaries");
  v10 = v9;
  v12 = v11;
  -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsets");
  v15 = v14;
  -[_UICollectionLayoutSectionListSolver layoutSection](self, "layoutSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInsets");
  v18 = v17;

  -[_UICollectionLayoutSectionListSolver _queryFramesIntersectingRect:frameOffset:]((uint64_t)self, 0.0, 0.0, v10, v12, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 503, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    if (self)
      goto LABEL_5;
LABEL_9:
    sectionAuxillarySolution = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil && kind.length > 0"));

  if (a4 < 0)
    goto LABEL_8;
LABEL_4:
  if (!self)
    goto LABEL_9;
LABEL_5:
  sectionAuxillarySolution = self->_sectionAuxillarySolution;
LABEL_6:
  -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)sectionSupplementaryKindIndexForEnrollmentIdentifier:(id)a3
{
  _UICollectionLayoutSupplementaryEnroller *sectionSupplementaryEnroller;
  void *v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentIdentifier"));

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

  if (objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    if ((a4 & 0x8000000000000000) == 0)
    {
LABEL_3:
      if (self)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 537, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index>=0"));

  if (self)
  {
LABEL_4:
    if (self->_sectionGeometryTranslator)
      goto LABEL_5;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 538, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionGeometryTranslator"));

  if (!self)
  {
    sectionAuxillarySolution = 0;
    goto LABEL_6;
  }
LABEL_5:
  sectionAuxillarySolution = self->_sectionAuxillarySolution;
LABEL_6:
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setOrthogonalOffset:(CGPoint)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.x, a3.y);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 1061, CFSTR("Orthogonal support is unsupported for List solver."));

}

- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 1066, CFSTR("Orthogonal support is unsupported for List solver."));

  return 0.0;
}

- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution
{
  return self->_shouldAdjustContentSizeForPartialLastGroupSolution;
}

- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3
{
  self->_shouldAdjustContentSizeForPartialLastGroupSolution = a3;
}

- (void)setLayoutSection:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSection, a3);
}

- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3
{
  self->_orthogonalScrollingPrefetchingUnitVector = a3;
}

@end
