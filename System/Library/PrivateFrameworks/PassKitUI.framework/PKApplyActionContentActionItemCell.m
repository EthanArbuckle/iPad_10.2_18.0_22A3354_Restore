@implementation PKApplyActionContentActionItemCell

- (void)setActionItem:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *disclosureView;
  UIImageView *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *titleLabels;
  uint64_t v29;
  NSArray *subtitleLabels;
  void *v31;
  PKApplyActionContentActionItem **p_actionItem;
  PKApplyActionContentActionItemCell *v33;
  id v34;
  id obj;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  objc_storeStrong((id *)&self->_actionItem, a3);
  -[PKApplyActionContentActionItemCell _resetState](self, "_resetState");
  -[PKApplyActionContentActionItemCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyActionContentActionItem contextPrimaryActionIdentifier](self->_actionItem, "contextPrimaryActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIImageView *)objc_msgSend(v7, "initWithImage:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v9, "setTintColor:", v10);

    disclosureView = self->_disclosureView;
    self->_disclosureView = v9;
    v12 = v9;

    objc_msgSend(v5, "addSubview:", self->_disclosureView);
  }
  v33 = self;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  p_actionItem = &self->_actionItem;
  -[PKApplyActionContentActionItem items](self->_actionItem, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v13)
  {
    v14 = v13;
    v39 = *(_QWORD *)v43;
    v38 = (void *)*MEMORY[0x1E0DC4B10];
    v15 = (void *)*MEMORY[0x1E0DC48D0];
    v36 = (void *)*MEMORY[0x1E0DC4A88];
    v37 = *MEMORY[0x1E0D68118];
    v16 = *MEMORY[0x1E0D680C8];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v39)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v19 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        objc_msgSend(v18, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v20);

        objc_msgSend(v19, "setNumberOfLines:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v21);

        PKFontForDefaultDesign(v38, v15, 0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFont:", v22);

        objc_msgSend(v19, "setAccessibilityIdentifier:", v37);
        objc_msgSend(v5, "addSubview:", v19);
        v23 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        objc_msgSend(v18, "subtitle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setText:", v24);

        objc_msgSend(v23, "setNumberOfLines:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTextColor:", v25);

        PKFontForDefaultDesign(v36, v15, 0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFont:", v26);

        objc_msgSend(v23, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
        objc_msgSend(v23, "setAccessibilityIdentifier:", v16);
        objc_msgSend(v5, "addSubview:", v23);
        objc_msgSend(v41, "addObject:", v19);
        objc_msgSend(v40, "addObject:", v23);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v14);
  }

  v27 = objc_msgSend(v41, "copy");
  titleLabels = v33->_titleLabels;
  v33->_titleLabels = (NSArray *)v27;

  v29 = objc_msgSend(v40, "copy");
  subtitleLabels = v33->_subtitleLabels;
  v33->_subtitleLabels = (NSArray *)v29;

  -[PKApplyActionContentActionItem contextPrimaryActionIdentifier](*p_actionItem, "contextPrimaryActionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyActionContentActionItemCell setAccessibilityIdentifier:](v33, "setAccessibilityIdentifier:", v31);

  -[PKApplyActionContentActionItemCell setNeedsLayout](v33, "setNeedsLayout");
}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKApplyActionContentActionItemCell;
  -[PKApplyActionContentActionItemCell setHighlighted:](&v10, sel_setHighlighted_);
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  else
    objc_msgSend((id)objc_opt_class(), "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PKApplyActionContentActionItemCell_setHighlighted___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8, 0);

}

uint64_t __53__PKApplyActionContentActionItemCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKApplyActionContentActionItemCell;
  -[PKApplyActionContentActionItemCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKApplyActionContentActionItemCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKApplyActionContentActionItemCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKApplyActionContentActionItemCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRectEdge v15;
  UIImageView *disclosureView;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  unint64_t v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  CGSize v42;
  CGPoint v43;
  CGRect v44;
  CGRect v45;
  CGRect slice;
  CGRect remainder;
  CGRect v48;
  CGRect v49;
  CGSize result;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = PKTableViewCellTextInset();
  v11 = x + v10;
  v12 = y + 12.0;
  v13 = width - (v10 + PKTableViewCellTextInset());
  v14 = height + -24.0;
  if (-[PKApplyActionContentActionItemCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v15 = CGRectMinXEdge;
  else
    v15 = CGRectMaxXEdge;
  remainder.origin.x = v11;
  remainder.origin.y = v12;
  remainder.size.width = v13;
  remainder.size.height = height + -24.0;
  disclosureView = self->_disclosureView;
  if (disclosureView)
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:", v13, 3.40282347e38);
    v18 = v17;
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D820];
  }
  memset(&v49, 0, sizeof(v49));
  memset(&v48, 0, sizeof(v48));
  if (v18 <= 0.0)
    v19 = v13;
  else
    v19 = v13 - v18 + -15.0;
  v42 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v43 = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v42;
  if (v18 > 0.0)
  {
    v51.origin.x = v11;
    v51.origin.y = v12;
    v51.size.width = v13;
    v51.size.height = v14;
    CGRectDivide(v51, &slice, &remainder, v18, v15);
    CGRectDivide(remainder, &v49, &remainder, 15.0, v15);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v20;
    slice.origin.y = v21;
    slice.size.width = v22;
    slice.size.height = v23;
  }
  if (!-[NSArray count](self->_titleLabels, "count"))
  {
    v25 = 0.0;
    if (a4)
      goto LABEL_21;
    goto LABEL_20;
  }
  v24 = 0;
  v25 = 0.0;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45.origin = v43;
    v45.size = v42;
    objc_msgSend(v26, "sizeThatFits:", v19, 3.40282347e38);
    v28 = v27;
    -[NSArray objectAtIndexedSubscript:](self->_subtitleLabels, "objectAtIndexedSubscript:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44.origin = v43;
    v44.size = v42;
    objc_msgSend(v29, "sizeThatFits:", v19, 3.40282347e38);
    v31 = v30;
    CGRectDivide(remainder, &v45, &remainder, v28, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v45.origin.x = v32;
    v45.origin.y = v33;
    v45.size.width = v34;
    v45.size.height = v35;
    CGRectDivide(remainder, &v44, &remainder, v31, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v44.origin.x = v36;
    v44.origin.y = v37;
    v44.size.width = v38;
    v44.size.height = v39;
    if (!a4)
    {
      objc_msgSend(v26, "setFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
      objc_msgSend(v29, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    }
    v25 = v25 + v28 + v31;
    if (++v24 < -[NSArray count](self->_titleLabels, "count"))
    {
      CGRectDivide(remainder, &v48, &remainder, 8.0, CGRectMinYEdge);
      v25 = v25 + 8.0;
    }

  }
  while (v24 < -[NSArray count](self->_titleLabels, "count"));
  if (!a4)
LABEL_20:
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
LABEL_21:
  v40 = v25 + 24.0;
  v41 = width;
  result.height = v40;
  result.width = v41;
  return result;
}

- (void)_resetState
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIImageView *disclosureView;
  NSArray *titleLabels;
  NSArray *subtitleLabels;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_titleLabels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_subtitleLabels;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "removeFromSuperview", (_QWORD)v16);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

  -[UIImageView removeFromSuperview](self->_disclosureView, "removeFromSuperview");
  disclosureView = self->_disclosureView;
  self->_disclosureView = 0;

  titleLabels = self->_titleLabels;
  self->_titleLabels = 0;

  subtitleLabels = self->_subtitleLabels;
  self->_subtitleLabels = 0;

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKApplyActionContentActionItemCell;
  -[PKApplyActionContentActionItemCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKApplyActionContentActionItemCell _resetState](self, "_resetState");
}

- (PKApplyActionContentActionItem)actionItem
{
  return self->_actionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionItem, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_subtitleLabels, 0);
  objc_storeStrong((id *)&self->_titleLabels, 0);
}

@end
