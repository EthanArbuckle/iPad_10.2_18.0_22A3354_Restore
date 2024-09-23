@implementation _TVOrganizerCellView

- (_TVOrganizerCellView)initWithFrame:(CGRect)a3
{
  _TVOrganizerCellView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVOrganizerCellView;
  v3 = -[_TVOrganizerCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVOrganizerCellView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[_TVOrganizerCellView setOpaque:](v3, "setOpaque:", 0);
    v3->_contentVerticalAlignment = 1;
  }
  return v3;
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_contentVerticalAlignment != a3)
  {
    self->_contentVerticalAlignment = a3;
    -[_TVOrganizerCellView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[_TVOrganizerCellView filteredComponents](self, "filteredComponents");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[_TVOrganizerCellView _verticallyStackComponents:alignment:](self, "_verticallyStackComponents:alignment:", v6, self->_contentVerticalAlignment);

    }
  }
}

- (void)setComponents:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_components, a3);
  -[_TVOrganizerCellView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "addObject:", v12, (_QWORD)v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = objc_msgSend(v6, "count");
  if (v13)
    v14 = (void *)objc_msgSend(v6, "copy");
  else
    v14 = 0;
  objc_storeStrong((id *)&self->_filteredComponents, v14);
  if (v13)

  -[_TVOrganizerCellView _resetSubviews](self, "_resetSubviews", (_QWORD)v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVOrganizerCellView filteredComponents](self, "filteredComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVOrganizerCellView _sizeThatFitsComponents:boundingSize:](self, "_sizeThatFitsComponents:boundingSize:", v6, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _TVOrganizerCellView *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)_TVOrganizerCellView;
  -[_TVOrganizerCellView layoutSubviews](&v26, sel_layoutSubviews);
  -[_TVOrganizerCellView bounds](self, "bounds");
  v4 = v3;
  -[_TVOrganizerCellView filteredComponents](self, "filteredComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "superview");
        v11 = (_TVOrganizerCellView *)objc_claimAutoreleasedReturnValue();

        if (v11 != self)
          -[_TVOrganizerCellView addSubview:](self, "addSubview:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[_TVOrganizerCellView _updateView:maxViewWidth:](self, "_updateView:maxViewWidth:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), v4, (_QWORD)v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v14);
  }

  -[_TVOrganizerCellView filteredComponents](self, "filteredComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVOrganizerCellView _verticallyStackComponents:alignment:](self, "_verticallyStackComponents:alignment:", v17, -[_TVOrganizerCellView contentVerticalAlignment](self, "contentVerticalAlignment"));

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)_verticallyStackComponents:(id)a3 alignment:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_TVOrganizerCellView bounds](self, "bounds");
  v55 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *MEMORY[0x24BDF7718];
  v15 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  v18 = 0.0;
  if (v17)
  {
    v19 = v17;
    v20 = 0;
    v21 = *(_QWORD *)v62;
    v22 = 0.0;
    do
    {
      v23 = 0;
      v24 = v20;
      v25 = v15;
      do
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(v16);
        v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v23);
        objc_msgSend(v26, "tv_margin");
        v15 = v28;
        v29 = fmax(v27, v25);
        if (v24)
          v30 = v29;
        else
          v30 = v27;
        if (!v24)
          v14 = v27;
        objc_msgSend(v26, "bounds");
        v22 = v22 + v30 + v31;
        v20 = v26;

        ++v23;
        v24 = v20;
        v25 = v15;
      }
      while (v19 != v23);
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v19);

  }
  else
  {
    v22 = 0.0;
  }

  v32 = v15 + v22;
  switch(a4)
  {
    case 3:
      v18 = floor(v9 + v13 - v32);
      break;
    case 2:
      v18 = floor((v13 - (v32 - v14 - v15)) * 0.5) - v14;
      break;
    case 1:
      v18 = floor(v9);
      break;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v33 = v16;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v58;
    v54 = v55 + v11;
    v56 = v55 + v11 * 0.5;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        v38 = v14;
        if (*(_QWORD *)v58 != v36)
          objc_enumerationMutation(v33);
        v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v39, "tv_margin");
        v41 = v40;
        v43 = v42;
        v14 = v44;
        v46 = v45;
        objc_msgSend(v39, "center");
        v47 = -[_TVOrganizerCellView _alignmentFromView:](self, "_alignmentFromView:", v39);
        v48 = v56;
        if (v47 != 2)
        {
          if (v47 == 3)
          {
            objc_msgSend(v39, "bounds");
            v48 = v54 - v46 + v49 * -0.5;
          }
          else
          {
            objc_msgSend(v39, "bounds");
            v48 = v55 + v43 + v50 * 0.5;
          }
        }
        objc_msgSend(v39, "bounds");
        v52 = v18 + fmax(v41, v38) + v51 * 0.5;
        objc_msgSend(v39, "setCenter:", v48, v52);
        objc_msgSend(v39, "bounds");
        v18 = v52 + v53 * 0.5;
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v35);
  }

}

- (CGSize)_sizeThatFitsComponents:(id)a3 boundingSize:(CGSize)a4
{
  double width;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
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
  unint64_t v31;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGSize result;

  width = a4.width;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v39;
    v13 = 0.0;
    do
    {
      v14 = 0;
      v15 = v13;
      v16 = v11;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v6);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
        objc_msgSend(v17, "tv_margin");
        v19 = v18;
        v21 = v20;
        v13 = v22;
        v24 = v23;
        if (!v16)
          v15 = v18;
        v11 = v17;

        v25 = v21 + v24;
        if (width - v25 > 0.0)
          v26 = width - v25;
        else
          v26 = 0.0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "tv_textSizeForWidth:", v26);
        else
          objc_msgSend(v11, "tv_sizeThatFits:", v26, 0.0);
        v29 = v28;
        v30 = v25 + v27;
        v31 = -[_TVOrganizerCellView _alignmentFromView:](self, "_alignmentFromView:", v11) & 0xFFFFFFFFFFFFFFFDLL;
        if (v30 < width && v31 == 1)
          v33 = width;
        else
          v33 = v30;
        if (v7 < v33)
          v7 = v33;
        v8 = v8 + fmax(v19, v15) + v29;
        ++v14;
        v15 = v13;
        v16 = v11;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v10);

  }
  else
  {
    v13 = 0.0;
  }

  v34 = v7;
  v35 = ceilf(v34);
  v36 = v13 + v8;
  v37 = ceilf(v36);
  result.height = v37;
  result.width = v35;
  return result;
}

- (void)_updateView:(id)a3 maxViewWidth:(double)a4
{
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
  void *v16;
  double v17;
  double v18;
  float v19;
  double v20;
  float v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "tv_margin");
  if (a4 - (v6 + v7) > 0.0)
    v8 = a4 - (v6 + v7);
  else
    v8 = 0.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v22, "tv_textSizeForWidth:", v8);
  else
    objc_msgSend(v22, "tv_sizeThatFits:", v8, 0.0);
  v11 = v9;
  v12 = v10;
  v13 = -[_TVOrganizerCellView _alignmentFromView:](self, "_alignmentFromView:", v22);
  objc_msgSend(v22, "tv_itemWidth");
  v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v13 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v16 = v22;
    if (v15 <= 0.0)
    {
      objc_msgSend(v22, "tv_maxWidth");
      v16 = v22;
      v18 = fmin(v8, v17);
      if (v17 <= 0.0)
        v11 = v8;
      else
        v11 = v18;
    }
  }
  else
  {
    v16 = v22;
  }
  v19 = v11;
  v20 = ceilf(v19);
  v21 = v12;
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, v20, ceilf(v21));

}

- (int64_t)_alignmentFromView:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "tv_alignment");
  if (v4)
    v5 = v4;
  else
    v5 = 4;
  v6 = objc_msgSend(v3, "semanticContentAttribute");

  return +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", v5, v6);
}

- (void)_resetSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_TVOrganizerCellView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[_TVOrganizerCellView filteredComponents](self, "filteredComponents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) == 0)
          objc_msgSend(v8, "removeFromSuperview");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (NSArray)components
{
  return self->_components;
}

- (int64_t)contentVerticalAlignment
{
  return self->_contentVerticalAlignment;
}

- (NSArray)filteredComponents
{
  return self->_filteredComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredComponents, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
