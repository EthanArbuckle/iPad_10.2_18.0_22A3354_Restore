@implementation _UIFlowLayoutSection

- (_UIFlowLayoutItem)addItem
{
  _UIFlowLayoutItem *v2;
  _UIFlowLayoutItem *v3;

  if (a1)
  {
    v2 = objc_alloc_init(_UIFlowLayoutItem);
    v3 = v2;
    if (v2)
      objc_storeWeak((id *)&v2->_section, a1);
    objc_msgSend(a1[12], "addObject:", v3);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setHeaderDimension:(double)a3 forSection:
{
  double v4;
  double v6;
  double v7;
  unsigned __int8 *WeakRetained;
  int v9;

  if (a1)
  {
    v4 = a3 - *(double *)(a1 + 128);
    *(double *)(a1 + 128) = a3;
    if (v4 != 0.0)
    {
      v6 = *(double *)(a1 + 328);
      v7 = *(double *)(a1 + 336);
      WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (WeakRetained && (v9 = WeakRetained[97], WeakRetained, v9))
        v6 = v4 + v6;
      else
        v7 = v4 + v7;
      -[_UIFlowLayoutSection setEstimatedSize:forSection:](a1, a2, v6, v7);
    }
  }
}

- (void)setFooterDimension:(double)a3 forSection:
{
  double v4;
  double v6;
  double v7;
  unsigned __int8 *WeakRetained;
  int v9;

  if (a1)
  {
    v4 = a3 - *(double *)(a1 + 136);
    *(double *)(a1 + 136) = a3;
    if (v4 != 0.0)
    {
      v6 = *(double *)(a1 + 328);
      v7 = *(double *)(a1 + 336);
      WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (WeakRetained && (v9 = WeakRetained[97], WeakRetained, v9))
        v6 = v4 + v6;
      else
        v7 = v4 + v7;
      -[_UIFlowLayoutSection setEstimatedSize:forSection:](a1, a2, v6, v7);
    }
  }
}

- (_UIFlowLayoutSection)init
{
  _UIFlowLayoutSection *v2;
  NSMutableArray *v3;
  NSMutableArray *items;
  NSMutableArray *v5;
  NSMutableArray *rows;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIFlowLayoutSection;
  v2 = -[_UIFlowLayoutSection init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v2->_items;
    v2->_items = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rows = v2->_rows;
    v2->_rows = v5;

    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)&v2->_lineSpacing = _Q0;
  }
  return v2;
}

- (void)setEstimatedSize:(double)a3 forSection:(double)a4
{
  id WeakRetained;
  void *v10;
  double v11;
  id v12;

  if (a1)
  {
    if (*(double *)(a1 + 328) == a3 && *(double *)(a1 + 336) == a4)
    {
      *(double *)(a1 + 328) = a3;
      *(double *)(a1 + 336) = a4;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
      v10 = WeakRetained;
      if (WeakRetained && *((_BYTE *)WeakRetained + 97))
        v11 = a3 - CGRectGetWidth(*(CGRect *)(a1 + 312));
      else
        v11 = a4 - CGRectGetHeight(*(CGRect *)(a1 + 312));

      *(double *)(a1 + 328) = a3;
      *(double *)(a1 + 336) = a4;
      v12 = objc_loadWeakRetained((id *)(a1 + 144));
      -[_UIFlowLayoutInfo didUpdateSizeForSection:withDelta:]((uint64_t)v12, a2, v11);

    }
  }
}

- (double)frameForItemAtIndexPath:(uint64_t)a1
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  id *WeakRetained;
  id *v8;
  id v9;
  void *v10;
  id *v11;
  id *v12;
  id v13;
  int v14;
  uint64_t v15;
  double v16;
  double *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  double *v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *v35;
  int v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double MinX;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unsigned __int8 *v47;
  int v48;
  CGFloat v49;
  double v50;
  double v51;
  double MinY;
  double v53;
  CGFloat v54;
  double Width;
  double v56;
  double v57;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  if (!a1)
    return 0.0;
  v3 = objc_msgSend(a2, "item");
  v4 = *(_QWORD *)(a1 + 264);
  v6 = v3 >= v4;
  v5 = v3 - v4;
  v6 = !v6 || v5 >= *(_QWORD *)(a1 + 272);
  if (v6)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 144));
    v8 = WeakRetained;
    if (WeakRetained)
      v9 = objc_loadWeakRetained(WeakRetained + 15);
    else
      v9 = 0;
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "_shouldReverseLayoutDirection"))
    {
      v11 = (id *)objc_loadWeakRetained((id *)(a1 + 144));
      v12 = v11;
      if (v11)
        v13 = objc_loadWeakRetained(v11 + 15);
      else
        v13 = 0;
      v14 = objc_msgSend(v13, "_wantsRightToLeftHorizontalMirroringIfNeeded");

    }
    else
    {
      v14 = 1;
    }

    objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v3);
    v17 = (double *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v19 = v17[4];
      v18 = v17[5];
      v21 = v17[6];
      v20 = v17[7];
    }
    else
    {
      v18 = 0.0;
      v21 = 0.0;
      v20 = 0.0;
      v19 = 0.0;
    }

    v22 = *(void **)(a1 + 104);
    if (v3 >= *(_QWORD *)(a1 + 264))
    {
      objc_msgSend(v22, "lastObject");
      v42 = objc_claimAutoreleasedReturnValue();
      v24 = (double *)v42;
      if (v42)
        v43 = *(void **)(v42 + 40);
      else
        v43 = 0;
      v26 = v43;
      v44 = objc_msgSend(v26, "count");
      if (v44 <= 1)
        v45 = 1;
      else
        v45 = v44;
      v46 = v3 - (*(_QWORD *)(a1 + 264) + *(_QWORD *)(a1 + 272));
      v34 = v46 / v45;
      if (v24)
      {
        v30 = v24[9];
        v29 = v24[10];
        v32 = v24[11];
        v31 = v24[12];
      }
      else
      {
        v29 = 0.0;
        v32 = 0.0;
        v31 = 0.0;
        v30 = 0.0;
      }
      v33 = v46 % v45;
      v47 = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (v47)
      {
        v48 = v47[97];

        if (v48)
        {
          v37 = v30;
          v38 = v29;
          v39 = v32;
          v40 = v31;
          if (!v14)
            goto LABEL_26;
          goto LABEL_37;
        }
      }
      v65.origin.x = v30;
      v65.origin.y = v29;
      v65.size.width = v32;
      v65.size.height = v31;
      v54 = CGRectGetMaxY(v65) + *(double *)(a1 + 112);
      v66.origin.x = v30;
      v66.origin.y = v29;
      v66.size.width = v32;
      v66.size.height = v31;
      v51 = v54 + (CGRectGetHeight(v66) + *(double *)(a1 + 112)) * (double)v34;
      if (v14)
        goto LABEL_40;
    }
    else
    {
      objc_msgSend(v22, "firstObject");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (double *)v23;
      if (v23)
        v25 = *(void **)(v23 + 40);
      else
        v25 = 0;
      v26 = v25;
      v27 = objc_msgSend(v26, "count");
      v28 = *(_QWORD *)(a1 + 264) - v3;
      if (v24)
      {
        v30 = v24[9];
        v29 = v24[10];
        v32 = v24[11];
        v31 = v24[12];
      }
      else
      {
        v29 = 0.0;
        v32 = 0.0;
        v31 = 0.0;
        v30 = 0.0;
      }
      v33 = v27 + ~(v28 % v27);
      v34 = vcvtpd_s64_f64((double)v28 / (double)v27);
      v35 = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (v35)
      {
        v36 = v35[97];

        if (v36)
        {
          v37 = v30;
          v38 = v29;
          v39 = v32;
          v40 = v31;
          if (v14)
          {
LABEL_26:
            MinX = CGRectGetMinX(*(CGRect *)&v37);
            v59.origin.x = v30;
            v59.origin.y = v29;
            v59.size.width = v32;
            v59.size.height = v31;
            v16 = MinX - (CGRectGetWidth(v59) + *(double *)(a1 + 120)) * (double)v34;
LABEL_38:
            v50 = *(double *)(a1 + 280);
            v61.origin.x = v16;
            v61.origin.y = v18;
            v61.size.width = v21;
            v61.size.height = v20;
            v51 = v50 + (CGRectGetHeight(v61) + *(double *)(a1 + 112)) * (double)v33;
            goto LABEL_43;
          }
LABEL_37:
          v49 = CGRectGetMaxX(*(CGRect *)&v37) + *(double *)(a1 + 120);
          v60.origin.x = v30;
          v60.origin.y = v29;
          v60.size.width = v32;
          v60.size.height = v31;
          v16 = v49 + (CGRectGetWidth(v60) + *(double *)(a1 + 120)) * (double)v34;
          goto LABEL_38;
        }
      }
      v62.origin.x = v30;
      v62.origin.y = v29;
      v62.size.width = v32;
      v62.size.height = v31;
      MinY = CGRectGetMinY(v62);
      v63.origin.x = v30;
      v63.origin.y = v29;
      v63.size.width = v32;
      v63.size.height = v31;
      v51 = MinY - (CGRectGetHeight(v63) + *(double *)(a1 + 112)) * (double)v34;
      if (v14)
      {
LABEL_40:
        v53 = *(double *)(a1 + 288);
        v64.origin.x = v19;
        v64.origin.y = v51;
        v64.size.width = v21;
        v64.size.height = v20;
        v16 = v53 + (CGRectGetWidth(v64) + *(double *)(a1 + 120)) * (double)v33;
        goto LABEL_43;
      }
    }
    v67.origin.x = v30;
    v67.origin.y = v29;
    v67.size.width = v32;
    v67.size.height = v31;
    Width = CGRectGetWidth(v67);
    v56 = *(double *)(a1 + 288);
    v68.origin.x = v19;
    v68.origin.y = v51;
    v68.size.width = v21;
    v68.size.height = v20;
    v57 = Width - (v56 + (CGRectGetWidth(v68) + *(double *)(a1 + 120)) * (double)v33);
    v69.origin.x = v19;
    v69.origin.y = v51;
    v69.size.width = v21;
    v69.size.height = v20;
    v16 = v57 - CGRectGetWidth(v69);
LABEL_43:

    objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", v3);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      *(double *)(v15 + 32) = v16;
      *(double *)(v15 + 40) = v51;
      *(CGFloat *)(v15 + 48) = v21;
      *(CGFloat *)(v15 + 56) = v20;
      *(_BYTE *)(v15 + 8) |= 2u;
    }
    goto LABEL_45;
  }
  objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v3);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = *(double *)(v15 + 32);
  else
    v16 = 0.0;
LABEL_45:

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutInfo);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_invalidatedIndexPaths, 0);
}

- (uint64_t)computeLayout
{
  uint64_t v1;
  id *v2;
  _BYTE *WeakRetained;
  _BOOL4 v4;
  double *v5;
  double v6;
  id *v7;
  id *v8;
  id v9;
  void *v10;
  id *v11;
  id *v12;
  id v13;
  int v14;
  double v15;
  double v16;
  _QWORD *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD *v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  double v37;
  double v38;
  double *v39;
  double v40;
  double *v41;
  double v42;
  double v43;
  double *v44;
  double v45;
  double *v46;
  double v47;
  double *v48;
  double v49;
  double v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double *v55;
  double v56;
  double v57;
  _OWORD *v58;
  double v59;
  _QWORD *v60;
  uint64_t v61;
  double v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  double *v67;
  __int128 v68;
  double v69;
  _OWORD *v70;
  double v71;
  double v72;
  double v73;
  _QWORD *v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  double v80;
  __int128 v81;
  uint64_t v82;
  int v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  double v88;
  double v89;
  BOOL v90;
  uint64_t v91;
  void *v92;
  double v93;
  void *v94;
  id v95;
  double v96;
  _QWORD *v97;
  void *v98;
  double v99;
  double v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  double v114;
  double v115;
  _QWORD *v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  double MaxX;
  double v123;
  double v124;
  double v125;
  int v126;
  unint64_t v127;
  _BOOL4 v129;
  double v130;
  double v131;
  double v132;
  int v133;
  id *v134;
  double v135;
  double v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v2 = (id *)(result + 144);
  WeakRetained = objc_loadWeakRetained((id *)(result + 144));
  if (WeakRetained)
    v4 = WeakRetained[97] != 0;
  else
    v4 = 0;

  v5 = (double *)objc_loadWeakRetained(v2);
  if (v5)
    v6 = v5[14];
  else
    v6 = 0.0;

  v7 = (id *)objc_loadWeakRetained(v2);
  v8 = v7;
  if (v7)
    v9 = objc_loadWeakRetained(v7 + 15);
  else
    v9 = 0;
  objc_msgSend(v9, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_shouldReverseLayoutDirection"))
  {
    v11 = (id *)objc_loadWeakRetained(v2);
    v12 = v11;
    if (v11)
      v13 = objc_loadWeakRetained(v11 + 15);
    else
      v13 = 0;
    v14 = objc_msgSend(v13, "_wantsRightToLeftHorizontalMirroringIfNeeded");

  }
  else
  {
    v14 = 1;
  }

  if (*(_BYTE *)(v1 + 88))
  {
    v15 = *(double *)(v1 + 112);
    v16 = *(double *)(v1 + 120);
    v17 = (_QWORD *)(v1 + 344);
    v18 = *(double *)(v1 + 128);
    if (v4)
    {
      v19 = *(double *)(v1 + 296);
      v20 = *(double *)(v1 + 280);
      v6 = v6 - (v20 + v19);
      *(double *)(v1 + 152) = v18 + *(double *)(v1 + 288);
      v21 = *(double *)(v1 + 256);
      v135 = v6;
      v131 = *(double *)(v1 + 248);
      if (v18 > 0.0)
      {
        v22 = objc_loadWeakRetained(v2);
        v23 = 0;
        if (v22)
          v23 = v22[14];
        v130 = 0.0;
        *v17 = 0;
        *(_QWORD *)(v1 + 352) = 0;
        *(double *)(v1 + 360) = v18;
        *(_QWORD *)(v1 + 368) = v23;
LABEL_24:

        goto LABEL_27;
      }
      v28 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)v17 = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(v1 + 360) = v28;
      v130 = 0.0;
    }
    else
    {
      v19 = *(double *)(v1 + 304);
      v20 = *(double *)(v1 + 288);
      v6 = v6 - (v20 + v19);
      *(double *)(v1 + 152) = v18 + *(double *)(v1 + 280);
      v21 = *(double *)(v1 + 248);
      v130 = v6;
      v131 = *(double *)(v1 + 256);
      if (v18 > 0.0)
      {
        v22 = objc_loadWeakRetained(v2);
        v26 = 0;
        if (v22)
          v26 = v22[14];
        v135 = 0.0;
        v27 = *(_QWORD *)(v1 + 128);
        *v17 = 0;
        *(_QWORD *)(v1 + 352) = 0;
        *(_QWORD *)(v1 + 360) = v26;
        *(_QWORD *)(v1 + 368) = v27;
        goto LABEL_24;
      }
      v29 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)v17 = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(v1 + 360) = v29;
      v135 = 0.0;
    }
LABEL_27:
    v30 = *(double *)(v1 + 152);
    v31 = *(_QWORD *)(v1 + 208);
    if (v31 >= 1)
    {
      if (v21 > v6)
      {
        -[_UIFlowLayoutSection logInvalidSizesForHorizontalDirection:warnAboutDelegateValues:](v1, v4, 0);
        v31 = *(_QWORD *)(v1 + 208);
      }
      v32 = v16 + v21;
      v33 = vcvtmd_s64_f64((v16 + v6) / (v16 + v21));
      if ((unint64_t)v33 <= 1)
        v33 = 1;
      v34 = v31 / v33;
      *(_QWORD *)(v1 + 216) = v33;
      *(_QWORD *)(v1 + 224) = -1;
      v35 = v31 % v33;
      *(_BYTE *)(v1 + 89) = v31 % v33 != 0;
      if (v31 % v33)
        *(_QWORD *)(v1 + 224) = v34++;
      switch(*(_DWORD *)(v1 + 232))
      {
        case 0:
          *(double *)(v1 + 176) = v16;
          *(double *)(v1 + 160) = v20;
          v36 = (double *)objc_loadWeakRetained(v2);
          if (v36)
            v37 = v36[14];
          else
            v37 = 0.0;
          v38 = v37 - v20 - (v32 * (double)*(uint64_t *)(v1 + 216) - v16);
          goto LABEL_47;
        case 1:
          *(double *)(v1 + 176) = v16;
          v44 = (double *)objc_loadWeakRetained(v2);
          if (v44)
            v45 = v44[14];
          else
            v45 = 0.0;
          *(double *)(v1 + 160) = v20 + (v45 - (v19 + v20 + v32 * (double)*(uint64_t *)(v1 + 216) - v16)) * 0.5;

          *(_QWORD *)(v1 + 168) = *(_QWORD *)(v1 + 160);
          break;
        case 2:
          *(double *)(v1 + 176) = v16;
          v39 = (double *)objc_loadWeakRetained(v2);
          if (v39)
            v40 = v39[14];
          else
            v40 = 0.0;
          *(double *)(v1 + 160) = v40 - v19 - (v32 * (double)*(uint64_t *)(v1 + 216) - v16);

          *(double *)(v1 + 168) = v19;
          break;
        case 3:
          if (v33 > 1)
          {
            v46 = (double *)objc_loadWeakRetained(v2);
            if (v46)
              v47 = v46[14];
            else
              v47 = 0.0;
            *(double *)(v1 + 176) = (v47 - v20 - v19 - v21 * (double)*(uint64_t *)(v1 + 216))
                                  / (double)(*(_QWORD *)(v1 + 216) - 1);

            *(double *)(v1 + 160) = v20;
            *(double *)(v1 + 168) = v19;
          }
          else
          {
            *(double *)(v1 + 176) = v16;
            v41 = (double *)objc_loadWeakRetained(v2);
            v42 = 0.0;
            if (v41)
              v42 = v41[14];
            *(double *)(v1 + 160) = v20 + (v42 - v21 - v20 - v19) * 0.5;

            v36 = (double *)objc_loadWeakRetained(v2);
            v43 = 0.0;
            if (v36)
              v43 = v36[14];
            v38 = v19 + (v43 - v21 - v20 - v19) * 0.5;
LABEL_47:
            *(double *)(v1 + 168) = v38;

          }
          break;
        default:
          *(double *)(v1 + 176) = v16;
          *(double *)(v1 + 160) = v20;
          break;
      }
      if (*(_BYTE *)(v1 + 89))
      {
        switch(*(_DWORD *)(v1 + 236))
        {
          case 1:
            *(double *)(v1 + 200) = v16;
            v48 = (double *)objc_loadWeakRetained(v2);
            if (v48)
              v54 = v48[14];
            else
              v54 = 0.0;
            v50 = v20 + (v54 - (v19 + v20 + v32 * (double)v35 - v16)) * 0.5;
            goto LABEL_70;
          case 2:
            *(double *)(v1 + 200) = v16;
            v48 = (double *)objc_loadWeakRetained(v2);
            if (v48)
              v49 = v48[14];
            else
              v49 = 0.0;
            v50 = v49 - v19 - (v32 * (double)v35 - v16);
LABEL_70:
            *(double *)(v1 + 184) = v50;
            goto LABEL_71;
          case 3:
            if (v35 > 1)
            {
              v55 = (double *)objc_loadWeakRetained(v2);
              if (v55)
                v56 = v55[14];
              else
                v56 = 0.0;
              *(double *)(v1 + 200) = (v56 - (v32 * (double)v35 - v16) - v20 - v19) / (double)(v35 - 1);

LABEL_75:
              *(double *)(v1 + 184) = v20;
            }
            else
            {
              *(double *)(v1 + 200) = v16;
              v51 = (double *)objc_loadWeakRetained(v2);
              v52 = 0.0;
              v53 = 0.0;
              if (v51)
                v53 = v51[14];
              *(double *)(v1 + 184) = v20 + (v53 - v21 - v20 - v19) * 0.5;

              v48 = (double *)objc_loadWeakRetained(v2);
              if (v48)
                v52 = v48[14];
              *(double *)(v1 + 168) = v19 + (v52 - v21 - v20 - v19) * 0.5;
LABEL_71:

            }
            break;
          default:
            *(double *)(v1 + 200) = v16;
            goto LABEL_75;
        }
      }
      v30 = v30 + (v15 + v131) * (double)v34 - v15;
    }
    v57 = *(double *)(v1 + 136);
    v58 = (_OWORD *)(v1 + 376);
    if (v4)
    {
      v59 = v30 + *(double *)(v1 + 304);
      if (v57 <= 0.0)
      {
        v66 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
        *v58 = *MEMORY[0x1E0C9D648];
        *(_OWORD *)(v1 + 392) = v66;
        v25 = v135;
      }
      else
      {
        v60 = objc_loadWeakRetained(v2);
        v25 = v135;
        if (v60)
          v61 = v60[14];
        else
          v61 = 0;
        *(double *)(v1 + 376) = v59;
        *(_QWORD *)(v1 + 384) = 0;
        *(double *)(v1 + 392) = v57;
        *(_QWORD *)(v1 + 400) = v61;

        v59 = v59 + *(double *)(v1 + 136);
      }
      v67 = (double *)objc_loadWeakRetained(v2);
      if (v67)
        v62 = v67[14];
      else
        v62 = 0.0;
      v24 = v59;
    }
    else
    {
      v62 = v30 + *(double *)(v1 + 296);
      if (v57 <= 0.0)
      {
        v68 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
        *v58 = *MEMORY[0x1E0C9D648];
        *(_OWORD *)(v1 + 392) = v68;
        v24 = v130;
      }
      else
      {
        v63 = objc_loadWeakRetained(v2);
        v24 = v130;
        if (v63)
          v64 = v63[14];
        else
          v64 = 0;
        v65 = *(_QWORD *)(v1 + 136);
        *(_QWORD *)(v1 + 376) = 0;
        *(double *)(v1 + 384) = v62;
        *(_QWORD *)(v1 + 392) = v64;
        *(_QWORD *)(v1 + 400) = v65;

        v62 = v62 + *(double *)(v1 + 136);
      }
      v67 = (double *)objc_loadWeakRetained(v2);
      if (v67)
        v59 = v67[14];
      else
        v59 = 0.0;
      v25 = v62;
    }
    *(_QWORD *)(v1 + 312) = 0;
    *(_QWORD *)(v1 + 320) = 0;
    *(double *)(v1 + 328) = v59;
    *(double *)(v1 + 336) = v62;

    if (*(_BYTE *)(v1 + 88))
      goto LABEL_171;
    goto LABEL_95;
  }
  v24 = 0.0;
  v25 = 0.0;
LABEL_95:
  v69 = *(double *)(v1 + 128);
  v70 = (_OWORD *)(v1 + 344);
  v134 = v2;
  v133 = v14;
  if (v4)
  {
    v71 = *(double *)(v1 + 288);
    v25 = v6 - (*(double *)(v1 + 280) + *(double *)(v1 + 296));
    v72 = *(double *)(v1 + 112);
    v73 = *(double *)(v1 + 120);
    if (v69 <= 0.0)
    {
      v79 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *v70 = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(v1 + 360) = v79;
    }
    else
    {
      v74 = objc_loadWeakRetained(v2);
      if (v74)
        v75 = v74[14];
      else
        v75 = 0;
      *(_QWORD *)v70 = 0;
      *(_QWORD *)(v1 + 352) = 0;
      *(double *)(v1 + 360) = v69;
      *(_QWORD *)(v1 + 368) = v75;

    }
    v80 = v25;
  }
  else
  {
    v71 = *(double *)(v1 + 280);
    v24 = v6 - (*(double *)(v1 + 288) + *(double *)(v1 + 304));
    v73 = *(double *)(v1 + 112);
    v72 = *(double *)(v1 + 120);
    if (v69 <= 0.0)
    {
      v81 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *v70 = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(v1 + 360) = v81;
    }
    else
    {
      v76 = objc_loadWeakRetained(v2);
      if (v76)
        v77 = v76[14];
      else
        v77 = 0;
      v78 = *(_QWORD *)(v1 + 128);
      *(_QWORD *)v70 = 0;
      *(_QWORD *)(v1 + 352) = 0;
      *(_QWORD *)(v1 + 360) = v77;
      *(_QWORD *)(v1 + 368) = v78;

    }
    v80 = v24;
  }
  v136 = v25;
  objc_msgSend(*(id *)(v1 + 104), "removeAllObjects");
  v82 = objc_msgSend(*(id *)(v1 + 96), "count");
  v83 = 1;
  if (v82 < 1)
  {
    v85 = 0;
    v98 = 0;
    v89 = v80;
    goto LABEL_135;
  }
  v84 = (char *)v82;
  v132 = v71;
  v85 = 0;
  v86 = 0;
  if (v4)
    v87 = 56;
  else
    v87 = 48;
  v88 = v80;
  v89 = v80;
  v90 = 1;
  do
  {
    objc_msgSend(*(id *)(v1 + 96), "objectAtIndexedSubscript:", v86);
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v91;
    if (v91)
      v93 = *(double *)(v91 + v87);
    else
      v93 = 0.0;
    if (v93 > v80)
      -[_UIFlowLayoutSection logInvalidSizesForHorizontalDirection:warnAboutDelegateValues:](v1, v4, 1);
    if (!v85)
    {
      -[_UIFlowLayoutSection addRowAtEnd:]((_QWORD *)v1, 1);
      v85 = objc_claimAutoreleasedReturnValue();
    }
    if (v93 <= v88)
    {
      -[_UIFlowLayoutRow addItem:atEnd:]((_QWORD *)v85, v92, 1);
      v96 = v88 - (v72 + v93);
      goto LABEL_130;
    }
    if (v85)
    {
      *(_BYTE *)(v85 + 9) = 1;
      if (!v90)
        goto LABEL_128;
      v94 = *(void **)(v85 + 40);
    }
    else
    {
      if (!v90)
      {
LABEL_128:
        v90 = 0;
        goto LABEL_129;
      }
      v94 = 0;
    }
    v95 = v94;
    v90 = objc_msgSend(v95, "count") == 1;

LABEL_129:
    v96 = v80 - (v72 + v93);
    -[_UIFlowLayoutRow layoutRow](v85);
    -[_UIFlowLayoutSection addRowAtEnd:]((_QWORD *)v1, 1);
    v97 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    -[_UIFlowLayoutRow addItem:atEnd:](v97, v92, 1);
    v85 = (uint64_t)v97;
    v89 = v88;
LABEL_130:

    ++v86;
    v88 = v96;
  }
  while (v84 != v86);
  if (!v85)
  {
    v83 = 1;
    if (!v90)
    {
      v126 = 0;
      v71 = v132;
      goto LABEL_177;
    }
    v80 = v96;
    v98 = 0;
    v71 = v132;
LABEL_135:
    v84 = v98;
    if (objc_msgSend(v84, "count") != 1)
    {
      v126 = 1;
      v96 = v80;
      goto LABEL_177;
    }

    v99 = v136;
    if ((v83 & 1) == 0)
      goto LABEL_137;
    goto LABEL_138;
  }
  *(_BYTE *)(v85 + 20) = *(_BYTE *)(v1 + 88);
  v71 = v132;
  v83 = 0;
  if (v90)
  {
    v98 = *(void **)(v85 + 40);
    v80 = v96;
    goto LABEL_135;
  }
  v126 = 0;
LABEL_177:
  v127 = objc_msgSend(*(id *)(v1 + 104), "count");
  v129 = v96 != v89 || v127 < 2;
  if (v126)

  v99 = v136;
  if (((v83 | v129) & 1) == 0)
LABEL_137:
    *(_BYTE *)(v85 + 9) = 1;
LABEL_138:
  v100 = v69 + v71;
  -[_UIFlowLayoutRow layoutRow](v85);
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v101 = *(id *)(v1 + 104);
  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
  if (v102)
  {
    v103 = v102;
    v104 = *(_QWORD *)v138;
    v105 = v134;
    v14 = v133;
    do
    {
      v106 = 0;
      do
      {
        if (*(_QWORD *)v138 != v104)
          objc_enumerationMutation(v101);
        v107 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * v106);
        if (v107)
        {
          v108 = *(_QWORD *)(v107 + 56);
          v109 = *(_QWORD *)(v107 + 64);
          if (v4)
            v110 = *(double *)(v107 + 56);
          else
            v110 = *(double *)(v107 + 64);
          if (v4)
            v111 = 0.0;
          else
            v111 = v100;
          if (v4)
            v112 = v100;
          else
            v112 = 0.0;
          *(double *)(v107 + 72) = v112;
          *(double *)(v107 + 80) = v111;
          *(_QWORD *)(v107 + 88) = v108;
          *(_QWORD *)(v107 + 96) = v109;
        }
        else
        {
          v110 = 0.0;
        }
        v100 = v100 + v73 + v110;
        ++v106;
      }
      while (v103 != v106);
      v113 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
      v103 = v113;
    }
    while (v113);
  }
  else
  {
    v105 = v134;
    v14 = v133;
  }

  v114 = v100 - v73;
  v115 = *(double *)(v1 + 136);
  if (v4)
  {
    v24 = v114 + *(double *)(v1 + 304);
    if (v115 > 0.0)
    {
      v116 = objc_loadWeakRetained(v105);
      if (v116)
        v117 = v116[14];
      else
        v117 = 0;
      *(double *)(v1 + 376) = v24;
      *(_QWORD *)(v1 + 384) = 0;
      *(double *)(v1 + 392) = v115;
      *(_QWORD *)(v1 + 400) = v117;

      v24 = v24 + *(double *)(v1 + 136);
      goto LABEL_170;
    }
LABEL_169:
    v121 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v1 + 376) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v1 + 392) = v121;
    goto LABEL_170;
  }
  v99 = v114 + *(double *)(v1 + 296);
  if (v115 <= 0.0)
    goto LABEL_169;
  v118 = objc_loadWeakRetained(v105);
  if (v118)
    v119 = v118[14];
  else
    v119 = 0;
  v120 = *(_QWORD *)(v1 + 136);
  *(_QWORD *)(v1 + 376) = 0;
  *(double *)(v1 + 384) = v99;
  *(_QWORD *)(v1 + 392) = v119;
  *(_QWORD *)(v1 + 400) = v120;

  v99 = v99 + *(double *)(v1 + 136);
LABEL_170:
  *(_QWORD *)(v1 + 312) = 0;
  *(_QWORD *)(v1 + 320) = 0;
  *(double *)(v1 + 328) = v24;
  *(double *)(v1 + 336) = v99;

LABEL_171:
  if (((v14 | !v4) & 1) == 0)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)(v1 + 312));
    v123 = MaxX - CGRectGetWidth(*(CGRect *)(v1 + 344));
    *(double *)(v1 + 344) = v123 - CGRectGetMinX(*(CGRect *)(v1 + 344));
    v124 = CGRectGetMaxX(*(CGRect *)(v1 + 312));
    v125 = v124 - CGRectGetWidth(*(CGRect *)(v1 + 376));
    *(double *)(v1 + 376) = v125 - CGRectGetMinX(*(CGRect *)(v1 + 376));
  }
  result = objc_msgSend(*(id *)(v1 + 96), "count");
  *(_QWORD *)(v1 + 264) = 0;
  *(_QWORD *)(v1 + 272) = result;
  return result;
}

- (_UIFlowLayoutRow)addRowAtEnd:(_QWORD *)a1
{
  _UIFlowLayoutRow *v4;
  _UIFlowLayoutRow *v5;
  void *v6;

  v4 = objc_alloc_init(_UIFlowLayoutRow);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_section, a1);
  v6 = (void *)a1[13];
  if (a2)
    objc_msgSend(v6, "addObject:", v5);
  else
    objc_msgSend(v6, "insertObject:atIndex:", v5, 0);
  return v5;
}

- (void)logInvalidSizesForHorizontalDirection:(int)a3 warnAboutDelegateValues:
{
  id *WeakRetained;
  id *v7;
  void *v8;
  id v9;

  NSLog(CFSTR("The behavior of the UICollectionViewFlowLayout is not defined because:"));
  if (a2)
    NSLog(&CFSTR("the item height must be less than the height of the UICollectionView minus the section insets top and bottom "
                 "values, minus the content insets top and bottom values.").isa);
  else
    NSLog(&CFSTR("the item width must be less than the width of the UICollectionView minus the section insets left and right va"
                 "lues, minus the content insets left and right values.").isa);
  if (a3)
    NSLog(CFSTR("Please check the values returned by the delegate."));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 144));
  v7 = WeakRetained;
  if (WeakRetained)
    v9 = objc_loadWeakRetained(WeakRetained + 15);
  else
    v9 = 0;

  objc_msgSend(v9, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("The relevant UICollectionViewFlowLayout instance is %@, and it is attached to %@."), v9, v8);

  NSLog(CFSTR("Make a symbolic breakpoint at UICollectionViewFlowLayoutBreakForInvalidSizes to catch this in the debugger."));
  UICollectionViewFlowLayoutBreakForInvalidSizes((uint64_t)v9);

}

- (void)logInvalidSizes
{
  id WeakRetained;
  _BOOL4 v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
  v4 = WeakRetained;
  if (WeakRetained)
    v3 = *((_BYTE *)WeakRetained + 97) != 0;
  else
    v3 = 0;
  -[_UIFlowLayoutSection logInvalidSizesForHorizontalDirection:warnAboutDelegateValues:](a1, v3, 1);

}

- (double)effectiveHeaderFrameWithSectionMarginsApplied
{
  double v2;
  unsigned __int8 *WeakRetained;
  int v4;

  if (!a1)
    return 0.0;
  v2 = *(double *)(a1 + 344);
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
  if (WeakRetained && (v4 = WeakRetained[97], WeakRetained, v4))
  {
    CGRectGetHeight(*(CGRect *)(a1 + 344));
  }
  else
  {
    v2 = *(double *)(a1 + 288);
    CGRectGetWidth(*(CGRect *)(a1 + 344));
  }
  return v2;
}

- (double)effectiveFooterFrameWithSectionMarginsApplied
{
  double v2;
  unsigned __int8 *WeakRetained;
  int v4;

  if (!a1)
    return 0.0;
  v2 = *(double *)(a1 + 376);
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
  if (WeakRetained && (v4 = WeakRetained[97], WeakRetained, v4))
  {
    CGRectGetHeight(*(CGRect *)(a1 + 376));
  }
  else
  {
    v2 = *(double *)(a1 + 288);
    CGRectGetWidth(*(CGRect *)(a1 + 376));
  }
  return v2;
}

- (uint64_t)addInvalidatedIndexPath:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;

  v4 = *(void **)(a1 + 80);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v5;

    v4 = *(void **)(a1 + 80);
  }
  return objc_msgSend(v4, "addObject:", a2);
}

- (void)computeLayoutInRect:(unsigned int)a3 forSection:(void *)a4 invalidating:(CGFloat)a5 invalidationContext:(CGFloat)a6
{
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  _BYTE *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id *v23;
  id *v24;
  id v25;
  void *v26;
  id *v27;
  id *v28;
  id v29;
  int v30;
  int v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double Width;
  uint64_t v41;
  double *v42;
  double *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  double *v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double Height;
  double *v65;
  double *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  __int128 v78;
  unsigned __int8 *v79;
  int v80;
  double MaxX;
  double MinX;
  double v83;
  CGFloat v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  double v93;
  CGRectEdge v94;
  int v95;
  double MaxY;
  double MinY;
  double v98;
  CGFloat v99;
  double v100;
  int v101;
  id v102;
  double *v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  double v110;
  uint64_t v111;
  int v112;
  int v113;
  uint64_t k;
  _QWORD *v115;
  _QWORD *v116;
  _BOOL4 v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id *v134;
  unsigned __int8 *v135;
  int v136;
  CGFloat v137;
  double v138;
  double v139;
  double v140;
  double v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _BYTE *v145;
  _BOOL4 v146;
  uint64_t (**v147)(_QWORD);
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  double v157;
  double v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  double v164;
  double v165;
  double v166;
  uint64_t v167;
  double v168;
  _QWORD *v169;
  _BYTE *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  double v176;
  void *v177;
  id v178;
  uint64_t v179;
  void *v180;
  int v181;
  void *v182;
  id v183;
  uint64_t v184;
  char v185;
  void *v186;
  id v187;
  double v188;
  double v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD *v193;
  void *v194;
  double v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  _QWORD *v201;
  void *v202;
  double v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  _QWORD *v215;
  void *v216;
  double v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  double v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  CGFloat v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  CGFloat v233;
  double v234;
  CGFloat v235;
  double v236;
  CGFloat v237;
  double v238;
  CGFloat v239;
  double v240;
  BOOL v241;
  void *v242;
  _QWORD *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  double v247;
  double v248;
  _QWORD *v249;
  double v250;
  uint64_t v251;
  CGFloat v252;
  _QWORD *v253;
  uint64_t v254;
  id v255;
  void *v256;
  id v257;
  void *v258;
  void *v259;
  id v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  _QWORD *v264;
  _QWORD *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  unint64_t v276;
  uint64_t v277;
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  CGFloat v289;
  CGFloat v290;
  double v291;
  double v292;
  CGFloat v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  CGRectEdge v301;
  CGFloat v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  CGRectEdge v312;
  double v313;
  double v314;
  char *v315;
  double v317;
  id obj;
  void *v321;
  double v322;
  uint64_t v323;
  double v324;
  id *v325;
  id *v326;
  uint64_t rect;
  CGFloat recta;
  id v329;
  double y;
  id v331;
  double x;
  id *location;
  id *locationa;
  id v335;
  uint64_t v336;
  char v337;
  id v338;
  double v339;
  uint64_t v340;
  double v341;
  CGSize v342;
  void *v343;
  CGPoint v344;
  int v345;
  int v346;
  double v347;
  id v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  CGRect remainder;
  __int128 v362;
  __int128 v363;
  CGRect v364;
  uint64_t v365;
  _BYTE v366[128];
  _BYTE v367[128];
  _BYTE v368[128];
  CGRect slice;
  uint64_t v370;
  double v371;
  double v372;
  BOOL v373;
  uint64_t v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;
  CGRect v387;
  CGRect v388;
  CGRect v389;
  CGRect v390;
  CGRect v391;
  CGRect v392;
  CGRect v393;
  CGRect v394;
  CGRect v395;
  CGRect v396;
  CGRect v397;
  CGRect v398;
  CGRect v399;
  CGRect v400;
  CGRect v401;
  CGRect v402;
  CGRect v403;
  CGRect v404;
  CGRect v405;
  CGRect v406;
  CGRect v407;
  CGRect v408;
  CGRect v409;
  CGRect v410;
  CGRect v411;
  CGRect v412;
  CGRect v413;
  CGRect v414;
  CGRect v415;
  CGRect v416;
  CGRect v417;
  CGRect v418;

  v374 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v357 = 0u;
  v358 = 0u;
  v359 = 0u;
  v360 = 0u;
  obj = *(id *)(a1 + 80);
  v325 = (id *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v368, 16);
  if (v325)
  {
    v323 = *(_QWORD *)v358;
    location = (id *)(a1 + 144);
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v358 != v323)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v357 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", objc_msgSend(v14, "item"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          WeakRetained = objc_loadWeakRetained((id *)(v15 + 24));
        else
          WeakRetained = 0;
        v329 = v16;
        v335 = WeakRetained;
        *(_QWORD *)&v364.origin.x = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v364.origin.y = 3221225472;
        *(_QWORD *)&v364.size.width = __61___UIFlowLayoutSection_sizeChangedForItem_atIndexPath_inRow___block_invoke;
        *(_QWORD *)&v364.size.height = &unk_1E16BE2A8;
        v365 = a1;
        v18 = objc_loadWeakRetained(location);
        if (v18)
          v19 = v18[97] != 0;
        else
          v19 = 0;

        v20 = objc_msgSend(*(id *)(a1 + 104), "indexOfObject:", v335);
        rect = v13;
        if (v335)
          v21 = (void *)*((_QWORD *)v335 + 5);
        else
          v21 = 0;
        v331 = v21;
        v22 = objc_msgSend(*(id *)(a1 + 104), "count");
        v23 = (id *)objc_loadWeakRetained(location);
        v24 = v23;
        if (v23)
          v25 = objc_loadWeakRetained(v23 + 15);
        else
          v25 = 0;
        objc_msgSend(v25, "collectionView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "_shouldReverseLayoutDirection"))
        {
          v27 = (id *)objc_loadWeakRetained(location);
          v28 = v27;
          v321 = v14;
          if (v27)
            v29 = objc_loadWeakRetained(v27 + 15);
          else
            v29 = 0;
          v30 = objc_msgSend(v29, "_wantsRightToLeftHorizontalMirroringIfNeeded");

          v31 = v30;
          v14 = v321;
        }
        else
        {
          v31 = 1;
        }

        if (v22 >= 1)
        {
          if (!v20)
          {
            v53 = objc_msgSend(v14, "item");
            v54 = objc_msgSend(v331, "indexOfObject:", v329);
            v55 = *(_QWORD *)(a1 + 264);
            if (v53 - v54 == v55)
            {
              if (v55)
              {
                v56 = objc_msgSend(v331, "count");
                v57 = *(_QWORD *)(a1 + 272) - v56;
                *(_QWORD *)(a1 + 264) += v56;
                *(_QWORD *)(a1 + 272) = v57;
                if (v335)
                {
                  v58 = *((double *)v335 + 7);
                  v59 = *((double *)v335 + 8);
                  if (v19)
                    goto LABEL_49;
LABEL_58:
                  v376.origin.x = *(CGFloat *)(a1 + 16);
                  v376.origin.y = *(double *)(a1 + 24) + v59 + *(double *)(a1 + 112);
                  *(CGFloat *)(a1 + 24) = v376.origin.y;
                  v376.size.width = *(CGFloat *)(a1 + 32);
                  v376.size.height = *(CGFloat *)(a1 + 40);
                  Height = CGRectGetHeight(v376);
                  v65 = (double *)(a1 + 112);
                  v58 = v59;
                  v66 = (double *)(a1 + 40);
                }
                else
                {
                  v59 = 0.0;
                  v58 = 0.0;
                  if (!v19)
                    goto LABEL_58;
LABEL_49:
                  v60 = *(double *)(a1 + 120);
                  v61 = v58 - v60;
                  v62 = v58 + v60;
                  v63 = -v61;
                  if (!v31)
                    v62 = v63;
                  v375.origin.y = *(CGFloat *)(a1 + 24);
                  v375.origin.x = *(double *)(a1 + 16) + v62;
                  *(CGFloat *)(a1 + 16) = v375.origin.x;
                  v375.size.width = *(CGFloat *)(a1 + 32);
                  v375.size.height = *(CGFloat *)(a1 + 40);
                  Height = CGRectGetWidth(v375);
                  v65 = (double *)(a1 + 120);
                  v66 = (double *)(a1 + 32);
                }
                *v66 = fmax(Height - (v58 + *v65), 0.0);
                memset(&remainder, 0, sizeof(remainder));
                v362 = 0u;
                v363 = 0u;
                v67 = v335;
                if (v335)
                  v67 = (void *)*((_QWORD *)v335 + 5);
                v68 = v67;
                v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &remainder, &slice, 16);
                if (v69)
                {
                  v70 = v69;
                  v71 = **(_QWORD **)&remainder.size.width;
                  do
                  {
                    for (i = 0; i != v70; ++i)
                    {
                      if (**(_QWORD **)&remainder.size.width != v71)
                        objc_enumerationMutation(v68);
                      v73 = *(_QWORD *)(*(_QWORD *)&remainder.origin.y + 8 * i);
                      if (v73)
                      {
                        *(_BYTE *)(v73 + 8) |= 2u;
                        objc_storeWeak((id *)(v73 + 24), 0);
                      }
                      (*(void (**)(CGRect *, uint64_t))&v364.size.width)(&v364, v73);
                    }
                    v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &remainder, &slice, 16);
                  }
                  while (v70);
                }

                objc_msgSend(*(id *)(a1 + 104), "removeObjectAtIndex:", 0);
                goto LABEL_71;
              }
            }
          }
          while (v22 > v20)
          {
            objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", --v22);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = (_QWORD *)v32;
            if (v32)
              v34 = *(void **)(v32 + 40);
            else
              v34 = 0;
            v35 = v34;
            *(_QWORD *)(a1 + 272) -= objc_msgSend(v35, "count");

            v36 = *(_QWORD *)(a1 + 16);
            v37 = *(_QWORD *)(a1 + 24);
            v38 = *(_QWORD *)(a1 + 32);
            v39 = *(_QWORD *)(a1 + 40);
            if (v19)
            {
              Width = CGRectGetWidth(*(CGRect *)&v36);
              if (v33)
              {
                v41 = 7;
                v42 = (double *)(a1 + 120);
                v43 = (double *)(a1 + 32);
                goto LABEL_30;
              }
              v51 = (double *)(a1 + 120);
              v52 = (double *)(a1 + 32);
LABEL_44:
              v44 = 0;
              *v52 = fmax(Width - (*v51 + 0.0), 0.0);
              memset(&remainder, 0, sizeof(remainder));
              v362 = 0u;
              v363 = 0u;
            }
            else
            {
              Width = CGRectGetHeight(*(CGRect *)&v36);
              if (!v33)
              {
                v51 = (double *)(a1 + 112);
                v52 = (double *)(a1 + 40);
                goto LABEL_44;
              }
              v41 = 8;
              v42 = (double *)(a1 + 112);
              v43 = (double *)(a1 + 40);
LABEL_30:
              *v43 = fmax(Width - (*(double *)&v33[v41] + *v42), 0.0);
              v362 = 0u;
              v363 = 0u;
              memset(&remainder, 0, sizeof(remainder));
              v44 = (void *)v33[5];
            }
            v45 = v44;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &remainder, &slice, 16);
            if (v46)
            {
              v47 = v46;
              v48 = **(_QWORD **)&remainder.size.width;
              do
              {
                for (j = 0; j != v47; ++j)
                {
                  if (**(_QWORD **)&remainder.size.width != v48)
                    objc_enumerationMutation(v45);
                  v50 = *(_QWORD *)(*(_QWORD *)&remainder.origin.y + 8 * j);
                  if (v50)
                  {
                    *(_BYTE *)(v50 + 8) |= 2u;
                    objc_storeWeak((id *)(v50 + 24), 0);
                  }
                  (*(void (**)(CGRect *, uint64_t))&v364.size.width)(&v364, v50);
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &remainder, &slice, 16);
              }
              while (v47);
            }

            objc_msgSend(*(id *)(a1 + 104), "removeObjectAtIndex:", v22);
            continue;
          }
        }
LABEL_71:

        v13 = rect + 1;
      }
      while ((id *)(rect + 1) != v325);
      v325 = (id *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v368, 16);
    }
    while (v325);
  }

  objc_msgSend(*(id *)(a1 + 80), "removeAllObjects");
  if (!CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    v414.origin.x = a5;
    v414.origin.y = a6;
    v414.size.width = a7;
    v414.size.height = a8;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v414)
      && !CGRectContainsRect(*(CGRect *)(a1 + 16), *(CGRect *)(a1 + 48)))
    {
      v74 = *(double *)(a1 + 48);
      v75 = *(double *)(a1 + 56);
      v76 = *(double *)(a1 + 64);
      v77 = *(double *)(a1 + 72);
      v78 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)(a1 + 48) = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(a1 + 64) = v78;
      -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](a1, a2, a3, a4, v74, v75, v76, v77);
    }
  }
  v79 = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
  if (v79)
  {
    v80 = v79[97];

    memset(&remainder, 0, sizeof(remainder));
    if (v80)
    {
      v377.origin.x = a5;
      v377.origin.y = a6;
      v377.size.width = a7;
      v377.size.height = a8;
      MaxX = CGRectGetMaxX(v377);
      if (MaxX > CGRectGetMaxX(*(CGRect *)(a1 + 16)))
      {
        v378.origin.x = a5;
        v378.origin.y = a6;
        v378.size.width = a7;
        v378.size.height = a8;
        MinX = CGRectGetMinX(v378);
        if (MinX < CGRectGetMinX(*(CGRect *)(a1 + 16)))
        {
          memset(&slice, 0, sizeof(slice));
          v83 = CGRectGetMinX(*(CGRect *)(a1 + 16));
          v379.origin.x = a5;
          v379.origin.y = a6;
          v379.size.width = a7;
          v379.size.height = a8;
          v84 = v83 - CGRectGetMinX(v379);
          v380.origin.x = a5;
          v380.origin.y = a6;
          v380.size.width = a7;
          v380.size.height = a8;
          CGRectDivide(v380, &slice, &remainder, v84, CGRectMinXEdge);
          v85 = a4;
          v86 = a2;
          v87 = a3;
          -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](a1, a2, a3, a4, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
          memset(&v364, 0, sizeof(v364));
          v381.origin.x = a5;
          v381.origin.y = a6;
          v381.size.width = a7;
          v381.size.height = a8;
          v88 = CGRectGetMaxX(v381);
          v89 = v88 - CGRectGetMaxX(*(CGRect *)(a1 + 16));
          v90 = a5;
          v91 = a6;
          v92 = a7;
          v93 = a8;
          v94 = CGRectMaxXEdge;
LABEL_87:
          CGRectDivide(*(CGRect *)&v90, &remainder, &v364, v89, v94);
          -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](a1, v86, v87, v85, v364.origin.x, v364.origin.y, v364.size.width, v364.size.height);
          return;
        }
      }
      v95 = 1;
      goto LABEL_89;
    }
  }
  else
  {
    memset(&remainder, 0, sizeof(remainder));
  }
  v382.origin.x = a5;
  v382.origin.y = a6;
  v382.size.width = a7;
  v382.size.height = a8;
  MaxY = CGRectGetMaxY(v382);
  if (MaxY > CGRectGetMaxY(*(CGRect *)(a1 + 16)))
  {
    v383.origin.x = a5;
    v383.origin.y = a6;
    v383.size.width = a7;
    v383.size.height = a8;
    MinY = CGRectGetMinY(v383);
    if (MinY < CGRectGetMinY(*(CGRect *)(a1 + 16)))
    {
      memset(&slice, 0, sizeof(slice));
      v98 = CGRectGetMinY(*(CGRect *)(a1 + 16));
      v384.origin.x = a5;
      v384.origin.y = a6;
      v384.size.width = a7;
      v384.size.height = a8;
      v99 = v98 - CGRectGetMinY(v384);
      v385.origin.x = a5;
      v385.origin.y = a6;
      v385.size.width = a7;
      v385.size.height = a8;
      CGRectDivide(v385, &slice, &remainder, v99, CGRectMinYEdge);
      v85 = a4;
      v86 = a2;
      v87 = a3;
      -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](a1, a2, a3, a4, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      memset(&v364, 0, sizeof(v364));
      v386.origin.x = a5;
      v386.origin.y = a6;
      v386.size.width = a7;
      v386.size.height = a8;
      v100 = CGRectGetMaxY(v386);
      v89 = v100 - CGRectGetMaxY(*(CGRect *)(a1 + 16));
      v90 = a5;
      v91 = a6;
      v92 = a7;
      v93 = a8;
      v94 = CGRectMaxYEdge;
      goto LABEL_87;
    }
  }
  v95 = 0;
LABEL_89:
  v342 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v344 = (CGPoint)*MEMORY[0x1E0C9D648];
  v364.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v364.size = v342;
  v387.origin.x = a5;
  v387.origin.y = a6;
  v387.size.width = a7;
  v387.size.height = a8;
  v322 = a5;
  if (CGRectIsEmpty(v387))
  {
LABEL_93:
    v364.origin = v344;
    v364.size = v342;
    a7 = *(double *)(a1 + 32);
    y = *(double *)(a1 + 24);
    x = *(double *)(a1 + 16);
    v101 = 1;
    a8 = *(double *)(a1 + 40);
    goto LABEL_94;
  }
  if (!CGRectIsEmpty(*(CGRect *)(a1 + 16)))
  {
    v416.origin.x = a5;
    v416.origin.y = a6;
    v416.size.width = a7;
    v416.size.height = a8;
    if (CGRectContainsRect(*(CGRect *)(a1 + 16), v416))
      goto LABEL_93;
    v417.origin.x = a5;
    v417.origin.y = a6;
    v417.size.width = a7;
    v417.size.height = a8;
    if (!CGRectIntersectsRect(*(CGRect *)(a1 + 16), v417))
    {
      v279 = *(_QWORD *)(a1 + 16);
      v280 = *(_QWORD *)(a1 + 24);
      v281 = *(_QWORD *)(a1 + 32);
      v282 = *(_QWORD *)(a1 + 40);
      if (v95)
      {
        v283 = CGRectGetMinX(*(CGRect *)&v279);
        v403.origin.x = a5;
        v403.origin.y = a6;
        v403.size.width = a7;
        v403.size.height = a8;
        if (v283 == CGRectGetMaxX(v403))
          goto LABEL_322;
        v284 = CGRectGetMaxX(*(CGRect *)(a1 + 16));
        v404.origin.x = a5;
        v404.origin.y = a6;
        v404.size.width = a7;
        v404.size.height = a8;
        v285 = CGRectGetMinX(v404);
      }
      else
      {
        v286 = CGRectGetMinY(*(CGRect *)&v279);
        v405.origin.x = a5;
        v405.origin.y = a6;
        v405.size.width = a7;
        v405.size.height = a8;
        if (v286 == CGRectGetMaxY(v405))
          goto LABEL_322;
        v284 = CGRectGetMaxY(*(CGRect *)(a1 + 16));
        v406.origin.x = a5;
        v406.origin.y = a6;
        v406.size.width = a7;
        v406.size.height = a8;
        v285 = CGRectGetMinY(v406);
      }
      if (v284 != v285)
      {
        *(_QWORD *)(a1 + 264) = 0;
        *(_QWORD *)(a1 + 272) = 0;
        objc_msgSend(*(id *)(a1 + 104), "removeAllObjects");
        v101 = 1;
        y = a6;
        x = a5;
        goto LABEL_94;
      }
    }
LABEL_322:
    v418.origin.x = a5;
    v418.origin.y = a6;
    v418.size.width = a7;
    v418.size.height = a8;
    v407 = CGRectUnion(*(CGRect *)(a1 + 16), v418);
    y = v407.origin.y;
    x = v407.origin.x;
    v287 = v407.size.width;
    v288 = v407.size.height;
    v289 = a5;
    v290 = a6;
    v291 = a7;
    v292 = a8;
    if (v95)
    {
      v293 = a5;
      v294 = CGRectGetMinX(*(CGRect *)&v289);
      if (v294 < CGRectGetMinX(*(CGRect *)(a1 + 16)))
      {
        v295 = CGRectGetMinX(*(CGRect *)(a1 + 16));
        v408.origin.x = v293;
        v408.origin.y = a6;
        v408.size.width = a7;
        v408.size.height = a8;
        v296 = v295 - CGRectGetMinX(v408);
        v298 = y;
        v297 = x;
        v299 = v287;
        v300 = v288;
        v301 = CGRectMinXEdge;
LABEL_327:
        CGRectDivide(*(CGRect *)&v297, &v364, &remainder, v296, v301);
        v101 = 0;
LABEL_334:
        a8 = v288;
        a7 = v287;
        goto LABEL_94;
      }
      v410.origin.x = v293;
      v410.origin.y = a6;
      v410.size.width = a7;
      v410.size.height = a8;
      v305 = CGRectGetMaxX(v410);
      if (v305 > CGRectGetMaxX(*(CGRect *)(a1 + 16)))
      {
        v411.origin.x = v293;
        v411.origin.y = a6;
        v411.size.width = a7;
        v411.size.height = a8;
        v306 = CGRectGetMaxX(v411);
        v307 = v306 - CGRectGetMaxX(*(CGRect *)(a1 + 16));
        v309 = y;
        v308 = x;
        v310 = v287;
        v311 = v288;
        v312 = CGRectMaxXEdge;
LABEL_332:
        CGRectDivide(*(CGRect *)&v308, &v364, &remainder, v307, v312);
      }
    }
    else
    {
      v302 = a5;
      v303 = CGRectGetMinY(*(CGRect *)&v289);
      if (v303 < CGRectGetMinY(*(CGRect *)(a1 + 16)))
      {
        v304 = CGRectGetMinY(*(CGRect *)(a1 + 16));
        v409.origin.x = v302;
        v409.origin.y = a6;
        v409.size.width = a7;
        v409.size.height = a8;
        v296 = v304 - CGRectGetMinY(v409);
        v298 = y;
        v297 = x;
        v299 = v287;
        v300 = v288;
        v301 = CGRectMinYEdge;
        goto LABEL_327;
      }
      v412.origin.x = v302;
      v412.origin.y = a6;
      v412.size.width = a7;
      v412.size.height = a8;
      v313 = CGRectGetMaxY(v412);
      if (v313 > CGRectGetMaxY(*(CGRect *)(a1 + 16)))
      {
        v413.origin.x = v302;
        v413.origin.y = a6;
        v413.size.width = a7;
        v413.size.height = a8;
        v314 = CGRectGetMaxY(v413);
        v307 = v314 - CGRectGetMaxY(*(CGRect *)(a1 + 16));
        v309 = y;
        v308 = x;
        v310 = v287;
        v311 = v288;
        v312 = CGRectMaxYEdge;
        goto LABEL_332;
      }
    }
    v101 = 1;
    goto LABEL_334;
  }
  v364.origin.x = a5;
  v364.origin.y = a6;
  v364.size.width = a7;
  v364.size.height = a8;
  v415.origin.x = a5;
  v415.origin.y = a6;
  v415.size.width = a7;
  v415.size.height = a8;
  v388 = CGRectUnion(*(CGRect *)(a1 + 16), v415);
  y = v388.origin.y;
  x = v388.origin.x;
  a7 = v388.size.width;
  a8 = v388.size.height;
  v101 = 1;
LABEL_94:
  v102 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v103 = (double *)objc_loadWeakRetained((id *)(a1 + 144));
  v104 = 0.0;
  v105 = 0.0;
  if (v103)
    v105 = v103[14];
  v326 = (id *)(a1 + 144);

  v106 = *(double *)(a1 + 120);
  v107 = 288;
  if (v95)
    v107 = 280;
  v108 = 304;
  if (v95)
    v108 = 296;
  v109 = *(double *)(a1 + v107);
  v110 = *(double *)(a1 + v108);
  v353 = 0u;
  v354 = 0u;
  v355 = 0u;
  v356 = 0u;
  v338 = *(id *)(a1 + 104);
  v340 = objc_msgSend(v338, "countByEnumeratingWithState:objects:count:", &v353, v367, 16);
  v343 = v102;
  if (v340)
  {
    v111 = *(_QWORD *)v354;
    LOBYTE(v112) = 1;
    v113 = 1;
    v336 = *(_QWORD *)v354;
    while (2)
    {
      for (k = 0; k != v340; ++k)
      {
        if (*(_QWORD *)v354 != v111)
          objc_enumerationMutation(v338);
        v115 = *(_QWORD **)(*((_QWORD *)&v353 + 1) + 8 * k);
        if (v115)
          v115 = (_QWORD *)v115[5];
        v116 = v115;
        v117 = (unint64_t)objc_msgSend(v116, "count") < 2;
        if ((v112 & 1) != 0)
        {
          v345 = v113;
          v351 = 0u;
          v352 = 0u;
          v349 = 0u;
          v350 = 0u;
          v118 = v116;
          v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v349, v366, 16);
          if (v119)
          {
            v120 = v119;
            v121 = *(_QWORD *)v350;
            do
            {
              v122 = 0;
              do
              {
                if (*(_QWORD *)v350 != v121)
                  objc_enumerationMutation(v118);
                v123 = *(_QWORD **)(*((_QWORD *)&v349 + 1) + 8 * v122);
                if (v95)
                {
                  if (v123)
                  {
                    v124 = v123[4];
                    v125 = v123[5];
                    v126 = v123[6];
                    v127 = v123[7];
                  }
                  else
                  {
                    v125 = 0;
                    v126 = 0;
                    v127 = 0;
                    v124 = 0;
                  }
                  v128 = CGRectGetHeight(*(CGRect *)&v124);
                }
                else
                {
                  if (v123)
                  {
                    v129 = v123[4];
                    v130 = v123[5];
                    v131 = v123[6];
                    v132 = v123[7];
                  }
                  else
                  {
                    v130 = 0;
                    v131 = 0;
                    v132 = 0;
                    v129 = 0;
                  }
                  v128 = CGRectGetWidth(*(CGRect *)&v129);
                }
                if (v104 == 0.0)
                {
                  v104 = v128;
                }
                else if (v104 != v128)
                {
                  v112 = 0;
                  goto LABEL_131;
                }
                ++v122;
              }
              while (v120 != v122);
              v133 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v349, v366, 16);
              v120 = v133;
            }
            while (v133);
          }
          v112 = 1;
LABEL_131:

          v113 = v345;
          v111 = v336;
        }
        else
        {
          v112 = 0;
        }
        v113 &= v117;

        if ((v113 | v112) != 1)
        {
          LOBYTE(v112) = 0;
          v113 = 0;
          v102 = v343;
          goto LABEL_138;
        }
        v102 = v343;
      }
      v340 = objc_msgSend(v338, "countByEnumeratingWithState:objects:count:", &v353, v367, 16);
      if (v340)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v112) = 1;
    v113 = 1;
  }
LABEL_138:

  if (CGRectIsEmpty(v364))
  {
    v337 = 0;
    goto LABEL_140;
  }
  v317 = a6;
  v337 = 0;
  v315 = sel_computeLayoutInRect_forSection_invalidating_invalidationContext_;
  v141 = v105 - (v109 + v110);
  locationa = *(id **)MEMORY[0x1E0C9D648];
  recta = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v324 = v106;
  do
  {
    v346 = v113;
    v142 = *(_QWORD *)(a1 + 264);
    if (v101)
    {
      v143 = *(_QWORD *)(a1 + 272);
      v144 = v143 + v142;
      if ((unint64_t)(v143 + v142) >= *(_QWORD *)(a1 + 208))
        break;
      if (v143)
        goto LABEL_168;
LABEL_152:
      v145 = objc_loadWeakRetained(v326);
      if (v145)
        v146 = v145[97] != 0;
      else
        v146 = 0;

      *(_QWORD *)&slice.origin.x = MEMORY[0x1E0C809B0];
      *(_QWORD *)&slice.origin.y = 3221225472;
      *(_QWORD *)&slice.size.width = __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke;
      *(_QWORD *)&slice.size.height = &unk_1E16BE2F8;
      v370 = a1;
      v371 = v322;
      v372 = v317;
      v373 = v146;
      v147 = (uint64_t (**)(_QWORD))_Block_copy(&slice);
      v148 = *(_QWORD *)(a1 + 16);
      v149 = *(_QWORD *)(a1 + 24);
      v150 = *(_QWORD *)(a1 + 32);
      v151 = *(_QWORD *)(a1 + 40);
      if (v146)
      {
        v152 = CGRectGetMinX(*(CGRect *)&v148);
        v153 = *(_QWORD *)(a1 + 16);
        v154 = *(_QWORD *)(a1 + 24);
        v155 = *(_QWORD *)(a1 + 32);
        v156 = *(_QWORD *)(a1 + 40);
        if (v322 < v152)
        {
          v157 = v322 / CGRectGetMinX(*(CGRect *)&v153);
LABEL_159:
          v163 = (double)*(unint64_t *)(a1 + 264);
LABEL_165:
          v144 = (uint64_t)(v157 * v163);
LABEL_167:

          goto LABEL_168;
        }
        if (v322 > CGRectGetMaxX(*(CGRect *)&v153))
        {
          v164 = v322 - CGRectGetMaxX(*(CGRect *)(a1 + 16));
          v165 = CGRectGetMaxX(*(CGRect *)(a1 + 312));
          v166 = CGRectGetMaxX(*(CGRect *)(a1 + 16));
LABEL_164:
          v157 = v164 / (v165 - v166);
          v163 = (double)(unint64_t)(*(_QWORD *)(a1 + 208) - (*(_QWORD *)(a1 + 264) + *(_QWORD *)(a1 + 272)));
          goto LABEL_165;
        }
      }
      else
      {
        v158 = CGRectGetMinY(*(CGRect *)&v148);
        v159 = *(_QWORD *)(a1 + 16);
        v160 = *(_QWORD *)(a1 + 24);
        v161 = *(_QWORD *)(a1 + 32);
        v162 = *(_QWORD *)(a1 + 40);
        if (v317 < v158)
        {
          v157 = v317 / CGRectGetMinY(*(CGRect *)&v159);
          goto LABEL_159;
        }
        if (v317 > CGRectGetMaxY(*(CGRect *)&v159))
        {
          v164 = v317 - CGRectGetMaxY(*(CGRect *)(a1 + 16));
          v165 = CGRectGetMaxY(*(CGRect *)(a1 + 312));
          v166 = CGRectGetMaxY(*(CGRect *)(a1 + 16));
          goto LABEL_164;
        }
      }
      v144 = v147[2](v147);
      goto LABEL_167;
    }
    if (!v142)
      break;
    if (!*(_QWORD *)(a1 + 272))
      goto LABEL_152;
    v144 = v142 - 1;
LABEL_168:
    -[_UIFlowLayoutSection addRowAtEnd:]((_QWORD *)a1, v101);
    v167 = objc_claimAutoreleasedReturnValue();
    v168 = v141;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", v144, v315);
      v169 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v170 = v169;
      if (v169)
      {
        v171 = v169[4];
        v172 = v169[5];
        v173 = v169[6];
        v174 = v169[7];
        if (v95)
          goto LABEL_171;
      }
      else
      {
        v172 = 0;
        v173 = 0;
        v174 = 0;
        v171 = 0;
        if (v95)
        {
LABEL_171:
          v175 = CGRectGetHeight(*(CGRect *)&v171);
          goto LABEL_174;
        }
      }
      v175 = CGRectGetWidth(*(CGRect *)&v171);
LABEL_174:
      v176 = v175;
      if (v175 > v141)
        -[_UIFlowLayoutSection logInvalidSizes](a1);
      if (v104 == 0.0)
        v104 = v176;
      v112 = (v176 == v104) & v112;
      if (v176 > v168)
      {
        v177 = v167 ? *(void **)(v167 + 40) : 0;
        v178 = v177;
        v179 = objc_msgSend(v178, "count");

        if (v179)
          break;
      }
      if (v170 && (v170[8] & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v144, a2);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addObject:", v180);

        v170[8] &= ~2u;
      }
      ++*(_QWORD *)(a1 + 272);
      if (!v101)
      {
        --*(_QWORD *)(a1 + 264);
        -[_UIFlowLayoutRow addItem:atEnd:]((_QWORD *)v167, v170, 0);
        v168 = v168 - (v106 + v176);
        if (v144 > 0)
        {
          --v144;
          goto LABEL_190;
        }
LABEL_192:
        if (v104 > v168)
          v181 = v112;
        else
          v181 = 0;
        v113 = v346;
        if ((v346 & 1) != 0)
        {
          if (v167)
            v182 = *(void **)(v167 + 40);
          else
            v182 = 0;
          v183 = v182;
          v184 = objc_msgSend(v183, "count");

          if (v184 == 1)
            v185 = 1;
          else
            v185 = v181;
          v113 = v346;
          if ((v185 & 1) == 0)
          {
LABEL_202:
            v102 = v343;
            if (v167)
              goto LABEL_212;
LABEL_208:
            -[_UIFlowLayoutRow layoutRow](v167);

            v188 = 0.0;
            v189 = 0.0;
            goto LABEL_213;
          }
        }
        else if (!v181)
        {
          goto LABEL_202;
        }
        v102 = v343;
        if (v167)
          goto LABEL_211;
        goto LABEL_208;
      }
      -[_UIFlowLayoutRow addItem:atEnd:]((_QWORD *)v167, v170, 1);
      v168 = v168 - (v106 + v176);
      if (++v144 >= *(_QWORD *)(a1 + 208))
        goto LABEL_192;
LABEL_190:

    }
    if ((v346 & 1) == 0)
    {
      v113 = 0;
      if (v167)
        goto LABEL_211;
      goto LABEL_208;
    }
    if (v167)
      v186 = *(void **)(v167 + 40);
    else
      v186 = 0;
    v187 = v186;
    v113 = (unint64_t)objc_msgSend(v187, "count") < 2;

    if (!v167)
      goto LABEL_208;
LABEL_211:
    *(_BYTE *)(v167 + 9) = 1;
LABEL_212:
    *(_BYTE *)(v167 + 20) = v112;
    -[_UIFlowLayoutRow layoutRow](v167);

    v189 = *(double *)(v167 + 56);
    v188 = *(double *)(v167 + 64);
LABEL_213:
    v347 = v189;
    v190 = objc_msgSend(*(id *)(a1 + 104), "count");
    v191 = v190;
    if (v101)
    {
      v192 = v190 - 2;
      if (v95)
      {
        v339 = a8;
        if (v190 < 2)
        {
          v195 = a7;
          v200 = *(double *)(a1 + 128) + *(double *)(a1 + 288);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", v192);
          v193 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v194 = v193;
          v195 = a7;
          if (v193)
          {
            v196 = v193[9];
            v197 = v193[10];
            v198 = v193[11];
            v199 = v193[12];
          }
          else
          {
            v197 = 0;
            v198 = 0;
            v199 = 0;
            v196 = 0;
          }
          v200 = CGRectGetMaxX(*(CGRect *)&v196) + *(double *)(a1 + 112);

        }
        v397.origin.x = v200;
        v397.origin.y = recta;
        v397.size.width = v347;
        v397.size.height = v188;
        v233 = CGRectGetMaxX(v397) + *(double *)(a1 + 120);
        v234 = v233 - CGRectGetMinX(v364);
        if (v234 > 0.0)
        {
          v364.origin.x = v234 + v364.origin.x;
          v364.size.width = v364.size.width - v234;
        }
        v398.origin.x = v200;
        v398.origin.y = recta;
        v398.size.width = v347;
        v398.size.height = v188;
        v235 = CGRectGetMaxX(v398) + *(double *)(a1 + 120);
        v399.origin.y = y;
        v399.origin.x = x;
        v399.size.width = v195;
        v399.size.height = v339;
        v236 = v235 - CGRectGetMaxX(v399);
        if (v236 <= 0.0)
          v236 = -0.0;
        v341 = v195 + v236;
        v209 = recta;
      }
      else
      {
        v341 = a7;
        if (v190 < 2)
        {
          v217 = a8;
          v209 = *(double *)(a1 + 128) + *(double *)(a1 + 280);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", v192);
          v215 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v216 = v215;
          v217 = a8;
          if (v215)
          {
            v218 = v215[9];
            v219 = v215[10];
            v220 = v215[11];
            v221 = v215[12];
          }
          else
          {
            v219 = 0;
            v220 = 0;
            v221 = 0;
            v218 = 0;
          }
          v209 = CGRectGetMaxY(*(CGRect *)&v218) + *(double *)(a1 + 112);

        }
        *(_QWORD *)&v400.origin.x = locationa;
        v400.origin.y = v209;
        v400.size.width = v347;
        v400.size.height = v188;
        v237 = CGRectGetMaxY(v400) + *(double *)(a1 + 112);
        v238 = v237 - CGRectGetMinY(v364);
        if (v238 > 0.0)
        {
          v364.origin.y = v238 + v364.origin.y;
          v364.size.height = v364.size.height - v238;
        }
        *(_QWORD *)&v401.origin.x = locationa;
        v401.origin.y = v209;
        v401.size.width = v347;
        v401.size.height = v188;
        v239 = CGRectGetMaxY(v401) + *(double *)(a1 + 112);
        v402.origin.y = y;
        v402.origin.x = x;
        v402.size.width = v341;
        v402.size.height = v217;
        v240 = v239 - CGRectGetMaxY(v402);
        if (v240 <= 0.0)
          v240 = -0.0;
        v339 = v217 + v240;
        v200 = *(double *)&locationa;
      }
    }
    else
    {
      if (v190 <= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v242, "handleFailureInMethod:object:file:lineNumber:description:", v315, a1, CFSTR("UIFlowLayoutSupport.m"), 1087, CFSTR("UICollectionViewFlowLayout internal error"));

      }
      objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", v191 - 2);
      v201 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v202 = v201;
      if (v95)
      {
        v339 = a8;
        v203 = a7;
        if (v201)
        {
          v204 = v201[9];
          v205 = v201[10];
          v206 = v201[11];
          v207 = v201[12];
        }
        else
        {
          v205 = 0;
          v206 = 0;
          v207 = 0;
          v204 = 0;
        }
        v208 = CGRectGetMinX(*(CGRect *)&v204);
        *(_QWORD *)&v389.origin.x = locationa;
        v389.origin.y = recta;
        v389.size.width = v347;
        v389.size.height = v188;
        v209 = v208 - (CGRectGetWidth(v389) + *(double *)(a1 + 120));

        v210 = CGRectGetMaxX(v364);
        *(_QWORD *)&v390.origin.x = locationa;
        v390.origin.y = v209;
        v390.size.width = v347;
        v390.size.height = v188;
        v211 = v210 - (CGRectGetMinX(v390) + *(double *)(a1 + 120));
        if (v211 > 0.0)
          v364.size.width = v364.size.width - v211;
        v391.origin.y = y;
        v391.origin.x = x;
        v391.size.width = v203;
        v391.size.height = v339;
        v212 = CGRectGetMinX(v391);
        v200 = *(double *)&locationa;
        *(_QWORD *)&v392.origin.x = locationa;
        v392.origin.y = v209;
        v392.size.width = v347;
        v392.size.height = v188;
        v213 = v212 - (CGRectGetMinX(v392) - *(double *)(a1 + 120));
        v214 = -0.0;
        if (v213 > 0.0)
          v214 = v213;
        v341 = v203 + v214;
        x = x - fmax(v213, 0.0);
      }
      else
      {
        v341 = a7;
        v222 = a8;
        if (v201)
        {
          v223 = v201[9];
          v224 = v201[10];
          v225 = v201[11];
          v226 = v201[12];
        }
        else
        {
          v224 = 0;
          v225 = 0;
          v226 = 0;
          v223 = 0;
        }
        v227 = CGRectGetMinY(*(CGRect *)&v223) + *(double *)(a1 + 128);
        *(_QWORD *)&v393.origin.x = locationa;
        v393.origin.y = recta;
        v393.size.width = v347;
        v393.size.height = v188;
        v209 = v227 - (CGRectGetHeight(v393) + *(double *)(a1 + 112));

        v228 = CGRectGetMaxY(v364);
        *(_QWORD *)&v394.origin.x = locationa;
        v394.origin.y = v209;
        v394.size.width = v347;
        v394.size.height = v188;
        v229 = v228 - (CGRectGetMinY(v394) + *(double *)(a1 + 112));
        if (v229 > 0.0)
          v364.size.height = v364.size.height - v229;
        v395.origin.x = x;
        v395.origin.y = y;
        v395.size.width = v341;
        v395.size.height = v222;
        v230 = CGRectGetMinY(v395);
        *(_QWORD *)&v396.origin.x = locationa;
        v396.origin.y = v209;
        v396.size.width = v347;
        v396.size.height = v188;
        v231 = v230 - (CGRectGetMinY(v396) - *(double *)(a1 + 112));
        v232 = -0.0;
        if (v231 > 0.0)
          v232 = v231;
        v339 = v222 + v232;
        y = y - fmax(v231, 0.0);
        v200 = *(double *)&locationa;
      }
      v106 = v324;
    }
    if (v167)
    {
      v241 = *(double *)(v167 + 88) != v347;
      if (*(double *)(v167 + 96) != v188)
        v241 = 1;
      *(double *)(v167 + 72) = v200;
      *(double *)(v167 + 80) = v209;
      *(double *)(v167 + 88) = v347;
      *(double *)(v167 + 96) = v188;
    }
    else
    {
      v241 = v347 != 0.0;
      if (v188 != 0.0)
        v241 = 1;
    }
    v337 |= v241;

    a8 = v339;
    a7 = v341;
  }
  while (!CGRectIsEmpty(v364));
LABEL_140:
  *(double *)(a1 + 16) = x;
  *(double *)(a1 + 24) = y;
  *(double *)(a1 + 32) = a7;
  *(double *)(a1 + 40) = a8;
  *(double *)(a1 + 48) = x;
  *(double *)(a1 + 56) = y;
  *(double *)(a1 + 64) = a7;
  *(double *)(a1 + 72) = a8;
  -[_UIFlowLayoutSection updateEstimatedSizeForSection:](a1, a2);
  if (v95)
  {
    v134 = (id *)(a1 + 144);
    v135 = (unsigned __int8 *)objc_loadWeakRetained(v326);
    if (v135 && (v136 = v135[98], v135, v136))
    {
      v137 = CGRectGetWidth(*(CGRect *)(a1 + 312));
      v138 = *(double *)(a1 + 128);
      v139 = v137 - *(double *)(a1 + 136);
      v140 = 0.0;
    }
    else
    {
      v252 = CGRectGetWidth(*(CGRect *)(a1 + 312));
      v138 = *(double *)(a1 + 128);
      v140 = v252 - v138;
      v139 = 0.0;
    }
    v253 = objc_loadWeakRetained(v326);
    v251 = 0;
    v254 = 0;
    if (v253)
      v254 = v253[14];
    *(double *)(a1 + 344) = v140;
    *(_QWORD *)(a1 + 352) = 0;
    *(double *)(a1 + 360) = v138;
    *(_QWORD *)(a1 + 368) = v254;

    v244 = *(_QWORD *)(a1 + 136);
    v249 = objc_loadWeakRetained(v326);
    if (v249)
      v251 = v249[14];
    *(double *)(a1 + 376) = v139;
    v250 = 0.0;
  }
  else
  {
    v134 = (id *)(a1 + 144);
    v243 = objc_loadWeakRetained(v326);
    v244 = 0;
    v245 = 0;
    if (v243)
      v245 = v243[14];
    v246 = *(_QWORD *)(a1 + 128);
    *(_QWORD *)(a1 + 344) = 0;
    *(_QWORD *)(a1 + 352) = 0;
    *(_QWORD *)(a1 + 360) = v245;
    *(_QWORD *)(a1 + 368) = v246;

    v247 = CGRectGetHeight(*(CGRect *)(a1 + 312));
    v248 = *(double *)(a1 + 136);
    v249 = objc_loadWeakRetained(v326);
    if (v249)
      v244 = v249[14];
    v250 = v247 - v248;
    v251 = *(_QWORD *)(a1 + 136);
    *(_QWORD *)(a1 + 376) = 0;
  }
  *(double *)(a1 + 384) = v250;
  *(_QWORD *)(a1 + 392) = v244;
  *(_QWORD *)(a1 + 400) = v251;

  if (a4 && objc_msgSend(v102, "count"))
  {
    objc_msgSend(a4, "setInvalidateFlowLayoutAttributes:", 0);
    objc_msgSend(a4, "setInvalidateFlowLayoutDelegateMetrics:", 0);
    if ((v337 & 1) != 0)
    {
      v348 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v255 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (*(double *)(a1 + 136) > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a2);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "addObject:", v256);

      }
      v257 = objc_loadWeakRetained(v134);
      v258 = v257;
      if (v257)
        v259 = (void *)*((_QWORD *)v257 + 13);
      else
        v259 = 0;
      v260 = v259;

      v261 = objc_msgSend(v260, "count");
      v262 = a2 + 1;
      if (a2 + 1 < v261)
      {
        v263 = v261;
        do
        {
          objc_msgSend(v260, "objectAtIndexedSubscript:", v262, v315);
          v264 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v265 = v264;
          if (v264)
          {
            v266 = v264[43];
            v267 = v264[44];
            v268 = v264[45];
            v269 = v264[46];
          }
          else
          {
            v267 = 0;
            v268 = 0;
            v269 = 0;
            v266 = 0;
          }
          if (!CGRectIsEmpty(*(CGRect *)&v266))
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v262);
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v348, "addObject:", v270);

          }
          if (v265)
          {
            v271 = v265[47];
            v272 = v265[48];
            v273 = v265[49];
            v274 = v265[50];
          }
          else
          {
            v272 = 0;
            v273 = 0;
            v274 = 0;
            v271 = 0;
          }
          if (!CGRectIsEmpty(*(CGRect *)&v271))
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v262);
            v275 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v255, "addObject:", v275);

          }
          if (v265)
          {
            v276 = v265[33];
            v277 = v265[34];
          }
          else
          {
            v277 = 0;
            v276 = 0;
          }
          if (v276 < v276 + v277)
          {
            do
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v276, v262);
              v278 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v343, "addObject:", v278);

              ++v276;
              --v277;
            }
            while (v277);
          }

          ++v262;
        }
        while (v262 != v263);
      }
      if (objc_msgSend(v348, "count", v315))
        objc_msgSend(a4, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionHeader"), v348);
      v102 = v343;
      if (objc_msgSend(v255, "count"))
        objc_msgSend(a4, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionFooter"), v255);

    }
    objc_msgSend(a4, "invalidateItemsAtIndexPaths:", v102, v315);
  }

}

- (void)updateEstimatedSizeForSection:(uint64_t)a1
{
  id *v4;
  _BYTE *WeakRetained;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double *v21;
  double *v22;
  uint64_t v23;
  double v24;
  double v25;
  double *v26;
  double v27;
  uint64_t v28;
  double v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  double v61;
  double v62;
  double v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  double *v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  uint64_t v78;
  unint64_t v79;
  double *v80;
  double v81;
  double v82;
  double *v83;
  double v84;
  double *v85;
  double *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v107 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (id *)(a1 + 144);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
    if (WeakRetained)
      v6 = WeakRetained[97] != 0;
    else
      v6 = 0;

    if (objc_msgSend(*(id *)(a1 + 96), "count"))
    {
      if (objc_msgSend(*(id *)(a1 + 104), "count"))
      {
        if (v6)
        {
          v101 = 0uLL;
          v102 = 0uLL;
          v99 = 0uLL;
          v100 = 0uLL;
          v7 = *(id *)(a1 + 104);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
          v9 = 0.0;
          v10 = 0.0;
          if (v8)
          {
            v11 = v8;
            v12 = *(_QWORD *)v100;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v100 != v12)
                  objc_enumerationMutation(v7);
                v14 = *(_QWORD **)(*((_QWORD *)&v99 + 1) + 8 * v13);
                if (v14)
                {
                  v15 = v14[9];
                  v16 = v14[10];
                  v17 = v14[11];
                  v18 = v14[12];
                }
                else
                {
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  v15 = 0;
                }
                v10 = v10 + CGRectGetWidth(*(CGRect *)&v15) + *(double *)(a1 + 112);
                ++v13;
              }
              while (v11 != v13);
              v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
              v11 = v19;
            }
            while (v19);
          }

          v20 = v10 * (double)(unint64_t)(*(_QWORD *)(a1 + 208) / *(_QWORD *)(a1 + 272))
              - *(double *)(a1 + 112)
              + *(double *)(a1 + 288)
              + *(double *)(a1 + 304)
              + *(double *)(a1 + 128)
              + *(double *)(a1 + 136);
          v21 = (double *)objc_loadWeakRetained(v4);
          v22 = v21;
          if (v21)
            v9 = v21[14];
          v23 = a1;
          v24 = v20;
        }
        else
        {
          v97 = 0uLL;
          v98 = 0uLL;
          v95 = 0uLL;
          v96 = 0uLL;
          v49 = *(id *)(a1 + 104);
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v96;
            v9 = 0.0;
            do
            {
              v53 = 0;
              do
              {
                if (*(_QWORD *)v96 != v52)
                  objc_enumerationMutation(v49);
                v54 = *(_QWORD **)(*((_QWORD *)&v95 + 1) + 8 * v53);
                if (v54)
                {
                  v55 = v54[9];
                  v56 = v54[10];
                  v57 = v54[11];
                  v58 = v54[12];
                }
                else
                {
                  v56 = 0;
                  v57 = 0;
                  v58 = 0;
                  v55 = 0;
                }
                v9 = v9 + CGRectGetHeight(*(CGRect *)&v55) + *(double *)(a1 + 112);
                ++v53;
              }
              while (v51 != v53);
              v59 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
              v51 = v59;
            }
            while (v59);
          }
          else
          {
            v9 = 0.0;
          }

          v79 = *(_QWORD *)(a1 + 272);
          if (v79)
            v9 = round(v9 * ((double)*(uint64_t *)(a1 + 208) / (double)v79))
               - *(double *)(a1 + 112)
               + *(double *)(a1 + 280)
               + *(double *)(a1 + 296)
               + *(double *)(a1 + 128)
               + *(double *)(a1 + 136);
          v80 = (double *)objc_loadWeakRetained(v4);
          v22 = v80;
          if (v80)
            v24 = v80[14];
          else
            v24 = 0.0;
          v23 = a1;
        }
        v81 = v9;
        goto LABEL_95;
      }
      v30 = (double *)objc_loadWeakRetained(v4);
      if (v6)
      {
        if (v30)
          v31 = v30[14];
        else
          v31 = 0.0;
        v32 = *(double *)(a1 + 280);
        v33 = *(double *)(a1 + 296);

        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v34 = *(id *)(a1 + 96);
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        if (v35)
        {
          v36 = v35;
          v37 = 0;
          v38 = v31 - (v32 + v33);
          v39 = *(_QWORD *)v92;
          v40 = 0.0;
          do
          {
            v41 = 0;
            v42 = v36 + v37;
            do
            {
              if (*(_QWORD *)v92 != v39)
                objc_enumerationMutation(v34);
              v43 = *(double **)(*((_QWORD *)&v91 + 1) + 8 * v41);
              if (v43)
              {
                v45 = v43[4];
                v44 = v43[5];
                v46 = v43[6];
                v47 = v43[7];
              }
              else
              {
                v44 = 0.0;
                v46 = 0.0;
                v47 = 0.0;
                v45 = 0.0;
              }
              v108.origin.x = v45;
              v108.origin.y = v44;
              v108.size.width = v46;
              v108.size.height = v47;
              if (CGRectGetHeight(v108) > v38)
              {
                v42 = v37 + v41;
                goto LABEL_80;
              }
              v109.origin.x = v45;
              v109.origin.y = v44;
              v109.size.width = v46;
              v109.size.height = v47;
              v38 = v38 - (CGRectGetHeight(v109) + *(double *)(a1 + 120));
              v110.origin.x = v45;
              v110.origin.y = v44;
              v110.size.width = v46;
              v110.size.height = v47;
              v40 = fmax(v40, CGRectGetWidth(v110));
              ++v41;
            }
            while (v36 != v41);
            v48 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
            v36 = v48;
            v37 = v42;
          }
          while (v48);
LABEL_80:

          if (v42)
            goto LABEL_87;
        }
        else
        {

          v40 = 0.0;
        }
        -[_UIFlowLayoutSection logInvalidSizes](a1);
        v42 = 1;
LABEL_87:
        v82 = *(double *)(a1 + 136)
            + *(double *)(a1 + 128)
            + *(double *)(a1 + 304)
            + *(double *)(a1 + 288)
            + (v40 + *(double *)(a1 + 112)) * (double)(uint64_t)(double)(*(_QWORD *)(a1 + 208) / v42)
            - *(double *)(a1 + 112);
        v83 = (double *)objc_loadWeakRetained(v4);
        v22 = v83;
        if (v83)
          v81 = v83[14];
        else
          v81 = 0.0;
        v23 = a1;
        v24 = v82;
LABEL_95:
        -[_UIFlowLayoutSection setEstimatedSize:forSection:](v23, a2, v24, v81);

        return;
      }
      if (v30)
        v61 = v30[14];
      else
        v61 = 0.0;
      v62 = *(double *)(a1 + 288);
      v63 = *(double *)(a1 + 304);

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v64 = *(id *)(a1 + 96);
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
      if (v65)
      {
        v66 = v65;
        v67 = 0;
        v68 = v61 - (v62 + v63);
        v69 = *(_QWORD *)v88;
        v70 = 0.0;
        do
        {
          v71 = 0;
          v72 = v66 + v67;
          do
          {
            if (*(_QWORD *)v88 != v69)
              objc_enumerationMutation(v64);
            v73 = *(double **)(*((_QWORD *)&v87 + 1) + 8 * v71);
            if (v73)
            {
              v75 = v73[4];
              v74 = v73[5];
              v76 = v73[6];
              v77 = v73[7];
            }
            else
            {
              v74 = 0.0;
              v76 = 0.0;
              v77 = 0.0;
              v75 = 0.0;
            }
            v111.origin.x = v75;
            v111.origin.y = v74;
            v111.size.width = v76;
            v111.size.height = v77;
            if (CGRectGetWidth(v111) > v68)
            {
              v72 = v67 + v71;
              goto LABEL_83;
            }
            v112.origin.x = v75;
            v112.origin.y = v74;
            v112.size.width = v76;
            v112.size.height = v77;
            v68 = v68 - (CGRectGetWidth(v112) + *(double *)(a1 + 120));
            v113.origin.x = v75;
            v113.origin.y = v74;
            v113.size.width = v76;
            v113.size.height = v77;
            v70 = fmax(v70, CGRectGetHeight(v113));
            ++v71;
          }
          while (v66 != v71);
          v78 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
          v66 = v78;
          v67 = v72;
        }
        while (v78);
LABEL_83:

        if (v72)
          goto LABEL_92;
      }
      else
      {

        v70 = 0.0;
      }
      -[_UIFlowLayoutSection logInvalidSizes](a1);
      v72 = 1;
LABEL_92:
      v84 = (v70 + *(double *)(a1 + 112)) * (double)(uint64_t)ceil((double)*(uint64_t *)(a1 + 208) / (double)v72)
          - *(double *)(a1 + 112);
      v85 = (double *)objc_loadWeakRetained(v4);
      v22 = v85;
      if (v85)
        v24 = v85[14];
      else
        v24 = 0.0;
      v81 = v84 + *(double *)(a1 + 280) + *(double *)(a1 + 296) + *(double *)(a1 + 128) + *(double *)(a1 + 136);
      v23 = a1;
      goto LABEL_95;
    }
    if (v6)
    {
      v25 = *(double *)(a1 + 288) + *(double *)(a1 + 304) + *(double *)(a1 + 128) + *(double *)(a1 + 136);
      v26 = (double *)objc_loadWeakRetained(v4);
      v86 = v26;
      if (v26)
        v27 = v26[14];
      else
        v27 = 0.0;
      v28 = a1;
      v29 = v25;
    }
    else
    {
      v60 = (double *)objc_loadWeakRetained(v4);
      v86 = v60;
      if (v60)
        v29 = v60[14];
      else
        v29 = 0.0;
      v27 = *(double *)(a1 + 280) + *(double *)(a1 + 296) + *(double *)(a1 + 128) + *(double *)(a1 + 136);
      v28 = a1;
    }
    -[_UIFlowLayoutSection setEstimatedSize:forSection:](v28, a2, v29, v27);

  }
}

@end
