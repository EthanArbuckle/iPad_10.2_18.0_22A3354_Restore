@implementation PKPayLaterScheduleView

- (PKPayLaterScheduleView)initWithDynamicContentItem:(id)a3
{
  id v5;
  PKPayLaterScheduleView *v6;
  PKPayLaterScheduleView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterScheduleView;
  v6 = -[PKPayLaterScheduleView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dynamicContentItem, a3);
    -[PKPayLaterScheduleView _configureView](v7, "_configureView");
  }

  return v7;
}

+ (BOOL)canFormScheduleViewForDynamincContentItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (void)setDynamicContentItem:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dynamicContentItem, a3);
    -[PKPayLaterScheduleView _configureView](self, "_configureView");
    -[PKPayLaterScheduleView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterScheduleView;
  -[PKPayLaterScheduleView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPayLaterScheduleView bounds](self, "bounds");
  -[PKPayLaterScheduleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterScheduleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  int v5;
  CGRectEdge v6;
  CGRectEdge v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
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
  _BOOL4 v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double MidX;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  NSArray *obj;
  double v55;
  double v56;
  double v57;
  double height;
  double width;
  CGFloat amount;
  CGFloat v62;
  double v63;
  CGSize v64;
  CGPoint v65;
  CGRect v66;
  CGRect v67;
  CGAffineTransform v68;
  CGRect v69;
  CGRect slice;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CGRect remainder;
  CGRect v76;
  _BYTE v77[128];
  uint64_t v78;
  CGSize result;

  v78 = *MEMORY[0x1E0C80C00];
  memset(&v76, 0, sizeof(v76));
  remainder = a3;
  width = a3.size.width;
  height = a3.size.height;
  v5 = -[PKPayLaterScheduleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v5)
    v6 = CGRectMaxXEdge;
  else
    v6 = CGRectMinXEdge;
  if (v5)
    v7 = CGRectMinXEdge;
  else
    v7 = CGRectMaxXEdge;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = self->_horizontalStacks;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v72;
    v57 = *MEMORY[0x1E0C9D820];
    v63 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v55 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v56 = *MEMORY[0x1E0C9D538];
    v64 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v65 = (CGPoint)*MEMORY[0x1E0C9D648];
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v72 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v13, "trailingLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "leadingLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "circleView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v14)
          v18 = 10.0;
        else
          v18 = 0.0;
        if (v16)
          v19 = 3.0;
        else
          v19 = 0.0;
        objc_msgSend(v16, "sizeThatFits:", width, height);
        v21 = v20;
        amount = v19;
        v22 = width - v20 - v19;
        v23 = fmin(v22, self->_minimimLeadingLabelWidth);
        v24 = v57;
        v25 = v21;
        if (v14)
        {
          objc_msgSend(v14, "sizeThatFits:", v22 - v23 - v18, 1.79769313e308);
          v21 = v25;
        }
        v26 = v14 != 0 && v24 > v22 - v23 - v18;
        v27 = v22 * 0.5 - v18 * 0.5;
        if (v26)
          v28 = v22 * 0.5 - v18 * 0.5;
        else
          v28 = v22 - v23 - v18;
        v29 = 0.0;
        v30 = 0.0;
        v31 = v63;
        if (v15)
        {
          if (v26)
            v30 = v27;
          else
            v30 = v23;
          objc_msgSend(v15, "sizeThatFits:", v30, 1.79769313e308, v21);
          v21 = v25;
          v31 = v32;
        }
        v62 = v18;
        v33 = v63;
        if (v14)
        {
          objc_msgSend(v14, "sizeThatFits:", v28, 1.79769313e308, v21);
          v21 = v25;
          v33 = v34;
          v29 = v28;
        }
        v35 = v21 + 8.0;
        if (!v17)
          v35 = 0.0;
        v36 = fmax(v31, fmax(v35, v33));
        memset(&slice, 0, sizeof(slice));
        v37 = fmax(v31, fmax(v36, v33));
        v38 = v21;
        CGRectDivide(remainder, &slice, &remainder, v37, CGRectMinYEdge);
        v69.origin = v65;
        v69.size = v64;
        if (v17)
        {
          CGRectDivide(slice, &v69, &slice, v38, v6);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v69.origin.x = v39;
          v69.origin.y = v40;
          v69.size.width = v41;
          v69.size.height = v42;
          CGAffineTransformMakeScale(&v68, 0.7, 0.7);
          objc_msgSend(v17, "setTransform:", &v68);
          objc_msgSend(v17, "setBounds:", v56, v55, v38, v36);
          objc_msgSend(v17, "setBounds:", v56, v55, v69.size.width, v69.size.height);
          MidX = CGRectGetMidX(v69);
          objc_msgSend(v17, "setCenter:", MidX, CGRectGetMidY(v69));
        }
        CGRectDivide(slice, &v76, &slice, amount, v6);
        v67.origin = v65;
        v67.size = v64;
        if (v15)
        {
          CGRectDivide(slice, &v67, &slice, v30, v6);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v67.origin.x = v44;
          v67.origin.y = v45;
          v67.size.width = v46;
          v67.size.height = v47;
        }
        CGRectDivide(slice, &v76, &slice, v62, v6);
        v66.origin = v65;
        v66.size = v64;
        if (v14)
        {
          CGRectDivide(slice, &v66, &slice, v29, v7);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v66.origin.x = v48;
          v66.origin.y = v49;
          v66.size.width = v50;
          v66.size.height = v51;
        }
        if (!a4)
        {
          objc_msgSend(v17, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
          objc_msgSend(v15, "setFrame:", v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
          objc_msgSend(v14, "setFrame:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
        }
        objc_msgSend(v17, "setNeedsDisplay");
        v11 = v11 + v37;

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  v52 = width;
  v53 = v11;
  result.height = v53;
  result.width = v52;
  return result;
}

- (void)_configureView
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  PKPayLaterScheduleHorizontalStack *v24;
  void *v25;
  void *v26;
  PKPayLaterScheduleHorizontalStack *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  unint64_t v34;
  NSArray *v35;
  NSArray *horizontalStacks;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t m;
  double v43;
  double v44;
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
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v3 = self->_horizontalStacks;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v8, "allViews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v54 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "removeFromSuperview");
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v11);
        }

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v5);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterDynamicContentPageItem sections](self->_dynamicContentItem, "sections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "rows");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = 0;
    do
    {
      objc_msgSend(v16, "rows");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v16, "rows");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 + 1 == objc_msgSend(v22, "count"))
          v23 = 2;
        else
          v23 = 1;

      }
      else
      {
        v23 = 0;
      }
      v24 = [PKPayLaterScheduleHorizontalStack alloc];
      objc_msgSend(v21, "contentTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contentDetailTrailing");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PKPayLaterScheduleHorizontalStack initWithLeadingText:trailingText:stackIndex:](v24, "initWithLeadingText:trailingText:stackIndex:", v25, v26, v23);

      objc_msgSend(v14, "safelyAddObject:", v27);
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      -[PKPayLaterScheduleHorizontalStack allViews](v27, "allViews");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v50;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v50 != v31)
              objc_enumerationMutation(v28);
            -[PKPayLaterScheduleView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
        }
        while (v30);
      }

      ++v19;
      objc_msgSend(v16, "rows");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

    }
    while (v19 < v34);
  }
  v35 = (NSArray *)objc_msgSend(v14, "copy");
  horizontalStacks = self->_horizontalStacks;
  self->_horizontalStacks = v35;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = self->_horizontalStacks;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v46;
    v41 = 0.0;
    do
    {
      for (m = 0; m != v39; ++m)
      {
        if (*(_QWORD *)v46 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * m), "minimumLeadingLabelWidth");
        v41 = fmax(v41, v43);
      }
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v39);
  }

  PKFloatCeilToPixel();
  self->_minimimLeadingLabelWidth = v44;
  -[PKPayLaterScheduleView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FC8]);

}

- (double)_minimumRequiredWidthForLeadingLabels
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_horizontalStacks;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "minimumLeadingLabelWidth", (_QWORD)v10);
        v6 = fmax(v6, v8);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  PKFloatCeilToPixel();
  return result;
}

- (PKPayLaterDynamicContentPageItem)dynamicContentItem
{
  return self->_dynamicContentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentItem, 0);
  objc_storeStrong((id *)&self->_horizontalStacks, 0);
}

@end
