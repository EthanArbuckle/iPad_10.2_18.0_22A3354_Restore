@implementation UIContextMenuCollectionViewLayout

_UIContextMenuLayoutSection *___UIContextMenuCollectionViewLayout_block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _UIContextMenuLayoutSection *v63;
  void *v64;
  _UIContextMenuLayoutSection *v65;
  void *v66;
  _UIContextMenuLayoutSection *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  unint64_t v76;
  _UNKNOWN **v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  unint64_t v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  uint64_t v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  const __CFString *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  NSObject *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  unint64_t v130;
  uint8_t buf[16];
  void *v132;
  void *v133;
  void *v134;
  _QWORD v135[3];

  v135[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "cellSizeGivenTraits:", v8);

  v10 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", v7);
  v11 = &off_1E1679000;
  v12 = 0x1E0C99000uLL;
  v130 = a2;
  if (objc_msgSend(v7, "layout") != 1)
  {
    v125 = v7;
    v29 = 3;
    if (v9 != 1)
      v29 = 0;
    if (!v9)
      v29 = 4;
    if (v10 >= v29)
      v30 = v29;
    else
      v30 = v10;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v10;
    v124 = v31;
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "container");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "effectiveContentSize");
      v34 = v33;

      v35 = 0;
      v36 = (double)(v30 >> 1);
      v37 = (double)((int)v30 - 1);
      if ((v30 & 1) == 0)
        v36 = (double)((int)v30 - 1);
      v38 = v30;
      v39 = (int)v36;
      v127 = v38;
      v40 = v34 / (double)v38;
      do
      {
        UIFloorToScale(v40, *(double *)(a1 + 64));
        if (v39 == v35)
          v42 = v34 - v41 * v37;
        else
          v42 = v41;
        _UIContextMenuSeparator(2, *(double *)(a1 + 72));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = v43;
        objc_msgSend(*(id *)(v12 + 3360), "arrayWithObjects:count:", &v134, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v11[307];
        objc_msgSend(off_1E1679980, "absoluteDimension:", v42);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E1679980, "uniformAcrossSiblingsWithEstimate:", *(double *)(a1 + 80));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "itemWithSize:decorationItems:", v48, v44);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "addObject:", v49);

        v11 = &off_1E1679000;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v35, v130);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v50);

        v12 = 0x1E0C99000;
        ++v35;
      }
      while (v127 != v35);
      objc_msgSend(off_1E1679990, "horizontalGroupWithLayoutSize:subitems:", *(_QWORD *)(a1 + 48), v129);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v126;
      v30 = v127;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v53);

      v13 = 0;
    }
    v54 = v10 - v30;
    if (v54 < 1)
    {
      v26 = 0;
    }
    else
    {
      v55 = v11[307];
      v56 = *(_QWORD *)(a1 + 48);
      _UIContextMenuSeparator(1, *(double *)(a1 + 72));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = v57;
      objc_msgSend(*(id *)(v12 + 3360), "arrayWithObjects:count:", &v133, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "itemWithSize:decorationItems:", v56, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:repeatingSubitem:count:", *(_QWORD *)(a1 + 48), v59, v54);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E16799B0, "fixedSpacing:", *(double *)(a1 + 72));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setInterItemSpacing:", v60);

    }
    v7 = v125;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v13)
    {
      objc_msgSend(v61, "addObject:", v13);
      v10 = v126;
      if (!v26)
        goto LABEL_33;
    }
    else
    {
      v10 = v126;
      if (!v26)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v123, OS_LOG_TYPE_FAULT, "Found repeated instances of the same menu element in the context menu, only one will be used. This is a client issue.", buf, 2u);
          }

          v7 = v125;
          v77 = &off_1E1679000;
        }
        else
        {
          v76 = kContextMenuSubmenuTitleHeader_block_invoke___s_category;
          v77 = &off_1E1679000;
          if (!kContextMenuSubmenuTitleHeader_block_invoke___s_category)
          {
            v76 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v76, (unint64_t *)&kContextMenuSubmenuTitleHeader_block_invoke___s_category);
          }
          v78 = *(NSObject **)(v76 + 8);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v78, OS_LOG_TYPE_ERROR, "Found repeated instances of the same menu element in the context menu, only one will be used. This is a client issue.", buf, 2u);
          }
        }
        v79 = v77[307];
        v80 = *(_QWORD *)(a1 + 48);
        _UIContextMenuSeparator(1, *(double *)(a1 + 72));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = v81;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "itemWithSize:decorationItems:", v80, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "addObject:", v83);
        v10 = v126;
        goto LABEL_33;
      }
    }
    objc_msgSend(v62, "addObject:", v26);
LABEL_33:
    v63 = [_UIContextMenuLayoutSection alloc];
    objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:subitems:", *(_QWORD *)(a1 + 48), v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v63;
    v66 = v124;
    v67 = -[_UIContextMenuLayoutSection initWithLayoutGroup:hiddenSeparatorIndexPaths:](v65, "initWithLayoutGroup:hiddenSeparatorIndexPaths:", v64, v124);

    objc_msgSend(*(id *)(a1 + 40), "sectionInsets");
    -[NSCollectionLayoutSection setContentInsets:](v67, "setContentInsets:");
    goto LABEL_50;
  }
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "paletteMinimumItemSize");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "container");
  v128 = a1;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentSize");
  v20 = v19;

  objc_msgSend(v13, "_scaledValueForValue:", v17);
  UIRoundToScale(v21, *(double *)(v128 + 64));
  v23 = v22;
  if ((objc_msgSend(*(id *)(v128 + 40), "enableFloatingFocusStyle") & 1) != 0)
  {
    objc_msgSend(off_1E1679980, "uniformAcrossSiblingsWithEstimate:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "uniformAcrossSiblingsWithEstimate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 16.0;
    v28 = 24.0;
  }
  else
  {
    if (objc_msgSend(v7, "preferredCellSize") == 2)
    {
      v28 = 16.0;
      v51 = floor((v20 + -16.0) / (v23 + 16.0));
      if (v51 >= (double)v10)
        v51 = (double)v10;
      v27 = fmax((v20 - v23 * (double)(int)v51) / (double)((int)v51 + 1), 16.0);
      v52 = v23;
    }
    else
    {
      objc_msgSend(v13, "_scaledValueForValue:", v15);
      UIRoundToScale(v68, *(double *)(v128 + 64));
      v70 = v69;
      v71 = floor(v20 / v69);
      if ((unint64_t)v10 < 4)
      {
        v75 = v20 / (double)(v10 + 1);
      }
      else
      {
        objc_msgSend(*(id *)(v128 + 40), "dynamicImageBoxWidth");
        v73 = v72 * 0.5;
        objc_msgSend(*(id *)(v128 + 40), "menuItemInternalPadding");
        v75 = (v20 - (v73 + v74 + v73 + v74)) / (double)(v10 - 1);
        if (v75 < v70)
          v75 = v70;
      }
      UIRoundToScale(v75, *(double *)(v128 + 64));
      v84 = (double)v10;
      if (v71 <= (double)v10)
        v84 = v71;
      v28 = (v20 - v84 * v52) * 0.5;
      v27 = 0.0;
    }
    objc_msgSend(off_1E1679980, "estimatedDimension:", v52);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "estimatedDimension:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(off_1E1679998, "itemWithLayoutSize:", v26);
  v85 = objc_claimAutoreleasedReturnValue();
  v135[0] = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:subitems:", v26, v86);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E16799A0, "sectionWithGroup:", v62);
  v67 = (_UIContextMenuLayoutSection *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSection setOrthogonalScrollingBehavior:](v67, "setOrthogonalScrollingBehavior:", 1);
  -[NSCollectionLayoutSection setContentInsets:](v67, "setContentInsets:", 0.0, v28, 0.0, v28);
  a1 = v128;
  objc_msgSend(*(id *)(v128 + 40), "gradientMaskingConfiguration");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSection _setClipsContentToBounds:](v67, "_setClipsContentToBounds:", v87 != 0);

  v66 = (void *)v85;
  -[NSCollectionLayoutSection setSupplementaryContentInsetsReference:](v67, "setSupplementaryContentInsetsReference:", 1);
  -[NSCollectionLayoutSection setInterGroupSpacing:](v67, "setInterGroupSpacing:", v27);
LABEL_50:

  if (v10 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isRoot") & 1) == 0)
    {
      objc_msgSend(v7, "title");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v89, "length");

      if (v90)
      {
        objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", *(_QWORD *)(a1 + 48), CFSTR("kContextMenuHeader"), 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addObject:", v91);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "count") - 1;

    if (v93 > v130)
    {
      v94 = a1;
      v95 = v5;
      v96 = v7;
      if (objc_msgSend(v7, "wantsSectionSeparator")
        && (objc_msgSend(*(id *)(v94 + 32), "sectionIdentifiers"),
            v97 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v97, "objectAtIndexedSubscript:", v130 + 1),
            v98 = (void *)objc_claimAutoreleasedReturnValue(),
            v99 = objc_msgSend(v98, "wantsSectionSeparator"),
            v98,
            v97,
            v99))
      {
        objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v94;
        _UIContextMenuGetPlatformMetrics(objc_msgSend(*(id *)(v94 + 56), "userInterfaceIdiom"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "sectionSeparatorHeight");
        v104 = v103;

        objc_msgSend(off_1E1679980, "absoluteDimension:", v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v100, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v101 + 40), "gradientMaskingConfiguration");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "backgroundMasksCorners");

        if (v108)
          v109 = CFSTR("kContextMenuGradientMaskSectionSeparator");
        else
          v109 = CFSTR("kContextMenuSectionSeparator");
        objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v106, v109, 5);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        _UIContextMenuGetPlatformMetrics(objc_msgSend(*(id *)(v101 + 56), "userInterfaceIdiom"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "sectionSeparatorInsets");
        v113 = v112;
        v115 = v114;
        v117 = v116;
        v119 = v118;

        objc_msgSend(v110, "setContentInsets:", v113, v115, v117, v119);
        if (v108)
          objc_msgSend(v110, "setZIndex:", -1);
      }
      else
      {
        objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E1679980, "absoluteDimension:", *(double *)(v94 + 72));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v120, v121);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v106, CFSTR("kContextMenuThinSectionSeparator"), 5);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v5 = v95;

      objc_msgSend(v88, "addObject:", v110);
      v7 = v96;
    }
    -[NSCollectionLayoutSection setBoundarySupplementaryItems:](v67, "setBoundarySupplementaryItems:", v88);

  }
  return v67;
}

@end
