@implementation VUIShelfLayoutHelper

- (VUIShelfLayoutHelper)initWithShelfViewLayout:(id)a3
{
  id v4;
  VUIShelfLayoutHelper *v5;
  VUIShelfLayoutHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIShelfLayoutHelper;
  v5 = -[VUIShelfLayoutHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfViewLayout, v4);
    -[VUIShelfLayoutHelper _compute](v6, "_compute");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[VUIShelfLayoutHelper _freeBuffers](self, "_freeBuffers");
  v3.receiver = self;
  v3.super_class = (Class)VUIShelfLayoutHelper;
  -[VUIShelfLayoutHelper dealloc](&v3, sel_dealloc);
}

- (CGRect)frameForHeaderInSection:(int64_t)a3
{
  double *p_x;
  CGRect *headerFrames;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  p_x = (double *)MEMORY[0x1E0C9D648];
  headerFrames = self->_headerFrames;
  if (headerFrames)
    p_x = &headerFrames[a3].origin.x;
  v5 = *p_x;
  v6 = p_x[1];
  v7 = p_x[2];
  v8 = p_x[3];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (UIEdgeInsets)insetForSection:(int64_t)a3
{
  double *p_top;
  UIEdgeInsets *sectionInsets;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  p_top = (double *)MEMORY[0x1E0DC49E8];
  sectionInsets = self->_sectionInsets;
  if (sectionInsets)
    p_top = &sectionInsets[a3].top;
  v5 = *p_top;
  v6 = p_top[1];
  v7 = p_top[2];
  v8 = p_top[3];
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGRect)frameForItemAtIndexPath:(id)a3
{
  CGRect *cellFrames;
  int64_t *sectionOffsets;
  id v5;
  int64_t v6;
  uint64_t v7;
  double *p_x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  cellFrames = self->_cellFrames;
  if (cellFrames)
  {
    sectionOffsets = self->_sectionOffsets;
    v5 = a3;
    v6 = sectionOffsets[objc_msgSend(v5, "section")];
    v7 = objc_msgSend(v5, "item");

    p_x = &cellFrames[v7 + v6].origin.x;
  }
  else
  {
    p_x = (double *)MEMORY[0x1E0C9D648];
  }
  v9 = *p_x;
  v10 = p_x[1];
  v11 = p_x[2];
  v12 = p_x[3];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_compute
{
  VUIShelfLayoutHelper *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
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
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  double v21;
  double v22;
  double v23;
  int64_t *v24;
  int64_t *v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  CGRect *v29;
  UIEdgeInsets *v30;
  uint64_t v31;
  double *p_x;
  CGRect *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  _BOOL4 v50;
  void *v51;
  double v52;
  double v53;
  double *v54;
  double v55;
  double v56;
  double v57;
  double *v58;
  int64_t v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  int64_t v67;
  _BOOL4 v69;
  UIEdgeInsets *v70;
  double right;
  double v72;
  double *v73;
  uint64_t v74;
  uint64_t p_height;
  double v76;
  uint64_t v77;
  uint64_t v78;
  double *v79;
  double v80;
  double v81;
  uint64_t v82;
  double *v83;
  double v84;
  uint64_t v85;
  double v86;
  double *v87;
  double v88;
  double v89;
  double v90;
  double *v91;
  uint64_t v92;
  double v93;
  double *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double *v100;
  double v101;
  double v102;
  double v103;
  int64_t v104;
  double v105;
  int64_t v106;
  double v107;
  double v108;
  int64_t v109;
  int64_t *v110;
  VUIShelfLayoutHelper *v111;
  double v112;
  double v113;
  double v114;
  CGRect *v115;
  char v116;
  char v117;
  double v118;
  double *v119;
  double v120;
  UIEdgeInsets *v121;
  UIEdgeInsets *v122;
  CGRect *v123;
  void *v124;
  double v125;
  uint64_t v126;
  int64_t v127;
  double v128;
  void *v129;
  id v130;

  v2 = self;
  -[VUIShelfLayoutHelper shelfViewLayout](self, "shelfViewLayout");
  v130 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  v117 = objc_opt_respondsToSelector();
  v7 = objc_opt_respondsToSelector();
  v129 = (void *)v5;
  v116 = objc_opt_respondsToSelector();
  objc_msgSend(v3, "vuiBounds");
  v9 = v8;
  objc_msgSend(v3, "vuiContentInsets");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v130, "itemSize");
  v15 = v14;
  v17 = v16;
  v18 = objc_msgSend(v130, "rowCount");
  if (v18 <= 1)
    v19 = 1;
  else
    v19 = v18;
  v126 = objc_msgSend(v130, "prominentSectionIndex");
  if ((v6 & 1) != 0)
    v20 = objc_msgSend(v4, "numberOfSectionsInCollectionView:", v3);
  else
    v20 = 1;
  objc_msgSend(v130, "minimumInteritemSpacing");
  v118 = v21;
  objc_msgSend(v130, "minimumLineSpacing");
  v23 = v22;
  v24 = (int64_t *)malloc_type_calloc(v20 + 1, 8uLL, 0x100004000313F17uLL);
  v25 = v24;
  v124 = v4;
  v127 = v20;
  v113 = v11;
  v114 = v9;
  v112 = v13;
  if (v20 < 1)
  {
    v115 = 0;
    v24[v20] = 0;
    v54 = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v122 = 0;
    v123 = 0;
    v128 = 0.0;
    v125 = 0.0;
    v55 = 0.0;
  }
  else
  {
    v26 = 0;
    v27 = 0;
    do
    {
      v28 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v3, v26);
      v25[v26] = v27;
      v27 += v28;
      ++v26;
    }
    while (v20 != v26);
    v25[v20] = v27;
    v111 = v2;
    if (v27 <= 0)
      v115 = 0;
    else
      v115 = (CGRect *)malloc_type_calloc(v27, 0x20uLL, 0x1000040E0EAB150uLL);
    v110 = v25;
    v29 = (CGRect *)malloc_type_calloc(v20, 0x20uLL, 0x1000040E0EAB150uLL);
    v30 = (UIEdgeInsets *)malloc_type_calloc(v20, 0x20uLL, 0x1000040E0EAB150uLL);
    v54 = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v31 = 0;
    v55 = 0.0;
    v122 = v30;
    v123 = v29;
    v125 = 0.0;
    p_x = &v29->origin.x;
    v128 = 0.0;
    v33 = v115;
    do
    {
      v34 = objc_msgSend(v124, "collectionView:numberOfItemsInSection:", v3, v31, v110);
      if (v34)
      {
        v35 = v34;
        if ((v116 & 1) != 0)
          objc_msgSend(v129, "collectionView:layout:insetForSectionAtIndex:", v3, v130, v31);
        else
          objc_msgSend(v130, "sectionInset");
        v40 = v36;
        v41 = v37;
        v42 = v38;
        v43 = v39;
        if ((v117 & 1) != 0)
          objc_msgSend(v129, "collectionView:layout:referenceSizeForHeaderInSection:", v3, v130, v31);
        else
          objc_msgSend(v130, "headerReferenceSize");
        v30->top = v40;
        v30->left = v41;
        v30->bottom = v42;
        v30->right = v43;
        ++v30;
        *((_QWORD *)p_x + 2) = v44;
        p_x[3] = v45;
        p_x += 4;
        v46 = v128;
        if (v128 < v40)
          v46 = v40;
        v128 = v46;
        v47 = v125;
        if (v125 < v42)
          v47 = v42;
        v125 = v47;
        if (v55 < v45)
          v55 = v45;
        if (v35 < 1)
        {
          v20 = v127;
        }
        else
        {
          v119 = p_x;
          v121 = v30;
          v48 = 0;
          v50 = v126 == 0x7FFFFFFFFFFFFFFFLL || v31 == v126;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v48, v31);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v15;
            v53 = v17;
            if ((v7 & 1) != 0)
              objc_msgSend(v129, "collectionView:layout:sizeForItemAtIndexPath:", v3, v130, v51, v15, v17);
            v33->size.width = v52;
            v33->size.height = v53;
            if (v50)
              v54[v48 % v19] = fmax(v54[v48 % v19], v53);
            ++v33;

            ++v48;
          }
          while (v35 != v48);
          v20 = v127;
          p_x = v119;
          v30 = v121;
        }
      }
      ++v31;
    }
    while (v31 != v20);
    v25 = v110;
    v2 = v111;
  }
  v56 = 0.0;
  v57 = 0.0;
  if (v19 >= 1)
  {
    v58 = v54;
    v59 = v19;
    do
    {
      v60 = *v58++;
      v57 = v57 + v60;
      --v59;
    }
    while (v59);
  }
  if (v55 > 0.0)
    objc_msgSend(v130, "headerBottomMargin", 0.0);
  v120 = v55;
  if (v20 >= 1)
  {
    v61 = 0;
    v62 = v57 + v23 * (double)(v19 - 1);
    v63 = v128 + v55 + v56;
    v64 = 0.0;
    v65 = 0.0;
    while (1)
    {
      v66 = objc_msgSend(v124, "collectionView:numberOfItemsInSection:", v3, v61);
      if (v66)
      {
        v67 = v25[v61];
        v69 = v126 == 0x7FFFFFFFFFFFFFFFLL || v61 == v126;
        v70 = &v122[v61];
        right = v70->right;
        v72 = v64 + v70->left;
        v73 = &v123[v61].origin.x;
        *v73 = v72;
        v73[1] = v128;
        if (v66 >= 1)
        {
          v74 = 0;
          p_height = (uint64_t)&v115[v67].size.height;
          while (1)
          {
            v76 = v74 <= 0 ? 0.0 : v118;
            if (v69)
            {
              v77 = (uint64_t)fmin((double)v19, (double)(v66 - v74));
            }
            else
            {
              v78 = v74;
              if (v66 > v74)
              {
                v79 = (double *)(p_height + 32 * v74);
                v80 = 0.0;
                v78 = v74;
                while (1)
                {
                  v81 = v78 <= v74 ? 0.0 : v23;
                  v80 = v80 + v81 + *v79;
                  if (v78 > v74 && v80 > v62)
                    break;
                  ++v78;
                  v79 += 4;
                  if (v66 == v78)
                  {
                    v78 = v66;
                    break;
                  }
                }
              }
              v77 = v78 - v74;
            }
            v82 = v77 + v74;
            if (v77 < 1)
            {
              v86 = 0.0;
              v84 = 0.0;
            }
            else
            {
              v83 = (double *)(p_height + 32 * v74);
              v84 = 0.0;
              v85 = v74;
              v86 = 0.0;
              do
              {
                v87 = v83;
                if (v69)
                  v87 = &v54[v85 % v19];
                v84 = v84 + *v87;
                v86 = fmax(v86, *(v83 - 1));
                ++v85;
                v83 += 4;
              }
              while (v85 < v82);
            }
            v88 = v72 + v76;
            v89 = v23;
            if (!v69)
            {
              v89 = 0.0;
              if (v77 > 1)
                break;
            }
            v90 = v63;
            if (v77 >= 1)
              goto LABEL_86;
LABEL_92:
            v65 = fmax(v65, v90 - v63);
            v72 = v88 + v86;
            v74 = v82;
            if (v82 >= v66)
            {
              v97 = *v73;
              goto LABEL_95;
            }
          }
          v89 = floor((v62 - v84) / (double)(v77 - 1));
LABEL_86:
          v91 = (double *)(p_height + 32 * v74);
          v92 = v74;
          v90 = v63;
          do
          {
            v93 = -0.0;
            if (v92 > v74)
              v93 = v89;
            v94 = v91;
            if (v69)
              v94 = &v54[v92 % v19];
            v95 = v90 + v93;
            v96 = *v94;
            *(v91 - 3) = v88 + floor((v86 - *(v91 - 1)) * 0.5);
            *(v91 - 2) = v95;
            v90 = v95 + v96;
            ++v92;
            v91 += 4;
          }
          while (v92 < v82);
          goto LABEL_92;
        }
        v97 = v72;
LABEL_95:
        v98 = v114 - (v113 + v112);
        if (v72 >= v98 || v61 != v20 - 1)
          v98 = v72;
        v101 = v73[2];
        v100 = v73 + 2;
        v102 = v101;
        v103 = v97 + v101;
        if (v103 > v98)
          *v100 = v102 - (v103 - v98);
        v64 = right + v72;
      }
      if (++v61 == v127)
        goto LABEL_106;
    }
  }
  v65 = 0.0;
LABEL_106:
  if (v19 < 1)
  {
    v104 = 0;
    v106 = v127;
    v107 = v120;
  }
  else
  {
    v104 = 0;
    v105 = 0.0;
    v106 = v127;
    v107 = v120;
    while (1)
    {
      v108 = v104 ? v23 : 0.0;
      v105 = v105 + v108 + v54[v104];
      if (v105 >= v65)
        break;
      if (v19 == ++v104)
      {
        v104 = v19;
        break;
      }
    }
  }
  v109 = v104 + 1;
  free(v54);
  -[VUIShelfLayoutHelper _freeBuffers](v2, "_freeBuffers");
  v2->_sectionCount = v106;
  v2->_sectionOffsets = v25;
  v2->_cellFrames = v115;
  v2->_headerFrames = v123;
  v2->_sectionInsets = v122;
  v2->_actualRowCount = v109;
  v2->_tallestInsetTop = v128;
  v2->_tallestInsetBottom = v125;
  v2->_tallestHeaderHeight = v107;
  v2->_tallestColumnHeight = v65;

}

- (void)_freeBuffers
{
  int64_t *sectionOffsets;
  CGRect *cellFrames;
  CGRect *headerFrames;
  UIEdgeInsets *sectionInsets;

  sectionOffsets = self->_sectionOffsets;
  if (sectionOffsets)
  {
    free(sectionOffsets);
    self->_sectionOffsets = 0;
  }
  cellFrames = self->_cellFrames;
  if (cellFrames)
  {
    free(cellFrames);
    self->_cellFrames = 0;
  }
  headerFrames = self->_headerFrames;
  if (headerFrames)
  {
    free(headerFrames);
    self->_headerFrames = 0;
  }
  sectionInsets = self->_sectionInsets;
  if (sectionInsets)
  {
    free(sectionInsets);
    self->_sectionInsets = 0;
  }
}

- (VUIShelfViewLayout)shelfViewLayout
{
  return (VUIShelfViewLayout *)objc_loadWeakRetained((id *)&self->_shelfViewLayout);
}

- (int64_t)actualRowCount
{
  return self->_actualRowCount;
}

- (double)tallestInsetTop
{
  return self->_tallestInsetTop;
}

- (double)tallestInsetBottom
{
  return self->_tallestInsetBottom;
}

- (double)tallestHeaderHeight
{
  return self->_tallestHeaderHeight;
}

- (double)tallestColumnHeight
{
  return self->_tallestColumnHeight;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shelfViewLayout);
}

@end
