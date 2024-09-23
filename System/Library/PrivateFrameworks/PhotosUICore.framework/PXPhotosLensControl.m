@implementation PXPhotosLensControl

- (PXPhotosLensControl)init
{
  PXPhotosLensControl *v2;
  PXConcretePhotosLensControlItem *v3;
  uint64_t v4;
  NSArray *items;
  uint64_t v6;
  PXPhotosLensControlItem *selectedItem;
  id v8;
  void *v9;
  uint64_t v10;
  UIVisualEffectView *backgroundEffectView;
  uint64_t v12;
  UIColor *defaultTextColor;
  _PXPhotosLensSegmentedControl *v14;
  _PXPhotosLensSegmentedControl *segmentedControl;
  uint64_t v16;
  PXUpdater *updater;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosLensControl;
  v2 = -[PXPhotosLensControl initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = -[PXConcretePhotosLensControlItem initWithIdentifier:title:symbolName:]([PXConcretePhotosLensControlItem alloc], "initWithIdentifier:title:symbolName:", CFSTR("placeholder"), &stru_1E5149688, 0);
    v22[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    items = v2->_items;
    v2->_items = (NSArray *)v4;

    objc_storeStrong((id *)&v2->_enabledItems, v2->_items);
    -[NSArray firstObject](v2->_items, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    selectedItem = v2->_selectedItem;
    v2->_selectedItem = (PXPhotosLensControlItem *)v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1202);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithEffect:", v9);
    backgroundEffectView = v2->_backgroundEffectView;
    v2->_backgroundEffectView = (UIVisualEffectView *)v10;

    -[PXPhotosLensControl addSubview:](v2, "addSubview:", v2->_backgroundEffectView);
    v2->_textSizes = (CGSize *)malloc_type_calloc(-[NSArray count](v2->_items, "count"), 0x10uLL, 0x1000040451B5BE8uLL);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = objc_claimAutoreleasedReturnValue();
    defaultTextColor = v2->_defaultTextColor;
    v2->_defaultTextColor = (UIColor *)v12;

    v14 = objc_alloc_init(_PXPhotosLensSegmentedControl);
    segmentedControl = v2->_segmentedControl;
    v2->_segmentedControl = v14;

    -[_PXPhotosLensSegmentedControl addTarget:action:forControlEvents:](v2->_segmentedControl, "addTarget:action:forControlEvents:", v2, sel__handleSegmentedControlAction_, 0x2000);
    -[PXPhotosLensControl _updateSegments](v2, "_updateSegments");
    -[PXPhotosLensControl addSubview:](v2, "addSubview:", v2->_segmentedControl);
    v16 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v2, sel_setNeedsLayout);
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v16;

    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateSegments, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateSegmentedControl, 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__handleContentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    -[PXPhotosLensControl layer](v2, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupOpacity:", 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_textSizes);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLensControl;
  -[PXPhotosLensControl dealloc](&v3, sel_dealloc);
}

- (void)setBackdropGroupName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UIVisualEffectView _setGroupName:](self->_backgroundEffectView, "_setGroupName:", v4);

}

- (NSString)backdropGroupName
{
  return (NSString *)-[UIVisualEffectView _groupName](self->_backgroundEffectView, "_groupName");
}

- (void)setContentBackgroundColor:(id)a3
{
  UIVisualEffectView *backgroundEffectView;
  id v4;
  id v5;

  backgroundEffectView = self->_backgroundEffectView;
  v4 = a3;
  -[UIVisualEffectView contentView](backgroundEffectView, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (UIColor)contentBackgroundColor
{
  void *v2;
  void *v3;

  -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  CGFloat height;
  double v6;
  void *v7;
  unint64_t v8;
  double minimumInterTextSpacing;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded", a3.width, a3.height);
  v6 = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  -[PXPhotosLensControl items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (width > self->_intrinsicSize.width && v8 >= 2)
  {
    minimumInterTextSpacing = self->_minimumInterTextSpacing;
    if (width >= v6 + (double)(v8 - 1) * minimumInterTextSpacing)
      v6 = v6 + (double)(v8 - 1) * minimumInterTextSpacing;
    else
      v6 = width;
  }
  v11 = v6;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
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
  uint64_t v11;
  double v12;
  void *v14;
  void *v15;
  uint64_t v16;
  double minimumInterTextSpacing;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v26.receiver = self;
  v26.super_class = (Class)PXPhotosLensControl;
  -[PXPhotosLensControl layoutSubviews](&v26, sel_layoutSubviews);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXPhotosLensControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = 0;
  do
  {
    -[PXPhotosLensControl setShrinkLevel:](self, "setShrinkLevel:", v11);
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    v12 = CGRectGetWidth(v27) - self->_intrinsicSize.width;
  }
  while (v12 < 0.0 && v11++ != 14);
  -[UIVisualEffectView setBounds:](self->_backgroundEffectView, "setBounds:", v4, v6, v8, v10);
  PXRectGetCenter();
  -[UIVisualEffectView setCenter:](self->_backgroundEffectView, "setCenter:");
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_backgroundEffectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, CGRectGetHeight(v28) * 0.5);
  -[_PXPhotosLensSegmentedControl setBounds:](self->_segmentedControl, "setBounds:", v4, v6, v8, v10);
  PXRectGetCenter();
  -[_PXPhotosLensSegmentedControl setCenter:](self->_segmentedControl, "setCenter:");
  -[PXPhotosLensControl items](self, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLensControl enabledItems](self, "enabledItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "count");
  minimumInterTextSpacing = self->_minimumInterTextSpacing;
  v25 = v16;
  v18 = (double)(v16 - 1);
  v19 = round(minimumInterTextSpacing + v12 * 0.5 / v18);
  if (v16 >= 1)
  {
    v20 = 0;
    v21 = 0;
    v22 = (v12 - v18 * (v19 - minimumInterTextSpacing)) / (double)v16;
    do
    {
      -[_PXPhotosLensSegmentedControl setWidth:forSegmentAtIndex:](self->_segmentedControl, "setWidth:forSegmentAtIndex:", v21, self->_padding.right+ round(v22 * (double)(v21 + 1))- round(v22 * (double)v21)+ self->_padding.left+ self->_textSizes[v20].width);
      objc_msgSend(v14, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v15, "containsObject:", v23);

      -[_PXPhotosLensSegmentedControl setEnabled:forSegmentAtIndex:](self->_segmentedControl, "setEnabled:forSegmentAtIndex:", v24, v21);
      ++v20;
      ++v21;
    }
    while (v25 != v21);
  }
  -[_PXPhotosLensSegmentedControl _setInterSegmentSpacing:](self->_segmentedControl, "_setInterSegmentSpacing:", v19 - self->_padding.left - self->_padding.right);

}

- (void)setShrinkLevel:(int64_t)a3
{
  if (self->_shrinkLevel != a3)
  {
    self->_shrinkLevel = a3;
    -[PXPhotosLensControl _updateSegmentedControl](self, "_updateSegmentedControl");
  }
}

- (void)setItems:(id)a3
{
  NSArray *v4;
  char v5;
  unint64_t v6;
  NSArray *v7;
  NSArray *items;
  NSArray *v9;

  v9 = (NSArray *)a3;
  v4 = self->_items;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v9);

    if ((v5 & 1) == 0)
    {
      v6 = -[NSArray count](v9, "count");
      if (v6 > -[NSArray count](self->_items, "count"))
        self->_textSizes = (CGSize *)malloc_type_realloc(self->_textSizes, 16 * -[NSArray count](v9, "count"), 0x1000040451B5BE8uLL);
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      items = self->_items;
      self->_items = v7;

      -[PXPhotosLensControl _invalidateSegments](self, "_invalidateSegments");
      -[PXPhotosLensControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
    }
  }

}

- (void)setEnabledItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *enabledItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_enabledItems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      enabledItems = self->_enabledItems;
      self->_enabledItems = v6;

      -[PXPhotosLensControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
    }
  }

}

- (void)setSelectedItem:(id)a3
{
  PXPhotosLensControlItem *v6;
  PXPhotosLensControlItem *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  PXPhotosLensControlItem *v13;

  v13 = (PXPhotosLensControlItem *)a3;
  v6 = self->_selectedItem;
  if (v6 == v13)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXPhotosLensControlItem isEqual:](v6, "isEqual:", v13);

    if ((v8 & 1) == 0)
    {
      -[PXPhotosLensControl items](self, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v13);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLensControl.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.items containsObject:selectedItem]"));

      }
      objc_storeStrong((id *)&self->_selectedItem, a3);
      -[PXPhotosLensControl delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photosLensControl:didSelectItem:", self, v13);

      -[PXPhotosLensControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
    }
  }

}

- (void)setHideSymbols:(BOOL)a3
{
  if (self->_hideSymbols != a3)
  {
    self->_hideSymbols = a3;
    -[PXPhotosLensControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
  }
}

- (void)setDefaultTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v5 = self->_defaultTextColor;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_defaultTextColor, a3);
      -[PXPhotosLensControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
    }
  }

}

- (void)_invalidateSegments
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateSegments);
}

- (void)_updateSegments
{
  unint64_t v3;

  -[_PXPhotosLensSegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
  if (-[NSArray count](self->_items, "count"))
  {
    v3 = 0;
    do
      -[_PXPhotosLensSegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", &stru_1E5149688, v3++, 0);
    while (v3 < -[NSArray count](self->_items, "count"));
  }
  -[PXPhotosLensControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
}

- (void)_invalidateSegmentedControl
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateSegmentedControl);
}

- (void)_updateSegmentedControl
{
  uint64_t v2;
  id *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _PXPhotosLensSegmentedControl *segmentedControl;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _PXPhotosLensSegmentedControl *v17;
  void *v18;
  _PXPhotosLensSegmentedControl *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  double height;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  PXPhotosLensControl *v37;
  id v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  switch(-[PXPhotosLensControl shrinkLevel](self, "shrinkLevel"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v4 = (id *)MEMORY[0x1E0DC4B08];
      goto LABEL_3;
    case 4:
      v4 = (id *)MEMORY[0x1E0DC4AB8];
LABEL_3:
      v5 = *v4;
      v6 = -1.0;
      break;
    default:
      v5 = (id)*MEMORY[0x1E0DC4AB8];
      v6 = 13.0 - (double)v2;
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v5, *MEMORY[0x1E0DC48F8], 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 > 0.0)
  {
    objc_msgSend(v7, "fontWithSize:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[PXPhotosLensControl defaultTextColor](self, "defaultTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  segmentedControl = self->_segmentedControl;
  v15 = *MEMORY[0x1E0DC1140];
  v48[0] = *MEMORY[0x1E0DC1138];
  v14 = v48[0];
  v48[1] = v15;
  v49[0] = v8;
  v49[1] = v10;
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosLensSegmentedControl setTitleTextAttributes:forState:](segmentedControl, "setTitleTextAttributes:forState:", v16, 0);

  v17 = self->_segmentedControl;
  v46[0] = v14;
  v46[1] = v15;
  v47[0] = v8;
  v47[1] = v11;
  v34 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosLensSegmentedControl setTitleTextAttributes:forState:](v17, "setTitleTextAttributes:forState:", v18, 4);

  v19 = self->_segmentedControl;
  v44[0] = v14;
  v44[1] = v15;
  v45[0] = v8;
  v45[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosLensSegmentedControl setTitleTextAttributes:forState:](v19, "setTitleTextAttributes:forState:", v20, 2);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1202);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_backgroundEffectView, "setEffect:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v22);

  *(_OWORD *)&self->_padding.top = xmmword_1A7C0C820;
  *(_OWORD *)&self->_padding.bottom = xmmword_1A7C0C820;
  self->_minimumInterTextSpacing = 16.0;
  self->_intrinsicSize = (CGSize)*MEMORY[0x1E0C9D820];
  LOBYTE(v23) = -[PXPhotosLensControl hideSymbols](self, "hideSymbols");
  -[PXPhotosLensControl items](self, "items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __46__PXPhotosLensControl__updateSegmentedControl__block_invoke;
  v35[3] = &unk_1E513AFF8;
  v39 = (char)v23;
  v25 = v32;
  v36 = v25;
  v37 = self;
  v26 = v8;
  v38 = v26;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v35);
  height = self->_intrinsicSize.height;
  self->_intrinsicSize.width = self->_intrinsicSize.width
                             + self->_padding.left
                             + self->_padding.right
                             - self->_minimumInterTextSpacing;
  self->_intrinsicSize.height = fmax(height + self->_padding.top + self->_padding.bottom, 44.0);
  -[PXPhotosLensControl selectedItem](self, "selectedItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v24, "indexOfObject:", v28);

  if ((v29 & 0x8000000000000000) != 0
    || v29 >= -[_PXPhotosLensSegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments"))
  {
    PXAssertGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      -[PXPhotosLensControl selectedItem](self, "selectedItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v31;
      v42 = 2112;
      v43 = v24;
      _os_log_error_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "item %@ not found in %@", buf, 0x16u);

    }
  }
  else
  {
    -[_PXPhotosLensSegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", v29);
  }

}

- (void)_handleSegmentedControlAction:(id)a3
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  -[PXPhotosLensControl items](self, "items", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[_PXPhotosLensSegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosLensControl selectedItem](self, "selectedItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v5)
  {

  }
  else
  {
    v6 = objc_msgSend(v10, "isEqual:", v5);

    if (!v6)
    {
      -[PXPhotosLensControl setSelectedItem:](self, "setSelectedItem:", v10);
      goto LABEL_8;
    }
  }
  if (-[_PXPhotosLensSegmentedControl lastTouchRemainedOnSelectedSegment](self->_segmentedControl, "lastTouchRemainedOnSelectedSegment"))
  {
    -[PXPhotosLensControl delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PXPhotosLensControl delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "photosLensControl:didTapOnAlreadySelectedItem:", self, v10);

    }
  }
LABEL_8:

}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)enabledItems
{
  return self->_enabledItems;
}

- (PXPhotosLensControlItem)selectedItem
{
  return self->_selectedItem;
}

- (PXPhotosLensControlDelegate)delegate
{
  return (PXPhotosLensControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hideSymbols
{
  return self->_hideSymbols;
}

- (UIColor)defaultTextColor
{
  return self->_defaultTextColor;
}

- (int64_t)shrinkLevel
{
  return self->_shrinkLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_enabledItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

void __46__PXPhotosLensControl__updateSegmentedControl__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 56)
    || (objc_msgSend(v5, "symbolName"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "setTitle:forSegmentAtIndex:", v7, a3);
    v8 = *(_QWORD *)(a1 + 48);
    v25 = *MEMORY[0x1E0DC1138];
    v26[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeWithAttributes:", v9);
    v11 = v10;
    v13 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *(_QWORD *)(a1 + 32), 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v6, "symbolName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemImageNamed:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithSymbolConfiguration:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "setImage:forSegmentAtIndex:", v18, a3);
    objc_msgSend(v18, "size");
    v11 = v19;
    v13 = v20;

  }
  v21 = ceil(v11);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 456) + 16 * a3;
  *(double *)v22 = v21;
  *(double *)(v22 + 8) = v13;
  *(double *)(*(_QWORD *)(a1 + 40) + 472) = v21
                                            + *(double *)(*(_QWORD *)(a1 + 40) + 464)
                                            + *(double *)(*(_QWORD *)(a1 + 40) + 472);
  v23 = *(double *)(*(_QWORD *)(a1 + 40) + 480);
  v24 = ceil(v13);
  if (v23 < v24)
    v23 = v24;
  *(double *)(*(_QWORD *)(a1 + 40) + 480) = v23;

}

@end
