@implementation _TVInfoListView

+ (id)infoListViewWithElement:(id)a3 existingView:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _TVInfoListInfo *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v44 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    v9 = objc_alloc((Class)a1);
    v8 = (id)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v7);
  }
  v10 = v8;
  objc_msgSend(v6, "style", v44);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxLineCount:", objc_msgSend(v11, "tv_maxLines"));

  objc_msgSend(v6, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tv_lineSpacing");
  objc_msgSend(v10, "setLineSpacing:");

  objc_msgSend(v6, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tv_interitemSpacing");
  objc_msgSend(v10, "setInteritemSpacing:");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v46 = v6;
  objc_msgSend(v6, "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v58;
    v48 = v14;
    v49 = v10;
    v47 = *(_QWORD *)v58;
    do
    {
      v18 = 0;
      v51 = v16;
      do
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v18);
        if (objc_msgSend(v19, "tv_elementType") == 15)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v20 = (_TVInfoListInfo *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "headerView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVInfoListInfo _viewFromElement:existingView:](v20, "_viewFromElement:existingView:", v19, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setHeaderView:", v22);
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        if (objc_msgSend(v19, "tv_elementType") == 13)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v20 = (_TVInfoListInfo *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "footerView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVInfoListInfo _viewFromElement:existingView:](v20, "_viewFromElement:existingView:", v19, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setFooterView:", v22);
          goto LABEL_13;
        }
        if (objc_msgSend(v19, "tv_elementType") == 18)
        {
          v52 = v18;
          v20 = objc_alloc_init(_TVInfoListInfo);
          objc_msgSend(v19, "style");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "tv_group");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVInfoListInfo setGroup:](v20, "setGroup:", v24);

          objc_msgSend(v19, "style");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "tv_width");
          -[_TVInfoListInfo setWidth:](v20, "setWidth:");

          objc_msgSend(v19, "style");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "tv_lineSpacing");
          -[_TVInfoListInfo setLineSpacing:](v20, "setLineSpacing:");

          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          objc_msgSend(v19, "children");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v54;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v54 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                if (objc_msgSend(v32, "tv_elementType") == 15)
                {
                  objc_msgSend(v32, "style");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "tv_margin");
                  -[_TVInfoListInfo setHeaderMargin:](v20, "setHeaderMargin:");

                  objc_msgSend(v32, "style");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "tv_padding");
                  -[_TVInfoListInfo setHeaderPadding:](v20, "setHeaderPadding:");

                  objc_msgSend(v32, "children");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "firstObject");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "_viewFromElement:existingView:", v36, 0);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_TVInfoListInfo setHeaderContentView:](v20, "setHeaderContentView:", v38);

                }
                else
                {
                  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "_viewFromElement:existingView:", v32, 0);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
                    objc_msgSend(v21, "addObject:", v36);
                }

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
            }
            while (v29);
          }

          v40 = (void *)objc_msgSend(v21, "copy");
          -[_TVInfoListInfo setDataViews:](v20, "setDataViews:", v40);

          objc_msgSend(v50, "addObject:", v20);
          v14 = v48;
          v10 = v49;
          v17 = v47;
          v16 = v51;
          v18 = v52;
          goto LABEL_14;
        }
LABEL_15:
        ++v18;
      }
      while (v18 != v16);
      v41 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      v16 = v41;
    }
    while (v41);
  }

  v42 = (void *)objc_msgSend(v50, "copy");
  objc_msgSend(v10, "setInfos:", v42);

  return v10;
}

- (_TVInfoListView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVInfoListView;
  return -[_TVInfoListView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
      -[_TVInfoListView addSubview:](self, "addSubview:");
  }
  -[_TVInfoListView setNeedsLayout](self, "setNeedsLayout");

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
      -[_TVInfoListView addSubview:](self, "addSubview:");
  }
  -[_TVInfoListView setNeedsLayout](self, "setNeedsLayout");

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
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *groupedInfos;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
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
  _BYTE v60[128];
  _BYTE v61[128];
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[_TVInfoListView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        -[_TVInfoListView headerView](self, "headerView");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

        }
        else
        {
          v12 = (void *)v11;
          -[_TVInfoListView footerView](self, "footerView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v13)
            objc_msgSend(v10, "removeFromSuperview");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v7);
  }

  v14 = (NSArray *)objc_msgSend(v4, "copy");
  infos = self->_infos;
  self->_infos = v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v53;
    do
    {
      v22 = 0;
      v23 = v20;
      do
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v22);
        objc_msgSend(v24, "group");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 && (objc_msgSend(v23, "isEqualToString:", v20) & 1) == 0)
        {
          v25 = (void *)objc_msgSend(v16, "copy");
          objc_msgSend(v43, "addObject:", v25);

          objc_msgSend(v16, "removeAllObjects");
        }

        if (v20)
        {
          objc_msgSend(v16, "addObject:", v24);
        }
        else
        {
          v62 = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v26);

        }
        ++v22;
        v23 = v20;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v19);

  }
  v27 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v43, "addObject:", v27);

  v28 = (NSArray *)objc_msgSend(v43, "copy");
  groupedInfos = self->_groupedInfos;
  self->_groupedInfos = v28;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v30 = v17;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v35, "headerContentView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v35, "headerContentView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVInfoListView addSubview:](self, "addSubview:", v37);

        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v35, "dataViews");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v40; ++k)
            {
              if (*(_QWORD *)v45 != v41)
                objc_enumerationMutation(v38);
              -[_TVInfoListView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k));
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
          }
          while (v40);
        }

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v32);
  }

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
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  double v45;
  double v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
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
  uint64_t v116;
  double v117;
  _TVInfoListView *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  double v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  __int128 v137;
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
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v152 = *MEMORY[0x24BDAC8D0];
  -[UIView tv_padding](self, "tv_padding");
  v105 = v6;
  v106 = v5;
  v8 = v7;
  v10 = v9;
  -[_TVInfoListView interitemSpacing](self, "interitemSpacing");
  v12 = v11;
  -[_TVInfoListView lineSpacing](self, "lineSpacing");
  v111 = v13;
  v14 = -[_TVInfoListView maxLineCount](self, "maxLineCount");
  v15 = 0x7FFFFFFFLL;
  if (v14)
    v15 = v14;
  v136 = v15;
  v108 = v8;
  v109 = width;
  v107 = v10;
  v16 = width - v8 - v10;
  v17 = 0.0;
  v18 = fmax(v16, 0.0);
  -[_TVInfoListView headerView](self, "headerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tv_margin");
  v103 = v21;
  v104 = v20;
  v23 = v22;
  v25 = v24;

  -[_TVInfoListView headerView](self, "headerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tv_sizeThatFits:", v18 - (v23 + v25), 0.0);
  v102 = v27;

  -[_TVInfoListView footerView](self, "footerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tv_margin");
  v100 = v30;
  v101 = v29;
  v32 = v31;
  v34 = v33;

  -[_TVInfoListView footerView](self, "footerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v18;
  objc_msgSend(v35, "tv_sizeThatFits:", v18 - (v32 + v34), 0.0);
  v99 = v36;

  v37 = *MEMORY[0x24BDBF148];
  v38 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v118 = self;
  -[_TVInfoListView groupedInfos](self, "groupedInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
  if (!v119)
  {
    v114 = 0.0;
    v40 = v37;
    v41 = v38;
    goto LABEL_56;
  }
  v39 = 0;
  v116 = *(_QWORD *)v146;
  v113 = v37;
  v114 = 0.0;
  v40 = v37;
  v41 = v38;
  v42 = 0x7FFFFFFFFFFFFFFFLL;
  v117 = v12;
  v112 = v38;
  do
  {
    for (i = 0; i != v119; i = v93 + 1)
    {
      v127 = v42;
      if (*(_QWORD *)v146 != v116)
        objc_enumerationMutation(obj);
      v128 = v40;
      v129 = v41;
      v130 = v17;
      v126 = i;
      v44 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
      -[_TVInfoListView _maxWidthForGroupInfos:](v118, "_maxWidthForGroupInfos:", v44, *(_QWORD *)&v99);
      v46 = v45;
      v135 = objc_msgSend(v44, "count");
      v141 = 0u;
      v142 = 0u;
      v143 = 0u;
      v144 = 0u;
      v47 = v44;
      v121 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
      v125 = v46;
      if (v121)
      {
        v48 = 0;
        v49 = *(_QWORD *)v142;
        if (v46 <= 0.0)
          v50 = v124;
        else
          v50 = v46;
        v51 = fmin(v50, fmax(v124, v46));
        v52 = 0.0;
        v134 = 0.0;
        v53 = 0.0;
        v54 = 0.0;
        v123 = v47;
        v120 = *(_QWORD *)v142;
        while (2)
        {
          v55 = 0;
          do
          {
            v133 = v52;
            if (*(_QWORD *)v142 != v49)
              objc_enumerationMutation(v47);
            v122 = v55;
            v56 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v55);
            objc_msgSend(v56, "lineSpacing");
            v58 = v57;
            objc_msgSend(v56, "headerMargin");
            v131 = v59;
            v132 = v60;
            objc_msgSend(v56, "headerPadding");
            v62 = v61;
            v64 = v63;
            objc_msgSend(v56, "headerContentView");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "tv_sizeThatFits:", v51, 0.0);
            v67 = v66;
            v69 = v68;

            objc_msgSend(v47, "firstObject");
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            v71 = v54 + v132 + v64 + v131 + v62 + v69;
            v72 = v64 + v62 + v69;
            v52 = v133;
            if (v56 == v70)
              v52 = v72;
            v73 = v134;
            if (v56 == v70)
              v73 = v132;
            v134 = v73;
            v139 = 0u;
            v140 = 0u;
            if (v56 != v70)
              v54 = v71;
            v137 = 0uLL;
            v138 = 0uLL;
            objc_msgSend(v56, "dataViews");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
            if (v75)
            {
              v76 = v75;
              v77 = *(_QWORD *)v138;
              while (2)
              {
                for (j = 0; j != v76; ++j)
                {
                  if (*(_QWORD *)v138 != v77)
                    objc_enumerationMutation(v74);
                  v79 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
                  if (v48 == v136)
                  {
                    v53 = fmax(v53, v54);
                    if (v135 != 1)
                    {

                      goto LABEL_39;
                    }
                    v48 = 0;
                    ++v39;
                    v54 = 0.0;
                  }
                  objc_msgSend(v56, "dataViews");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "firstObject");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();

                  v82 = -0.0;
                  if (v79 != v81)
                    v82 = v58;
                  v83 = v54 + v82;
                  objc_msgSend(v79, "tv_sizeThatFits:", v51, 0.0);
                  v54 = v83 + v84;
                  ++v48;
                  v67 = fmax(v67, v85);
                }
                v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
                if (v76)
                  continue;
                break;
              }
            }

            v53 = fmax(v53, v54);
            if (v48 == v136)
            {
LABEL_39:
              v47 = v123;
              goto LABEL_41;
            }
            v55 = v122 + 1;
            v47 = v123;
            v49 = v120;
          }
          while (v122 + 1 != v121);
          v121 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
          if (v121)
            continue;
          break;
        }
      }
      else
      {
        v52 = 0.0;
        v134 = 0.0;
        v67 = 0.0;
        v53 = 0.0;
      }
LABEL_41:

      v86 = v125;
      if (v125 == 0.0)
        v86 = v67;
      v87 = 1;
      if (v127 != 0x7FFFFFFFFFFFFFFFLL)
        v87 = -v127;
      v88 = v39 + v87;
      v89 = v39 + v87 - 1;
      v90 = v117 * (double)v89 + (double)v88 * v86;
      if (v127 == 0x7FFFFFFFFFFFFFFFLL || v124 <= 0.0)
      {
        v94 = v117;
        v42 = v39;
        v91 = v129;
        v17 = v130;
        v92 = v128;
        v93 = v126;
        if (v127 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_52;
        goto LABEL_50;
      }
      v92 = v128;
      v91 = v129;
      v17 = v130;
      v93 = v126;
      if (v117 + v128 + v90 > v124)
      {
        v17 = fmax(v130, v128);
        v114 = v114 + v111 + v129;
        v39 = v89;
        v91 = v112;
        v92 = v113;
LABEL_50:
        v94 = 0.0;
        v42 = v39;
        goto LABEL_52;
      }
      v42 = v39;
      v94 = v117;
LABEL_52:
      v40 = v92 + v90 + v94;
      v41 = fmax(v91, v52 + v134 + v53);
      v39 = v42 + 1;
    }
    v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
  }
  while (v119);
LABEL_56:

  v95 = v107 + v108 + fmax(v17, v40);
  v96 = fmin(v95, v109);
  if (v109 > 0.0)
    v95 = v96;
  v97 = 1.79769313e308;
  if (height > 0.0)
    v97 = height;
  v98 = fmin(v97, v105 + v106 + v100 + v103 + v104 + v102 + v101 + v99 + v114 + v41);
  result.height = v98;
  result.width = v95;
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
  void *v16;
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
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  uint64_t v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t j;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  id obj;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  double v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  uint64_t v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  id v144;
  uint64_t v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  double v150;
  void *v151;
  double v152;
  double v153;
  _TVInfoListView *v154;
  double v155;
  double v156;
  double v157;
  uint64_t v158;
  double v159;
  uint64_t v160;
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
  objc_super v181;
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  uint64_t v187;

  v187 = *MEMORY[0x24BDAC8D0];
  v181.receiver = self;
  v181.super_class = (Class)_TVInfoListView;
  -[_TVInfoListView layoutSubviews](&v181, sel_layoutSubviews);
  -[_TVInfoListView bounds](self, "bounds");
  v4 = v3;
  -[UIView tv_padding](self, "tv_padding");
  v152 = v5;
  v7 = v6;
  v9 = v8;
  -[_TVInfoListView interitemSpacing](self, "interitemSpacing");
  v132 = v10;
  -[_TVInfoListView lineSpacing](self, "lineSpacing");
  v125 = v11;
  v12 = -[_TVInfoListView maxLineCount](self, "maxLineCount");
  if (v12)
    v13 = v12;
  else
    v13 = 0x7FFFFFFFLL;
  v14 = 0.0;
  v15 = fmax(v4 - v7 - v9, 0.0);
  -[_TVInfoListView headerView](self, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tv_margin");
  v157 = v17;
  v159 = v18;
  v20 = v19;
  v22 = v21;

  -[_TVInfoListView headerView](self, "headerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15 - (v20 + v22);
  objc_msgSend(v23, "tv_sizeThatFits:", v24, 0.0);
  v26 = v25;

  -[_TVInfoListView footerView](self, "footerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "tv_margin");
  v123 = v28;
  v30 = v29;
  v32 = v31;

  -[_TVInfoListView footerView](self, "footerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v30;
  v130 = v15;
  objc_msgSend(v33, "tv_sizeThatFits:", v15 - (v30 + v32), 0.0);
  v121 = v34;

  -[_TVInfoListView headerView](self, "headerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v7;
  v124 = v24;
  objc_msgSend(v35, "setFrame:", v7 + v20, v152 + v157, v24, v26);

  v131 = v159 + v152 + v157 + v26;
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v154 = self;
  -[_TVInfoListView groupedInfos](self, "groupedInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v186, 16);
  if (v128)
  {
    v129 = 0;
    v36 = *MEMORY[0x24BDBEFB0];
    v127 = *(_QWORD *)v178;
    v37 = 0x7FFFFFFFFFFFFFFFLL;
    v160 = v13;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v178 != v127)
        {
          v39 = v38;
          objc_enumerationMutation(obj);
          v38 = v39;
        }
        v134 = v38;
        v135 = v37;
        v136 = v36;
        v138 = v14;
        v40 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * v38);
        -[_TVInfoListView _maxWidthForGroupInfos:](v154, "_maxWidthForGroupInfos:", v40);
        v42 = v41;
        v158 = objc_msgSend(v40, "count");
        v173 = 0u;
        v174 = 0u;
        v175 = 0u;
        v176 = 0u;
        v143 = v40;
        v141 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
        v133 = v42;
        if (v141)
        {
          v43 = 0;
          v139 = *(_QWORD *)v174;
          if (v42 <= 0.0)
            v44 = v130;
          else
            v44 = v42;
          v45 = fmin(v44, fmax(v130, v42));
          v46 = 0.0;
          v47 = 0.0;
          v48 = 1;
          v155 = 0.0;
          v156 = 0.0;
LABEL_14:
          v49 = 0;
          while (1)
          {
            if (*(_QWORD *)v174 != v139)
              objc_enumerationMutation(v143);
            v145 = v49;
            v50 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v49);
            objc_msgSend(v50, "lineSpacing");
            v52 = v51;
            objc_msgSend(v50, "headerMargin");
            v147 = v53;
            v150 = v54;
            objc_msgSend(v50, "headerPadding");
            v56 = v55;
            v58 = v57;
            objc_msgSend(v50, "headerContentView");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "headerContentView");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "tv_sizeThatFits:", v45, 0.0);
            v62 = v61;
            v64 = v63;

            v151 = v59;
            objc_msgSend(v59, "setBounds:", 0.0, 0.0, v62, v64);
            objc_msgSend(v143, "firstObject");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50 == v65)
            {
              v66 = v150;
            }
            else
            {
              v46 = v46 + v150 + v58 + v147 + v56 + v64;
              v66 = v156;
            }
            v171 = 0u;
            v172 = 0u;
            v67 = v155;
            if (v50 == v65)
              v67 = v58 + v56 + v64;
            v155 = v67;
            v156 = v66;
            v169 = 0uLL;
            v170 = 0uLL;
            objc_msgSend(v50, "dataViews");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
            if (v69)
            {
              v70 = v69;
              v71 = *(_QWORD *)v170;
              while (2)
              {
                for (i = 0; i != v70; ++i)
                {
                  if (*(_QWORD *)v170 != v71)
                    objc_enumerationMutation(v68);
                  v73 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
                  if (v13 >= 1 && v43 == v13)
                  {
                    v47 = fmax(v47, v46);
                    if (v158 != 1)
                    {
                      v43 = v13;
                      goto LABEL_37;
                    }
                    v43 = 0;
                    ++v48;
                    v46 = 0.0;
                  }
                  objc_msgSend(v50, "dataViews");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "firstObject");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  v76 = -0.0;
                  if (v73 != v75)
                    v76 = v52;
                  v77 = v46 + v76;
                  objc_msgSend(v73, "tv_sizeThatFits:", v45, 0.0);
                  v79 = v78;
                  v81 = v80;
                  objc_msgSend(v73, "setBounds:", 0.0, 0.0, v78, v80);
                  v46 = v77 + v81;
                  v62 = fmax(v62, v79);
                  ++v43;
                  v13 = v160;
                }
                v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
                if (v70)
                  continue;
                break;
              }
            }
LABEL_37:

            v47 = fmax(v47, v46);
            if (v43 == v13)
              break;
            v49 = v145 + 1;
            if (v145 + 1 == v141)
            {
              v141 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
              if (v141)
                goto LABEL_14;
              break;
            }
          }
        }
        else
        {
          v47 = 0.0;
          v48 = 1;
          v62 = 0.0;
          v155 = 0.0;
          v156 = 0.0;
        }

        if (v133 == 0.0)
          v82 = v62;
        else
          v82 = v133;
        if (v135 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v37 = v129;
          v83 = v136;
        }
        else
        {
          v83 = v136;
          if (v130 <= 0.0 || (v84 = (double)v48, v37 = v48 - 1, v136 + v132 * (double)v37 + v84 * v82 <= v130))
          {
            v37 = v129;
          }
          else
          {
            v131 = v131 + v125 + v138;
            v83 = 0.0;
            v138 = 0.0;
          }
        }
        v167 = 0u;
        v168 = 0u;
        v165 = 0u;
        v166 = 0u;
        v85 = v143;
        v140 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
        if (v140)
        {
          v86 = v83;
          v87 = 0;
          v88 = *(_QWORD *)v166;
          v89 = v131;
          v144 = v85;
          v137 = *(_QWORD *)v166;
          while (2)
          {
            v90 = 0;
            do
            {
              if (*(_QWORD *)v166 != v88)
                objc_enumerationMutation(v85);
              v142 = v90;
              v91 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v90);
              objc_msgSend(v91, "lineSpacing");
              v93 = v92;
              objc_msgSend(v91, "headerMargin");
              v148 = v94;
              v96 = v95;
              objc_msgSend(v91, "headerPadding");
              v98 = v97;
              v146 = v99;
              objc_msgSend(v91, "headerContentView");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "bounds");
              v102 = v101;
              objc_msgSend(v85, "firstObject");
              v103 = (void *)objc_claimAutoreleasedReturnValue();

              v104 = -0.0;
              if (v91 != v103)
                v104 = v148;
              v105 = v89 + v104;
              v149 = v100;
              -[_TVInfoListView _layouCellContentView:inCellBounds:](v154, "_layouCellContentView:inCellBounds:", v100, v153 + v86, v98 + v152 + v105, v82, v102);
              v163 = 0u;
              v164 = 0u;
              v89 = v105 + v96 + v146 + v98 + v102;
              v161 = 0u;
              v162 = 0u;
              objc_msgSend(v91, "dataViews");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
              if (v107)
              {
                v108 = v107;
                v109 = *(_QWORD *)v162;
                while (2)
                {
                  for (j = 0; j != v108; ++j)
                  {
                    if (*(_QWORD *)v162 != v109)
                      objc_enumerationMutation(v106);
                    v111 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * j);
                    if (v87 == v13)
                    {
                      if (v158 != 1)
                      {

                        goto LABEL_76;
                      }
                      v87 = 0;
                      ++v37;
                      v89 = v156 + v155 + v131;
                      v112 = v132 + v82 + v86;
                    }
                    else
                    {
                      v112 = v86;
                    }
                    objc_msgSend(v91, "dataViews");
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v113, "firstObject");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();

                    v115 = -0.0;
                    if (v111 != v114)
                      v115 = v93;
                    v116 = v89 + v115;
                    objc_msgSend(v111, "bounds");
                    v118 = v117;
                    v86 = v112;
                    -[_TVInfoListView _layouCellContentView:inCellBounds:](v154, "_layouCellContentView:inCellBounds:", v111, v153 + v112, v152 + v116, v82);
                    v89 = v116 + v118;
                    ++v87;
                    v13 = v160;
                  }
                  v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
                  if (v108)
                    continue;
                  break;
                }
              }

              if (v87 == v13)
              {
LABEL_76:
                v83 = v86;
                v85 = v144;
                goto LABEL_77;
              }
              v90 = v142 + 1;
              v85 = v144;
              v88 = v137;
            }
            while (v142 + 1 != v140);
            v140 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
            if (v140)
              continue;
            break;
          }
          v83 = v86;
LABEL_77:
          v119 = v132 + v82;
        }
        else
        {
          v119 = v132 + v82;
        }

        v36 = v119 + v83;
        v14 = fmax(v138, v47 + v156 + v155);
        v129 = v37 + 1;
        v38 = v134 + 1;
      }
      while (v134 + 1 != v128);
      v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v186, 16);
    }
    while (v128);
  }

  -[_TVInfoListView footerView](v154, "footerView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setFrame:", v153 + v122, v123 + v131 + v14, v124, v121);

}

- (double)_maxWidthForGroupInfos:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        v9 = v7;
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "width");
        if (v11 != 0.0)
        {
          objc_msgSend(v10, "width");
          v7 = v12;
          if (v9 != 0.0)
            v7 = fmin(v9, v12);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)_layouCellContentView:(id)a3 inCellBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  objc_msgSend(v13, "bounds");
  v9 = v8;
  v10 = objc_msgSend(v13, "tv_alignment");
  v11 = x + width * 0.5;
  v12 = x + v9 * 0.5;
  if (v10 == 3)
    v12 = x + width + v9 * -0.5;
  if (v10 != 2)
    v11 = v12;
  objc_msgSend(v13, "setCenter:", v11, y + height * 0.5);

}

- (int64_t)maxLineCount
{
  return self->_maxLineCount;
}

- (void)setMaxLineCount:(int64_t)a3
{
  self->_maxLineCount = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedInfos, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
