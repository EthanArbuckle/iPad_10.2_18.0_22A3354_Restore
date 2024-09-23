@implementation _UITableViewUpdateSupport

- (void)_setupAnimationsForExistingOffscreenCells
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double MaxY;
  BOOL v27;
  double MinY;
  CGFloat v29;
  BOOL v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  uint64_t v39;
  int v40;
  char v41;
  id *v42;
  void *v43;
  void *v44;
  void *v45;
  double rect;
  void *v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v3 = WeakRetained;
    v4 = *(_QWORD *)(a1 + 88);
    v5 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a1 + 24) = v4;
    if (v4 < v5 + v4)
    {
      v47 = WeakRetained;
      do
      {
        v6 = *(_QWORD *)(a1 + 48);
        v8 = v4 >= v6;
        v7 = v4 - v6;
        v8 = !v8 || v7 >= *(_QWORD *)(a1 + 56);
        if (!v8)
          goto LABEL_28;
        v9 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v4);
        v3 = v47;
        *(_QWORD *)(a1 + 32) = v9;
        if (v9 == 0x7FFFFFFFFFFFFFFFLL || *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v9))
          goto LABEL_28;
        v10 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(a1 + 80), v9, 1);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v17 = *(_QWORD *)(a1 + 24);
        v18 = v15;
        rect = v13;
        v19 = v11;
        v20 = v10;
        if (v17 < *(_QWORD *)(a1 + 248))
        {
          v20 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(a1 + 72), v17, 1);
          v19 = v21;
          rect = v22;
          v18 = v23;
        }
        v48.origin.x = v10;
        v48.origin.y = v12;
        v48.size.width = v14;
        v48.size.height = v16;
        v24 = CGRectIntersectsRect(v48, *(CGRect *)(a1 + 160));
        v3 = v47;
        if (!v24)
        {
          v49.origin.x = v20;
          v49.origin.y = v19;
          v49.size.width = rect;
          v49.size.height = v18;
          v25 = v18;
          MaxY = CGRectGetMaxY(v49);
          v27 = MaxY < CGRectGetMinY(*(CGRect *)(a1 + 128));
          v18 = v25;
          if (!v27)
            goto LABEL_20;
          v50.origin.x = v10;
          v50.origin.y = v12;
          v50.size.width = v14;
          v50.size.height = v16;
          MinY = CGRectGetMinY(v50);
          v29 = CGRectGetMaxY(*(CGRect *)(a1 + 160));
          v3 = v47;
          v30 = MinY <= v29;
          v18 = v25;
          if (v30)
          {
LABEL_20:
            v51.origin.x = v20;
            v51.origin.y = v19;
            v51.size.width = rect;
            v51.size.height = v18;
            v31 = CGRectGetMinY(v51);
            v32 = CGRectGetMaxY(*(CGRect *)(a1 + 128));
            v3 = v47;
            if (v31 <= v32)
              goto LABEL_28;
            v52.origin.x = v10;
            v52.origin.y = v12;
            v52.size.width = v14;
            v52.size.height = v16;
            v33 = CGRectGetMaxY(v52);
            v34 = CGRectGetMinY(*(CGRect *)(a1 + 160));
            v3 = v47;
            v27 = v33 < v34;
            v18 = v25;
            if (!v27)
              goto LABEL_28;
          }
        }
        v35 = objc_msgSend(v3, "_createPreparedCellForGlobalRow:willDisplay:", *(_QWORD *)(a1 + 32), 1);
        v36 = (void *)v35;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITableViewUpdateSupport _collectionViewUpdateItems](a1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingOffscreenCells, a1, CFSTR("UITableViewSupport.m"), 2035, CFSTR("Cannot animate existing offscreen cell because it already has an animation. Updates: %@; Cell: %@"),
            v44,
            *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)));

          if (!v36)
          {
LABEL_31:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingOffscreenCells, a1, CFSTR("UITableViewSupport.m"), 2036, CFSTR("Missing offscreen cell to setup animations"));

          }
        }
        else if (!v35)
        {
          goto LABEL_31;
        }
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)), v36);
        if (*(_QWORD *)(a1 + 288) != *(_QWORD *)(a1 + 32))
        {
          objc_msgSend(v36, "setFrame:", v20, v19, rect, v18);
          v53.origin.x = v10;
          v53.origin.y = v12;
          v53.size.width = v14;
          v53.size.height = v16;
          v37 = CGRectIntersectsRect(v53, *(CGRect *)(a1 + 160));
          -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(a1 + 80), *(_QWORD *)(a1 + 32));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v47, "_wasEditingRowAtIndexPath:", v38);
          v40 = objc_msgSend(v47, "_isEditingRowAtIndexPath:", v38);
          v41 = v40;
          if ((_DWORD)v39 != v40)
            objc_msgSend(v47, "_setupCell:forEditing:atIndexPath:animated:updateSeparators:", v36, v39, v38, 0, 1);
          v42 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v36, v38, 1, 0, 0, !v37, v41, v10, v12, v14, v16, 1.0, 0.0, 1.0);
          objc_msgSend(*(id *)(a1 + 320), "addObject:", v42);
          objc_msgSend(v47, "_addContentSubview:atBack:", v36, objc_msgSend(*(id *)(a1 + 120), "containsIndex:", *(_QWORD *)(a1 + 32)) ^ 1);

        }
        v3 = v47;
LABEL_28:
        v4 = *(_QWORD *)(a1 + 24) + 1;
        *(_QWORD *)(a1 + 24) = v4;
      }
      while (v4 < *(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 88));
    }

  }
}

- (void)_setupAnimationsForExistingVisibleCells
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double MinX;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  CGRect v27;
  CGRect v28;

  if (!a1)
    return;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2)
  {
    v3 = 0;
    goto LABEL_7;
  }
  v3 = *(id *)(v2 + 184);
  if (!v3)
  {
LABEL_7:
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  v4 = objc_msgSend(WeakRetained, "_globalReorderingRow");
LABEL_8:
  *(_QWORD *)(a1 + 288) = v4;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 24) = v5;
  if (v5 < v6 + v5)
  {
    while (1)
    {
      v7 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v5);
      *(_QWORD *)(a1 + 32) = v7;
      v8 = *(_QWORD *)(a1 + 24);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && *(_QWORD *)(a1 + 288) != v8)
        break;
LABEL_18:
      v5 = v8 + 1;
      *(_QWORD *)(a1 + 24) = v8 + 1;
      if ((unint64_t)(v8 + 1) >= *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 48))
        goto LABEL_22;
    }
    objc_msgSend(WeakRetained, "_visibleCellForGlobalRow:");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITableViewUpdateSupport _collectionViewUpdateItems](a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingVisibleCells, a1, CFSTR("UITableViewSupport.m"), 735, CFSTR("Cannot animate existing visible cell because it already has an animation. Updates: %@; Cell: %@"),
        v24,
        *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)));

      if (v10)
        goto LABEL_13;
    }
    else if (v9)
    {
LABEL_13:
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)), v10);
      if (objc_msgSend(*(id *)(a1 + 120), "containsIndex:", *(_QWORD *)(a1 + 32)))
        objc_msgSend(WeakRetained, "_addContentSubview:atBack:", v10, 0);
      MinX = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(a1 + 80), *(_QWORD *)(a1 + 32), 0);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(WeakRetained, "_swipeToDeleteCell");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v18)
      {
        objc_msgSend(v10, "frame");
        MinX = CGRectGetMinX(v27);
      }
      -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(a1 + 80), *(_QWORD *)(a1 + 32));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(WeakRetained, "_isEditingRowAtIndexPath:", v19);
      v28.origin.x = MinX;
      v28.origin.y = v13;
      v28.size.width = v15;
      v28.size.height = v17;
      v21 = !CGRectIntersectsRect(v28, *(CGRect *)(a1 + 160));
      v22 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v10, v19, 1, 0, 1, v21, v20, MinX, v13, v15, v17, 1.0, 0.0, 1.0);
      objc_msgSend(*(id *)(a1 + 320), "addObject:", v22);
      objc_msgSend(v10, "setSectionLocation:animated:", -[UITableViewRowData sectionLocationForRow:inSection:](*(_QWORD *)(a1 + 80), objc_msgSend(v19, "row"), objc_msgSend(v19, "section")), 1);

      v8 = *(_QWORD *)(a1 + 24);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingVisibleCells, a1, CFSTR("UITableViewSupport.m"), 736, CFSTR("Missing visible cell to setup animations"));

    goto LABEL_13;
  }
LABEL_22:

}

- (uint64_t)initialGlobalIndexForFinalGlobalIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 356);
    v4 = *(_QWORD *)(result + 384);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldGlobalItemForNewGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newGlobalItemMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_setupAnimationsForExistingHeadersAndFooters
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
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
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  char v56;
  UIViewAnimation *v57;
  char v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  id *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
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
  double v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double MaxY;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  char v116;
  UIViewAnimation *v117;
  char v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  id *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  unint64_t v130;
  unint64_t v131;
  BOOL v132;
  BOOL v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  double v140;
  BOOL v141;
  BOOL v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  double v146;
  double v147;
  double v148;
  unint64_t v149;
  double MinY;
  double v151;
  double v152;
  unint64_t v153;
  double v154;
  double v155;
  double v156;
  double v157;
  CGFloat v158;
  double v159;
  CGFloat v160;
  CGFloat v161;
  double v162;
  double v163;
  double v164;
  double v165;
  id *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  CGFloat v171;
  id *v172;
  double v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  CGFloat v177;
  CGFloat v178;
  double v179;
  CGFloat v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  UIViewAnimation *v186;
  char v187;
  double v188;
  id *v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  CGFloat v195;
  CGFloat v196;
  id *v197;
  CGFloat v198;
  void *v199;
  void *v200;
  CGFloat v201;
  double v202;
  double v203;
  CGFloat v204;
  double v205;
  double v206;
  double v207;
  double v208;
  CGFloat rect;
  double recta;
  CGFloat rect_8;
  CGFloat rect_8a;
  double rect_16;
  CGFloat rect_16a;
  double rect_24;
  double rect_24a;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  CGFloat v231;
  id WeakRetained;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_QWORD *)(a1 + 16) = 0;
    if (*(uint64_t *)(a1 + 240) >= 1)
    {
      v2 = 0;
      v207 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v208 = *MEMORY[0x1E0C9D648];
      v205 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v206 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      while (1)
      {
        v3 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v2);
        v4 = *(_QWORD *)(a1 + 16);
        if (v3 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_41;
        v5 = v3;
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8 * v4))
          break;
LABEL_24:
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8 * v4))
        {
          objc_msgSend(WeakRetained, "_visibleFooterViewForSection:", v5);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(WeakRetained, "allowsFooterViewsToFloat");
          v72 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v5, 1);
          v74 = v73;
          v76 = v75;
          v78 = v77;
          v79 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 16), 1);
          v81 = v80;
          v83 = v82;
          v85 = v84;
          if (v71)
          {
            v249.origin.x = v72;
            v249.origin.y = v74;
            v249.size.width = v76;
            v249.size.height = v78;
            if (!CGRectIsEmpty(v249)
              || (v250.origin.x = v79,
                  v250.origin.y = v81,
                  v250.size.width = v83,
                  v250.size.height = v85,
                  !CGRectIsEmpty(v250)))
            {
              objc_msgSend(WeakRetained, "_contentInset");
              v228 = v89 + *(double *)(a1 + 136);
              v230 = *(double *)(a1 + 128) + v90;
              v224 = *(double *)(a1 + 152) - (v89 + v88);
              v226 = *(double *)(a1 + 144) - (v90 + v87);
              v91 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(_QWORD *)(a1 + 72), v5, 1, 0, v230, v228, v226, v224);
              v93 = v92;
              v95 = v94;
              v97 = v96;
              objc_msgSend(WeakRetained, "_contentInset");
              v220 = v100 + *(double *)(a1 + 168);
              v222 = *(double *)(a1 + 160) + v101;
              rect_24a = *(double *)(a1 + 184) - (v100 + v99);
              v218 = *(double *)(a1 + 176) - (v101 + v98);
              v102 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 16), 1, 0, v222, v220, v218, rect_24a);
              v104 = v103;
              v106 = v105;
              v108 = v107;
              v251.origin.x = v91;
              v251.origin.y = v93;
              v251.size.width = v95;
              v251.size.height = v97;
              v282.origin.x = v102;
              v282.origin.y = v104;
              v282.size.width = v106;
              v282.size.height = v108;
              v252 = CGRectUnion(v251, v282);
              if (CGRectIntersectsRect(v252, *(CGRect *)(a1 + 192)))
              {
                v253.origin.x = v91;
                v253.origin.y = v93;
                v253.size.width = v95;
                v253.size.height = v97;
                v283.origin.x = v102;
                v283.origin.y = v104;
                v283.size.width = v106;
                v283.size.height = v108;
                if (!CGRectEqualToRect(v253, v283))
                {
                  rect_8a = v104;
                  rect_16a = v102;
                  v254.origin.x = v102;
                  v254.origin.y = v104;
                  v254.size.width = v106;
                  v204 = v108;
                  v254.size.height = v108;
                  MaxY = CGRectGetMaxY(v254);
                  v255.origin.x = v91;
                  v255.origin.y = v93;
                  v255.size.width = v95;
                  v255.size.height = v97;
                  v110 = MaxY - CGRectGetMaxY(v255);
                  v256.origin.y = v228;
                  v256.origin.x = v230;
                  v256.size.height = v224;
                  v256.size.width = v226;
                  v111 = CGRectGetMaxY(v256);
                  v257.origin.x = v91;
                  v257.origin.y = v93;
                  v257.size.width = v95;
                  v257.size.height = v97;
                  v112 = v111 - CGRectGetMaxY(v257);
                  recta = 0.0;
                  v113 = v106;
                  if (v112 > 0.0 && v110 < 0.0)
                  {
                    v114 = rect_16a;
                    v115 = v204;
                    goto LABEL_91;
                  }
                  v114 = rect_16a;
                  v115 = v204;
                  if (v112 < 0.0 && v110 > 0.0)
                    goto LABEL_91;
                  if (v112 <= 0.0 || (v110 > 0.0 ? (v141 = v112 <= v110) : (v141 = 1), v141))
                  {
                    if (v112 >= 0.0)
                    {
                      recta = v112;
                    }
                    else
                    {
                      v142 = v110 < 0.0 && v112 < v110;
                      recta = v112;
                      if (v142)
                        goto LABEL_90;
                    }
                  }
                  else
                  {
LABEL_90:
                    recta = v110;
                  }
LABEL_91:
                  v143 = rect_8a;
                  v144 = v113;
                  v145 = v115;
                  v146 = CGRectGetMaxY(*(CGRect *)&v114);
                  v264.origin.y = v220;
                  v264.origin.x = v222;
                  v264.size.height = rect_24a;
                  v264.size.width = v218;
                  v147 = v146 - CGRectGetMaxY(v264);
                  v148 = 0.0;
                  if (v147 > 0.0 && v110 < 0.0 || v147 < 0.0 && v110 > 0.0)
                    goto LABEL_102;
                  if (v147 > 0.0 && v110 > 0.0 && v147 > v110)
                  {
LABEL_101:
                    v148 = v110;
                    goto LABEL_102;
                  }
                  if (v147 >= 0.0 || v110 >= 0.0)
                  {
                    v148 = v147;
                    if (!v70)
                      goto LABEL_103;
                  }
                  else
                  {
                    v148 = v147;
                    if (v147 < v110)
                      goto LABEL_101;
LABEL_102:
                    if (!v70)
                    {
LABEL_103:
                      if ((objc_msgSend(WeakRetained, "_delegateWantsFooterForSection:", *(_QWORD *)(a1 + 16)) & 1) != 0
                        || (v149 = objc_msgSend(WeakRetained, "style"), v70 = 0, v149 <= 0x10)
                        && ((1 << v149) & 0x10006) != 0)
                      {
                        objc_msgSend(WeakRetained, "_sectionFooterViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(_QWORD *)(a1 + 16), 0, 0, 1, v208, v207, v206, v205);
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(WeakRetained, "_addContentSubview:atBack:", v70, 0);
                      }
                    }
                  }
                  objc_msgSend(v70, "setFrame:", v91, v93, v95, v97);
                  v86 = v110;
                  if (v110 != 0.0)
                  {
                    v265.origin.y = rect_8a;
                    v265.origin.x = rect_16a;
                    v265.size.width = v113;
                    v265.size.height = v115;
                    v116 = !CGRectIntersectsRect(v265, *(CGRect *)(a1 + 160));
                    if (recta == 0.0 && v148 == 0.0)
                      goto LABEL_111;
                    v266.origin.x = v91;
                    v266.origin.y = v93;
                    v266.size.width = v95;
                    v266.size.height = v97;
                    MinY = CGRectGetMinY(v266);
                    v267.origin.y = v228;
                    v267.origin.x = v230;
                    v267.size.height = v224;
                    v267.size.width = v226;
                    v151 = MinY - CGRectGetMinY(v267);
                    v268.origin.y = rect_8a;
                    v268.origin.x = rect_16a;
                    v268.size.width = v113;
                    v268.size.height = v115;
                    v152 = CGRectGetMinY(v268);
                    v269.origin.y = v220;
                    v269.origin.x = v222;
                    v269.size.height = rect_24a;
                    v269.size.width = v218;
                    if (v151 == v152 - CGRectGetMinY(v269))
                    {
LABEL_111:
                      v117 = [UIViewAnimation alloc];
                      v118 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
                      v119 = 1.0;
                      v120 = 0.0;
                      v121 = 1.0;
                      v123 = rect_8a;
                      v122 = rect_16a;
                      v124 = v113;
                      v125 = v115;
                      goto LABEL_37;
                    }
                    v231 = v113;
                    v157 = fabs(recta / v110);
                    objc_msgSend(v70, "frame");
                    v162 = v158;
                    v163 = v160;
                    v164 = v161;
                    v165 = v159 + recta + recta / v110 * *(double *)(a1 + 224);
                    if (recta / v110 != 0.0)
                    {
                      v285.origin.x = v158;
                      v285.origin.y = v159 + recta + recta / v110 * *(double *)(a1 + 224);
                      v285.size.width = v160;
                      v285.size.height = v161;
                      if (!CGRectEqualToRect(*(CGRect *)&v158, v285))
                      {
                        v166 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v70, 0, 3, 0, 1, v116, objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell"), v162, v165, v163, v164, 1.0, 0.0, v157);
                        objc_msgSend(*(id *)(a1 + 320), "addObject:", v166);

                        v116 = 0;
                      }
                    }
                    v167 = v110;
                    v168 = fmax(fabs((v110 - v148) / v110), v157);
                    if (v157 == 1.0)
                      v169 = 1.0;
                    else
                      v169 = v168;
                    v170 = v165 + (v167 - recta - v148) / v167 * *(double *)(a1 + 224);
                    if (v157 == v169)
                    {
                      v171 = rect_16a;
                    }
                    else
                    {
                      v275.origin.x = v162;
                      v275.origin.y = v165;
                      v275.size.width = v163;
                      v275.size.height = v164;
                      v286.origin.x = v162;
                      v286.origin.y = v170;
                      v286.size.width = v163;
                      v286.size.height = v164;
                      v171 = rect_16a;
                      if (!CGRectEqualToRect(v275, v286))
                      {
                        v172 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v70, 0, 3, 3, 1, v116, objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell"), v162, v170, v163, v164, 1.0, v157, v169);
                        objc_msgSend(*(id *)(a1 + 320), "addObject:", v172);

                        v116 = 0;
                      }
                    }
                    v86 = 1.0;
                    if (v169 != 1.0)
                    {
                      v276.origin.x = v162;
                      v276.origin.y = v170;
                      v276.size.width = v163;
                      v276.size.height = v164;
                      v288.origin.x = v171;
                      v288.origin.y = rect_8a;
                      v288.size.width = v231;
                      v288.size.height = v204;
                      if (!CGRectEqualToRect(v276, v288))
                      {
                        v117 = [UIViewAnimation alloc];
                        v118 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
                        v119 = 1.0;
                        v121 = 1.0;
                        v122 = v171;
                        v123 = rect_8a;
                        v124 = v231;
                        v125 = v204;
                        v120 = v169;
LABEL_37:
                        v126 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v117->super.isa, v70, 0, 3, 0, 1, v116, v118, v122, v123, v124, v125, v119, v120, v121);
                        objc_msgSend(*(id *)(a1 + 320), "addObject:", v126);

                      }
                    }
                  }
                }
              }
            }
          }
          else
          {
            v258.origin.x = v72;
            v258.origin.y = v74;
            v258.size.width = v76;
            v258.size.height = v78;
            if (!CGRectIsEmpty(v258)
              || (v259.origin.x = v79,
                  v259.origin.y = v81,
                  v259.size.width = v83,
                  v259.size.height = v85,
                  !CGRectIsEmpty(v259)))
            {
              v260.origin.x = v72;
              v260.origin.y = v74;
              v260.size.width = v76;
              v260.size.height = v78;
              v284.origin.x = v79;
              v284.origin.y = v81;
              v284.size.width = v83;
              v284.size.height = v85;
              v261 = CGRectUnion(v260, v284);
              if (!v70)
              {
                if (!CGRectIntersectsRect(v261, *(CGRect *)(a1 + 192)))
                {
                  v70 = 0;
                  goto LABEL_38;
                }
                if ((objc_msgSend(WeakRetained, "_delegateWantsFooterForSection:", *(_QWORD *)(a1 + 16)) & 1) == 0)
                {
                  v131 = objc_msgSend(WeakRetained, "style");
                  v70 = 0;
                  if (v131 > 0x10 || ((1 << v131) & 0x10006) == 0)
                    goto LABEL_38;
                }
                objc_msgSend(WeakRetained, "_sectionFooterViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(_QWORD *)(a1 + 16), 0, 0, 1, v72, v74, v76, v78);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "_addContentSubview:atBack:", v70, 0);
                if (!v70)
                  goto LABEL_38;
              }
              v262.origin.x = v79;
              v262.origin.y = v81;
              v262.size.width = v83;
              v262.size.height = v85;
              v116 = !CGRectIntersectsRect(v262, *(CGRect *)(a1 + 160));
              v117 = [UIViewAnimation alloc];
              v118 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
              v119 = 1.0;
              v120 = 0.0;
              v121 = 1.0;
              v122 = v79;
              v123 = v81;
              v124 = v83;
              v125 = v85;
              goto LABEL_37;
            }
          }
LABEL_38:
          v127 = *(_QWORD *)(a1 + 280);
          v128 = *(_QWORD *)(a1 + 16);
          v129 = *(void **)(v127 + 8 * v128);
          if (v129)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v86);
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v200, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingHeadersAndFooters, a1, CFSTR("UITableViewSupport.m"), 2294, CFSTR("Attempt to create two animations for footer view"));

            v127 = *(_QWORD *)(a1 + 280);
            v128 = *(_QWORD *)(a1 + 16);
            v129 = *(void **)(v127 + 8 * v128);
          }
          *(_QWORD *)(v127 + 8 * v128) = v70;

          v4 = *(_QWORD *)(a1 + 16);
        }
LABEL_41:
        v2 = v4 + 1;
        *(_QWORD *)(a1 + 16) = v4 + 1;
        if (v4 + 1 >= *(_QWORD *)(a1 + 240))
          goto LABEL_167;
      }
      objc_msgSend(WeakRetained, "_visibleHeaderViewForSection:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(WeakRetained, "allowsHeaderViewsToFloat");
      v8 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v5, 1);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 16), 1);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      if (!v7)
      {
        v244.origin.x = v8;
        v244.origin.y = v10;
        v244.size.width = v12;
        v244.size.height = v14;
        if (CGRectIsEmpty(v244))
        {
          v245.origin.x = v15;
          v245.origin.y = v17;
          v245.size.width = v19;
          v245.size.height = v21;
          if (CGRectIsEmpty(v245))
            goto LABEL_21;
        }
        v246.origin.x = v8;
        v246.origin.y = v10;
        v246.size.width = v12;
        v246.size.height = v14;
        v281.origin.x = v15;
        v281.origin.y = v17;
        v281.size.width = v19;
        v281.size.height = v21;
        v247 = CGRectUnion(v246, v281);
        if (!v6)
        {
          if (!CGRectIntersectsRect(v247, *(CGRect *)(a1 + 192)))
          {
            v6 = 0;
            goto LABEL_21;
          }
          if ((objc_msgSend(WeakRetained, "_delegateWantsHeaderForSection:", *(_QWORD *)(a1 + 16)) & 1) == 0)
          {
            v130 = objc_msgSend(WeakRetained, "style");
            v6 = 0;
            if (v130 > 0x10 || ((1 << v130) & 0x10006) == 0)
              goto LABEL_21;
          }
          objc_msgSend(WeakRetained, "_sectionHeaderViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(_QWORD *)(a1 + 16), 0, 0, 1, v8, v10, v12, v14);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_addContentSubview:atBack:", v6, 0);
          if (!v6)
            goto LABEL_21;
        }
        v248.origin.x = v15;
        v248.origin.y = v17;
        v248.size.width = v19;
        v248.size.height = v21;
        v56 = !CGRectIntersectsRect(v248, *(CGRect *)(a1 + 160));
        v57 = [UIViewAnimation alloc];
        v58 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
        v59 = 1.0;
        v60 = 0.0;
        v61 = 1.0;
        v62 = v15;
        v63 = v17;
        v64 = v19;
        v65 = v21;
LABEL_20:
        v66 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v57->super.isa, v6, 0, 2, 0, 1, v56, v58, v62, v63, v64, v65, v59, v60, v61);
        objc_msgSend(*(id *)(a1 + 320), "addObject:", v66);

LABEL_21:
        v67 = *(_QWORD *)(a1 + 272);
        v68 = *(_QWORD *)(a1 + 16);
        v69 = *(void **)(v67 + 8 * v68);
        if (v69)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v22);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingHeadersAndFooters, a1, CFSTR("UITableViewSupport.m"), 2185, CFSTR("Attempt to create two animations for header view"));

          v67 = *(_QWORD *)(a1 + 272);
          v68 = *(_QWORD *)(a1 + 16);
          v69 = *(void **)(v67 + 8 * v68);
        }
        *(_QWORD *)(v67 + 8 * v68) = v6;

        v4 = *(_QWORD *)(a1 + 16);
        goto LABEL_24;
      }
      v233.origin.x = v8;
      v233.origin.y = v10;
      v233.size.width = v12;
      v233.size.height = v14;
      if (CGRectIsEmpty(v233))
      {
        v234.origin.x = v15;
        v234.origin.y = v17;
        v234.size.width = v19;
        v234.size.height = v21;
        if (CGRectIsEmpty(v234))
          goto LABEL_21;
      }
      objc_msgSend(WeakRetained, "_contentInset");
      v227 = v25 + *(double *)(a1 + 136);
      v229 = *(double *)(a1 + 128) + v26;
      v223 = *(double *)(a1 + 152) - (v25 + v24);
      v225 = *(double *)(a1 + 144) - (v26 + v23);
      v27 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(_QWORD *)(a1 + 72), v5, 1, 0, v229, v227, v225, v223);
      v29 = v28;
      v31 = v30;
      v33 = v32;
      objc_msgSend(WeakRetained, "_contentInset");
      v219 = v36 + *(double *)(a1 + 168);
      v221 = *(double *)(a1 + 160) + v37;
      rect_24 = *(double *)(a1 + 184) - (v36 + v35);
      v217 = *(double *)(a1 + 176) - (v37 + v34);
      v38 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 16), 1, 0, v221, v219, v217, rect_24);
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v235.origin.x = v27;
      v235.origin.y = v29;
      v235.size.width = v31;
      v235.size.height = v33;
      v279.origin.x = v38;
      v279.origin.y = v40;
      v279.size.width = v42;
      v279.size.height = v44;
      v236 = CGRectUnion(v235, v279);
      if (!CGRectIntersectsRect(v236, *(CGRect *)(a1 + 192)))
        goto LABEL_21;
      v237.origin.x = v27;
      v237.origin.y = v29;
      v237.size.width = v31;
      v237.size.height = v33;
      v280.origin.x = v38;
      v280.origin.y = v40;
      v280.size.width = v42;
      v280.size.height = v44;
      if (CGRectEqualToRect(v237, v280))
        goto LABEL_21;
      v238.origin.x = v38;
      v238.origin.y = v40;
      v238.size.width = v42;
      v238.size.height = v44;
      rect_8 = v44;
      v45 = v42;
      v46 = v40;
      v47 = v38;
      v48 = CGRectGetMinY(v238);
      v239.origin.x = v27;
      v239.origin.y = v29;
      v239.size.width = v31;
      v239.size.height = v33;
      v49 = v48 - CGRectGetMinY(v239);
      if (v49 == 0.0)
      {
        v240.origin.x = v47;
        v240.origin.y = v46;
        v240.size.width = v45;
        v240.size.height = rect_8;
        v50 = CGRectGetMinY(v240);
        v241.origin.x = v27;
        v241.origin.y = v29;
        v241.size.width = v31;
        v241.size.height = v33;
        v49 = v50 - CGRectGetMinY(v241);
      }
      rect_16 = v49;
      v201 = v45;
      v202 = v46;
      rect = v47;
      v242.origin.y = v227;
      v242.origin.x = v229;
      v242.size.height = v223;
      v242.size.width = v225;
      v51 = CGRectGetMinY(v242);
      v243.origin.x = v27;
      v243.origin.y = v29;
      v243.size.width = v31;
      v243.size.height = v33;
      v52 = v51 - CGRectGetMinY(v243);
      v203 = 0.0;
      if (v52 > 0.0 && rect_16 < 0.0)
      {
        v53 = v47;
        v55 = v45;
        v54 = v202;
        goto LABEL_72;
      }
      v53 = v47;
      v55 = v45;
      v54 = v202;
      if (v52 < 0.0 && rect_16 > 0.0)
        goto LABEL_72;
      if (v52 <= 0.0 || (rect_16 > 0.0 ? (v132 = v52 <= rect_16) : (v132 = 1), v132))
      {
        if (v52 >= 0.0)
        {
          v203 = v52;
LABEL_72:
          v134 = v54;
          v135 = v55;
          v136 = rect_8;
          v137 = CGRectGetMinY(*(CGRect *)&v53);
          v263.origin.y = v219;
          v263.origin.x = v221;
          v263.size.height = rect_24;
          v263.size.width = v217;
          v138 = v137 - CGRectGetMinY(v263);
          v139 = 0.0;
          if (v138 > 0.0 && rect_16 < 0.0)
          {
            v140 = v27;
            if (v6)
              goto LABEL_127;
            goto LABEL_122;
          }
          v140 = v27;
          if (v138 >= 0.0 || rect_16 <= 0.0)
          {
            if (v138 > 0.0 && rect_16 > 0.0 && v138 > rect_16)
              goto LABEL_120;
            if (v138 >= 0.0 || rect_16 >= 0.0)
            {
              v139 = v138;
              if (v6)
              {
LABEL_127:
                objc_msgSend(v6, "setFrame:", v140, v29, v31, v33);
                v22 = rect_16;
                if (rect_16 == 0.0)
                  goto LABEL_21;
                v270.origin.x = rect;
                v270.size.height = rect_8;
                v270.origin.y = v54;
                v270.size.width = v55;
                v56 = !CGRectIntersectsRect(v270, *(CGRect *)(a1 + 160));
                if (v203 == 0.0 && v139 == 0.0)
                  goto LABEL_131;
                v271.origin.x = v27;
                v271.origin.y = v29;
                v271.size.width = v31;
                v271.size.height = v33;
                v154 = CGRectGetMinY(v271);
                v272.origin.y = v227;
                v272.origin.x = v229;
                v272.size.height = v223;
                v272.size.width = v225;
                v155 = v154 - CGRectGetMinY(v272);
                v273.origin.x = rect;
                v273.size.height = rect_8;
                v273.origin.y = v54;
                v273.size.width = v55;
                v156 = CGRectGetMinY(v273);
                v274.origin.y = v219;
                v274.origin.x = v221;
                v274.size.height = rect_24;
                v274.size.width = v217;
                if (v155 == v156 - CGRectGetMinY(v274))
                {
LABEL_131:
                  v57 = [UIViewAnimation alloc];
                  v58 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
                  v59 = 1.0;
                  v60 = 0.0;
                  v61 = 1.0;
                  v62 = rect;
                  v65 = rect_8;
                  v63 = v54;
                  v64 = v55;
                  goto LABEL_20;
                }
                v173 = fabs(v203 / rect_16);
                objc_msgSend(v6, "frame");
                v178 = v174;
                v179 = v176;
                v180 = v177;
                v181 = v175 + v203 + v203 / rect_16 * *(double *)(a1 + 224);
                if (v203 / rect_16 == 0.0)
                {
                  v183 = v177;
                }
                else
                {
                  v287.origin.x = v174;
                  v287.origin.y = v175 + v203 + v203 / rect_16 * *(double *)(a1 + 224);
                  v287.size.width = v176;
                  v287.size.height = v177;
                  v182 = v177;
                  if (!CGRectEqualToRect(*(CGRect *)&v174, v287))
                  {
                    v186 = [UIViewAnimation alloc];
                    v187 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
                    v184 = v178;
                    v188 = v178;
                    v185 = v179;
                    v183 = v182;
                    v189 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v186->super.isa, v6, 0, 2, 0, 1, v56, v187, v188, v181, v179, v182, 1.0, 0.0, v173);
                    objc_msgSend(*(id *)(a1 + 320), "addObject:", v189);

                    v56 = 0;
                    goto LABEL_151;
                  }
                  v183 = v180;
                }
                v184 = v178;
                v185 = v179;
LABEL_151:
                v190 = 1.0;
                v191 = fmax(fabs((rect_16 - v139) / rect_16), v173);
                if (v173 != 1.0)
                  v190 = v191;
                v192 = v190;
                v193 = v181 + (rect_16 - v203 - v139) / rect_16 * *(double *)(a1 + 224);
                if (v173 == v190)
                {
                  v196 = rect;
                  v198 = v202;
                  v194 = v185;
                  v195 = v184;
                }
                else
                {
                  v277.origin.x = v184;
                  v277.origin.y = v181;
                  v194 = v185;
                  v195 = v184;
                  v277.size.width = v194;
                  v277.size.height = v183;
                  v289.origin.x = v184;
                  v289.origin.y = v193;
                  v289.size.width = v194;
                  v289.size.height = v183;
                  v196 = rect;
                  if (!CGRectEqualToRect(v277, v289))
                  {
                    v197 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v6, 0, 2, 3, 1, v56, objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell"), v184, v193, v194, v183, 1.0, v173, v192);
                    objc_msgSend(*(id *)(a1 + 320), "addObject:", v197);

                    v56 = 0;
                  }
                  v198 = v202;
                }
                v22 = 1.0;
                if (v192 == 1.0)
                  goto LABEL_21;
                v278.origin.x = v195;
                v278.origin.y = v193;
                v278.size.width = v194;
                v278.size.height = v183;
                v290.origin.x = v196;
                v290.origin.y = v198;
                v290.size.width = v201;
                v290.size.height = rect_8;
                if (CGRectEqualToRect(v278, v290))
                  goto LABEL_21;
                v57 = [UIViewAnimation alloc];
                v58 = objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell");
                v59 = 1.0;
                v61 = 1.0;
                v62 = v196;
                v63 = v198;
                v64 = v201;
                v65 = rect_8;
                v60 = v192;
                goto LABEL_20;
              }
LABEL_122:
              if ((objc_msgSend(WeakRetained, "_delegateWantsHeaderForSection:", *(_QWORD *)(a1 + 16), v140, rect_16) & 1) == 0)
              {
                v153 = objc_msgSend(WeakRetained, "style");
                v6 = 0;
                if (v153 > 0x10)
                {
LABEL_126:
                  v140 = v27;
                  goto LABEL_127;
                }
                v140 = v27;
                if (((1 << v153) & 0x10006) == 0)
                  goto LABEL_127;
              }
              objc_msgSend(WeakRetained, "_sectionHeaderViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(_QWORD *)(a1 + 16), 0, 0, 1, v208, v207, v206, v205);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "_addContentSubview:atBack:", v6, 0);
              goto LABEL_126;
            }
            v139 = v138;
            if (v138 < rect_16)
LABEL_120:
              v139 = rect_16;
          }
          if (v6)
            goto LABEL_127;
          goto LABEL_122;
        }
        v133 = rect_16 < 0.0 && v52 < rect_16;
        v203 = v52;
        if (!v133)
          goto LABEL_72;
      }
      v203 = rect_16;
      goto LABEL_72;
    }
LABEL_167:

  }
}

- (uint64_t)initialSectionIndexForFinalSectionIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 348);
    v4 = *(_QWORD *)(result + 368);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newSectionMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_faultInRealHeightsOfNeededElements
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t v22;
  void *context;
  uint8_t buf[16];
  uint8_t v25[16];

  if (a1)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 100;
    while (1)
    {
      v7 = v2;
      v8 = MEMORY[0x186DC9484]();
      v9 = -[UITableViewRowData globalRowsInRect:canGuess:](*(_QWORD **)(a1 + 80), 0, *(CGFloat *)(a1 + 160), *(CGFloat *)(a1 + 168), *(CGFloat *)(a1 + 176), *(CGFloat *)(a1 + 184));
      if (v9)
        v11 = v10 + 1;
      else
        v11 = v10;
      if (v9)
        v12 = v9 - 1;
      else
        v12 = 0;
      v21 = v7;
      v22 = v5;
      context = (void *)v8;
      if (v11)
      {
        if (v11 + v12 >= (unint64_t)-[UITableViewRowData numberOfRows](*(_QWORD *)(a1 + 80)))
          v13 = v11;
        else
          v13 = v11 + 1;
      }
      else
      {
        v13 = 0;
      }
      v5 = -[UITableViewRowData sectionsInRect:](*(_QWORD *)(a1 + 80), *(CGFloat *)(a1 + 160), *(CGFloat *)(a1 + 168), *(CGFloat *)(a1 + 176), *(CGFloat *)(a1 + 184));
      v2 = v14;
      v15 = v14;
      v16 = v5;
      if (v5 < v5 + v14)
      {
        do
        {
          -[UITableViewRowData heightForHeaderInSection:canGuess:](*(_QWORD *)(a1 + 80), v16, 0);
          -[UITableViewRowData heightForFooterInSection:canGuess:](*(_QWORD *)(a1 + 80), v16++, 0);
          --v15;
        }
        while (v15);
      }
      -[_UITableViewUpdateSupport _computeVisibleBounds](a1);
      objc_autoreleasePoolPop(context);
      if (v3 == v12 && v4 == v13 && v22 == v5 && v21 == v2)
        break;
      v3 = v12;
      v4 = v13;
      if (v6-- < 2)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "Exceeded the maximum number of passes!", v25, 2u);
          }

        }
        else
        {
          v18 = _faultInRealHeightsOfNeededElements___s_category;
          if (!_faultInRealHeightsOfNeededElements___s_category)
          {
            v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v18, (unint64_t *)&_faultInRealHeightsOfNeededElements___s_category);
          }
          v19 = *(NSObject **)(v18 + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Exceeded the maximum number of passes!", buf, 2u);
          }
        }
        return;
      }
    }
  }
}

- (void)_computeVisibleBounds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  double Height;
  double v27;
  double v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double MinY;
  double v46;
  double v47;
  double v48;
  void *v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  id WeakRetained;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "visibleBounds");
    *(_QWORD *)(a1 + 160) = v2;
    *(_QWORD *)(a1 + 168) = v3;
    *(_QWORD *)(a1 + 176) = v4;
    *(_QWORD *)(a1 + 184) = v5;
    if (objc_msgSend(WeakRetained, "isScrollAnimating"))
    {
      objc_msgSend(WeakRetained, "_animatedTargetOffset");
      *(_QWORD *)(a1 + 160) = v6;
      *(_QWORD *)(a1 + 168) = v7;
    }
    v8 = -[UITableViewRowData rectForTable](*(_QWORD *)(a1 + 80));
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(WeakRetained, "_contentInset");
    v16 = v15;
    v18 = -v17;
    v20 = v8 - v19;
    v22 = v12 - (-v19 - v21);
    v23 = v10 - v17;
    v24 = v14 - (-v15 - v17);
    v60.origin.x = v20;
    v60.origin.y = v23;
    v60.size.width = v22;
    v60.size.height = v24;
    if (!CGRectContainsRect(v60, *(CGRect *)(a1 + 128)))
    {
      MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 128));
      v61.origin.x = v20;
      v61.origin.y = v23;
      v61.size.width = v22;
      v61.size.height = v24;
      if (MaxY > CGRectGetMaxY(v61))
      {
        v62.origin.x = v20;
        v62.origin.y = v23;
        v62.size.width = v22;
        v62.size.height = v24;
        Height = CGRectGetHeight(v62);
        if (Height <= CGRectGetHeight(*(CGRect *)(a1 + 128)))
        {
          v29 = objc_msgSend(WeakRetained, "_isTableHeaderViewHidden");
          v28 = v18;
          if (v29)
            objc_msgSend(WeakRetained, "contentOffset");
        }
        else
        {
          v27 = CGRectGetMaxY(*(CGRect *)(a1 + 128));
          v63.origin.x = v20;
          v63.origin.y = v23;
          v63.size.width = v22;
          v63.size.height = v24;
          v28 = *(double *)(a1 + 168) - (v27 - CGRectGetMaxY(v63));
        }
        *(double *)(a1 + 168) = v28;
      }
    }
    v30 = objc_msgSend(WeakRetained, "_visibleGlobalRows");
    if (v31)
    {
      v32 = v30;
      if (v30)
      {
        if ((objc_msgSend(WeakRetained, "_estimatesRowHeights") & 1) != 0
          || (objc_msgSend(WeakRetained, "_estimatesSectionHeaderHeights") & 1) != 0
          || objc_msgSend(WeakRetained, "_estimatesSectionFooterHeights"))
        {
          v33 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v32);
          v34 = -[UITableViewRowData numberOfRows](*(_QWORD *)(a1 + 72));
          if (v33 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v35 = v34;
            while (1)
            {
              v36 = v32 + 1;
              if ((uint64_t)(v32 + 1) >= (uint64_t)v35)
                break;
              v37 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, ++v32);
              if (v37 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v33 = v37;
                goto LABEL_22;
              }
            }
            while ((uint64_t)(v32 + 1) >= 1)
            {
              v58 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v32--);
              if (v58 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v33 = v58;
                v36 = v32 + 1;
                goto LABEL_22;
              }
            }
          }
          else
          {
            v36 = v32;
LABEL_22:
            v38 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(a1 + 72), v36, 1);
            v40 = v39;
            v42 = v41;
            v44 = v43;
            v64.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(a1 + 80), v33, 1);
            MinY = CGRectGetMinY(v64);
            v46 = CGRectGetMinY(*(CGRect *)(a1 + 128));
            v65.origin.x = v38;
            v65.origin.y = v40;
            v65.size.width = v42;
            v65.size.height = v44;
            *(double *)(a1 + 168) = MinY + v46 - CGRectGetMinY(v65);
            v47 = -[UITableViewRowData heightForTable](*(_QWORD *)(a1 + 80));
            v48 = v47 - (CGRectGetHeight(*(CGRect *)(a1 + 160)) - v16);
            *(double *)(a1 + 168) = fmax(v18, fmin(v48, CGRectGetMinY(*(CGRect *)(a1 + 160))));
          }
        }
      }
    }
    objc_msgSend(WeakRetained, "delegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_opt_respondsToSelector();
    v51 = *(_QWORD *)(a1 + 160);
    v52 = *(_QWORD *)(a1 + 168);
    if ((v50 & 1) != 0)
    {
      objc_msgSend(v49, "tableView:newContentOffsetAfterUpdate:context:", WeakRetained, *(_QWORD *)(a1 + 296), *(double *)(a1 + 160), *(double *)(a1 + 168));
      v51 = v53;
      v52 = v54;
      *(_QWORD *)(a1 + 160) = v53;
      *(_QWORD *)(a1 + 168) = v54;
    }
    v55 = *(_QWORD *)(a1 + 176);
    v56 = *(_QWORD *)(a1 + 184);
    *(CGRect *)(a1 + 192) = CGRectUnion(*(CGRect *)(a1 + 128), *(CGRect *)&v51);
    v57 = CGRectGetMaxY(*(CGRect *)(a1 + 160));
    *(double *)(a1 + 224) = v57 - CGRectGetMaxY(*(CGRect *)(a1 + 128));

  }
}

- (void)_setupAnimations
{
  if (a1)
  {
    -[_UITableViewUpdateSupport _computeVisibleBounds](a1);
    -[_UITableViewUpdateSupport _faultInRealHeightsOfNeededElements](a1);
    -[_UITableViewUpdateSupport _setupAnimationStructures](a1);
    -[_UITableViewUpdateSupport _computeAutomaticAnimationTypes](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForExistingVisibleCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationForReorderingRow](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForNewlyInsertedCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForInsertedHeadersAndFooters](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForExistingOffscreenCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForExistingHeadersAndFooters](a1);
    -[_UITableViewUpdateSupport _setupAnimationForTableHeader](a1);
    -[_UITableViewUpdateSupport _setupAnimationForTableFooter](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForDeletedCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForDeletedHeadersAndFooters](a1);
  }
}

- (void)_setupAnimationsForNewlyInsertedCells
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  id WeakRetained;
  _QWORD v29[6];
  id v30;
  id v31;
  char *v32;
  uint64_t v33;
  BOOL v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_currentScreenScale");
    v3 = v2;
    v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v5 = *(id *)(v1 + 64);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (!v6)
      goto LABEL_28;
    v7 = v6;
    v26 = sel__setupAnimationsForNewlyInsertedCells;
    v8 = *(_QWORD *)v36;
    v27 = v1;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v9);
        if (v10)
        {
          if ((*(_BYTE *)(v10 + 16) & 2) != 0 || *(_DWORD *)(v10 + 20))
            goto LABEL_21;
          v11 = *(void **)(v10 + 24);
        }
        else
        {
          v11 = 0;
        }
        v12 = v11;
        v13 = objc_msgSend(v12, "row");
        objc_msgSend(v4, "removeAllIndexes");
        v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = objc_msgSend(v12, "section");
          v16 = -[UITableViewRowData numberOfRowsInSection:](*(_QWORD *)(v1 + 80), v15);
          v17 = v1;
          v18 = v16;
          v19 = -[UITableViewRowData numberOfRowsBeforeSection:](*(_QWORD *)(v17 + 80), v15);
          if (v18 >= 1)
          {
            v20 = v19;
            v21 = v19 + v18;
            do
              objc_msgSend(v4, "addIndex:", v20++, v26, v27);
            while (v20 < v21);
          }
        }
        else
        {
          if (v10)
            v22 = *(void **)(v10 + 24);
          else
            v22 = 0;
          v23 = -[UITableViewRowData globalRowForRowAtIndexPath:](*(_QWORD *)(v1 + 80), v22);
          if (v23 == 0x7FFFFFFFFFFFFFFFLL)
          {

            goto LABEL_28;
          }
          objc_msgSend(v4, "addIndex:", v23);
        }
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __75___UITableViewUpdateSupport_Private___setupAnimationsForNewlyInsertedCells__block_invoke;
        v29[3] = &unk_1E16E41E8;
        v1 = v27;
        v29[4] = v27;
        v29[5] = v10;
        v32 = v26;
        v30 = v12;
        v34 = v14;
        v33 = v3;
        v31 = WeakRetained;
        v24 = v12;
        objc_msgSend(v4, "enumerateIndexesUsingBlock:", v29);

LABEL_21:
        ++v9;
      }
      while (v9 != v7);
      v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v7 = v25;
      if (!v25)
      {
LABEL_28:

        return;
      }
    }
  }
}

- (int64_t)_setupAnimationStructures
{
  _QWORD *v1;
  id v2;
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v1 = (_QWORD *)result;
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)v1[40];
    v1[40] = v2;

    v4 = v1[32];
    if (v4 < 1)
      v5 = 0;
    else
      v5 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    v1[33] = v5;
    result = v1[30];
    if (result < 1)
    {
      v6 = 0;
      v1[34] = 0;
    }
    else
    {
      v1[34] = malloc_type_calloc(result, 8uLL, 0x80040B8603338uLL);
      v6 = malloc_type_calloc(v1[30], 8uLL, 0x80040B8603338uLL);
      result = v1[30];
    }
    v1[35] = v6;
    v1[4] = v1[32];
    v1[2] = result;
  }
  return result;
}

- (void)_setupAnimationForTableHeader
{
  double v2;
  double v3;
  double v4;
  double v5;
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
  void *v16;
  void *v17;
  char v18;
  id *v19;
  id WeakRetained;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v2 = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(a1 + 72));
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v9 = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(a1 + 80));
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v21.origin.x = v2;
    v21.origin.y = v4;
    v21.size.width = v6;
    v21.size.height = v8;
    if (!CGRectIsEmpty(v21)
      || (v22.origin.x = v9, v22.origin.y = v11, v22.size.width = v13, v22.size.height = v15, !CGRectIsEmpty(v22)))
    {
      v23.origin.x = v2;
      v23.origin.y = v4;
      v23.size.width = v6;
      v23.size.height = v8;
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      v24 = CGRectUnion(v23, v26);
      if (CGRectIntersectsRect(v24, *(CGRect *)(a1 + 192)))
      {
        if ((objc_msgSend(WeakRetained, "_shouldUseNewHeaderFooterBehavior") & 1) != 0)
          objc_msgSend(WeakRetained, "_tableHeaderView:", 1);
        else
          objc_msgSend(WeakRetained, "tableHeaderView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "setFrame:", v2, v4, v6, v8);
          if (objc_msgSend(WeakRetained, "_shouldUseNewHeaderFooterBehavior"))
          {
            v25.origin.x = v9;
            v25.origin.y = v11;
            v25.size.width = v13;
            v25.size.height = v15;
            v18 = !CGRectIntersectsRect(v25, *(CGRect *)(a1 + 160));
          }
          else
          {
            v18 = 0;
          }
          v19 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v17, 0, 4, 0, 1, v18, objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell"), v9, v11, v13, v15, 1.0, 0.0, 1.0);
          objc_msgSend(*(id *)(a1 + 320), "addObject:", v19);

        }
      }
    }

  }
}

- (void)_setupAnimationForReorderingRow
{
  id WeakRetained;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_reorderingCell");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v3 = *(_QWORD **)(a1 + 72);
    if (v3)
      v3 = (_QWORD *)v3[23];
    v4 = v3;
    if (obj && v4)
    {
      v5 = -[UITableViewRowData globalRowForRowAtIndexPath:](*(_QWORD *)(a1 + 72), v4);
      *(_QWORD *)(a1 + 24) = v5;
      v6 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v5);
      *(_QWORD *)(a1 + 32) = v6;
      v7 = *(_QWORD *)(a1 + 264);
      if (*(_QWORD *)(v7 + 8 * v6))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITableViewUpdateSupport _collectionViewUpdateItems](a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationForReorderingRow, a1, CFSTR("UITableViewSupport.m"), 771, CFSTR("Cannot animate reordering cell because it already has an animation. Updates: %@; Cell: %@"),
          v9,
          *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * *(_QWORD *)(a1 + 32)));

        v7 = *(_QWORD *)(a1 + 264);
        v6 = *(_QWORD *)(a1 + 32);
      }
      objc_storeStrong((id *)(v7 + 8 * v6), obj);
    }

  }
}

- (void)_computeAutomaticAnimationTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id *v50;
  id v51;
  _QWORD *v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  double MinY;
  double v57;
  double MaxY;
  double v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  double v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t jj;
  uint64_t v84;
  uint64_t v85;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t k;
  uint64_t v93;
  uint64_t v94;
  _BOOL4 v95;
  uint64_t v96;
  _BOOL4 v97;
  id *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t m;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  double v108;
  _QWORD *v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t n;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  BOOL v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t ii;
  uint64_t v136;
  uint64_t v137;
  id WeakRetained;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  _BYTE *v144;
  id v145;
  id v146;
  uint64_t v147;
  _BYTE *v148;
  uint64_t v149;
  id *v150;
  id v151;
  uint64_t v152;
  id obj;
  id obja;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _QWORD v196[2];
  void (*v197)(uint64_t, void *);
  void *v198;
  id v199;
  _QWORD v200[2];
  BOOL (*v201)(uint64_t, uint64_t, uint64_t);
  void *v202;
  uint64_t v203;
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  uint64_t v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;

  v214 = *MEMORY[0x1E0C80C00];
  if (!a1 || !*(_BYTE *)(a1 + 312))
    return;
  if (!+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    v36 = *(id *)(a1 + 64);
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v185;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v185 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * i);
          if (v41 && *(_QWORD *)(v41 + 32) == 100)
            *(_QWORD *)(v41 + 32) = 0;
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
      }
      while (v38);
    }
    goto LABEL_230;
  }
  v2 = MEMORY[0x1E0C809B0];
  v200[0] = MEMORY[0x1E0C809B0];
  v200[1] = 3221225472;
  v201 = __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke;
  v202 = &unk_1E16E41C0;
  v203 = a1;
  objc_msgSend(*(id *)(a1 + 64), "sortedArrayUsingSelector:", sel_compareIndexPaths_);
  v196[0] = v2;
  v196[1] = 3221225472;
  v197 = (void (*)(uint64_t, void *))__50___UITableViewUpdateSupport_Private___computeGaps__block_invoke_2;
  v198 = &unk_1E16BDC20;
  v145 = (id)objc_claimAutoreleasedReturnValue();
  v199 = v145;
  v151 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v195 = 0u;
  v139 = a1;
  obj = *(id *)(a1 + 64);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v192, v213, 16);
  if (!v3)
  {
    v5 = 0;
    v6 = 0;
    v8 = 0;
    goto LABEL_67;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v193;
  v147 = *(_QWORD *)v193;
  do
  {
    v10 = 0;
    v149 = v4;
    do
    {
      if (*(_QWORD *)v193 != v9)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * v10);
      if (v11 && (v12 = *(_DWORD *)(v11 + 20)) != 0)
      {
        if (v12 == 1)
        {
          if (v8 && v201((uint64_t)v200, *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * v10), v8[4]))
          {
            -[UITableViewUpdateGap addUpdateItem:]((uint64_t)v8, v11);
            v6 = (void *)v11;
          }
          else
          {
            v17 = -[UITableViewUpdateGap initWithUpdateItem:]([UITableViewUpdateGap alloc], (void *)v11);

            objc_msgSend(v151, "addObject:", v17);
            v5 = (void *)v11;
            v6 = (void *)v11;
            v8 = (_QWORD *)v17;
          }
        }
      }
      else
      {
        if ((v7 & 1) != 0)
        {
          if (v8)
          {
            v13 = (void *)v8[2];
            if (!v13)
              v13 = (void *)MEMORY[0x1E0C9AA60];
            v14 = v13;
            objc_msgSend(v14, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v201((uint64_t)v200, v11, (uint64_t)v15);

            if (v16)
            {
              -[UITableViewUpdateGap addUpdateItem:]((uint64_t)v8, v11);
              v7 = 1;
              v5 = (void *)v11;
              goto LABEL_50;
            }
          }
        }
        else
        {
          -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v6);
          -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v8, v5);

          v8 = 0;
          v6 = 0;
          v5 = 0;
        }
        -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v6);
        -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v8, v5);

        v190 = 0u;
        v191 = 0u;
        v188 = 0u;
        v189 = 0u;
        v155 = v151;
        v18 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v188, v212, 16);
        if (v18)
        {
          v19 = v18;
          v20 = 0;
          v21 = *(_QWORD *)v189;
LABEL_25:
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v189 != v21)
              objc_enumerationMutation(v155);
            v23 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * v22);
            if (!v23 || !objc_msgSend(*(id *)(v23 + 8), "count"))
              break;
            if (!v20)
            {
              if (v11)
                v24 = *(void **)(v11 + 24);
              else
                v24 = 0;
              v197((uint64_t)v196, v24);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v25 = *(_QWORD **)(v23 + 32);
            if (v25)
              v26 = v25[3];
            else
              v26 = 0;
            v27 = v25;
            v28 = objc_msgSend(v20, "compare:", v26);

            if (v28 <= 1)
            {
              v29 = *(_QWORD **)(v23 + 40);
              v30 = v29 ? v29[3] : 0;
              v31 = v29;
              v32 = objc_msgSend(v20, "compare:", v30);

              if ((unint64_t)(v32 - 1) > 0xFFFFFFFFFFFFFFFDLL)
              {
                v8 = (id)v23;
                v6 = *(void **)(v23 + 32);
                v34 = *(_QWORD *)(v23 + 40);

                -[UITableViewUpdateGap addUpdateItem:]((uint64_t)v8, v11);
                v11 = v34;
                goto LABEL_49;
              }
            }
            if (v19 == ++v22)
            {
              v33 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v188, v212, 16);
              v19 = v33;
              if (v33)
                goto LABEL_25;
              break;
            }
          }
        }
        else
        {
          v20 = 0;
        }

        v8 = (_QWORD *)-[UITableViewUpdateGap initWithUpdateItem:]([UITableViewUpdateGap alloc], (void *)v11);
        objc_msgSend(v155, "addObject:", v8);
        v6 = (void *)v11;
LABEL_49:

        v7 = 1;
        v5 = (void *)v11;
        v9 = v147;
        v4 = v149;
      }
LABEL_50:
      ++v10;
    }
    while (v10 != v4);
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v192, v213, 16);
    v4 = v35;
  }
  while (v35);
LABEL_67:

  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v6);
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v8, v5);

  WeakRetained = objc_loadWeakRetained((id *)(v139 + 40));
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v36 = v151;
  v42 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v180, v210, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v181;
    v45 = (uint64_t *)(v139 + 72);
    v46 = (uint64_t *)(v139 + 80);
    v140 = *(_QWORD *)v181;
    v143 = v36;
    do
    {
      v47 = 0;
      v141 = v43;
      do
      {
        if (*(_QWORD *)v181 != v44)
          objc_enumerationMutation(v36);
        v48 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * v47);
        if (v48 && (*(_BYTE *)(v48 + 24) & 1) != 0)
        {
          v150 = *(id **)(*((_QWORD *)&v180 + 1) + 8 * v47);
          v49 = *(_QWORD *)(v48 + 32);
          if (!v49 || (*(_BYTE *)(v49 + 16) & 1) == 0)
          {
            if (objc_msgSend(v150[1], "count"))
              v50 = (id *)(v139 + 72);
            else
              v50 = (id *)v46;
            v51 = *v50;
            v52 = v150[4];
            v53 = v150[5];
            if (v52)
              v54 = (void *)v52[3];
            else
              v54 = 0;
            v152 = (uint64_t)v51;
            obja = v54;
            v142 = v47;
            if (v53)
              v55 = (void *)v53[3];
            else
              v55 = 0;
            v148 = v53;
            v144 = v52;
            v146 = v55;
            v215.origin.x = -[UITableViewRowData rectForTableHeaderView](*v45);
            MinY = CGRectGetMinY(v215);
            v216.origin.x = -[UITableViewRowData rectForTableHeaderView](*v46);
            v57 = CGRectGetMinY(v216);
            v217.origin.x = -[UITableViewRowData rectForTableFooterView](*v45);
            MaxY = CGRectGetMaxY(v217);
            v218.origin.x = -[UITableViewRowData rectForTableFooterView](*v46);
            v59 = CGRectGetMaxY(v218);
            v172 = 0u;
            v173 = 0u;
            v174 = 0u;
            v175 = 0u;
            -[UITableViewUpdateGap updateItems](v150[1], v150[2]);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v172, v208, 16);
            if (v61)
            {
              v62 = v61;
              v63 = *(_QWORD *)v173;
              v64 = 0.0;
              while (1)
              {
                v65 = 0;
                do
                {
                  if (*(_QWORD *)v173 != v63)
                    objc_enumerationMutation(v60);
                  v66 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * v65);
                  if (!v66)
                  {
                    v69 = (id)*v46;
                    v67 = 0;
LABEL_93:
                    v70 = objc_msgSend(v67, "row");
                    v71 = objc_msgSend(v67, "section");
                    if (v69)
                      v72 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:]((uint64_t)v69, v70, v71, 1, 1);
                    else
                      v72 = 0.0;
                    if (v72 > v64)
                      v64 = v72;
                    goto LABEL_106;
                  }
                  v67 = *(id *)(v66 + 24);
                  if (*(_DWORD *)(v66 + 20) == 1)
                    v68 = (id *)(v139 + 72);
                  else
                    v68 = (id *)v46;
                  v69 = *v68;
                  if ((*(_BYTE *)(v66 + 16) & 1) == 0)
                    goto LABEL_93;
                  v73 = objc_msgSend(v67, "section");
                  v74 = -[UITableViewRowData numberOfRowsInSection:]((uint64_t)v69, v73);
                  if (v74 >= 1)
                  {
                    v75 = v74;
                    for (j = 0; j != v75; ++j)
                    {
                      if (v69)
                        v77 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:]((uint64_t)v69, j, v73, 1, 1);
                      else
                        v77 = 0.0;
                      if (v77 > v64)
                        v64 = v77;
                    }
                    v46 = (uint64_t *)(v139 + 80);
                  }
LABEL_106:

                  ++v65;
                }
                while (v65 != v62);
                v78 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v172, v208, 16);
                v62 = v78;
                if (!v78)
                  goto LABEL_126;
              }
            }
            v64 = 0.0;
LABEL_126:

            if (v64 > MaxY - MinY || v64 > v59 - v57)
            {
              v170 = 0u;
              v171 = 0u;
              v168 = 0u;
              v169 = 0u;
              -[UITableViewUpdateGap updateItems](v150[1], v150[2]);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v168, v207, 16);
              v89 = v144;
              if (v88)
              {
                v90 = v88;
                v91 = *(_QWORD *)v169;
                do
                {
                  for (k = 0; k != v90; ++k)
                  {
                    if (*(_QWORD *)v169 != v91)
                      objc_enumerationMutation(v87);
                    v93 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * k);
                    if (v93 && *(_QWORD *)(v93 + 32) == 100)
                      *(_QWORD *)(v93 + 32) = 0;
                  }
                  v90 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v168, v207, 16);
                }
                while (v90);
              }
              goto LABEL_220;
            }
            v89 = v144;
            if (v152)
              v94 = *(_QWORD *)(v152 + 64);
            else
              v94 = 0;
            if (!v148 || (v148[16] & 1) == 0)
              goto LABEL_148;
            if (objc_msgSend(v146, "section") < v94 - 1)
            {
              v95 = 1;
LABEL_151:
              if (!v144 || (v144[16] & 1) == 0)
              {
LABEL_153:
                v97 = objc_msgSend(obja, "row") > 0;
                goto LABEL_156;
              }
              if (objc_msgSend(obja, "section") <= 0)
              {
                if ((v144[16] & 1) == 0)
                  goto LABEL_153;
                v97 = 0;
              }
              else
              {
                v97 = 1;
LABEL_156:
                if (v97 && v95)
                {
                  v166 = 0u;
                  v167 = 0u;
                  v164 = 0u;
                  v165 = 0u;
                  v98 = v150;
                  -[UITableViewUpdateGap updateItems](v150[1], v150[2]);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v164, v206, 16);
                  if (!v99)
                    goto LABEL_220;
                  v100 = v99;
                  v101 = *(_QWORD *)v165;
                  v102 = obja;
                  do
                  {
                    for (m = 0; m != v100; ++m)
                    {
                      if (*(_QWORD *)v165 != v101)
                        objc_enumerationMutation(v87);
                      v104 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * m);
                      if (v104 && *(_QWORD *)(v104 + 32) == 100)
                      {
                        if (objc_msgSend(v102, "row"))
                        {
                          v105 = -[UITableViewRowData globalRowForRowAtIndexPath:](v152, v102) - 1;
                          v106 = objc_msgSend(v98[1], "count");
                          v107 = (_QWORD *)*v45;
                          if (v106)
                          {
                            v219.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:]((_QWORD *)*v45, v105, 1);
                            v108 = CGRectGetMaxY(v219);
                            v109 = *(_QWORD **)(v139 + 80);
                            v110 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v139, v105);
                            v111 = v109;
                          }
                          else
                          {
                            v119 = -[_UITableViewUpdateSupport initialGlobalIndexForFinalGlobalIndex:](v139, v105);
                            v221.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](v107, v119, 1);
                            v108 = CGRectGetMaxY(v221);
                            v111 = *(_QWORD **)(v139 + 80);
                            v110 = v105;
                          }
                          v222.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](v111, v110, 1);
                          if (v108 <= CGRectGetMaxY(v222))
                          {
                            v120 = 3;
                            v121 = 4;
                          }
                          else
                          {
                            v120 = 4;
                            v121 = 3;
                          }
                          v102 = obja;
                        }
                        else
                        {
                          v112 = objc_msgSend(v98[1], "count");
                          v113 = v102;
                          v114 = *v45;
                          v115 = objc_msgSend(v113, "section");
                          if (v112)
                          {
                            v220.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v114, v115, 1);
                            v116 = CGRectGetMaxY(v220);
                            v117 = *(_QWORD *)(v139 + 80);
                            v118 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v139, objc_msgSend(v113, "section"));
                          }
                          else
                          {
                            v122 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v139, v115);
                            v223.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v114, v122, 1);
                            v116 = CGRectGetMaxY(v223);
                            v117 = *(_QWORD *)(v139 + 80);
                            v118 = objc_msgSend(v113, "section");
                          }
                          v224.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v117, v118, 1);
                          if (v116 <= CGRectGetMaxY(v224))
                          {
                            v120 = 3;
                            v121 = 4;
                          }
                          else
                          {
                            v120 = 4;
                            v121 = 3;
                          }
                          v102 = obja;
                          v98 = v150;
                        }
                        if (*(_DWORD *)(v104 + 20))
                          v120 = v121;
                        *(_QWORD *)(v104 + 32) = v120;
                      }
                    }
                    v100 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v164, v206, 16);
                  }
                  while (v100);
                  v46 = (uint64_t *)(v139 + 80);
                  v89 = v144;
                  goto LABEL_221;
                }
              }
              if (objc_msgSend(v150[1], "count") && objc_msgSend(v150[2], "count"))
              {
                v162 = 0u;
                v163 = 0u;
                v160 = 0u;
                v161 = 0u;
                -[UITableViewUpdateGap updateItems](v150[1], v150[2]);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v160, v205, 16);
                if (v124)
                {
                  v125 = v124;
                  v126 = *(_QWORD *)v161;
                  do
                  {
                    for (n = 0; n != v125; ++n)
                    {
                      if (*(_QWORD *)v161 != v126)
                        objc_enumerationMutation(v123);
                      v128 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * n);
                      if (v128 && *(_QWORD *)(v128 + 32) == 100)
                      {
                        if (*(_DWORD *)(v128 + 20))
                          v129 = 1;
                        else
                          v129 = 2;
                        *(_QWORD *)(v128 + 32) = v129;
                      }
                    }
                    v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v160, v205, 16);
                  }
                  while (v125);
                }

                v130 = 5;
              }
              else
              {
                v131 = v97 || !v95;
                if (v97)
                  v130 = 3;
                else
                  v130 = 0;
                if (!v131)
                {
                  if (v144 == v148)
                    v130 = 4;
                  else
                    v130 = 5;
                }
              }
              v158 = 0u;
              v159 = 0u;
              v156 = 0u;
              v157 = 0u;
              -[UITableViewUpdateGap updateItems](v150[1], v150[2]);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v156, v204, 16);
              if (v132)
              {
                v133 = v132;
                v134 = *(_QWORD *)v157;
                do
                {
                  for (ii = 0; ii != v133; ++ii)
                  {
                    if (*(_QWORD *)v157 != v134)
                      objc_enumerationMutation(v87);
                    v136 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * ii);
                    if (v136 && *(_QWORD *)(v136 + 32) == 100)
                      *(_QWORD *)(v136 + 32) = v130;
                  }
                  v133 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v156, v204, 16);
                }
                while (v133);
              }
LABEL_220:
              v102 = obja;
LABEL_221:

              v44 = v140;
              v43 = v141;
              v47 = v142;
              v79 = (void *)v152;
LABEL_222:

              v36 = v143;
              goto LABEL_223;
            }
            if ((v148[16] & 1) == 0)
            {
LABEL_148:
              if (objc_msgSend(v146, "section") < v94)
              {
                v96 = objc_msgSend(v146, "row");
                v95 = v96 < -[UITableViewRowData numberOfRowsInSection:](v152, objc_msgSend(v146, "section")) - 1;
                goto LABEL_151;
              }
            }
            v95 = 0;
            goto LABEL_151;
          }
          v178 = 0u;
          v179 = 0u;
          v176 = 0u;
          v177 = 0u;
          -[UITableViewUpdateGap updateItems](v150[1], v150[2]);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v176, v209, 16);
          if (v80)
          {
            v81 = v80;
            v82 = *(_QWORD *)v177;
            do
            {
              for (jj = 0; jj != v81; ++jj)
              {
                if (*(_QWORD *)v177 != v82)
                  objc_enumerationMutation(v79);
                v84 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * jj);
                if (v84)
                {
                  if (*(_DWORD *)(v84 + 20))
                    v85 = 1;
                  else
                    v85 = 2;
                  *(_QWORD *)(v84 + 32) = v85;
                }
              }
              v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v176, v209, 16);
            }
            while (v81);
          }
          goto LABEL_222;
        }
LABEL_223:
        ++v47;
      }
      while (v47 != v43);
      v137 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v180, v210, 16);
      v43 = v137;
    }
    while (v137);
  }

LABEL_230:
}

- (void)_setupAnimationForTableFooter
{
  double v2;
  double v3;
  double v4;
  double v5;
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
  void *v16;
  void *v17;
  char v18;
  id *v19;
  id WeakRetained;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v2 = -[UITableViewRowData rectForTableFooterView](*(_QWORD *)(a1 + 72));
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v9 = -[UITableViewRowData rectForTableFooterView](*(_QWORD *)(a1 + 80));
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v21.origin.x = v2;
    v21.origin.y = v4;
    v21.size.width = v6;
    v21.size.height = v8;
    if (!CGRectIsEmpty(v21)
      || (v22.origin.x = v9, v22.origin.y = v11, v22.size.width = v13, v22.size.height = v15, !CGRectIsEmpty(v22)))
    {
      v23.origin.x = v2;
      v23.origin.y = v4;
      v23.size.width = v6;
      v23.size.height = v8;
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      v24 = CGRectUnion(v23, v26);
      if (CGRectIntersectsRect(v24, *(CGRect *)(a1 + 192)))
      {
        if ((objc_msgSend(WeakRetained, "_shouldUseNewHeaderFooterBehavior") & 1) != 0)
          objc_msgSend(WeakRetained, "_tableFooterView:", 1);
        else
          objc_msgSend(WeakRetained, "tableFooterView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "setFrame:", v2, v4, v6, v8);
          if (objc_msgSend(WeakRetained, "_shouldUseNewHeaderFooterBehavior"))
          {
            v25.origin.x = v9;
            v25.origin.y = v11;
            v25.size.width = v13;
            v25.size.height = v15;
            v18 = !CGRectIntersectsRect(v25, *(CGRect *)(a1 + 160));
          }
          else
          {
            v18 = 0;
          }
          v19 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v17, 0, 5, 0, 1, v18, objc_msgSend(WeakRetained, "_isEditingWithNoSwipedCell"), v9, v11, v13, v15, 1.0, 0.0, 1.0);
          objc_msgSend(*(id *)(a1 + 320), "addObject:", v19);

        }
      }
    }

  }
}

- (void)dealloc
{
  id *animatedCells;
  int64_t v4;
  id *v5;
  id v6;
  id *animatedHeaders;
  int64_t v8;
  id *v9;
  id v10;
  id *animatedFooters;
  int64_t v12;
  id *v13;
  id v14;
  objc_super v15;

  _UIDataSourceDestroyUpdateMaps((uint64_t)&self->_updateMaps);
  animatedCells = self->animatedCells;
  if (animatedCells)
  {
    if (self->newGlobalRowCount >= 1)
    {
      v4 = 0;
      do
      {
        v5 = self->animatedCells;
        v6 = v5[v4];
        v5[v4] = 0;

        ++v4;
      }
      while (v4 < self->newGlobalRowCount);
      animatedCells = self->animatedCells;
    }
    free(animatedCells);
  }
  animatedHeaders = self->animatedHeaders;
  if (animatedHeaders)
  {
    if (self->newSectionCount >= 1)
    {
      v8 = 0;
      do
      {
        v9 = self->animatedHeaders;
        v10 = v9[v8];
        v9[v8] = 0;

        ++v8;
      }
      while (v8 < self->newSectionCount);
      animatedHeaders = self->animatedHeaders;
    }
    free(animatedHeaders);
  }
  animatedFooters = self->animatedFooters;
  if (animatedFooters)
  {
    if (self->newSectionCount >= 1)
    {
      v12 = 0;
      do
      {
        v13 = self->animatedFooters;
        v14 = v13[v12];
        v13[v12] = 0;

        ++v12;
      }
      while (v12 < self->newSectionCount);
      animatedFooters = self->animatedFooters;
    }
    free(animatedFooters);
  }
  v15.receiver = self;
  v15.super_class = (Class)_UITableViewUpdateSupport;
  -[_UITableViewUpdateSupport dealloc](&v15, sel_dealloc);
}

- (void)_setupAnimationsForDeletedCells
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  unint64_t *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  int64_t v38;
  double v39;
  double MinY;
  void *v44;
  void *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  const __CFString *v54;
  double v55;
  uint64_t v56;
  double v57;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double v64;
  double v65;
  double v66;
  CGFloat height;
  CGFloat v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double MaxY;
  uint64_t v73;
  double v74;
  double v75;
  char v76;
  uint64_t v77;
  _BOOL4 v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  double v84;
  void *v85;
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  void *v116;
  void *v117;
  uint64_t v118;
  const __CFString *v119;
  void *v120;
  id v121;
  int64_t v122;
  uint64_t v123;
  double v124;
  uint64_t v125;
  double v126;
  double v127;
  uint64_t v128;
  double v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  unint64_t v148;
  unint64_t v149;
  BOOL v150;
  unint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  unint64_t v155;
  double v156;
  double v157;
  UIViewAnimation *v158;
  void *v159;
  id *v160;
  int v161;
  char v162;
  _QWORD *v163;
  id v164;
  id *v165;
  id v166;
  void *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  id v176;
  double MinX;
  double v178;
  id v179;
  id v180;
  id v181;
  id v182;
  double v183;
  UIViewAnimation *v184;
  double v185;
  double v186;
  int v187;
  id *v188;
  id *v189;
  unint64_t v190;
  unint64_t v191;
  NSObject *v192;
  unint64_t v193;
  NSObject *v194;
  uint64_t v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  id v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  id v209;
  void *v210;
  void *v211;
  id *location;
  void *v213;
  double v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  id v219;
  int v220;
  _BOOL4 v221;
  size_t count;
  int counta;
  size_t countc;
  size_t countb;
  uint64_t v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  uint8_t buf[4];
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  __int16 v237;
  size_t v238;
  __int16 v239;
  id v240;
  __int16 v241;
  id v242;
  uint64_t v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;

  v243 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    location = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_swipeActionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentSwipeOccurrence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v215 = v4;
    v221 = _tableViewIsAnimatingSwipeToDelete(v4, *(void **)(v1 + 64));
    count = *(_QWORD *)(v1 + 96) + *(_QWORD *)(v1 + 88);
    v226 = v1;
    if (count && objc_msgSend(*(id *)(v1 + 64), "count"))
    {
      v219 = WeakRetained;
      v5 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
      v227 = 0u;
      v228 = 0u;
      v229 = 0u;
      v230 = 0u;
      v6 = *(id *)(v1 + 64);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v227, buf, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v228;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v228 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v227 + 1) + 8 * v10);
            if (v11 && (*(_BYTE *)(v11 + 16) & 2) == 0 && *(_DWORD *)(v11 + 20) == 1)
            {
              v12 = *(id *)(v11 + 24);
              if (objc_msgSend(v12, "row") == 0x7FFFFFFFFFFFFFFFLL)
              {
                v13 = objc_msgSend(v12, "section");
                v14 = -[UITableViewRowData numberOfRowsBeforeSection:](*(_QWORD *)(v226 + 72), v13);
                v15 = -[UITableViewRowData numberOfRowsInSection:](*(_QWORD *)(v226 + 72), v13);
                v16 = v15 + v14;
                if (v14 < 0 || v16 > count)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromRange(*(NSRange *)(v226 + 88));
                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v216, "handleFailureInMethod:object:file:lineNumber:description:", sel__buildDeleteUpdateItemsByOldGlobalRowLookupTable, v226, CFSTR("UITableViewSupport.m"), 1388, CFSTR("Old global rows out of bounds: numRowsBeforeSection=%ld, numRowsInSection=%ld, oldRowRange=%@"), v14, v15, v213);

                }
                if (v15 >= 1)
                {
                  do
                    v5[v14++] = v11;
                  while (v14 < (uint64_t)v16);
                }
              }
              else
              {
                v17 = -[UITableViewRowData globalRowForRowAtIndexPath:](*(_QWORD *)(v226 + 72), v12);
                v18 = v17;
                if ((v17 & 0x8000000000000000) != 0 || v17 >= count)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromRange(*(NSRange *)(v226 + 88));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v217, "handleFailureInMethod:object:file:lineNumber:description:", sel__buildDeleteUpdateItemsByOldGlobalRowLookupTable, v226, CFSTR("UITableViewSupport.m"), 1396, CFSTR("Old global row out of bounds: deletedGlobalRow=%ld, oldRowRange=%@"), v18, v19);

                }
                v5[v18] = v11;
              }

            }
            ++v10;
          }
          while (v10 != v8);
          v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v227, buf, 16);
          v8 = v20;
        }
        while (v20);
      }

      WeakRetained = v219;
      v1 = v226;
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(WeakRetained, "_currentScreenScale");
    v214 = v21;
    v22 = *(_QWORD *)(v1 + 88);
    v23 = *(_QWORD *)(v1 + 96);
    *(_QWORD *)(v1 + 24) = v22;
    if (v22 < v23 + v22)
    {
      do
      {
        v24 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v22);
        v25 = *(_QWORD *)(v1 + 24);
        if (v24 != 0x7FFFFFFFFFFFFFFFLL || *(_QWORD *)(v1 + 288) == v25)
          goto LABEL_222;
        v26 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v1 + 72), v25, 1);
        v28 = v27;
        v30 = v29;
        if (v5)
          v31 = (void *)v5[*(_QWORD *)(v1 + 24)];
        else
          v31 = 0;
        v32 = v31;
        if (os_variant_has_internal_diagnostics())
        {
          if (v32)
          {
LABEL_37:
            v33 = 0;
            v220 = v32[2] & 1;
            goto LABEL_38;
          }
          __UIFaultDebugAssertLog();
          v192 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v192, OS_LOG_TYPE_FAULT))
          {
            v205 = *(_QWORD *)(v226 + 24);
            v206 = *(_QWORD *)(v226 + 64);
            v207 = *(_QWORD *)(v226 + 72);
            countb = *(_QWORD *)(v226 + 80);
            -[_UITableViewUpdateSupport _oldMapArray](v226);
            v208 = (id)objc_claimAutoreleasedReturnValue();
            v209 = objc_loadWeakRetained(location);
            *(_DWORD *)buf = 134219266;
            v232 = v205;
            v233 = 2112;
            v234 = v206;
            v235 = 2112;
            v236 = v207;
            v237 = 2112;
            v238 = countb;
            v239 = 2112;
            v240 = v208;
            v241 = 2112;
            v242 = v209;
            _os_log_fault_impl(&dword_185066000, v192, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: missing delete update item for old global row (%ld) that does not exist after updates updateItems=%@; oldRowData=%@; newRowData=%@; oldGlobalRowMap: %@; tableView=%@",
              buf,
              0x3Eu);

          }
          v220 = 0;
          v33 = 1;
          v1 = v226;
        }
        else
        {
          if (v32)
            goto LABEL_37;
          v193 = _setupAnimationsForDeletedCells___s_category;
          if (!_setupAnimationsForDeletedCells___s_category)
          {
            v193 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v193, (unint64_t *)&_setupAnimationsForDeletedCells___s_category);
          }
          v194 = *(id *)(v193 + 8);
          if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
          {
            v195 = *(_QWORD *)(v226 + 24);
            v196 = *(_QWORD *)(v226 + 64);
            v197 = WeakRetained;
            v198 = *(_QWORD *)(v226 + 72);
            countc = *(_QWORD *)(v226 + 80);
            -[_UITableViewUpdateSupport _oldMapArray](v226);
            v199 = (id)objc_claimAutoreleasedReturnValue();
            v200 = objc_loadWeakRetained(location);
            *(_DWORD *)buf = 134219266;
            v232 = v195;
            v1 = v226;
            v233 = 2112;
            v234 = v196;
            v235 = 2112;
            v236 = v198;
            WeakRetained = v197;
            v237 = 2112;
            v238 = countc;
            v239 = 2112;
            v240 = v199;
            v241 = 2112;
            v242 = v200;
            _os_log_impl(&dword_185066000, v194, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: missing delete update item for old global row (%ld) that does not exist after updates updateItems=%@; oldRowData=%@; newRowData=%@; oldGlobalRowMap: %@; tableView=%@",
              buf,
              0x3Eu);

          }
          v220 = 0;
          v33 = 1;
        }
LABEL_38:
        counta = v33;
        -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v1 + 72), *(_QWORD *)(v1 + 24));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(v1 + 24);
        do
        {
          v36 = v35;
          v37 = v35-- < 1;
        }
        while (!v37
             && -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v35) == 0x7FFFFFFFFFFFFFFFLL);
        v38 = v36;
        if (v36 < *(_QWORD *)(v1 + 248))
        {
          v38 = v36;
          do
          {
            if (-[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v38) != 0x7FFFFFFFFFFFFFFFLL)
              break;
            ++v38;
          }
          while (v38 < *(_QWORD *)(v1 + 248));
        }
        if (v36 < 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if ((counta & 1) != 0)
          {
            v47 = 0;
          }
          else
          {
            v46 = *((int *)v32 + 5);
            v47 = CFSTR("unknown");
            if (v46 <= 3)
              v47 = off_1E16E4280[v46];
          }
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, CFSTR("UITableViewSupport.m"), 1446, CFSTR("Invalid prior old global row when computing beginning of old gap for %@ of row at index path %@"), v47, v34);

        }
        else
        {
          if (v36 < *(_QWORD *)(v1 + 248))
          {
            v39 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v1 + 72), v36, 1);
LABEL_48:
            MinY = CGRectGetMinY(*(CGRect *)&v39);
            goto LABEL_58;
          }
          if (v34)
          {
            if (!v220)
            {
              v69 = *(_QWORD *)(v1 + 72);
              v70 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v1, objc_msgSend(v34, "section"));
              v246.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v69, v70, 1);
              MinY = CGRectGetMinY(v246);
              v50 = v38 - 1;
              if (v38 < 1)
                goto LABEL_72;
              goto LABEL_59;
            }
            v48 = objc_msgSend(v34, "section") + 1;
            v49 = *(_QWORD *)(v1 + 72);
            if (v48 >= *(_QWORD *)(v1 + 232))
              v39 = -[UITableViewRowData rectForTableFooterView](v49);
            else
              v39 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v49, v48, 1);
            goto LABEL_48;
          }
        }
        MinY = 0.0;
LABEL_58:
        v50 = v38 - 1;
        if (v38 <= 0)
        {
          if (v220)
          {
            v218 = v38 - 1;
            v56 = objc_msgSend(v34, "section");
            if (v56 < 1)
              v57 = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(v1 + 72));
            else
              v57 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(v1 + 72), v56 - 1, 1);
            MaxY = CGRectGetMaxY(*(CGRect *)&v57);
          }
          else
          {
            if (!v34)
            {
              v218 = v38 - 1;
LABEL_64:
              v55 = 0.0;
              goto LABEL_76;
            }
LABEL_72:
            v218 = v50;
            v71 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v1, objc_msgSend(v34, "section"));
            MaxY = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v1, v71, *(void **)(v1 + 72));
          }
          v55 = MaxY;
          goto LABEL_76;
        }
LABEL_59:
        v218 = v50;
        if (v38 > *(_QWORD *)(v1 + 248))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if ((counta & 1) != 0)
          {
            v54 = 0;
          }
          else
          {
            v53 = *((int *)v32 + 5);
            v54 = CFSTR("unknown");
            if (v53 <= 3)
              v54 = off_1E16E4280[v53];
          }
          objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, CFSTR("UITableViewSupport.m"), 1502, CFSTR("Invalid subsequent old global row when computing end of old gap for %@ of row at index path %@"), v54, v34);

          goto LABEL_64;
        }
        v244.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v1 + 72), v50, 1);
        x = v244.origin.x;
        y = v244.origin.y;
        width = v244.size.width;
        v64 = v26;
        v65 = v30;
        v66 = v28;
        height = v244.size.height;
        v68 = CGRectGetMinY(v244);
        v245.origin.x = x;
        v245.origin.y = y;
        v245.size.width = width;
        v55 = v68;
        v245.size.height = height;
        v28 = v66;
        v30 = v65;
        v26 = v64;
        CGRectGetMaxY(v245);
LABEL_76:
        if (v55 < MinY)
        {
          v73 = 0;
          v74 = v55;
          v75 = MinY;
          v76 = counta;
          goto LABEL_155;
        }
        if (v36 < 1)
        {
          v78 = 0;
          v79 = -1;
          if (v38 < 0)
            goto LABEL_81;
        }
        else if (v36 <= *(_QWORD *)(v1 + 248))
        {
          v80 = v34;
          v81 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v35);
          v79 = 0x7FFFFFFFFFFFFFFFLL;
          if (v81 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v78 = 0;
          }
          else
          {
            v100 = v81;
            -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v1 + 72), v35);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = objc_msgSend(v101, "section");
            v78 = v102 == objc_msgSend(v80, "section");

            v79 = v100;
          }
          v34 = v80;
          if (v38 < 0)
          {
LABEL_81:
            v73 = -1;
            goto LABEL_88;
          }
        }
        else
        {
          v77 = v1;
          v78 = 0;
          v79 = *(_QWORD *)(v77 + 256);
          if (v38 < 0)
            goto LABEL_81;
        }
        if (v38 >= *(_QWORD *)(v226 + 248))
          v73 = *(_QWORD *)(v226 + 256);
        else
          v73 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v226, v38);
LABEL_88:
        v76 = counta;
        if (v79 < -1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v85;
          if ((counta & 1) != 0)
          {
            v88 = 0;
            v1 = v226;
          }
          else
          {
            v87 = *((int *)v32 + 5);
            v88 = CFSTR("unknown");
            v1 = v226;
            if (v87 <= 3)
              v88 = off_1E16E4280[v87];
          }
          objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, CFSTR("UITableViewSupport.m"), 1571, CFSTR("Invalid prior new global row when computing beginning of new gap for %@ of row at index path %@"), v88, v34);

          v75 = MinY;
        }
        else
        {
          v82 = v79 + 1;
          if (v79 + 1 >= *(_QWORD *)(v226 + 256))
          {
            if (!v220)
            {
              v1 = v226;
              v112 = *(_QWORD *)(v226 + 80);
              v113 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v226, objc_msgSend(v34, "section"));
              v247.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v112, v113, 1);
              v75 = CGRectGetMinY(v247);
              if (v73 < 1)
                goto LABEL_147;
              goto LABEL_134;
            }
            v1 = v226;
            if ((counta & 1) != 0)
              v89 = 0;
            else
              v89 = (void *)v32[3];
            v90 = v89;
            v91 = objc_msgSend(v90, "section");

            v92 = *(_QWORD *)(v226 + 240);
            v93 = v91 + 1;
            while (v93 < *(_QWORD *)(v226 + 232))
            {
              v94 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v226, v93++);
              if (v94 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v92 = v94;
                break;
              }
            }
            v95 = *(_QWORD *)(v226 + 80);
            if (v92 >= *(_QWORD *)(v226 + 240))
              v96 = -[UITableViewRowData rectForTableFooterView](v95);
            else
              v96 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v95, v92, 1);
            v84 = CGRectGetMinY(*(CGRect *)&v96);
            goto LABEL_122;
          }
          if (v79 >= 0 && v78)
          {
            v1 = v226;
            v84 = -[_UITableViewUpdateSupport _startOfRowAfterRow:withRowData:](v226, v79, *(void **)(v226 + 80));
LABEL_122:
            v75 = v84;
            goto LABEL_133;
          }
          v210 = v34;
          v103 = WeakRetained;
          -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v226 + 72), *(_QWORD *)(v226 + 24));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v226, objc_msgSend(v104, "section"));

          -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v226 + 80), v79 + 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = 72;
          if (v79 >= 0)
            v107 = 80;
          -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v226 + v107), v79 & ~(v79 >> 63));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v108, "section");

          if (v109 < objc_msgSend(v106, "section"))
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v109 + 1);
            v110 = objc_claimAutoreleasedReturnValue();

            v106 = (void *)v110;
          }
          WeakRetained = v103;
          if (v106)
            v111 = objc_msgSend(v106, "section");
          else
            v111 = 0x7FFFFFFFFFFFFFFFLL;
          v1 = v226;
          if (v105 >= v111)
            v114 = v111;
          else
            v114 = v105;
          if (v114 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v106, "section") < v105 && objc_msgSend(v106, "row") >= 1)
          {
            v248.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v226 + 80), v82, 1);
            v115 = CGRectGetMinY(v248);
          }
          else
          {
            v115 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v226, v114, *(void **)(v226 + 80));
          }
          v75 = v115;

          v34 = v210;
          v76 = counta;
        }
LABEL_133:
        if (v73 <= 0)
        {
          if (v220)
          {
            if ((v76 & 1) != 0)
              v120 = 0;
            else
              v120 = (void *)v32[3];
            v121 = v120;
            v122 = objc_msgSend(v121, "section");

            while (1)
            {
              v37 = v122-- < 1;
              if (v37)
                break;
              v123 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v1, v122);
              if (v123 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v124 = -[_UITableViewUpdateSupport _startOfRowAfterFooterInSection:withRowData:](v1, v123, *(_QWORD *)(v1 + 80));
                goto LABEL_149;
              }
            }
            v250.origin.x = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(v1 + 80));
            v124 = CGRectGetMaxY(v250);
            goto LABEL_149;
          }
LABEL_147:
          v125 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v1, objc_msgSend(v34, "section"));
          v124 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v1, v125, *(void **)(v1 + 80));
          goto LABEL_149;
        }
LABEL_134:
        if (v73 > *(_QWORD *)(v1 + 256))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v116;
          if ((v76 & 1) != 0)
          {
            v119 = 0;
          }
          else
          {
            v118 = *((int *)v32 + 5);
            v119 = CFSTR("unknown");
            if (v118 <= 3)
              v119 = off_1E16E4280[v118];
          }
          objc_msgSend(v116, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, CFSTR("UITableViewSupport.m"), 1635, CFSTR("Invalid subsequent new global row when computing end of new gap for %@ of row at index path %@"), v119, v34);

          v74 = v55;
          goto LABEL_150;
        }
        v249.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v1 + 80), v73 - 1, 1);
        v124 = CGRectGetMinY(v249);
LABEL_149:
        v74 = v124;
LABEL_150:
        if (v74 <= v75)
        {
          MinY = v75;
        }
        else
        {
          v251.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v1 + 72), *(_QWORD *)(v1 + 24), 1);
          v126 = CGRectGetMinY(v251);
          v127 = 0.0;
          if (v55 > MinY)
            v127 = (v126 - MinY) / (v55 - MinY);
          MinY = v75 + UIPixelBoundaryOffset(0, (v74 - v75) * v127, v214);
        }
LABEL_155:
        if (v221)
        {
          v128 = objc_msgSend(v215, "direction");
          v30 = 0.0;
          if (v128)
          {
            if (v128 == 1)
            {
LABEL_161:
              objc_msgSend(WeakRetained, "bounds");
              v26 = v26 + v129;
            }
          }
          else
          {
LABEL_162:
            objc_msgSend(WeakRetained, "bounds");
            v26 = v26 - v130;
          }
        }
        else if ((v76 & 1) == 0)
        {
          switch(v32[4])
          {
            case 1uLL:
              goto LABEL_161;
            case 2uLL:
              goto LABEL_162;
            case 3uLL:
              if (v75 > v74 && objc_msgSend(v34, "row"))
                goto LABEL_165;
              v135 = *(_QWORD *)(v1 + 72);
              v136 = objc_msgSend(v34, "row");
              v137 = objc_msgSend(v34, "section");
              if (v135)
                v138 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v135, v136, v137, 1, 1);
              else
                v138 = 0.0;
              MinY = v75 - v138;
              break;
            case 4uLL:
              if (v75 <= v74)
              {
                if (v75 != v74)
                {
                  v252.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v1 + 72), v218, 1);
                  v143 = CGRectGetHeight(v252);
                  v144 = *(_QWORD *)(v1 + 72);
                  v145 = objc_msgSend(v34, "row");
                  v146 = objc_msgSend(v34, "section");
                  if (v144)
                    v147 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v144, v145, v146, 1, 1);
                  else
                    v147 = 0.0;
                  MinY = v74 + v143 + v147;
                  break;
                }
                if (!objc_msgSend(v34, "row") && !(objc_msgSend(v34, "section") | v73))
                {
LABEL_165:
                  MinY = v74;
                  break;
                }
              }
              else if (!objc_msgSend(v34, "row"))
              {
                MinY = v75;
                break;
              }
              v139 = *(_QWORD *)(v1 + 72);
              v140 = objc_msgSend(v34, "row");
              v141 = objc_msgSend(v34, "section");
              if (v139)
                v142 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v139, v140, v141, 1, 1);
              else
                v142 = 0.0;
              MinY = v74 + v142;
              break;
            case 6uLL:
              v131 = *(_QWORD *)(v1 + 72);
              v132 = objc_msgSend(v34, "row");
              v133 = objc_msgSend(v34, "section");
              if (v131)
                v134 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v131, v132, v133, 1, 1);
              else
                v134 = 0.0;
              MinY = MinY - UIPixelBoundaryOffset(0, v134 * 0.5, v214);
              break;
            default:
              break;
          }
        }
        v148 = *(_QWORD *)(v1 + 24);
        v149 = *(_QWORD *)(v1 + 48);
        v150 = v148 >= v149;
        v151 = v148 - v149;
        if (!v150 || v151 >= *(_QWORD *)(v1 + 56))
          goto LABEL_221;
        objc_msgSend(WeakRetained, "_visibleCellForGlobalRow:");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, *(_QWORD *)(v1 + 24));
        *(_QWORD *)(v1 + 32) = v153;
        if (v153 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*(_QWORD *)(*(_QWORD *)(v1 + 264) + 8 * v153))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITableViewUpdateSupport _collectionViewUpdateItems](v1);
            v202 = v34;
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v201, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, CFSTR("UITableViewSupport.m"), 1733, CFSTR("Cannot animate deleted cell because it already has an animation. Updates: %@; Cell: %@"),
              v203,
              *(_QWORD *)(*(_QWORD *)(v1 + 264) + 8 * *(_QWORD *)(v1 + 32)));

            v34 = v202;
            v76 = counta;

            if (v152)
              goto LABEL_191;
          }
          else if (v152)
          {
LABEL_191:
            objc_storeStrong((id *)(*(_QWORD *)(v1 + 264) + 8 * *(_QWORD *)(v1 + 32)), v152);
            goto LABEL_192;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, CFSTR("UITableViewSupport.m"), 1734, CFSTR("Missing deleted cell to setup animations"));

          goto LABEL_191;
        }
LABEL_192:
        objc_msgSend(WeakRetained, "sendSubviewToBack:", v152);
        v154 = v34;
        if ((v76 & 1) != 0)
        {
          v156 = 0.0;
        }
        else
        {
          v155 = v32[4];
          v156 = 1.0;
          if (v155 <= 6)
            v156 = dbl_186684588[v155];
        }
        if (v221)
          v157 = 1.0;
        else
          v157 = v156;
        v158 = [UIViewAnimation alloc];
        -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v1 + 72), *(_QWORD *)(v1 + 24));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v158->super.isa, v152, v159, 1, 0, 1, 1, objc_msgSend(v152, "isEditing"), v26, MinY, v28, v30, v157, 0.0, 1.0);

        v161 = objc_msgSend(WeakRetained, "_showsBackgroundShadow");
        if (((counta | v161 ^ 1) & 1) != 0)
        {
          v162 = counta | v161;
          v34 = v154;
        }
        else
        {
          v34 = v154;
          if (v32[4] - 1 <= 1
            && (v163 = *(_QWORD **)(v1 + 24),
                v163 == (_QWORD *)((char *)-[UITableViewRowData numberOfRows](*(_QWORD *)(v1 + 72)) - 1)))
          {
            v211 = v154;
            v164 = WeakRetained;
            v165 = v160;
            v166 = objc_loadWeakRetained(location);
            objc_msgSend(v166, "_backgroundShadowForSlideAnimation");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            if (v167)
            {
              objc_msgSend(v166, "insertSubview:atIndex:", v167, 0);
              objc_msgSend(v167, "frame");
              v169 = v168;
              v171 = v170;
              v173 = v172;
              v175 = v174;
              if (v165)
                v176 = v165[3];
              else
                v176 = 0;
              objc_msgSend(v176, "frame");
              MinX = CGRectGetMinX(v253);
              v178 = 0.0;
              v179 = 0;
              v180 = 0;
              v181 = 0;
              v182 = 0;
              if (v165)
              {
                v182 = v165[8];
                v179 = v165[9];
                v180 = v165[10];
                v181 = v165[11];
              }
              v183 = CGRectGetMinX(*(CGRect *)&v182);
              v184 = [UIViewAnimation alloc];
              if (v165)
              {
                v185 = *((double *)v165 + 5);
                v186 = *((double *)v165 + 6);
                v178 = *((double *)v165 + 7);
                v187 = *((_DWORD *)v165 + 5);
              }
              else
              {
                v187 = 0;
                v185 = 0.0;
                v186 = 0.0;
              }
              v188 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v184->super.isa, v167, 0, 1, v187, 1, 1, 0, v169 - (MinX - v183), v171, v173, v175, v185, v186, v178);
              v189 = v188;
              if (v188)
                *((_BYTE *)v188 + 11) = 0;
              objc_msgSend(*(id *)(v226 + 320), "addObject:", v188);

            }
            v162 = 0;
            WeakRetained = v164;
            v1 = v226;
            v34 = v211;
          }
          else
          {
            v162 = 0;
          }
        }
        objc_msgSend(*(id *)(v1 + 320), "addObject:", v160);
        if (!v221)
        {
          if ((v162 & 1) != 0)
            v190 = 0;
          else
            v190 = v32[4];
          objc_msgSend(v152, "_animateFloatingSeparatorForInsertion:withRowAnimation:", 0, v190);
        }
        if ((v162 & 1) != 0)
          v191 = 0;
        else
          v191 = v32[4];
        objc_msgSend(v152, "_animateInnerShadowForInsertion:withRowAnimation:", 0, v191);

LABEL_221:
        v25 = *(_QWORD *)(v1 + 24);
LABEL_222:
        v22 = v25 + 1;
        *(_QWORD *)(v1 + 24) = v22;
      }
      while (v22 < *(_QWORD *)(v1 + 96) + *(_QWORD *)(v1 + 88));
    }
    if (v5)
      free(v5);

  }
}

- (uint64_t)finalGlobalIndexForInitialGlobalIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 352);
    v4 = *(_QWORD *)(result + 376);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewGlobalItemForOldGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldGlobalItemMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_setupAnimationsForDeletedHeadersAndFooters
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  int64_t v21;
  uint64_t v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxY;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  int v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  double MinY;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _QWORD *v75;
  id v76;
  int v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  _QWORD *v91;
  void *v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  void *v96;
  double v97;
  unint64_t v98;
  double v99;
  id *v100;
  _QWORD *v101;
  id v102;
  int v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  _QWORD *v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  void *v122;
  double v123;
  unint64_t v124;
  double v125;
  id *v126;
  uint64_t v127;
  double v128;
  CGFloat v129;
  id obj;
  double v131;
  uint64_t v132;
  id WeakRetained;
  uint64_t v134;
  CGFloat v135;
  void *v136;
  void *v137;
  id *location;
  double rect2;
  double v140;
  double rect;
  double r2;
  double v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  uint64_t v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
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
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;

  v149 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    location = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_currentScreenScale");
    v3 = v2;
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    obj = *(id *)(a1 + 328);
    v134 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
    if (!v134)
      goto LABEL_132;
    v132 = *(_QWORD *)v145;
    v131 = v3;
    while (1)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v145 != v132)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v4);
        objc_msgSend(v5, "valueForKey:", CFSTR("Section"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "intValue");

        objc_msgSend(v5, "valueForKey:", CFSTR("UpdateItem"));
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueForKey:", CFSTR("NewHeaderRect"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          objc_msgSend(v9, "CGRectValue");
        v137 = v10;
        v11 = v7;
        v12 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v7, 1);
        v14 = v13;
        v16 = v15;
        objc_msgSend(v5, "valueForKey:", CFSTR("NewFooterRect"), v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          objc_msgSend(v17, "CGRectValue");
        v136 = v18;
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v7, 1);
        rect2 = v19;
        rect = v16;
        r2 = v20;
        if (v8 && (*(_BYTE *)(v8 + 16) & 2) != 0)
        {
          v22 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v7);
          v23 = 1;
          v24 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v22, 1);
          v26 = v25;
          v143 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v22, 1);
          v140 = v27;
          MaxY = 0.0;
          v29 = WeakRetained;
          goto LABEL_57;
        }
        if (v7 >= 1)
        {
          v21 = v7;
          while (-[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, --v21) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v21 <= 0)
              goto LABEL_21;
          }
LABEL_20:
          v30 = *(_QWORD *)(a1 + 80);
          v31 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v21);
          v32 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v30, v31, 1);
          goto LABEL_22;
        }
        v21 = v7 - 1;
        if (v7)
          goto LABEL_20;
LABEL_21:
        v32 = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(a1 + 80));
        v21 = -1;
LABEL_22:
        MaxY = CGRectGetMaxY(*(CGRect *)&v32);
        v36 = v21 + 1;
        v37 = *(_QWORD *)(a1 + 232);
        v38 = v21 + 1;
        if (v21 + 1 < v37)
        {
          v38 = v21 + 1;
          do
          {
            v39 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v38);
            v37 = *(_QWORD *)(a1 + 232);
            if (v39 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            ++v38;
          }
          while (v38 < v37);
        }
        v135 = v14;
        if (v38 == v37)
        {
          v150.origin.x = -[UITableViewRowData rectForTableFooterView](*(_QWORD *)(a1 + 80));
          MinY = CGRectGetMinY(v150);
        }
        else
        {
          v41 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v38);
          v151.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v41, 1);
          v42 = CGRectGetMinY(v151);
          MinY = v42 - -[UITableViewRowData offsetForHeaderInSection:](*(_QWORD *)(a1 + 80), v41);
        }
        v43 = *(_QWORD *)(a1 + 72);
        if (v7 < 1)
          v44 = -[UITableViewRowData rectForTableHeaderView](v43);
        else
          v44 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v43, v7 - 1, 1);
        v45 = v44;
        v29 = WeakRetained;
        v46 = MaxY;
        v47 = MaxY;
        if (v38 > v36)
        {
          v48 = v36;
          v47 = MaxY;
          v46 = MaxY;
          do
          {
            if (v11 == v48)
              v47 = v46 - MaxY;
            v46 = v46 + -[UITableViewRowData heightForSection:](*(_QWORD *)(a1 + 72), v48++);
          }
          while (v38 != v48);
        }
        v143 = v45;
        v49 = 0.0;
        if (MaxY != v46)
          v49 = (MinY - MaxY) / (v46 - MaxY);
        v50 = MaxY + UIPixelBoundaryOffset(0, v47 * v49, v3);
        v51 = v50 + v49 * (-[UITableViewRowData heightForSection:](*(_QWORD *)(a1 + 72), v11) - r2);
        v26 = v50 + -[UITableViewRowData offsetForHeaderInSection:](*(_QWORD *)(a1 + 72), v11);
        objc_msgSend(WeakRetained, "_contentInset");
        v53 = *(double *)(a1 + 128) + v52;
        v55 = v54 + *(double *)(a1 + 136);
        v57 = *(double *)(a1 + 144) - (v52 + v56);
        v59 = *(double *)(a1 + 152) - (v54 + v58);
        v140 = v51;
        if (!objc_msgSend(WeakRetained, "allowsHeaderViewsToFloat"))
          goto LABEL_45;
        v152.origin.x = v53;
        v152.origin.y = v55;
        v152.size.width = v57;
        v152.size.height = v59;
        v172.size.height = r2;
        v172.origin.x = v143;
        v172.origin.y = v51;
        v172.size.width = rect2;
        if (CGRectIntersectsRect(v152, v172))
        {
          v153.origin.x = v143;
          v153.origin.y = v26;
          v153.size.width = v135;
          v153.size.height = rect;
          v60 = CGRectGetMinY(v153);
          v154.origin.x = v53;
          v154.origin.y = v55;
          v154.size.width = v57;
          v154.size.height = v59;
          if (v60 >= CGRectGetMinY(v154))
          {
            v61 = v59;
          }
          else
          {
            v155.origin.x = v53;
            v155.origin.y = v55;
            v155.size.width = v57;
            v61 = v59;
            v155.size.height = v59;
            v62 = CGRectGetMinY(v155);
            v156.origin.x = v143;
            v156.size.width = rect2;
            v156.origin.y = v140;
            v156.size.height = r2;
            v128 = CGRectGetMinY(v156);
            v157.origin.x = v143;
            v157.origin.y = v26;
            v157.size.width = v135;
            v157.size.height = rect;
            v63 = v128 - CGRectGetHeight(v157);
            if (v62 >= v63)
              v26 = v63;
            else
              v26 = v62;
          }
        }
        else
        {
LABEL_45:
          v61 = v59;
        }
        v3 = v131;
        if (!objc_msgSend(WeakRetained, "allowsFooterViewsToFloat", *(_QWORD *)&v128))
        {
          v23 = 0;
          v24 = v143;
          v14 = v135;
          goto LABEL_57;
        }
        v158.origin.x = v53;
        v158.origin.y = v55;
        v158.size.width = v57;
        v158.size.height = v61;
        v24 = v143;
        v173.origin.x = v143;
        v173.origin.y = v26;
        v173.size.width = v135;
        v173.size.height = rect;
        if (!CGRectIntersectsRect(v158, v173))
        {
          v23 = 0;
          v14 = v135;
LABEL_54:
          v3 = v131;
          goto LABEL_57;
        }
        v129 = v26;
        v159.origin.x = v143;
        v159.size.width = rect2;
        v159.origin.y = v140;
        v159.size.height = r2;
        v64 = CGRectGetMaxY(v159);
        v160.origin.x = v53;
        v160.origin.y = v55;
        v160.size.width = v57;
        v160.size.height = v61;
        if (v64 > CGRectGetMaxY(v160))
        {
          v161.origin.x = v53;
          v161.origin.y = v55;
          v161.size.width = v57;
          v161.size.height = v61;
          v65 = CGRectGetMaxY(v161);
          v162.origin.x = v143;
          v162.origin.y = v140;
          v162.size.width = rect2;
          v162.size.height = r2;
          v66 = v65 - CGRectGetHeight(v162);
          v163.origin.x = v143;
          v26 = v129;
          v163.origin.y = v129;
          v14 = v135;
          v163.size.width = v135;
          v163.size.height = rect;
          v67 = CGRectGetMaxY(v163);
          v23 = 0;
          if (v66 >= v67)
            v67 = v66;
          v140 = v67;
          goto LABEL_54;
        }
        v23 = 0;
        v3 = v131;
        v14 = v135;
        v26 = v129;
LABEL_57:
        v68 = -[UITableViewRowData heightForHeaderInSection:canGuess:](*(_QWORD *)(a1 + 72), v11, 1);
        v69 = -[UITableViewRowData heightForFooterInSection:canGuess:](*(_QWORD *)(a1 + 72), v11, 1);
        objc_msgSend(v29, "bounds");
        if (v8)
        {
          switch(*(_QWORD *)(v8 + 32))
          {
            case 1:
              v24 = v24 + v70;
              v71 = v143 + v70;
              goto LABEL_63;
            case 2:
              v24 = v24 - v70;
              v71 = v143 - v70;
LABEL_63:
              v143 = v71;
              break;
            case 3:
              if (v23)
              {
                v164.origin.x = v24;
                v164.origin.y = v26;
                v164.size.width = v14;
                v164.size.height = rect;
                v26 = v26 - CGRectGetHeight(v164);
                v165.size.height = r2;
                v165.origin.x = v143;
                v165.size.width = rect2;
                v165.origin.y = v140;
                v140 = v140 - CGRectGetHeight(v165);
              }
              else
              {
                if (v69 <= v68)
                  v74 = v68;
                else
                  v74 = v69;
                v26 = MaxY - v74;
                v140 = MaxY - v74;
              }
              break;
            case 6:
              v72 = -[UITableViewRowData heightForSection:](*(_QWORD *)(a1 + 72), v11);
              v73 = UIPixelBoundaryOffset(0, v72 * 0.5, v3);
              v26 = v26 - v73;
              v140 = v140 - v73;
              break;
            default:
              break;
          }
        }
        v75 = (id)v8;
        v76 = objc_loadWeakRetained(location);
        v77 = objc_msgSend(v76, "allowsHeaderViewsToFloat");
        v78 = *(_QWORD *)(a1 + 72);
        if (v77)
        {
          objc_msgSend(v76, "_contentInset");
          v83 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v78, v11, 1, 0, *(double *)(a1 + 128) + v82, v79 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v82 + v80), *(double *)(a1 + 152) - (v79 + v81));
        }
        else
        {
          v83 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v11, 1);
        }
        v87 = v83;
        v88 = v84;
        v89 = v85;
        v90 = v86;
        if (!CGRectIsEmpty(*(CGRect *)&v83)
          || (v166.origin.x = v24,
              v166.origin.y = v26,
              v166.size.width = v14,
              v166.size.height = rect,
              !CGRectIsEmpty(v166)))
        {
          v167.origin.x = v87;
          v167.origin.y = v88;
          v167.size.width = v89;
          v167.size.height = v90;
          v174.origin.x = v24;
          v174.origin.y = v26;
          v174.size.width = v14;
          v174.size.height = rect;
          v168 = CGRectUnion(v167, v174);
          if (CGRectIntersectsRect(v168, *(CGRect *)(a1 + 192)))
          {
            if (-[_UITableViewUpdateSupport _isReloadSectionUpdate](a1))
            {
              objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", 0);
              v91 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              v92 = v91;
              if (v91)
                v91 = (_QWORD *)v91[3];
              v93 = objc_msgSend(v91, "section");

              v94 = *(id *)(*(_QWORD *)(a1 + 272) + 8 * v93);
            }
            else
            {
              v94 = 0;
            }
            objc_msgSend(v76, "_visibleHeaderViewForSection:", v11);
            v95 = objc_claimAutoreleasedReturnValue();
            if (!v95)
              goto LABEL_96;
            v96 = (void *)v95;
            if (v94 == (id)v95)
            {
              -[_UITableViewUpdateSupport _imageViewForView:](v94);
              v96 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v96, "setFrame:", v87, v88, v89, v90);
            if (v94)
            {
              if (v8)
              {
                if (v75[4] == 5)
                {
                  v97 = 0.0;
                  objc_msgSend(v96, "setAlpha:", 0.0);
                  goto LABEL_95;
                }
                objc_msgSend(v96, "setAlpha:", 1.0);
LABEL_90:
                v98 = v75[4];
                v99 = 1.0;
                if (v98 == 6)
                  v99 = 0.0;
                if (v98 >= 3)
                  v97 = v99;
                else
                  v97 = 0.0;
LABEL_95:
                v100 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v96, 0, 2, 0, 1, 1, 0, v24, v26, v14, rect, v97, 0.0, 1.0);
                objc_msgSend(*(id *)(a1 + 320), "addObject:", v100);
                objc_msgSend(v76, "_addContentSubview:atBack:", v96, objc_msgSend(v76, "allowsHeaderViewsToFloat") ^ 1);

LABEL_96:
                goto LABEL_97;
              }
              objc_msgSend(v96, "setAlpha:", 1.0);
            }
            else
            {
              objc_msgSend(v96, "setAlpha:", 1.0);
              if (v8)
                goto LABEL_90;
            }
            v97 = 0.0;
            goto LABEL_95;
          }
        }
LABEL_97:

        v101 = v75;
        v102 = objc_loadWeakRetained(location);
        v103 = objc_msgSend(v102, "allowsFooterViewsToFloat");
        v104 = *(_QWORD *)(a1 + 72);
        if (v103)
        {
          objc_msgSend(v102, "_contentInset");
          v109 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v104, v11, 1, 0, *(double *)(a1 + 128) + v108, v105 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v108 + v106), *(double *)(a1 + 152) - (v105 + v107));
        }
        else
        {
          v109 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v11, 1);
        }
        v113 = v109;
        v114 = v110;
        v115 = v111;
        v116 = v112;
        if (!CGRectIsEmpty(*(CGRect *)&v109)
          || (v169.origin.x = v143,
              v169.origin.y = v140,
              v169.size.width = rect2,
              v169.size.height = r2,
              !CGRectIsEmpty(v169)))
        {
          v170.origin.x = v113;
          v170.origin.y = v114;
          v170.size.width = v115;
          v170.size.height = v116;
          v175.origin.x = v143;
          v175.origin.y = v140;
          v175.size.width = rect2;
          v175.size.height = r2;
          v171 = CGRectUnion(v170, v175);
          if (CGRectIntersectsRect(v171, *(CGRect *)(a1 + 192)))
          {
            if (-[_UITableViewUpdateSupport _isReloadSectionUpdate](a1))
            {
              objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", 0);
              v117 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              v118 = v117;
              if (v117)
                v117 = (_QWORD *)v117[3];
              v119 = objc_msgSend(v117, "section");

              v120 = *(id *)(*(_QWORD *)(a1 + 280) + 8 * v119);
            }
            else
            {
              v120 = 0;
            }
            objc_msgSend(v102, "_visibleFooterViewForSection:", v11);
            v121 = objc_claimAutoreleasedReturnValue();
            if (!v121)
              goto LABEL_124;
            v122 = (void *)v121;
            if (v120 == (id)v121)
            {
              -[_UITableViewUpdateSupport _imageViewForView:](v120);
              v122 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v122, "setFrame:", v113, v114, v115, v116);
            if (v120)
            {
              if (v8)
              {
                if (v101[4] == 5)
                {
                  v123 = 0.0;
                  objc_msgSend(v122, "setAlpha:", 0.0);
                  goto LABEL_123;
                }
                objc_msgSend(v122, "setAlpha:", 1.0);
LABEL_118:
                v124 = v101[4];
                v125 = 1.0;
                if (v124 == 6)
                  v125 = 0.0;
                if (v124 >= 3)
                  v123 = v125;
                else
                  v123 = 0.0;
LABEL_123:
                v126 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v122, 0, 3, 0, 1, 1, 0, v143, v140, rect2, r2, v123, 0.0, 1.0);
                objc_msgSend(*(id *)(a1 + 320), "addObject:", v126);
                objc_msgSend(v102, "_addContentSubview:atBack:", v122, objc_msgSend(v102, "allowsFooterViewsToFloat") ^ 1);

LABEL_124:
                goto LABEL_125;
              }
              objc_msgSend(v122, "setAlpha:", 1.0);
            }
            else
            {
              objc_msgSend(v122, "setAlpha:", 1.0);
              if (v8)
                goto LABEL_118;
            }
            v123 = 0.0;
            goto LABEL_123;
          }
        }
LABEL_125:

        ++v4;
      }
      while (v4 != v134);
      v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
      v134 = v127;
      if (!v127)
      {
LABEL_132:

        return;
      }
    }
  }
}

- (uint64_t)finalSectionIndexForInitialSectionIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 344);
    v4 = *(_QWORD *)(result + 360);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldSectionMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_setupAnimationsForInsertedHeadersAndFooters
{
  double v2;
  uint64_t i;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int64_t v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxY;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v37;
  int64_t v38;
  int64_t v39;
  uint64_t v40;
  double MinY;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double Height;
  double v79;
  double v80;
  double v81;
  _QWORD *v82;
  id v83;
  int v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  unint64_t v98;
  void *v99;
  void *v100;
  unint64_t v101;
  char v102;
  id *v103;
  _QWORD *v104;
  id v105;
  int v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  unint64_t v120;
  void *v121;
  void *v122;
  unint64_t v123;
  char v124;
  id *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  id obj;
  double v131;
  double v132;
  double v133;
  double v134;
  CGFloat v135;
  double v136;
  uint64_t v137;
  uint64_t v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat rect2;
  void *v142;
  id *location;
  id WeakRetained;
  double v145;
  double v146;
  double rect;
  double v148;
  CGFloat v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  BOOL v154;
  _BYTE v155[128];
  uint64_t v156;
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
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;

  v156 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    location = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_currentScreenScale");
    v136 = v2;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    obj = *(id *)(a1 + 336);
    v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v155, 16);
    if (!v138)
      goto LABEL_113;
    v137 = *(_QWORD *)v151;
    v133 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v134 = *MEMORY[0x1E0C9D648];
    v131 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v132 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    while (1)
    {
      for (i = 0; i != v138; ++i)
      {
        if (*(_QWORD *)v151 != v137)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
        objc_msgSend(v4, "valueForKey:", CFSTR("Section"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "intValue");

        objc_msgSend(v4, "valueForKey:", CFSTR("UpdateItem"));
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueForKey:", CFSTR("OldHeaderRect"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
          objc_msgSend(v8, "CGRectValue");
        v142 = v9;
        v10 = v6;
        v11 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v6, 1);
        v13 = v12;
        v15 = v14;
        objc_msgSend(v4, "valueForKey:", CFSTR("OldFooterRect"), v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "CGRectValue");
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v6, 1);
        v19 = v18;
        v21 = v20;
        rect = v15;
        v145 = v20;
        if (v7 && (*(_BYTE *)(v7 + 16) & 2) != 0)
        {
          v23 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v6);
          v24 = 1;
          v25 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v23, 1);
          v148 = v26;
          v27 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v23, 1);
          v29 = v28;
          MaxY = 0.0;
          goto LABEL_59;
        }
        if (v6 < 1)
        {
          v22 = v6 - 1;
          if (!v6)
          {
LABEL_21:
            v33 = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(a1 + 72));
            LODWORD(v22) = -1;
            goto LABEL_22;
          }
        }
        else
        {
          v22 = v6;
          while (-[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, --v22) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v22 <= 0)
              goto LABEL_21;
          }
        }
        v31 = *(_QWORD *)(a1 + 72);
        v32 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v22);
        v33 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v31, v32, 1);
LABEL_22:
        MaxY = CGRectGetMaxY(*(CGRect *)&v33);
        v37 = v6 + 1;
        while (1)
        {
          v38 = v37;
          v39 = *(_QWORD *)(a1 + 240);
          if (v38 >= v39)
            break;
          v40 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v38);
          v37 = v38 + 1;
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v39 = *(_QWORD *)(a1 + 240);
            break;
          }
        }
        if (v39 == v38)
        {
          v157.origin.x = -[UITableViewRowData rectForTableFooterView](*(_QWORD *)(a1 + 72));
          MinY = CGRectGetMinY(v157);
        }
        else
        {
          v42 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v38);
          v158.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 72), v42, 1);
          v43 = CGRectGetMinY(v158);
          MinY = v43 - -[UITableViewRowData offsetForHeaderInSection:](*(_QWORD *)(a1 + 72), v42);
        }
        v44 = *(_QWORD *)(a1 + 80);
        v140 = v13;
        if ((int)v10 < 1)
          v45 = -[UITableViewRowData rectForTableHeaderView](v44);
        else
          v45 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v44, v10 - 1, 1);
        v46 = v45;
        rect2 = v19;
        v47 = MaxY;
        v48 = MaxY;
        if (v38 - 1 >= (int)v22 + 1)
        {
          v49 = (int)v22 + 1;
          v48 = MaxY;
          v47 = MaxY;
          do
          {
            if ((_DWORD)v10 - 1 == (_DWORD)v22)
              v48 = v47 - MaxY;
            v47 = v47 + -[UITableViewRowData heightForSection:](*(_QWORD *)(a1 + 80), v49);
            v49 = (int)v22 + 2;
            LODWORD(v22) = v22 + 1;
          }
          while (v38 - 1 >= v49);
        }
        v139 = v46;
        v50 = 0.0;
        if (MaxY != v47)
          v50 = (MinY - MaxY) / (v47 - MaxY);
        v51 = MaxY + UIPixelBoundaryOffset(0, v48 * v50, v136);
        v29 = v51 + v50 * (-[UITableViewRowData heightForSection:](*(_QWORD *)(a1 + 80), v10) - v21);
        v52 = v51 + -[UITableViewRowData offsetForHeaderInSection:](*(_QWORD *)(a1 + 80), v10);
        objc_msgSend(WeakRetained, "_contentInset");
        v54 = *(double *)(a1 + 128) + v53;
        v56 = v55 + *(double *)(a1 + 136);
        v58 = *(double *)(a1 + 144) - (v53 + v57);
        v60 = *(double *)(a1 + 152) - (v55 + v59);
        if (!objc_msgSend(WeakRetained, "allowsHeaderViewsToFloat"))
        {
          v70 = v52;
          v69 = v60;
          v19 = rect2;
          goto LABEL_50;
        }
        v159.origin.x = v54;
        v159.origin.y = v56;
        v159.size.width = v58;
        v159.size.height = v60;
        v182.origin.y = v29;
        v182.origin.x = v139;
        v135 = v56;
        v61 = v54;
        v182.size.width = rect2;
        v62 = v60;
        v19 = rect2;
        v182.size.height = v21;
        if (CGRectIntersectsRect(v159, v182))
        {
          v160.origin.x = v139;
          v160.origin.y = v52;
          v160.size.width = v140;
          v160.size.height = rect;
          v63 = CGRectGetMinY(v160);
          v161.origin.x = v61;
          v161.origin.y = v135;
          v161.size.width = v58;
          v161.size.height = v62;
          v64 = CGRectGetMinY(v161);
          v65 = v58;
          v66 = v62;
          if (v63 < v64)
          {
            v54 = v61;
            v67 = v61;
            v149 = v52;
            v68 = v135;
            v69 = v66;
            v129 = CGRectGetMinY(*(CGRect *)(&v65 - 2));
            v162.origin.x = v139;
            v162.origin.y = v29;
            v162.size.width = rect2;
            v21 = v145;
            v162.size.height = v145;
            v128 = CGRectGetMinY(v162);
            v163.origin.x = v139;
            v163.size.height = rect;
            v163.origin.y = v149;
            v163.size.width = v140;
            v70 = v128 - CGRectGetHeight(v163);
            if (v129 < v70)
              v70 = v129;
            v19 = rect2;
            goto LABEL_49;
          }
          v70 = v52;
          v69 = v62;
          v54 = v61;
          v19 = rect2;
        }
        else
        {
          v70 = v52;
          v69 = v62;
          v54 = v61;
        }
        v21 = v145;
LABEL_49:
        v56 = v135;
LABEL_50:
        v148 = v70;
        if (objc_msgSend(WeakRetained, "allowsFooterViewsToFloat"))
        {
          v164.origin.x = v54;
          v164.origin.y = v56;
          v164.size.width = v58;
          v164.size.height = v69;
          v183.size.width = v140;
          v183.origin.x = v139;
          v183.size.height = rect;
          v183.origin.y = v148;
          if (CGRectIntersectsRect(v164, v183))
          {
            v165.origin.x = v139;
            v165.origin.y = v29;
            v165.size.width = rect2;
            v165.size.height = v21;
            v71 = CGRectGetMaxY(v165);
            v166.origin.x = v54;
            v166.origin.y = v56;
            v166.size.width = v58;
            v166.size.height = v69;
            if (v71 <= CGRectGetMaxY(v166))
            {
              v24 = 0;
              v25 = v139;
              v13 = v140;
              v19 = rect2;
              v27 = v139;
            }
            else
            {
              v167.origin.x = v54;
              v167.origin.y = v56;
              v167.size.width = v58;
              v167.size.height = v69;
              v72 = CGRectGetMaxY(v167);
              v168.origin.x = v139;
              v168.origin.y = v29;
              v19 = rect2;
              v168.size.width = rect2;
              v168.size.height = v21;
              v73 = v72 - CGRectGetHeight(v168);
              v169.origin.x = v139;
              v169.size.height = rect;
              v169.origin.y = v148;
              v13 = v140;
              v169.size.width = v140;
              v74 = CGRectGetMaxY(v169);
              v24 = 0;
              if (v73 >= v74)
                v74 = v73;
              v25 = v139;
              v27 = v139;
              v29 = v74;
            }
          }
          else
          {
            v24 = 0;
            v25 = v139;
            v27 = v139;
            v13 = v140;
            v19 = rect2;
          }
        }
        else
        {
          v24 = 0;
          v27 = v139;
          v13 = v140;
          v25 = v139;
        }
LABEL_59:
        v75 = -[UITableViewRowData heightForHeaderInSection:canGuess:](*(_QWORD *)(a1 + 80), v10, 1);
        v76 = -[UITableViewRowData heightForFooterInSection:canGuess:](*(_QWORD *)(a1 + 80), v10, 1);
        objc_msgSend(WeakRetained, "bounds");
        if (v7)
        {
          switch(*(_QWORD *)(v7 + 32))
          {
            case 1:
              v25 = v25 + v77;
              v27 = v27 + v77;
              break;
            case 2:
              v25 = v25 - v77;
              v27 = v27 - v77;
              break;
            case 3:
              if (v24)
              {
                v170.origin.x = v25;
                v170.size.height = rect;
                v170.origin.y = v148;
                v170.size.width = v13;
                v148 = v148 - CGRectGetHeight(v170);
                v171.origin.x = v27;
                v171.origin.y = v29;
                v171.size.width = v19;
                v171.size.height = v145;
                Height = CGRectGetHeight(v171);
                goto LABEL_66;
              }
              if (v76 <= v75)
                v80 = v75;
              else
                v80 = v76;
              v29 = MaxY - v80;
              v148 = MaxY - v80;
              break;
            case 6:
              v79 = -[UITableViewRowData heightForSection:](*(_QWORD *)(a1 + 80), v10);
              Height = UIPixelBoundaryOffset(0, v79 * 0.5, v136);
              v148 = v148 - Height;
LABEL_66:
              v29 = v29 - Height;
              break;
            default:
              break;
          }
        }
        v146 = v29;
        v81 = v27;
        v82 = (id)v7;
        v83 = objc_loadWeakRetained(location);
        v154 = 0;
        v84 = objc_msgSend(v83, "allowsHeaderViewsToFloat");
        v85 = *(_QWORD *)(a1 + 80);
        if (v84)
        {
          objc_msgSend(v83, "_contentInset");
          v90 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v85, v10, 1, &v154, *(double *)(a1 + 128) + v89, v86 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v89 + v87), *(double *)(a1 + 152) - (v86 + v88));
        }
        else
        {
          v90 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v10, 1);
        }
        v94 = v90;
        v95 = v91;
        v96 = v92;
        v97 = v93;
        v172.origin.x = v25;
        v172.size.height = rect;
        v172.origin.y = v148;
        v172.size.width = v13;
        if (!CGRectIsEmpty(v172)
          || (v173.origin.x = v94,
              v173.origin.y = v95,
              v173.size.width = v96,
              v173.size.height = v97,
              !CGRectIsEmpty(v173)))
        {
          v174.origin.x = v25;
          v174.size.height = rect;
          v174.origin.y = v148;
          v174.size.width = v13;
          v184.origin.x = v94;
          v184.origin.y = v95;
          v184.size.width = v96;
          v184.size.height = v97;
          v175 = CGRectUnion(v174, v184);
          if (CGRectIntersectsRect(v175, *(CGRect *)(a1 + 192)))
          {
            if ((objc_msgSend(v83, "_delegateWantsHeaderForSection:", v10) & 1) != 0
              || (v98 = objc_msgSend(v83, "style"), v98 <= 0x10) && ((1 << v98) & 0x10006) != 0)
            {
              objc_msgSend(v83, "_sectionHeaderViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", v10, v154, 0, 1, v134, v133, v132, v131);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "_addContentSubview:atBack:", v99, objc_msgSend(v83, "allowsHeaderViewsToFloat") ^ 1);
              if (*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8 * v10))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupInsertAnimationForHeaderInSection_withTargetRect_forUpdateItem_, a1, CFSTR("UITableViewSupport.m"), 1294, CFSTR("Attempt to create two animations for header view"));

              }
              v100 = v99;
              if (!v99)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_storeStrong((id *)(*(_QWORD *)(a1 + 272) + 8 * v10), v100);
              if (!v99)

              if (!v7 || (v101 = v82[4], v101 <= 6) && ((1 << v101) & 0x47) != 0)
                objc_msgSend(v99, "setAlpha:", 0.0);
              objc_msgSend(v99, "setFrame:", v25, v148, v13, rect);
              v176.origin.x = v94;
              v176.origin.y = v95;
              v176.size.width = v96;
              v176.size.height = v97;
              v102 = !CGRectIntersectsRect(v176, *(CGRect *)(a1 + 160));
              v103 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v99, 0, 2, 0, 0, v102, 0, v94, v95, v96, v97, 1.0, 0.0, 1.0);
              objc_msgSend(*(id *)(a1 + 320), "addObject:", v103);

            }
          }
        }

        v104 = v82;
        v105 = objc_loadWeakRetained(location);
        v154 = 0;
        v106 = objc_msgSend(v105, "allowsFooterViewsToFloat");
        v107 = *(_QWORD *)(a1 + 80);
        if (v106)
        {
          objc_msgSend(v105, "_contentInset");
          v112 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v107, v10, 1, &v154, *(double *)(a1 + 128) + v111, v108 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v111 + v109), *(double *)(a1 + 152) - (v108 + v110));
        }
        else
        {
          v112 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(a1 + 80), v10, 1);
        }
        v116 = v112;
        v117 = v113;
        v118 = v114;
        v119 = v115;
        v177.origin.x = v81;
        v177.origin.y = v146;
        v177.size.width = v19;
        v177.size.height = v145;
        if (!CGRectIsEmpty(v177)
          || (v178.origin.x = v116,
              v178.origin.y = v117,
              v178.size.width = v118,
              v178.size.height = v119,
              !CGRectIsEmpty(v178)))
        {
          v179.origin.x = v81;
          v179.origin.y = v146;
          v179.size.width = v19;
          v179.size.height = v145;
          v185.origin.x = v116;
          v185.origin.y = v117;
          v185.size.width = v118;
          v185.size.height = v119;
          v180 = CGRectUnion(v179, v185);
          if (CGRectIntersectsRect(v180, *(CGRect *)(a1 + 192)))
          {
            if ((objc_msgSend(v105, "_delegateWantsFooterForSection:", v10) & 1) != 0
              || (v120 = objc_msgSend(v105, "style"), v120 <= 0x10) && ((1 << v120) & 0x10006) != 0)
            {
              objc_msgSend(v105, "_sectionFooterViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", v10, v154, 0, 1, v134, v133, v132, v131);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "_addContentSubview:atBack:", v121, objc_msgSend(v105, "allowsFooterViewsToFloat") ^ 1);
              if (*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8 * v10))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupInsertAnimationForFooterInSection_withTargetRect_forUpdateItem_, a1, CFSTR("UITableViewSupport.m"), 1324, CFSTR("Attempt to create two animations for footer view"));

              }
              v122 = v121;
              if (!v121)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_storeStrong((id *)(*(_QWORD *)(a1 + 280) + 8 * v10), v122);
              if (!v121)

              if (!v7 || (v123 = v104[4], v123 <= 6) && ((1 << v123) & 0x47) != 0)
                objc_msgSend(v121, "setAlpha:", 0.0);
              objc_msgSend(v121, "setFrame:", v81, v146, v19, v145);
              v181.origin.x = v116;
              v181.origin.y = v117;
              v181.size.width = v118;
              v181.size.height = v119;
              v124 = !CGRectIntersectsRect(v181, *(CGRect *)(a1 + 160));
              v125 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v121, 0, 3, 0, 0, v124, 0, v116, v117, v118, v119, 1.0, 0.0, 1.0);
              objc_msgSend(*(id *)(a1 + 320), "addObject:", v125);

            }
          }
        }

      }
      v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v155, 16);
      if (!v138)
      {
LABEL_113:

        return;
      }
    }
  }
}

- (double)_startOfRowAfterHeaderInSection:(void *)a3 withRowData:
{
  id *v4;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MaxY;
  double v15;
  CGRect v17;

  if (!a1)
    return 0.0;
  v4 = (id *)(a1 + 40);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v7 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)v5, a2, 1);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  MaxY = CGRectGetMaxY(v17);
  if (MaxY > 0.0)
  {
    objc_msgSend(WeakRetained, "_sectionHeaderToFirstRowPadding");
    MaxY = MaxY + v15;
  }

  return MaxY;
}

- (BOOL)_isReloadSectionUpdate
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(*(id *)(a1 + 64), "count") != 2)
    return 0;
  objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v2 && *(_DWORD *)(v2 + 20) == 1 && (!v3 || !*(_DWORD *)(v3 + 20)))
  {
    v7 = *(id *)(v2 + 24);
    v8 = objc_msgSend(v7, "section");
    if (v4)
      v9 = (void *)v4[3];
    else
      v9 = 0;
    v5 = v8 == objc_msgSend(v9, "section");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_startOfRowAfterRow:(void *)a3 withRowData:
{
  id *v4;
  _QWORD *v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGRect v19;

  if (!a1)
    return 0.0;
  v4 = (id *)(a1 + 40);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultPaddingBetweenRows");
  v9 = v8;

  v10 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](v5, a2, 1);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  v17 = v9 + CGRectGetMaxY(v19);

  return v17;
}

- (id)initWithTableView:(void *)a3 updateItems:(void *)a4 oldRowData:(void *)a5 newRowData:(void *)a6 oldRowRange:(void *)a7 newRowRange:(uint64_t)a8 context:(void *)a9
{
  id *v17;
  id *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  unint64_t v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  unint64_t v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id obj;
  id *v101;
  objc_super v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  void *v108[6];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[5];
  _QWORD v112[5];
  id v113;
  _QWORD v114[5];
  id v115;
  const void *v116[6];
  _QWORD v117[4];
  id v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD aBlock[4];
  id v138;
  uint8_t buf[4];
  uint64_t v140;
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[2];
  _OWORD v145[3];
  void *v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  obj = a2;
  v96 = a3;
  v97 = a4;
  v98 = a5;
  v99 = a11;
  if (a1)
  {
    v102.receiver = a1;
    v102.super_class = (Class)_UITableViewUpdateSupport;
    v17 = (id *)objc_msgSendSuper2(&v102, sel_init);
    v101 = v17;
    if (v17)
    {
      v18 = v17 + 5;
      objc_storeWeak(v17 + 5, obj);
      v101[6] = (id)objc_msgSend(obj, "_visibleGlobalRows");
      v101[7] = v19;
      objc_storeStrong(v101 + 8, a3);
      objc_storeStrong(v101 + 9, a4);
      objc_storeStrong(v101 + 10, a5);
      v101[11] = a6;
      v101[12] = a7;
      v101[13] = a9;
      v101[14] = a10;
      WeakRetained = objc_loadWeakRetained(v18);
      objc_msgSend(WeakRetained, "visibleBounds");
      v101[16] = v21;
      v101[17] = v22;
      v101[18] = v23;
      v101[19] = v24;

      objc_storeStrong(v101 + 37, a11);
      v25 = v101[9];
      v26 = v25;
      if (v25)
        v27 = (void *)*((_QWORD *)v25 + 8);
      else
        v27 = 0;
      v101[29] = v27;
      v28 = (unint64_t)-[UITableViewRowData numberOfRows]((uint64_t)v25);
      v101[31] = (id)v28;
      v29 = (unint64_t)v101[29];
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!HIDWORD(v29))
        {
LABEL_9:
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!HIDWORD(v28))
            {
LABEL_12:
              v30 = MEMORY[0x1E0C809B0];
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke;
              aBlock[3] = &unk_1E16BE1B8;
              v31 = v26;
              v138 = v31;
              v93 = _Block_copy(aBlock);
              v135[0] = v30;
              v135[1] = 3221225472;
              v135[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2;
              v135[3] = &unk_1E16BE1B8;
              v88 = v31;
              v136 = v88;
              v92 = _Block_copy(v135);
              v32 = v101[10];
              v33 = v32;
              if (v32)
                v34 = (void *)*((_QWORD *)v32 + 8);
              else
                v34 = 0;
              v101[30] = v34;
              v35 = (unint64_t)-[UITableViewRowData numberOfRows]((uint64_t)v32);
              v101[32] = (id)v35;
              v36 = (unint64_t)v101[30];
              if (v36 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (!HIDWORD(v36))
                {
LABEL_17:
                  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (!HIDWORD(v35))
                      goto LABEL_20;
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "handleFailureInFunction:file:lineNumber:description:", v86, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v35);

                  }
                  v35 = 0xFFFFFFFFLL;
LABEL_20:
                  v133[0] = v30;
                  v133[1] = 3221225472;
                  v133[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3;
                  v133[3] = &unk_1E16BE1B8;
                  v37 = v33;
                  v134 = v37;
                  v95 = _Block_copy(v133);
                  v131[0] = v30;
                  v131[1] = 3221225472;
                  v131[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4;
                  v131[3] = &unk_1E16BE1B8;
                  v89 = v37;
                  v132 = v89;
                  v94 = _Block_copy(v131);
                  v38 = v101[8];
                  v125 = 0;
                  v126 = &v125;
                  v127 = 0x3032000000;
                  v128 = __Block_byref_object_copy__190;
                  v129 = __Block_byref_object_dispose__190;
                  v130 = 0;
                  v121 = 0;
                  v122 = &v121;
                  v123 = 0x2020000000;
                  v124 = 0;
                  v117[0] = v30;
                  v117[1] = 3221225472;
                  v117[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_113;
                  v117[3] = &unk_1E16E4210;
                  v39 = v38;
                  v118 = v39;
                  v119 = &v125;
                  v120 = &v121;
                  v91 = _Block_copy(v117);
                  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v41 = v101[41];
                  v101[41] = v40;

                  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v43 = v101[42];
                  v101[42] = v42;

                  v44 = objc_alloc_init(MEMORY[0x1E0CB3788]);
                  v45 = v101[15];
                  v101[15] = v44;

                  v114[0] = v30;
                  v114[1] = 3221225472;
                  v114[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2_116;
                  v114[3] = &unk_1E16E4238;
                  v114[4] = v101;
                  v46 = v39;
                  v115 = v46;
                  v116[0] = _Block_copy(v114);
                  v112[0] = v30;
                  v112[1] = 3221225472;
                  v112[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3_120;
                  v112[3] = &unk_1E16E4238;
                  v112[4] = v101;
                  v90 = v46;
                  v113 = v90;
                  v116[1] = _Block_copy(v112);
                  memset(&v116[2], 0, 24);
                  v111[0] = v30;
                  v111[1] = 3221225472;
                  v111[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4_121;
                  v111[3] = &unk_1E16E4260;
                  v111[4] = v101;
                  v116[5] = _Block_copy(v111);
                  v110[0] = v29 | (v28 << 32);
                  v110[1] = _Block_copy(v93);
                  v110[2] = _Block_copy(v92);
                  v109[0] = v36 | (v35 << 32);
                  v109[1] = _Block_copy(v95);
                  v109[2] = _Block_copy(v94);
                  v47 = objc_msgSend(v90, "count");
                  __copy_constructor_8_8_sb0_sb8_sb16_sb24_sb32_sb40(v108, v116);
                  v107 = 0;
                  _UIDataSourceGenerateUpdateMaps((unsigned int *)v110, (unsigned int *)v109, v47, (uint64_t)v91, (uint64_t)v108, &v107, (uint64_t)v145);
                  v48 = v107;
                  v49 = v145[1];
                  *(_OWORD *)(v101 + 43) = v145[0];
                  *(_OWORD *)(v101 + 45) = v49;
                  *(_OWORD *)(v101 + 47) = v145[2];
                  v101[49] = v146;
                  v87 = v48;
                  objc_msgSend(v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR("item"), CFSTR("row"));
                  v50 = objc_claimAutoreleasedReturnValue();
                  v51 = v101[50];
                  v101[50] = (id)v50;

                  *((_BYTE *)v101 + 312) = *((_BYTE *)v122 + 24);
                  v105 = 0u;
                  v106 = 0u;
                  v103 = 0u;
                  v104 = 0u;
                  v52 = (id)v126[5];
                  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v103, v145, 16);
                  if (!v53)
                    goto LABEL_55;
                  v54 = *(_QWORD *)v104;
                  while (1)
                  {
                    v55 = 0;
                    do
                    {
                      if (*(_QWORD *)v104 != v54)
                        objc_enumerationMutation(v52);
                      v56 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v55);
                      if (os_variant_has_internal_diagnostics())
                      {
                        if (v56 && (*(_BYTE *)(v56 + 16) & 1) != 0)
                          goto LABEL_28;
                        __UIFaultDebugAssertLog();
                        v72 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_fault_impl(&dword_185066000, v72, OS_LOG_TYPE_FAULT, "headerFooterOnly updates must be section operations", buf, 2u);
                        }

                      }
                      else
                      {
                        if (v56 && (*(_BYTE *)(v56 + 16) & 1) != 0)
                          goto LABEL_28;
                        v73 = _MergedGlobals_42;
                        if (!_MergedGlobals_42)
                        {
                          v73 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                          atomic_store(v73, (unint64_t *)&_MergedGlobals_42);
                        }
                        v74 = *(NSObject **)(v73 + 8);
                        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_185066000, v74, OS_LOG_TYPE_ERROR, "headerFooterOnly updates must be section operations", buf, 2u);
                        }
                      }
                      if (!v56)
                      {
                        v64 = 0;
                        v63 = v101[42];
                        v141[0] = CFSTR("Section");
                        goto LABEL_32;
                      }
LABEL_28:
                      v57 = *(_DWORD *)(v56 + 20);
                      if (!v57)
                      {
                        v63 = v101[42];
                        v141[0] = CFSTR("Section");
                        v64 = *(void **)(v56 + 24);
LABEL_32:
                        v65 = (void *)MEMORY[0x1E0CB37E8];
                        v66 = v64;
                        objc_msgSend(v65, "numberWithInteger:", objc_msgSend(v66, "section"));
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        v141[1] = CFSTR("UpdateItem");
                        v142[0] = v67;
                        v142[1] = v56;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v63, "addObject:", v68);

                        goto LABEL_38;
                      }
                      if (v57 == 1)
                      {
                        v58 = v101[41];
                        v143[0] = CFSTR("Section");
                        v59 = (void *)MEMORY[0x1E0CB37E8];
                        v60 = *(id *)(v56 + 24);
                        objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "section"));
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        v143[1] = CFSTR("UpdateItem");
                        v144[0] = v61;
                        v144[1] = v56;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 2);
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "addObject:", v62);

                      }
                      else if (os_variant_has_internal_diagnostics())
                      {
                        __UIFaultDebugAssertLog();
                        v75 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
                        {
                          v76 = *(unsigned int *)(v56 + 20);
                          *(_DWORD *)buf = 134217984;
                          v140 = v76;
                          _os_log_fault_impl(&dword_185066000, v75, OS_LOG_TYPE_FAULT, "Unexpected action for headerFooterOnly update: %ld", buf, 0xCu);
                        }

                      }
                      else
                      {
                        v69 = qword_1ECD78F60;
                        if (!qword_1ECD78F60)
                        {
                          v69 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                          atomic_store(v69, (unint64_t *)&qword_1ECD78F60);
                        }
                        v70 = *(NSObject **)(v69 + 8);
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                        {
                          v71 = *(unsigned int *)(v56 + 20);
                          *(_DWORD *)buf = 134217984;
                          v140 = v71;
                          _os_log_impl(&dword_185066000, v70, OS_LOG_TYPE_ERROR, "Unexpected action for headerFooterOnly update: %ld", buf, 0xCu);
                        }
                      }
LABEL_38:
                      ++v55;
                    }
                    while (v53 != v55);
                    v77 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v103, v145, 16);
                    v53 = v77;
                    if (!v77)
                    {
LABEL_55:

                      __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)v116);
                      _Block_object_dispose(&v121, 8);
                      _Block_object_dispose(&v125, 8);

                      goto LABEL_56;
                    }
                  }
                }
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v36);

                v35 = (unint64_t)v101[32];
              }
              v36 = 0xFFFFFFFFLL;
              goto LABEL_17;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v28);

          }
          v28 = 0xFFFFFFFFLL;
          goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v29);

        v28 = (unint64_t)v101[31];
      }
      v29 = 0xFFFFFFFFLL;
      goto LABEL_9;
    }
  }
  v101 = 0;
LABEL_56:

  return v101;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidUpdatesErrorMessage, 0);
  objc_storeStrong((id *)&self->insertedSections, 0);
  objc_storeStrong((id *)&self->deletedSections, 0);
  objc_storeStrong((id *)&self->viewAnimations, 0);
  objc_storeStrong((id *)&self->_ignoringDragsToken, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->movedRows, 0);
  objc_storeStrong((id *)&self->newRowData, 0);
  objc_storeStrong((id *)&self->oldRowData, 0);
  objc_storeStrong((id *)&self->updateItems, 0);
  objc_destroyWeak((id *)&self->tableView);
}

- (id)_collectionViewUpdateItems
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "collectionViewUpdateItem", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)_oldMapArray
{
  uint64_t v2;
  void *v3;
  unint64_t i;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = (uint64_t)-[UITableViewRowData numberOfRows](*(_QWORD *)(a1 + 72));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      v5 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, i);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld->X"), i, v8);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld->%ld"), i, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
  }
  return v3;
}

- (double)_startOfRowAfterFooterInSection:(uint64_t)a3 withRowData:
{
  CGRect v4;

  if (!a1)
    return 0.0;
  v4.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a3, a2, 1);
  return CGRectGetMaxY(v4);
}

- (UIImageView)_imageViewForView:(void *)a1
{
  id v1;
  CGFloat v2;
  CGFloat v3;
  void *v4;
  void *v5;
  _QWORD *ContextStack;
  uint64_t v7;
  void *v8;
  UIImageView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v2, v3, 0.0);
  objc_msgSend(v1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v7 = 0;
  else
    v7 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  objc_msgSend(v5, "renderInContext:", v7);

  _UIGraphicsGetImageFromCurrentImageContext(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v9 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v8);
  objc_msgSend(v1, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[UIImageView setFrame:](v9, "setFrame:", v11, v13, v15, v17);
  return v9;
}

@end
