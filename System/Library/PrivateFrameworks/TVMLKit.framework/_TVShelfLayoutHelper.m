@implementation _TVShelfLayoutHelper

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

- (_TVShelfViewLayout)shelfViewLayout
{
  return (_TVShelfViewLayout *)objc_loadWeakRetained((id *)&self->_shelfViewLayout);
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

  p_top = (double *)MEMORY[0x24BDF7718];
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

- (_TVShelfLayoutHelper)initWithShelfViewLayout:(id)a3
{
  id v4;
  _TVShelfLayoutHelper *v5;
  _TVShelfLayoutHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVShelfLayoutHelper;
  v5 = -[_TVShelfLayoutHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfViewLayout, v4);
    -[_TVShelfLayoutHelper _compute](v6, "_compute");
  }

  return v6;
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
    p_x = (double *)MEMORY[0x24BDBF090];
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

- (CGRect)frameForHeaderInSection:(int64_t)a3
{
  double *p_x;
  CGRect *headerFrames;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  p_x = (double *)MEMORY[0x24BDBF090];
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

- (void)dealloc
{
  objc_super v3;

  -[_TVShelfLayoutHelper _freeBuffers](self, "_freeBuffers");
  v3.receiver = self;
  v3.super_class = (Class)_TVShelfLayoutHelper;
  -[_TVShelfLayoutHelper dealloc](&v3, sel_dealloc);
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

- (void)_compute
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  int64_t *v21;
  int64_t *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  void *v26;
  CGRect *v27;
  UIEdgeInsets *v28;
  uint64_t v29;
  CGRect *v30;
  CGRect *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  _BOOL4 v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  NSObject *v53;
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
  double *p_x;
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
  void *v106;
  int64_t v107;
  double v108;
  double v109;
  int64_t v110;
  double v111;
  double v112;
  double v113;
  CGRect *v114;
  char v115;
  char v116;
  double v117;
  CGRect *v118;
  UIEdgeInsets *v119;
  UIEdgeInsets *v120;
  CGRect *v121;
  int64_t *v122;
  void *v123;
  double v124;
  uint64_t v125;
  double v126;
  int64_t v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  char v132;
  uint8_t buf[4];
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  -[_TVShelfLayoutHelper shelfViewLayout](self, "shelfViewLayout");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2557B2BE8))
  {
    objc_msgSend(v3, "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v7 = objc_opt_respondsToSelector();
  v116 = objc_opt_respondsToSelector();
  v132 = objc_opt_respondsToSelector();
  v115 = objc_opt_respondsToSelector();
  objc_msgSend(v3, "bounds");
  v113 = v8;
  objc_msgSend(v3, "contentInset");
  v111 = v10;
  v112 = v9;
  objc_msgSend(v130, "itemSize");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v130, "rowCount");
  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  v125 = objc_msgSend(v130, "prominentSectionIndex");
  v123 = v4;
  if ((v7 & 1) != 0)
    v17 = objc_msgSend(v4, "numberOfSectionsInCollectionView:", v3);
  else
    v17 = 1;
  objc_msgSend(v130, "minimumInteritemSpacing");
  v117 = v18;
  objc_msgSend(v130, "minimumLineSpacing");
  v20 = v19;
  v21 = (int64_t *)malloc_type_calloc(v17 + 1, 8uLL, 0x100004000313F17uLL);
  v22 = v21;
  v129 = (void *)v6;
  v127 = v17;
  v122 = v21;
  if (v17 < 1)
  {
    v114 = 0;
    v21[v17] = 0;
    v54 = (double *)malloc_type_calloc(v16, 8uLL, 0x100004000313F17uLL);
    v120 = 0;
    v121 = 0;
    v126 = 0.0;
    v124 = 0.0;
    v55 = 0.0;
  }
  else
  {
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v3, v23);
      v22[v23] = v24;
      v24 += v25;
      ++v23;
    }
    while (v17 != v23);
    v22[v17] = v24;
    if (v24 <= 0)
      v114 = 0;
    else
      v114 = (CGRect *)malloc_type_calloc(v24, 0x20uLL, 0x1000040E0EAB150uLL);
    v26 = (void *)v6;
    v27 = (CGRect *)malloc_type_calloc(v17, 0x20uLL, 0x1000040E0EAB150uLL);
    v28 = (UIEdgeInsets *)malloc_type_calloc(v17, 0x20uLL, 0x1000040E0EAB150uLL);
    v54 = (double *)malloc_type_calloc(v16, 8uLL, 0x100004000313F17uLL);
    v29 = 0;
    v55 = 0.0;
    v120 = v28;
    v121 = v27;
    v30 = v27;
    v31 = v114;
    v124 = 0.0;
    v126 = 0.0;
    v131 = v3;
    do
    {
      v32 = objc_msgSend(v123, "collectionView:numberOfItemsInSection:", v3, v29);
      if (v32)
      {
        v33 = v32;
        if ((v115 & 1) != 0)
          objc_msgSend(v26, "collectionView:layout:insetForSectionAtIndex:", v131, v130, v29);
        else
          objc_msgSend(v130, "sectionInset");
        v38 = v34;
        v39 = v35;
        v40 = v36;
        v41 = v37;
        if ((v116 & 1) != 0)
          objc_msgSend(v26, "collectionView:layout:referenceSizeForHeaderInSection:", v131, v130, v29);
        else
          objc_msgSend(v130, "headerReferenceSize");
        v28->top = v38;
        v28->left = v39;
        v28->bottom = v40;
        v28->right = v41;
        ++v28;
        v30->size.width = v42;
        v30->size.height = v43;
        ++v30;
        v44 = v126;
        if (v126 < v38)
          v44 = v38;
        v126 = v44;
        v45 = v124;
        if (v124 < v40)
          v45 = v40;
        v124 = v45;
        if (v55 < v43)
          v55 = v43;
        if (v33 >= 1)
        {
          v118 = v30;
          v119 = v28;
          v46 = 0;
          v48 = v125 == 0x7FFFFFFFFFFFFFFFLL || v29 == v125;
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v46, v29);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v12;
            v51 = v14;
            if ((v132 & 1) != 0)
              objc_msgSend(v129, "collectionView:layout:sizeForItemAtIndexPath:", v131, v130, v49, v12, v14);
            if (fabs(v50) == INFINITY || (v52 = fabs(v51), v52 >= INFINITY) && v52 <= INFINITY)
            {
              v53 = TVMLKitLogObject;
              if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v134 = v49;
                _os_log_impl(&dword_222D98000, v53, OS_LOG_TYPE_DEFAULT, "shelf cell size not finite for %@, skipping", buf, 0xCu);
              }
            }
            else
            {
              v31->size.width = v50;
              v31->size.height = v51;
              if (v48)
                v54[v46 % v16] = fmax(v54[v46 % v16], v51);
            }

            ++v46;
            ++v31;
          }
          while (v33 != v46);
          v26 = v129;
          v30 = v118;
          v28 = v119;
        }
      }
      ++v29;
      v3 = v131;
    }
    while (v29 != v127);
    v17 = v127;
  }
  v56 = 0.0;
  v57 = 0.0;
  if (v16 >= 1)
  {
    v58 = v54;
    v59 = v16;
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
  v128 = v55;
  if (v17 >= 1)
  {
    v61 = 0;
    v62 = v57 + v20 * (double)(v16 - 1);
    v63 = v126 + v55 + v56;
    v64 = 0.0;
    v65 = 0.0;
    while (1)
    {
      v66 = objc_msgSend(v123, "collectionView:numberOfItemsInSection:", v3, v61);
      if (v66)
      {
        v67 = v122[v61];
        v69 = v125 == 0x7FFFFFFFFFFFFFFFLL || v61 == v125;
        v70 = &v120[v61];
        right = v70->right;
        v72 = v64 + v70->left;
        p_x = &v121[v61].origin.x;
        *p_x = v72;
        p_x[1] = v126;
        if (v66 >= 1)
        {
          v74 = 0;
          p_height = (uint64_t)&v114[v67].size.height;
          while (1)
          {
            v76 = v74 <= 0 ? 0.0 : v117;
            if (v69)
            {
              v77 = (uint64_t)fmin((double)v16, (double)(v66 - v74));
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
                  v81 = v78 <= v74 ? 0.0 : v20;
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
                  v87 = &v54[v85 % v16];
                v84 = v84 + *v87;
                v86 = fmax(v86, *(v83 - 1));
                ++v85;
                v83 += 4;
              }
              while (v85 < v82);
            }
            v88 = v72 + v76;
            v89 = v20;
            if (!v69)
            {
              v89 = 0.0;
              if (v77 > 1)
                break;
            }
            v90 = v63;
            if (v77 >= 1)
              goto LABEL_93;
LABEL_99:
            v65 = fmax(v65, v90 - v63);
            v72 = v88 + v86;
            v74 = v82;
            if (v82 >= v66)
            {
              v97 = *p_x;
              goto LABEL_102;
            }
          }
          v89 = floor((v62 - v84) / (double)(v77 - 1));
LABEL_93:
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
              v94 = &v54[v92 % v16];
            v95 = v90 + v93;
            v96 = *v94;
            *(v91 - 3) = v88 + floor((v86 - *(v91 - 1)) * 0.5);
            *(v91 - 2) = v95;
            v90 = v95 + v96;
            ++v92;
            v91 += 4;
          }
          while (v92 < v82);
          goto LABEL_99;
        }
        v97 = v72;
LABEL_102:
        v98 = v113 - (v112 + v111);
        if (v72 >= v98 || v61 != v17 - 1)
          v98 = v72;
        v101 = p_x[2];
        v100 = p_x + 2;
        v102 = v101;
        v103 = v97 + v101;
        if (v103 > v98)
          *v100 = v102 - (v103 - v98);
        v64 = right + v72;
      }
      if (++v61 == v127)
        goto LABEL_113;
    }
  }
  v65 = 0.0;
LABEL_113:
  if (v16 < 1)
  {
    v104 = 0;
    v106 = v129;
    v107 = v127;
    v108 = v128;
  }
  else
  {
    v104 = 0;
    v105 = 0.0;
    v106 = v129;
    v107 = v127;
    v108 = v128;
    while (1)
    {
      v109 = v104 ? v20 : 0.0;
      v105 = v105 + v109 + v54[v104];
      if (v105 >= v65)
        break;
      if (v16 == ++v104)
      {
        v104 = v16;
        break;
      }
    }
  }
  v110 = v104 + 1;
  free(v54);
  -[_TVShelfLayoutHelper _freeBuffers](self, "_freeBuffers");
  self->_sectionCount = v107;
  self->_sectionOffsets = v122;
  self->_cellFrames = v114;
  self->_headerFrames = v121;
  self->_sectionInsets = v120;
  self->_actualRowCount = v110;
  self->_tallestInsetTop = v126;
  self->_tallestInsetBottom = v124;
  self->_tallestHeaderHeight = v108;
  self->_tallestColumnHeight = v65;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shelfViewLayout);
}

- (int64_t)actualRowCount
{
  return self->_actualRowCount;
}

@end
