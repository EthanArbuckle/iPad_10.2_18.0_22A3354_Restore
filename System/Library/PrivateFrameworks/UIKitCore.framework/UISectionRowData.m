@implementation UISectionRowData

- (double)offsetForRow:(char)a3 adjustedForGap:
{
  double v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  double v22;

  v3 = 0.0;
  if (!a1)
    return v3;
  v5 = *(_QWORD *)(a1 + 144);
  if (!v5)
    return v3;
  v7 = *(_QWORD *)(a1 + 96);
  if (!*(_BYTE *)(v7 + 72))
    return *(double *)(v5 + 8 * a2);
  v9 = a2;
  if (a2 < 0)
    goto LABEL_11;
  v9 = a2;
  while (*(double *)(v5 + 8 * v9) == 1.79769313e308)
  {
    if (v9-- <= 0)
    {
      v9 = -1;
      break;
    }
  }
  if (v7)
  {
LABEL_11:
    v11 = *(double *)(v7 + 144);
    v12 = *(_QWORD *)(v7 + 64);
    if (v12 < 1)
    {
LABEL_15:
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v13 = 0;
      while (*(_QWORD *)(*(_QWORD *)(v7 + 88) + 8 * v13) != a1)
      {
        if (v12 == ++v13)
          goto LABEL_15;
      }
    }
    if ((v9 & 0x8000000000000000) == 0)
      goto LABEL_17;
LABEL_20:
    v14 = *(double *)(a1 + 112);
    if (v14 < -1.0)
      v14 = -v14;
    v3 = *(double *)(a1 + 48) + v14;
    if (v14 > 0.0)
    {
      objc_msgSend(*(id *)(v7 + 8), "_sectionHeaderToFirstRowPadding");
      v3 = v3 + v15;
    }
    goto LABEL_24;
  }
  v13 = 0;
  v11 = 0.0;
  if (v9 < 0)
    goto LABEL_20;
LABEL_17:
  v3 = *(double *)(v5 + 8 * v9);
LABEL_24:
  if (v9 < a2)
  {
    v16 = *(_QWORD *)(a1 + 144) + 8;
    do
    {
      if ((v9 & 0x8000000000000000) == 0)
      {
        v17 = *(float *)(*(_QWORD *)(a1 + 136) + 4 * v9);
        if (v17 < -1.0)
          v17 = -v17;
        v3 = v11 + v3 + v17;
      }
      *(double *)(v16 + 8 * v9++) = v3;
    }
    while (a2 != v9);
  }
  if ((a3 & 1) != 0)
  {
    v18 = *(_QWORD *)(a1 + 96);
    if (v18)
    {
      v19 = *(id *)(v18 + 176);
      v20 = v19;
      if (v19 && v13 == objc_msgSend(v19, "section") && objc_msgSend(v20, "row") <= a2)
      {
        v21 = *(_QWORD *)(a1 + 96);
        if (v21)
          v22 = *(double *)(v21 + 216);
        else
          v22 = 0.0;
        v3 = v3 + v11 + v22;
      }
    }
    else
    {
      v20 = 0;
    }

  }
  return v3;
}

- (double)heightForRow:(uint64_t)a3 inSection:(char)a4 canGuess:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  float v12;
  uint64_t v13;
  float v14;
  double v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double *v21;
  float v22;

  if (!a1)
    return 0.0;
  if ((a4 & 1) == 0 && *(float *)(*(_QWORD *)(a1 + 136) + 4 * a2) < -1.0)
  {
    v7 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](*(_QWORD **)(a1 + 96));
    if (!v7
      || (v8 = v7, objc_msgSend(v7, "section") != a3)
      || objc_msgSend(v8, "row") > a2
      || (v9 = a2 + 1, (unint64_t)(a2 + 1) >= *(_QWORD *)(a1 + 32)))
    {
      v9 = a2;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "_heightForRowAtIndexPath:", v10);
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 136);
    v14 = *(float *)(v13 + 4 * a2);
    if (v14 < -1.0)
      v14 = -v14;
    v15 = (float)(v12 - v14);
    *(float *)(v13 + 4 * a2) = v12;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = v16 > a2 + 1;
      v18 = v16 - (a2 + 1);
      if (v17)
        memset_pattern16((void *)(*(_QWORD *)(a1 + 144) + 8 * (a2 + 1)), &xmmword_1866792D0, 8 * v18);
    }
    else
    {
      v19 = *(_QWORD *)(a1 + 32);
      if (a2 + 1 < v19)
      {
        v20 = ~a2 + v19;
        v21 = (double *)(*(_QWORD *)(a1 + 144) + 8 * a2 + 8);
        do
        {
          *v21 = *v21 + v15;
          ++v21;
          --v20;
        }
        while (v20);
      }
    }
    -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](a1, a3, 1, v15);

  }
  v22 = *(float *)(*(_QWORD *)(a1 + 136) + 4 * a2);
  if (v22 < -1.0)
    return (float)-v22;
  return v22;
}

- (uint64_t)updateSectionHeightWithDelta:(int)a3 section:(double)a4 updateFooterOffset:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;

  *(double *)(a1 + 40) = *(double *)(a1 + 40) + a4;
  if (a3)
    *(double *)(a1 + 56) = *(double *)(a1 + 56) + a4;
  v6 = a2 + 1;
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(v7 + 64);
  if (a2 + 1 < v8)
  {
    v9 = *(unsigned __int8 *)(v7 + 72);
    do
    {
      if (!v9)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(v7 + 88) + 8 * v6);
        *(double *)(v10 + 16) = *(double *)(v10 + 16) + a4;
      }
      ++v6;
    }
    while (v8 != v6);
  }
  v11 = dyld_program_sdk_at_least();
  v12 = *(void **)(*(_QWORD *)(a1 + 96) + 8);
  if (v11)
    return objc_msgSend(v12, "_coalesceContentSizeUpdateWithDelta:", a4);
  else
    return objc_msgSend(v12, "_applyContentSizeDeltaImmediately:", a4);
}

- (void)refreshWithSection:(void *)a3 tableView:(uint64_t)a4 tableViewRowData:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  int v13;
  int v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  void *v38;
  void *v39;
  double v40;
  id v41;
  double *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  unint64_t v47;
  id v48;
  double *v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  double v54;
  double v55;
  unint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  id v63;
  double *v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  int v69;
  unint64_t v70;
  double v71;
  uint64_t v72;
  unint64_t v73;
  BOOL v74;
  int v75;
  double v76;
  uint64_t v77;
  unint64_t v78;
  int v79;
  double v80;
  float v81;
  double v82;
  BOOL v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  int v94;
  _BOOL4 v95;
  NSObject *v96;
  double v97;
  double v98;
  int v99;
  int v100;
  double v101;
  unint64_t v102;
  uint64_t v103;
  double v104;
  double v105;
  float *v106;
  double v107;
  float v108;
  float v109;
  unint64_t v110;
  double *v111;
  float v112;
  double v113;
  unint64_t v114;
  float v115;
  BOOL v116;
  double v117;
  float v118;
  float v119;
  float v120;
  double v121;
  float v122;
  float v123;
  float v124;
  uint64_t v125;
  float v126;
  uint64_t v127;
  uint64_t v128;
  float v129;
  double v130;
  uint64_t v131;
  double v132;
  double *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  id v138;
  void *v139;
  uint64_t v140;
  double v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  double v150;
  unint64_t v151;
  uint64_t v152;
  void *v153;
  _QWORD v154[2];
  void (*v155)(uint64_t, char);
  void *v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  void *v160;
  double v161;
  double v162;
  double v163;
  char *v164;
  double v165;
  uint64_t v166;
  int v167;
  char v168;
  char v169;
  uint64_t v170;
  double *v171;
  uint64_t v172;
  uint64_t v173;
  uint8_t buf[4];
  double v175;
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  *(_BYTE *)(a4 + 72) = objc_msgSend(a3, "_estimatesHeights");
  objc_msgSend(a3, "_sectionContentInset");
  *(_QWORD *)(a4 + 32) = v8;
  *(_QWORD *)(a4 + 40) = v9;
  *(_QWORD *)(a4 + 48) = v10;
  *(_QWORD *)(a4 + 56) = v11;
  objc_msgSend(a3, "_constants");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  v12 = -[UITableViewRowData fullContentWidth](a4);
  v13 = objc_msgSend(a3, "_shouldHaveHeaderViewForSection:", a2);
  if (v13)
  {
    v14 = objc_msgSend(a3, "_sectionHeadersHugContent");
    v15 = -v12;
    if (!v14)
      v15 = v12;
    *(double *)(a1 + 104) = v15;
    *(_QWORD *)(a1 + 64) = objc_msgSend(a3, "_titleAlignmentForHeaderInSection:", a2);
    objc_msgSend(a3, "_maxTitleWidthForHeaderInSection:", a2);
    *(_QWORD *)(a1 + 80) = v16;
    *(_QWORD *)(a1 + 112) = 0xBFF0000000000000;
    if (objc_msgSend(a3, "_estimatesSectionHeaderHeights"))
    {
      objc_msgSend(a3, "_estimatedHeightForHeaderInSection:", a2);
      if (v17 == -1.0)
        objc_msgSend(a3, "_defaultSectionHeaderHeight");
      v18 = -v17;
    }
    else
    {
      objc_msgSend(a3, "_dataSourceHeightForHeaderInSection:", a2);
      v18 = v19;
    }
    *(double *)(a1 + 112) = v18;
    v20 = -v18;
    if (v18 >= -1.0)
      v21 = v18;
    else
      v21 = -v18;
    if (v21 != -1.0)
      goto LABEL_25;
    if (!a2)
      *(_QWORD *)(a4 + 152) = 0;
    v22 = objc_msgSend(a3, "_tableStyle");
    if (v22 <= 0x10 && ((1 << v22) & 0x10006) != 0)
    {
      objc_msgSend(a3, "_titleForHeaderInSection:", a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && objc_msgSend(v23, "length"))
      {
        objc_msgSend(a3, "_detailTextForHeaderInSection:", a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[UISectionRowData _headerFooterSizeForSection:inTable:withTitle:detailText:isHeader:stripPaddingForAbuttingView:isTopHeader:](a1, a2, a3, (uint64_t)v24, (uint64_t)v25, 1, objc_msgSend(*(id *)(a4 + 8), "_shouldStripHeaderTopPaddingForSection:", a2), a2 == 0);

        if (v18 != 0.0)
          goto LABEL_24;
      }
      else
      {

      }
    }
    -[UISectionRowData heightForEmptySection:inTableView:rowData:](a2, a3, (_QWORD *)a4);
    v18 = v26;
LABEL_24:
    *(double *)(a1 + 112) = v18;
    v20 = -v18;
LABEL_25:
    if (v18 >= -1.0)
      v20 = v18;
    if (v20 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = v145;
      v147 = *(double *)(a1 + 112);
      if (v147 < -1.0)
        v147 = -v147;
      objc_msgSend(v145, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, CFSTR("UITableViewRowData.m"), 565, CFSTR("section header height must not be negative - provided height for section %ld is %f"), a2, *(_QWORD *)&v147);

    }
  }
  v27 = *(double *)(a1 + 112);
  if (v27 < -1.0)
    v27 = -v27;
  if (v27 == 0.0)
  {
    v28 = objc_msgSend(a3, "_tableStyle");
    if (v28 <= 0x10 && ((1 << v28) & 0x10006) != 0)
    {
      -[UISectionRowData heightForEmptySection:inTableView:rowData:](a2, a3, (_QWORD *)a4);
      *(double *)(a1 + 104) = v12;
      *(_QWORD *)(a1 + 112) = v29;
    }
  }
  *(_QWORD *)(a1 + 120) = 0;
  v30 = objc_msgSend(a3, "_shouldHaveFooterViewForSection:", a2);
  if (v30)
  {
    *(_QWORD *)(a1 + 72) = objc_msgSend(a3, "_titleAlignmentForFooterInSection:", a2);
    objc_msgSend(a3, "_maxTitleWidthForFooterInSection:", a2);
    *(_QWORD *)(a1 + 88) = v31;
    *(_QWORD *)(a1 + 120) = 0xBFF0000000000000;
    if (objc_msgSend(a3, "_estimatesSectionFooterHeights"))
    {
      objc_msgSend(a3, "_estimatedHeightForFooterInSection:", a2);
      if (v32 == -1.0)
        objc_msgSend(a3, "_defaultSectionFooterHeight");
      v33 = -v32;
    }
    else
    {
      objc_msgSend(a3, "_dataSourceHeightForFooterInSection:", a2);
      v33 = v34;
    }
    *(double *)(a1 + 120) = v33;
    v35 = -v33;
    if (v33 >= -1.0)
      v36 = v33;
    else
      v36 = -v33;
    if (v36 != -1.0)
      goto LABEL_75;
    if (*(_QWORD *)(a4 + 64) - 1 == a2)
      *(_QWORD *)(a4 + 160) = 0;
    v37 = objc_msgSend(a3, "_tableStyle");
    if (v37 <= 0x10 && ((1 << v37) & 0x10006) != 0)
    {
      objc_msgSend(a3, "_titleForFooterInSection:", a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38 && objc_msgSend(v38, "length"))
      {
        v40 = -[UISectionRowData _headerFooterSizeForSection:inTable:withTitle:detailText:isHeader:stripPaddingForAbuttingView:isTopHeader:](a1, a2, a3, (uint64_t)v39, 0, 0, 0, 0);
        v33 = v40;
        if (*(_QWORD *)(a4 + 64) - 1 == a2 && v40 > 0.0)
        {
          v41 = a3;
          v42 = (double *)(id)a4;
          objc_msgSend(v41, "_bottomPadding");
          v44 = v43;
          if (v43 == -1.0)
          {
            v44 = 0.0;
            if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v42) <= 0.0)
            {
              +[UIDevice currentDevice](UIDevice, "currentDevice");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v152 = objc_msgSend(v45, "userInterfaceIdiom");

              v44 = 20.0;
              if ((v152 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              {
                if (objc_msgSend(v41, "usesVariableMargins"))
                  v44 = 40.0;
                else
                  v44 = 20.0;
              }
            }
          }

          v42[20] = v44;
        }

        if (v33 != 0.0)
          goto LABEL_72;
      }
      else
      {

      }
    }
    objc_msgSend(a3, "sectionFooterHeight");
    v33 = v46;
    v47 = objc_msgSend(a3, "_tableStyle");
    if (v47 <= 0x10 && ((1 << v47) & 0x10006) != 0 && *(_QWORD *)(a4 + 64) - 1 == a2)
    {
      v48 = a3;
      v49 = (double *)(id)a4;
      objc_msgSend(v48, "_bottomPadding");
      v51 = v50;
      if (v50 == -1.0)
      {
        v51 = 0.0;
        if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v49) <= 0.0)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "userInterfaceIdiom");

          v51 = 20.0;
          if ((v53 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            if (objc_msgSend(v48, "usesVariableMargins"))
              v51 = 40.0;
            else
              v51 = 20.0;
          }
        }
      }

      v49[20] = v51;
    }
LABEL_72:
    if (v33 == -1.0)
    {
      objc_msgSend(a3, "_defaultSectionFooterHeight");
      v33 = v54;
    }
    *(double *)(a1 + 120) = v33;
    v35 = -v33;
LABEL_75:
    if (v33 >= -1.0)
      v35 = v33;
    if (v35 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v148;
      v150 = *(double *)(a1 + 120);
      if (v150 < -1.0)
        v150 = -v150;
      objc_msgSend(v148, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, CFSTR("UITableViewRowData.m"), 592, CFSTR("section footer height must not be negative - provided height for section %ld is %f"), a2, *(_QWORD *)&v150);

    }
  }
  v55 = *(double *)(a1 + 120);
  if (v55 < -1.0)
    v55 = -v55;
  if (v55 == 0.0)
  {
    v56 = objc_msgSend(a3, "_tableStyle");
    if (v56 <= 0x10 && ((1 << v56) & 0x10006) != 0)
    {
      objc_msgSend(a3, "sectionFooterHeight");
      v58 = v57;
      if (v57 == -1.0)
      {
        +[UITableViewHeaderFooterView defaultFooterHeightForStyle:](UITableViewHeaderFooterView, "defaultFooterHeightForStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "_tableStyle"));
        v60 = v59;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "_scrollView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_currentScreenScale");
        v58 = UIPixelBoundaryOffset(0, v60, v62);

      }
      *(double *)(a1 + 120) = v58;
      if (*(_QWORD *)(a4 + 64) - 1 == a2)
      {
        v63 = a3;
        v64 = (double *)(id)a4;
        objc_msgSend(v63, "_bottomPadding");
        v66 = v65;
        if (v65 == -1.0)
        {
          v66 = 0.0;
          if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v64) <= 0.0)
          {
            +[UIDevice currentDevice](UIDevice, "currentDevice");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "userInterfaceIdiom");

            v66 = 20.0;
            if ((v68 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            {
              if (objc_msgSend(v63, "usesVariableMargins"))
                v66 = 40.0;
              else
                v66 = 20.0;
            }
          }
        }

        v64[20] = v66;
      }
    }
  }
  v69 = objc_msgSend(a3, "_estimatesRowHeights");
  v70 = objc_msgSend(a3, "_numberOfRowsInSection:", a2);
  *(_QWORD *)(a1 + 32) = v70;
  v73 = *(_QWORD *)(a1 + 128);
  v72 = *(_QWORD *)(a1 + 136);
  if (v72)
    v74 = v73 == 0;
  else
    v74 = 1;
  v75 = !v74;
  v76 = 0.0;
  if (v70 <= v73)
  {
    v79 = 0;
    v80 = 0.0;
  }
  else
  {
    v77 = v70;
    if ((v69 & v75) == 1)
    {
      v78 = 0;
      v79 = 0;
      v80 = 0.0;
      LODWORD(v71) = 1.0;
      do
      {
        v81 = *(float *)(v72 + 4 * v78);
        v82 = v81;
        v83 = v81 <= 1.0;
        v84 = -0.0;
        if (!v83)
          v84 = v82;
        v80 = v80 + v84;
        if (!v83)
          ++v79;
        v78 += (int)(v73 / 0x3E8 + 1);
      }
      while (v73 > v78);
      if (v79)
      {
        objc_msgSend(a3, "_scrollView", v71);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        UIRoundToViewScale(v85);
        v87 = v86;

        if (v87 > 1.0 || v87 <= 0.0)
          v80 = v87;
        else
          v80 = 2.0;
        v77 = *(_QWORD *)(a1 + 32);
      }
    }
    else
    {
      v79 = 0;
      v80 = 0.0;
    }
    -[UISectionRowData allocateArraysWithCapacity:forSection:](a1, v77, a2);
    LOBYTE(v75) = 0;
  }
  v170 = 0;
  v171 = (double *)&v170;
  v172 = 0x2020000000;
  v173 = 0;
  if (v13)
  {
    if (a2)
      objc_msgSend(a3, "_paddingAboveSectionHeaders");
    else
      objc_msgSend(a3, "_paddingAboveFirstSectionHeader");
    v76 = v89 + v171[3];
    v171[3] = v76;
  }
  *(double *)(a1 + 48) = v76;
  if ((objc_msgSend(a3, "overlapsSectionHeaderViews") & 1) == 0)
  {
    v90 = *(double *)(a1 + 112);
    if (v90 < -1.0)
      v90 = -v90;
    v171[3] = v171[3] + v90;
  }
  if (v13)
  {
    objc_msgSend(a3, "_sectionHeaderToFirstRowPadding");
    v171[3] = v91 + v171[3];
  }
  objc_msgSend(a3, "rowHeight");
  v93 = v92;
  v94 = dyld_program_sdk_at_least();
  v95 = v93 < 0.0;
  if (v93 == -1.0)
    v95 = 0;
  if (v94)
  {
    if (!v95)
      goto LABEL_135;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v96 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v96, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, CFSTR("UITableViewRowData.m"), 651, CFSTR("Invalid table view rowHeight (%g). Value must be at least 0.0, or UITableViewAutomaticDimension."), *(_QWORD *)&v93);
  }
  else
  {
    if (!v95)
      goto LABEL_135;
    v151 = refreshWithSection_tableView_tableViewRowData____s_category;
    if (!refreshWithSection_tableView_tableViewRowData____s_category)
    {
      v151 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v151, (unint64_t *)&refreshWithSection_tableView_tableViewRowData____s_category);
    }
    v96 = *(id *)(v151 + 8);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v175 = v93;
      _os_log_impl(&dword_185066000, v96, OS_LOG_TYPE_ERROR, "Invalid table view rowHeight (%g). Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
    }
  }

LABEL_135:
  objc_msgSend(v153, "defaultRowHeightForTableView:", a3);
  v98 = v97;
  if (v97 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, CFSTR("UITableViewRowData.m"), 653, CFSTR("UITableView internal inconsistency: default row height (%g) cannot be negative."), *(_QWORD *)&v98);

  }
  v99 = objc_msgSend(v153, "defaultRowHeightDependsOnCellStyle");
  v100 = v99;
  if (a4)
    v101 = *(double *)(a4 + 144);
  else
    v101 = 0.0;
  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v155 = __66__UISectionRowData_refreshWithSection_tableView_tableViewRowData___block_invoke;
  v156 = &unk_1E16E4148;
  v159 = a2;
  v160 = a3;
  v168 = v75;
  v167 = v79;
  v161 = v80;
  v162 = v93;
  v163 = v98;
  v169 = v99;
  v164 = sel_refreshWithSection_tableView_tableViewRowData_;
  v157 = a1;
  v158 = &v170;
  v165 = v101;
  v166 = a4;
  if (v69)
  {
    __66__UISectionRowData_refreshWithSection_tableView_tableViewRowData___block_invoke((uint64_t)v154, 1);
LABEL_143:
    v102 = *(_QWORD *)(a1 + 32);
LABEL_144:
    if (v102)
    {
      v103 = *(_QWORD *)(a1 + 96);
      v104 = *(double *)(v103 + 32);
      v105 = *(double *)(v103 + 48);
      v106 = *(float **)(a1 + 136);
      v107 = *v106;
      v108 = v104 + v107;
      *(float *)&v107 = v104 - v107;
      v109 = -*(float *)&v107;
      if (*v106 >= -1.0)
        v109 = v108;
      *v106 = v109;
      if (v102 >= 2 && !*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
      {
        v110 = v102 - 1;
        v111 = (double *)(*(_QWORD *)(a1 + 144) + 8);
        do
        {
          *v111 = v104 + *v111;
          ++v111;
          --v110;
        }
        while (v110);
      }
      v171[3] = v104 + v171[3];
      if (a4)
      {
        v112 = -v109;
        if (v109 >= -1.0)
          v112 = v109;
        v113 = v112;
        if (*(double *)(a4 + 136) > v113)
          *(double *)(a4 + 136) = v113;
      }
      v114 = v102 - 1;
      v115 = v106[v114];
      v116 = v115 < -1.0;
      v117 = v115;
      v118 = v105 + v117;
      *(float *)&v117 = v105 - v117;
      v119 = -*(float *)&v117;
      if (!v116)
        v119 = v118;
      v106[v114] = v119;
      v171[3] = v105 + v171[3];
      if (a4)
      {
        v120 = -v119;
        if (v119 >= -1.0)
          v120 = v119;
        v121 = v120;
        if (*(double *)(a4 + 136) > v121)
          *(double *)(a4 + 136) = v121;
      }
    }
    goto LABEL_182;
  }
  if (objc_msgSend(a3, "_providesRowHeights"))
  {
    v155((uint64_t)v154, 0);
    goto LABEL_143;
  }
  v122 = v93;
  v123 = v98;
  if (v122 == -1.0)
    v124 = v98;
  else
    v124 = v93;
  if (a4 && *(double *)(a4 + 136) > v124)
    *(double *)(a4 + 136) = v124;
  v102 = *(_QWORD *)(a1 + 32);
  if (v102)
  {
    v125 = 0;
    v126 = -v124;
    if (v100)
      v123 = v126;
    if (v122 == -1.0)
      v122 = v123;
    v127 = *(_QWORD *)(a1 + 136);
    v128 = *(_QWORD *)(a1 + 144);
    v129 = -v122;
    if (v122 >= -1.0)
      v129 = v122;
    v130 = v129;
    do
    {
      *(float *)(v127 + 4 * v125) = v122;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
        v131 = 0x7FEFFFFFFFFFFFFFLL;
      else
        v131 = *((_QWORD *)v171 + 3);
      *(_QWORD *)(v128 + 8 * v125) = v131;
      v171[3] = v101 + v171[3] + v130;
      ++v125;
    }
    while (v102 != v125);
    goto LABEL_144;
  }
LABEL_182:
  if (((v30 | v13 ^ 1) & 1) != 0 || objc_msgSend(a3, "_tableStyle"))
  {
    if (!v30)
      goto LABEL_188;
    goto LABEL_187;
  }
  if (*(double *)(a1 + 48) == 0.0)
  {
LABEL_187:
    objc_msgSend(a3, "_sectionFooterToLastRowPadding");
    v171[3] = v132 + v171[3];
  }
LABEL_188:
  v133 = v171;
  *(double *)(a1 + 56) = v171[3];
  v134 = *(double *)(a1 + 120);
  if (v134 < -1.0)
    v134 = -v134;
  v135 = v133[3] + v134;
  v136 = -0.0;
  if (v30)
    v136 = v101;
  v137 = v136 + v135;
  v133[3] = v137;
  *(double *)(a1 + 40) = v137;
  *(_BYTE *)(a1 + 8) = 1;
  if (a4)
  {
    v138 = *(id *)(a4 + 184);
    v139 = v138;
    if (v138 && objc_msgSend(v138, "section") == a2)
    {
      v140 = objc_msgSend(v139, "row");
      -[UISectionRowData deleteRowAtIndex:](a1, v140, v141);
    }
    v142 = *(id *)(a4 + 176);
    v143 = v142;
    if (v142)
    {
      if (objc_msgSend(v142, "section") == a2)
        -[UISectionRowData addOffset:fromRow:](a1, objc_msgSend(v143, "row"), *(double *)(a4 + 216));
    }
  }
  else
  {
    v143 = 0;
    v139 = 0;
  }

  _Block_object_dispose(&v170, 8);
}

void __66__UISectionRowData_refreshWithSection_tableView_tableViewRowData___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  float v8;
  double v10;
  double v11;
  _QWORD *v12;
  float v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 56);
      if ((a2 & 1) != 0)
        break;
      objc_msgSend(v6, "_dataSourceHeightForRowAtIndexPath:", v5);
      v8 = v10;
      if (v8 == -1.0)
      {
        v8 = *(double *)(a1 + 72);
        if (v8 == -1.0)
        {
          v8 = *(double *)(a1 + 80);
          if (*(_BYTE *)(a1 + 117))
            goto LABEL_24;
        }
      }
      a2 = 0;
LABEL_25:
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) + 4 * v4) = v8;
      v12 = *(_QWORD **)(a1 + 32);
      v13 = *(float *)(v12[17] + 4 * v4);
      if (v13 < -1.0)
        v13 = -v13;
      v14 = v13;
      if (v13 < 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("UITableViewRowData.m"), 696, CFSTR("table view row height must not be negative - height for index path (%@) is %g"), v5, *(_QWORD *)&v14);

        v12 = *(_QWORD **)(a1 + 32);
      }
      if (*(_BYTE *)(v12[12] + 72))
        v15 = 0x7FEFFFFFFFFFFFFFLL;
      else
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_QWORD *)(v12[18] + 8 * v4) = v15;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  + v14;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 96)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
      v16 = *(_QWORD *)(a1 + 104);
      if (v16)
      {
        if (*(double *)(v16 + 136) > v14)
          *(double *)(v16 + 136) = v14;
      }

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) <= (unint64_t)++v4)
        return;
    }
    objc_msgSend(v6, "_estimatedHeightForRowAtIndexPath:", v5);
    v8 = v7;
    if (v8 == -1.0)
    {
      if (*(_BYTE *)(a1 + 116))
      {
        v8 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) + 4 * v4);
        if (v8 != 0.0)
        {
          if (v8 < -1.0)
            v8 = -v8;
          if (v8 <= 1.0 && v8 > 0.0)
            v8 = 2.0;
          goto LABEL_24;
        }
      }
      if (*(int *)(a1 + 112) >= 1)
      {
        v11 = *(double *)(a1 + 64);
LABEL_23:
        v8 = v11;
        goto LABEL_24;
      }
      v8 = *(double *)(a1 + 72);
      if (v8 == -1.0)
      {
        v11 = *(double *)(a1 + 80);
        goto LABEL_23;
      }
    }
LABEL_24:
    v8 = -v8;
    a2 = 1;
    goto LABEL_25;
  }
}

- (void)allocateArraysWithCapacity:(uint64_t)a3 forSection:
{
  void *v6;
  BOOL v7;
  id v8;

  *(_QWORD *)(a1 + 128) = a2;
  *(_QWORD *)(a1 + 136) = malloc_type_realloc(*(void **)(a1 + 136), 4 * a2, 0x100004052888210uLL);
  v6 = malloc_type_realloc(*(void **)(a1 + 144), 8 * a2, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 144) = v6;
  if (*(_QWORD *)(a1 + 136))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_allocateArraysWithCapacity_forSection_, a1, CFSTR("UITableViewRowData.m"), 214, CFSTR("Failed to allocate data stores for %ld rows in section %ld. Consider using fewer rows"), *(_QWORD *)(a1 + 32), a3);

  }
}

- (void)heightForEmptySection:(uint64_t)a1 inTableView:(void *)a2 rowData:(_QWORD *)a3
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  if (objc_msgSend(a2, "_tableStyle"))
  {
    if (a1)
    {
      objc_msgSend(a2, "sectionHeaderHeight");
      if (v6 == -1.0)
        objc_msgSend(a2, "_defaultSectionHeaderHeight");
    }
    else
    {
      v11 = GroupedTableOffsetFromTop(a2, a3);
      if (a3)
        *((double *)a3 + 19) = v11;
    }
  }
  else
  {
    objc_msgSend(a2, "sectionHeaderHeight");
    if (v7 == -1.0)
    {
      objc_msgSend(a2, "_constants");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (a1)
        objc_msgSend(v8, "defaultSectionHeaderHeightForTableView:", a2);
      else
        objc_msgSend(v8, "defaultPlainFirstSectionHeaderHeightForTableView:", a2);
      v12 = v10;
      objc_msgSend(a2, "_scrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_currentScreenScale");
      UIPixelBoundaryOffset(1, v12, v14);

    }
  }
}

- (double)heightForFooterInSection:(char)a3 canGuess:
{
  double v5;
  float v6;
  double v7;
  float v8;
  double result;

  if (!a1)
    return 0.0;
  if ((a3 & 1) == 0 && *(double *)(a1 + 120) < -1.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "_heightForFooterInSection:", a2);
    v6 = v5;
    v7 = *(double *)(a1 + 120);
    if (v7 < -1.0)
      v7 = -v7;
    v8 = v7;
    *(double *)(a1 + 120) = v6;
    -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](a1, a2, 0, (float)(v6 - v8));
  }
  result = *(double *)(a1 + 120);
  if (result < -1.0)
    return -result;
  return result;
}

- (double)headerSize
{
  double result;

  if (!a1)
    return 0.0;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "_sectionHeadersHugContent"))
    return -[UITableViewRowData fullContentWidth](*(_QWORD *)(a1 + 96));
  result = *(double *)(a1 + 104);
  if (result < -1.0)
    return -result;
  return result;
}

- (double)sizeForHeaderInSection:(char)a3 canGuess:
{
  uint64_t v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  uint64_t v11;
  double *v12;

  if (!a1)
    return 0.0;
  if ((a3 & 1) == 0 && (*(double *)(a1 + 112) < -1.0 || *(double *)(a1 + 104) < -1.0))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "_sizeForHeaderInSection:", a2);
    v7 = v6;
    v8 = *(double *)(a1 + 112);
    if (v8 < -1.0)
      v8 = -v8;
    v9 = v8;
    v10 = (float)(v7 - v9);
    *(_QWORD *)(a1 + 104) = v5;
    *(double *)(a1 + 112) = v7;
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
    {
      if (v11)
        memset_pattern16(*(void **)(a1 + 144), &xmmword_1866792D0, 8 * v11);
    }
    else if (v11)
    {
      v12 = *(double **)(a1 + 144);
      do
      {
        *v12 = *v12 + v10;
        ++v12;
        --v11;
      }
      while (v11);
    }
    -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](a1, a2, 1, v10);
  }
  return -[UISectionRowData headerSize](a1);
}

- (uint64_t)_rowForPoint:(int64_t)a3 beginningWithRow:(double)a4 numberOfRows:(double)a5 extraHitSpaceBetweenRows:(double)a6
{
  uint64_t v6;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  int64_t v14;
  float v15;
  double v16;
  const void *v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  double v21;
  __int128 v22;

  *(double *)&v22 = a4;
  if (result)
  {
    v6 = result;
    if (!*(_QWORD *)(result + 32))
      return 0x7FFFFFFFFFFFFFFFLL;
    v10 = a5 - -[UITableViewRowData offsetForSection:](*(_QWORD *)(result + 96), result);
    *((double *)&v22 + 1) = v10;
    v11 = -[UISectionRowData offsetForRow:adjustedForGap:](v6, a2, 0);
    if (v10 < v11 || v10 > *(double *)(v6 + 40))
      return 0x7FFFFFFFFFFFFFFFLL;
    if (a3 != 1)
    {
      v12 = *(_QWORD *)(v6 + 96);
      if (!*(_BYTE *)(v12 + 72))
      {
        v17 = (const void *)(*(_QWORD *)(v6 + 144) + 8 * a2);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __88__UISectionRowData__rowForPoint_beginningWithRow_numberOfRows_extraHitSpaceBetweenRows___block_invoke;
        v19[3] = &unk_1E16E4170;
        v19[4] = v6;
        v20 = v22;
        v21 = a6;
        v18 = bsearch_b((char *)&v22 + 8, v17, a3, 8uLL, v19);
        if (v18)
          return ((uint64_t)v18 - *(_QWORD *)(v6 + 144)) >> 3;
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (a3 < 1)
        return 0x7FFFFFFFFFFFFFFFLL;
      v13 = *(double *)(v12 + 144);
      v14 = a3 + a2;
      result = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        v15 = *(float *)(*(_QWORD *)(v6 + 136) + 4 * a2);
        if (v15 < -1.0)
          v15 = -v15;
        v16 = v15;
        if (v10 < v11 + v16 + a6)
          break;
        v11 = v11 + v13 + v16;
        if (++a2 >= v14)
          return result;
      }
    }
    return a2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UISectionRowData *v4;
  UITableViewRowData *rowData;
  UISectionRowData *v6;
  UISectionRowData *v7;
  float *v8;
  double *v9;
  objc_super v11;

  v4 = [UISectionRowData alloc];
  if (v4)
  {
    rowData = self->_rowData;
    v11.receiver = v4;
    v11.super_class = (Class)UISectionRowData;
    v6 = -[UISectionRowData init](&v11, sel_init);
    v7 = v6;
    if (v6)
      v6->_rowData = rowData;
  }
  else
  {
    v7 = 0;
  }
  v7->_valid = self->_valid;
  v7->_headerSize = self->_headerSize;
  v7->_footerHeight = self->_footerHeight;
  v7->_headerOffset = self->_headerOffset;
  v7->_footerOffset = self->_footerOffset;
  v7->_numRows = self->_numRows;
  v7->_arrayLength = self->_arrayLength;
  v8 = (float *)malloc_type_malloc(4 * self->_arrayLength, 0x100004052888210uLL);
  v7->_rowHeights = v8;
  memcpy(v8, self->_rowHeights, 4 * self->_arrayLength);
  v9 = (double *)malloc_type_malloc(8 * self->_arrayLength, 0x100004000313F17uLL);
  v7->_rowOffsets = v9;
  memcpy(v9, self->_rowOffsets, 8 * self->_arrayLength);
  v7->_sectionHeight = self->_sectionHeight;
  v7->_sectionOffset = self->_sectionOffset;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_rowHeights);
  free(self->_rowOffsets);
  v3.receiver = self;
  v3.super_class = (Class)UISectionRowData;
  -[UISectionRowData dealloc](&v3, sel_dealloc);
}

- (double)_headerFooterSizeForSection:(void *)a3 inTable:(uint64_t)a4 withTitle:(uint64_t)a5 detailText:(uint64_t)a6 isHeader:(int)a7 stripPaddingForAbuttingView:(uint64_t)a8 isTopHeader:
{
  UITableViewHeaderFooterView *v15;
  UITableViewHeaderFooterView *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v36;

  HIDWORD(v36) = a7;
  objc_msgSend(a3, "_prepareForRowDataHeaderFooterSizing");
  v15 = (UITableViewHeaderFooterView *)*(id *)(*(_QWORD *)(a1 + 96) + 16);
  if (v15)
  {
    v16 = v15;
    -[UITableViewHeaderFooterView prepareForReuse](v15, "prepareForReuse");
  }
  else
  {
    v16 = -[UITableViewHeaderFooterView initWithReuseIdentifier:]([UITableViewHeaderFooterView alloc], "initWithReuseIdentifier:", 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 96) + 16), v16);
  }
  v17 = 72;
  if ((_DWORD)a6)
    v17 = 64;
  v18 = *(_QWORD *)(a1 + v17);
  if (_UITableViewHeadersFootersUseModernConfiguration() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v36) = 0;
    objc_msgSend(a3, "_configureTableHeaderFooterView:forHeader:section:floating:withTitle:detailText:textAlignment:fromClient:", v16, a6, a2, 0, a4, a5, v18, v36);
    v19 = 1;
  }
  else
  {
    -[UITableViewHeaderFooterView setTable:](v16, "setTable:", a3);
    objc_msgSend(a3, "_constants");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewHeaderFooterView _setConstants:](v16, "_setConstants:", v20);

    -[UITableViewHeaderFooterView setTableViewStyle:](v16, "setTableViewStyle:", objc_msgSend(a3, "_tableStyle"));
    -[UITableViewHeaderFooterView setSectionHeader:](v16, "setSectionHeader:", a6);
    -[UITableViewHeaderFooterView setTextAlignment:](v16, "setTextAlignment:", v18);
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewHeaderFooterView textLabel](v16, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewHeaderFooterView detailTextLabel](v16, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[UITableViewHeaderFooterView textLabel](v16, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", a4);

    -[UITableViewHeaderFooterView detailTextLabel](v16, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", a5);

    objc_msgSend(a3, "_headerFooterLeadingMarginWidthIsHeader:isFirstSection:", a6, a8);
    -[UITableViewHeaderFooterView _setMarginWidth:](v16, "_setMarginWidth:");
    objc_msgSend(a3, "_headerFooterTrailingMarginWidth");
    -[UITableViewHeaderFooterView _setRightMarginWidth:](v16, "_setRightMarginWidth:");
    v27 = 88;
    if ((_DWORD)a6)
      v27 = 80;
    -[UITableViewHeaderFooterView setMaxTitleWidth:](v16, "setMaxTitleWidth:", *(double *)(a1 + v27));
    -[UIView setNeedsLayout](v16, "setNeedsLayout");
    v19 = 0;
  }
  objc_msgSend(a3, "_tableContentInset");
  v30 = *(double *)(*(_QWORD *)(a1 + 96) + 24) - (v29 + v28);
  -[UITableViewHeaderFooterView setFrame:](v16, "setFrame:", v28, 0.0, v30, 0.0);
  if (v19)
  {
    LODWORD(v31) = 1148846080;
    LODWORD(v32) = 1112014848;
    -[UITableViewHeaderFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v30, 3.40282347e38, v31, v32);
  }
  else
  {
    -[UITableViewHeaderFooterView _sizeThatFits:stripPaddingForAbuttingView:isTopHeader:](v16, "_sizeThatFits:stripPaddingForAbuttingView:isTopHeader:", HIDWORD(v36), a8, v30, 3.40282347e38);
  }
  v34 = v33;

  return v34;
}

- (double)addOffset:(double)result fromRow:
{
  double v3;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  double *v8;

  if (a1)
  {
    v3 = result;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v5 >= a2;
    v7 = v5 - a2;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
    {
      if (v7 != 0 && v6)
        memset_pattern16((void *)(*(_QWORD *)(a1 + 144) + 8 * a2), &xmmword_1866792D0, 8 * v7);
    }
    else if (v7 != 0 && v6)
    {
      v8 = (double *)(*(_QWORD *)(a1 + 144) + 8 * a2);
      do
      {
        *v8 = *v8 + result;
        ++v8;
        --v7;
      }
      while (v7);
    }
    *(double *)(a1 + 56) = *(double *)(a1 + 56) + v3;
    result = *(double *)(a1 + 40) + v3;
    *(double *)(a1 + 40) = result;
  }
  return result;
}

- (double)deleteRowAtIndex:(double)result
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  float v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double *v10;
  _DWORD *v11;
  double v12;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 96);
    if (v3)
      v4 = *(double *)(v3 + 144);
    else
      v4 = 0.0;
    v5 = *(_QWORD *)(a1 + 136);
    v6 = *(float *)(v5 + 4 * a2);
    if (v6 < -1.0)
      v6 = -v6;
    v7 = v4 + v6;
    *(double *)(a1 + 40) = *(double *)(a1 + 40) - v7;
    v8 = *(_QWORD *)(a1 + 32);
    if (a2 + 1 < v8)
    {
      v9 = ~a2 + v8;
      v10 = (double *)(*(_QWORD *)(a1 + 144) + 8 * a2 + 8);
      v11 = (_DWORD *)(v5 + 4 * a2 + 4);
      do
      {
        *(v11 - 1) = *v11;
        if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
          v12 = 1.79769313e308;
        else
          v12 = *v10 - v7;
        *(v10++ - 1) = v12;
        ++v11;
        --v9;
      }
      while (v9);
    }
    result = *(double *)(a1 + 56) - v7;
    *(double *)(a1 + 56) = result;
    *(_QWORD *)(a1 + 32) = v8 - 1;
  }
  return result;
}

- (double)insertRowAtIndex:(uint64_t)a3 inSection:(uint64_t)a4 rowHeight:(double)result tableViewRowData:
{
  double v6;
  double v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  float v14;
  uint64_t v15;
  float v16;
  float v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  float v30;
  double v31;
  unint64_t v32;
  double *v33;
  float v34;
  double v35;
  void *v36;
  void *v37;

  if (!a1)
    return result;
  v6 = result;
  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertRowAtIndex_inSection_rowHeight_tableViewRowData_, a1, CFSTR("UITableViewRowData.m"), 814, CFSTR("Attempted to insert an out-of-bounds row %ld in section %ld"), a2, a3);

    if (a4)
      goto LABEL_4;
LABEL_42:
    v10 = 0.0;
    goto LABEL_5;
  }
  if (!a4)
    goto LABEL_42;
LABEL_4:
  v10 = *(double *)(a4 + 144);
LABEL_5:
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v11 + 1;
  if ((unint64_t)(v11 + 1) > *(_QWORD *)(a1 + 128))
    -[UISectionRowData allocateArraysWithCapacity:forSection:](a1, v11 + 1, a3);
  v12 = v11 - a2;
  if (v11 - a2 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertRowAtIndex_inSection_rowHeight_tableViewRowData_, a1, CFSTR("UITableViewRowData.m"), 826, CFSTR("Attempted to insert an out-of-bounds row %ld in section %ld"), a2, a3);

  }
  v13 = a2 + 1;
  memmove((void *)(*(_QWORD *)(a1 + 136) + 4 * (a2 + 1)), (const void *)(*(_QWORD *)(a1 + 136) + 4 * a2), 4 * v12);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 96) + 72))
    memmove((void *)(*(_QWORD *)(a1 + 144) + 8 * v13), (const void *)(*(_QWORD *)(a1 + 144) + 8 * a2), 8 * v12);
  v14 = v6;
  v15 = *(_QWORD *)(a1 + 136);
  *(float *)(v15 + 4 * a2) = v14;
  v16 = -v14;
  if (v14 >= -1.0)
    v17 = v14;
  else
    v17 = -v14;
  if (a4)
  {
    v18 = v17;
    if (*(double *)(a4 + 136) > v18)
      *(double *)(a4 + 136) = v18;
  }
  v19 = *(_QWORD *)(a1 + 96);
  if (*(_BYTE *)(v19 + 72))
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = v20 > a2;
    v22 = v20 - a2;
    if (v21)
      memset_pattern16((void *)(*(_QWORD *)(a1 + 144) + 8 * a2), &xmmword_1866792D0, 8 * v22);
  }
  else
  {
    v23 = a2 - 1;
    if (a2 < 1)
    {
      v27 = *(double *)(a1 + 112);
      if (v27 < -1.0)
        v27 = -v27;
      v26 = *(double *)(a1 + 48) + v27;
      if (v27 > 0.0)
      {
        objc_msgSend(*(id *)(v19 + 8), "_sectionHeaderToFirstRowPadding");
        v26 = v26 + v28;
        v14 = *(float *)(*(_QWORD *)(a1 + 136) + 4 * a2);
      }
      v24 = *(_QWORD *)(a1 + 144);
    }
    else
    {
      v24 = *(_QWORD *)(a1 + 144);
      v25 = *(float *)(v15 + 4 * v23);
      if (v25 < -1.0)
        v25 = -v25;
      v26 = v10 + *(double *)(v24 + 8 * v23) + v25;
    }
    *(double *)(v24 + 8 * a2) = v26;
    v29 = *(_QWORD *)(a1 + 32);
    v16 = -v14;
    if (v13 < v29)
    {
      if (v14 >= -1.0)
        v30 = v14;
      else
        v30 = -v14;
      v31 = v10 + v30;
      v32 = ~a2 + v29;
      v33 = (double *)(v24 + 8 * a2 + 8);
      do
      {
        *v33 = v31 + *v33;
        ++v33;
        --v32;
      }
      while (v32);
    }
  }
  if (v14 >= -1.0)
    v34 = v14;
  else
    v34 = v16;
  v35 = v10 + v34;
  *(double *)(a1 + 56) = *(double *)(a1 + 56) + v35;
  result = *(double *)(a1 + 40) + v35;
  *(double *)(a1 + 40) = result;
  return result;
}

+ (uint64_t)sectionLocationForRow:(uint64_t)a3 inSection:(uint64_t)a4 numRows:(uint64_t)a5 gapIndexPath:(void *)a6 rowSpacing:
{
  id v10;
  uint64_t v11;
  BOOL v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v16;
  unsigned int v17;

  v10 = a6;
  objc_opt_self();
  if (a1 > 0.0)
  {
    v11 = 4;
    goto LABEL_17;
  }
  if (!v10 || objc_msgSend(v10, "section") != a4)
  {
    objc_opt_self();
    v12 = a5 - 1 == a3;
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "row") > a3)
  {
    objc_opt_self();
    v12 = a5 == a3;
LABEL_8:
    if (v12)
      v13 = 4;
    else
      v13 = 2;
    if (v12)
      v14 = 3;
    else
      v14 = 1;
    if (a3)
      v11 = v14;
    else
      v11 = v13;
    goto LABEL_17;
  }
  if (a3 + 1 == a5)
    v16 = 4;
  else
    v16 = 2;
  if (a3 + 1 == a5)
    v17 = 3;
  else
    v17 = 1;
  if (a3 == -1)
    v11 = v16;
  else
    v11 = v17;
  objc_opt_self();
LABEL_17:

  return v11;
}

uint64_t __88__UISectionRowData__rowForPoint_beginningWithRow_numberOfRows_extraHitSpaceBetweenRows___block_invoke(uint64_t a1, uint64_t a2, double *a3)
{
  double v3;
  float v5;

  v3 = *(double *)(a1 + 48);
  if (v3 < *a3)
    return 0xFFFFFFFFLL;
  v5 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136)
                + 4 * (((uint64_t)a3 - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144)) >> 3));
  if (v5 < -1.0)
    v5 = -v5;
  return v3 >= *(double *)(a1 + 56) + *a3 + v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  float v6;
  const __CFString *v7;
  unint64_t numRows;
  double height;
  const __CFString *v10;
  void *v11;
  double footerHeight;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  objc_super v20;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{ "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{ "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numRows)
  {
    v5 = 0;
    do
    {
      v6 = self->_rowHeights[v5];
      if (v6 >= -1.0)
        v7 = &stru_1E16EDF20;
      else
        v7 = CFSTR("e");
      if (v6 < -1.0)
        v6 = -v6;
      objc_msgSend(v3, "appendFormat:", CFSTR("%@%g"), v7, v6);
      objc_msgSend(v4, "appendFormat:", CFSTR("%g"), -[UISectionRowData offsetForRow:adjustedForGap:]((uint64_t)self, v5, 1));
      numRows = self->_numRows;
      if (v5 < numRows - 1)
      {
        objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v4, "appendString:", CFSTR(", "));
        numRows = self->_numRows;
      }
      ++v5;
    }
    while (v5 < numRows);
  }
  objc_msgSend(v3, "appendString:", CFSTR(" }"));
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  height = self->_headerSize.height;
  if (height >= -1.0)
    v10 = &stru_1E16EDF20;
  else
    v10 = CFSTR("e");
  if (height < -1.0)
    height = -height;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%g"), v10, *(_QWORD *)&height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  footerHeight = self->_footerHeight;
  if (footerHeight >= -1.0)
    v13 = &stru_1E16EDF20;
  else
    v13 = CFSTR("e");
  if (footerHeight < -1.0)
    footerHeight = -footerHeight;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%g"), v13, *(_QWORD *)&footerHeight);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)UISectionRowData;
  -[UISectionRowData description](&v20, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_valid)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ valid: %@; section height: %g; section offset: %g; header height: %@; footer height: %@; header offset: %g; footer offset: %g; num rows: %ld; array length: %ld; row heights: %@ row offsets: %@"),
    v16,
    v17,
    *(_QWORD *)&self->_sectionHeight,
    -[UITableViewRowData offsetForSection:]((uint64_t)self->_rowData, (uint64_t)self),
    v11,
    v14,
    *(_QWORD *)&self->_headerOffset,
    *(_QWORD *)&self->_footerOffset,
    self->_numRows,
    self->_arrayLength,
    v3,
    v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
