@implementation PKDynamicPassBucketView

- (PKDynamicPassBucketView)initWithBucket:(id)a3
{
  id v5;
  PKDynamicPassBucketView *v6;
  PKDynamicPassBucketView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDynamicPassBucketView;
  v6 = -[PKDynamicPassBucketView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bucket, a3);

  return v7;
}

- (void)setLabelTextColor:(id)a3
{
  id v4;
  CGColor *v5;
  id v6;
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

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIColor CGColor](self->_labelTextColor, "CGColor");
  v6 = objc_retainAutorelease(v4);
  if (!CGColorEqualToColor(v5, (CGColorRef)objc_msgSend(v6, "CGColor")))
  {
    objc_storeStrong((id *)&self->_labelTextColor, v6);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_fieldViews;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setLabelTextColor:", v6, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)setLabelBlendMode:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_labelBlendMode;
  v7 = (NSString *)v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v9)
        goto LABEL_16;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_labelBlendMode, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_fieldViews;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setLabelBlendMode:", v8, (_QWORD)v15);
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
LABEL_16:

}

- (void)setValueTextColor:(id)a3
{
  id v4;
  CGColor *v5;
  id v6;
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

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIColor CGColor](self->_valueTextColor, "CGColor");
  v6 = objc_retainAutorelease(v4);
  if (!CGColorEqualToColor(v5, (CGColorRef)objc_msgSend(v6, "CGColor")))
  {
    objc_storeStrong((id *)&self->_valueTextColor, v6);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_fieldViews;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setValueTextColor:", v6, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)setValueBlendMode:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_valueBlendMode;
  v7 = (NSString *)v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v9)
        goto LABEL_16;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_valueBlendMode, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_fieldViews;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setValueBlendMode:", v8, (_QWORD)v15);
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
LABEL_16:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  int64_t sizingRule;
  int64_t layoutDirection;
  int64_t distribution;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  NSUInteger v23;
  NSArray *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  double v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
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
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)PKDynamicPassBucketView;
  -[PKDynamicPassBucketView layoutSubviews](&v59, sel_layoutSubviews);
  if (-[NSArray count](self->_bucket, "count"))
  {
    -[PKDynamicPassBucketView _createFieldViewsIfNecessary](self, "_createFieldViewsIfNecessary");
    -[PKDynamicPassBucketView bounds](self, "bounds");
    v5 = v3;
    sizingRule = self->_sizingRule;
    if (sizingRule == 1)
    {
      -[PKDynamicPassBucketView _measureAndFitEvenlySizedSubviewsForSize:](self, "_measureAndFitEvenlySizedSubviewsForSize:", v3, v4);
    }
    else if (!sizingRule)
    {
      -[PKDynamicPassBucketView _measureAndFitVariablySizedSubviewsForSize:](self, "_measureAndFitVariablySizedSubviewsForSize:", v3, v4);
    }
    layoutDirection = self->_layoutDirection;
    distribution = self->_distribution;
    if (distribution == 1)
    {
      v23 = -[NSArray count](self->_fieldViews, "count");
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v24 = self->_fieldViews;
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      v26 = 0.0;
      v27 = 0.0;
      if (v25)
      {
        v28 = v25;
        v29 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v52 != v29)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "frame");
            v27 = v27 + v31 + self->_spacing;
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v28);
      }

      v32 = v5 - (v27 - self->_spacing);
      if (v32 > 0.0 && v23 >= 2)
        v26 = v32 / (double)(v23 - 1);
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v9 = self->_fieldViews;
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      if (v34)
      {
        v35 = v34;
        if (layoutDirection != 1)
          v5 = 0.0;
        v36 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(v9);
            v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            objc_msgSend(v38, "frame", (_QWORD)v47);
            v41 = v39;
            v42 = v40;
            if (layoutDirection == 1)
              v44 = v5 - v39;
            else
              v44 = v5;
            v45 = 0;
            if (layoutDirection == 1)
            {
              v43 = v5 - v39;
              v5 = CGRectGetMinX(*(CGRect *)(&v39 - 2)) - v26 - self->_spacing;
            }
            else
            {
              v46 = v5;
              v5 = v26 + CGRectGetMaxX(*(CGRect *)(&v39 - 2)) + self->_spacing;
            }
            objc_msgSend(v38, "setFrame:", v44, 0.0, v41, v42);
          }
          v35 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        }
        while (v35);
      }
    }
    else
    {
      if (distribution)
        return;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v9 = self->_fieldViews;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v10)
      {
        v11 = v10;
        if (layoutDirection != 1)
          v5 = 0.0;
        v12 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v11; ++k)
          {
            if (*(_QWORD *)v56 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
            objc_msgSend(v14, "frame");
            v17 = v15;
            v18 = v16;
            if (layoutDirection == 1)
              v20 = v5 - v15;
            else
              v20 = v5;
            v21 = 0;
            if (layoutDirection == 1)
            {
              v19 = v5 - v15;
              v5 = CGRectGetMinX(*(CGRect *)(&v15 - 2)) - self->_spacing;
            }
            else
            {
              v22 = v5;
              v5 = CGRectGetMaxX(*(CGRect *)(&v15 - 2)) + self->_spacing;
            }
            objc_msgSend(v14, "setFrame:", v20, 0.0, v17, v18);
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        }
        while (v11);
      }
    }

  }
}

- (CGSize)fittedSizeFor:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  int64_t sizingRule;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKDynamicPassBucketView _createFieldViewsIfNecessary](self, "_createFieldViewsIfNecessary");
  sizingRule = self->_sizingRule;
  if (sizingRule == 1)
  {
    -[PKDynamicPassBucketView _measureAndFitEvenlySizedSubviewsForSize:](self, "_measureAndFitEvenlySizedSubviewsForSize:", width, height);
  }
  else if (!sizingRule)
  {
    -[PKDynamicPassBucketView _measureAndFitVariablySizedSubviewsForSize:](self, "_measureAndFitVariablySizedSubviewsForSize:", width, height);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_createFieldViewsIfNecessary
{
  NSArray *sortedFieldViews;
  id v4;
  NSArray *bucket;
  NSArray *v6;
  NSArray *fieldViews;
  id v8;
  _QWORD v9[5];
  id v10;

  if (!-[NSArray count](self->_fieldViews, "count"))
  {
    sortedFieldViews = self->_sortedFieldViews;
    self->_sortedFieldViews = (NSArray *)MEMORY[0x1E0C9AA60];

    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bucket = self->_bucket;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__PKDynamicPassBucketView__createFieldViewsIfNecessary__block_invoke;
    v9[3] = &unk_1E3E64AA8;
    v9[4] = self;
    v10 = v4;
    v8 = v4;
    -[NSArray enumerateObjectsUsingBlock:](bucket, "enumerateObjectsUsingBlock:", v9);
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    fieldViews = self->_fieldViews;
    self->_fieldViews = v6;

  }
}

void __55__PKDynamicPassBucketView__createFieldViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _PKSimpleFieldView *v10;

  v3 = a2;
  v10 = -[_PKSimpleFieldView initWithField:]([_PKSimpleFieldView alloc], "initWithField:", v3);

  objc_msgSend(*(id *)(a1 + 32), "verticalPadding");
  -[_PKSimpleFieldView setVerticalPadding:](v10, "setVerticalPadding:");
  objc_msgSend(*(id *)(a1 + 32), "labelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView setLabelFont:](v10, "setLabelFont:", v4);

  objc_msgSend(*(id *)(a1 + 32), "labelTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView setLabelTextColor:](v10, "setLabelTextColor:", v5);

  objc_msgSend(*(id *)(a1 + 32), "labelBlendMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView setLabelBlendMode:](v10, "setLabelBlendMode:", v6);

  objc_msgSend(*(id *)(a1 + 32), "valueFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView setValueFont:](v10, "setValueFont:", v7);

  objc_msgSend(*(id *)(a1 + 32), "valueTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView setValueTextColor:](v10, "setValueTextColor:", v8);

  objc_msgSend(*(id *)(a1 + 32), "valueBlendMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView setValueBlendMode:](v10, "setValueBlendMode:", v9);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v10);

}

- (CGSize)_measureAndFitEvenlySizedSubviewsForSize:(CGSize)a3
{
  void *v3;
  CGFloat height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double spacing;
  UIFont *v13;
  UIFont *resizedValueFont;
  double v15;
  double minResizeScale;
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
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  uint64_t i;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  NSArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t j;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v83 = *MEMORY[0x1E0C80C00];
  -[PKDynamicPassBucketView bounds](self, "bounds");
  if (v7 == width)
  {
    v9 = v8;
    v10 = v7;
  }
  else
  {
    v11 = -[NSArray count](self->_fieldViews, "count");
    spacing = self->_spacing;
    v13 = self->_valueFont;
    resizedValueFont = self->_resizedValueFont;
    self->_resizedValueFont = 0;

    -[UIFont pointSize](v13, "pointSize");
    v71 = v15;
    minResizeScale = self->_minResizeScale;
    -[PKDynamicPassBucketView labelFont](self, "labelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "capHeight");
    v19 = v18;
    -[UIFont capHeight](v13, "capHeight");
    v21 = v19 / v20;
    if (minResizeScale > v19 / v20)
    {
      v25 = self->_minResizeScale;
    }
    else
    {
      -[PKDynamicPassBucketView labelFont](self, "labelFont");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "capHeight");
      v23 = v22;
      -[UIFont capHeight](v13, "capHeight");
      v25 = v23 / v24;
    }
    v70 = 1.0;
    if (v25 <= 1.0)
    {
      v26 = self->_minResizeScale;
      -[PKDynamicPassBucketView labelFont](self, "labelFont");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "capHeight");
      v29 = v28;
      -[UIFont capHeight](v13, "capHeight");
      if (v26 <= v29 / v30)
      {
        -[PKDynamicPassBucketView labelFont](self, "labelFont");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "capHeight");
        v33 = v32;
        -[UIFont capHeight](v13, "capHeight");
        v70 = v33 / v34;

      }
      else
      {
        v70 = self->_minResizeScale;
      }

    }
    if (minResizeScale <= v21)

    v72 = height;
    v10 = width;
    v35 = (width - (double)(v11 - 1) * spacing) / (double)v11;

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v36 = self->_fieldViews;
    v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v78;
      v40 = *MEMORY[0x1E0C9D538];
      v41 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v9 = 0.0;
      v42 = v71;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v78 != v39)
            objc_enumerationMutation(v36);
          v44 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v44, "setValueFont:", v13);
          objc_msgSend(v44, "sizeThatFits:", v10, v72);
          v46 = v45;
          v48 = v47;
          objc_msgSend(v44, "setFrame:", v40, v41, v45, v47);
          objc_msgSend(v44, "valueLabel");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "sizeThatFits:", v46, v48);
          v51 = v50;

          if (v51 > v35)
          {
            v52 = v35 / v51;
            if (v35 / v51 <= v70)
              v52 = v70;
            v53 = floor(v71 * v52);
            if (v53 < v42)
              v42 = v53;
          }
          if (v9 <= v48)
            v9 = v48;
        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v38);
    }
    else
    {
      v9 = 0.0;
      v42 = v71;
    }

    if (v42 != v71)
    {
      v54 = (void *)MEMORY[0x1E0DC1350];
      -[UIFont fontDescriptor](v13, "fontDescriptor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "fontWithDescriptor:size:", v55, v42);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_resizedValueFont, v56);
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v57 = self->_fieldViews;
      v58 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v74;
        v61 = *MEMORY[0x1E0C9D538];
        v62 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v9 = 0.0;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v74 != v60)
              objc_enumerationMutation(v57);
            v64 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend(v64, "setValueFont:", v56);
            objc_msgSend(v64, "sizeThatFits:", v35, v72);
            v66 = v65;
            objc_msgSend(v64, "setFrame:", v61, v62, v67, v65);
            if (v9 <= v66)
              v9 = v66;
          }
          v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        }
        while (v59);
      }
      else
      {
        v9 = 0.0;
      }

    }
  }
  v68 = v10;
  v69 = v9;
  result.height = v69;
  result.width = v68;
  return result;
}

- (CGSize)_measureAndFitVariablySizedSubviewsForSize:(CGSize)a3
{
  void *v3;
  CGFloat height;
  double width;
  double v7;
  double v8;
  double v9;
  NSUInteger v10;
  double spacing;
  UIFont *v12;
  UIFont *resizedValueFont;
  double minResizeScale;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  uint64_t i;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  BOOL v56;
  double v57;
  double v58;
  double v59;
  float v60;
  double v61;
  void *v62;
  void *v63;
  NSArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGRect slice;
  CGRect remainder;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;
  CGSize result;
  CGRect v98;

  height = a3.height;
  width = a3.width;
  v96 = *MEMORY[0x1E0C80C00];
  -[PKDynamicPassBucketView bounds](self, "bounds");
  if (v7 == width)
  {
    v9 = v8;
    width = v7;
    goto LABEL_48;
  }
  v82 = height;
  v10 = -[NSArray count](self->_fieldViews, "count");
  spacing = self->_spacing;
  v12 = self->_valueFont;
  resizedValueFont = self->_resizedValueFont;
  self->_resizedValueFont = 0;

  minResizeScale = self->_minResizeScale;
  -[PKDynamicPassBucketView labelFont](self, "labelFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capHeight");
  v17 = v16;
  -[UIFont capHeight](v12, "capHeight");
  v19 = v17 / v18;
  if (minResizeScale > v17 / v18)
  {
    v23 = self->_minResizeScale;
  }
  else
  {
    -[PKDynamicPassBucketView labelFont](self, "labelFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capHeight");
    v21 = v20;
    -[UIFont capHeight](v12, "capHeight");
    v23 = v21 / v22;
  }
  v24 = v10 - 1;
  v25 = 1.0;
  if (v23 <= 1.0)
  {
    v26 = self->_minResizeScale;
    -[PKDynamicPassBucketView labelFont](self, "labelFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "capHeight");
    v29 = v28;
    -[UIFont capHeight](v12, "capHeight");
    if (v26 <= v29 / v30)
    {
      -[PKDynamicPassBucketView labelFont](self, "labelFont");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "capHeight");
      v33 = v32;
      -[UIFont capHeight](v12, "capHeight");
      v25 = v33 / v34;

    }
    else
    {
      v25 = self->_minResizeScale;
    }

  }
  if (minResizeScale <= v19)

  v35 = width - (double)v24 * spacing;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v36 = self->_fieldViews;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v37)
  {
    v38 = v37;
    v80 = v25;
    v81 = width - (double)v24 * spacing;
    v39 = *(_QWORD *)v91;
    v40 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v83 = *MEMORY[0x1E0C9D538];
    v9 = 0.0;
    v41 = 0.0;
    v42 = 0.0;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v91 != v39)
          objc_enumerationMutation(v36);
        v44 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v44, "setValueFont:", v12);
        objc_msgSend(v44, "sizeThatFits:", width, v82);
        v46 = v45;
        v48 = v47;
        objc_msgSend(v44, "setFrame:", v83, v40, v45, v47);
        v42 = v42 + v46;
        objc_msgSend(v44, "labelLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "sizeThatFits:", v46, v48);
        v50 = width;
        v52 = v51;

        objc_msgSend(v44, "valueLabel");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "sizeThatFits:", v46, v48);
        v55 = v54;

        v56 = v52 < v55;
        width = v50;
        v57 = -0.0;
        if (v56)
          v57 = v55;
        v41 = v41 + v57;
        if (v9 <= v48)
          v9 = v48;
      }
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v38);

    v35 = v81;
    if (v42 <= v81 || v41 <= 0.0)
      goto LABEL_42;
    -[UIFont pointSize](v12, "pointSize");
    v59 = (v81 - (v42 - v41)) / v41;
    if (v59 < v80)
      v59 = v80;
    v60 = v59 * v58;
    v61 = floorf(v60);
    v62 = (void *)MEMORY[0x1E0DC1350];
    -[UIFont fontDescriptor](v12, "fontDescriptor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "fontWithDescriptor:size:", v63, v61);
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_resizedValueFont, v36);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v64 = self->_fieldViews;
    v65 = -[NSArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v87;
      v9 = 0.0;
      v42 = 0.0;
      do
      {
        for (j = 0; j != v66; ++j)
        {
          if (*(_QWORD *)v87 != v67)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_msgSend(v69, "setValueFont:", v36);
          objc_msgSend(v69, "sizeThatFits:", width, v82);
          v71 = v70;
          v73 = v72;
          objc_msgSend(v69, "setFrame:", v83, v40, v70, v72);
          v42 = v42 + v71;
          if (v9 <= v73)
            v9 = v73;
        }
        v66 = -[NSArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      }
      while (v66);
    }
    else
    {
      v9 = 0.0;
      v42 = 0.0;
    }

  }
  else
  {
    v9 = 0.0;
    v42 = 0.0;
  }

LABEL_42:
  if (v42 > v35)
  {
    -[PKDynamicPassBucketView _fieldViewsByWidth](self, "_fieldViewsByWidth");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v76 = objc_msgSend(v74, "count") - 1;
    do
    {
      v77 = v75;
      objc_msgSend(v74, "objectAtIndex:", v76);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v75, "frame");
      memset(&remainder, 0, sizeof(remainder));
      memset(&slice, 0, sizeof(slice));
      CGRectDivide(v98, &slice, &remainder, v42 - v35, CGRectMaxXEdge);
      objc_msgSend(v75, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      if (!v76)
        break;
      v42 = v42 - slice.size.width;
      --v76;
    }
    while (v42 > v35);

  }
LABEL_48:
  v78 = width;
  v79 = v9;
  result.height = v79;
  result.width = v78;
  return result;
}

- (id)_fieldViewsByWidth
{
  NSArray *v3;
  NSArray *sortedFieldViews;

  if (!-[NSArray count](self->_sortedFieldViews, "count"))
  {
    -[NSArray sortedArrayUsingComparator:](self->_fieldViews, "sortedArrayUsingComparator:", &__block_literal_global_238);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedFieldViews = self->_sortedFieldViews;
    self->_sortedFieldViews = v3;

  }
  return self->_sortedFieldViews;
}

uint64_t __45__PKDynamicPassBucketView__fieldViewsByWidth__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "bounds");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v7;

  if (v6 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 > v8)
    return 1;
  else
    return v9;
}

- (NSArray)bucket
{
  return self->_bucket;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (void)setDistribution:(int64_t)a3
{
  self->_distribution = a3;
}

- (int64_t)sizingRule
{
  return self->_sizingRule;
}

- (void)setSizingRule:(int64_t)a3
{
  self->_sizingRule = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (NSString)labelBlendMode
{
  return self->_labelBlendMode;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
}

- (UIColor)valueTextColor
{
  return self->_valueTextColor;
}

- (NSString)valueBlendMode
{
  return self->_valueBlendMode;
}

- (double)minResizeScale
{
  return self->_minResizeScale;
}

- (void)setMinResizeScale:(double)a3
{
  self->_minResizeScale = a3;
}

- (UIFont)resizedValueFont
{
  return self->_resizedValueFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizedValueFont, 0);
  objc_storeStrong((id *)&self->_valueBlendMode, 0);
  objc_storeStrong((id *)&self->_valueTextColor, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_labelBlendMode, 0);
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_sortedFieldViews, 0);
  objc_storeStrong((id *)&self->_fieldViews, 0);
}

@end
