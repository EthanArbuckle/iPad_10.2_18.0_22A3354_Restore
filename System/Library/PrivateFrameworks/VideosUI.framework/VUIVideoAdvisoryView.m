@implementation VUIVideoAdvisoryView

- (VUIVideoAdvisoryView)initWithAdvisoryInfoDictionary:(id)a3 reduceMotion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  VUIVideoAdvisoryView *v7;
  uint64_t v8;
  VUIVideoAdvisoryViewLayout *layout;
  double v10;
  double v11;
  NSMutableArray *v12;
  NSMutableArray *additionalViews;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIVideoAdvisoryView;
  v7 = -[VUIVideoAdvisoryView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v7)
  {
    v8 = objc_opt_new();
    layout = v7->_layout;
    v7->_layout = (VUIVideoAdvisoryViewLayout *)v8;

    -[VUIVideoAdvisoryView _configureSubviewsWithDictionary:](v7, "_configureSubviewsWithDictionary:", v6);
  }
  v10 = 40.0;
  if (v4)
    v10 = 0.0;
  v7->_legendAnimationDistance = v10;
  v11 = 100.0;
  if (v4)
    v11 = 0.0;
  v7->_legendYAnimationDistance = v11;
  v7->_reduceMotion = v4;
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  additionalViews = v7->_additionalViews;
  v7->_additionalViews = v12;

  return v7;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t i;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  unint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v61 = *MEMORY[0x1E0C80C00];
  -[VUIVideoAdvisoryView _logoSize](self, "_logoSize");
  v54 = v6;
  v55 = v7;
  -[VUIVideoAdvisoryView _logoMargin](self, "_logoMargin");
  v52 = v9;
  v53 = v8;
  v50 = v10;
  v48 = v11;
  -[VUIVideoAdvisoryView _legendsMargin](self, "_legendsMargin");
  v51 = v12;
  v14 = v13;
  v49 = v15;
  v17 = v16;
  -[VUIVideoAdvisoryView layout](self, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "legendLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "margin");
  v21 = v20;
  v23 = v22;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[VUIVideoAdvisoryView legendViews](self, "legendViews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  v46 = v17;
  v47 = v14;
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v57;
    v28 = v14 + v17;
    v29 = v21 + v23;
    v30 = 0.0;
    v31 = 0.0;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v57 != v27)
          objc_enumerationMutation(v24);
        v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v33, "sizeThatFits:", width, height, *(_QWORD *)&v46);
        v30 = v30 + v34;
        objc_msgSend(v33, "legendDescriptionSizeThatFits:", width, height);
        v36 = v35;
        objc_msgSend(v33, "legendNameSizeThatFits:", width, height);
        v38 = v28 + v36 + v37 + v29 * 2.0;
        if (v38 > v31)
          v31 = v38;
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v26);
  }
  else
  {
    v30 = 0.0;
    v31 = 0.0;
  }

  -[VUIVideoAdvisoryView legendViews](self, "legendViews");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");

  -[VUIVideoAdvisoryView legendViews](self, "legendViews");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count"))
    v42 = v47 + v46 + v54 + v50 + v48 + v31;
  else
    v42 = v54;
  if (v30 + (double)v40 * (v51 + v49) >= v55 + v53 + v52)
    v43 = v30 + (double)v40 * (v51 + v49);
  else
    v43 = v55 + v53 + v52;

  v44 = v42;
  v45 = v43;
  result.height = v45;
  result.width = v44;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
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
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t i;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  unint64_t v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  double v67;
  double v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
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
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  objc_super v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v102.receiver = self;
  v102.super_class = (Class)VUIVideoAdvisoryView;
  -[VUIVideoAdvisoryView layoutSubviews](&v102, sel_layoutSubviews);
  -[VUIVideoAdvisoryView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VUIVideoAdvisoryView vuiIsRTL](self, "vuiIsRTL");
  -[VUIVideoAdvisoryView bounds](self, "bounds");
  v90 = v5;
  v92 = v6;
  v8 = v7;
  v10 = v9;
  -[VUIVideoAdvisoryView _logoSize](self, "_logoSize");
  v12 = v11;
  v87 = v13;
  -[VUIVideoAdvisoryView _logoMargin](self, "_logoMargin");
  v93 = v14;
  v16 = v15;
  v82 = v17;
  v19 = v18;
  v88 = v18;
  -[VUIVideoAdvisoryView _dividerSize](self, "_dividerSize");
  v89 = v20;
  v81 = v21;
  -[VUIVideoAdvisoryView _dividerMargin](self, "_dividerMargin");
  v80 = v22;
  v91 = v23;
  v84 = v24;
  -[VUIVideoAdvisoryView _legendSize](self, "_legendSize");
  v26 = v25;
  -[VUIVideoAdvisoryView _legendsMargin](self, "_legendsMargin");
  v85 = v27;
  v86 = v28;
  v83 = v29;
  v30 = v8 - v19 - v12;
  v31 = v12;
  v32 = v90 + v16;
  if (v4)
    v33 = v30;
  else
    v33 = v90 + v16;
  VUIRoundValue();
  v35 = v34;
  -[VUIVideoAdvisoryView logoImageView](self, "logoImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v33, v35, v31, v87);

  if (v4)
    v37 = v30 - (v88 + v91 - v89);
  else
    v37 = v32 + v91 + v88 + v31 + v32;
  -[VUIVideoAdvisoryView dividerView](self, "dividerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[VUIVideoAdvisoryView dividerView](self, "dividerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "frame");
    v41 = v40;

    if (v41 > 0.0)
      v41 = v81;
    -[VUIVideoAdvisoryView dividerView](self, "dividerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFrame:", v37, v92 + v80, v89, v41);

    v43 = v89;
  }
  else
  {
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  -[VUIVideoAdvisoryView legendViews](self, "legendViews");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  if (v45)
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v99;
      v50 = 0.0;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v99 != v49)
            objc_enumerationMutation(v46);
          v52 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v3, "legendNameMinWidth");
          v54 = v53;
          objc_msgSend(v52, "legendNameSizeThatFits:", v8, v10);
          if (v54 >= v55)
            v55 = v54;
          objc_msgSend(v3, "setLegendNameMinWidth:", v55);
          objc_msgSend(v52, "sizeThatFits:", v8, v10);
          if (v50 < v56)
            v50 = v56;
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
      }
      while (v48);
    }
    else
    {
      v50 = 0.0;
    }

    -[VUIVideoAdvisoryView legendViews](self, "legendViews");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");

    if (v58 < 2)
    {
      if (v10 - (v93 + v82) < v50)
        v50 = v10 - (v93 + v82);
      v26 = v50;
      v59 = v85;
    }
    else
    {
      v59 = v85;
      -[VUIVideoAdvisoryView legendViews](self, "legendViews");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "count");
      -[VUIVideoAdvisoryView legendViews](self, "legendViews");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "count");

    }
    VUIRoundValue();
    v63 = v62;
    if (v4)
      v64 = v37 + v83 * -2.0;
    else
      v64 = v8 - v37 + v83 * -2.0;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");

    if (v66 == 1)
    {
      objc_msgSend(v3, "legendMaxWidth");
      v64 = v67;
    }
    if (v4)
      v68 = v37 - (v83 + v84 + v64);
    else
      v68 = v37 + v83 + v84 + v43;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v70)
    {
      v71 = v70;
      v72 = v92 + v93 + v63;
      v73 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v95 != v73)
            objc_enumerationMutation(v69);
          v75 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          objc_msgSend(v75, "layer");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "presentationLayer");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0.0;
          if (!v77)
          {
            -[VUIVideoAdvisoryView legendAnimationDistance](self, "legendAnimationDistance");
            if (v4)
              v78 = -v79;
            else
              v78 = v79;
          }

          objc_msgSend(v75, "setFrame:", v68 + v78, v72, v64, v26);
          v72 = v86 + v59 + v26 + v72;
        }
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v71);
    }

  }
}

- (void)removeAllViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[VUIVideoAdvisoryView additionalViews](self, "additionalViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[VUIVideoAdvisoryView removeFromSuperview](self, "removeFromSuperview");
}

- (BOOL)_isPortrait
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;

  -[VUIVideoAdvisoryView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (!v3 && (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation") - 1) < 2
    || (v4 = +[VUIUtilities isIpadPortrait](VUIUtilities, "isIpadPortrait")))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (UIEdgeInsets)_margin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitMargin");
  else
    objc_msgSend(v4, "margin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_logoSize
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitLogoSize");
  else
    objc_msgSend(v4, "logoSize");
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_legendSize
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitLegendSize");
  else
    objc_msgSend(v4, "legendSize");
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_dividerSize
{
  double v3;
  double v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[VUIVideoAdvisoryView bounds](self, "bounds");
  v4 = v3;
  v5 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "portraitDividerSize");
  else
    objc_msgSend(v6, "dividerSize");
  v9 = v8;

  v10 = v9;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)_logoMargin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitLogoMargin");
  else
    objc_msgSend(v4, "logoMargin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_legendsMargin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitLegendsMargin");
  else
    objc_msgSend(v4, "legendsMargin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_dividerMargin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = -[VUIVideoAdvisoryView _isPortrait](self, "_isPortrait");
  -[VUIVideoAdvisoryView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitDividerMargin");
  else
    objc_msgSend(v4, "dividerMargin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_configureSubviewsWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  VUIVideoAdvisoryLegendView *v17;
  void *v18;
  VUIVideoAdvisoryLegendView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewLogoImageKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setImage:", v5);
  objc_msgSend(v4, "setAlpha:", 0.0);
  -[VUIVideoAdvisoryView addSubview:](self, "addSubview:", v4);
  -[VUIVideoAdvisoryView setLogoImageView:](self, "setLogoImageView:", v4);
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewLegendsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    v24 = v5;
    v25 = v4;
    -[VUIVideoAdvisoryView _dividerSize](self, "_dividerSize");
    v9 = v8;
    v10 = (void *)objc_opt_new();
    -[VUIVideoAdvisoryView layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dividerColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v12);

    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v9, 0.0);
    -[VUIVideoAdvisoryView addSubview:](self, "addSubview:", v10);
    v23 = v10;
    -[VUIVideoAdvisoryView setDividerView:](self, "setDividerView:", v10);
    v13 = objc_msgSend(v6, "count");
    if (v13 >= 6)
      v14 = 6;
    else
      v14 = v13;
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [VUIVideoAdvisoryLegendView alloc];
        -[VUIVideoAdvisoryView layout](self, "layout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[VUIVideoAdvisoryLegendView initWithLayout:](v17, "initWithLayout:", v18);

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewLegendDescriptionKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIVideoAdvisoryLegendView setLegendDescription:](v19, "setLegendDescription:", v20);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewLegendNameKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length"))
          -[VUIVideoAdvisoryLegendView setLegendName:](v19, "setLegendName:", v21);
        -[VUIVideoAdvisoryLegendView setAlpha:](v19, "setAlpha:", 0.0);
        -[VUIVideoAdvisoryView addSubview:](self, "addSubview:", v19);
        objc_msgSend(v7, "addObject:", v19);

      }
    }
    -[VUIVideoAdvisoryView setLegendViews:](self, "setLegendViews:", v7);

    v5 = v24;
    v4 = v25;
  }
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewAdditionalViewsDictionaryKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIVideoAdvisoryView setAdditionalViewsInfo:](self, "setAdditionalViewsInfo:", v22);

}

- (VUIVideoAdvisoryViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (VUIAdditionalAdvisoryInfoView)photoSensitivityView
{
  return self->_photoSensitivityView;
}

- (void)setPhotoSensitivityView:(id)a3
{
  objc_storeStrong((id *)&self->_photoSensitivityView, a3);
}

- (VUIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageView, a3);
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (NSArray)legendViews
{
  return self->_legendViews;
}

- (void)setLegendViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)additionalViewsInfo
{
  return self->_additionalViewsInfo;
}

- (void)setAdditionalViewsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_additionalViewsInfo, a3);
}

- (NSMutableArray)additionalViews
{
  return self->_additionalViews;
}

- (void)setAdditionalViews:(id)a3
{
  objc_storeStrong((id *)&self->_additionalViews, a3);
}

- (double)legendAnimationDistance
{
  return self->_legendAnimationDistance;
}

- (void)setLegendAnimationDistance:(double)a3
{
  self->_legendAnimationDistance = a3;
}

- (double)legendYAnimationDistance
{
  return self->_legendYAnimationDistance;
}

- (void)setLegendYAnimationDistance:(double)a3
{
  self->_legendYAnimationDistance = a3;
}

- (BOOL)reduceMotion
{
  return self->_reduceMotion;
}

- (void)setReduceMotion:(BOOL)a3
{
  self->_reduceMotion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalViews, 0);
  objc_storeStrong((id *)&self->_additionalViewsInfo, 0);
  objc_storeStrong((id *)&self->_legendViews, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_photoSensitivityView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)showAnimated:(BOOL)a3 platterView:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v6 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v6)
  {
    -[VUIVideoAdvisoryView _showWithCoreAnimationWithPlatterView:completion:](self, "_showWithCoreAnimationWithPlatterView:completion:", v8, v9);
  }
  else
  {
    -[VUIVideoAdvisoryView dividerView](self, "dividerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUIVideoAdvisoryView dividerView](self, "dividerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[VUIVideoAdvisoryView _dividerSize](self, "_dividerSize");
      v19 = v18;
      -[VUIVideoAdvisoryView dividerView](self, "dividerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    }
    -[VUIVideoAdvisoryView logoImageView](self, "logoImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 1.0);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26++), "setAlpha:", 1.0);
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v24);
    }

    if (v8)
    {
      -[VUIVideoAdvisoryView frame](self, "frame");
      v28 = v27 + -15.0;
      objc_msgSend(v8, "frame");
      v30 = v29;
      -[VUIVideoAdvisoryView frame](self, "frame");
      v32 = v31 + 30.0;
      objc_msgSend(v8, "frame");
      objc_msgSend(v8, "setFrame:", v28, v30, v32);
    }
    v9[2](v9);
  }

}

- (void)_showWithCoreAnimationWithPlatterView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  VUIVideoAdvisoryView *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
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
  id v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id obj;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v8 = (void *)MEMORY[0x1E0CD28B0];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __83__VUIVideoAdvisoryView_Animator___showWithCoreAnimationWithPlatterView_completion___block_invoke;
  v90[3] = &unk_1E9F98E68;
  v83 = v7;
  v91 = v83;
  objc_msgSend(v8, "setCompletionBlock:", v90);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMass:", 1.0);
  objc_msgSend(v9, "setStiffness:", 60.0);
  objc_msgSend(v9, "setDamping:", 16.0);
  objc_msgSend(v9, "setInitialVelocity:", 0.0);
  objc_msgSend(v9, "settlingDuration");
  objc_msgSend(v9, "setDuration:");
  -[VUIVideoAdvisoryView dividerView](self, "dividerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[VUIVideoAdvisoryView bounds](self, "bounds");
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, v15, v17, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", v20);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, v15, v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToValue:", v21);

  objc_msgSend(v11, "addAnimation:forKey:", v9, CFSTR("bounds"));
  v82 = v11;
  objc_msgSend(v11, "setBounds:", v13, v15, v17, v19);
  if (v6)
  {
    objc_msgSend(v6, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[VUIVideoAdvisoryView bounds](self, "bounds");
    v30 = v29 + 30.0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v24, v26, 0.0, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v31);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v24, v26, v30, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToValue:", v32);

    objc_msgSend(v22, "addAnimation:forKey:", v9, CFSTR("bounds"));
    objc_msgSend(v22, "setBounds:", v24, v26, v30, v28);

  }
  v84 = v6;
  objc_msgSend(v9, "settlingDuration");
  v34 = v33;
  v35 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v36) = 1043207291;
  LODWORD(v37) = 1062501089;
  LODWORD(v38) = 1043207291;
  LODWORD(v39) = 1062501089;
  v40 = objc_msgSend(v35, "initWithControlPoints::::", v36, v38, v37, v39);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)v40;
  objc_msgSend(v41, "setTimingFunction:", v40);
  objc_msgSend(v41, "setBeginTime:", v34 + CACurrentMediaTime());
  LODWORD(v42) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFromValue:", v43);

  LODWORD(v44) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setToValue:", v45);

  objc_msgSend(v41, "setDuration:", 0.879999995);
  objc_msgSend(v41, "setRemovedOnCompletion:", 0);
  v46 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v41, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v9, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  v80 = v46;
  objc_msgSend(v9, "setFillMode:", v46);
  v47 = -[VUIVideoAdvisoryView vuiIsRTL](self, "vuiIsRTL");
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[VUIVideoAdvisoryView legendViews](self, "legendViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
  if (v48)
  {
    v49 = v48;
    v50 = self;
    v51 = *(_QWORD *)v87;
    do
    {
      v52 = 0;
      v53 = v9;
      do
      {
        if (*(_QWORD *)v87 != v51)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v52), "layer");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "position");
        v56 = v55;
        v58 = v57;
        -[VUIVideoAdvisoryView legendAnimationDistance](v50, "legendAnimationDistance");
        if (!v47)
          v59 = -v59;
        v60 = v56 + v59;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v56, v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setFromValue:", v61);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v60, v58);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setToValue:", v62);

        objc_msgSend(v53, "setBeginTime:", v34 + CACurrentMediaTime());
        objc_msgSend(v41, "setBeginTime:", v34 + CACurrentMediaTime());
        objc_msgSend(v54, "addAnimation:forKey:", v53, CFSTR("position"));
        objc_msgSend(v54, "setPosition:", v60, v58);
        objc_msgSend(v54, "addAnimation:forKey:", v41, CFSTR("opacity"));
        LODWORD(v63) = 0;
        objc_msgSend(v54, "setOpacity:", v63);
        v34 = v34 + 0.200000003;
        v9 = (void *)objc_msgSend(v53, "copy");

        ++v52;
        v53 = v9;
      }
      while (v49 != v52);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    }
    while (v49);
  }
  else
  {
    v50 = self;
  }

  objc_msgSend(v9, "settlingDuration");
  v65 = v64;
  v66 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v67) = 1051260355;
  LODWORD(v68) = 1059816735;
  LODWORD(v69) = 0;
  LODWORD(v70) = 1.0;
  v71 = (void *)objc_msgSend(v66, "initWithControlPoints::::", v67, v69, v68, v70);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setTimingFunction:", v71);
  objc_msgSend(v72, "setBeginTime:", v65 + CACurrentMediaTime());
  LODWORD(v73) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFromValue:", v74);

  LODWORD(v75) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setToValue:", v76);

  objc_msgSend(v72, "setDuration:", 0.88);
  objc_msgSend(v72, "setRemovedOnCompletion:", 0);
  objc_msgSend(v72, "setFillMode:", v80);
  -[VUIVideoAdvisoryView logoImageView](v50, "logoImageView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "layer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v78, "addAnimation:forKey:", v72, CFSTR("opacity"));
  LODWORD(v79) = 0;
  objc_msgSend(v78, "setOpacity:", v79);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __83__VUIVideoAdvisoryView_Animator___showWithCoreAnimationWithPlatterView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hideAnimated:(BOOL)a3 platterView:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v6)
  {
    -[VUIVideoAdvisoryView _hideWithCoreAnimationWithPlatterView:completion:](self, "_hideWithCoreAnimationWithPlatterView:completion:", v8, v9);
  }
  else
  {
    -[VUIVideoAdvisoryView dividerView](self, "dividerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUIVideoAdvisoryView dividerView](self, "dividerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[VUIVideoAdvisoryView dividerView](self, "dividerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v13, v15, v17, 0.0);

    }
    -[VUIVideoAdvisoryView logoImageView](self, "logoImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24++), "setAlpha:", 0.0);
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v22);
    }

    -[VUIVideoAdvisoryView additionalViewsInfo](self, "additionalViewsInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      -[VUIVideoAdvisoryView superview](self, "superview");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIVideoAdvisoryView _showAdditionalViewAtIndex:animated:platterView:superview:completion:](self, "_showAdditionalViewAtIndex:animated:platterView:superview:completion:", 0, 0, v8, v27, v9);

    }
    else
    {
      v9[2](v9);
    }
  }

}

- (void)_showAdditionalViewAtIndex:(unint64_t)a3 animated:(BOOL)a4 platterView:(id)a5 superview:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  VUIAdditionalAdvisoryInfoView *v17;
  void *v18;
  void *v19;
  double v20;
  float v21;
  float v22;
  id v23;
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
  double v40;
  double v41;
  int v42;
  double v43;
  id v44;
  id v45;
  id v46;
  VUIAdditionalAdvisoryInfoView *v47;
  _QWORD block[4];
  VUIAdditionalAdvisoryInfoView *v49;
  id v50;
  id v51;
  id v52;
  id v53[3];
  BOOL v54;
  id location;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[VUIVideoAdvisoryView additionalViewsInfo](self, "additionalViewsInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[VUIAdditionalAdvisoryInfoView initWithAdvisoryInfoDictionary:reduceMotion:]([VUIAdditionalAdvisoryInfoView alloc], "initWithAdvisoryInfoDictionary:reduceMotion:", v16, -[VUIVideoAdvisoryView reduceMotion](self, "reduceMotion"));
  -[VUIVideoAdvisoryView additionalViews](self, "additionalViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v17);

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VUIIAdditionalAdvisoryInfoDisplayDurationKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v20 = 6.0;
  if (v21 > 0.0)
  {
    objc_msgSend(v19, "floatValue");
    v20 = v22;
  }
  v23 = v13;
  objc_msgSend(v23, "frame");
  -[VUIAdditionalAdvisoryInfoView sizeThatFits:](v17, "sizeThatFits:", v24, v25);
  v27 = v26;
  -[VUIVideoAdvisoryView frame](self, "frame");
  v29 = v28;
  -[VUIVideoAdvisoryView frame](self, "frame");
  v31 = v30;
  -[VUIVideoAdvisoryView frame](self, "frame");
  v33 = v32;
  objc_msgSend(v23, "frame");
  -[VUIVideoAdvisoryView sizeThatFits:](self, "sizeThatFits:", v34, v35);
  v37 = v36;
  objc_msgSend(v23, "frame");
  -[VUIAdditionalAdvisoryInfoView sizeThatFits:](v17, "sizeThatFits:", v38, v39);
  v41 = v40;
  v42 = -[VUIVideoAdvisoryView vuiIsRTL](self, "vuiIsRTL");
  v43 = v41 - v37;
  if (!v42)
    v43 = 0.0;
  -[VUIAdditionalAdvisoryInfoView setFrame:](v17, "setFrame:", v29 - v43, v31, v27, v33);
  objc_msgSend(v23, "addSubview:", v17);
  -[VUIAdditionalAdvisoryInfoView layoutIfNeeded](v17, "layoutIfNeeded");
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke;
  block[3] = &unk_1E9FA35C8;
  objc_copyWeak(v53, &location);
  v53[1] = (id)a3;
  v54 = a4;
  v49 = v17;
  v50 = v12;
  v53[2] = *(id *)&v20;
  v51 = v23;
  v52 = v14;
  v44 = v14;
  v45 = v23;
  v46 = v12;
  v47 = v17;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v53);
  objc_destroyWeak(&location);

}

void __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15[3];
  char v16;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 72))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "dividerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  v7 = *(unsigned __int8 *)(a1 + 88);
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_2;
  v10[3] = &unk_1E9FA35A0;
  v15[1] = *(id *)(a1 + 80);
  objc_copyWeak(v15, v2);
  v15[2] = *(id *)(a1 + 72);
  v16 = *(_BYTE *)(a1 + 88);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v9, "showWithAnimatedLogoAndText:animateDivider:platterView:completion:", v7, v5, v8, v10);

  objc_destroyWeak(v15);
}

void __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10[2];
  char v11;

  v2 = (void *)MEMORY[0x1E0C99E88];
  v3 = *(double *)(a1 + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_3;
  v5[3] = &unk_1E9FA3578;
  objc_copyWeak(v10, (id *)(a1 + 64));
  v10[1] = *(id *)(a1 + 80);
  v11 = *(_BYTE *)(a1 + 88);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v4 = (id)objc_msgSend(v2, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, v3);

  objc_destroyWeak(v10);
}

void __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 72) + 1;
  objc_msgSend(WeakRetained, "additionalViewsInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 < v5)
    objc_msgSend(WeakRetained, "_showAdditionalViewAtIndex:animated:platterView:superview:completion:", v3, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  objc_msgSend(WeakRetained, "additionalViewsInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3 >= objc_msgSend(v6, "count");

  v8 = *(void **)(a1 + 48);
  v9 = *(unsigned __int8 *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_4;
  v11[3] = &unk_1E9FA3188;
  v12 = v8;
  v14 = v7;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v12, "hideAnimated:platterView:hidePlatterView:completion:", v9, v10, v7, v11);

}

uint64_t __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)_hideWithCoreAnimationWithPlatterView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  VUIVideoAdvisoryView *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  id v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i;
  void *v95;
  double v96;
  id v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  uint64_t v119;
  VUIVideoAdvisoryView *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[5];
  id v130;
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VUIVideoAdvisoryView additionalViewsInfo](self, "additionalViewsInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[VUIVideoAdvisoryView superview](self, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideoAdvisoryView _showAdditionalViewAtIndex:animated:platterView:superview:completion:](self, "_showAdditionalViewAtIndex:animated:platterView:superview:completion:", 0, 1, v6, v10, v7);

  }
  v11 = 0x1E0CD2000uLL;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v12 = (void *)MEMORY[0x1E0CD28B0];
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __83__VUIVideoAdvisoryView_Animator___hideWithCoreAnimationWithPlatterView_completion___block_invoke;
  v129[3] = &unk_1E9F99420;
  v117 = v7;
  v129[4] = self;
  v130 = v117;
  objc_msgSend(v12, "setCompletionBlock:", v129);
  -[VUIVideoAdvisoryView additionalViewsInfo](self, "additionalViewsInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = objc_alloc(MEMORY[0x1E0CD27D0]);
  if (v14)
  {
    v113 = v6;
    LODWORD(v19) = 1059816735;
    LODWORD(v17) = 0;
    LODWORD(v18) = 0;
    LODWORD(v16) = 1051260355;
    v20 = objc_msgSend(v15, "initWithControlPoints::::", v16, v17, v18, v19);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDuration:", 0.883000016);
    v116 = (void *)v20;
    objc_msgSend(v21, "setTimingFunction:", v20);
    -[VUIVideoAdvisoryView logoImageView](self, "logoImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v115 = v21;
    objc_msgSend(v23, "addAnimation:forKey:", v21, CFSTR("opacity"));
    LODWORD(v24) = 0;
    v118 = v23;
    objc_msgSend(v23, "setOpacity:", v24);
    v25 = objc_alloc(MEMORY[0x1E0CD27D0]);
    LODWORD(v26) = 1043207291;
    LODWORD(v27) = 0;
    LODWORD(v28) = 1.0;
    LODWORD(v29) = 1062501089;
    v30 = objc_msgSend(v25, "initWithControlPoints::::", v26, v27, v29, v28);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = (void *)v30;
    objc_msgSend(v31, "setTimingFunction:", v30);
    objc_msgSend(v31, "setDuration:", 0.300000012);
    objc_msgSend(v31, "setRemovedOnCompletion:", 0);
    objc_msgSend(v31, "setFromValue:", &unk_1EA0BBDC8);
    objc_msgSend(v31, "setToValue:", &unk_1EA0BBDD8);
    v119 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v31, "setFillMode:");
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMass:", 1.0);
    objc_msgSend(v32, "setStiffness:", 24.0);
    objc_msgSend(v32, "setDamping:", 15.0);
    objc_msgSend(v32, "setInitialVelocity:", 0.0);
    objc_msgSend(v32, "settlingDuration");
    objc_msgSend(v32, "setDuration:");
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v33 = self;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "reverseObjectEnumerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v122;
      v39 = 0.1;
      do
      {
        v40 = 0;
        v41 = v32;
        v42 = v31;
        do
        {
          if (*(_QWORD *)v122 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * v40), "layer");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "presentationLayer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "position");
          v46 = v45;
          v48 = v47;

          -[VUIVideoAdvisoryView legendYAnimationDistance](v33, "legendYAnimationDistance");
          v50 = v48 + v49;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v46, v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setFromValue:", v51);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v46, v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setToValue:", v52);

          objc_msgSend(v41, "setRemovedOnCompletion:", 0);
          objc_msgSend(v41, "setFillMode:", v119);
          objc_msgSend(v43, "addAnimation:forKey:", v41, CFSTR("position"));
          objc_msgSend(v43, "setPosition:", v46, v50);
          objc_msgSend(v43, "addAnimation:forKey:", v42, CFSTR("opacity"));
          objc_msgSend(v42, "setBeginTime:", v39 + CACurrentMediaTime());
          LODWORD(v53) = 1.0;
          objc_msgSend(v43, "setOpacity:", v53);
          v39 = v39 + 0.100000001;
          v32 = (void *)objc_msgSend(v41, "copy");

          v31 = (void *)objc_msgSend(v42, "copy");
          ++v40;
          v41 = v32;
          v42 = v31;
        }
        while (v37 != v40);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
      }
      while (v37);
    }

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDuration:", 0.88);
    v55 = objc_alloc(MEMORY[0x1E0CD27D0]);
    LODWORD(v56) = 0;
    LODWORD(v57) = 0;
    LODWORD(v58) = 1051260355;
    LODWORD(v59) = 1062501089;
    v60 = (void *)objc_msgSend(v55, "initWithControlPoints::::", v58, v56, v59, v57);
    objc_msgSend(v54, "setTimingFunction:", v60);
    -[VUIVideoAdvisoryView dividerView](v33, "dividerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "bounds");
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFromValue:", v71);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v64, v66, v68, 0.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setToValue:", v72);

    objc_msgSend(v54, "setRemovedOnCompletion:", 0);
    objc_msgSend(v54, "setFillMode:", v119);
    objc_msgSend(v62, "addAnimation:forKey:", v54, CFSTR("bounds"));
    objc_msgSend(v62, "setBounds:", v64, v66, v68, v70);

    v6 = v113;
    v11 = 0x1E0CD2000;
  }
  else
  {
    LODWORD(v17) = 0;
    LODWORD(v16) = 1051260355;
    LODWORD(v18) = 1062501089;
    LODWORD(v19) = 1062501089;
    v73 = objc_msgSend(v15, "initWithControlPoints::::", v16, v17, v18, v19);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setDuration:", 0.430000007);
    v116 = (void *)v73;
    objc_msgSend(v74, "setTimingFunction:", v73);
    LODWORD(v75) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFromValue:", v76);

    LODWORD(v77) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setToValue:", v78);

    -[VUIVideoAdvisoryView logoImageView](self, "logoImageView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "addAnimation:forKey:", v74, CFSTR("opacity"));
    LODWORD(v81) = 0;
    v118 = v80;
    objc_msgSend(v80, "setOpacity:", v81);
    if (v6)
    {
      objc_msgSend(v6, "layer");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "addAnimation:forKey:", v74, CFSTR("opacity"));
      LODWORD(v83) = 0;
      objc_msgSend(v82, "setOpacity:", v83);

    }
    v115 = v74;
    v84 = objc_alloc(MEMORY[0x1E0CD27D0]);
    LODWORD(v85) = 0;
    LODWORD(v86) = 1051260355;
    LODWORD(v87) = 1062501089;
    LODWORD(v88) = 1062501089;
    v89 = objc_msgSend(v84, "initWithControlPoints::::", v86, v85, v87, v88);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDuration:", 0.430000007);
    v114 = (void *)v89;
    objc_msgSend(v31, "setTimingFunction:", v89);
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v120 = self;
    -[VUIVideoAdvisoryView legendViews](self, "legendViews");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v125, v132, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v126;
      do
      {
        for (i = 0; i != v92; ++i)
        {
          if (*(_QWORD *)v126 != v93)
            objc_enumerationMutation(v90);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i), "layer");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "addAnimation:forKey:", v31, CFSTR("opacity"));
          LODWORD(v96) = 0;
          objc_msgSend(v118, "setOpacity:", v96);

        }
        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v125, v132, 16);
      }
      while (v92);
    }

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDuration:", 0.88);
    v97 = objc_alloc(MEMORY[0x1E0CD27D0]);
    LODWORD(v98) = 0;
    LODWORD(v99) = 0;
    LODWORD(v100) = 1051260355;
    LODWORD(v101) = 1062501089;
    v54 = (void *)objc_msgSend(v97, "initWithControlPoints::::", v100, v98, v101, v99);
    objc_msgSend(v32, "setTimingFunction:", v54);
    -[VUIVideoAdvisoryView dividerView](v120, "dividerView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "bounds");
    v104 = v103;
    v106 = v105;
    v108 = v107;
    v110 = v109;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFromValue:", v111);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v104, v106, v108, 0.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setToValue:", v112);

    objc_msgSend(v32, "setRemovedOnCompletion:", 0);
    objc_msgSend(v32, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v60, "addAnimation:forKey:", v32, CFSTR("bounds"));
    objc_msgSend(v60, "setBounds:", v104, v106, v108, v110);
  }

  objc_msgSend(*(id *)(v11 + 2224), "commit");
}

void __83__VUIVideoAdvisoryView_Animator___hideWithCoreAnimationWithPlatterView_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "additionalViewsInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (!v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

@end
