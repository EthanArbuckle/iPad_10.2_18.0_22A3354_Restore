@implementation UICollectionLayoutSectionEstimatedSolver

_UIOrderedRangeIndexerImpl *__85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  _UIOrderedRangeIndexerImpl *v4;
  _UIOrderedRangeIndexerImpl *result;
  uint64_t v6;
  _QWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    v6 = 0;
    return (_UIOrderedRangeIndexerImpl *)objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
  }
  v4 = *(_UIOrderedRangeIndexerImpl **)(v3 + 8);
  v7[0] = 0;
  v7[1] = 0;
  v8 = 0;
  result = _UIOrderedRangeIndexerImpl::binarySearchForLocation(v4, a2, (uint64_t)v7);
  v6 = v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    return (_UIOrderedRangeIndexerImpl *)objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
  return result;
}

void __85___UICollectionLayoutSectionEstimatedSolver_queryFramesIntersectingRect_frameOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat Width;
  CGFloat Height;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)*((_QWORD *)v3 + 1);
    v6 = *((_QWORD *)v3 + 3);
    v7 = *((_QWORD *)v3 + 4);
    v9 = *((double *)v3 + 5);
    v8 = *((double *)v3 + 6);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = 0;
    v8 = 0.0;
    v9 = 0.0;
  }
  v10 = _UIPointValueForAxis(*(_QWORD *)(a1 + 48), v9, v8);
  v11 = _UIPointValueForAxis(*(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v12 = _UISetPointValueForAxis(*(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v11 - v10);
  v14 = v13;
  Width = CGRectGetWidth(*(CGRect *)(a1 + 88));
  Height = CGRectGetHeight(*(CGRect *)(a1 + 88));
  v17 = *(_QWORD *)(a1 + 120);
  if (v4)
    v18 = v4[2];
  else
    v18 = 0;
  if (v7 + v6 >= v17)
    v19 = v17 - v6;
  else
    v19 = 0;
  -[_UICollectionLayoutItemSolver queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:supplementaryOffsets:itemLimit:](v5, v6, v18, v19, v12, v14, Width, Height, v9 + *(double *)(a1 + 128), v8 + *(double *)(a1 + 136));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v20);

}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;

  if (!*(_BYTE *)(a1 + 80))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
    -[_UICollectionLayoutItemSolver supplementaryOffsets]((_QWORD **)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementKinds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[_UICollectionLayoutItemSolver supplementaryOffsets]((_QWORD **)v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "offsetsByApplyingOffsets:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        goto LABEL_23;
    }
    else
    {
      v8 = 0;
      if (!v3)
        goto LABEL_23;
    }
    v9 = *(_QWORD *)(v3 + 48);
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 56);
LABEL_9:
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
        goto LABEL_17;
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v12 = *(_QWORD *)(a1 + 40);
      if (v12)
      {
        -[_UICollectionPreferredSizes indexes](v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countOfIndexesInRange:", v11, v10);

        v15 = *(_QWORD *)(a1 + 40);
        if (v15 && v8)
        {
          v16 = -[_UICollectionPreferredSizes containsSupplementaryOffsets:](v15, v8);
          v1 = 0;
          if (v14 || (v16 & 1) != 0)
            goto LABEL_21;
          goto LABEL_18;
        }
        if (v14)
        {
LABEL_17:
          v1 = 0;
LABEL_21:

          return v1;
        }
      }
LABEL_18:
      -[UIBarButtonItemGroup _items](*(id **)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countOfIndexesInRange:", v11, v10);

      -[_UICollectionLayoutSolveParameters invalidatedAuxillaryOffsets](*(id **)(a1 + 48));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "overlapsOffsets:", v8);

      if (v18)
        v1 = 0;
      else
        v1 = v20 ^ 1u;
      goto LABEL_21;
    }
LABEL_23:
    v10 = 0;
    goto LABEL_9;
  }
  return 1;
}

id __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke(uint64_t a1)
{
  void *v2;
  _UICollectionLayoutItemSolver *v3;
  void *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    v3 = [_UICollectionLayoutItemSolver alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "group");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UICollectionLayoutItemSolver initWithItem:](v3, v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "layoutRTL");
    if (v9)
      -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:](v9, v10, v8, v11, 0x7FFFFFFFFFFFFFFFLL, v12, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  return v2;
}

id *__66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_3(uint64_t a1)
{
  _UICollectionLayoutItemSolver *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v2 = [_UICollectionLayoutItemSolver alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UICollectionLayoutItemSolver initWithItem:](v2, v3);

  -[_UICollectionPreferredSizes preferredSizesApplyingFrameOffset:supplementaryBaseOffsets:](*(_QWORD **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "layoutRTL");
  if (v4)
    -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:]((uint64_t)v4, v6, v7, v8, 0x7FFFFFFFFFFFFFFFLL, v9, v5, 0, *(double *)(a1 + 80), *(double *)(a1 + 88));

  return v4;
}

void __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_7(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  -[_UICollectionLayoutItemSolver errorDescription](a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    -[_UICollectionLayoutItemSolver errorDescription](a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v5;

  }
  else
  {
    v8 = *(id **)(*(_QWORD *)(a1[6] + 8) + 40);
    -[_UICollectionLayoutItemSolver supplementaryOffsets]((_QWORD **)a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionLayoutAuxillaryOffsets incrementCountsFromOffsets:](v8, v9);

    if (a2)
    {
      v10 = a2[6];
      if (v10)
        v10 = *(_QWORD *)(v10 + 56);
    }
    else
    {
      v10 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += v10;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v10;
    v11 = *(_QWORD *)(a1[5] + 8);
    if ((*(_QWORD *)(v11 + 24) & 0x8000000000000000) != 0)
      *(_QWORD *)(v11 + 24) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", a2);
  }
}

id __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_5");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 562, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solution"));

  }
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

_QWORD *__66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_6(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v2 >= *(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_6");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 568, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolveOffset<resolveBookmarkRange.length"));

    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  v3 = *(_QWORD *)(a1 + 96) + v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(id *)(v4 + 104);
    v6 = v5;
    if (v5)
      v5 = (_QWORD *)v5[2];
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
  v7 = (id *)objc_claimAutoreleasedReturnValue();

  if (v7 && (v8 = v7[1]) != 0)
  {
    v9 = v8;
    v10 = v8[6];
    if (v10)
    {
      v11 = 0;
      v12 = *(_QWORD *)(v10 + 56);
      v13 = *(_QWORD *)(v10 + 64);
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v13 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_6");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 573, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solution"));

    v12 = 0;
    v9 = 0;
    v13 = 0;
    v11 = 1;
  }
  -[_UICollectionPreferredSizes preferredSizesApplyingFrameOffset:supplementaryBaseOffsets:](*(_QWORD **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(*(id *)(a1 + 32), "layoutRTL");
  if ((v11 & 1) != 0)
  {

    v20 = 0;
    v19 = 0;
  }
  else
  {
    -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:]((uint64_t)v9, v15, v16, v17, 0x7FFFFFFFFFFFFFFFLL, v18, v14, 0, *(double *)(a1 + 120), *(double *)(a1 + 128));

    v19 = v9[6];
    if (v19)
    {
      v20 = *(_QWORD *)(v19 + 56);
      v19 = *(_QWORD *)(v19 + 64);
    }
    else
    {
      v20 = 0;
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (!*(_BYTE *)(v21 + 24))
  {
    v23 = v12 != v20 || v13 != v19;
    *(_BYTE *)(v21 + 24) = v23;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v9;
}

id __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_4(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_4");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextBookmarkIndex != NSNotFound"));

    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(id *)(v3 + 104);
    v5 = v4;
    if (v4)
      v4 = (_QWORD *)v4[2];
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v6 = objc_msgSend(v4, "count");

  if (v2 >= v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_4");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 553, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextBookmarkIndex < self.solutionState.bookmarks.count"));

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = *(id *)(v7 + 104);
    v9 = v8;
    if (v8)
      v8 = (_QWORD *)v8[2];
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (void *)v10[1];
  else
    v11 = 0;
  v12 = v11;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v12;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_13(uint64_t a1)
{
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1)
    return 6;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return 5;
  return 2;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_8(_QWORD *a1)
{
  uint64_t v1;

  if (!a1[5])
    return 6;
  v1 = a1[4];
  if (v1 && *(_BYTE *)(v1 + 24))
    return 2;
  if (a1[7])
    return 3;
  return 2;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_9(uint64_t a1)
{
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1)
    return 6;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return 5;
  return 2;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_11(_QWORD *a1)
{
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  unint64_t v14;

  if (*(uint64_t *)(*(_QWORD *)(a1[6] + 8) + 24) < 1)
    return 6;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) < a1[12])
    return 3;
  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) || !(*(unsigned int (**)(void))(a1[5] + 16))())
    return 2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  v4 = a1[4];
  if (v4)
  {
    v5 = *(id *)(v4 + 104);
    v6 = v5;
    if (v5)
      v5 = (_QWORD *)v5[2];
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = objc_msgSend(v5, "count");

  if (v3 >= v7)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_11");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastResolvedBookmarkIndex != NSNotFound && lastResolvedBookmarkIndex < self.solutionState.bookmarks.count"));

  }
  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) + 1;
  v10 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
  v11 = a1[4];
  if (v11)
  {
    v12 = *(id *)(v11 + 104);
    v13 = v12;
    if (v12)
      v12 = (_QWORD *)v12[2];
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  v14 = objc_msgSend(v12, "count");

  if (v10 >= v14)
    return 2;
  else
    return 4;
}

void __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_10(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3 != a4)
  {
    if (!a1[7])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_10");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 764, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolveBookmarkRange.length"));

    }
    if (a1[6])
    {
      v5 = 0;
      do
      {
        v6 = a1[4];
        if (v6)
        {
          v7 = *(id *)(v6 + 104);
          v8 = v7;
          if (v7)
            v7 = (_QWORD *)v7[2];
        }
        else
        {
          v8 = 0;
          v7 = 0;
        }
        objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(a1[5] + 16))();
        ++v5;
      }
      while (v5 < a1[6]);
    }
  }
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_12(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  unint64_t v5;

  if (*(uint64_t *)(*(_QWORD *)(a1[5] + 8) + 24) < 1)
    return 6;
  v1 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v2 = a1[4];
  if (v2)
  {
    v3 = *(id *)(v2 + 104);
    v4 = v3;
    if (v3)
      v3 = (_QWORD *)v3[2];
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  v5 = objc_msgSend(v3, "count");

  if (v1 >= v5)
    return 2;
  else
    return 4;
}

void __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    -[_UICollectionLayoutSolveParameters indexesForInvalidatedAuxillariesOfKind:](*(id **)(a1 + 40), a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_3;
      v8[3] = &unk_1E16B2978;
      v9 = v7;
      v10 = *(id *)(a1 + 56);
      objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);

      v6 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("_UICollectionLayoutSectionEstimatedSolver.m"), 1005, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKindIndexes"));
    }

    v4 = v7;
  }

}

_UIOrderedRangeIndexerImpl *__85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  _UIOrderedRangeIndexerImpl *v4;
  _UIOrderedRangeIndexerImpl *result;
  uint64_t v6;
  _QWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    v6 = 0;
    return (_UIOrderedRangeIndexerImpl *)objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
  }
  v4 = *(_UIOrderedRangeIndexerImpl **)(v3 + 8);
  v7[0] = 0;
  v7[1] = 0;
  v8 = 0;
  result = _UIOrderedRangeIndexerImpl::binarySearchForLocation(v4, a2, (uint64_t)v7);
  v6 = v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    return (_UIOrderedRangeIndexerImpl *)objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
  return result;
}

void __103___UICollectionLayoutSectionEstimatedSolver__updateSolutionAuxillaryRangeIndexerKindDict_fromBookmark___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  _UIOrderedRangeIndexer *v9;
  id v10;
  _NSRange v11;

  v4 = objc_msgSend(*(id *)(a1 + 32), "rangeForElementKind:", a2);
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      || (v9 = objc_alloc_init(_UIOrderedRangeIndexer),
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, a2),
          (v8 = (uint64_t)v9) != 0))
    {
      v10 = (id)v8;
      v11.location = v6;
      v11.length = v7;
      _UIOrderedRangeIndexerImpl::appendRange(*(_UIOrderedRangeIndexerImpl **)(v8 + 8), v11);
    }
    else
    {
      v10 = 0;
    }

  }
}

@end
