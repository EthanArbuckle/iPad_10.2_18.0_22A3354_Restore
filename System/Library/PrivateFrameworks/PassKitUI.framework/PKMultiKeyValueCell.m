@implementation PKMultiKeyValueCell

- (void)setSources:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t k;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *titleLabels;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  PKMultiKeyValueCell *v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
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
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v6 = self->_titleLabels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "removeFromSuperview");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v8);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v34 = 880;
    v11 = self->_subtitleLabels;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "removeFromSuperview", v34);
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v13);
    }

    v35 = self;
    -[PKMultiKeyValueCell contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v36 = v5;
    obj = v5;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v43)
    {
      v40 = *(_QWORD *)v46;
      v16 = (void *)*MEMORY[0x1E0DC4A88];
      v17 = (void *)*MEMORY[0x1E0DC48D0];
      v39 = *MEMORY[0x1E0D68118];
      v38 = *MEMORY[0x1E0D67AE8];
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v46 != v40)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
          if (objc_msgSend(v19, "isBold", v34))
            v20 = 2;
          else
            v20 = 0;
          v21 = objc_alloc_init(MEMORY[0x1E0DC3990]);
          objc_msgSend(v19, "title");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setText:", v22);

          objc_msgSend(v21, "setNumberOfLines:", 0);
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setTextColor:", v23);

          PKFontForDefaultDesign(v16, v17, v20, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setFont:", v24);

          objc_msgSend(v21, "setAccessibilityIdentifier:", v39);
          objc_msgSend(v44, "addSubview:", v21);
          v25 = objc_alloc_init(MEMORY[0x1E0DC3990]);
          objc_msgSend(v19, "subtitle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setText:", v26);

          objc_msgSend(v25, "setNumberOfLines:", 0);
          objc_msgSend(v19, "subtitleTextColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v25, "setTextColor:", v27);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setTextColor:", v28);

          }
          PKFontForDefaultDesign(v16, v17, v20, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFont:", v29);

          objc_msgSend(v25, "setAccessibilityIdentifier:", v38);
          objc_msgSend(v44, "addSubview:", v25);
          objc_msgSend(v42, "addObject:", v21);
          objc_msgSend(v41, "addObject:", v25);

        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v43);
    }

    v30 = objc_msgSend(v42, "copy");
    titleLabels = v35->_titleLabels;
    v35->_titleLabels = (NSArray *)v30;

    v32 = objc_msgSend(v41, "copy");
    v33 = *(Class *)((char *)&v35->super.super.super.super.super.super.isa + v34);
    *(Class *)((char *)&v35->super.super.super.super.super.super.isa + v34) = (Class)v32;

    -[PKMultiKeyValueCell setNeedsLayout](v35, "setNeedsLayout");
    v5 = v36;
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKMultiKeyValueCell;
  -[PKMultiKeyValueCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKMultiKeyValueCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKMultiKeyValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKMultiKeyValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  int v10;
  _BOOL4 v11;
  BOOL v12;
  CGRectEdge v13;
  CGRectEdge v14;
  unint64_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
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
  CGRect v55;
  CGRect v56;
  CGRect remainder;
  CGRect slice;
  CGSize result;

  width = a3.size.width;
  v7 = a3.origin.x + 16.0;
  v8 = a3.origin.y + 16.0;
  v9 = a3.size.height + -32.0;
  v10 = -[PKMultiKeyValueCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v11 = -[PKMultiKeyValueCell _shouldStackLabelsWithBounds:](self, "_shouldStackLabelsWithBounds:", v7, v8, width + -32.0, v9);
  v12 = v10 == 0;
  if (v10)
    v13 = CGRectMaxXEdge;
  else
    v13 = CGRectMinXEdge;
  if (v12)
    v14 = CGRectMaxXEdge;
  else
    v14 = CGRectMinXEdge;
  remainder.origin.x = v7;
  remainder.origin.y = v8;
  remainder.size.width = width + -32.0;
  remainder.size.height = v9;
  if (-[NSArray count](self->_titleLabels, "count"))
  {
    v52 = width;
    v15 = 0;
    memset(&slice, 0, sizeof(slice));
    v16 = 0.0;
    do
    {
      v54 = v16;
      -[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sizeThatFits:", remainder.size.width, remainder.size.height);
      v19 = v18;
      v21 = v20;
      -[NSArray objectAtIndexedSubscript:](self->_subtitleLabels, "objectAtIndexedSubscript:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sizeThatFits:", remainder.size.width, remainder.size.height);
      v24 = v23;
      v26 = v25;
      if (v11)
      {
        CGRectDivide(remainder, &slice, &remainder, v21, CGRectMinYEdge);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v53 = v27;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        CGRectDivide(remainder, &slice, &remainder, v26, CGRectMinYEdge);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v41 = v40;
        CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
        v21 = v33 + v41;
      }
      else
      {
        memset(&v56, 0, sizeof(v56));
        CGRectDivide(remainder, &v56, &remainder, v21, CGRectMinYEdge);
        memset(&v55, 0, sizeof(v55));
        CGRectDivide(v56, &v55, &v56, fmin(v56.size.width, v19), v13);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v53 = v42;
        v29 = v43;
        v31 = v44;
        v33 = v45;
        CGRectDivide(v56, &v55, &v56, fmin(v56.size.width, v24), v14);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v35 = v46;
        v37 = v47;
        v39 = v48;
        v41 = v49;
        CGRectDivide(remainder, &v56, &remainder, 5.0, CGRectMinYEdge);
      }
      v16 = v54 + v21;
      if (++v15 < -[NSArray count](self->_titleLabels, "count"))
        v16 = v16 + 5.0;
      if (!a4)
      {
        objc_msgSend(v17, "setFrame:", v53, v29, v31, v33);
        objc_msgSend(v22, "setFrame:", v35, v37, v39, v41);
      }

    }
    while (v15 < -[NSArray count](self->_titleLabels, "count"));
    v50 = v16 + 32.0;
    width = v52;
  }
  else
  {
    v50 = 32.0;
  }
  v51 = width;
  result.height = v50;
  result.width = v51;
  return result;
}

- (BOOL)_shouldStackLabelsWithBounds:(CGRect)a3
{
  double width;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  width = a3.size.width;
  if (!-[NSArray count](self->_titleLabels, "count", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
    return 0;
  v5 = 0;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_subtitleLabels, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeThatFits:", width, 1.79769313e308);
    v9 = v8;
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    v11 = v9 + v10 + 8.0;

    v12 = width < v11;
    if (width < v11)
      break;
    ++v5;
  }
  while (v5 < -[NSArray count](self->_titleLabels, "count"));
  return v12;
}

- (void)prepareForReuse
{
  NSArray *titleLabels;
  NSArray *subtitleLabels;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMultiKeyValueCell;
  -[PKMultiKeyValueCell prepareForReuse](&v5, sel_prepareForReuse);
  titleLabels = self->_titleLabels;
  self->_titleLabels = 0;

  subtitleLabels = self->_subtitleLabels;
  self->_subtitleLabels = 0;

}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_subtitleLabels, 0);
  objc_storeStrong((id *)&self->_titleLabels, 0);
}

@end
