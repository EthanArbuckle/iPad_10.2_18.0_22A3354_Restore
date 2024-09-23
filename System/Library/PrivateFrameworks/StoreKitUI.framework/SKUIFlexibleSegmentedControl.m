@implementation SKUIFlexibleSegmentedControl

- (SKUIFlexibleSegmentedControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIFlexibleSegmentedControl *v8;
  SKUIFlexibleSegmentedControl *v9;
  UISegmentedControl *v10;
  UISegmentedControl *segmentedControl;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIFlexibleSegmentedControl initWithFrame:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIFlexibleSegmentedControl;
  v8 = -[SKUIFlexibleSegmentedControl initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_maximumNumberOfVisibleItems = 0x7FFFFFFFFFFFFFFFLL;
    v8->_previousSelectedSegmentIndex = -1;
    v10 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segmentedControl = v9->_segmentedControl;
    v9->_segmentedControl = v10;

    -[UISegmentedControl addTarget:action:forControlEvents:](v9->_segmentedControl, "addTarget:action:forControlEvents:", v9, sel__valueChangeAction_, 4096);
    -[UISegmentedControl setSemanticContentAttribute:](v9->_segmentedControl, "setSemanticContentAttribute:", storeSemanticContentAttribute());
    -[SKUIFlexibleSegmentedControl addSubview:](v9, "addSubview:", v9->_segmentedControl);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UISegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", self, 0, 64);
  v3.receiver = self;
  v3.super_class = (Class)SKUIFlexibleSegmentedControl;
  -[SKUIFlexibleSegmentedControl dealloc](&v3, sel_dealloc);
}

- (void)cancelMoreList
{
  if (self->_isMoreListSelected)
  {
    self->_isMoreListSelected = 0;
    self->_selectedSegmentIndex = self->_previousSelectedSegmentIndex;
    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)frameForSegmentWithIndex:(int64_t)a3
{
  double *v5;
  CGFloat v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  v5 = (double *)MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = -[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments");
  if (v7 <= a3)
  {
    v18 = *v5;
    v17 = v5[2];
    v16 = v5[3];
  }
  else
  {
    v8 = v7;
    -[UISegmentedControl frame](self->_segmentedControl, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    *(float *)&v9 = v13 / (double)v8;
    v17 = floorf(*(float *)&v9);
    v18 = v10 + (double)a3 * v17;
    if (storeShouldReverseLayoutDirection())
    {
      v25.origin.x = v10;
      v25.origin.y = v12;
      v25.size.width = v14;
      v25.size.height = v16;
      MaxX = CGRectGetMaxX(v25);
      v26.origin.x = v18;
      v26.origin.y = v6;
      v26.size.width = v17;
      v26.size.height = v16;
      v20 = MaxX - CGRectGetWidth(v26);
      v27.origin.x = v18;
      v27.origin.y = v6;
      v27.size.width = v17;
      v27.size.height = v16;
      v18 = v20 - CGRectGetMinX(v27);
    }
    v6 = v12;
  }
  v21 = v18;
  v22 = v6;
  v23 = v17;
  v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (int64_t)moreListIndex
{
  unint64_t v3;

  v3 = -[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments");
  if (v3 >= -[NSArray count](self->_itemTitles, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v3 - 1;
}

- (int64_t)selectedSegmentIndex
{
  int64_t previousSelectedSegmentIndex;

  previousSelectedSegmentIndex = self->_previousSelectedSegmentIndex;
  if (previousSelectedSegmentIndex == -1)
    return self->_selectedSegmentIndex;
  return previousSelectedSegmentIndex;
}

- (void)setDesiredSegmentWidth:(double)a3
{
  if (self->_desiredSegmentWidth != a3)
  {
    self->_desiredSegmentWidth = a3;
    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSizesSegmentsToFitWidth:(BOOL)a3
{
  if (self->_sizesSegmentsToFitWidth != a3)
  {
    self->_sizesSegmentsToFitWidth = a3;
    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setItemTitles:(id)a3
{
  NSArray *v4;
  NSArray *itemTitles;

  if (self->_itemTitles != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    itemTitles = self->_itemTitles;
    self->_itemTitles = v4;

    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumNumberOfVisibleItems:(int64_t)a3
{
  if (self->_maximumNumberOfVisibleItems != a3)
  {
    self->_maximumNumberOfVisibleItems = a3;
    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMoreListTitle:(id)a3
{
  NSString *v4;
  NSString *moreListTitle;

  if (self->_moreListTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    moreListTitle = self->_moreListTitle;
    self->_moreListTitle = v4;

    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  int64_t selectedSegmentIndex;

  selectedSegmentIndex = self->_selectedSegmentIndex;
  if (selectedSegmentIndex != a3)
  {
    self->_isMoreListSelected = 0;
    self->_previousSelectedSegmentIndex = selectedSegmentIndex;
    self->_selectedSegmentIndex = a3;
    -[SKUIFlexibleSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  double v11;
  float v12;
  unint64_t v13;
  UISegmentedControl *segmentedControl;
  int64_t selectedSegmentIndex;
  unint64_t v16;
  int64_t v17;
  _QWORD v18[9];

  -[SKUIFlexibleSegmentedControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__SKUIFlexibleSegmentedControl_layoutSubviews__block_invoke;
  v18[3] = &unk_1E73A2F30;
  v18[4] = self;
  v18[5] = v7;
  v18[6] = v8;
  *(double *)&v18[7] = v3;
  *(double *)&v18[8] = v5;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18);
  -[UISegmentedControl frame](self->_segmentedControl, "frame");
  v10 = (v4 - v9) * 0.5;
  v12 = (v6 - v11) * 0.5;
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", floorf(v10), floorf(v12));
  v13 = -[SKUIFlexibleSegmentedControl moreListIndex](self, "moreListIndex");
  segmentedControl = self->_segmentedControl;
  if (self->_isMoreListSelected)
  {
    selectedSegmentIndex = v13;
  }
  else
  {
    v16 = -[UISegmentedControl numberOfSegments](segmentedControl, "numberOfSegments");
    if (v13 >= v16)
      v17 = v16;
    else
      v17 = v13;
    selectedSegmentIndex = self->_selectedSegmentIndex;
    segmentedControl = self->_segmentedControl;
    if (selectedSegmentIndex >= v17)
      selectedSegmentIndex = -1;
  }
  -[UISegmentedControl setSelectedSegmentIndex:](segmentedControl, "setSelectedSegmentIndex:", selectedSegmentIndex);
}

uint64_t __46__SKUIFlexibleSegmentedControl_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSegmentedControl:withTitles:boundingSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3C58]);
  -[SKUIFlexibleSegmentedControl _configureSegmentedControl:withTitles:boundingSize:](self, "_configureSegmentedControl:withTitles:boundingSize:", v6, self->_itemTitles, width, height);
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_valueChangeAction:(id)a3
{
  int64_t v4;
  int64_t selectedSegmentIndex;
  id WeakRetained;
  char v7;
  void *v8;
  id v9;
  char v10;
  id v11;

  self->_previousSelectedSegmentIndex = self->_selectedSegmentIndex;
  self->_selectedSegmentIndex = objc_msgSend(a3, "selectedSegmentIndex");
  v4 = -[SKUIFlexibleSegmentedControl moreListIndex](self, "moreListIndex");
  selectedSegmentIndex = self->_selectedSegmentIndex;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (selectedSegmentIndex == v4)
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[NSArray subarrayWithRange:](self->_itemTitles, "subarrayWithRange:", v4, -[NSArray count](self->_itemTitles, "count") - v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "segmentedControl:showMoreListWithTitles:", self, v8);

    }
    self->_isMoreListSelected = 1;
  }
  else
  {
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "segmentedControl:didSelectSegmentIndex:", self, self->_selectedSegmentIndex);

    }
  }
}

- (void)_configureSegmentedControl:(id)a3 withTitles:(id)a4 boundingSize:(CGSize)a5
{
  double width;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  int64_t maximumNumberOfVisibleItems;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double desiredSegmentWidth;
  double v29;
  double v30;
  NSString *v31;
  NSString *v32;
  uint64_t v33;
  void *v34;
  id v35;

  width = a5.width;
  v35 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_msgSend(v9, "count");
  if (self->_moreListTitle
    && (maximumNumberOfVisibleItems = self->_maximumNumberOfVisibleItems,
        v13 = v11 - maximumNumberOfVisibleItems,
        v11 > maximumNumberOfVisibleItems))
  {
    v14 = maximumNumberOfVisibleItems - 1;
    v15 = v13 + 1;
    objc_msgSend(v9, "subarrayWithRange:", maximumNumberOfVisibleItems - 1, v13 + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v16);

    objc_msgSend(v9, "removeObjectsInRange:", v14, v15);
    objc_msgSend(v9, "addObject:", self->_moreListTitle);
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  v18 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  while (1)
  {
    -[SKUIFlexibleSegmentedControl _setTitles:forSegmentedControl:](self, "_setTitles:forSegmentedControl:", v9, v35);
    objc_msgSend(v35, "sizeThatFits:", v18, v19);
    v21 = v20;
    v23 = v22;
    v24 = objc_msgSend(v9, "count");
    if (v24 == 1 || v21 + (float)((float)v24 * -10.0) <= width || !self->_moreListTitle)
      break;
    if ((v17 & 1) != 0)
    {
      v25 = v24 - 2;
      objc_msgSend(v9, "objectAtIndex:", v24 - 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v26);

      objc_msgSend(v9, "removeObjectAtIndex:", v25);
      v17 = 1;
    }
    else
    {
      objc_msgSend(v9, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v27);

      objc_msgSend(v9, "removeLastObject");
      v17 = 1;
      if (self->_moreListTitle)
        objc_msgSend(v9, "addObject:");
    }
  }
  desiredSegmentWidth = self->_desiredSegmentWidth;
  if (desiredSegmentWidth > 0.00000011920929)
  {
    v29 = desiredSegmentWidth * (double)v24;
    if (self->_sizesSegmentsToFitWidth)
      v29 = width;
    if (v21 < v29)
      v21 = v29;
  }
  if (v21 >= width)
    v30 = width;
  else
    v30 = v21;
  objc_msgSend(v35, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v30, v23);
  objc_msgSend(v9, "lastObject");
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31 == self->_moreListTitle)
  {
    v33 = objc_msgSend(v10, "count");

    if (v33 == 1)
    {
      objc_msgSend(v9, "removeLastObject");
      objc_msgSend(v10, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v34);

      -[SKUIFlexibleSegmentedControl _setTitles:forSegmentedControl:](self, "_setTitles:forSegmentedControl:", v9, v35);
    }
  }
  else
  {

  }
}

- (void)_setTitles:(id)a3 forSegmentedControl:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "removeAllSegments");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SKUIFlexibleSegmentedControl__setTitles_forSegmentedControl___block_invoke;
  v8[3] = &unk_1E73A5E38;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __63__SKUIFlexibleSegmentedControl__setTitles_forSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSegmentWithTitle:atIndex:animated:", a2, a3, 0);
}

- (SKUIFlexibleSegmentedControlDelegate)delegate
{
  return (SKUIFlexibleSegmentedControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)desiredSegmentWidth
{
  return self->_desiredSegmentWidth;
}

- (NSArray)itemTitles
{
  return self->_itemTitles;
}

- (int64_t)maximumNumberOfVisibleItems
{
  return self->_maximumNumberOfVisibleItems;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (BOOL)sizesSegmentsToFitWidth
{
  return self->_sizesSegmentsToFitWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_moreListTitle, 0);
  objc_storeStrong((id *)&self->_itemTitles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFlexibleSegmentedControl initWithFrame:]";
}

@end
