@implementation UICollectionLayoutItemSolver

double __124___UICollectionLayoutItemSolver__arrangeSolutionItems_alongLayoutAxis_forContainer_additionalLayoutOffset_interItemSpacing___block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;

  -[_UICollectionSolutionGroupArrangementItem item](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "edgeSpacing");

  objc_msgSend(v6, "spacingForEdge:", a3);
  v8 = v7;
  if (objc_msgSend(v6, "isSpacingFlexibleForEdge:", a3))
    return v8 + *(double *)(a1 + 32);
  return v8;
}

uint64_t __92___UICollectionLayoutItemSolver__enumerateSolutionFramesForQueryRect_itemLimit_withHandler___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v5 = (id)objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v6 = v5;
  if (!*(_BYTE *)(a1 + 96) || *(_BYTE *)(a1 + 97))
    goto LABEL_6;
  if (v5)
  {
    v7 = v5[8];
    v8 = v5[9];
    v9 = v5[10];
    v10 = v5[11];
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v7 = 0;
  }
  result = CGRectIntersectsRect(*(CGRect *)&v7, *(CGRect *)(a1 + 56));
  if ((_DWORD)result)
LABEL_6:
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
  {
    if (v6[4] == 1)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (*(_BYTE *)(a1 + 96)
      && v6[4] == 1
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 88))
    {
      *a3 = 1;
    }
  }
  return result;
}

void __128___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit___block_invoke(uint64_t a1, id *a2)
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id *v10;

  if (!a2)
    goto LABEL_7;
  v4 = (unint64_t)a2[4];
  if (v4 == 1)
  {
    v5 = (uint64_t)a2[2] + *(_QWORD *)(a1 + 56);
    goto LABEL_11;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_UICollectionLayoutItemSolver.m"), 1300, CFSTR("Unknown frame type. Please file a radar!"));

    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 32))
    v5 = (uint64_t)a2[2]
       + objc_msgSend(*(id *)(a1 + 32), "offsetForElementKind:", (id)objc_msgSend(-[_UICollectionLayoutFramesQueryResult auxillaryItem](a2), "elementKind"));
  else
    v5 = (uint64_t)a2[2];
LABEL_11:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_UICollectionLayoutItemSolver.m"), 1304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustedIndex != NSNotFound"));

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2)
  {
LABEL_12:
    v8 = a2[6];
    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:
  v9 = v8;
  v10 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:index:supplementaryEnrollmentIdentifier:](a2, (void *)v5, v9, *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
}

void __133___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;

  if (!a2)
    goto LABEL_13;
  v4 = *(_QWORD *)(a2 + 32);
  if (v4 == 1)
  {
    v5 = (void *)(*(_QWORD *)(a1 + 56) + *(_QWORD *)(a2 + 16));
  }
  else
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutItemSolver.m"), 1357, CFSTR("Failed to compute a result during item query."));

      v10 = 0;
      goto LABEL_14;
    }
    v6 = -[_UICollectionLayoutFramesQueryResult auxillaryItem]((_QWORD *)a2);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutItemSolver.m"), 1345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxillaryItem"));

    }
    v7 = (id)objc_msgSend(v6, "elementKind");
    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutItemSolver.m"), 1347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    v8 = -[_UICollectionLayoutSupplementaryEnroller countForKind:](*(_QWORD *)(a1 + 40), v7);
    if (v8 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutItemSolver.m"), 1349, CFSTR("Failed to determine element kind count. Enrollment issue?"));

    }
    v5 = (void *)(*(_QWORD *)(a2 + 16) + *(_QWORD *)(a1 + 88) * v8);
  }
  v9 = *(id *)(a2 + 48);
  v15 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:index:supplementaryEnrollmentIdentifier:]((id *)a2, v5, v9, *(double *)(a1 + 64), *(double *)(a1 + 72));

  v10 = v15;
  if (!v15)
    goto LABEL_13;
LABEL_14:
  v16 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);

}

void __44___UICollectionLayoutItemSolver__solveGroup__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  uint64_t v25;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  char v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (a3 >= 2)
  {
    v6 = *(void **)(a1 + 104);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(*(id *)(a1 + 128), "subarrayWithRange:", a2, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    v12 = v9;
    v13 = v8;
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v50;
      v12 = v9;
      v13 = v8;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v50 != v15)
            objc_enumerationMutation(v10);
          v17 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v16);
          if (!v17)
          {
            v19 = 0;
            v18 = 0;
LABEL_20:
            v20 = 1;
            goto LABEL_10;
          }
          v18 = *(id *)(v17 + 8);
          v19 = v18;
          if (!v18)
            goto LABEL_20;
          v20 = 0;
          v18 = (_QWORD *)v18[2];
LABEL_10:
          objc_msgSend(v18, "layoutSize");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "isEstimated")
            || ((v20 & 1) != 0 ? (v22 = 0) : (v22 = v19[7]),
                -[_UICollectionPreferredSizes objectAtIndexedSubscript:](v22, 0),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v23,
                v23))
          {
            if (v17)
            {
              v24 = *(double *)(v17 + 40);
              v13 = fmax(*(double *)(v17 + 32), v13);
            }
            else
            {
              v24 = 0.0;
              v13 = fmax(v13, 0.0);
            }
            v12 = fmax(v24, v12);
          }

          ++v16;
        }
        while (v14 != v16);
        v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        v14 = v25;
      }
      while (v25);
    }
    if (v8 != v13 || v9 != v12)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v27 = v10;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (!v28)
        goto LABEL_47;
      v29 = v28;
      v30 = *(_QWORD *)v46;
      while (1)
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v46 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v31);
          if (v32)
          {
            v33 = *(id *)(v32 + 8);
            v34 = v33;
            if (v33)
            {
              v35 = 0;
              v33 = (_QWORD *)v33[2];
              goto LABEL_36;
            }
          }
          else
          {
            v34 = 0;
            v33 = 0;
          }
          v35 = 1;
LABEL_36:
          objc_msgSend(v33, "layoutSize", (_QWORD)v45);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "_axesUniformAcrossSiblings"))
          {
            -[_UICollectionLayoutItemSolver setSolveResult:]((uint64_t)v34, 0);
            if ((v35 & 1) != 0)
              v37 = 0;
            else
              v37 = (void *)v34[7];
            v38 = v37;
            -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v38, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UICollectionLayoutItemSolver _solveSingleItemWithPreferredSize:groupMaxItemSize:]((uint64_t)v34, (uint64_t)v39, v13, v12);

            v40 = -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v34);
            if (v32)
            {
              *(double *)(v32 + 16) = v40;
              *(_QWORD *)(v32 + 24) = v41;
              *(_QWORD *)(v32 + 32) = v42;
              *(_QWORD *)(v32 + 40) = v43;
            }
          }

          ++v31;
        }
        while (v29 != v31);
        v44 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        v29 = v44;
        if (!v44)
        {
LABEL_47:

          break;
        }
      }
    }

  }
}

void __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  _UICollectionLayoutFramesQueryResult *v14;
  void *v15;
  id *v16;
  id *v17;
  CGRect v18;

  objc_msgSend(a2, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 32), v18);
  v14 = [_UICollectionLayoutFramesQueryResult alloc];
  v15 = (void *)objc_msgSend(a2, "zIndex");
  if (v14)
    v16 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v14->super.isa, 0, a3, v15, (void *)1, *(void **)(*(_QWORD *)(a1 + 32) + 16), 0, 0, v7, v9, v11, v13);
  else
    v16 = 0;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);

}

uint64_t __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

double __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;
  double v4;
  double *v5;
  double v6;

  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "effectiveContentSize");
    v4 = v6;
    v5 = (double *)(a1 + 48);
  }
  else
  {
    result = 0.0;
    if (a2 != 1)
      return result;
    objc_msgSend(*(id *)(a1 + 32), "effectiveContentSize", 0.0);
    v5 = (double *)(a1 + 40);
  }
  return v4 - *v5;
}

uint64_t __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "top");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isFlexibleSpacing");

    objc_msgSend(*(id *)(a1 + 32), "bottom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2 != 1)
      return 0;
    objc_msgSend(*(id *)(a1 + 32), "leading");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFlexibleSpacing");

    objc_msgSend(*(id *)(a1 + 32), "trailing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  v8 = objc_msgSend(v5, "isFlexibleSpacing");

  v9 = 1;
  if (v4)
    v9 = 2;
  if (v8)
    return v9;
  else
    return v4;
}

double __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;

  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "top");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spacing");
    v6 = v8;
    objc_msgSend(*(id *)(a1 + 32), "bottom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v3 = 0.0;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "leading");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spacing");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "trailing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v7;
    objc_msgSend(v7, "spacing");
    v3 = v6 + v10;

  }
  return v3;
}

void __71___UICollectionLayoutItemSolver__transformGroupArrangementItemsForRTL___block_invoke(_OWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  CGAffineTransform v10;
  CGRect v11;

  -[_UICollectionSolutionGroupArrangementItem item](a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "ignoresRTL") & 1) == 0)
  {
    if (a2)
    {
      v5 = a2[2];
      v6 = a2[3];
      v7 = a2[4];
      v8 = a2[5];
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v5 = 0;
    }
    v9 = a1[3];
    *(_OWORD *)&v10.a = a1[2];
    *(_OWORD *)&v10.c = v9;
    *(_OWORD *)&v10.tx = a1[4];
    v11 = CGRectApplyAffineTransform(*(CGRect *)&v5, &v10);
    if (a2)
      *(CGRect *)(a2 + 2) = v11;
  }

}

@end
