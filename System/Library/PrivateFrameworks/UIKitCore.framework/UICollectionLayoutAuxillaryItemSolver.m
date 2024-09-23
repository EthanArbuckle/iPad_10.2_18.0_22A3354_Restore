@implementation UICollectionLayoutAuxillaryItemSolver

void __82___UICollectionLayoutAuxillaryItemSolver_queryFramesIntersectingRect_frameOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  double *v3;
  double *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  double Height;
  _UICollectionLayoutFramesQueryResult *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id *v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = (double *)(id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = v3;
  if (v3)
  {
    v5 = *((_QWORD *)v3 + 8);
    v6 = *((_QWORD *)v3 + 9);
    v7 = *((_QWORD *)v3 + 10);
    v8 = *((_QWORD *)v3 + 11);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v5 = 0;
  }
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), *(CGRect *)&v5))
  {
    if (v4)
    {
      v10 = v4[8];
      v9 = v4[9];
      v11 = v4[10];
      v12 = v4[11];
    }
    else
    {
      v9 = 0.0;
      v11 = 0.0;
      v12 = 0.0;
      v10 = 0.0;
    }
    v13 = *(double *)(a1 + 80);
    v28.origin.x = v10;
    v28.origin.y = v9;
    v28.size.width = v11;
    v28.size.height = v12;
    v14 = v13 + CGRectGetMinX(v28);
    v15 = *(double *)(a1 + 88);
    v29.origin.x = v10;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v12;
    v16 = v15 + CGRectGetMinY(v29);
    v30.origin.x = v10;
    v30.origin.y = v9;
    v30.size.width = v11;
    v30.size.height = v12;
    Width = CGRectGetWidth(v30);
    v31.origin.x = v10;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v12;
    Height = CGRectGetHeight(v31);
    v19 = [_UICollectionLayoutFramesQueryResult alloc];
    if (v4)
    {
      v20 = *((_BYTE *)v4 + 8) != 0;
      v21 = (void *)*((_QWORD *)v4 + 2);
      v22 = (void *)*((_QWORD *)v4 + 4);
      v23 = *((id *)v4 + 5);
      v24 = (void *)*((_QWORD *)v4 + 6);
    }
    else
    {
      v23 = 0;
      v21 = 0;
      v20 = 0;
      v22 = 0;
      v24 = 0;
    }
    v25 = *(void **)(a1 + 96);
    v26 = v24;
    v27 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v19->super.isa, v20, v21, (void *)1, v22, v23, v25, v26, v14, v16, Width, Height);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v27);
  }
}

void __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _UICollectionLayoutFramesQueryResult *v22;
  void *v23;
  id *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;

  objc_msgSend(a2, "boundarySupplementaryItem");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "decorationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 3;
  else
    v7 = 2;

  objc_msgSend(a2, "elementKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  }
  -[_UICollectionLayoutSupplementaryEnroller enrollSupplementaryForKind:](*(id **)(a1 + 40), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 296, CFSTR("Failed to receive an enrollment identifier."));

  }
  v10 = (void *)-[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:](*(_QWORD *)(a1 + 40), (uint64_t)v9);
  if (v10 == (void *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 32), CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 298, CFSTR("Failed to determine the kindIndex for specified supplementary enrollment identifier."));

  }
  objc_msgSend(a2, "size");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) |= objc_msgSend(v11, "_containerSizeDependentAxes");

  v12 = -[_UICollectionLayoutAuxillaryItemSolver _sizeForSupplementaryItem:container:preferredSizes:preferredIndex:](*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (uint64_t)v10);
  v14 = v13;
  v15 = -[_UICollectionLayoutAuxillaryItemSolver _frameForSupplementaryItem:container:primaryContentFrame:supplementaryItemSize:frameOffset:layoutRTL:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 184), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), v12, v13, *(double *)(a1 + 152), *(double *)(a1 + 160));
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = [_UICollectionLayoutFramesQueryResult alloc];
  objc_msgSend(a2, "item");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v22->super.isa, 0, v10, (void *)1, (void *)v7, v23, *(void **)(a1 + 168), v9, v15, v17, v19, v21);

  objc_msgSend(*(id *)(a1 + 64), "addObject:", v24);
  if (objc_msgSend(v49, "pinToVisibleBounds"))
    objc_msgSend(*(id *)(a1 + 72), "addIndex:", a3);
  if (objc_msgSend(v49, "extendsBoundary"))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v25 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "elementKind");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionLayoutAuxillaryOffsets addIndexes:forElementKind:](v25, (uint64_t)v26, v27);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v28 = *(_QWORD *)(a1 + 176);
    v29 = objc_msgSend(v49, "extendsBoundary");
    if (v28)
    {
      if (v29)
      {
        v30 = objc_msgSend(v49, "alignment");
        if (v28 != 1)
        {
          if (v28 != 2)
            goto LABEL_35;
          v31 = v30 - 1 >= 8 ? 0 : qword_186679A28[v30 - 1];
          if (v30 - 2 >= 3 && v30 - 6 >= 3)
            goto LABEL_35;
          goto LABEL_30;
        }
        v31 = 2;
        if (v30 - 2 >= 3)
          v31 = 8 * (v30 - 6 < 3);
        if (v30 <= 8 && ((1 << v30) & 0x176) != 0)
        {
LABEL_30:
          if (!v31)
          {
            v32 = _UISizeValueForAxis(*(_QWORD *)(a1 + 176), v12, v14);
            v33 = _UISizeValueForAxis(*(_QWORD *)(a1 + 176), *(double *)(a1 + 136), *(double *)(a1 + 144));
            if (v32 > v33)
            {
              v34 = v32 - v33;
              v35 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
              if (*(double *)(v35 + 24) >= v34)
                v34 = *(double *)(v35 + 24);
              *(double *)(v35 + 24) = v34;
            }
          }
        }
      }
    }
  }
LABEL_35:
  if (objc_msgSend(v49, "extendsBoundary"))
  {
    v36 = *(_QWORD *)(a1 + 176);
    if ((unint64_t)(v36 - 1) >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = *(_QWORD *)(a1 + 112);
      v47 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v49, "_externalDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", v46, v47, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 343, CFSTR("UICollectionView internal inconsistency: layout axis is unspecified when solving boundary supplementary item: %@"), v48);

      v36 = *(_QWORD *)(a1 + 176);
    }
    v37 = _UIRectUnionOnAxis(v36, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 48), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 56), v15, v17, v19, v21);
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    *(double *)(v38 + 32) = v37;
    *(_QWORD *)(v38 + 40) = v39;
    *(_QWORD *)(v38 + 48) = v40;
    *(_QWORD *)(v38 + 56) = v41;
  }

}

_QWORD *__65___UICollectionLayoutAuxillaryItemSolver__updateGeometricIndexer__block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  if (a2)
  {
    v3 = a2[8];
    v4 = a2[9];
    v5 = a2[10];
    v6 = a2[11];
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v3 = 0.0;
  }
  return -[_UIRTree insertFrame:forIndex:](*(_QWORD **)(a1 + 32), a3, v3, v4, v5, v6);
}

uint64_t __113___UICollectionLayoutAuxillaryItemSolver__requiredContentSizeForSupplementaryFrames_forLayoutAxis_containerSize___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

void __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke_2(uint64_t a1, double *a2, uint64_t a3)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  id *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;

  -[_UICollectionLayoutFramesQueryResult auxillaryItem](a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundarySupplementaryItem");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    v7 = a2[10];
    v8 = a2[11];
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }
  v9 = -[_UICollectionLayoutAuxillaryItemSolver _frameForSupplementaryItem:container:primaryContentFrame:supplementaryItemSize:frameOffset:layoutRTL:](*(_QWORD *)(a1 + 32), v29, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 128), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v7, v8, *(double *)(a1 + 96), *(double *)(a1 + 104));
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  if (a2)
    v17 = (void *)*((_QWORD *)a2 + 2);
  else
    v17 = 0;
  v18 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)a2, v17, v9, v10, v11, v12);
  objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v18, a3);
  if (objc_msgSend(v29, "extendsBoundary"))
  {
    v19 = *(_QWORD *)(a1 + 112);
    if ((unint64_t)(v19 - 1) >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 120);
      v27 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v29, "_externalDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 373, CFSTR("UICollectionView internal inconsistency: layout axis is unspecified when solving boundary supplementary item: %@"), v28);

      v19 = *(_QWORD *)(a1 + 112);
    }
    v20 = _UIRectUnionOnAxis(v19, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56), v13, v14, v15, v16);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(double *)(v21 + 32) = v20;
    *(_QWORD *)(v21 + 40) = v22;
    *(_QWORD *)(v21 + 48) = v23;
    *(_QWORD *)(v21 + 56) = v24;
  }

}

@end
