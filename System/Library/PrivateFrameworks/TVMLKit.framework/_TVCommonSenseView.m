@implementation _TVCommonSenseView

- (_TVCommonSenseView)initWithFrame:(CGRect)a3
{
  _TVCommonSenseView *v3;
  id v4;
  uint64_t v5;
  UIView *containerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVCommonSenseView;
  v3 = -[_TVCommonSenseView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v5;

    -[UIView setBackgroundColor:](v3->_containerView, "setBackgroundColor:", 0);
    -[_TVCommonSenseView addSubview:](v3, "addSubview:", v3->_containerView);
  }
  return v3;
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
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MaxY;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  _TVCommonSenseFooterView *footerView;
  double Width;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  uint64_t v57;
  CGFloat v58;
  UIView *containerView;
  double v60;
  CGFloat v61;
  _QWORD rect[5];
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v67 = *MEMORY[0x24BDAC8D0];
  v65.receiver = self;
  v65.super_class = (Class)_TVCommonSenseView;
  -[_TVCommonSenseView layoutSubviews](&v65, sel_layoutSubviews);
  -[_TVCommonSenseView bounds](self, "bounds");
  v4 = v3;
  -[UIView tv_itemWidth](self->_headerView, "tv_itemWidth");
  if (v5 == 0.0)
    v5 = v4;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v5, 1.79769313e308);
  v7 = v6;
  v9 = v8;
  -[UIView tv_margin](self->_headerView, "tv_margin");
  v11 = v10;
  v13 = v12;
  v15 = v12 + v7 + v14;
  v17 = v10 + v9 + v16;
  -[UIView setFrame:](self->_headerView, "setFrame:", v12, v10, v15, v17);
  *(CGFloat *)rect = v13;
  v68.origin.x = v13;
  v18 = v11;
  v68.origin.y = v11;
  v19 = v15;
  v68.size.width = v15;
  v61 = v17;
  v68.size.height = v17;
  MaxY = CGRectGetMaxY(v68);
  memset(&rect[1], 0, 32);
  v63 = 0u;
  v64 = 0u;
  -[_TVCommonSenseView infoViews](self, "infoViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &rect[1], v66, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)rect[3];
    v25 = 0.0;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)rect[3] != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(rect[2] + 8 * i);
        objc_msgSend(v27, "tv_itemWidth");
        if (v28 == 0.0)
          v28 = v4;
        if (v28 > v25)
          v25 = v28;
        objc_msgSend(v27, "sizeThatFits:");
        v30 = v29;
        v32 = v31;
        objc_msgSend(v27, "tv_margin");
        v34 = v33;
        v36 = MaxY + v35;
        v38 = v33 + v30 + v37;
        v40 = v35 + v32 + v39;
        objc_msgSend(v27, "setFrame:", v33, v36, v38, v40);
        v69.origin.x = v34;
        v69.origin.y = v36;
        v69.size.width = v38;
        v69.size.height = v40;
        MaxY = CGRectGetMaxY(v69);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &rect[1], v66, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 0.0;
  }

  footerView = self->_footerView;
  if (footerView)
  {
    *(_QWORD *)&v70.origin.x = rect[0];
    v70.origin.y = v18;
    v70.size.width = v19;
    v70.size.height = v61;
    Width = CGRectGetWidth(v70);
    if (v25 >= Width)
      Width = v25;
    -[_TVCommonSenseFooterView sizeThatFits:](footerView, "sizeThatFits:", Width, 0.0, *(_QWORD *)&v18);
    v44 = v43;
    v46 = v45;
    -[UIView tv_margin](self->_footerView, "tv_margin");
    v48 = v47;
    v50 = MaxY + v49;
    v52 = v44 + v47 + v51;
    v54 = v46 + v49 + v53;
    -[_TVCommonSenseFooterView setFrame:](self->_footerView, "setFrame:", v47, v50, v52, v54);
    v71.origin.x = v48;
    v71.origin.y = v50;
    v71.size.width = v52;
    v71.size.height = v54;
    CGRectGetMaxY(v71);
    v55 = v61;
    v56 = v60;
    v57 = rect[0];
  }
  else
  {
    v56 = v18;
    v57 = rect[0];
    v55 = v61;
  }
  v58 = v19;
  CGRectGetWidth(*(CGRect *)&v57);
  containerView = self->_containerView;
  UIRectCenteredIntegralRect();
  -[UIView setFrame:](containerView, "setFrame:");
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView **p_headerView;
  UIView *headerView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v9 = v5;
    if (headerView)
    {
      -[UIView removeFromSuperview](headerView, "removeFromSuperview");
      v8 = *p_headerView;
      *p_headerView = 0;

      v5 = v9;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_headerView, a3);
      -[UIView addSubview:](self->_containerView, "addSubview:", *p_headerView);
    }
    -[_TVCommonSenseView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_infoViews = &self->_infoViews;
  if ((objc_msgSend(v5, "isEqual:", self->_infoViews) & 1) == 0)
  {
    if (-[NSArray count](*p_infoViews, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = *p_infoViews;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "removeFromSuperview");
          }
          while (v9 != v11);
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v9);
      }

    }
    objc_storeStrong((id *)&self->_infoViews, a3);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = *p_infoViews;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[UIView addSubview:](self->_containerView, "addSubview:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[_TVCommonSenseView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setFooterView:(id)a3
{
  _TVCommonSenseFooterView *v5;
  _TVCommonSenseFooterView **p_footerView;
  _TVCommonSenseFooterView *footerView;
  _TVCommonSenseFooterView *v8;
  _TVCommonSenseFooterView *v9;

  v5 = (_TVCommonSenseFooterView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v9 = v5;
    if (footerView)
    {
      -[_TVCommonSenseFooterView removeFromSuperview](footerView, "removeFromSuperview");
      v8 = *p_footerView;
      *p_footerView = 0;

      v5 = v9;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_footerView, a3);
      -[UIView addSubview:](self->_containerView, "addSubview:", *p_footerView);
    }
    -[_TVCommonSenseView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (UIView)headerView
{
  return self->_headerView;
}

- (NSArray)infoViews
{
  return self->_infoViews;
}

- (_TVCommonSenseFooterView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_infoViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
