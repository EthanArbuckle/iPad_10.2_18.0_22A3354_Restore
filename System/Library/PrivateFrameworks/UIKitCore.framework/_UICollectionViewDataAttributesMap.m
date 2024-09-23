@implementation _UICollectionViewDataAttributesMap

- (void)_setItemAttributes:(uint64_t)a3 forGlobalItemIndex:
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  id v21;
  id v22;
  CGRect v23;

  objc_msgSend(a2, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 8);
  v18 = a3;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  LOBYTE(a3) = -[_UICollectionViewRTree insertFrame:forElement:](v14, (uint64_t)&v18, v6, v8, v10, v12);

  if ((a3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    NSStringFromCGRect(v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewData collectionView](*(id **)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__setItemAttributes_forGlobalItemIndex_, a1, CFSTR("_UICollectionViewDataAttributesMap.mm"), 104, CFSTR("UICollectionView received layout attributes with invalid frame (%@). Layout attributes: %@. Collection view: %@."), v16, a2, v17);

  }
}

- (void)pageInLayoutAttributes:(uint64_t)a3 forGlobalItemIndex:
{
  void *v6;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_pageInLayoutAttributes_forGlobalItemIndex_, a1, CFSTR("_UICollectionViewDataAttributesMap.mm"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutAttributes != nil"));

    }
    -[_UICollectionViewDataAttributesMap _setItemAttributes:forGlobalItemIndex:](a1, a2, a3);
  }
}

- (void)invalidate
{
  _UICollectionViewRTree *v2;
  void *v3;
  __int128 v4;
  void *v5;

  if (a1)
  {
    v2 = objc_alloc_init(_UICollectionViewRTree);
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v2;

    v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(a1 + 48) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a1 + 64) = v4;
    v5 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    objc_storeStrong((id *)(a1 + 24), *(id *)(a1 + 32));
    objc_storeStrong((id *)(a1 + 16), *(id *)(a1 + 24));
  }
}

- (void)_validateLayoutInRect:(CGFloat)a3
{
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  unint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  id *v18;
  id WeakRetained;
  double v20;
  double v21;
  double v22;
  double *v23;
  int IsValid;
  int v25;
  double v26;
  double v27;
  double MinX;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  _BOOL4 IsEmpty;
  uint64_t v36;
  double v37;
  CGFloat v38;
  double v39;
  unint64_t v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  double v44;
  float64_t v45;
  BOOL v46;
  BOOL v47;
  unint64_t v48;
  float64x2_t v49;
  float64x2_t v50;
  unint64_t v51;
  _UICollectionViewRTree *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _WORD *v57;
  __int16 v58;
  id v59;
  void *v60;
  int8x16_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  int8x16_t v67;
  uint64_t v68;
  NSObject *v69;
  unint64_t v70;
  unint64_t v71;
  objc_class *v72;
  void *v73;
  NSObject *v74;
  objc_class *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  objc_class *v79;
  id v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  id v85;
  CGFloat v86;
  CGFloat x;
  CGFloat y;
  double v89;
  CGFloat v90;
  double v91;
  double height;
  double v93;
  double MinY;
  double width;
  _QWORD rect[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  _BYTE v101[128];
  _BYTE buf[12];
  __int16 v103;
  objc_class *v104;
  __int16 v105;
  id v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  uint64_t v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
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

  v111 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v10 = *(double *)(a1 + 48);
  v11 = *(double *)(a1 + 56);
  v13 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  v112.origin.x = v10;
  v112.origin.y = v11;
  v112.size.width = v13;
  v112.size.height = v12;
  v134.origin.x = a2;
  v134.origin.y = a3;
  v134.size.width = a4;
  v134.size.height = a5;
  if (!CGRectContainsRect(v112, v134))
  {
    v18 = (id *)*(id *)(a1 + 40);
    v15 = v18;
    if (!v18)
    {
LABEL_87:

      return;
    }
    *(CGFloat *)rect = v10;
    WeakRetained = objc_loadWeakRetained(v18 + 1);
    if (!WeakRetained)
    {
LABEL_86:

      goto LABEL_87;
    }
    v85 = WeakRetained;
    objc_msgSend(WeakRetained, "_visibleBounds");
    v84 = v20;
    v22 = v21;
    v23 = (double *)*(id *)(a1 + 40);
    v90 = v11;
    v91 = v12;
    v89 = v13;
    v83 = v22;
    if (v22 > 0.0
      && ((IsValid = CGFloatIsValid(), v84 > 0.0) ? (v25 = IsValid) : (v25 = 0), v25 == 1 && (CGFloatIsValid() & 1) != 0))
    {
      -[UICollectionViewData _validateContentSize]((uint64_t)v23);
      if (v23)
      {
        v26 = v23[10];
        v27 = v23[11];
      }
      else
      {
        v27 = 0.0;
        v26 = 0.0;
      }
      v93 = v26;
      v115.origin.x = a2;
      v115.origin.y = a3;
      v115.size.width = a4;
      v115.size.height = a5;
      MinX = CGRectGetMinX(v115);
      v116.origin.x = v83 * floor(a2 / v83);
      rect[1] = *(_QWORD *)&v116.origin.x;
      v116.origin.y = a3;
      v116.size.width = a4;
      v116.size.height = a5;
      v29 = v83 * ceil((a4 + MinX - CGRectGetMinX(v116)) / v83);
      *(_QWORD *)&v117.origin.x = rect[1];
      v117.origin.y = a3;
      v117.size.width = v29;
      v117.size.height = a5;
      if (CGRectGetMaxX(v117) > v93 && (dyld_program_sdk_at_least() & 1) == 0)
      {
        *(_QWORD *)&v118.origin.x = rect[1];
        v118.origin.y = a3;
        v118.size.width = v29;
        v118.size.height = a5;
        v29 = v29 - (CGRectGetMaxX(v118) - v93);
      }
      v119.origin.x = a2;
      v119.origin.y = a3;
      v119.size.width = a4;
      v119.size.height = a5;
      MinY = CGRectGetMinY(v119);
      v120.origin.y = v84 * floor(a3 / v84);
      *(_QWORD *)&v120.origin.x = rect[1];
      y = v120.origin.y;
      v120.size.width = v29;
      v120.size.height = a5;
      v30 = v84 * ceil((a5 + MinY - CGRectGetMinY(v120)) / v84);
      *(_QWORD *)&v121.origin.x = rect[1];
      v121.origin.y = y;
      v121.size.width = v29;
      v121.size.height = v30;
      if (CGRectGetMaxY(v121) <= v27 || (dyld_program_sdk_at_least() & 1) != 0)
      {
        v31 = v29;
        v32 = *(double *)&rect[1];
        v33 = v30;
      }
      else
      {
        *(_QWORD *)&v126.origin.x = rect[1];
        v126.origin.y = y;
        v126.size.width = v29;
        v126.size.height = v30;
        v33 = v30 - (CGRectGetMaxY(v126) - v27);
        v31 = v29;
        v32 = *(double *)&rect[1];
      }
      v34 = y;
    }
    else
    {
      v33 = a5;
      v31 = a4;
      v34 = a3;
      v32 = a2;
    }

    *(CGFloat *)&rect[1] = v32;
    v122.origin.x = v32;
    v122.origin.y = v34;
    v122.size.width = v31;
    v122.size.height = v33;
    IsEmpty = CGRectIsEmpty(v122);
    v36 = rect[0];
    v37 = v91;
    if (IsEmpty)
    {
      v39 = v89;
      v38 = v90;
      if (CGRectIsEmpty(*(CGRect *)&v36))
      {
        v40 = qword_1ECD7F8D0;
        if (!qword_1ECD7F8D0)
        {
          v40 = __UILogCategoryGetNode("UICollectionViewAttrMap", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v40, (unint64_t *)&qword_1ECD7F8D0);
        }
        WeakRetained = v85;
        if ((*(_BYTE *)v40 & 1) == 0)
          goto LABEL_86;
        v41 = *(id *)(v40 + 8);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v123.origin.x = a2;
          v123.origin.y = a3;
          v123.size.width = a4;
          v123.size.height = a5;
          NSStringFromCGRect(v123);
          v42 = (objc_class *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v124.origin.x = rect[0];
          v124.origin.y = v90;
          v124.size.width = v89;
          v124.size.height = v91;
          NSStringFromCGRect(v124);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = a1;
          v103 = 2112;
          v104 = v42;
          v105 = 2112;
          v106 = v43;
          _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; returning early because query & currently valid rects are both empty. queryRect: %@. validRect: %@",
            buf,
            0x20u);

        }
        goto LABEL_85;
      }
    }
    v44 = v31;
    *(_QWORD *)&v135.origin.x = rect[1];
    v45 = v34;
    v135.origin.y = v34;
    v135.size.width = v44;
    v135.size.height = v33;
    v125 = CGRectUnion(*(CGRect *)(a1 + 48), v135);
    v86 = v125.origin.y;
    x = v125.origin.x;
    height = v125.size.height;
    width = v125.size.width;
    *(_QWORD *)&v125.origin.x = rect[1];
    v125.origin.y = v34;
    v125.size.width = v44;
    v125.size.height = v33;
    *(_QWORD *)&v136.origin.x = rect[0];
    v136.origin.y = v90;
    v136.size.width = v89;
    v136.size.height = v91;
    if (CGRectIntersectsRect(v125, v136)
      && (width != v89 ? (v46 = height == v91) : (v46 = 1),
          v46 && (height <= v84 * 5.0 ? (v47 = width > v83 * 5.0) : (v47 = 1), !v47)))
    {
      v48 = qword_1ECD7F8D8;
      if (!qword_1ECD7F8D8)
      {
        v48 = __UILogCategoryGetNode("UICollectionViewAttrMap", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v48, (unint64_t *)&qword_1ECD7F8D8);
      }
      if ((*(_BYTE *)v48 & 1) != 0)
      {
        v78 = *(id *)(v48 + 8);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v130.origin.x = a2;
          v130.origin.y = a3;
          v130.size.width = a4;
          v130.size.height = a5;
          NSStringFromCGRect(v130);
          v79 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v131.origin.x = rect[1];
          v131.size.height = v33;
          v131.origin.y = v34;
          v131.size.width = v44;
          NSStringFromCGRect(v131);
          v80 = (id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v132.origin.x = rect[0];
          v132.size.width = v89;
          v132.origin.y = v90;
          v132.size.height = v91;
          NSStringFromCGRect(v132);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v133.origin.y = v86;
          v133.origin.x = x;
          v133.size.height = height;
          v133.size.width = width;
          NSStringFromCGRect(v133);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = a1;
          v103 = 2112;
          v104 = v79;
          v105 = 2112;
          v106 = v80;
          v107 = 2112;
          v108 = v81;
          v109 = 2112;
          v110 = v82;
          _os_log_impl(&dword_185066000, v78, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; for query: %@, fault rect (%@) intersects with valid rect (%@). Using union (%@)",
            buf,
            0x34u);

        }
        v45 = v34;
      }
      if (dyld_program_sdk_at_least())
      {
        *(_QWORD *)&v49.f64[0] = rect[1];
        v50.f64[0] = v44;
        -[_UICollectionViewRTree removeAttributesWithFramesIntersectingFrame:](*(_QWORD *)(a1 + 8), v49, v45, v50, v33);
      }
    }
    else
    {
      v51 = qword_1ECD7F8E0;
      if (!qword_1ECD7F8E0)
      {
        v51 = __UILogCategoryGetNode("UICollectionViewAttrMap", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v51, (unint64_t *)&qword_1ECD7F8E0);
      }
      if ((*(_BYTE *)v51 & 1) != 0)
      {
        v74 = *(id *)(v51 + 8);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v127.origin.x = a2;
          v127.origin.y = a3;
          v127.size.width = a4;
          v127.size.height = a5;
          NSStringFromCGRect(v127);
          v75 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v128.origin.x = rect[0];
          v128.size.width = v89;
          v128.origin.y = v90;
          v128.size.height = v91;
          NSStringFromCGRect(v128);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v129.origin.x = rect[1];
          v129.size.height = v33;
          v129.origin.y = v34;
          v129.size.width = v44;
          NSStringFromCGRect(v129);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)&buf[4] = a1;
          v103 = 2112;
          v104 = v75;
          v105 = 2112;
          v106 = v76;
          v107 = 2112;
          v108 = v77;
          _os_log_impl(&dword_185066000, v74, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; Reinitialising rTree for query: %@; currentValidLayoutRect: %@; fault rect: %@.",
            buf,
            0x2Au);

          v45 = v34;
        }

      }
      v52 = objc_alloc_init(_UICollectionViewRTree);
      v53 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v52;

      v86 = v45;
      x = *(double *)&rect[1];
      height = v33;
      width = v44;
    }
    *(CGFloat *)(a1 + 48) = x;
    *(CGFloat *)(a1 + 56) = v86;
    *(double *)(a1 + 64) = width;
    *(double *)(a1 + 72) = height;
    -[UICollectionViewData _layoutAttributesForElementsInRectForMapping:](v15, *(double *)&rect[1], v45, v44, v33);
    v98 = 0u;
    v99 = 0u;
    *(_OWORD *)&rect[3] = 0u;
    v97 = 0u;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v54 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &rect[3], v101, 16);
    if (!v54)
    {
LABEL_84:

      LOBYTE(v15[12].isa) &= ~1u;
LABEL_85:

      WeakRetained = v85;
      goto LABEL_86;
    }
    v55 = *(_QWORD *)v97;
LABEL_53:
    v56 = 0;
    while (1)
    {
      if (*(_QWORD *)v97 != v55)
        objc_enumerationMutation(v41);
      v57 = *(_WORD **)(rect[4] + 8 * v56);
      if (v57 && (v58 = v57[144], (v58 & 8) != 0))
      {
        v62 = 32;
        if ((v58 & 3) == 0)
          v62 = 24;
        if ((v58 & 1) != 0)
          v63 = 16;
        else
          v63 = v62;
        v64 = *(void **)(a1 + v63);
        if (!v64)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(rect[4] + 8 * v56));
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = *(NSObject **)(a1 + v63);
          *(_QWORD *)(a1 + v63) = v68;
LABEL_81:

          goto LABEL_82;
        }
        objc_msgSend(v64, "addObject:", *(_QWORD *)(rect[4] + 8 * v56));
      }
      else
      {
        v59 = -[UICollectionViewLayoutAttributes __indexPath](*(_QWORD **)(rect[4] + 8 * v56));
        v60 = v59;
        if (v57 && (v57[144] & 1) != 0)
        {
          if (!-[UICollectionViewData _isIndexPathValid:validateItemCounts:]((uint64_t)v15, v59, 0))
          {
            v70 = qword_1ECD7F8E8;
            if (!qword_1ECD7F8E8)
            {
              v70 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v70, (unint64_t *)&qword_1ECD7F8E8);
            }
            v69 = *(id *)(v70 + 8);
            if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              goto LABEL_81;
LABEL_80:
            v72 = v15[2].isa;
            -[UICollectionViewData dataSourceCountsDescription](v15);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v57;
            v103 = 2112;
            v104 = v72;
            v105 = 2112;
            v106 = v73;
            _os_log_impl(&dword_185066000, v69, OS_LOG_TYPE_ERROR, "Received layout attributes with an invalid index path. Attributes will be ignored. Attributes: %@; layout:"
              " %@; data source counts: %@",
              buf,
              0x20u);

            goto LABEL_81;
          }
          *(_QWORD *)buf = 0;
          v100 = 0;
          objc_msgSend(v60, "ui_getSectionIndex:itemIndex:", buf, &v100);
          v65 = -[UICollectionViewData numberOfItemsBeforeSection:]((uint64_t)v15, *(uint64_t *)buf);
          v66 = v100 + v65;
          -[_UICollectionViewDataAttributesMap _setItemAttributes:forGlobalItemIndex:](a1, v57, v100 + v65);
          -[UICollectionViewData _attributesMapDidPageInAttributes:globalItemIndex:]((uint64_t)v15, v57, v66, v67);
        }
        else
        {
          if (objc_msgSend(v59, "section") >= (v15[14].isa - v15[13].isa) >> 3
            && objc_msgSend(v60, "item") != 0x7FFFFFFFFFFFFFFFLL)
          {
            v71 = qword_1ECD7F8F0;
            if (!qword_1ECD7F8F0)
            {
              v71 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v71, (unint64_t *)&qword_1ECD7F8F0);
            }
            v69 = *(id *)(v71 + 8);
            if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              goto LABEL_81;
            goto LABEL_80;
          }
          -[UICollectionViewData _attributesMapDidPageInAttributes:globalItemIndex:]((uint64_t)v15, v57, 0x7FFFFFFFFFFFFFFFuLL, v61);
        }
      }
LABEL_82:
      if (v54 == ++v56)
      {
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &rect[3], v101, 16);
        if (!v54)
          goto LABEL_84;
        goto LABEL_53;
      }
    }
  }
  v14 = _MergedGlobals_1192;
  if (!_MergedGlobals_1192)
  {
    v14 = __UILogCategoryGetNode("UICollectionViewAttrMap", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&_MergedGlobals_1192);
  }
  if ((*(_BYTE *)v14 & 1) != 0)
  {
    v15 = *(id *)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v113.origin.x = a2;
      v113.origin.y = a3;
      v113.size.width = a4;
      v113.size.height = a5;
      NSStringFromCGRect(v113);
      v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v114.origin.x = v10;
      v114.origin.y = v11;
      v114.size.width = v13;
      v114.size.height = v12;
      NSStringFromCGRect(v114);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = a1;
      v103 = 2112;
      v104 = v16;
      v105 = 2112;
      v106 = v17;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; returning early because query rect is within valid rect. query: %@. validRect: %@",
        buf,
        0x20u);

    }
    goto LABEL_87;
  }
}

- (_QWORD)initWithCollectionViewData:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  _UICollectionViewRTree *v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UICollectionViewDataAttributesMap;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[5] = a2;
    v5 = objc_alloc_init(_UICollectionViewRTree);
    v6 = (void *)v4[1];
    v4[1] = v5;

  }
  return v4;
}

- (_QWORD)indexesOfItemsInRect:(CGFloat)a3
{
  _QWORD *v5;
  void *v7;
  uint64_t v8;
  __n128 v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  _QWORD *v23;
  uint64_t *v24;
  unint64_t v25;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  float64x2_t v42[2];
  char v43;
  CGRect v44;
  CGRect v45;

  v5 = a1;
  if (a1)
  {
    if (CGRectIsNull(*(CGRect *)&a2))
      goto LABEL_5;
    v44.origin.x = a2;
    v44.size.width = a4;
    v44.origin.y = a3;
    v44.size.height = a5;
    if (CGRectIsEmpty(v44)
      || (v45.origin.x = a2, v45.size.width = a4, v45.origin.y = a3, v45.size.height = a5, CGRectIsInfinite(v45)))
    {
LABEL_5:
      +[_UIFastIndexSet indexSet](_UIFastIndexSet, "indexSet", *(_QWORD *)&a3);
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_UIMutableFastIndexSet indexSet](_UIMutableFastIndexSet, "indexSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0x7FFFFFFFFFFFFFFFLL;
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0x7FFFFFFFFFFFFFFFLL;
      v8 = v5[1];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __59___UICollectionViewDataAttributesMap_indexesOfItemsInRect___block_invoke;
      v30[3] = &unk_1E16DE9D8;
      v32 = &v34;
      v33 = &v38;
      v5 = v7;
      v31 = v5;
      if (v8)
      {
        v11.f64[0] = a2;
        v10.f64[0] = a4;
        v11.f64[1] = a3;
        v43 = 0;
        v10.f64[1] = a5;
        v12 = vaddq_f64(v11, vminnmq_f64(v10, (float64x2_t)0));
        __asm { FMOV            V2.2D, #6.0 }
        v18 = vmulq_f64(v12, _Q2);
        v19 = vmulq_f64(vabsq_f64(v10), _Q2);
        v20 = vrndaq_f64(v18);
        v21 = vrndaq_f64(v19);
        v22 = (float64x2_t)vdupq_n_s64(0x3F43A92A30553262uLL);
        v23 = *(_QWORD **)(v8 + 8);
        v42[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v22, vabdq_f64(v18, v20)), (int8x16_t)v20, (int8x16_t)v18);
        v42[1] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v22, vabdq_f64(v19, v21)), (int8x16_t)v21, (int8x16_t)v19);
        _UIRTreeContainerNode<_UICollectionViewRTreeElement>::enumerateElementsIntersectingWithConstRef(v23, v42, &v43, (uint64_t)v30);
        v24 = v39;
      }
      else
      {
        v24 = &v38;
      }
      v25 = v24[3];
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        -[_UIMutableFastIndexSet addIndexesInRange:]((uint64_t)v5, v25, v35[3] - v25, v9);

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedDecorationAttributes, 0);
  objc_storeStrong((id *)&self->_clonedSupplementaryAttributes, 0);
  objc_storeStrong((id *)&self->_clonedCellAttributes, 0);
  objc_storeStrong((id *)&self->_rTree, 0);
}

@end
