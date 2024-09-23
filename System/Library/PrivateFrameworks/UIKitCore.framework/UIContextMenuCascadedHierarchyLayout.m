@implementation UIContextMenuCascadedHierarchyLayout

void __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  const char *v37;
  int IsAccessibilityContentSizeCategory;
  double Width;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  int v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double Height;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  CGFloat v102;
  double v103;
  int v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  double v117;
  id v118;
  void (**v119)(_QWORD);
  id v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  int v125;
  double v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  double v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  double MinY;
  void *v143;
  double v144;
  CGFloat v145;
  void *rect;
  CGFloat recta;
  CGAffineTransform v148;
  CGAffineTransform v149;
  _QWORD aBlock[4];
  id v151;
  double v152;
  double v153;
  double v154;
  double v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_submenuOffsetForCascadingLeft:", objc_msgSend(v3, "leftOfParentWhenCascading"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "nativeContentSize");
  if (*(_BYTE *)(a1 + 72))
  {
    rect = v5;
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v3, "menu");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v143, "metadata");
    objc_msgSend(v3, "menu");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v140, "metadata");
    objc_msgSend(v3, "menu");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v138, "metadata");
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");
    v21 = v15;
    _UIContextMenuGetPlatformMetrics(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultMenuWidth");
    v24 = v23;
    v25 = objc_msgSend(v22, "leadingIndentationContributesToWidth");
    v26 = 0.0;
    v27 = 0.0;
    if ((v16 & 0x100) != 0 && v25)
    {
      _UIContextMenuGetPlatformMetrics(v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leadingIndentationWidth");
      v27 = v29;

    }
    v30 = v24 + v27;
    if ((v17 & 0x10000) != 0)
    {
      _UIContextMenuGetPlatformMetrics(v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "menuGutterWidth");
      v26 = v32;

    }
    v33 = v30 + v26;
    if ((v18 & 0x100000000) != 0)
    {
      objc_msgSend(v22, "largePaletteWidthExtension");
      v33 = v33 + v34;
    }
    if (v21)
    {
      objc_msgSend(v21, "traitCollection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "preferredContentSizeCategory");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v36, v37);

      if (IsAccessibilityContentSizeCategory)
      {
        objc_msgSend(v21, "bounds");
        Width = CGRectGetWidth(v156);
        v40 = _UIContextMenuDefaultContentSpacing(v21);
        v41 = Width - (v40 + v40);
        objc_msgSend(v21, "traitCollection");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "userInterfaceIdiom");

        if (v43)
        {
          v33 = 343.0;
        }
        else
        {
          objc_msgSend(v21, "_screen");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_referenceBounds");
          v46 = CGRectGetWidth(v157);
          v47 = _UIContextMenuDefaultContentSpacing(v21);
          v33 = v46 - (v47 + v47);

        }
        if (v41 < v33)
          v33 = v41;
      }
    }

    v48 = *(double *)(a1 + 56);
    if (v48 >= v33)
      v48 = v33;
    objc_msgSend(v6, "preferredContentSizeWithinContainerSize:", v48, *(double *)(a1 + 64));
    v50 = v49;
    v52 = v51;
    v5 = rect;
    objc_msgSend(rect, "menuMaximumHeight");
    if (v52 >= v53)
      v44 = v53;
    else
      v44 = v52;
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v54 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v125 = _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled)
      {
        while (v54 >= v125)
        {
          _UIInternalPreferenceSync(v54, &_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled, (uint64_t)CFSTR("ContextMenuScrollTruncationDetentsEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v125 = _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled;
          if (v54 == _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled)
            goto LABEL_67;
        }
        if (byte_1EDDA7D5C)
        {
          objc_msgSend(v6, "closestScrollTruncationDetentToHeight:", v44);
          v44 = v126;
        }
LABEL_67:
        v5 = rect;
      }
    }
    v144 = v50;
    objc_msgSend(v6, "setNativeContentSize:", v50, v44);
  }
  else
  {
    v44 = v14;
    v144 = v13;
  }
  objc_msgSend(v6, "center");
  objc_msgSend(v6, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "anchorPoint");
  v57 = v56;
  v141 = v58;

  objc_msgSend(*(id *)(a1 + 32), "_rectOfNodeParentElement:", v3);
  recta = v62;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v63 = v59;
    v64 = v60;
    v65 = v61;
    v134 = v10;
    v135 = v12;
    objc_msgSend(*(id *)(a1 + 40), "_cascadingAreaBounds");
    v70 = v68;
    v132 = v67;
    v133 = v69;
    v131 = v66;
    if (*(_BYTE *)(a1 + 72))
    {
      v71 = v69;
      v130 = v8;
      v72 = v66;
      v127 = v65;
      v73 = v64;
      v74 = v63;
      v75 = v67;
      MinY = CGRectGetMinY(*(CGRect *)&v66);
      v158.origin.x = v72;
      v158.origin.y = v75;
      v158.size.width = v70;
      v158.size.height = v71;
      v76 = v70;
      v77 = CGRectGetMaxY(v158) - v44;
      v128 = v74;
      v159.origin.x = v74;
      v64 = v73;
      v65 = v127;
      v159.origin.y = v64;
      v159.size.width = recta;
      v159.size.height = v127;
      v78 = fmax(MinY, fmin(v77, CGRectGetMinY(v159)));
      v160.origin.x = v72;
      v79 = v78;
      v160.origin.y = v75;
      v129 = v76;
      v160.size.width = v76;
      v160.size.height = v71;
      v80 = CGRectGetMaxY(v160) - v79;
      if (v44 >= v80)
        v81 = v80;
      else
        v81 = v44;
      if (objc_msgSend(v3, "leftOfParentWhenCascading"))
      {
        v161.origin.x = 0.0;
        v161.origin.y = 0.0;
        v82 = v144;
        v161.size.width = v144;
        v161.size.height = v81;
        v83 = v130 + CGRectGetWidth(v161);
      }
      else
      {
        v83 = -v130;
        v82 = v144;
      }
      v165.origin.x = 0.0;
      v165.origin.y = 0.0;
      v165.size.width = v82;
      v165.size.height = v81;
      v139 = v83 / CGRectGetWidth(v165);
      v63 = v128;
      v166.origin.x = v128;
      v166.origin.y = v64;
      v166.size.width = recta;
      v166.size.height = v127;
      v102 = CGRectGetMidY(v166) - v79;
      v167.origin.x = 0.0;
      v167.origin.y = 0.0;
      v145 = v82;
      v167.size.width = v82;
      v167.size.height = v81;
      v136 = 0.0;
      v137 = 0.0;
      v141 = v102 / CGRectGetHeight(v167);
      v70 = v129;
      v8 = v130;
      v97 = v81;
    }
    else
    {
      v139 = v57;
      objc_msgSend(v6, "bounds");
      v136 = v98;
      v137 = v99;
      v145 = v100;
      v97 = v101;
    }
    objc_msgSend(v6, "bounds");
    v103 = CGRectGetWidth(v168);
    v104 = objc_msgSend(v3, "leftOfParentWhenCascading");
    v105 = v63;
    v106 = v64;
    v107 = recta;
    v108 = v65;
    if (v104)
      v109 = CGRectGetMinX(*(CGRect *)&v105) - v8;
    else
      v109 = v8 + CGRectGetMaxX(*(CGRect *)&v105);
    if (objc_msgSend(v3, "leftOfParentWhenCascading"))
    {
      v169.origin.x = v131;
      v169.origin.y = v132;
      v169.size.width = v70;
      v169.size.height = v133;
      v110 = v103 + CGRectGetMinX(v169);
      if (v109 >= v110)
        v94 = v109;
      else
        v94 = v110;
    }
    else
    {
      v170.origin.x = v131;
      v170.origin.y = v132;
      v170.size.width = v70;
      v170.size.height = v133;
      v111 = CGRectGetMaxX(v170) - v103;
      if (v109 >= v111)
        v94 = v111;
      else
        v94 = v109;
    }
    v171.origin.x = v63;
    v171.origin.y = v64;
    v171.size.width = recta;
    v171.size.height = v65;
    v96 = v135;
    v95 = v134 + CGRectGetMidY(v171);
    v88 = v141;
    v93 = v145;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "anchorPoint");
    v86 = v85;
    v88 = v87;

    objc_msgSend(v6, "nativeContentSize");
    v90 = v89;
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    Height = CGRectGetHeight(v162);
    if (v90 >= Height)
      v92 = Height;
    else
      v92 = v90;
    v93 = v144;
    v163.origin.y = 0.0;
    v137 = 0.0;
    v139 = v86;
    v163.origin.x = 0.0;
    v163.size.width = v144;
    v163.size.height = v92;
    v94 = v144 * 0.5 + 0.0 + (v86 + -0.5) * CGRectGetWidth(v163);
    v164.origin.x = 0.0;
    v164.origin.y = 0.0;
    v164.size.width = v144;
    v164.size.height = v92;
    v95 = (v88 + -0.5) * CGRectGetHeight(v164) + v92 * 0.5 + 0.0;
    v136 = 0.0;
    v96 = v12;
    v97 = v92;
  }
  objc_msgSend(*(id *)(a1 + 32), "hoveredListView");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v6 == (void *)v112)
  {

LABEL_58:
    v117 = 1.0;
    goto LABEL_59;
  }
  v113 = (void *)v112;
  objc_msgSend(*(id *)(a1 + 32), "submenus");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "nodes");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v115, "count") <= 1)
  {

    goto LABEL_58;
  }
  v116 = objc_msgSend(v5, "applySubmenuScaling");

  if (v116)
    v117 = 0.99;
  else
    v117 = 1.0;
LABEL_59:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke_2;
  aBlock[3] = &unk_1E16B20D8;
  v118 = v6;
  v151 = v118;
  v152 = v139;
  v153 = v88;
  v154 = v94;
  v155 = v95;
  v119 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(*(id *)(a1 + 40), "isAnimatingMenuAddition")
    && (objc_msgSend(*(id *)(a1 + 32), "currentListView"),
        v120 = (id)objc_claimAutoreleasedReturnValue(),
        v120,
        v118 == v120))
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v119);
  }
  else
  {
    v119[2](v119);
  }
  objc_msgSend(v118, "setBounds:", v136, v137, v93, v97);
  objc_msgSend(v118, "bounds");
  objc_msgSend(v118, "setVisibleContentSize:", v121, v122);
  CGAffineTransformMakeScale(&v149, v117, v117);
  v148 = v149;
  objc_msgSend(v118, "setTransform:", &v148);
  v123 = v96 * (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v118, "layer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setZPosition:", v123);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchorPoint:", v2, v3);

  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (**v16)(void *, uint64_t);
  int v17;
  uint64_t v18;
  uint64_t v19;
  CGFloat x;
  CGFloat y;
  CGFloat v22;
  CGFloat height;
  double MinX;
  double v25;
  id v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  _QWORD aBlock[14];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(a1[4], "addSubview:", a1[5]);
  objc_msgSend(a1[4], "_rectOfNodeParentElement:", a1[6]);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[4], "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "bounds");
  Width = CGRectGetWidth(v30);
  objc_msgSend(a1[7], "_cascadingAreaBounds");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  aBlock[3] = &unk_1E16E0008;
  aBlock[4] = a1[7];
  *(double *)&aBlock[5] = v3;
  *(double *)&aBlock[6] = v5;
  *(double *)&aBlock[7] = v7;
  *(double *)&aBlock[8] = v9;
  *(double *)&aBlock[9] = Width;
  aBlock[10] = v12;
  aBlock[11] = v13;
  aBlock[12] = v14;
  aBlock[13] = v15;
  v16 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  v17 = v16[2](v16, 1);
  v18 = v16[2](v16, 2);
  v19 = v18;
  if (v17 && (_DWORD)v18)
  {
    v19 = objc_msgSend(a1[8], "leftOfParentWhenCascading", v18);
  }
  else if (((v18 | v17) & 1) == 0)
  {
    objc_msgSend(a1[4], "convertRect:toView:", v10, v3, v5, v7, v9);
    x = v31.origin.x;
    y = v31.origin.y;
    v22 = v31.size.width;
    height = v31.size.height;
    MinX = CGRectGetMinX(v31);
    objc_msgSend(v10, "bounds");
    v25 = CGRectGetWidth(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = v22;
    v33.size.height = height;
    v19 = MinX > v25 - CGRectGetMaxX(v33);
  }
  objc_msgSend(a1[6], "setLeftOfParentWhenCascading:", v19);
  objc_msgSend(a1[5], "setBounds:", 0.0, 0.0, Width, 44.0);
  CGAffineTransformMakeScale(&v28, 0.2, 0.2);
  v26 = a1[5];
  v27 = v28;
  objc_msgSend(v26, "setTransform:", &v27);
  objc_msgSend(a1[5], "setShadowAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);

}

BOOL __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v12;

  objc_msgSend(*(id *)(a1 + 32), "_submenuOffsetForCascadingLeft:", a2 == 2);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  if (a2 == 2)
  {
    v10 = CGRectGetMinX(*(CGRect *)&v6) - v5 - *(double *)(a1 + 72);
    return v10 > CGRectGetMinX(*(CGRect *)(a1 + 80));
  }
  else
  {
    v12 = v5 + CGRectGetMaxX(*(CGRect *)&v6) + *(double *)(a1 + 72);
    return v12 < CGRectGetMaxX(*(CGRect *)(a1 + 80));
  }
}

void __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  CAFrameRateRange v10;

  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v10.minimum;
  maximum = v10.maximum;
  preferred = v10.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4;
  v8[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 32);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

uint64_t __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setShadowAlpha:", 1.0);
}

void __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[5];
  id v9;
  id v10;
  CAFrameRateRange v11;

  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6;
  v8[3] = &unk_1E16B46D0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

uint64_t __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingMenuAddition:", 1);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingMenuAddition:", 0);
}

uint64_t __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "didCompleteMenuAppearanceAnimation");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  CAFrameRateRange v11;

  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  v8[3] = &unk_1E16B1D18;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);

}

void __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v5, 0.2, 0.2);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(v2, "setAlpha:", 0.0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 2);

}

@end
