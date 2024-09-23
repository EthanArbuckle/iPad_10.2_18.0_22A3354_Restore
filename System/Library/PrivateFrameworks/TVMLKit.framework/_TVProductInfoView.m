@implementation _TVProductInfoView

+ (id)productInfoViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVProductInfoView *v7;
  _TVProductInfoView *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _TVProductInfoView *v21;
  _TVProductInfoView *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVProductInfoView *)v6;
  }
  else
  {
    v8 = [_TVProductInfoView alloc];
    v7 = -[_TVFocusRedirectView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v23 = v7;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = v5;
  objc_msgSend(v5, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v25 = 0;
    v26 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "tv_elementType") - 19;
        +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_viewFromElement:existingView:", v16, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 > 1)
        {
          if (!v19)
            goto LABEL_27;
          if (!v13)
          {
            if (objc_msgSend(v19, "canBecomeFocused"))
              v13 = v19;
            else
              v13 = 0;
          }
          if (objc_msgSend(v9, "count"))
          {
            v20 = v26;
            if (!v26)
            {
              v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v26 = v20;
            }
          }
          else
          {
            v20 = v25;
            if (!v25)
            {
              v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v25 = v20;
            }
          }
        }
        else
        {
          if (!v19)
            goto LABEL_27;
          if (!v13)
          {
            if (objc_msgSend(v19, "canBecomeFocused"))
              v13 = v19;
            else
              v13 = 0;
          }
          v20 = v9;
        }
        objc_msgSend(v20, "addObject:", v19);
LABEL_27:

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v12)
        goto LABEL_31;
    }
  }
  v25 = 0;
  v26 = 0;
  v13 = 0;
LABEL_31:

  -[_TVProductInfoView setViewsAboveInfoSection:](v23, "setViewsAboveInfoSection:", v25);
  -[_TVProductInfoView setInfoSectionViews:](v23, "setInfoSectionViews:", v9);
  -[_TVProductInfoView setViewsBelowInfoSection:](v23, "setViewsBelowInfoSection:", v26);
  -[_TVProductInfoView setDefaultFocusView:](v23, "setDefaultFocusView:", v13);
  v21 = v23;

  return v21;
}

- (void)setViewsAboveInfoSection:(id)a3
{
  id v5;
  NSArray **p_viewsAboveInfoSection;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    p_viewsAboveInfoSection = &self->_viewsAboveInfoSection;
    if (!-[NSArray isEqualToArray:](self->_viewsAboveInfoSection, "isEqualToArray:", v5))
    {
      -[NSArray makeObjectsPerformSelector:](*p_viewsAboveInfoSection, "makeObjectsPerformSelector:", sel_removeFromSuperview);
      objc_storeStrong((id *)&self->_viewsAboveInfoSection, a3);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = *p_viewsAboveInfoSection;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            -[_TVProductInfoView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
          }
          while (v9 != v11);
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }
  -[_TVProductInfoView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

}

- (void)setInfoSectionViews:(id)a3
{
  id v5;
  NSArray **p_infoSectionViews;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_infoSectionViews = &self->_infoSectionViews;
  if (!-[NSArray isEqualToArray:](self->_infoSectionViews, "isEqualToArray:", v5))
  {
    -[NSArray makeObjectsPerformSelector:](*p_infoSectionViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&self->_infoSectionViews, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *p_infoSectionViews;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[_TVProductInfoView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  -[_TVProductInfoView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

}

- (void)setViewsBelowInfoSection:(id)a3
{
  id v5;
  NSArray **p_viewsBelowInfoSection;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    p_viewsBelowInfoSection = &self->_viewsBelowInfoSection;
    if (!-[NSArray isEqualToArray:](self->_viewsBelowInfoSection, "isEqualToArray:", v5))
    {
      -[NSArray makeObjectsPerformSelector:](*p_viewsBelowInfoSection, "makeObjectsPerformSelector:", sel_removeFromSuperview);
      objc_storeStrong((id *)&self->_viewsBelowInfoSection, a3);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = *p_viewsBelowInfoSection;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            -[_TVProductInfoView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
          }
          while (v9 != v11);
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }
  -[_TVProductInfoView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVProductInfoView defaultFocusView](self, "defaultFocusView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(v4, "isDescendantOfView:", self) ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[_TVProductInfoView defaultFocusView](self, "defaultFocusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_TVProductInfoView layoutIfNeeded](self, "layoutIfNeeded");
  -[_TVProductInfoView defaultFocusView](self, "defaultFocusView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_TVProductInfoView defaultFocusView](self, "defaultFocusView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  uint64_t i;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  double v59;
  void *v60;
  double v61;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v87 = *MEMORY[0x24BDAC8D0];
  -[UIView tv_padding](self, "tv_padding");
  v7 = v6;
  v71 = v8;
  v67 = v10;
  v68 = v9;
  -[UIView tv_lineSpacing](self, "tv_lineSpacing");
  v70 = v11;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v12 = self->_viewsAboveInfoSection;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  v14 = v13;
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  if (v13)
  {
    v18 = 0;
    v19 = *(_QWORD *)v81;
    v20 = v13;
    do
    {
      v21 = 0;
      v22 = v16;
      do
      {
        if (*(_QWORD *)v81 != v19)
          objc_enumerationMutation(v12);
        v23 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v21);
        objc_msgSend(v23, "tv_margin");
        v16 = v24;
        v25 = fmax(v24, v22);
        v26 = fmax(v7, v16);
        if ((v18 & 1) == 0)
          v25 = v26;
        v27 = v17 + v25;
        objc_msgSend(v23, "sizeThatFits:", width, height);
        v17 = v28 + v27;
        ++v21;
        v18 = 1;
        v22 = v16;
      }
      while (v20 != v21);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    }
    while (v20);
  }

  -[NSArray firstObject](self->_infoSectionViews, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tv_margin");
  v31 = v30;
  v33 = v32;

  v34 = fmax(v31, v16);
  v35 = fmax(v7, v31);
  if (!v14)
    v34 = v35;
  v36 = v17 + v34;
  -[UIView tv_interitemSpacing](self, "tv_interitemSpacing");
  v38 = v37;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v39 = self->_infoSectionViews;
  v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  v69 = width;
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v77;
    v43 = fmax(width - v71 - v67, 0.0);
    v44 = width - v67;
    v15 = 0.0;
    v45 = v71;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v77 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "tv_sizeThatFits:", v43, 0.0);
        v49 = v71;
        v50 = v70 + v15;
        v51 = 0.0;
        if (v45 + v47 <= v44)
        {
          v51 = v15;
          v49 = v45;
          v50 = -0.0;
        }
        v36 = v36 + v50;
        v15 = fmax(v51, v48);
        v45 = v38 + v47 + v49;
      }
      v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v41);
  }

  v52 = v15 + v36;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v53 = self->_viewsBelowInfoSection;
  v54 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v73;
    v57 = v69;
    do
    {
      v58 = 0;
      v59 = v33;
      do
      {
        if (*(_QWORD *)v73 != v56)
          objc_enumerationMutation(v53);
        v60 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v58);
        objc_msgSend(v60, "tv_margin");
        v62 = v61;
        v33 = v63;
        objc_msgSend(v60, "sizeThatFits:", v69, height);
        v52 = v52 + v64 + fmax(v59, v62);
        ++v58;
        v59 = v33;
      }
      while (v55 != v58);
      v55 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    }
    while (v55);
  }
  else
  {
    v57 = v69;
  }

  v65 = v52 + fmax(v33, v68);
  v66 = v57;
  result.height = v65;
  result.width = v66;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  char v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  double v21;
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
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t i;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _BOOL4 v54;
  double v55;
  double v56;
  double v57;
  NSArray *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double Width;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
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
  objc_super v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;
  CGRect v106;

  v105 = *MEMORY[0x24BDAC8D0];
  v101.receiver = self;
  v101.super_class = (Class)_TVProductInfoView;
  -[_TVFocusRedirectView layoutSubviews](&v101, sel_layoutSubviews);
  -[_TVProductInfoView bounds](self, "bounds");
  Width = CGRectGetWidth(v106);
  -[UIView tv_padding](self, "tv_padding");
  v86 = v3;
  v5 = v4;
  v82 = v6;
  -[UIView tv_lineSpacing](self, "tv_lineSpacing");
  v85 = v7;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v8 = self->_viewsAboveInfoSection;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
  v10 = v9;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v88 = v5;
  if (v9)
  {
    v14 = 0;
    v15 = *(_QWORD *)v98;
    v16 = Width - v5 - v82;
    v17 = v9;
    do
    {
      v18 = 0;
      v19 = v12;
      do
      {
        if (*(_QWORD *)v98 != v15)
          objc_enumerationMutation(v8);
        v20 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v18);
        objc_msgSend(v20, "tv_margin");
        v12 = v21;
        v23 = v22;
        v25 = v16 - v22 - v24;
        objc_msgSend(v20, "sizeThatFits:", v25, 0.0);
        v27 = v26;
        v28 = v13 + fmax(v12, v19);
        v29 = fmax(v86, v12);
        if ((v14 & 1) != 0)
          v30 = v28;
        else
          v30 = v29;
        v31 = v88 + v23;
        v5 = v88;
        objc_msgSend(v20, "setFrame:", v31, v30, v25, v27);
        v13 = v27 + v30;
        ++v18;
        v14 = 1;
        v19 = v12;
      }
      while (v17 != v18);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
    }
    while (v17);
  }

  -[NSArray firstObject](self->_infoSectionViews, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tv_margin");
  v34 = v33;
  v81 = v35;

  v36 = v13 + fmax(v34, v12);
  v37 = fmax(v86, v34);
  if (v10)
    v38 = v36;
  else
    v38 = v37;
  v39 = -[_TVProductInfoView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[UIView tv_interitemSpacing](self, "tv_interitemSpacing");
  v84 = v40;
  v41 = v5;
  v87 = Width - v82;
  if (v39 == 1)
    v5 = Width - v82;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v42 = self->_infoSectionViews;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v94;
    v46 = fmax(Width - v41 - v82, 0.0);
    v47 = v5;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v94 != v45)
          objc_enumerationMutation(v42);
        v49 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        objc_msgSend(v49, "tv_sizeThatFits:", v46, 0.0);
        v51 = v50;
        v53 = v52;
        v54 = v47 - v50 < v88;
        if (v39 != 1)
          v54 = v47 + v50 > v87;
        v55 = v85 + v11;
        if (v39 == 1)
          v56 = v51;
        else
          v56 = 0.0;
        if (v39 == 1)
          v57 = -(v84 + v51);
        else
          v57 = v84 + v51;
        if (v54)
        {
          v47 = v5;
          v11 = 0.0;
        }
        else
        {
          v55 = -0.0;
        }
        v38 = v38 + v55;
        objc_msgSend(v49, "setFrame:", v47 - v56, v38);
        v47 = v57 + v47;
        v11 = fmax(v11, v53);
      }
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    }
    while (v44);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v58 = self->_viewsBelowInfoSection;
  v59 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
  v60 = v81;
  if (v59)
  {
    v61 = v59;
    v62 = v11 + v38;
    v63 = *(_QWORD *)v90;
    do
    {
      v64 = 0;
      v65 = v60;
      do
      {
        if (*(_QWORD *)v90 != v63)
          objc_enumerationMutation(v58);
        v66 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v64);
        objc_msgSend(v66, "tv_margin");
        v68 = v67;
        v60 = v69;
        v71 = Width - v88 - v82 - v67 - v70;
        v73 = v62 + fmax(v65, v72);
        objc_msgSend(v66, "sizeThatFits:", v71, 0.0);
        v75 = v74;
        if (v39 == 1)
          v76 = v87 - v88 - v71;
        else
          v76 = v88 + v68;
        if (objc_msgSend(v66, "tv_alignment") == 2)
        {
          -[_TVProductInfoView bounds](self, "bounds");
          UIRectCenteredXInRect();
          v76 = v79;
          v71 = v80;
        }
        else
        {
          v77 = v73;
          v78 = v75;
        }
        objc_msgSend(v66, "setFrame:", v76, v77, v71, v78);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v66, "setComponentsNeedUpdate");
        v62 = v75 + v73;
        ++v64;
        v65 = v60;
      }
      while (v61 != v64);
      v61 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
    }
    while (v61);
  }

}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[_TVProductInfoView viewsAboveInfoSection](self, "viewsAboveInfoSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10), "tv_impressionableElementsForDocument:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v8);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[_TVProductInfoView infoSectionViews](self, "infoSectionViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "tv_impressionableElementsForDocument:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v14);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[_TVProductInfoView viewsAboveInfoSection](self, "viewsAboveInfoSection", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22), "tv_impressionableElementsForDocument:", v4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSArray)viewsAboveInfoSection
{
  return self->_viewsAboveInfoSection;
}

- (NSArray)infoSectionViews
{
  return self->_infoSectionViews;
}

- (NSArray)viewsBelowInfoSection
{
  return self->_viewsBelowInfoSection;
}

- (UIView)defaultFocusView
{
  return self->_defaultFocusView;
}

- (void)setDefaultFocusView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFocusView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFocusView, 0);
  objc_storeStrong((id *)&self->_viewsBelowInfoSection, 0);
  objc_storeStrong((id *)&self->_infoSectionViews, 0);
  objc_storeStrong((id *)&self->_viewsAboveInfoSection, 0);
}

@end
