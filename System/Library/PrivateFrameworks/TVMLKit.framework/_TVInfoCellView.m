@implementation _TVInfoCellView

+ (id)infoCellViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  _TVInfoCellView *v6;
  _TVInfoCellView *v7;
  _TVInfoCellView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  id obj;
  id obja;
  __int16 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v5 = a4;
  objc_opt_class();
  v53 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (_TVInfoCellView *)v5;
  }
  else
  {
    v7 = [_TVInfoCellView alloc];
    v6 = -[_TVInfoCellView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v8 = v6;
  -[_TVInfoCellView setSemanticContentAttribute:](v6, "setSemanticContentAttribute:", objc_msgSend(v51, "tv_semanticContentAttribute"));
  v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[_TVInfoCellView layoutGuides](v8, "layoutGuides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v68 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", CFSTR("_TVInfoViewFocusGuide"));

          if (v16)
            objc_msgSend(obj, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v11);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v17 = obj;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v64 != v20)
          objc_enumerationMutation(v17);
        -[_TVInfoCellView removeLayoutGuide:](v8, "removeLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v19);
  }
  v49 = v17;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v51, "children");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  v23 = v53;
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v60;
    v26 = 0x24EB83000uLL;
    do
    {
      v27 = 0;
      v55 = v24;
      do
      {
        if (*(_QWORD *)v60 != v25)
          objc_enumerationMutation(obja);
        v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v27);
        if (objc_msgSend(v28, "tv_elementType") == 15)
        {
          objc_msgSend(v28, "children");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v26 + 2344), "sharedInterfaceFactory");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVInfoCellView headerContentView](v8, "headerContentView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_viewFromElement:existingView:", v30, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v33, "numberOfLines") != 1)
          {
            v58 = 173;
            v34 = (void *)objc_msgSend(v52, "mutableCopy");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v58, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addCharactersInString:", v35);

            objc_msgSend(v33, "attributedText");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "string");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "componentsSeparatedByCharactersInSet:", v34);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v38, "count") <= 1)
              objc_msgSend(v33, "setNumberOfLines:", 1);

            v23 = v53;
          }
          -[_TVInfoCellView setHeaderContentView:](v8, "setHeaderContentView:", v33);
          objc_msgSend(v28, "style");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "tv_width");
          -[_TVInfoCellView setHeaderWidth:](v8, "setHeaderWidth:");

          objc_msgSend(v28, "style");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "tv_maxWidth");
          -[_TVInfoCellView setHeaderMaxWidth:](v8, "setHeaderMaxWidth:");

          objc_msgSend(v28, "style");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "tv_minWidth");
          -[_TVInfoCellView setHeaderMinWidth:](v8, "setHeaderMinWidth:");

          objc_msgSend(v28, "style");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "tv_margin");
          -[_TVInfoCellView setHeaderMargin:](v8, "setHeaderMargin:");

          v26 = 0x24EB83000;
          v24 = v55;
        }
        else
        {
          objc_msgSend(*(id *)(v26 + 2344), "sharedInterfaceFactory");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "_viewFromElement:existingView:", v28, v23);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
            objc_msgSend(v54, "addObject:", v30);
        }

        ++v27;
      }
      while (v24 != v27);
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v24);
  }

  -[_TVInfoCellView setDataViews:](v8, "setDataViews:", v54);
  if (objc_msgSend(v50, "count"))
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v50);
  v44 = v51;
  v45 = v44;
  while (1)
  {
    objc_msgSend(v45, "parent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
      break;
    objc_msgSend(v45, "parent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v47, "tv_elementType") == 19)
      goto LABEL_45;
    v45 = v47;
    if (objc_msgSend(v47, "tv_elementType") == 20)
    {
      -[_TVInfoCellView setHeaderOnLeading:](v8, "setHeaderOnLeading:", 1);
      goto LABEL_45;
    }
  }
  v47 = v45;
LABEL_45:

  return v8;
}

- (double)minimumHeaderWidth
{
  double v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[_TVInfoCellView headerWidth](self, "headerWidth");
  if (v3 <= 0.0)
  {
    -[_TVInfoCellView headerMaxWidth](self, "headerMaxWidth");
    v6 = v5;
    -[_TVInfoCellView headerMinWidth](self, "headerMinWidth");
    v8 = v7;
    -[UIView tv_margin](self->_headerContentView, "tv_margin");
    v10 = v9;
    v12 = v11;
    -[UIView tv_sizeThatFits:](self->_headerContentView, "tv_sizeThatFits:", fmax(v6 - v9 - v11, 0.0));
    return fmax(v8, v12 + v10 + v13);
  }
  else
  {
    -[_TVInfoCellView headerWidth](self, "headerWidth");
  }
  return result;
}

- (void)setHeaderContentView:(id)a3
{
  UIView *v5;
  UIView *headerContentView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerContentView = self->_headerContentView;
  v7 = v5;
  if (headerContentView != v5)
  {
    -[UIView removeFromSuperview](headerContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerContentView, a3);
    if (self->_headerContentView)
      -[_TVInfoCellView addSubview:](self, "addSubview:");
  }
  -[_TVInfoCellView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setDataViews:(id)a3
{
  id v5;
  NSArray **p_dataViews;
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
  p_dataViews = &self->_dataViews;
  if (!-[NSArray isEqualToArray:](self->_dataViews, "isEqualToArray:", v5))
  {
    -[NSArray makeObjectsPerformSelector:](*p_dataViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&self->_dataViews, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *p_dataViews;
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
          -[_TVInfoCellView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  -[_TVInfoCellView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVInfoCellView normalizedHeaderWidth](self, "normalizedHeaderWidth");
  -[_TVInfoCellView sizeThatFits:withHeaderWidth:](self, "sizeThatFits:withHeaderWidth:", width, height, v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 withHeaderWidth:(double)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIView *headerContentView;
  double v20;
  double v21;
  double v22;
  double bottom;
  double top;
  double v25;
  NSArray *dataViews;
  double v27;
  double v28;
  CGFloat v29;
  NSArray *v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[10];
  _QWORD v35[9];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  uint64_t v42;
  CGFloat v43;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView tv_lineSpacing](self, "tv_lineSpacing");
  v9 = v8;
  -[UIView tv_margin](self->_headerContentView, "tv_margin");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (a4 <= 0.0)
  {
    -[_TVInfoCellView headerWidth](self, "headerWidth");
    a4 = v18;
  }
  headerContentView = self->_headerContentView;
  if (self->_headerOnLeading)
  {
    -[UIView sizeThatFits:](headerContentView, "sizeThatFits:", a4 - v13 - v17, 0.0);
    v21 = v20;
    v22 = width - a4;
    bottom = self->_headerMargin.bottom;
    top = self->_headerMargin.top;
    v25 = v22 - self->_headerMargin.right - self->_headerMargin.left;
    v40 = 0;
    v41 = (double *)&v40;
    v42 = 0x2020000000;
    v43 = 0.0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    dataViews = self->_dataViews;
    v39 = 0;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke;
    v35[3] = &unk_24EB86C70;
    *(double *)&v35[6] = v25;
    v35[7] = 0;
    v35[4] = &v40;
    v35[5] = &v36;
    v35[8] = v9;
    -[NSArray enumerateObjectsUsingBlock:](dataViews, "enumerateObjectsUsingBlock:", v35);
    v27 = fmax(bottom + top + v15 + v11 + v21, v41[3]);
  }
  else
  {
    -[UIView sizeThatFits:](headerContentView, "sizeThatFits:", width - self->_headerMargin.left - self->_headerMargin.right - v13 - v17, 0.0);
    v29 = self->_headerMargin.top + v15 + v11 + v28;
    v40 = 0;
    v41 = (double *)&v40;
    v42 = 0x2020000000;
    v43 = v29;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v30 = self->_dataViews;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke_2;
    v34[3] = &unk_24EB86C98;
    *(double *)&v34[7] = width;
    *(double *)&v34[8] = height;
    v34[4] = self;
    v34[5] = &v40;
    v34[6] = &v36;
    v34[9] = v9;
    -[NSArray enumerateObjectsUsingBlock:](v30, "enumerateObjectsUsingBlock:", v34);
    v27 = v41[3];
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  v31 = fmin(v27, height);
  if (height <= 0.0)
    v32 = v27;
  else
    v32 = v31;
  v33 = width;
  result.height = v32;
  result.width = v33;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  BOOL v22;
  UIEdgeInsets *p_headerMargin;
  CGFloat *p_left;
  CGFloat *p_right;
  double v26;
  double v27;
  double v28;
  double v29;
  double top;
  double v31;
  float v32;
  double v33;
  UIView *headerContentView;
  double v35;
  double v36;
  _BOOL4 headerOnLeading;
  double v38;
  double v39;
  double v40;
  CGFloat bottom;
  NSArray *dataViews;
  double v43;
  CGFloat Height;
  _QWORD v45[13];
  BOOL v46;
  _QWORD v47[4];
  _QWORD v48[4];
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49.receiver = self;
  v49.super_class = (Class)_TVInfoCellView;
  -[_TVInfoCellView layoutSubviews](&v49, sel_layoutSubviews);
  -[_TVInfoCellView bounds](self, "bounds");
  Width = CGRectGetWidth(v50);
  -[_TVInfoCellView bounds](self, "bounds");
  Height = CGRectGetHeight(v51);
  -[UIView tv_lineSpacing](self, "tv_lineSpacing");
  v5 = v4;
  -[UIView tv_margin](self->_headerContentView, "tv_margin");
  v7 = v6;
  v9 = v8;
  v43 = v10;
  v12 = v11;
  v13 = -[UIView tv_alignment](self->_headerContentView, "tv_alignment");
  if (self->_headerOnLeading)
  {
    -[_TVInfoCellView normalizedHeaderWidth](self, "normalizedHeaderWidth");
    if (v14 <= 0.0)
      -[_TVInfoCellView headerWidth](self, "headerWidth");
    else
      -[_TVInfoCellView normalizedHeaderWidth](self, "normalizedHeaderWidth");
    v16 = v15;
  }
  else
  {
    v16 = Width - self->_headerMargin.left - self->_headerMargin.right;
  }
  -[UIView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v16 - v9 - v12, 0.0);
  v18 = v17;
  v20 = v19;
  v21 = -[_TVInfoCellView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v22 = v21 == 1;
  p_headerMargin = &self->_headerMargin;
  p_left = &self->_headerMargin.left;
  if (v21 == 1)
    p_right = &self->_headerMargin.right;
  else
    p_right = &self->_headerMargin.left;
  if (v21 == 1)
    v26 = v9;
  else
    v26 = v12;
  if (v21 == 1)
    v27 = v12;
  else
    v27 = v9;
  if (v21 != 1)
    p_left = &self->_headerMargin.right;
  v28 = *p_right;
  v29 = *p_left;
  if (v13)
  {
    top = p_headerMargin->top;
    if (v13 == 3)
    {
      v31 = v16 + v27 + v28 - v26 - v18;
    }
    else if (v13 == 1)
    {
      v31 = v27 + v28;
    }
    else
    {
      v32 = (v16 - v18 - v27 - v26) * 0.5;
      v31 = v27 + v28 + floorf(v32);
    }
  }
  else
  {
    v31 = v27 + v28;
    top = p_headerMargin->top;
  }
  v33 = v7 + top;
  headerContentView = self->_headerContentView;
  v35 = v18;
  v36 = v20;
  v52 = CGRectIntegral(*(CGRect *)&v31);
  -[UIView setFrame:](headerContentView, "setFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
  headerOnLeading = self->_headerOnLeading;
  v38 = v28 + v16 + v29;
  v39 = 0.0;
  if (self->_headerOnLeading)
    v40 = v28 + v16 + v29;
  else
    v40 = 0.0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  bottom = 0.0;
  if (!headerOnLeading)
  {
    v39 = v43 + v7 + v20 + p_headerMargin->top;
    bottom = self->_headerMargin.bottom;
    v38 = 0.0;
  }
  *(double *)&v48[3] = v39;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  dataViews = self->_dataViews;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __33___TVInfoCellView_layoutSubviews__block_invoke;
  v45[3] = &unk_24EB86CC0;
  v46 = v22;
  v45[5] = v48;
  v45[6] = v47;
  *(CGFloat *)&v45[7] = bottom;
  v45[8] = v5;
  *(double *)&v45[9] = Width - v38;
  v45[10] = 0;
  v45[4] = self;
  *(double *)&v45[11] = v40;
  *(CGFloat *)&v45[12] = Height;
  -[NSArray enumerateObjectsUsingBlock:](dataViews, "enumerateObjectsUsingBlock:", v45);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[_TVInfoCellView dataViews](self, "dataViews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "tv_impressionableElementsForDocument:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    -[_TVInfoCellView headerContentView](self, "headerContentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v16);

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (UIView)headerContentView
{
  return self->_headerContentView;
}

- (NSArray)dataViews
{
  return self->_dataViews;
}

- (BOOL)headerOnLeading
{
  return self->_headerOnLeading;
}

- (void)setHeaderOnLeading:(BOOL)a3
{
  self->_headerOnLeading = a3;
}

- (double)headerWidth
{
  return self->_headerWidth;
}

- (void)setHeaderWidth:(double)a3
{
  self->_headerWidth = a3;
}

- (double)headerMaxWidth
{
  return self->_headerMaxWidth;
}

- (void)setHeaderMaxWidth:(double)a3
{
  self->_headerMaxWidth = a3;
}

- (double)headerMinWidth
{
  return self->_headerMinWidth;
}

- (void)setHeaderMinWidth:(double)a3
{
  self->_headerMinWidth = a3;
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

- (double)normalizedHeaderWidth
{
  return self->_normalizedHeaderWidth;
}

- (void)setNormalizedHeaderWidth:(double)a3
{
  self->_normalizedHeaderWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataViews, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
}

@end
