@implementation UITableViewUpdateSupport

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UITableViewRowData numberOfRowsInSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UITableViewRowData numberOfRowsInSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UITableViewRowData numberOfRowsBeforeSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UITableViewRowData numberOfRowsBeforeSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

BOOL __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double MaxY;
  CGRect v39;
  CGRect v40;

  if (a2)
  {
    v6 = *(_DWORD *)(a2 + 20);
    if (a3)
    {
LABEL_3:
      v7 = *(_DWORD *)(a3 + 20);
      goto LABEL_4;
    }
  }
  else
  {
    v6 = 0;
    if (a3)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_4:
  if (v6 != v7)
    return 0;
  if (!a2)
  {
    v8 = 0;
    if (a3)
      goto LABEL_7;
LABEL_35:
    v9 = 0;
    goto LABEL_8;
  }
  v8 = *(void **)(a2 + 24);
  if (!a3)
    goto LABEL_35;
LABEL_7:
  v9 = *(void **)(a3 + 24);
LABEL_8:
  v10 = objc_msgSend(v8, "section");
  if (v10 == objc_msgSend(v9, "section"))
  {
    v11 = objc_msgSend(v8, "row");
    v12 = objc_msgSend(v9, "row");
    v13 = v11 - v12;
    if (v11 - v12 < 0)
      v13 = v12 - v11;
    if (v13 == 1)
      return 1;
  }
  v15 = objc_msgSend((id)a2, "compareIndexPaths:", a3);
  if (v15 == -1)
    v16 = a2;
  else
    v16 = a3;
  if (v15 == -1)
    v17 = a3;
  else
    v17 = a2;
  if (a2)
  {
    v18 = 72;
    if (!*(_DWORD *)(a2 + 20))
      v18 = 80;
  }
  else
  {
    v18 = 80;
  }
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v18);
  if (!v16)
  {
    v20 = 0;
    goto LABEL_25;
  }
  v20 = *(void **)(v16 + 24);
  if ((*(_BYTE *)(v16 + 16) & 1) == 0)
  {
LABEL_25:
    v21 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:](v19, objc_msgSend(v20, "row"), objc_msgSend(v20, "section"), 1);
    goto LABEL_27;
  }
  v21 = -[UITableViewRowData rectForSection:](v19, objc_msgSend(v20, "section"));
LABEL_27:
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  if (v17)
  {
    v29 = *(void **)(v17 + 24);
    if ((*(_BYTE *)(v17 + 16) & 1) != 0)
    {
      v30 = -[UITableViewRowData rectForSection:](v19, objc_msgSend(*(id *)(v17 + 24), "section"));
      goto LABEL_31;
    }
  }
  else
  {
    v29 = 0;
  }
  v30 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:](v19, objc_msgSend(v29, "row"), objc_msgSend(v29, "section"), 1);
LABEL_31:
  v34 = v30;
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v39.origin.x = v25;
  v39.origin.y = v26;
  v39.size.width = v27;
  v39.size.height = v28;
  MaxY = CGRectGetMaxY(v39);
  v40.origin.x = v34;
  v40.origin.y = v35;
  v40.size.width = v36;
  v40.size.height = v37;
  return MaxY == CGRectGetMinY(v40);
}

void __75___UITableViewUpdateSupport_Private___setupAnimationsForNewlyInsertedCells__block_invoke(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double MinY;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  uint64_t data_high;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  uint64_t v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  double MaxY;
  uint64_t v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v71;
  id v72;
  uint64_t v73;
  int64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CGFloat v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  uint64_t v88;
  double v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v125;
  void *v127;
  uint64_t v128;
  unint64_t v129;
  char v130;
  int v131;
  id *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  id v147;
  CGRect v148;
  CGRect v149;
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

  -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 80), a2);
  v147 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 80), a2, 1);
  v145 = v6;
  v146 = v5;
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
  while (1)
  {
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v9-- < 1;
    if (v12)
      break;
    if (-[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v11, v9) <= a2)
    {
      v11 = *(_QWORD *)(a1 + 32);
      break;
    }
  }
  v13 = v10;
  if (v10 < *(_QWORD *)(v11 + 248))
  {
    v13 = v10;
    do
    {
      if (-[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v11, v13) != 0x7FFFFFFFFFFFFFFFLL)
        break;
      ++v13;
      v11 = *(_QWORD *)(a1 + 32);
    }
    while (v13 < *(_QWORD *)(v11 + 248));
  }
  v14 = objc_msgSend(v147, "section");
  if (v10 < 1)
  {
    if (v10 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v45 = *(const __CFString **)(a1 + 40);
      if (v45)
      {
        data_high = SHIDWORD(v45->data);
        if (data_high > 3)
          v45 = CFSTR("unknown");
        else
          v45 = off_1E16E4280[data_high];
      }
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UITableViewSupport.m"), 873, CFSTR("Invalid prior old global row when computing beginning of old gap for %@ of row at index path %@"), v45, *(_QWORD *)(a1 + 48));

      v40 = 0.0;
      goto LABEL_55;
    }
    goto LABEL_13;
  }
  v15 = v14;
  v16 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](*(_QWORD *)(a1 + 32), v9);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 80), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "section") == v15;

LABEL_14:
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(v19 + 248);
  if (v10 >= v20)
  {
    if (!v147)
    {
      v40 = 0.0;
      v41 = 0.0;
      v42 = v13 - 1;
      if (v13 < 1)
        goto LABEL_74;
      goto LABEL_57;
    }
    if (*(_BYTE *)(a1 + 80))
    {
      v23 = objc_msgSend(v147, "section") + 1;
      while (1)
      {
        v24 = v23;
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(v25 + 240);
        if (v24 >= v26)
          break;
        v27 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v25, v24);
        v23 = v24 + 1;
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = *(_QWORD *)(a1 + 32);
          v26 = *(_QWORD *)(v25 + 240);
          break;
        }
      }
      v28 = *(_QWORD *)(v25 + 72);
      if (v24 >= v26)
      {
        v30 = -[UITableViewRowData rectForTableFooterView](*(_QWORD *)(v25 + 72));
      }
      else
      {
        v29 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v25, v24);
        v30 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v28, v29, 1);
      }
    }
    else
    {
      v47 = *(_QWORD *)(v19 + 72);
      v48 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v19, objc_msgSend(v147, "section"));
      v30 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v47, v48, 1);
    }
    MinY = CGRectGetMinY(*(CGRect *)&v30);
    goto LABEL_37;
  }
  v21 = !v18;
  if (v10 < 1)
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    MinY = -[_UITableViewUpdateSupport _startOfRowAfterRow:withRowData:](*(_QWORD *)(a1 + 32), v9, *(void **)(v19 + 72));
LABEL_37:
    v40 = MinY;
    goto LABEL_55;
  }
  -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v19 + 80), a2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v19, objc_msgSend(v34, "section"));

  -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 72), v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *(_QWORD *)(a1 + 32);
  if (v10 <= 0)
  {
    -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v37 + 80), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "section") - 1;
  }
  else
  {
    -[UITableViewRowData indexPathForRowAtGlobalRow:](*(_QWORD **)(v37 + 72), v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "section");
  }

  if (v39 < objc_msgSend(v36, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v39 + 1);
    v49 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v49;
  }
  if (v36)
    v50 = objc_msgSend(v36, "section");
  else
    v50 = 0x7FFFFFFFFFFFFFFFLL;
  if (v35 >= v50)
    v51 = v50;
  else
    v51 = v35;
  if (v51 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v36, "section") < v35 && objc_msgSend(v36, "row") >= 1)
  {
    v148.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 72), v10, 1);
    v52 = CGRectGetMinY(v148);
  }
  else
  {
    v52 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](*(_QWORD *)(a1 + 32), v51, *(void **)(*(_QWORD *)(a1 + 32) + 72));
  }
  v40 = v52;

LABEL_55:
  v42 = v13 - 1;
  if (v13 >= 1)
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(v19 + 248);
LABEL_57:
    if (v13 > v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      v55 = *(const __CFString **)(a1 + 40);
      if (v55)
      {
        v56 = SHIDWORD(v55->data);
        if (v56 > 3)
          v55 = CFSTR("unknown");
        else
          v55 = off_1E16E4280[v56];
      }
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UITableViewSupport.m"), 932, CFSTR("Invalid subsequent old global row when computing end of old gap for %@ of row at index path %@"), v55, *(_QWORD *)(a1 + 48));

      goto LABEL_71;
    }
    v149.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v19 + 72), v42, 1);
    MaxY = CGRectGetMinY(v149);
    goto LABEL_68;
  }
  if (!v147)
  {
LABEL_71:
    v41 = 0.0;
    goto LABEL_72;
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v57 = objc_msgSend(v147, "section");
    while (1)
    {
      v12 = v57-- < 1;
      if (v12)
        break;
      if (-[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](*(_QWORD *)(a1 + 32), v57) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v58 = *(_QWORD *)(a1 + 32);
        v59 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v58, v57);
        MaxY = -[_UITableViewUpdateSupport _startOfRowAfterFooterInSection:withRowData:](v58, v59, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
        goto LABEL_68;
      }
    }
    v150.origin.x = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    MaxY = CGRectGetMaxY(v150);
  }
  else
  {
    v79 = *(_QWORD *)(a1 + 32);
    v80 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v79, objc_msgSend(v147, "section"));
    MaxY = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v79, v80, *(void **)(*(_QWORD *)(a1 + 32) + 72));
  }
LABEL_68:
  v41 = MaxY;
LABEL_72:
  if (v41 < v40)
  {
LABEL_127:
    v94 = v40;
    goto LABEL_128;
  }
  v19 = *(_QWORD *)(a1 + 32);
LABEL_74:
  if (v10 < 1)
  {
    v66 = 0;
    goto LABEL_83;
  }
  if (v10 <= *(_QWORD *)(v19 + 248))
  {
    v61 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v19, v9);
    v19 = *(_QWORD *)(a1 + 32);
    goto LABEL_82;
  }
  v61 = *(_QWORD *)(v19 + 256);
  if (v61 >= -1)
  {
LABEL_82:
    v66 = v61 + 1;
LABEL_83:
    if (v66 < *(_QWORD *)(v19 + 256))
    {
      v67 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v19 + 80), v66, 1);
LABEL_85:
      v71 = CGRectGetMinY(*(CGRect *)&v67);
      goto LABEL_102;
    }
    v71 = v40;
    v72 = v147;
    if (v147)
    {
      if (*(_BYTE *)(a1 + 80))
      {
        v73 = objc_msgSend(v147, "section") + 1;
        while (1)
        {
          v74 = v73;
          v75 = *(_QWORD *)(a1 + 32);
          v76 = *(_QWORD *)(v75 + 232);
          if (v74 >= v76)
            break;
          v77 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v75, v74);
          v73 = v74 + 1;
          if (v77 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v75 = *(_QWORD *)(a1 + 32);
            v76 = *(_QWORD *)(v75 + 232);
            break;
          }
        }
        v78 = *(_QWORD *)(v75 + 80);
        if (v74 >= v76)
          v67 = -[UITableViewRowData rectForTableFooterView](v78);
        else
          v67 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v78, v74, 1);
        goto LABEL_85;
      }
      v151.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(_QWORD *)(v19 + 72), objc_msgSend(v147, "section"), 1);
      v81 = CGRectGetMinY(v151);
      v72 = v147;
      v71 = v81;
    }
    if ((v13 & 0x8000000000000000) == 0)
      goto LABEL_103;
LABEL_111:
    v89 = v41;
    if (!v72)
      goto LABEL_123;
    if (*(_BYTE *)(a1 + 80))
    {
      v90 = objc_msgSend(v147, "section");
      while (1)
      {
        v12 = v90-- < 1;
        if (v12)
          break;
        if (-[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](*(_QWORD *)(a1 + 32), v90) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v91 = -[_UITableViewUpdateSupport _startOfRowAfterFooterInSection:withRowData:](*(_QWORD *)(a1 + 32), v90, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
          goto LABEL_120;
        }
      }
      v153.origin.x = -[UITableViewRowData rectForTableHeaderView](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v91 = CGRectGetMaxY(v153);
    }
    else
    {
      v91 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](*(_QWORD *)(a1 + 32), objc_msgSend(v147, "section"), *(void **)(*(_QWORD *)(a1 + 32) + 80));
    }
    goto LABEL_120;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  v64 = *(const __CFString **)(a1 + 40);
  if (v64)
  {
    v65 = SHIDWORD(v64->data);
    if (v65 > 3)
      v64 = CFSTR("unknown");
    else
      v64 = off_1E16E4280[v65];
  }
  objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UITableViewSupport.m"), 954, CFSTR("Invalid prior new global row when computing beginning of new gap for %@ of row at index path %@"), v64, *(_QWORD *)(a1 + 48));

  v71 = v40;
LABEL_102:
  v72 = v147;
  if (v13 < 0)
    goto LABEL_111;
LABEL_103:
  v82 = *(_QWORD *)(a1 + 32);
  if (v13 >= *(_QWORD *)(v82 + 248))
    v83 = *(_QWORD *)(v82 + 256);
  else
    v83 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v82, v13);
  v72 = v147;
  if (v83 < 1)
    goto LABEL_111;
  v84 = *(_QWORD *)(a1 + 32);
  if (v83 <= *(_QWORD *)(v84 + 256))
  {
    v152.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(v84 + 80), v83 - 1, 1);
    v91 = CGRectGetMinY(v152);
LABEL_120:
    v89 = v91;
    goto LABEL_123;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v147);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  v87 = *(const __CFString **)(a1 + 40);
  if (v87)
  {
    v88 = SHIDWORD(v87->data);
    if (v88 > 3)
      v87 = CFSTR("unknown");
    else
      v87 = off_1E16E4280[v88];
  }
  objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UITableViewSupport.m"), 1020, CFSTR("Invalid subsequent new global row when computing end of new gap for %@ of row at index path %@"), v87, *(_QWORD *)(a1 + 48));

  v89 = v41;
LABEL_123:
  if (v41 <= v40)
    goto LABEL_127;
  v154.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 80), a2, 1);
  v92 = CGRectGetMinY(v154);
  v93 = 0.0;
  if (v89 > v71)
    v93 = (v92 - v71) / (v89 - v71);
  v94 = v40 + UIPixelBoundaryOffset(0, (v41 - v40) * v93, *(double *)(a1 + 72));
LABEL_128:
  v95 = *(_QWORD *)(a1 + 40);
  if (v95)
  {
    v96 = v4;
    switch(*(_QWORD *)(v95 + 32))
    {
      case 1:
        objc_msgSend(*(id *)(a1 + 56), "bounds");
        v96 = v4 + v97;
        goto LABEL_158;
      case 2:
        objc_msgSend(*(id *)(a1 + 56), "bounds");
        v96 = v4 - v98;
        goto LABEL_158;
      case 3:
        if (v40 <= v41)
        {
          v104 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
          v105 = objc_msgSend(v147, "row");
          v106 = objc_msgSend(v147, "section");
          if (v104)
            v107 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v104, v105, v106, 1, 1);
          else
            v107 = 0.0;
          v94 = v40 - v107;
        }
        else
        {
          if (objc_msgSend(v147, "row"))
            goto LABEL_134;
          v112 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
          v113 = objc_msgSend(v147, "row");
          v114 = objc_msgSend(v147, "section");
          if (v112)
            v115 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v112, v113, v114, 1, 1);
          else
            v115 = 0.0;
          v94 = v41 - v115;
        }
        break;
      case 4:
        if (v40 <= v41)
        {
          if (v40 != v41)
          {
            v155.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 72), v42, 1);
            v116 = v41 + CGRectGetHeight(v155);
            v117 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
            v118 = objc_msgSend(v147, "row");
            v119 = objc_msgSend(v147, "section");
            if (v117)
              v120 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v117, v118, v119, 1, 1);
            else
              v120 = 0.0;
            v94 = v116 + v120;
            break;
          }
          if (!objc_msgSend(v147, "row") && !(objc_msgSend(*(id *)(a1 + 48), "section") | v13))
          {
LABEL_134:
            v94 = v41;
            break;
          }
        }
        else
        {
          v99 = objc_msgSend(v147, "row");
          v94 = v40;
          v96 = v4;
          if (v99 != -[UITableViewRowData numberOfRowsInSection:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), objc_msgSend(*(id *)(a1 + 48), "section"))- 1)goto LABEL_158;
        }
        v108 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v109 = objc_msgSend(v147, "row");
        v110 = objc_msgSend(v147, "section");
        if (v108)
          v111 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v108, v109, v110, 1, 1);
        else
          v111 = 0.0;
        v94 = v41 + v111;
        break;
      case 5:
        goto LABEL_158;
      case 6:
        v100 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v101 = objc_msgSend(v147, "row");
        v102 = objc_msgSend(v147, "section");
        if (v100)
          v103 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v100, v101, v102, 1, 1)
               * 0.5;
        else
          v103 = 0.0;
        v94 = v94 - UIPixelBoundaryOffset(0, v103, *(double *)(a1 + 72));
        break;
      default:
        break;
    }
  }
  v96 = v4;
LABEL_158:
  v156.origin.x = v96;
  v143 = v94;
  v156.origin.y = v94;
  v156.size.width = v8;
  v156.size.height = v145;
  v160.origin.x = v4;
  v160.origin.y = v146;
  v160.size.width = v8;
  v160.size.height = v145;
  v157 = CGRectUnion(v156, v160);
  x = v157.origin.x;
  y = v157.origin.y;
  width = v157.size.width;
  v157.origin.x = v4;
  height = v157.size.height;
  v144 = v157.origin.x;
  v157.origin.y = v146;
  v157.size.width = v8;
  v157.size.height = v145;
  v125 = CGRectIntersectsRect(v157, *(CGRect *)(*(_QWORD *)(a1 + 32) + 160));
  v158.origin.x = x;
  v158.origin.y = y;
  v158.size.width = width;
  v158.size.height = height;
  if (CGRectIntersectsRect(v158, *(CGRect *)(*(_QWORD *)(a1 + 32) + 192)) && v125)
  {
    v127 = (void *)objc_msgSend(*(id *)(a1 + 56), "_createPreparedCellForGlobalRow:willDisplay:", a2, 1);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 8 * a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = *(_QWORD *)(a1 + 64);
      v140 = *(_QWORD *)(a1 + 32);
      -[_UITableViewUpdateSupport _collectionViewUpdateItems](v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "handleFailureInMethod:object:file:lineNumber:description:", v139, v140, CFSTR("UITableViewSupport.m"), 1107, CFSTR("Cannot animate inserted cell because it already has an animation. Updates: %@; Cell: %@"),
        v141,
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 8 * a2));

    }
    if (!v127)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UITableViewSupport.m"), 1108, CFSTR("Missing inserted cell to setup animations"));

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 8 * a2), v127);
    v128 = *(_QWORD *)(a1 + 40);
    if (!v128 || (v129 = *(_QWORD *)(v128 + 32), v129 <= 6) && ((1 << v129) & 0x47) != 0)
      objc_msgSend(v127, "setAlpha:", 0.0);
    objc_msgSend(v127, "setFrame:", v96, v143, v8, v145);
    v159.origin.x = v144;
    v159.origin.y = v146;
    v159.size.width = v8;
    v159.size.height = v145;
    v130 = !CGRectIntersectsRect(v159, *(CGRect *)(*(_QWORD *)(a1 + 32) + 160));
    v131 = objc_msgSend(*(id *)(a1 + 56), "_isEditingRowAtIndexPath:", v147);
    v132 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v127, v147, 1, 0, 0, v130, v131, v144, v146, v8, v145, 1.0, 0.0, 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "addObject:", v132);
    v133 = *(_QWORD *)(a1 + 40);
    if (v133 && v132 && *(_QWORD *)(v133 + 32) == 5)
      *((_BYTE *)v132 + 11) = 0;
    if (v131 && (objc_msgSend(*(id *)(a1 + 56), "_wasEditing") & 1) == 0)
      objc_msgSend(v127, "setEditing:", 0);
    v134 = *(_QWORD *)(a1 + 40);
    if (v134)
      v135 = *(_QWORD *)(v134 + 32);
    else
      v135 = 0;
    objc_msgSend(v127, "_animateFloatingSeparatorForInsertion:withRowAnimation:", 1, v135);
    v136 = *(_QWORD *)(a1 + 40);
    if (v136)
      v137 = *(_QWORD *)(v136 + 32);
    else
      v137 = 0;
    objc_msgSend(v127, "_animateInnerShadowForInsertion:withRowAnimation:", 1, v137);
    objc_msgSend(*(id *)(a1 + 56), "_addContentSubview:atBack:", v127, 1);

  }
}

id __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "row");
  v5 = objc_msgSend(a2, "section");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        if (v11)
        {
          if (*(_DWORD *)(v11 + 20) == 1)
            v12 = 1;
          else
            v12 = -1;
          v13 = *(void **)(v11 + 24);
          v14 = objc_msgSend(v13, "section", (_QWORD)v20);
          v15 = *(_BYTE *)(v11 + 16) & 1;
        }
        else
        {
          v14 = objc_msgSend(0, "section", (_QWORD)v20);
          v13 = 0;
          v15 = 0;
          v12 = -1;
        }
        if ((v15 & (v14 < v5)) != 0)
          v16 = v12;
        else
          v16 = 0;
        v5 += v16;
        if (v14 == v5)
        {
          if (objc_msgSend(v13, "row") >= v4)
            v17 = 0;
          else
            v17 = v12;
          v4 += v17;
        }
        ++v10;
      }
      while (v8 != v10);
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 = v18;
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_113(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v6 = (uint64_t)v5;
  if (v5)
  {
    if ((v5[16] & 2) != 0)
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v7)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 0);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v7, "addObject:", v6);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v11 + 24) && *(_QWORD *)(v6 + 32) == 100)
      *(_BYTE *)(v11 + 24) = 1;
  }
  _UIDataSourceUpdateFromUpdateItem(v6, a3);
}

void __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2_116(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
  v8[0] = CFSTR("Section");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("UpdateItem");
  v9[0] = v5;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

}

void __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3_120(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
  v8[0] = CFSTR("Section");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("UpdateItem");
  v9[0] = v5;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4_121(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addIndex:", a4);
}

@end
