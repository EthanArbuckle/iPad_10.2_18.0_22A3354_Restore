@implementation UICollectionCompositionalLayoutSolver

BOOL __110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  _BOOL8 result;
  BOOL IsNull;
  double v10;
  CGRect v11;

  if (CGRectIsInfinite(*(CGRect *)&a1))
    return 0;
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  IsNull = CGRectIsNull(v11);
  result = 0;
  if (!IsNull && fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    v10 = fabs(a4);
    return v10 > INFINITY || v10 < INFINITY;
  }
  return result;
}

void __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat Width;
  double x;
  double y;
  CGFloat v45;
  CGFloat height;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  uint64_t v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  _UICollectionLayoutFramesQueryResult *v117;
  void *v118;
  void *v119;
  id *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  id *v131;
  double v132;
  id v133;
  id v134;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  uint64_t v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;

  v141 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = -[_UICollectionSectionSolutionBookmark contentInsetsOffset]((uint64_t)v3);
  v6 = v5;
  v7 = *(double *)(a1 + 64);
  v8 = *(double *)(a1 + 72);
  v9 = -[_UICollectionSectionSolutionBookmark sectionAuxiliaryContentInsetsOffset]((uint64_t)v3);
  v123 = v10;
  v124 = v9;
  if (v3)
  {
    v11 = v3[1];
    v130 = *((double *)v3 + 7);
    v12 = *((double *)v3 + 9);
    v132 = *((double *)v3 + 8);
    v13 = *((double *)v3 + 10);
  }
  else
  {
    v11 = 0;
    v132 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v130 = 0.0;
  }
  v14 = *(double *)(a1 + 64);
  v15 = *(double *)(a1 + 72);
  objc_msgSend(v11, "layoutSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scrollsOrthogonally");

  v127 = v6;
  v128 = v4;
  v125 = v8;
  v126 = v7;
  v121 = v15;
  v122 = v14;
  if (v17)
  {
    v18 = objc_msgSend(v11, "layoutAxis");
    objc_msgSend(v11, "contentFrameIncludingAuxiliaries");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v11, "layoutSection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentInsets");
    v28 = _UITotalEdgeDimensionsForLayoutAxis(v18, v24, v25, v26, v27);

    v29 = _UISizeClampToMinimumSizeForAxis(v18, v12, v13, v20, v22);
    v31 = v30;
    v32 = v29 + _UISetSizeValueForAxis(v18, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v28);
    v129 = v31 + v33;
  }
  else
  {
    v129 = v13;
    v32 = v12;
  }
  v34 = -[_UICollectionSectionSolutionBookmark contentInsetsOffset]((uint64_t)v3);
  v35 = *(double *)(a1 + 80);
  v36 = *(double *)(a1 + 88);
  v37 = *(double *)(a1 + 96);
  v38 = *(double *)(a1 + 104);
  v39 = v35 - v34;
  v41 = v36 - v40;
  v142.origin.x = v35;
  v142.origin.y = v36;
  v142.size.width = v37;
  v142.size.height = v38;
  Width = CGRectGetWidth(v142);
  v143.origin.x = v35;
  v143.origin.y = v36;
  v143.size.width = v37;
  v143.size.height = v38;
  v144.size.height = CGRectGetHeight(v143);
  v144.origin.x = v39;
  v144.origin.y = v41;
  v144.size.width = Width;
  v154.size.height = v129;
  v154.origin.x = v130;
  v154.origin.y = v132;
  v154.size.width = v32;
  v145 = CGRectIntersection(v144, v154);
  x = v145.origin.x;
  y = v145.origin.y;
  v45 = v145.size.width;
  height = v145.size.height;
  v131 = v3;
  if (!CGRectIsEmpty(v145))
  {
    v146.origin.x = x;
    v146.origin.y = y;
    v146.size.width = v45;
    v146.size.height = height;
    v47 = CGRectGetWidth(v146);
    v147.origin.x = x;
    v147.origin.y = y;
    v147.size.width = v45;
    v147.size.height = height;
    v48 = CGRectGetHeight(v147);
    if (v3)
    {
      v49 = *((double *)v3 + 3);
      v50 = *((double *)v3 + 4);
    }
    else
    {
      v50 = 0.0;
      v49 = 0.0;
    }
    objc_msgSend(v11, "queryFramesIntersectingRect:frameOffset:", x - v130, y - v132, v47, v48, v49, v50, *(_QWORD *)&v121, *(_QWORD *)&v122);
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v51 = (id)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
    if (v52)
    {
      v53 = v52;
      v54 = v126 + v128;
      v55 = v127 + v125;
      v56 = *(_QWORD *)v137;
      v133 = v51;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v137 != v56)
            objc_enumerationMutation(v51);
          v58 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v57);
          if (v58)
          {
            v59 = *(_QWORD *)(v58 + 32);
            if (v59 == 1)
            {
              v60 = *(double *)(v58 + 64);
              v61 = *(double *)(v58 + 72);
              v62 = *(double *)(v58 + 80);
              v63 = *(double *)(v58 + 88);
              v148.origin.x = v60;
              v148.origin.y = v61;
              v148.size.width = v62;
              v148.size.height = v63;
              v64 = CGRectGetWidth(v148);
              v149.origin.x = v60;
              v149.origin.y = v61;
              v149.size.width = v62;
              v149.size.height = v63;
              v65 = CGRectGetHeight(v149);
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(v58 + 16), a2);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = *(_QWORD *)(a1 + 40);
              if (v67)
                v68 = *(void **)(v67 + 208);
              else
                v68 = 0;
              objc_msgSend(v68, "objectForKeyedSubscript:", v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                if (*(_QWORD *)(v58 + 24) == 0x7FFFFFFFFFFFFFFFLL)
                  v70 = 0;
                else
                  v70 = *(_QWORD *)(v58 + 24);
                -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForItemAtIndexPath:frame:zIndex:](*(_QWORD *)(a1 + 40), v66, v70, v54 + v60, v55 + v61, v64, v65);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
              }
              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
              goto LABEL_38;
            }
            if ((v59 & 0xFFFFFFFFFFFFFFFELL) != 2)
              goto LABEL_39;
            v71 = v11;
            v72 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](*(_QWORD **)(*((_QWORD *)&v136 + 1) + 8 * v57));
            if (!v72)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 40), CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2752, CFSTR("Failed to get the associated auxillary definition for this query result."));

            }
            v73 = (id)objc_msgSend(v72, "elementKind");
            if (!objc_msgSend(v73, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 40), CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2754, CFSTR("Failed to get the element kind from the supplementary."));

            }
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(v58 + 16), a2);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = *(_QWORD *)(v58 + 32);
            if (v74 == 3)
            {
              v82 = *(double *)(v58 + 64);
              v83 = *(double *)(v58 + 72);
              v84 = *(double *)(v58 + 80);
              v85 = *(double *)(v58 + 88);
              v152.origin.x = v82;
              v152.origin.y = v83;
              v152.size.width = v84;
              v152.size.height = v85;
              v86 = CGRectGetWidth(v152);
              v153.origin.x = v82;
              v153.origin.y = v83;
              v153.size.width = v84;
              v153.size.height = v85;
              v87 = CGRectGetHeight(v153);
              -[_UICollectionCompositionalLayoutSolver _cachedDecorationAttributesForElementKind:indexPath:](*(_QWORD *)(a1 + 40), (uint64_t)v73, (uint64_t)v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](*(_QWORD *)(a1 + 40), v66, v73, objc_msgSend(v72, "zIndex"), v54 + v82, v55 + v83, v86, v87, 0.0, 0.0, 0.0, 0.0);
                v81 = objc_claimAutoreleasedReturnValue();
LABEL_35:
                v69 = (void *)v81;
              }
            }
            else if (v74 == 2)
            {
              v75 = *(double *)(v58 + 64);
              v76 = *(double *)(v58 + 72);
              v77 = *(double *)(v58 + 80);
              v78 = *(double *)(v58 + 88);
              v150.origin.x = v75;
              v150.origin.y = v76;
              v150.size.width = v77;
              v150.size.height = v78;
              v79 = CGRectGetWidth(v150);
              v151.origin.x = v75;
              v151.origin.y = v76;
              v151.size.width = v77;
              v151.size.height = v78;
              v80 = CGRectGetHeight(v151);
              -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:](*(_QWORD *)(a1 + 40), (uint64_t)v73, (uint64_t)v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](*(_QWORD *)(a1 + 40), v66, v73, objc_msgSend(v72, "zIndex"), *(unsigned __int8 *)(v58 + 8), v122 + v124 + v75, v123 + v121 + v76, v79, v80);
                v81 = objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              }
            }
            else
            {
              v69 = 0;
            }
            v11 = v71;
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            v51 = v133;
LABEL_38:

          }
LABEL_39:
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {

            return;
          }
          ++v57;
        }
        while (v53 != v57);
        v90 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
        v53 = v90;
      }
      while (v90);
    }

    v3 = v131;
  }
  if (v3)
    v91 = v3[2];
  else
    v91 = 0;
  v92 = (id)objc_msgSend(v91, "decorationItems", *(_QWORD *)&v121, *(_QWORD *)&v122);
  v93 = objc_msgSend(v92, "count");
  if (v93 >= 1)
  {
    v94 = v93;
    v95 = 0;
    v134 = v92;
    do
    {
      v96 = (id)objc_msgSend(v92, "objectAtIndexedSubscript:", v95);
      if (objc_msgSend(v96, "isBackgroundDecoration"))
      {
        objc_msgSend(v96, "elementKind");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v95, a2);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionCompositionalLayoutSolver _cachedDecorationAttributesForElementKind:indexPath:](*(_QWORD *)(a1 + 40), (uint64_t)v97, (uint64_t)v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (v99)
        {
          v100 = v99;
          objc_msgSend(v99, "frame");
          v102 = v101;
          v104 = v103;
          v106 = v105;
          v108 = v107;
        }
        else
        {
          v102 = +[_UICollectionCompositionalLayoutSolver _globalFrameForBackgroundDecoration:forSectionWithBookmark:]((uint64_t)_UICollectionCompositionalLayoutSolver, v131);
          v104 = v109;
          v106 = v110;
          v108 = v111;
          v112 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v96, "contentInsets");
          -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](v112, v98, v97, objc_msgSend(v96, "zIndex"), v102, v104, v106, v108, v113, v114, v115, v116);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v117 = [_UICollectionLayoutFramesQueryResult alloc];
        v118 = (void *)objc_msgSend(v96, "zIndex");
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v117->super.isa, 0, v95, v118, (void *)3, v96, (void *)2, v119, v102, v104, v106, v108);

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        LODWORD(v118) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

        v92 = v134;
        if ((_DWORD)v118)
          break;
      }
      ++v95;
    }
    while ((uint64_t)v95 < v94);
  }
}

uint64_t __76___UICollectionCompositionalLayoutSolver_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __101___UICollectionCompositionalLayoutSolver_extendedAttributesQueryIncludingOrthogonalScrollingRegions___block_invoke(uint64_t a1, _WORD *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  char v16;

  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_15;
  v4 = (id)objc_msgSend(a2, "indexPath");
  if ((unint64_t)objc_msgSend(v4, "length") < 2)
    goto LABEL_15;
  v5 = objc_msgSend(v4, "section");
  if (*(_QWORD *)(a1 + 48) == v5)
    goto LABEL_15;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v7 ? *(void **)(v7 + 88) : 0;
  v9 = objc_msgSend(v8, "containsIndex:", v6);
  if (!a2 || !v9)
    goto LABEL_15;
  v10 = a2[144];
  if ((v10 & 3) != 0)
  {
    if ((v10 & 2) == 0)
    {
      if ((v10 & 1) != 0)
        return;
LABEL_15:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
      return;
    }
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "indexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemGroup _items]((id *)a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:](v15, v12, (uint64_t)v13);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "indexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemGroup _items]((id *)a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:elementKind:](v11, v12, (uint64_t)v13);
  }
  v16 = v14;

  if ((v16 & 1) == 0)
    goto LABEL_15;
}

void __89___UICollectionCompositionalLayoutSolver_mutatedVisibleItemsForElementsForVisibleBounds___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _UICollectionLayoutVisibleItem *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;

  if (!a3 || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:", a2) & 1) != 0)
    return;
  v8 = [_UICollectionLayoutVisibleItem alloc];
  if (a4)
    v9 = *(void **)(a4 + 40);
  else
    v9 = 0;
  v10 = v9;
  v21 = -[_UICollectionLayoutVisibleItem initWithLayoutAttributes:layoutItem:](v8, a2, v10);

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    goto LABEL_10;
  }
  objc_msgSend(v11, "objectForKey:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_10:
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v21, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v13, a3);
    goto LABEL_11;
  }
  v13 = v12;
  objc_msgSend(v12, "addObject:", v21);
LABEL_11:
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v17)
  {
    objc_msgSend(v17, "addObject:", a2);
  }
  else
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", a2, 0);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

void __75___UICollectionCompositionalLayoutSolver__anchorForAuxiliaryElementOfKind___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
    v6 = *(void **)(a2 + 8);
  else
    v6 = 0;
  objc_msgSend(v6, "supplementaryFrameWithKind:index:", *(_QWORD *)(a1 + 32), 0);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7[7];
    if (v8 == 2)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    else
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v8 != 4)
      {
        *(_QWORD *)(v9 + 24) = 0;
        goto LABEL_10;
      }
      v8 = 3;
    }
    *(_QWORD *)(v9 + 24) = v8;
LABEL_10:
    *a4 = 1;
  }

}

uint64_t __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __130___UICollectionCompositionalLayoutSolver_updatePreferredSizeIfNeededForPreferredLayoutAttributes_withOriginalAttributes_debugger___block_invoke(uint64_t a1, void *a2, id *a3, void *a4, void *a5, void *a6)
{
  id *v9;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  double v42;
  double v43;
  double v44;
  int ShouldRespectPreferredSizeOnEstimatedAxisOnly;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  double v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id *v67;
  id *v68;
  id *v69;
  uint64_t v70;
  void *v71;
  _UICollectionPreferredSize *v72;
  void *v73;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id *v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  void *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[3];

  v9 = a3;
  objc_msgSend(a3, "size");
  v13 = v12;
  v15 = v14;
  objc_msgSend(a4, "size");
  v17 = v16;
  v19 = v18;
  if (*(_BYTE *)(a1 + 48))
  {
    v20 = a2;
  }
  else
  {
    -[UIBarButtonItemGroup _items]((id *)a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionPreferredSizes objectForKeyedSubscript:]((uint64_t)a2, v21);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = objc_msgSend(*(id *)(a1 + 32), "length");
  v23 = *(void **)(a1 + 32);
  v88 = a4;
  if (v22 == 1)
    v24 = objc_msgSend(v23, "indexAtPosition:", 0);
  else
    v24 = objc_msgSend(v23, "item");
  v25 = v24;
  objc_msgSend(a5, "layoutSize");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v20, v25);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a5, "size");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "_axesUniformAcrossSiblings");

  if (!v27 && v29)
  {
    v30 = *(void **)(a1 + 40);
    if (v30)
    {
      v85 = v25;
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a5, "_externalDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("received preferred size for item with uniformAcrossSiblings dimension: %@"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)v99 = v17;
      *(double *)&v99[1] = v19;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v99, "{CGSize=dd}");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      *(double *)v98 = v13;
      *(double *)&v98[1] = v15;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v98, "{CGSize=dd}");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("preferredSize");
      v37 = v30;
      v38 = v88;
      v39 = v33;
      v40 = 0;
      v41 = v34;
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if (objc_msgSend(v26, "isEstimated"))
  {
    v42 = +[_UICollectionPreferredSize preferredSizeForOriginalSize:fittingSize:layoutSize:](v13, v15, v17, (uint64_t)_UICollectionPreferredSize, v26);
    v44 = v43;
    ShouldRespectPreferredSizeOnEstimatedAxisOnly = _UICollectionViewCompositionalLayoutShouldRespectPreferredSizeOnEstimatedAxisOnly();
    if (ShouldRespectPreferredSizeOnEstimatedAxisOnly)
      v46 = v42;
    else
      v46 = v17;
    if (ShouldRespectPreferredSizeOnEstimatedAxisOnly)
      v47 = v44;
    else
      v47 = v19;
    v48 = _UISizeEqualToSizeWithPrecision(v13, v15, v46, v47, 0.0001);
    if (v27 && !v48 && v29)
    {
      v49 = -[_UICollectionPreferredSize fittingSize](v27);
      v51 = _UISizeEqualToSizeWithPrecision(v49, v50, v17, v19, 0.0001);
      v52 = *(void **)(a1 + 40);
      if (v52)
      {
        v86 = v25;
        v53 = (void *)MEMORY[0x1E0CB3940];
        v82 = v51;
        objc_msgSend(a5, "_externalDescription");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("preferred size changed for item with uniformAcrossSiblings dimension: \"%@\"), v81);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x1E0CB3B18];
        v97[0] = -[_UICollectionPreferredSize fittingSize](v27);
        v97[1] = v55;
        objc_msgSend(v54, "valueWithBytes:objCType:", v97);
        v79 = v9;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)v96 = v17;
        *(double *)&v96[1] = v19;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v96, "{CGSize=dd}");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)v95 = v13;
        *(double *)&v95[1] = v15;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v95, "{CGSize=dd}");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "recordPreferredAttributesChangeForElementWithAttributes:reason:changedAttribute:fromValue:toValue:layoutGeneratedValue:", v88, v80, CFSTR("preferredSize"), v56, v57, v58);

        v25 = v86;
        v9 = v79;

        v51 = v82;
      }
      if (!v51)
        goto LABEL_44;
      goto LABEL_27;
    }
    if (!v48)
    {
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_44;
      v84 = *(void **)(a1 + 40);
      v85 = v25;
      v75 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a5, "_externalDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "stringWithFormat:", CFSTR("preferred size changed for item: \"%@\"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)MEMORY[0x1E0CB3B18];
      v94[0] = -[_UICollectionPreferredSize fittingSize](v27);
      v94[1] = v77;
      objc_msgSend(v76, "valueWithBytes:objCType:", v94, "{CGSize=dd}");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      *(double *)v93 = v17;
      *(double *)&v93[1] = v19;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v93, "{CGSize=dd}");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)v92 = v13;
      *(double *)&v92[1] = v15;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v92, "{CGSize=dd}");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "recordPreferredAttributesChangeForElementWithAttributes:reason:changedAttribute:fromValue:toValue:layoutGeneratedValue:", v88, v33, CFSTR("preferredSize"), v34, v35, v78);

      goto LABEL_43;
    }
  }
  if (!v27)
  {
    v66 = 0;
    goto LABEL_34;
  }
LABEL_27:
  if (*(_BYTE *)(v27 + 48))
    goto LABEL_28;
  v66 = *(void **)(v27 + 56);
LABEL_34:
  v67 = v66;
  v68 = a6;
  v69 = v68;
  if (v67 == v68)
  {

    v70 = 0;
    goto LABEL_45;
  }
  if (!v68 || !v67)
  {

LABEL_28:
    v59 = *(void **)(a1 + 40);
    if (v59)
    {
      v83 = a6;
      if (v27)
        v60 = *(_BYTE *)(v27 + 48) != 0;
      else
        v60 = 0;
      v85 = v25;
      v61 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a5, "_externalDescription");
      v62 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v62;
      if (v60)
      {
        objc_msgSend(v61, "stringWithFormat:", CFSTR("dirty preferred size for item: \"%@\"), v62);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)MEMORY[0x1E0CB3B18];
        v91[0] = -[_UICollectionPreferredSize fittingSize](v27);
        v91[1] = v64;
        objc_msgSend(v63, "valueWithBytes:objCType:", v91, "{CGSize=dd}");
        v34 = (id)objc_claimAutoreleasedReturnValue();
        *(double *)v90 = v17;
        *(double *)&v90[1] = v19;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v90, "{CGSize=dd}");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)v89 = v13;
        *(double *)&v89[1] = v15;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v89, "{CGSize=dd}");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "recordPreferredAttributesChangeForElementWithAttributes:reason:changedAttribute:fromValue:toValue:layoutGeneratedValue:", v88, v33, CFSTR("preferredSize"), v34, v35, v65);

        a6 = v83;
LABEL_43:

        v25 = v85;
        goto LABEL_44;
      }
      objc_msgSend(v61, "stringWithFormat:", CFSTR("Additional preferred sizing data changed for item: \"%@\"), v62);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v71 = *(void **)(v27 + 56);
      else
        v71 = 0;
      a6 = v83;
      v34 = v71;
      -[UICollectionViewLayoutAttributes _preferredSizingData](v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("additionalData");
      v37 = v59;
      v38 = v88;
      v39 = v33;
      v40 = v34;
      v41 = v83;
LABEL_42:
      objc_msgSend(v37, "recordPreferredAttributesChangeForElementWithAttributes:reason:changedAttribute:fromValue:toValue:layoutGeneratedValue:", v38, v39, v36, v40, v41, v35);
      goto LABEL_43;
    }
LABEL_44:
    v72 = [_UICollectionPreferredSize alloc];
    objc_msgSend(a5, "size");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[_UICollectionPreferredSize initWithOriginalSize:fittingSize:layoutSize:additionalData:](v72, v73, a6, v13, v15, v17, v19);

    -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v20, (uint64_t)v69, v25);
    v70 = 1;
LABEL_45:

    goto LABEL_46;
  }
  v87 = objc_msgSend(v67, "isEqual:", v68);

  if ((v87 & 1) == 0)
    goto LABEL_28;
  v70 = 0;
LABEL_46:

  return v70;
}

void __76___UICollectionCompositionalLayoutSolver__attributesQueryInfosForQueryRect___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat Width;
  CGFloat Height;
  _UICollectionLayoutExtendedAttributesQueryInfo *v15;
  id v16;
  void *v17;
  char v18;
  objc_super v19;
  CGRect v20;

  v4 = (id *)(id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  if (v4)
  {
    v5 = v4;
    if (!objc_msgSend(v4[2], "scrollsOrthogonally"))
      return;
    v6 = v5[1];
  }
  else
  {
    v18 = objc_msgSend(0, "scrollsOrthogonally");
    v6 = 0;
    if ((v18 & 1) == 0)
      return;
  }
  objc_msgSend(v6, "orthogonalOffset");
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(a1 + 48);
  v12 = *(double *)(a1 + 56);
  v20.size.width = *(CGFloat *)(a1 + 64);
  v20.size.height = *(CGFloat *)(a1 + 72);
  v20.origin.x = v11;
  v20.origin.y = v12;
  Width = CGRectGetWidth(v20);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  v15 = [_UICollectionLayoutExtendedAttributesQueryInfo alloc];
  if (v15)
  {
    v19.receiver = v15;
    v19.super_class = (Class)_UICollectionLayoutExtendedAttributesQueryInfo;
    v16 = objc_msgSendSuper2(&v19, sel_init);
    v17 = v16;
    if (v16)
    {
      *((double *)v16 + 2) = v8 + v11;
      *((double *)v16 + 3) = v10 + v12;
      *((CGFloat *)v16 + 4) = Width;
      *((CGFloat *)v16 + 5) = Height;
      *((_QWORD *)v16 + 1) = a2;
    }
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);

}

void __75___UICollectionCompositionalLayoutSolver__registerDecorationItemsIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a2, "decorationItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (objc_msgSend(v8, "_registrationViewClass"))
        {
          v9 = *(_QWORD *)(a1 + 32);
          if (v9)
          {
            v10 = *(id *)(v9 + 112);
            v11 = v10;
            if (v10)
              v10 = (id)*((_QWORD *)v10 + 7);
          }
          else
          {
            v11 = 0;
            v10 = 0;
          }
          (*((void (**)(id, void *))v10 + 2))(v10, v8);

        }
        ++v7;
      }
      while (v5 != v7);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v12;
    }
    while (v12);
  }

}

uint64_t __79___UICollectionCompositionalLayoutSolver_enumerateSectionDefinitionsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke(_QWORD *a1, _WORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UICollectionLayoutSolveParameters *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") == 1)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = objc_msgSend(v4, "section");
  if (objc_msgSend(v4, "length") == 1)
    v6 = objc_msgSend(v4, "indexAtPosition:", 0);
  else
    v6 = objc_msgSend(v4, "item");
  v7 = v6;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v8 = (_UICollectionLayoutSolveParameters *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v8 = objc_alloc_init(_UICollectionLayoutSolveParameters);
      v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v12);

    }
  }
  if (a2)
  {
    v13 = a2[144];
    if ((v13 & 1) != 0)
    {
      if (v8)
        -[NSMutableIndexSet addIndex:](v8->_invalidatedIndexes, "addIndex:", v7);
    }
    else if ((v13 & 3) == 0)
    {
      -[UIBarButtonItemGroup _items]((id *)a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == 0x7FFFFFFFFFFFFFFFLL
        && ((v15 = a1[4]) == 0 ? (v16 = 0) : (v16 = *(_QWORD **)(v15 + 272)),
            -[_UICollectionLayoutAuxillaryItemSolver elementKinds](v16),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "containsObject:", v14),
            v17,
            v18))
      {
        v19 = (void *)a1[5];
        v21[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v14, v20);

      }
      else
      {
        -[_UICollectionLayoutSolveParameters addAuxillaryIndex:elementKind:]((uint64_t)v8, v7, v14);
      }

    }
  }

}

void __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  _QWORD *v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  _UICollectionSectionSolutionBookmark *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  double v58;
  id *v59;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsEmpty;
  double *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  _BOOL4 v110;
  double v111;
  id v112;
  _QWORD v113[4];
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE v119[9];
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;

  v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v112 = (id)v4;
  if (v4)
  {
    v5 = *(id *)(v4 + 8);
    v6 = (void *)*((_QWORD *)v112 + 2);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v9 = v8;
  if (v7 && objc_msgSend(v8, "_pinnedSupplementariesShouldOverlap"))
    v10 = objc_msgSend(v9, "scrollsOrthogonally") ^ 1;
  else
    v10 = 0;

  v11 = v112;
  if (v112)
  {
    v13 = *((double *)v112 + 3);
    v12 = *((double *)v112 + 4);
    v14 = *((double *)v112 + 5);
    v15 = *((double *)v112 + 6);
  }
  else
  {
    v12 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
  }
  v119[0] = 0;
  if (v10)
  {
    v16 = objc_msgSend(*(id *)(a1 + 48), "indexGreaterThanIndex:", v2);
    if (v16 == v2 + 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = *(void **)(v17 + 16);
      else
        v19 = 0;
      v20 = v19;
      v21 = v20;
      if (*(_QWORD *)(a1 + 40)
        && objc_msgSend(v20, "_pinnedSupplementariesShouldOverlap")
        && (objc_msgSend(v21, "scrollsOrthogonally") & 1) == 0)
      {
        v22 = *(_QWORD *)(a1 + 40);
        if (v22)
          v23 = *(_QWORD *)(v22 + 64);
        else
          v23 = 0;
        v24 = _UIDirectionalEdgeForPreEdgeOnLayoutAxis(v23);
        v13 = -[_UICollectionCompositionalLayoutSolver _frameByExtendingGlobalSectionFrame:toOverlapPinnedSupplementaryInSection:onEdge:visibleBounds:didExtend:](v22, (uint64_t)v18, v24, v119, v13, v12, v14, v15, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
        v12 = v25;
        v14 = v26;
        v15 = v27;
      }

    }
    v28 = objc_msgSend(*(id *)(a1 + 48), "indexLessThanIndex:", v2);
    if (v28 == v2 - 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v29)
        v31 = *(void **)(v29 + 16);
      else
        v31 = 0;
      v32 = v31;
      v33 = v32;
      if (*(_QWORD *)(a1 + 40)
        && objc_msgSend(v32, "_pinnedSupplementariesShouldOverlap")
        && (objc_msgSend(v33, "scrollsOrthogonally") & 1) == 0)
      {
        v34 = *(_QWORD *)(a1 + 40);
        if (v34)
          v35 = *(_QWORD *)(v34 + 64);
        else
          v35 = 0;
        v36 = _UIDirectionalEdgeForPostEdgeOnLayoutAxis(v35);
        v13 = -[_UICollectionCompositionalLayoutSolver _frameByExtendingGlobalSectionFrame:toOverlapPinnedSupplementaryInSection:onEdge:visibleBounds:didExtend:](v34, (uint64_t)v30, v36, v119, v13, v12, v14, v15, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
        v12 = v37;
        v14 = v38;
        v15 = v39;
      }

    }
    v40 = v119[0] != 0;
    v11 = v112;
  }
  else
  {
    v40 = 0;
  }
  if (v11)
  {
    v41 = v11[7];
    v42 = v11[8];
    v43 = v11[9];
    v44 = v11[10];
  }
  else
  {
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v41 = 0;
  }
  v120.origin.x = v13;
  v120.origin.y = v12;
  v120.size.width = v14;
  v120.size.height = v15;
  if (!CGRectEqualToRect(v120, *(CGRect *)&v41))
  {
    v110 = v40;
    v45 = v2;
    v46 = v14;
    if (v112)
    {
      v47 = [_UICollectionSectionSolutionBookmark alloc];
      v48 = *((double *)v112 + 3);
      v49 = *((double *)v112 + 4);
      v50 = *((double *)v112 + 5);
      v51 = *((double *)v112 + 6);
      v52 = (void *)*((_QWORD *)v112 + 11);
      v53 = (void *)*((_QWORD *)v112 + 12);
      v54 = (void *)*((_QWORD *)v112 + 1);
      v55 = (void *)*((_QWORD *)v112 + 13);
      v56 = *((id *)v112 + 2);
      v57 = v54;
      v58 = v48;
      v14 = v46;
      v59 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)&v47->super.isa, v57, v52, v53, v56, v55, v58, v49, v50, v51, v13, v12, v46, v15);

    }
    else
    {
      v59 = 0;
    }
    v2 = v45;
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v59, v45);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v40 = v110;
  }
  v121.origin.x = v13;
  v121.origin.y = v12;
  v121.size.width = v14;
  v121.size.height = v15;
  v122 = CGRectIntersection(v121, *(CGRect *)(a1 + 72));
  x = v122.origin.x;
  y = v122.origin.y;
  width = v122.size.width;
  height = v122.size.height;
  if ((v10 & 1) != 0
    || !CGRectIsEmpty(v122)
    && (v126.origin.x = x, v126.origin.y = y, v126.size.width = width, v126.size.height = height, !CGRectIsNull(v126)))
  {
    v123.origin.x = x;
    v123.origin.y = y;
    v123.size.width = width;
    v123.size.height = height;
    IsEmpty = CGRectIsEmpty(v123);
    v65 = (double *)MEMORY[0x1E0C9D538];
    if (IsEmpty)
    {
      v124.origin.x = v13;
      v124.origin.y = v12;
      v124.size.width = v14;
      v124.size.height = v15;
      v66 = CGRectGetWidth(v124);
      v125.origin.x = v13;
      v125.origin.y = v12;
      v125.size.width = v14;
      v125.size.height = v15;
      v67 = CGRectGetHeight(v125);
      v68 = 0.0;
      v69 = 0.0;
      if (!v40)
      {
LABEL_41:
        objc_msgSend(v5, "updatePinnedSupplementaryItemsWithVisibleBounds:", v68, v69, v66, v67);
LABEL_55:
        objc_msgSend(v5, "pinnedSupplementaryIndexes");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v113[0] = MEMORY[0x1E0C809B0];
        v113[1] = 3221225472;
        v113[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_2;
        v113[3] = &unk_1E16B8768;
        v103 = v5;
        v104 = *(_QWORD *)(a1 + 104);
        v117 = v2;
        v118 = v104;
        v105 = *(_QWORD *)(a1 + 40);
        v114 = v103;
        v115 = v105;
        v116 = *(id *)(a1 + 56);
        objc_msgSend(v102, "enumerateIndexesUsingBlock:", v113);

        goto LABEL_56;
      }
    }
    else
    {
      v108 = v14;
      v109 = v12;
      if (v112)
      {
        v70 = *((double *)v112 + 3);
        v71 = *((double *)v112 + 4);
        v72 = *((double *)v112 + 5);
        v73 = *((double *)v112 + 6);
      }
      else
      {
        v71 = 0.0;
        v72 = 0.0;
        v73 = 0.0;
        v70 = 0.0;
      }
      v74 = _UIRectSubtractingRectYieldingDirectionalInsets(v70, v71, v72, v73, x, y, width, height);
      v76 = v75;
      v78 = v77;
      v80 = v79;
      v82 = *v65;
      v81 = v65[1];
      v83 = v112;
      if (v112)
        v83 = (void *)*((_QWORD *)v112 + 1);
      objc_msgSend(v83, "contentFrameIncludingAuxiliaries");
      v68 = v76 + v82;
      v66 = v84 - (v80 + v76);
      v69 = v74 + v81;
      v67 = v85 - (v74 + v78);
      v14 = v108;
      v12 = v109;
      if (!v40)
        goto LABEL_41;
    }
    v106 = v67;
    v111 = v66;
    if (v112)
    {
      v86 = *((double *)v112 + 3);
      v87 = *((double *)v112 + 4);
      v88 = *((double *)v112 + 5);
      v89 = *((double *)v112 + 6);
    }
    else
    {
      v87 = 0.0;
      v88 = 0.0;
      v89 = 0.0;
      v86 = 0.0;
    }
    v90 = _UIRectSubtractingRectYieldingDirectionalInsets(v86, v87, v88, v89, v13, v12, v14, v15);
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = *v65;
    v97 = v65[1];
    v99 = v112;
    if (v112)
      v99 = (void *)*((_QWORD *)v112 + 1);
    objc_msgSend(v99, "contentFrameIncludingAuxiliaries", *(_QWORD *)&v106);
    objc_msgSend(v5, "updatePinnedSupplementaryItemsWithVisibleBounds:overrideContentRectForPinning:", v68, v69, v111, v107, v92 + v98, v90 + v97, v100 - (v96 + v92), v101 - (v90 + v94));
    goto LABEL_55;
  }
LABEL_56:

}

void __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sectionSupplementaryFrameForIndex:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = *(_QWORD *)(v3 + 16);
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4, *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_UICollectionCompositionalLayoutSolver.m"), 349, CFSTR("Could not determine supplementary elementKind."));

  }
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver invalidateCachedSupplementaryAttributesForElementKind:atIndexPaths:](v8, (uint64_t)v7, (uint64_t)v9);

  objc_msgSend(*(id *)(a1 + 48), "addInvalidatedSupplementaryForKind:indexPath:", v7, v5);
}

void __154___UICollectionCompositionalLayoutSolver__updateResultNotingInsertedItemAndSectionAuxillaries_forVisibleGroupAuxillaryAttributesBeforeResolve_withUpdate___block_invoke(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  id v18;

  v7 = (id)objc_msgSend(a2, "indexPath");
  if (a4 && (*(_QWORD *)(a4 + 32) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v8 = v7;
    v9 = *(_QWORD *)(a4 + 56);
    switch(v9)
    {
      case 2:
        if ((unint64_t)objc_msgSend(v7, "length") >= 2)
        {
          v14 = objc_msgSend(v8, "section");
          if (v14 != 0x7FFFFFFFFFFFFFFFLL
            && objc_msgSend(*(id *)(a1 + 32), "initialSectionIndexForFinalSectionIndex:", v14) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = *(_QWORD *)(a1 + 40);
            -[UIBarButtonItemGroup _items]((id *)a2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (a2)
              v17 = (a2[144] & 3) == 0;
            else
              v17 = 0;
            v18 = v16;
            -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:](v15, v16, (uint64_t)v8, v17);
            goto LABEL_11;
          }
        }
        break;
      case 3:
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a2);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:");
LABEL_11:

        return;
      case 4:
        objc_msgSend(*(id *)(a1 + 32), "initialIndexPathForFinalIndexPath:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v11 = *(_QWORD *)(a1 + 40);
          -[UIBarButtonItemGroup _items]((id *)a2);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a2, "indexPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (a2)
            v13 = (a2[144] & 3) == 0;
          else
            v13 = 0;
          -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:](v11, v18, (uint64_t)v12, v13);

          goto LABEL_11;
        }
        break;
    }
  }
}

void __138___UICollectionCompositionalLayoutSolver__updateResultsNotingDeletedItemAndSectionAuxillaries_returningStartingGroupAuxillariesForUpdate___block_invoke(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;

  if (a4 && (*(_QWORD *)(a4 + 32) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7 = (id)objc_msgSend(a2, "indexPath");
    v8 = v7;
    v9 = *(_QWORD *)(a4 + 56);
    switch(v9)
    {
      case 2:
        if ((unint64_t)objc_msgSend(v7, "length") >= 2)
        {
          v11 = objc_msgSend(v8, "section");
          if (v11 != 0x7FFFFFFFFFFFFFFFLL
            && objc_msgSend(*(id *)(a1 + 32), "finalSectionIndexForInitialSectionIndex:", v11) == 0x7FFFFFFFFFFFFFFFLL)
          {
            goto LABEL_11;
          }
        }
        break;
      case 3:
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a2);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:");
LABEL_16:

        return;
      case 4:
        objc_msgSend(*(id *)(a1 + 32), "finalIndexPathForInitialIndexPath:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
LABEL_11:
          v12 = *(_QWORD *)(a1 + 40);
          -[UIBarButtonItemGroup _items]((id *)a2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (a2)
            v14 = (a2[144] & 3) == 0;
          else
            v14 = 0;
          v15 = v13;
          -[_UICollectionCompositionalLayoutSolverResolveResult addDeletedAuxillaryOfElementKind:atIndexPath:isSupplementary:](v12, v13, (uint64_t)v8, v14);
          goto LABEL_16;
        }
        break;
    }
  }
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  CGFloat v24;
  CGFloat v25;
  id *v26;
  id **v27;
  id **v28;
  id *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id *v57;
  double v58;
  id v59;
  _QWORD v60[4];
  id *v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  CGRect v70;
  CGRect v71;

  v5 = objc_msgSend(a2, "integerValue");
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[23];
  v7 = v6;
  objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
  v59 = (id)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v8 = *((id *)v59 + 1);
    v9 = (void *)*((_QWORD *)v59 + 13);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = v9;
  objc_msgSend(v8, "contentFrameIncludingAuxiliaries");
  v58 = v11;
  v13 = v12;
  if (v59)
  {
    v15 = *((double *)v59 + 3);
    v14 = *((double *)v59 + 4);
    v16 = *((_QWORD *)v59 + 5);
    v17 = *((_QWORD *)v59 + 6);
  }
  else
  {
    v14 = 0.0;
    v16 = 0;
    v17 = 0;
    v15 = 0.0;
  }
  v18 = v15;
  v19 = v14;
  v70 = CGRectIntersection(*(CGRect *)(a1 + 48), *(CGRect *)(&v16 - 2));
  x = v70.origin.x;
  y = v70.origin.y;
  width = v70.size.width;
  height = v70.size.height;
  v24 = CGRectGetWidth(v70);
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  v25 = CGRectGetHeight(v71);
  v26 = *(id **)(a1 + 32);
  if (v26)
  {
    v27 = (id **)v26[14];
    v28 = v27;
    if (v27)
      v26 = v27[8];
    else
      v26 = 0;
  }
  else
  {
    v28 = 0;
  }
  v29 = v26;

  if (a3)
  {
    v30 = x - v15;
    v32 = *(_QWORD *)(a1 + 80);
    v31 = *(_QWORD *)(a1 + 88);
    a3 = objc_msgSend((id)a3, "copy");
    *(_QWORD *)(a3 + 32) = v32;
    *(_QWORD *)(a3 + 40) = v31;
    *(double *)(a3 + 48) = v30;
    *(double *)(a3 + 56) = y - v14;
    *(CGFloat *)(a3 + 64) = v24;
    *(CGFloat *)(a3 + 72) = v25;
  }
  objc_msgSend(v8, "resolveWithParameters:preferredSizes:", a3, v10);
  v33 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 && v29)
  {
    objc_msgSend(v8, "container");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
      v36 = (void *)*((_QWORD *)v59 + 11);
    else
      v36 = 0;
    v37 = v36;
    objc_msgSend(v8, "errorDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(id *, uint64_t, void *, id, void *, uint64_t))v29[2])(v29, v5, v35, v37, v38, 1);

  }
  objc_msgSend(v8, "contentFrameIncludingAuxiliaries");
  v40 = v39;
  v42 = v41;
  v43 = *(_QWORD *)(a1 + 32);
  if (v43)
    v44 = *(void **)(v43 + 88);
  else
    v44 = 0;
  if (objc_msgSend(v44, "containsIndex:", v5))
  {
    v45 = objc_msgSend(v8, "layoutAxis");
    if ((unint64_t)(v45 - 1) <= 1)
    {
      v46 = v45;
      v47 = _UISizeValueForAxis(v45, v13, v58);
      if (vabdd_f64(v47, _UISizeValueForAxis(v46, v40, v42)) > 0.1)
      {
        -[UICollectionViewLayoutInvalidationContext _orthogonalSectionsWithContentSizeChanges](*(_QWORD **)(a1 + 40));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addIndex:", v5);

      }
    }
  }
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIBarButtonItemGroup _items](v33);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_3;
  v67[3] = &unk_1E16B8998;
  v68 = v49;
  v69 = v5;
  v52 = v49;
  objc_msgSend(v50, "enumerateIndexesUsingBlock:", v67);

  objc_msgSend(*(id *)(a1 + 40), "invalidateItemsAtIndexPaths:", v52);
  -[_UICollectionLayoutSolveResult invalidatedAuxillaryKinds]((uint64_t)v33);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v51;
  v60[1] = 3221225472;
  v60[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_4;
  v60[3] = &unk_1E16B89E8;
  v61 = v33;
  v62 = v8;
  v54 = *(_QWORD *)(a1 + 96);
  v65 = v5;
  v66 = v54;
  v55 = *(void **)(a1 + 40);
  v63 = *(_QWORD *)(a1 + 32);
  v64 = v55;
  v56 = v8;
  v57 = v33;
  objc_msgSend(v53, "enumerateObjectsUsingBlock:", v60);

}

void __98___UICollectionCompositionalLayoutSolver_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __79___UICollectionCompositionalLayoutSolver_traitsRequiringInvalidationForChanges__block_invoke()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    v6[0] = 0x1E1A994E0;
    v0 = (void *)MEMORY[0x1E0C99D20];
    v1 = v6;
    v2 = 1;
  }
  else
  {
    v5[0] = 0x1E1A994F8;
    v5[1] = 0x1E1A99540;
    v5[2] = 0x1E1A994E0;
    v0 = (void *)MEMORY[0x1E0C99D20];
    v1 = v5;
    v2 = 3;
  }
  objc_msgSend(v0, "arrayWithObjects:count:", v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECD77598;
  qword_1ECD77598 = v3;

}

void __89___UICollectionCompositionalLayoutSolver_mutatedVisibleItemsForElementsForVisibleBounds___block_invoke_2()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category)
  {
    v0 = __UILogCategoryGetNode("UICompositionalLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "note: the section invalidation handler cannot currently mutate visible items for layouts containing estimated items. Please file an enhancement request on UICollectionView.", v2, 2u);
  }
}

void __97___UICollectionCompositionalLayoutSolver__unpinnedFramesOfSupplementariesPinnedToEdge_ofSection___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "unpinnedSectionSupplementaryFrameForIndex:", a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutFramesQueryResult auxillaryItem](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundarySupplementaryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "alignment");
    v8 = *(_QWORD *)(a1 + 64);
    if (v8 == 1)
    {
      if ((unint64_t)(v7 - 2) >= 3)
        v9 = 8 * ((unint64_t)(v7 - 6) < 3);
      else
        v9 = 2;
    }
    else if (v8 == 2 && (unint64_t)(v7 - 1) < 8)
    {
      v9 = qword_186679970[v7 - 1];
    }
    else
    {
      v9 = 0;
    }
    if (v9 == *(_QWORD *)(a1 + 72))
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v14)
      {
        objc_msgSend(v14, "addObject:", v4);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = 138413058;
      v22 = v19;
      v23 = 2048;
      v24 = a2;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v4;
      _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "UIKit internal bug: Compositional solver found a section with supplementaries pinned at indexes %@, but the supplementary at index %zd is not pinned.\nSection bookmark: %@. Pinned supplementary frame: %@", (uint8_t *)&v21, 0x2Au);
    }

  }
  else
  {
    v10 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_1;
    if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_1)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_1);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v21 = 138413058;
      v22 = v12;
      v23 = 2048;
      v24 = a2;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "UIKit internal bug: Compositional solver found a section with supplementaries pinned at indexes %@, but the supplementary at index %zd is not pinned.\nSection bookmark: %@. Pinned supplementary frame: %@", (uint8_t *)&v21, 0x2Au);
    }
  }

}

_QWORD *__96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_3(uint64_t a1, double *a2, uint64_t a3)
{
  _QWORD *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v5 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    v6 = a2[7];
    v7 = a2[8];
    v8 = a2[9];
    v9 = a2[10];
    v10 = (void *)*((_QWORD *)a2 + 1);
  }
  else
  {
    v10 = 0;
    v9 = 0.0;
    v8 = 0.0;
    v7 = 0.0;
    v6 = 0.0;
  }
  return -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:](v5, *(_QWORD **)(a1 + 40), v10, a3, v6, v7, v8, v9);
}

void __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _WORD *v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat Width;
  CGFloat Height;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  id v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(id **)(v4 + 272);
  else
    v5 = 0;
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
    v7 = *((_QWORD *)v25 + 2);
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:](*(_QWORD *)(a1 + 32), (uint64_t)v10, (uint64_t)v8);
  v11 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[_UICollectionCompositionalLayoutSolver _invalidateAttributes:](*(_QWORD *)(a1 + 32), v11);
  objc_msgSend(*(id *)(a1 + 40), "addInvalidatedSupplementaryForKind:indexPath:", v10, v8);
  if (v25)
  {
    v13 = *((double *)v25 + 8);
    v12 = *((double *)v25 + 9);
    v14 = *((double *)v25 + 10);
    v15 = *((double *)v25 + 11);
  }
  else
  {
    v12 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
  }
  v16 = *(double *)(a1 + 48);
  v17 = *(double *)(a1 + 56);
  v26.origin.x = v13;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v15;
  Width = CGRectGetWidth(v26);
  v27.origin.x = v13;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v15;
  Height = CGRectGetHeight(v27);
  v20 = *(_QWORD *)(a1 + 32);
  -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "zIndex");
  if (v25)
    v23 = *((_BYTE *)v25 + 8) != 0;
  else
    v23 = 0;
  v24 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](v20, v8, v10, v22, v23, v13 + v16, v12 + v17, Width, Height);

}

void __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  _UICollectionLayoutVisibleItem *v9;
  void *v10;
  id v11;
  id *v12;
  _UICollectionCompositionalLayoutDynamicBehavior *v13;
  id *v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;

  +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a2);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v26);
  -[_UICollectionCompositionalLayoutDynamicAnimator behaviorForIdentifier:](*(id **)(a1 + 32), (uint64_t)v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v26;
  if (!v7)
  {
    v9 = [_UICollectionLayoutVisibleItem alloc];
    if (a4)
      v10 = *(void **)(a4 + 40);
    else
      v10 = 0;
    v11 = v10;
    v12 = -[_UICollectionLayoutVisibleItem initWithLayoutAttributes:layoutItem:](v9, a2, v11);

    v13 = [_UICollectionCompositionalLayoutDynamicBehavior alloc];
    if (v13)
    {
      v27.receiver = v13;
      v27.super_class = (Class)_UICollectionCompositionalLayoutDynamicBehavior;
      v14 = (id *)objc_msgSendSuper2(&v27, sel_init);
      v15 = v14;
      if (v14)
      {
        objc_storeStrong(v14 + 6, v12);
        objc_msgSend(v15, "setAction:", &__block_literal_global_440);
      }
    }
    else
    {
      v15 = 0;
    }
    v16 = *(id **)(a1 + 32);
    if (!v16)
      goto LABEL_16;
    if (v15)
    {
      v17 = v15[6];
      if (v17)
      {
        v18 = v17;
        v19 = (void *)*((_QWORD *)v17 + 2);
LABEL_11:
        v20 = v19;
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_addItemBehavior_, v16, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3556, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

        }
        objc_msgSend(v16[42], "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v16, "removeBehavior:", v22);
          objc_msgSend(v16[42], "removeObjectForKey:", v21);
        }
        objc_msgSend(v16[42], "setObject:forKeyedSubscript:", v15, v21);
        objc_msgSend(v16, "addBehavior:", v15);

LABEL_16:
        v8 = v26;
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel_addItemBehavior_, v16, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibleItemBehavior"));

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_addItemBehavior_, v16, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibleItem"));

    v18 = 0;
    v19 = 0;
    goto LABEL_11;
  }
LABEL_17:

}

void __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _WORD *v5;
  id *v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  -[_UICollectionCompositionalLayoutDynamicAnimator behaviorForIdentifier:](*(id **)(a1 + 32), a2);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v4 = (_QWORD *)v9[6];
    if (v4)
      v4 = (_QWORD *)v4[2];
    v5 = v4;
    -[_UICollectionCompositionalLayoutSolver _invalidateAttributes:](*(_QWORD *)(a1 + 40), v5);

  }
  v6 = *(id **)(a1 + 32);
  if (v6)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeItemBehaviorForIdentifier_, v6, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3570, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    }
    objc_msgSend(v6[42], "objectForKeyedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "removeBehavior:", v7);
      objc_msgSend(v6[42], "removeObjectForKey:", a2);
    }

  }
}

void __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectAtIndexedSubscript:", a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v4;
  if (v4)
    v5 = *(void **)(v4 + 8);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "pinnedSupplementaryIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_2;
  v10[3] = &unk_1E16B8BF0;
  v11 = v6;
  v13 = a2;
  v12 = *(_OWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v10);

}

void __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  objc_msgSend(*(id *)(a1 + 32), "sectionSupplementaryFrameForIndex:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)v3;
  if (v3)
    v4 = *(_QWORD *)(v3 + 16);
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4, *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void ***)(a1 + 40);
  -[_UICollectionLayoutFramesQueryResult auxillaryItem](v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:](v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(id **)(v4 + 272);
  else
    v5 = 0;
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v12 = (id *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v7 = v12[2];
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutFramesQueryResult supplementaryItem](v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:](*(void ***)(a1 + 32), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __95___UICollectionCompositionalLayoutSolver_resolveSolutionForUpdate_container_ignoreEmptyUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = objc_msgSend(*(id *)(a1 + 32), "initialSectionIndexForFinalSectionIndex:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (v6 < *(_QWORD *)(a1 + 56))
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
        v9 = *(void **)(v8 + 184);
      else
        v9 = 0;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v15 = (id)v10;
      if (v10)
      {
        v11 = *(id *)(v10 + 16);
        v12 = v11;
        if (v11)
        {
          if ((objc_msgSend(v11, "isEqual:", a2) & 1) == 0)
          {
            v13 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObjectForKey:", v14);

          }
        }
      }
      else
      {
        v12 = 0;
      }

    }
  }
}

void __129___UICollectionCompositionalLayoutSolver__layoutAttributesOfFirstElementEligibleForPreferredSizingContentOffsetAdjustmentInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4, _BYTE *a5)
{
  int v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void **v20;
  id v21;
  id v22;
  CGRect v23;

  if (a4 && a4[4] == 1)
  {
    objc_msgSend(a2, "frame");
    v9 = 1;
    if (CGRectContainsPoint(v23, *(CGPoint *)(a1 + 64)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a5 = 1;
      return;
    }
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(a2, "frame");
  v12 = _UIPointValueForAxis(*(_QWORD *)(a1 + 96), v10, v11) - *(double *)(a1 + 104);
  -[_UICollectionLayoutFramesQueryResult auxillaryItem](a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v12 < *(double *)(v14 + 24))
    {
      v22 = v13;
      *(double *)(v14 + 24) = v12;
      v15 = *(_QWORD *)(a1 + 32);
      goto LABEL_14;
    }
  }
  if (v13)
  {
    v22 = v13;
    objc_msgSend(v13, "boundarySupplementaryItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "pinToVisibleBounds") & 1) != 0)
    {
LABEL_15:

      v13 = v22;
      goto LABEL_16;
    }
    objc_msgSend(v22, "decorationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isBackgroundDecoration");

    v13 = v22;
    if ((v18 & 1) != 0)
      goto LABEL_16;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v12 >= *(double *)(v19 + 24))
      goto LABEL_16;
    *(double *)(v19 + 24) = v12;
    v15 = *(_QWORD *)(a1 + 56);
LABEL_14:
    v20 = (void **)(*(_QWORD *)(v15 + 8) + 40);
    v21 = a2;
    v16 = *v20;
    *v20 = v21;
    goto LABEL_15;
  }
LABEL_16:

}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  -[_UICollectionLayoutSolveResult indexesForInvalidatedAuxillariesOfKind:](*(id **)(a1 + 32), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_5;
  v7[3] = &unk_1E16B89C0;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  v4 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = v4;
  v5 = *(void **)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v7);

}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_5(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "supplementaryFrameWithKind:index:", *(_QWORD *)(a1 + 40), a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4[4];
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1708, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1709, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.isAuxillary"));

  if (!v4)
    goto LABEL_8;
  v6 = v4[4];
LABEL_3:
  if (v6 == 3)
  {
    v10 = *(void **)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateDecorationElementsOfKind:atIndexPaths:", v11, v9);
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v8, v9);
LABEL_7:

  }
LABEL_8:

}

void __72___UICollectionCompositionalLayoutSolver__solveRetainingPreferredSizes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id *v15;
  id *v16;
  void *v17;
  void *v18;
  id *v19;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 184);
  else
    v7 = 0;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (id *)v8;
  if (*(_BYTE *)(a1 + 48))
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = *(_QWORD *)(v8 + 104);
    if (v11)
    {
      v19 = (id *)v8;
      v12 = objc_msgSend(*(id *)(v11 + 16), "count");
      v9 = v19;
      if (v12 || (v13 = objc_msgSend(*(id *)(v11 + 24), "count"), v9 = v19, v13))
      {
        v14 = v9[2];
        if (objc_msgSend(v14, "isEqual:", a2))
        {
          v15 = (id *)v19[13];
          v16 = -[_UICollectionPreferredSizes copyByDirtyingPreferredSizes](v15);
          v17 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

        }
        v9 = v19;
      }
    }
  }

}

uint64_t __110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _UIStringFromCollectionElementCategory(*(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_ui_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "appendFormat:", CFSTR(" Element category: %@; indexPath: %@;"), v4, v5);

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(a2, "appendFormat:", CFSTR("; elementKind: %@"), *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "length") == 2)
  {
    -[_UICollectionCompositionalLayoutSolver _existingSectionDefinitionForSectionIndex:](*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "group");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_externalDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "appendFormat:", CFSTR("\nSection: %@;\nGroup: %@"), v7, v9);

    }
  }
  return objc_msgSend(a2, "appendFormat:", CFSTR("\nInspect the layout definition responsible for creating this item and ensure that it does not result in an infinite or null frame, or a frame with members that aren't finite (inf/NaN)."));
}

@end
