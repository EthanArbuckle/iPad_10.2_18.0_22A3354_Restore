@implementation _TVInfoTableView

+ (id)infoTableViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVInfoTableView *v7;
  _TVInfoTableView *v8;
  _TVInfoTableView *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVInfoTableView *)v6;
  }
  else
  {
    v8 = [_TVInfoTableView alloc];
    v7 = -[_TVFocusRedirectView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v5;
  objc_msgSend(v5, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "tv_elementType");
        switch(v17)
        {
          case 13:
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "_viewFromElement:existingView:", v16, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[_TVInfoTableView setFooterView:](v9, "setFooterView:", v19);
            break;
          case 18:
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "_viewFromElement:existingView:", v16, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              continue;
            objc_msgSend(v10, "addObject:", v19);
            break;
          case 15:
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_viewFromElement:existingView:", v16, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[_TVInfoTableView setHeaderView:](v9, "setHeaderView:", v19);
            break;
          default:
            continue;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  -[_TVInfoTableView setInfoViews:](v9, "setInfoViews:", v10);
  return v9;
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
      -[_TVInfoTableView addSubview:](self, "addSubview:");
  }
  -[_TVInfoTableView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setInfoViews:(id)a3
{
  id v5;
  NSArray **p_infoViews;
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
  p_infoViews = &self->_infoViews;
  if (!-[NSArray isEqualToArray:](self->_infoViews, "isEqualToArray:", v5))
  {
    -[NSArray makeObjectsPerformSelector:](*p_infoViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&self->_infoViews, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *p_infoViews;
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
          -[_TVInfoTableView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  -[_TVInfoTableView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

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
      -[_TVInfoTableView addSubview:](self, "addSubview:");
  }
  -[_TVInfoTableView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  NSArray *infoViews;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[10];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView tv_lineSpacing](self, "tv_lineSpacing");
  v7 = v6;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[_TVInfoTableView _normalizedInfoHeaderWidth](self, "_normalizedInfoHeaderWidth");
  v9 = v8;
  -[NSArray firstObject](self->_infoViews, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = width;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = width;
    if (objc_msgSend(v10, "headerOnLeading"))
    {
      if (-[_TVInfoTableView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
      {
        objc_msgSend(v10, "headerMargin");
      }
      else
      {
        objc_msgSend(v10, "headerMargin");
        v12 = v13;
      }
      v11 = width - (v9 + v12);
    }
  }
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v11, 0.0);
  *((_QWORD *)v25 + 3) = v14;
  -[UIView tv_margin](self->_headerView, "tv_margin");
  v25[3] = v15 + v25[3];
  -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v11, 0.0);
  v25[3] = v16 + v25[3];
  -[UIView tv_margin](self->_footerView, "tv_margin");
  v25[3] = v17 + v25[3];
  infoViews = self->_infoViews;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __33___TVInfoTableView_sizeThatFits___block_invoke;
  v23[3] = &unk_24EB86C48;
  *(double *)&v23[6] = width;
  *(double *)&v23[7] = height;
  v23[4] = self;
  v23[5] = &v24;
  *(double *)&v23[8] = v9;
  v23[9] = v7;
  -[NSArray enumerateObjectsUsingBlock:](infoViews, "enumerateObjectsUsingBlock:", v23);
  v19 = fmin(v25[3], height);
  if (height == 0.0)
    v20 = v25[3];
  else
    v20 = v19;

  _Block_object_dispose(&v24, 8);
  v21 = width;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  UIView *headerView;
  double v20;
  double v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  NSUInteger v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  UIView *footerView;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v43 = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)_TVInfoTableView;
  -[_TVFocusRedirectView layoutSubviews](&v41, sel_layoutSubviews);
  -[_TVInfoTableView bounds](self, "bounds");
  v4 = v3;
  -[UIView tv_lineSpacing](self, "tv_lineSpacing");
  v6 = v5;
  -[_TVInfoTableView bounds](self, "bounds");
  Width = CGRectGetWidth(v44);
  v8 = 0.0;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", Width, 0.0);
  v10 = v9;
  -[_TVInfoTableView _normalizedInfoHeaderWidth](self, "_normalizedInfoHeaderWidth");
  v12 = v11;
  -[NSArray firstObject](self->_infoViews, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = Width;
    if (objc_msgSend(v13, "headerOnLeading"))
    {
      v15 = -[_TVInfoTableView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      objc_msgSend(v13, "headerMargin");
      if (v15 == 1)
        v18 = v16;
      else
        v18 = v17;
      v8 = v12 + v18;
      v14 = Width - (v12 + v18);
    }
  }
  else
  {
    v14 = Width;
  }
  headerView = self->_headerView;
  v45.origin.y = 0.0;
  v45.origin.x = v8;
  v45.size.width = v14;
  v45.size.height = v10;
  v46 = CGRectIntegral(v45);
  -[UIView setFrame:](headerView, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  -[UIView tv_margin](self->_headerView, "tv_margin");
  v21 = v10 + v20;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = self->_infoViews;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v26);
        if (v21 >= v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v26), "setHidden:", 1, (_QWORD)v37);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v27, "setNormalizedHeaderWidth:", v12);
          objc_msgSend(v27, "sizeThatFits:", Width, v4 - v21, (_QWORD)v37);
          v29 = v28;
          v47.origin.x = 0.0;
          v47.origin.y = v21;
          v47.size.width = Width;
          v47.size.height = v29;
          v48 = CGRectIntegral(v47);
          objc_msgSend(v27, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
          v21 = v21 + v6 + v29;
        }
        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v24);
  }

  v30 = -[NSArray count](self->_infoViews, "count");
  v31 = 0.0;
  if (v30)
    v31 = v6;
  v32 = v21 - v31;
  -[UIView tv_margin](self->_footerView, "tv_margin", (_QWORD)v37);
  v34 = v32 + v33;
  -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v14, 0.0);
  v49.size.height = v35;
  footerView = self->_footerView;
  v49.origin.x = v8;
  v49.origin.y = v34;
  v49.size.width = v14;
  v50 = CGRectIntegral(v49);
  -[UIView setFrame:](footerView, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);

}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSObject tv_associatedIKViewElement](self, "tv_associatedIKViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[_TVInfoTableView infoViews](self, "infoViews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "tv_impressionableElementsForDocument:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    -[_TVInfoTableView headerView](self, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v16);

    -[_TVInfoTableView footerView](self, "footerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tv_impressionableElementsForDocument:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v18);

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (double)_normalizedInfoHeaderWidth
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_infoViews;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "minimumHeaderWidth", (_QWORD)v11);
          v6 = fmax(v6, v9);
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (NSArray)infoViews
{
  return self->_infoViews;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_infoViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
