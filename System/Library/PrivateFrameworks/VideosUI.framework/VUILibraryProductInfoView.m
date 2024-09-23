@implementation VUILibraryProductInfoView

- (VUILibraryProductInfoView)initWithFrame:(CGRect)a3
{
  VUILibraryProductInfoView *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VUILibraryProductInfoView;
  v3 = -[VUILibraryProductInfoView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__VUILibraryProductInfoView_initWithFrame___block_invoke;
    v7[3] = &unk_1E9F99F98;
    objc_copyWeak(&v8, &location);
    v5 = (id)-[VUILibraryProductInfoView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v4, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__VUILibraryProductInfoView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView)
      -[VUILibraryProductInfoView addSubview:](self, "addSubview:");
  }
  -[VUILibraryProductInfoView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *footerView;
  UIView *v7;

  v5 = (UIView *)a3;
  footerView = self->_footerView;
  v7 = v5;
  if (footerView != v5)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    if (self->_footerView)
      -[VUILibraryProductInfoView addSubview:](self, "addSubview:");
  }
  -[VUILibraryProductInfoView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setInfos:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *infos;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *groupedInfos;
  NSArray *v30;
  NSArray *normalizedGroupedInfos;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  id obj;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  void *v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[VUILibraryProductInfoView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        -[VUILibraryProductInfoView headerView](self, "headerView");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

        }
        else
        {
          v12 = (void *)v11;
          -[VUILibraryProductInfoView footerView](self, "footerView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v13)
            objc_msgSend(v10, "removeFromSuperview");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v7);
  }

  v14 = (NSArray *)objc_msgSend(v4, "copy");
  infos = self->_infos;
  self->_infos = v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v4;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v57;
    do
    {
      v21 = 0;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v57 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v21);
        objc_msgSend(v23, "groupName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_msgSend(v22, "isEqualToString:", v19) & 1) == 0)
        {
          v24 = (void *)objc_msgSend(v16, "copy");
          objc_msgSend(v46, "addObject:", v24);

          objc_msgSend(v16, "removeAllObjects");
        }

        if (v19)
        {
          objc_msgSend(v16, "addObject:", v23);
        }
        else
        {
          v67 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v25);

        }
        v66 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v26);

        ++v21;
        v22 = v19;
      }
      while (v18 != v21);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v18);

  }
  v27 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v46, "addObject:", v27);

  v28 = (NSArray *)objc_msgSend(v46, "copy");
  groupedInfos = self->_groupedInfos;
  self->_groupedInfos = v28;

  v30 = (NSArray *)objc_msgSend(v47, "copy");
  normalizedGroupedInfos = self->_normalizedGroupedInfos;
  self->_normalizedGroupedInfos = v30;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v32 = obj;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v53 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v37, "headerContentView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v37, "headerContentView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUILibraryProductInfoView addSubview:](self, "addSubview:", v39);

        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v37, "dataViews");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v49 != v43)
                objc_enumerationMutation(v40);
              -[VUILibraryProductInfoView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k));
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
          }
          while (v42);
        }

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v34);
  }

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[VUILibraryProductInfoView bounds](self, "bounds");
  -[VUILibraryProductInfoView sizeThatFits:](self, "sizeThatFits:", CGRectGetWidth(v6), 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
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
  void *v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  double v41;
  double v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  _BOOL4 v68;
  double v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  _BOOL4 v90;
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
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double height;
  double v111;
  double v112;
  double v113;
  double v114;
  id obj;
  double v116;
  uint64_t v117;
  double v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  VUILibraryProductInfoView *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v153 = *MEMORY[0x1E0C80C00];
  -[VUILibraryProductInfoView padding](self, "padding");
  v105 = v6;
  v106 = v5;
  v8 = v7;
  v10 = v9;
  -[VUILibraryProductInfoView interitemSpacing](self, "interitemSpacing");
  v12 = v11;
  -[VUILibraryProductInfoView lineSpacing](self, "lineSpacing");
  v111 = v13;
  v14 = -[VUILibraryProductInfoView maxLineCount](self, "maxLineCount");
  v15 = 0x7FFFFFFFLL;
  if (v14)
    v15 = v14;
  v137 = v15;
  v108 = v8;
  v109 = width;
  v107 = v10;
  v16 = fmax(width - v8 - v10, 0.0);
  -[VUILibraryProductInfoView headerMargin](self, "headerMargin");
  v103 = v18;
  v104 = v17;
  v20 = v19;
  v22 = v21;
  -[VUILibraryProductInfoView headerView](self, "headerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "vui_sizeThatFits:", v16 - (v20 + v22), 0.0);
  v102 = v24;

  -[VUILibraryProductInfoView footerMargin](self, "footerMargin");
  v100 = v26;
  v101 = v25;
  v28 = v27;
  v30 = v29;
  -[VUILibraryProductInfoView footerView](self, "footerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v16;
  objc_msgSend(v31, "vui_sizeThatFits:", v16 - (v28 + v30), 0.0);
  v99 = v32;

  v33 = *MEMORY[0x1E0C9D820];
  v34 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v122 = self;
  -[VUILibraryProductInfoView _getNormalizedGroupedInfos](self, "_getNormalizedGroupedInfos");
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v152, 16);
  if (!v119)
  {
    v116 = 0.0;
    v114 = 0.0;
    v36 = v33;
    v37 = v34;
    goto LABEL_57;
  }
  v35 = 0;
  v117 = *(_QWORD *)v147;
  v116 = 0.0;
  v113 = v33;
  v114 = 0.0;
  v36 = v33;
  v37 = v34;
  v38 = 0x7FFFFFFFFFFFFFFFLL;
  v118 = v12;
  v112 = v34;
  do
  {
    for (i = 0; i != v119; i = v89 + 1)
    {
      v129 = v38;
      if (*(_QWORD *)v147 != v117)
        objc_enumerationMutation(obj);
      v130 = v36;
      v131 = v37;
      v128 = i;
      v40 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
      -[VUILibraryProductInfoView _maxWidthForGroupInfos:](v122, "_maxWidthForGroupInfos:", v40, *(_QWORD *)&v99);
      v42 = v41;
      v136 = objc_msgSend(v40, "count");
      v142 = 0u;
      v143 = 0u;
      v144 = 0u;
      v145 = 0u;
      v43 = v40;
      v121 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v142, v151, 16);
      v127 = v42;
      if (v121)
      {
        v44 = 0;
        v45 = *(_QWORD *)v143;
        if (v42 <= 0.0)
          v46 = v126;
        else
          v46 = v42;
        v47 = fmin(v46, fmax(v126, v42));
        v48 = 0.0;
        v49 = 0.0;
        v50 = 0.0;
        v51 = 0.0;
        v132 = 0.0;
        v123 = v43;
        v120 = *(_QWORD *)v143;
        while (2)
        {
          v52 = 0;
          do
          {
            v124 = v49;
            v125 = v48;
            if (*(_QWORD *)v143 != v45)
              objc_enumerationMutation(v43);
            v53 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v52);
            objc_msgSend(v53, "lineSpacing");
            v55 = v54;
            objc_msgSend(v53, "headerMargin");
            v133 = v56;
            v134 = v57;
            objc_msgSend(v53, "headerPadding");
            v59 = v58;
            v61 = v60;
            objc_msgSend(v53, "headerContentView");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "vui_sizeThatFits:", v47, 0.0);
            v64 = v63;
            v66 = v65;

            objc_msgSend(v43, "firstObject");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53 == v67)
            {
              v48 = v61 + v59 + v66;
              v68 = -[VUILibraryProductInfoView useNormalizedGroupLayout](v122, "useNormalizedGroupLayout");
              v69 = v132;
              if (v68)
                v69 = v133;
              v132 = v69;
              v49 = v134;
            }
            else
            {
              v51 = v51 + v134 + v61 + v133 + v59 + v66;
              v49 = v124;
              v48 = v125;
            }
            v135 = v52;
            v140 = 0u;
            v141 = 0u;
            v138 = 0u;
            v139 = 0u;
            objc_msgSend(v53, "dataViews");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v138, v150, 16);
            if (v71)
            {
              v72 = v71;
              v73 = *(_QWORD *)v139;
              while (2)
              {
                for (j = 0; j != v72; ++j)
                {
                  if (*(_QWORD *)v139 != v73)
                    objc_enumerationMutation(v70);
                  v75 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
                  if (v44 == v137)
                  {
                    v50 = fmax(v50, v51);
                    if (v136 != 1)
                    {

                      goto LABEL_38;
                    }
                    v44 = 0;
                    ++v35;
                    v51 = 0.0;
                  }
                  objc_msgSend(v53, "dataViews");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "firstObject");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();

                  v78 = -0.0;
                  if (v75 != v77)
                    v78 = v55;
                  v79 = v51 + v78;
                  objc_msgSend(v75, "vui_sizeThatFits:", v47, 0.0);
                  v51 = v79 + v80;
                  ++v44;
                  v64 = fmax(v64, v81);
                }
                v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v138, v150, 16);
                if (v72)
                  continue;
                break;
              }
            }

            v50 = fmax(v50, v51);
            if (v44 == v137)
            {
LABEL_38:
              v43 = v123;
              goto LABEL_40;
            }
            v52 = v135 + 1;
            v45 = v120;
            v43 = v123;
          }
          while (v135 + 1 != v121);
          v121 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v142, v151, 16);
          if (v121)
            continue;
          break;
        }
      }
      else
      {
        v48 = 0.0;
        v49 = 0.0;
        v64 = 0.0;
        v50 = 0.0;
        v132 = 0.0;
      }
LABEL_40:

      v82 = v127;
      if (v127 == 0.0)
        v82 = v64;
      v83 = v48 + v49 + v50;
      v84 = 1;
      if (v129 != 0x7FFFFFFFFFFFFFFFLL)
        v84 = -v129;
      v85 = v35 + v84;
      v86 = v118 * (float)((float)v85 + -1.0) + (double)v85 * v82;
      if (v129 == 0x7FFFFFFFFFFFFFFFLL || v126 <= 0.0)
      {
        v92 = v118;
        v38 = v35;
        v88 = v130;
        v87 = v131;
        v89 = v128;
        if (v129 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_53;
        goto LABEL_51;
      }
      v88 = v130;
      v87 = v131;
      v89 = v128;
      if (v118 + v130 + v86 > v126)
      {
        v116 = fmax(v116, v130);
        v114 = v114 + v111 + v131;
        v35 = v85 - 1;
        v90 = -[VUILibraryProductInfoView useNormalizedGroupLayout](v122, "useNormalizedGroupLayout");
        v91 = -0.0;
        if (v90)
          v91 = v132;
        v83 = v83 + v91;
        v87 = v112;
        v88 = v113;
LABEL_51:
        v92 = 0.0;
        v38 = v35;
        goto LABEL_53;
      }
      v38 = v35;
      v92 = v118;
LABEL_53:
      v36 = v88 + v86 + v92;
      v37 = fmax(v87, v83);
      v35 = v38 + 1;
    }
    v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v152, 16);
  }
  while (v119);
LABEL_57:
  v93 = v107 + v108 + fmax(v116, v36);
  v94 = fmin(v93, v109);
  if (v109 <= 0.0)
    v95 = v93;
  else
    v95 = v94;
  if (height <= 0.0)
    v96 = 1.79769313e308;
  else
    v96 = height;

  v97 = fmin(v96, v105 + v106 + v100 + v103 + v104 + v102 + v101 + v99 + v114 + v37);
  v98 = v95;
  result.height = v97;
  result.width = v98;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t i;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  float v87;
  float v88;
  double v89;
  int v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  char *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  int v109;
  double v110;
  double v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t j;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  uint64_t v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  id obj;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  double v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  double v153;
  id v154;
  char *v155;
  uint64_t v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  double v163;
  double v164;
  double v165;
  uint64_t v166;
  VUILibraryProductInfoView *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  uint64_t v172;
  double v173;
  uint64_t v174;
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
  objc_super v195;
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  v195.receiver = self;
  v195.super_class = (Class)VUILibraryProductInfoView;
  -[VUILibraryProductInfoView layoutSubviews](&v195, sel_layoutSubviews);
  -[VUILibraryProductInfoView bounds](self, "bounds");
  v4 = v3;
  -[VUILibraryProductInfoView padding](self, "padding");
  v164 = v5;
  v165 = v6;
  v7 = v6;
  v9 = v8;
  -[VUILibraryProductInfoView interitemSpacing](self, "interitemSpacing");
  v142 = v10;
  -[VUILibraryProductInfoView lineSpacing](self, "lineSpacing");
  v136 = v11;
  v12 = -[VUILibraryProductInfoView maxLineCount](self, "maxLineCount");
  if (v12)
    v13 = v12;
  else
    v13 = 0x7FFFFFFFLL;
  v147 = 0.0;
  v14 = fmax(v4 - v7 - v9, 0.0);
  -[VUILibraryProductInfoView headerMargin](self, "headerMargin");
  v169 = v15;
  v17 = v16;
  v173 = v18;
  v20 = v19;
  -[VUILibraryProductInfoView headerView](self, "headerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14 - (v17 + v20);
  objc_msgSend(v21, "vui_sizeThatFits:", v22, 0.0);
  v171 = v23;

  -[VUILibraryProductInfoView footerMargin](self, "footerMargin");
  v133 = v24;
  v26 = v25;
  v28 = v27;
  -[VUILibraryProductInfoView footerView](self, "footerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v26;
  v141 = v14;
  objc_msgSend(v29, "vui_sizeThatFits:", v14 - (v26 + v28), 0.0);
  v134 = v30;

  v31 = v165 + v17;
  v32 = -[VUILibraryProductInfoView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v167 = self;
  -[VUILibraryProductInfoView headerView](self, "headerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v22;
  if (v32 == 1)
  {
    v34 = v171;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v31 = v38;
  }
  else
  {
    v35 = v164 + v169;
    v36 = v22;
    v34 = v171;
    v37 = v171;
  }
  objc_msgSend(v33, "setFrame:", v31, v35, v36, v37);

  v146 = v173 + v164 + v169 + v34;
  -[VUILibraryProductInfoView _getNormalizedGroupedInfos](self, "_getNormalizedGroupedInfos");
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, v200, 16);
  if (v139)
  {
    v39 = 0;
    v152 = *MEMORY[0x1E0C9D538];
    v138 = *(_QWORD *)v192;
    v147 = 0.0;
    v166 = 0x7FFFFFFFFFFFFFFFLL;
    v174 = v13;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v192 != v138)
        {
          v41 = v40;
          objc_enumerationMutation(obj);
          v40 = v41;
        }
        v140 = v39;
        v145 = v40;
        v42 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v40);
        -[VUILibraryProductInfoView _maxWidthForGroupInfos:](v167, "_maxWidthForGroupInfos:", v42);
        v44 = v43;
        v172 = objc_msgSend(v42, "count");
        v187 = 0u;
        v188 = 0u;
        v189 = 0u;
        v190 = 0u;
        v154 = v42;
        v150 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v187, v199, 16);
        v143 = v44;
        if (v150)
        {
          v45 = 0;
          v148 = *(_QWORD *)v188;
          if (v44 <= 0.0)
            v46 = v141;
          else
            v46 = v44;
          v47 = fmin(v46, fmax(v141, v44));
          v168 = 0.0;
          v170 = 0.0;
          v48 = 0.0;
          v49 = 0.0;
          v50 = 1;
LABEL_17:
          v51 = 0;
          while (1)
          {
            if (*(_QWORD *)v188 != v148)
              objc_enumerationMutation(v154);
            v156 = v51;
            v52 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * v51);
            objc_msgSend(v52, "lineSpacing");
            v54 = v53;
            objc_msgSend(v52, "headerMargin");
            v158 = v55;
            v160 = v56;
            objc_msgSend(v52, "headerPadding");
            v58 = v57;
            v60 = v59;
            objc_msgSend(v52, "headerContentView");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "headerContentView");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "vui_sizeThatFits:", v47, 0.0);
            v64 = v63;
            v66 = v65;

            v162 = v61;
            objc_msgSend(v61, "setBounds:", 0.0, 0.0, v64, v66);
            objc_msgSend(v154, "firstObject");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52 == v67)
              v68 = v160;
            else
              v68 = v170;
            if (v52 != v67)
              v48 = v48 + v160 + v60 + v158 + v58 + v66;
            v185 = 0u;
            v186 = 0u;
            v69 = v168;
            if (v52 == v67)
              v69 = v60 + v58 + v66;
            v168 = v69;
            v170 = v68;
            v183 = 0uLL;
            v184 = 0uLL;
            objc_msgSend(v52, "dataViews");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
            if (v71)
            {
              v72 = v71;
              v73 = *(_QWORD *)v184;
              v74 = v152;
              while (2)
              {
                for (i = 0; i != v72; ++i)
                {
                  if (*(_QWORD *)v184 != v73)
                    objc_enumerationMutation(v70);
                  v76 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * i);
                  if (v13 >= 1 && v45 == v13)
                  {
                    v49 = fmax(v49, v48);
                    if (v172 != 1)
                    {
                      v45 = v13;
                      goto LABEL_43;
                    }
                    v45 = 0;
                    ++v50;
                    v48 = 0.0;
                  }
                  objc_msgSend(v52, "dataViews");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "firstObject");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();

                  v79 = -0.0;
                  if (v76 != v78)
                    v79 = v54;
                  v80 = v48 + v79;
                  objc_msgSend(v76, "vui_sizeThatFits:", v47, 0.0);
                  v82 = v81;
                  v84 = v83;
                  objc_msgSend(v76, "setBounds:", 0.0, 0.0, v81, v83);
                  v48 = v80 + v84;
                  v64 = fmax(v64, v82);
                  ++v45;
                  v13 = v174;
                }
                v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
                if (v72)
                  continue;
                break;
              }
            }
            else
            {
              v74 = v152;
            }
LABEL_43:

            v49 = fmax(v49, v48);
            if (v45 == v13)
              break;
            v51 = v156 + 1;
            if (v156 + 1 == v150)
            {
              v150 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v187, v199, 16);
              if (v150)
                goto LABEL_17;
              break;
            }
          }
        }
        else
        {
          v168 = 0.0;
          v170 = 0.0;
          v64 = 0.0;
          v49 = 0.0;
          v50 = 1;
          v74 = v152;
        }

        if (v143 == 0.0)
          v85 = v64;
        else
          v85 = v143;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v50);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "floatValue");
        v88 = v87;

        if (v166 == 0x7FFFFFFFFFFFFFFFLL || v141 <= 0.0 || v74 + v142 * (v88 + -1.0) + v88 * v85 <= v141)
        {
          v166 = v140;
          v89 = v146;
        }
        else
        {
          v89 = v146 + v136 + v147;
          v166 = v50 - 1;
          v74 = 0.0;
          v147 = 0.0;
        }
        v146 = v89;
        v90 = v89 > 0.0 && -[VUILibraryProductInfoView useNormalizedGroupLayout](v167, "useNormalizedGroupLayout");
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        v91 = v154;
        v151 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
        if (v151)
        {
          v92 = 0;
          v93 = *(_QWORD *)v180;
          v94 = v142 + v85;
          v95 = v146;
          v157 = v91;
          v149 = v90;
          v144 = *(_QWORD *)v180;
          while (2)
          {
            v96 = 0;
            do
            {
              v153 = v74;
              if (*(_QWORD *)v180 != v93)
                objc_enumerationMutation(v91);
              v155 = v96;
              v97 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)v96);
              objc_msgSend(v97, "lineSpacing");
              v99 = v98;
              objc_msgSend(v97, "headerMargin");
              v159 = v100;
              v163 = v101;
              objc_msgSend(v97, "headerPadding");
              v103 = v102;
              v161 = v104;
              objc_msgSend(v97, "headerContentView");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "bounds");
              v107 = v106;
              objc_msgSend(v91, "firstObject");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              if (v97 == v108)
                v109 = v90;
              else
                v109 = 1;

              v110 = -0.0;
              if (v109)
                v110 = v159;
              v111 = v95 + v110;
              -[VUILibraryProductInfoView _layouCellContentView:inCellBounds:](v167, "_layouCellContentView:inCellBounds:", v105, v165 + v153, v103 + v164 + v111, v85, v107);
              v177 = 0u;
              v178 = 0u;
              v95 = v111 + v163 + v161 + v103 + v107;
              v175 = 0u;
              v176 = 0u;
              objc_msgSend(v97, "dataViews");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v175, v196, 16);
              if (v113)
              {
                v114 = v113;
                v115 = *(_QWORD *)v176;
                v74 = v153;
                while (2)
                {
                  for (j = 0; j != v114; ++j)
                  {
                    if (*(_QWORD *)v176 != v115)
                      objc_enumerationMutation(v112);
                    v117 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * j);
                    if (v92 == v174)
                    {
                      if (v172 != 1)
                      {

                        v13 = v174;
                        goto LABEL_88;
                      }
                      v92 = 0;
                      ++v166;
                      v74 = v94 + v74;
                      v95 = v170 + v168 + v146;
                    }
                    objc_msgSend(v97, "dataViews");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v118, "firstObject");
                    v119 = (void *)objc_claimAutoreleasedReturnValue();

                    v120 = -0.0;
                    if (v117 != v119)
                      v120 = v99;
                    v121 = v95 + v120;
                    objc_msgSend(v117, "bounds");
                    v123 = v122;
                    -[VUILibraryProductInfoView _layouCellContentView:inCellBounds:](v167, "_layouCellContentView:inCellBounds:", v117, v165 + v74, v164 + v121, v85);
                    v95 = v121 + v123;
                    ++v92;
                  }
                  v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v175, v196, 16);
                  if (v114)
                    continue;
                  break;
                }
              }
              else
              {
                v74 = v153;
              }

              v13 = v174;
              if (v92 == v174)
              {
LABEL_88:
                v91 = v157;
                goto LABEL_90;
              }
              v91 = v157;
              v96 = v155 + 1;
              v90 = v149;
              v93 = v144;
            }
            while (v155 + 1 != (char *)v151);
            v151 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
            if (v151)
              continue;
            break;
          }
        }
        else
        {
          v94 = v142 + v85;
        }
LABEL_90:

        v152 = v94 + v74;
        v147 = fmax(v147, v49 + v170 + v168);
        v39 = v166 + 1;
        v40 = v145 + 1;
      }
      while (v145 + 1 != v139);
      v139 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, v200, 16);
    }
    while (v139);
  }
  v124 = v165 + v132;
  v125 = v133 + v146 + v147;
  v126 = -[VUILibraryProductInfoView effectiveUserInterfaceLayoutDirection](v167, "effectiveUserInterfaceLayoutDirection");
  -[VUILibraryProductInfoView footerView](v167, "footerView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (v126 == 1)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v124 = v130;
    v125 = v131;
  }
  else
  {
    v129 = v134;
    v128 = v135;
  }
  objc_msgSend(v127, "setFrame:", v124, v125, v128, v129);

  -[VUILibraryProductInfoView invalidateIntrinsicContentSize](v167, "invalidateIntrinsicContentSize");
}

- (id)_getNormalizedGroupedInfos
{
  if (-[VUILibraryProductInfoView _columnCount](self, "_columnCount") == 2)
    -[VUILibraryProductInfoView groupedInfos](self, "groupedInfos");
  else
    -[VUILibraryProductInfoView normalizedGroupedInfos](self, "normalizedGroupedInfos");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)useNormalizedGroupLayout
{
  return -[VUILibraryProductInfoView _columnCount](self, "_columnCount") != 2;
}

- (void)_layouCellContentView:(id)a3 inCellBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
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
  id v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = a3;
  objc_msgSend(v22, "bounds");
  if (v9 > width)
  {
    objc_msgSend(v22, "frame");
    v11 = v10;
    objc_msgSend(v22, "frame");
    v13 = v12;
    objc_msgSend(v22, "bounds");
    objc_msgSend(v22, "setFrame:", v11, v13, width);
  }
  objc_msgSend(v22, "bounds");
  v15 = v14;
  if (-[VUILibraryProductInfoView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[VUILibraryProductInfoView bounds](self, "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v18 = v16 + v17 + v15 * -0.5;
    v21 = v19 + v20 * 0.5;
  }
  else
  {
    v18 = x + v15 * 0.5;
    v21 = y + height * 0.5;
  }
  objc_msgSend(v22, "setCenter:", v18, v21);

}

- (double)_sectionInfoWidth
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double Width;
  double v10;
  double v11;
  CGRect v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[VUILibraryProductInfoView _columnCount](self, "_columnCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  -[VUILibraryProductInfoView interitemSpacing](self, "interitemSpacing");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v13);

  -[VUILibraryProductInfoView padding](self, "padding");
  return (Width - (v10 + v11) - (v5 + -1.0) * v7) / v5;
}

- (double)interitemSpacing
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  double result;

  -[VUILibraryProductInfoView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation") - 3) < 2 && v3 == 1;
  result = 20.0;
  if (v4)
    return 30.0;
  return result;
}

- (int64_t)maxLineCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int64_t v9;

  -[VUILibraryProductInfoView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation");
  -[VUILibraryProductInfoView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAXEnabled");

  if (v4 == 1)
    v8 = v7;
  else
    v8 = 1;
  v9 = 5;
  if ((unint64_t)(v5 - 3) >= 2)
    v9 = 0;
  if (v8)
    return 0;
  else
    return v9;
}

- (UIEdgeInsets)padding
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  UIEdgeInsets result;

  v2 = (void *)MEMORY[0x1E0DC3F98];
  -[VUILibraryProductInfoView bounds](self, "bounds");
  objc_msgSend(v2, "vui_paddingForWindowWidth:", CGRectGetWidth(v7));
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (unint64_t)_columnCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;

  -[VUILibraryProductInfoView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation");
  -[VUILibraryProductInfoView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAXEnabled");

  if ((v7 & 1) != 0)
    return 1;
  if (v4 != 1)
    return 2;
  if ((unint64_t)(v5 - 1) < 2)
    return 4;
  if ((unint64_t)(v5 - 3) >= 2)
    return 2;
  return 5;
}

- (NSArray)infos
{
  return self->_infos;
}

- (NSArray)groupedInfos
{
  return self->_groupedInfos;
}

- (void)setGroupedInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSArray)normalizedGroupedInfos
{
  return self->_normalizedGroupedInfos;
}

- (void)setNormalizedGroupedInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIEdgeInsets)headerMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_headerMargin.top;
  left = self->_headerMargin.left;
  bottom = self->_headerMargin.bottom;
  right = self->_headerMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIEdgeInsets)footerMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_footerMargin.top;
  left = self->_footerMargin.left;
  bottom = self->_footerMargin.bottom;
  right = self->_footerMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFooterMargin:(UIEdgeInsets)a3
{
  self->_footerMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_normalizedGroupedInfos, 0);
  objc_storeStrong((id *)&self->_groupedInfos, 0);
  objc_storeStrong((id *)&self->_infos, 0);
}

@end
