@implementation _TVRowView

- (_TVRowView)initWithFrame:(CGRect)a3
{
  _TVRowView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVRowView;
  result = -[_TVFocusRedirectView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_contentVerticalAlignment = 2;
  return result;
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  if (a3)
  {
    if (self->_contentVerticalAlignment != a3)
    {
      self->_contentVerticalAlignment = a3;
      -[_TVRowView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setComponents:(id)a3
{
  id WeakRetained;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  int64_t v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  int v37;
  void *v38;
  id *p_lastFocusedView;
  id *v40;
  id *location;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  location = (id *)&self->_components;
  v42 = a3;
  if (objc_msgSend(*location, "isEqual:"))
  {
    -[_TVRowView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_51;
  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0x7FFFFFFFFFFFFFFFLL;
  p_lastFocusedView = (id *)&self->_lastFocusedView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);

  if (WeakRetained)
  {
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __28___TVRowView_setComponents___block_invoke;
    v48[3] = &unk_24EB85490;
    v48[4] = self;
    v48[5] = &v49;
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v48);
    if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = *location;
      v7 = objc_loadWeakRetained(p_lastFocusedView);
      v8 = objc_msgSend(v6, "indexOfObject:", v7);
      v50[3] = v8;

    }
  }
  objc_storeStrong(location, a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = v42;
  v12 = 0;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          v18 = -[_TVRowView _alignmentFromView:](self, "_alignmentFromView:", v17);
          v19 = v9;
          if (v18 == 1 || (v19 = v10, v18 == 2))
          {
LABEL_16:
            objc_msgSend(v19, "addObject:", v17, p_lastFocusedView);
          }
          else if (v18 == 3)
          {
            v19 = v43;
            goto LABEL_16;
          }
          v20 = objc_msgSend(v17, "canBecomeFocused", p_lastFocusedView);
          if (v12)
            v21 = 0;
          else
            v21 = v20;
          if (v21 == 1)
            v12 = v17;

          continue;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v13);
  }

  v22 = objc_msgSend(v9, "count");
  if (v22)
    v23 = (void *)objc_msgSend(v9, "copy");
  else
    v23 = 0;
  objc_storeStrong((id *)&self->_leftComponents, v23);
  if (v22)

  v24 = objc_msgSend(v10, "count", p_lastFocusedView);
  if (v24)
    v25 = (void *)objc_msgSend(v10, "copy");
  else
    v25 = 0;
  objc_storeStrong((id *)&self->_centerComponents, v25);
  if (v24)

  v26 = objc_msgSend(v43, "count");
  if (v26)
    v27 = (void *)objc_msgSend(v43, "copy");
  else
    v27 = 0;
  objc_storeStrong((id *)&self->_rightComponents, v27);
  if (v26)

  v28 = (void *)MEMORY[0x24BDBCEB8];
  -[_TVRowView leftComponents](self, "leftComponents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "arrayWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVRowView centerComponents](self, "centerComponents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v31);

  -[_TVRowView rightComponents](self, "rightComponents");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v32);

  v33 = objc_msgSend(v30, "count");
  if (v33)
    v34 = (void *)objc_msgSend(v30, "copy");
  else
    v34 = 0;
  objc_storeStrong((id *)&self->_allComponents, v34);
  if (v33)

  v35 = v50[3];
  if (v35 == 0x7FFFFFFFFFFFFFFFLL
    || v35 >= objc_msgSend(*location, "count")
    || (objc_msgSend(*location, "objectAtIndexedSubscript:", v50[3]),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        v37 = objc_msgSend(v36, "canBecomeFocused"),
        v36,
        !v37))
  {
    objc_storeWeak(v40, v12);
  }
  else
  {
    objc_msgSend(*location, "objectAtIndexedSubscript:", v50[3]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(v40, v38);

  }
  -[_TVRowView _resetSubviews](self, "_resetSubviews");

  _Block_object_dispose(&v49, 8);
LABEL_51:

}

- (void)setPreferredFocusedComponent:(id)a3
{
  id v4;
  id v5;

  v4 = objc_storeWeak((id *)&self->_preferredFocusedComponent, a3);
  v5 = a3;
  if (a3)
  {
    objc_storeWeak((id *)&self->_lastFocusedView, a3);
    v5 = a3;
  }

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_components;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "setHighlighted:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  UIView **p_lastFocusedView;
  id WeakRetained;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  p_lastFocusedView = &self->_lastFocusedView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_lastFocusedView);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "nextFocusedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_allComponents;
    v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v5, "isDescendantOfView:", v10, (_QWORD)v11))
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_storeWeak((id *)&self->_lastFocusedView, v7);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_TVRowView _sizeThatFitsComponents:boundingSize:](self, "_sizeThatFitsComponents:boundingSize:", self->_allComponents, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)_TVRowView;
  -[_TVFocusRedirectView layoutSubviews](&v23, sel_layoutSubviews);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_allComponents;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        -[_TVRowView bounds](self, "bounds", (_QWORD)v19);
        -[_TVRowView _addSubview:maxViewWidth:](self, "_addSubview:maxViewWidth:", v8, v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  -[_TVRowView leftComponents](self, "leftComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[_TVRowView leftComponents](self, "leftComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRowView _lineUpComponents:alignment:attribute:](self, "_lineUpComponents:alignment:attribute:", v12, -[_TVRowView contentVerticalAlignment](self, "contentVerticalAlignment"), 1);

  }
  -[_TVRowView centerComponents](self, "centerComponents", (_QWORD)v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[_TVRowView centerComponents](self, "centerComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRowView _lineUpComponents:alignment:attribute:](self, "_lineUpComponents:alignment:attribute:", v15, -[_TVRowView contentVerticalAlignment](self, "contentVerticalAlignment"), 9);

  }
  -[_TVRowView rightComponents](self, "rightComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[_TVRowView rightComponents](self, "rightComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRowView _lineUpComponents:alignment:attribute:](self, "_lineUpComponents:alignment:attribute:", v18, -[_TVRowView contentVerticalAlignment](self, "contentVerticalAlignment"), 2);

  }
}

- (void)_lineUpComponents:(id)a3 alignment:(int64_t)a4 attribute:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  CGFloat *v14;
  double height;
  double v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  id v20;
  CGFloat y;
  CGFloat x;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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
  BOOL v40;
  int64_t v41;
  double v42;
  double Width;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  char v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  CGFloat v61;
  double v62;
  void *v63;
  double v64;
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
  _BOOL4 v76;
  double v77;
  uint64_t v78;
  id obj;
  double v80;
  void *v81;
  CGFloat v82;
  CGFloat v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v89 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (-[_TVRowView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 1)
  {
    -[_TVRowView leftComponents](self, "leftComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[_TVRowView rightComponents](self, "rightComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  -[_TVRowView rightComponents](self, "rightComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
    goto LABEL_8;
  -[_TVRowView leftComponents](self, "leftComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = v9;
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
  }
  else
  {
    -[_TVRowView centerComponents](self, "centerComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "count") == 0;

  }
LABEL_11:

  -[UIView tv_interitemSpacing](self, "tv_interitemSpacing");
  v80 = v13;
  v14 = (CGFloat *)MEMORY[0x24BDBF090];
  v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  v18 = &stru_24EB8B108;
  if (v17)
  {
    v19 = v17;
    v20 = 0;
    x = *v14;
    y = v14[1];
    v23 = *(_QWORD *)v85;
    v73 = height;
    v74 = v16;
    v71 = y;
    v72 = *v14;
    v77 = 0.0;
    v76 = v11;
    do
    {
      v24 = 0;
      v78 = v19;
      do
      {
        if (*(_QWORD *)v85 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v24);
        objc_msgSend((id)objc_opt_class(), "_leftAlignedFrameForComponent:previousComponent:interitemSpacing:", v25, v20, v80);
        v27 = v26;
        v82 = v29;
        v83 = v28;
        v31 = v30;
        objc_msgSend(v25, "tv_nonDirectionalMargin");
        v33 = v32;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_TVRowView bounds](self, "bounds");
          v35 = v34;
          if (v11)
          {
            objc_msgSend(v25, "tv_margin");
            v37 = v35 - v36;
            objc_msgSend(v25, "tv_margin");
            v39 = v37 - v38;
          }
          else
          {
            v90.origin.x = x;
            v90.origin.y = y;
            v90.size.width = v16;
            v90.size.height = height;
            v39 = v35 - CGRectGetWidth(v90) - v27 - v33;
          }
          v31 = fmin(v31, v39);
        }
        if (v20)
          v40 = 0;
        else
          v40 = a5 == 9;
        if (v40)
          v27 = 0.0;
        if (v11)
        {
          v41 = a5;
          if (a5 == 9)
            v42 = 0.0;
          else
            v42 = v33;
          v91.origin.x = x;
          v91.origin.y = y;
          v91.size.width = v16;
          v91.size.height = height;
          Width = CGRectGetWidth(v91);
          v92.origin.x = v27;
          v92.size.height = v82;
          v92.origin.y = v83;
          v92.size.width = v31;
          v44 = ceil(v42 + Width + CGRectGetMaxX(v92));
          -[_TVRowView bounds](self, "bounds");
          v46 = ceil(v45);
          objc_msgSend(v25, "valueForTVViewStyle:", CFSTR("tv-group"));
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v47;
          v49 = &stru_24EB8B108;
          if (v47)
            v49 = (__CFString *)v47;
          v50 = v49;

          v51 = -[__CFString isEqualToString:](v18, "isEqualToString:", v50);
          if (v44 <= v46 && (v51 & 1) != 0)
          {
            v18 = v50;
            a5 = v41;
          }
          else
          {
            objc_msgSend(v81, "lastObject", *(_QWORD *)&v71, *(_QWORD *)&v72, *(_QWORD *)&v73, *(_QWORD *)&v74);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "tv_nonDirectionalMargin");
            v54 = v16 + v53;

            v55 = (void *)objc_opt_class();
            -[_TVRowView bounds](self, "bounds");
            objc_msgSend(v55, "_alignComponents:withLineSize:boundingRect:originYBump:verticalAlignment:horizontalAlignment:", v81, a4, v41, v54, height, v56, v57, v58, v59, v77);
            v93.origin.x = x;
            v93.origin.y = y;
            v93.size.width = v16;
            v93.size.height = height;
            v77 = v77 + CGRectGetHeight(v93);

            objc_msgSend(v81, "removeAllObjects");
            v20 = 0;
            v18 = v50;
            a5 = v41;
            v27 = 0.0;
            height = v73;
            v16 = v74;
            y = v71;
            x = v72;
          }
          v19 = v78;
          v11 = v76;
        }
        v60 = v20;
        v94.origin.x = x;
        v94.origin.y = y;
        v94.size.width = v16;
        v94.size.height = height;
        v61 = v27 + CGRectGetWidth(v94);
        v95.origin.x = x;
        v95.origin.y = y;
        v95.size.width = v16;
        v95.size.height = height;
        v98.origin.x = v61;
        v98.origin.y = v83;
        v98.size.width = v31;
        v98.size.height = v82;
        v96 = CGRectUnion(v95, v98);
        x = v96.origin.x;
        y = v96.origin.y;
        v16 = v96.size.width;
        height = v96.size.height;
        v96.origin.x = v61;
        v96.origin.y = v83;
        v96.size.width = v31;
        v96.size.height = v82;
        v97 = CGRectIntegral(v96);
        objc_msgSend(v25, "setFrame:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
        objc_msgSend(v81, "addObject:", v25);
        v20 = v25;

        ++v24;
      }
      while (v19 != v24);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
    v77 = 0.0;
  }

  if (!v11)
  {
    -[_TVRowView bounds](self, "bounds");
    height = v62;
  }
  objc_msgSend(v81, "lastObject", *(_QWORD *)&v71, *(_QWORD *)&v72, *(_QWORD *)&v73, *(_QWORD *)&v74);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "tv_nonDirectionalMargin");
  v65 = v16 + v64;

  v66 = (void *)objc_opt_class();
  -[_TVRowView bounds](self, "bounds");
  objc_msgSend(v66, "_alignComponents:withLineSize:boundingRect:originYBump:verticalAlignment:horizontalAlignment:", v81, a4, a5, v65, height, v67, v68, v69, v70, v77);

}

- (CGSize)_sizeThatFitsComponents:(id)a3 boundingSize:(CGSize)a4
{
  double height;
  double width;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat x;
  CGFloat y;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  void *v60;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGSize result;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  height = a4.height;
  width = a4.width;
  v8 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[UIView tv_interitemSpacing](self, "tv_interitemSpacing", a3);
  v12 = v11;
  v13 = -[_TVRowView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v13 == 1)
  {
    -[_TVRowView rightComponents](self, "rightComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      -[_TVRowView leftComponents](self, "leftComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "count"))
      {
        -[_TVRowView centerComponents](self, "centerComponents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (!v17)
        {
          v18 = 1;
          v19 = 1;
LABEL_14:
          v23 = (void *)objc_opt_class();
          -[_TVRowView rightComponents](self, "rightComponents");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v24, 1, v19, v12, width, height);
          v84.origin.x = v25;
          v84.origin.y = v26;
          v84.size.width = v27;
          v84.size.height = v28;
          v73.origin.x = v8;
          v73.origin.y = v7;
          v73.size.width = v10;
          v73.size.height = v9;
          v74 = CGRectUnion(v73, v84);
          x = v74.origin.x;
          y = v74.origin.y;
          v31 = v74.size.width;
          v32 = v74.size.height;

          v33 = (void *)objc_opt_class();
          -[_TVRowView leftComponents](self, "leftComponents");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v34, 3, v19, v12, width, height);
          v36 = v35;
          v38 = v37;
          v40 = v39;
          v42 = v41;
          goto LABEL_18;
        }
        goto LABEL_10;
      }
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  -[_TVRowView leftComponents](self, "leftComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "count"))
    goto LABEL_9;
  -[_TVRowView rightComponents](self, "rightComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
LABEL_8:

    goto LABEL_9;
  }
  -[_TVRowView centerComponents](self, "centerComponents");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (!v44)
  {
    v18 = 1;
    v22 = 1;
    goto LABEL_17;
  }
LABEL_10:
  -[_TVRowView leftComponents](self, "leftComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v18 = 0;
  }
  else
  {
    -[_TVRowView rightComponents](self, "rightComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v21, "count") == 0;

  }
  v19 = 0;
  v22 = 0;
  if (v13 == 1)
    goto LABEL_14;
LABEL_17:
  v45 = (void *)objc_opt_class();
  -[_TVRowView leftComponents](self, "leftComponents");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v46, 1, v22, v12, width, height);
  v85.origin.x = v47;
  v85.origin.y = v48;
  v85.size.width = v49;
  v85.size.height = v50;
  v75.origin.x = v8;
  v75.origin.y = v7;
  v75.size.width = v10;
  v75.size.height = v9;
  v76 = CGRectUnion(v75, v85);
  x = v76.origin.x;
  y = v76.origin.y;
  v31 = v76.size.width;
  v32 = v76.size.height;

  v51 = (void *)objc_opt_class();
  -[_TVRowView rightComponents](self, "rightComponents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v34, 3, v22, v12, width, height);
  v36 = v52;
  v38 = v53;
  v40 = v54;
  v42 = v55;
  v19 = v22;
LABEL_18:
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = v31;
  v77.size.height = v32;
  v78 = CGRectUnion(v77, *(CGRect *)&v36);
  v56 = v78.origin.x;
  v57 = v78.origin.y;
  v58 = v78.size.width;
  v59 = v78.size.height;

  v60 = (void *)objc_opt_class();
  -[_TVRowView centerComponents](self, "centerComponents");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v61, 2, v19, v12, width, height);
  v86.origin.x = v62;
  v86.origin.y = v63;
  v86.size.width = v64;
  v86.size.height = v65;
  v79.origin.x = v56;
  v79.origin.y = v57;
  v79.size.width = v58;
  v79.size.height = v59;
  v80 = CGRectUnion(v79, v86);
  v66 = v80.origin.x;
  v67 = v80.origin.y;
  v68 = v80.size.width;
  v69 = v80.size.height;

  if ((v19 & 1) == 0)
  {
    if (!v18)
    {
      v81.origin.x = v66;
      v81.origin.y = v67;
      v81.size.width = v68;
      v81.size.height = v69;
      if (CGRectGetWidth(v81) < width)
        v68 = width;
    }
    if (height > 0.0)
    {
      v82.origin.x = v66;
      v82.origin.y = v67;
      v82.size.width = v68;
      v82.size.height = v69;
      v69 = fmin(height, CGRectGetHeight(v82));
    }
    if (width > 0.0)
    {
      v83.origin.x = v66;
      v83.origin.y = v67;
      v83.size.width = v68;
      v83.size.height = v69;
      v68 = fmin(width, CGRectGetWidth(v83));
    }
  }
  v70 = v68;
  v71 = v69;
  result.height = v71;
  result.width = v70;
  return result;
}

- (void)_addSubview:(id)a3 maxViewWidth:(double)a4
{
  _TVRowView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "superview");
  v6 = (_TVRowView *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
    -[_TVRowView addSubview:](self, "addSubview:", v11);
  -[_TVRowView bounds](self, "bounds");
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "tv_textSizeForWidth:", a4);
  else
    objc_msgSend(v11, "sizeThatFits:", a4, v8);
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v9, v10);

}

- (int64_t)_alignmentFromView:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "tv_alignment");
  if (!result)
    return 2;
  return result;
}

- (void)_resetSubviews
{
  void *v3;

  -[_TVRowView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[_TVRowView setNeedsLayout](self, "setNeedsLayout");
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_TVRowView components](self, "components", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "tv_impressionableElementsForDocument:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)_alignComponents:(id)a3 withLineSize:(CGSize)a4 boundingRect:(CGRect)a5 originYBump:(double)a6 verticalAlignment:(int64_t)a7 horizontalAlignment:(int64_t)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v15;
  double v16;
  id v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a4.height;
  v16 = a4.width;
  v42 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v18 = CGRectGetWidth(v43) - v16;
  if (a8 != 2)
  {
    if (a8 == 9)
    {
      objc_msgSend(v17, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "origin");
      v21 = v20;

      objc_msgSend(v17, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "tv_nonDirectionalMargin");
      v24 = v23;

      v18 = floor((v18 - v21 - v24) * 0.5);
    }
    else
    {
      v18 = 0.0;
    }
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (a7 == 3)
        {
          objc_msgSend(v30, "bounds", (_QWORD)v37);
          v33 = v15 - CGRectGetHeight(v44);
          objc_msgSend(v30, "tv_margin");
          v32 = v33 - v34;
        }
        else if (a7 == 1)
        {
          objc_msgSend(v30, "tv_margin");
          v32 = v31 + 0.0;
        }
        else
        {
          objc_msgSend(v30, "bounds");
          v32 = floor((v15 - CGRectGetHeight(v45)) * 0.5);
        }
        objc_msgSend(v30, "origin", (_QWORD)v37);
        v36 = v18 + v35;
        objc_msgSend(v30, "bounds");
        objc_msgSend(v30, "setFrame:", v36, v32 + a6);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v27);
  }

}

+ (CGRect)_leftAlignedFrameForComponent:(id)a3 previousComponent:(id)a4 interitemSpacing:(double)a5
{
  id v7;
  id v8;
  void *v9;
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
  CGRect result;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "tv_nonDirectionalMargin");
    v11 = v10;
  }
  else
  {
    v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  objc_msgSend(v7, "tv_nonDirectionalMargin");
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "tv_textSizeForWidth:", 1.79769313e308);
  else
    objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v16 = v14;
  v17 = v15;
  v18 = fmax(v13, v11);
  v19 = fmax(v18, a5);
  if (v9)
    v20 = v19;
  else
    v20 = v18;

  v21 = 0.0;
  v22 = v20;
  v23 = v16;
  v24 = v17;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

+ (CGRect)_boundingRectForComponents:(id)a3 interitemSpacing:(double)a4 boundingSize:(CGSize)a5 horizontalAlignment:(int64_t)a6 allowsOverflow:(BOOL)a7
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  CGFloat v15;
  double v16;
  double y;
  CGFloat x;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  BOOL v31;
  uint64_t v32;
  id v33;
  _BOOL8 v34;
  double MaxX;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  char v40;
  char v41;
  void *v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double Height;
  CGRect v56;
  double width;
  uint64_t v58;
  id obj;
  double v60;
  double v61;
  double v62;
  __CFString *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect result;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v7 = a7;
  width = a5.width;
  v70 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v52 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v53 = *MEMORY[0x24BDBF090];
  v50 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v51 = *(double *)(MEMORY[0x24BDBF090] + 16);
  if (objc_msgSend(v10, "count"))
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v66;
      v64 = &stru_24EB8B108;
      v15 = v50;
      v16 = v51;
      y = v52;
      x = v53;
      v54 = ceil(width);
      Height = 0.0;
      v56.size.width = v51;
      v56.size.height = v50;
      v56.origin.x = v53;
      v56.origin.y = v52;
      do
      {
        v19 = 0;
        v58 = v12;
        do
        {
          if (*(_QWORD *)v66 != v14)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
          objc_msgSend((id)objc_opt_class(), "_leftAlignedFrameForComponent:previousComponent:interitemSpacing:", v20, v13, a4);
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;
          objc_msgSend(v20, "tv_nonDirectionalMargin");
          if (a6 == 2)
            v30 = 0.0;
          else
            v30 = v29;
          if (v13)
            v31 = 0;
          else
            v31 = a6 == 2;
          if (v31)
            v22 = 0.0;
          if (v7)
          {
            v61 = v30;
            v32 = v14;
            v33 = a1;
            v34 = v7;
            v71.origin.x = x;
            v71.origin.y = y;
            v71.size.width = v16;
            v71.size.height = v15;
            v60 = CGRectGetWidth(v71);
            v72.origin.x = v22;
            v62 = v24;
            v72.origin.y = v24;
            v72.size.width = v26;
            v72.size.height = v28;
            MaxX = CGRectGetMaxX(v72);
            objc_msgSend(v20, "valueForTVViewStyle:", CFSTR("tv-group"));
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = (void *)v36;
            v38 = &stru_24EB8B108;
            if (v36)
              v38 = (__CFString *)v36;
            v39 = v38;

            v40 = -[__CFString isEqualToString:](v64, "isEqualToString:", v39);
            if (width == 0.0 || (ceil(v61 + v60 + MaxX) <= v54 ? (v41 = v40) : (v41 = 0), (v41 & 1) != 0))
            {
              v64 = v39;
            }
            else
            {
              objc_msgSend(v13, "tv_nonDirectionalMargin");
              v79.size.width = v16 + v43;
              v79.origin.y = Height + y;
              v79.origin.x = x;
              v79.size.height = v15;
              v56 = CGRectUnion(v56, v79);
              Height = CGRectGetHeight(v56);

              v13 = 0;
              v64 = v39;
              v15 = v50;
              v16 = v51;
              y = v52;
              x = v53;
            }
            v7 = v34;
            a1 = v33;
            v14 = v32;
            v12 = v58;
            v24 = v62;
          }
          v42 = v13;
          v73.origin.x = x;
          v73.origin.y = y;
          v73.size.width = v16;
          v73.size.height = v15;
          v78.origin.x = v22 + CGRectGetWidth(v73);
          v74.origin.x = x;
          v74.origin.y = y;
          v74.size.width = v16;
          v74.size.height = v15;
          v78.origin.y = v24;
          v78.size.width = v26;
          v78.size.height = v28;
          v75 = CGRectUnion(v74, v78);
          x = v75.origin.x;
          y = v75.origin.y;
          v16 = v75.size.width;
          v15 = v75.size.height;
          v13 = v20;

          ++v19;
        }
        while (v12 != v19);
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        v12 = v44;
      }
      while (v44);
    }
    else
    {
      v13 = 0;
      v64 = &stru_24EB8B108;
      Height = 0.0;
      v15 = v50;
      v16 = v51;
      y = v52;
      x = v53;
      v56.size.width = v51;
      v56.size.height = v50;
      v56.origin.x = v53;
      v56.origin.y = v52;
    }

    objc_msgSend(v13, "tv_nonDirectionalMargin");
    v80.size.width = v16 + v45;
    v80.origin.y = Height + y;
    v80.origin.x = x;
    v80.size.height = v15;
    v76 = CGRectUnion(v56, v80);
    v52 = v76.origin.y;
    v53 = v76.origin.x;
    v50 = v76.size.height;
    v51 = v76.size.width;

  }
  v47 = v52;
  v46 = v53;
  v49 = v50;
  v48 = v51;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (NSArray)components
{
  return self->_components;
}

- (UIView)preferredFocusedComponent
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_preferredFocusedComponent);
}

- (int64_t)contentVerticalAlignment
{
  return self->_contentVerticalAlignment;
}

- (NSArray)leftComponents
{
  return self->_leftComponents;
}

- (NSArray)centerComponents
{
  return self->_centerComponents;
}

- (NSArray)rightComponents
{
  return self->_rightComponents;
}

- (NSArray)allComponents
{
  return self->_allComponents;
}

- (UIView)lastFocusedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_lastFocusedView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastFocusedView);
  objc_storeStrong((id *)&self->_allComponents, 0);
  objc_storeStrong((id *)&self->_rightComponents, 0);
  objc_storeStrong((id *)&self->_centerComponents, 0);
  objc_storeStrong((id *)&self->_leftComponents, 0);
  objc_destroyWeak((id *)&self->_preferredFocusedComponent);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
