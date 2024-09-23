@implementation UICalendarView

- (UICalendarView)initWithFrame:(CGRect)a3
{
  UICalendarView *v3;
  UICalendarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICalendarView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UICalendarView _setupInitialValues](v3, "_setupInitialValues");
    -[UICalendarView _setupViewHierarchy](v4, "_setupViewHierarchy");
    -[UICalendarView _reloadEverythingIncludingLayout:](v4, "_reloadEverythingIncludingLayout:", 1);
  }
  return v4;
}

- (UICalendarView)initWithCoder:(id)a3
{
  UICalendarView *v3;
  UICalendarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICalendarView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[UICalendarView _setupInitialValues](v3, "_setupInitialValues");
    -[UICalendarView _setupViewHierarchy](v4, "_setupViewHierarchy");
  }
  return v4;
}

- (void)_setupInitialValues
{
  NSDateFormatter *v3;
  NSDateFormatter *cellFormatter;
  NSDateFormatter *v5;
  _UICalendarDataModel *v6;
  _UICalendarDataModel *dataModel;

  v3 = (NSDateFormatter *)objc_opt_new();
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", CFSTR("d"));
  -[NSDateFormatter setFormattingContext:](v3, "setFormattingContext:", 2);
  cellFormatter = self->_cellFormatter;
  self->_cellFormatter = v3;
  v5 = v3;

  self->_frozenContentOffset = (CGPoint)InvalidFrozenContentOffset;
  v6 = (_UICalendarDataModel *)objc_opt_new();
  dataModel = self->_dataModel;
  self->_dataModel = v6;

  self->_viewState = 0;
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_reloadDateFormatters
{
  void *v3;
  void *v4;
  id v5;

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setCalendar:](self->_cellFormatter, "setCalendar:", v3);

  -[_UICalendarDataModel effectiveLocale](self->_dataModel, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](self->_cellFormatter, "setLocale:", v4);

  -[_UICalendarDataModel effectiveTimeZone](self->_dataModel, "effectiveTimeZone");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](self->_cellFormatter, "setTimeZone:", v5);

}

- (void)_setupViewHierarchy
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD);
  _UICalendarHeaderView *v6;
  _UICalendarHeaderView *headerView;
  _UICalendarWeekdayView *v8;
  _UICalendarWeekdayView *weekdayView;
  _UIDatePickerLinkedLabel *v10;
  _UIDatePickerLinkedLabel *daySizingLabel;
  UICollectionView *v12;
  void *v13;
  UICollectionView *v14;
  uint64_t v15;
  void *v16;
  UICollectionViewDiffableDataSource *v17;
  UICollectionViewDiffableDataSource *v18;
  UICollectionViewDiffableDataSource *dataSource;
  UIView *v20;
  UIView *contentView;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[UIView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "headerViewLayoutMarginsForProposedLayoutMargins");
  v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView layoutMargins](self, "layoutMargins");
  v5[2](v5);
  -[UIView setLayoutMargins:](self, "setLayoutMargins:");

  v6 = -[_UICalendarHeaderView initWithDataModel:delegate:]([_UICalendarHeaderView alloc], "initWithDataModel:delegate:", self->_dataModel, self);
  headerView = self->_headerView;
  self->_headerView = v6;

  v8 = -[_UICalendarWeekdayView initWithDataModel:]([_UICalendarWeekdayView alloc], "initWithDataModel:", self->_dataModel);
  weekdayView = self->_weekdayView;
  self->_weekdayView = v8;

  v10 = (_UIDatePickerLinkedLabel *)objc_opt_new();
  daySizingLabel = self->_daySizingLabel;
  self->_daySizingLabel = v10;

  v12 = [UICollectionView alloc];
  v13 = (void *)objc_opt_new();
  v14 = -[UICollectionView initWithFrame:collectionViewLayout:](v12, "initWithFrame:collectionViewLayout:", v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[UICollectionView setLayoutMargins:](v14, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  -[UIView setClipsToBounds:](v14, "setClipsToBounds:", 0);
  -[UIView setPreservesSuperviewLayoutMargins:](v14, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIScrollView setPagingEnabled:](v14, "setPagingEnabled:", 1);
  -[UIScrollView setShowsVerticalScrollIndicator:](v14, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v14, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setAllowsFocus:](v14, "setAllowsFocus:", 0);
  -[UICollectionView setBackgroundColor:](v14, "setBackgroundColor:", 0);
  -[UICollectionView setDelegate:](v14, "setDelegate:", self);
  v15 = objc_opt_class();
  +[_UICalendarDateViewCell reuseIdentifier](_UICalendarDateViewCell, "reuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v14, "registerClass:forCellWithReuseIdentifier:", v15, v16);

  -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](v14, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  objc_initWeak(&location, self);
  v17 = [UICollectionViewDiffableDataSource alloc];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __37__UICalendarView__setupViewHierarchy__block_invoke;
  v25[3] = &unk_1E16C7360;
  objc_copyWeak(&v26, &location);
  v18 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v17, "initWithCollectionView:cellProvider:", v14, v25);
  dataSource = self->_dataSource;
  self->_dataSource = v18;

  objc_storeStrong((id *)&self->_collectionView, v14);
  v20 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v20;

  -[UIView setPreservesSuperviewLayoutMargins:](self->_contentView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
  -[UIView addSubview:](self, "addSubview:", self->_contentView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_headerView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_weekdayView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_collectionView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__shouldDifferentiateWithoutColorUpdated_, CFSTR("UIAccessibilityShouldDifferentiateWithoutColorDidChangeNotification"), 0);

  -[UICalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[UIView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v23, &__block_literal_global_225);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

id __37__UICalendarView__setupViewHierarchy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_configuedCellForCollectionView:indexPath:day:", v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __37__UICalendarView__setupViewHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setNeedsLayout");
  objc_msgSend(v2, "invalidateIntrinsicContentSize");

}

- (id)_dataModel
{
  return self->_dataModel;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)UICalendarView;
  -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (width != self->_lastKnownSize.width || height != self->_lastKnownSize.height)
  {
    self->_lastKnownSize.width = width;
    self->_lastKnownSize.height = height;
    -[UICalendarView _setNeedsCollectionViewScrollPositionUpdate](self, "_setNeedsCollectionViewScrollPositionUpdate");
    -[UICalendarView _setNeedsUpdateSizing](self, "_setNeedsUpdateSizing");
    -[UICalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)UICalendarView;
  -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (width != self->_lastKnownSize.width || height != self->_lastKnownSize.height)
  {
    self->_lastKnownSize.width = width;
    self->_lastKnownSize.height = height;
    -[UICalendarView _setNeedsCollectionViewScrollPositionUpdate](self, "_setNeedsCollectionViewScrollPositionUpdate");
    -[UICalendarView _setNeedsUpdateSizing](self, "_setNeedsUpdateSizing");
    -[UICalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  }
}

- (void)_setNeedsUpdateSizing
{
  *(_BYTE *)&self->_flags |= 4u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSizing
{
  double v3;
  double v4;
  _UICalendarWeekdayView *weekdayView;

  *(_BYTE *)&self->_flags &= ~4u;
  -[UICalendarView __dayAndWeekdayLabelWidth](self, "__dayAndWeekdayLabelWidth");
  v4 = v3;
  weekdayView = self->_weekdayView;
  if (v3 == self->_lastWeekdayLabelWidth)
  {
    -[UIView invalidateIntrinsicContentSize](weekdayView, "invalidateIntrinsicContentSize");
    -[UIView invalidateIntrinsicContentSize](self->_collectionView, "invalidateIntrinsicContentSize");
  }
  else
  {
    -[_UICalendarWeekdayView setPreferredLabelWidth:](weekdayView, "setPreferredLabelWidth:", v3);
    self->_lastWeekdayLabelWidth = v4;
    -[UICalendarView _reloadCollectionViewLayout](self, "_reloadCollectionViewLayout");
  }
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double (**v17)(_QWORD);
  CGFloat v18;
  double x;
  CGFloat y;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void (**v30)(_QWORD);
  CGSize v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  char flags;
  unint64_t v40;
  NSObject *v41;
  const char *v42;
  unint64_t v43;
  unint64_t v44;
  uint8_t v45[8];
  _QWORD v46[5];
  CGRect v47;
  CGRect slice;
  CGRect remainder;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v50.receiver = self;
  v50.super_class = (Class)UICalendarView;
  -[UIView layoutSubviews](&v50, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  if (CGRectGetWidth(v51) != 0.0)
  {
    v52.origin.x = v4;
    v52.origin.y = v6;
    v52.size.width = v8;
    v52.size.height = v10;
    if (CGRectGetHeight(v52) != 0.0)
    {
      -[UIView traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UICalendarViewGetPlatformMetrics(objc_msgSend(v11, "userInterfaceIdiom"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView layoutMargins](self, "layoutMargins");
      v14 = v13;
      -[UIView layoutMargins](self, "layoutMargins");
      v16 = v10 - (v14 + v15);
      objc_msgSend(v12, "maximumContentWidthForLayoutMargins");
      v17 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[UIView layoutMargins](self, "layoutMargins");
      v18 = fmax((v8 - v17[2](v17)) * 0.5, 0.0);
      v53.origin.x = v4 + 0.0;
      v53.origin.y = v6 + v14;
      v53.size.width = v8;
      v53.size.height = v16;
      v54 = CGRectInset(v53, v18, 0.0);
      x = v54.origin.x;
      y = v54.origin.y;
      width = v54.size.width;
      height = v54.size.height;
      remainder = v54;

      objc_msgSend(v12, "minimumLayoutWidth");
      v24 = v23;
      if (width < v23)
      {
        x = (width - v23) * 0.5;
        remainder.origin.x = x;
        remainder.size.width = v23;
        v25 = v23;
      }
      else
      {
        v25 = width;
      }
      -[_UICalendarWeekdayView sizeThatFits:](self->_weekdayView, "sizeThatFits:", v25, height);
      v27 = v26;
      -[_UICalendarHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v25, height);
      v29 = v28;
      objc_msgSend(v12, "minimumContentWidth");
      objc_msgSend(v12, "maximumContentWidthForLayoutMargins");
      v30 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[UIView layoutMargins](self, "layoutMargins");
      v30[2](v30);

      v31 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      slice.size = v31;
      v32 = x;
      v31.width = y;
      v33 = v25;
      v34 = height;
      CGRectDivide(*(CGRect *)((char *)&v31 - 8), &slice, &remainder, v29, CGRectMinYEdge);
      -[UIView setFrame:](self->_headerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      remainder.origin.y = remainder.origin.y + 16.0;
      remainder.size.height = remainder.size.height + -16.0;
      -[UIView setFrame:](self->_monthYearSelector, "setFrame:", remainder.origin.x);
      CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
      -[UIView setFrame:](self->_weekdayView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      objc_msgSend(v12, "weekdayViewVerticalSpacing");
      remainder.origin.y = v35 + remainder.origin.y;
      remainder.size.height = remainder.size.height - v35;
      -[UICalendarView _preferredCollectionViewHeightForWidth:](self, "_preferredCollectionViewHeightForWidth:", CGRectGetWidth(remainder));
      v37 = v36 + -32.0;
      v38 = CGRectGetHeight(remainder);
      if (v38 < v37)
        remainder.size.height = fmax(v37, 0.0);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __32__UICalendarView_layoutSubviews__block_invoke;
      v46[3] = &unk_1E16B20D8;
      v46[4] = self;
      v47 = remainder;
      -[UICalendarView _performIgnoringScrollCallbacks:](self, "_performIgnoringScrollCallbacks:", v46);
      flags = (char)self->_flags;
      if ((flags & 4) != 0)
      {
        -[UICalendarView _updateSizing](self, "_updateSizing");
        flags = (char)self->_flags;
        if ((flags & 1) == 0)
        {
LABEL_10:
          if ((flags & 2) == 0)
          {
LABEL_12:
            if (width >= v24 || v38 >= v37)
            {
              if (width < v24)
              {
                v44 = qword_1ECD7B198;
                if (!qword_1ECD7B198)
                {
                  v44 = __UILogCategoryGetNode("UICalendarView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v44, (unint64_t *)&qword_1ECD7B198);
                }
                v41 = *(NSObject **)(v44 + 8);
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  goto LABEL_32;
                *(_WORD *)v45 = 0;
                v42 = "UICalendarView's width is smaller than it can render its content in; defaulting to the minimum width.";
              }
              else
              {
                if (v38 >= v37)
                  goto LABEL_32;
                v43 = qword_1ECD7B1A0;
                if (!qword_1ECD7B1A0)
                {
                  v43 = __UILogCategoryGetNode("UICalendarView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v43, (unint64_t *)&qword_1ECD7B1A0);
                }
                v41 = *(NSObject **)(v43 + 8);
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  goto LABEL_32;
                *(_WORD *)v45 = 0;
                v42 = "UICalendarView's height is smaller than it can render its content in; defaulting to the minimum height.";
              }
            }
            else
            {
              v40 = _MergedGlobals_7_5;
              if (!_MergedGlobals_7_5)
              {
                v40 = __UILogCategoryGetNode("UICalendarView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v40, (unint64_t *)&_MergedGlobals_7_5);
              }
              v41 = *(NSObject **)(v40 + 8);
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                goto LABEL_32;
              *(_WORD *)v45 = 0;
              v42 = "UICalendarView's size is smaller than it can render its content in; defaulting to the minimum size.";
            }
            _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, v42, v45, 2u);
LABEL_32:

            return;
          }
LABEL_11:
          -[UICalendarView _updateCollectionViewScrollPosition:](self, "_updateCollectionViewScrollPosition:", 0);
          goto LABEL_12;
        }
      }
      else if ((*(_BYTE *)&self->_flags & 1) == 0)
      {
        goto LABEL_10;
      }
      -[UICalendarView _updateCollectionViewSelection:](self, "_updateCollectionViewSelection:", 0);
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
}

uint64_t __32__UICalendarView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)_contentSizeCategoryForContentWidth:(double)a3
{
  id *v3;

  v3 = (id *)&UIContentSizeCategoryExtraExtraLarge;
  if (a3 >= 280.0)
    v3 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
  if (a3 >= 330.0)
    v3 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  return *v3;
}

- (void)_updateContentSizeLimitations
{
  double v3;
  id v4;

  -[UIView bounds](self, "bounds");
  -[UICalendarView _contentSizeCategoryForContentWidth:](self, "_contentSizeCategoryForContentWidth:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setMaximumContentSizeCategory:](self->_contentView, "setMaximumContentSizeCategory:", v4);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double (**v11)(_QWORD);
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double (**v25)(_QWORD);
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumRangeOfUnit:", 4096);

  objc_msgSend(v7, "minimumContentWidth");
  v10 = v9;
  objc_msgSend(v7, "maximumContentWidthForLayoutMargins");
  v11 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView layoutMargins](self, "layoutMargins");
  v12 = fmax(v10, fmin(width, v11[2](v11)));

  -[UIView maximumContentSizeCategory](self->_contentView, "maximumContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarView _contentSizeCategoryForContentWidth:](self, "_contentSizeCategoryForContentWidth:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setMaximumContentSizeCategory:](self->_contentView, "setMaximumContentSizeCategory:", v14);
  -[_UICalendarWeekdayView sizeThatFits:](self->_weekdayView, "sizeThatFits:", width, height);
  v16 = v15;
  v18 = v17;
  -[_UICalendarHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v7, "minimumContentWidth");
  v24 = v23;
  objc_msgSend(v7, "maximumContentWidthForLayoutMargins");
  v25 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView layoutMargins](self, "layoutMargins");
  v26 = fmax(v24, fmin(fmax(v16, v20), v25[2](v25)));

  -[UIView setMaximumContentSizeCategory:](self->_contentView, "setMaximumContentSizeCategory:", v13);
  -[UICalendarView _preferredCollectionViewHeightForWidth:](self, "_preferredCollectionViewHeightForWidth:", v26);
  v28 = v18 + 16.0 + v22 + v27;
  -[UIView layoutMargins](self, "layoutMargins");
  v30 = v28 + v29;
  -[UIView layoutMargins](self, "layoutMargins");
  v32 = v30 + v31 + 2.0;

  v33 = v26;
  v34 = v32;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)layoutMarginsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICalendarView;
  -[UIView layoutMarginsDidChange](&v5, sel_layoutMarginsDidChange);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UICalendarView _setNeedsUpdateSizing](self, "_setNeedsUpdateSizing");
  -[UICalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  -[UICalendarView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (double)_preferredCollectionViewHeightForWidth:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  if (-[UICalendarView _hasCellDecorations](self, "_hasCellDecorations"))
  {
    -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumRangeOfUnit:", 4096);

    -[UIView traitCollection](self->_contentView, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICalendarViewDecoration _referenceHeightForTraitCollection:](UICalendarViewDecoration, "_referenceHeightForTraitCollection:", v5);

  }
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateViewCellSpacing");
  if (v8 > 0.0)
  {
    -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maximumRangeOfUnit:", 4096);

    objc_msgSend(v7, "dateViewCellBackgroundSize");
    objc_msgSend(v7, "dateViewCellSpacing");
  }
  UIRoundToViewScale(self);
  v11 = v10;

  return v11;
}

- (double)__dayAndWeekdayLabelWidth
{
  void *v3;
  void *v4;
  _UICalendarDateViewCellState *v5;
  void *v6;
  _UICalendarDateViewCellState *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _UIDatePickerLinkedLabel *daySizingLabel;
  double v21;
  double v22;
  double v23;
  double v24;
  double Width;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v31;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [_UICalendarDateViewCellState alloc];
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UICalendarDateViewCellState initWithTraits:](v5, "initWithTraits:", v6);

  -[_UICalendarDateViewCellState setForceEmphasizedFont:](v7, "setForceEmphasizedFont:", 1);
  objc_msgSend(v4, "dateCellFontProvider");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel fontDesign](self->_dataModel, "fontDesign");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self->_contentView, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _UICalendarDateViewCellState *, void *, void *))v8)[2](v8, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerLinkedLabel setFont:](self->_daySizingLabel, "setFont:", v11);

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "weekdaySymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  -[_UICalendarWeekdayView sizingLabel](self->_weekdayView, "sizingLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v15, "sizeThatFits:", v16, v17);
  v19 = v18;

  daySizingLabel = self->_daySizingLabel;
  -[UIView bounds](self, "bounds");
  -[_UIDatePickerLinkedLabel sizeThatFits:](daySizingLabel, "sizeThatFits:", v21, v22);
  v24 = v23;
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v31);
  -[UIView layoutMargins](self, "layoutMargins");
  v27 = Width - v26;
  -[UIView layoutMargins](self, "layoutMargins");
  v29 = fmax(v24, fmin(v19, (v27 - v28) / (double)v14));

  return v29;
}

- (BOOL)_shouldUpdateDateViewForVisibleMonth:(id)a3
{
  _UICalendarDataModel *dataModel;
  id v4;
  void *v5;
  char v6;

  dataModel = self->_dataModel;
  v4 = a3;
  -[_UICalendarDataModel visibleMonth](dataModel, "visibleMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6 ^ 1;
}

- (void)_updateDateViewForVisibleMonth:(id)a3 animated:(BOOL)a4
{
  -[UICalendarView _setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:](self, "_setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:", a3, a4, 1, 1, 1);
}

- (void)_updateVisibleMonth:(id)a3 animated:(BOOL)a4
{
  -[UICalendarView _updateDateViewForVisibleMonth:animated:](self, "_updateDateViewForVisibleMonth:animated:", a3, a4);
  -[_UICalendarHeaderView didUpdateVisibleMonth](self->_headerView, "didUpdateVisibleMonth");
}

- (void)headerViewDidStepForward:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "dataModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextMonth");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UICalendarView _updateVisibleMonth:animated:](self, "_updateVisibleMonth:animated:", v6, 1);
}

- (void)headerViewDidStepBackward:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "dataModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousMonth");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UICalendarView _updateVisibleMonth:animated:](self, "_updateVisibleMonth:animated:", v6, 1);
}

- (void)headerViewDidSelect:(id)a3
{
  -[UICalendarView _updateViewState:animated:](self, "_updateViewState:animated:", self->_viewState == 0, 1);
}

- (void)_updateViewState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _UICalendarMonthYearSelector *monthYearSelector;
  BOOL v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void (**v12)(void *, uint64_t);
  _QWORD v13[4];
  id v14[2];
  id location;
  _QWORD aBlock[5];
  BOOL v17;

  if (self->_viewState != a3)
  {
    v4 = a4;
    monthYearSelector = self->_monthYearSelector;
    v9 = a3 == 1;
    if (a3 == 1 && !monthYearSelector)
    {
      -[UICalendarView _configureMonthYearSelector](self, "_configureMonthYearSelector");
      monthYearSelector = self->_monthYearSelector;
    }
    -[UIView setNeedsLayout](monthYearSelector, "setNeedsLayout");
    self->_viewState = a3;
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UICalendarView__updateViewState_animated___block_invoke;
    aBlock[3] = &unk_1E16B1B78;
    v17 = v9;
    aBlock[4] = self;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_initWeak(&location, self);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __44__UICalendarView__updateViewState_animated___block_invoke_2;
    v13[3] = &unk_1E16C73A8;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    v12 = (void (**)(void *, uint64_t))_Block_copy(v13);
    ++self->_stateUpdatesInFlight;
    if (v4)
    {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v11, v12, 0.25, 0.0);
    }
    else
    {
      v11[2](v11);
      v12[2](v12, 1);
    }
    -[_UICalendarHeaderView setExpanded:animated:](self->_headerView, "setExpanded:animated:", a3 == 1, v4);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);

  }
}

uint64_t __44__UICalendarView__updateViewState_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "setAlpha:", v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setAlpha:", v4);
}

void __44__UICalendarView__updateViewState_animated___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained[56];
  if (v3 <= 0)
  {
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), v7, CFSTR("UICalendarView.m"), 497, CFSTR("Internal inconsistency: finishing a state update with 0 state updates being tracked right now."));

    WeakRetained = v7;
    v3 = v7[56];
  }
  v4 = v3 - 1;
  WeakRetained[56] = v4;
  if (!v4 && WeakRetained[67] != 1)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_destroyMonthYearSelector");
    WeakRetained = v6;
  }

}

- (void)_destroyMonthYearSelector
{
  _UICalendarMonthYearSelector *monthYearSelector;

  -[UIView removeFromSuperview](self->_monthYearSelector, "removeFromSuperview");
  monthYearSelector = self->_monthYearSelector;
  self->_monthYearSelector = 0;

}

- (void)_configureMonthYearSelector
{
  _UICalendarMonthYearSelector *v3;
  double v4;
  _UICalendarMonthYearSelector *monthYearSelector;

  if (!self->_monthYearSelector)
  {
    v3 = -[_UICalendarMonthYearSelector initWithDataModel:]([_UICalendarMonthYearSelector alloc], "initWithDataModel:", self->_dataModel);
    -[_UICalendarMonthYearSelector setDelegate:](v3, "setDelegate:", self);
    v4 = 0.0;
    if (self->_viewState == 1)
      v4 = 1.0;
    -[UIView setAlpha:](v3, "setAlpha:", v4);
    -[UIView addSubview:](self, "addSubview:", v3);
    monthYearSelector = self->_monthYearSelector;
    self->_monthYearSelector = v3;

  }
}

- (void)monthYearSelector:(id)a3 didSelectMonth:(id)a4
{
  UICalendarSelection *selectionBehavior;
  void *v6;
  id v7;

  selectionBehavior = self->_selectionBehavior;
  v7 = a4;
  objc_msgSend(v7, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelection didChangeVisibleMonth:](selectionBehavior, "didChangeVisibleMonth:", v6);

  -[UICalendarView _updateVisibleMonth:animated:](self, "_updateVisibleMonth:animated:", v7, 0);
}

- (id)_configuedCellForCollectionView:(id)a3 indexPath:(id)a4 day:(id)a5
{
  id v7;
  id v8;
  UICollectionView *collectionView;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSDateFormatter *cellFormatter;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  collectionView = self->_collectionView;
  +[_UICalendarDateViewCell reuseIdentifier](_UICalendarDateViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setCalendarView:", self);
  if (-[UICalendarView _hasCellDecorations](self, "_hasCellDecorations"))
  {
    -[UICalendarView _delegateDecorationForDay:](self, "_delegateDecorationForDay:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v11, "setSelectionRoundedEdge:", -[UICalendarView _selectionRoundedEdgeForDay:](self, "_selectionRoundedEdgeForDay:", v8));
  cellFormatter = self->_cellFormatter;
  -[_UICalendarDataModel fontDesign](self->_dataModel, "fontDesign");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UICalendarView _canSelectItemAtIndexPath:forSelection:](self, "_canSelectItemAtIndexPath:forSelection:", v7, 0) ^ 1;
  v18 = -[UICalendarSelection renderOverhangDays](self->_selectionBehavior, "renderOverhangDays");
  LOBYTE(v20) = -[UICalendarSelection highlightsToday](self->_selectionBehavior, "highlightsToday");
  objc_msgSend(v11, "configureWithDay:formatter:fontDesign:decorations:outOfRange:renderOverhangDays:highlightsToday:", v8, cellFormatter, v16, v14, v17, v18, v20);

  return v11;
}

- (id)_delegateDecorationForDay:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v5 = a3;
    -[UICalendarView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "calendarView:decorationForDateComponents:", self, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)_selectionRoundedEdgeForDay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[UICalendarView selectionBehavior](self, "selectionBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UICalendarView selectionBehavior](self, "selectionBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "roundedEdgeForDate:", v7);

  }
  else
  {
    v8 = 3;
  }

  return v8;
}

- (void)_reloadCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UICollectionViewCompositionalLayout *v9;
  uint64_t v10;
  id v11;
  UICollectionViewCompositionalLayout *v12;
  _QWORD v13[5];
  UICollectionViewCompositionalLayout *v14;
  _QWORD v15[4];
  id v16;
  id v17[3];
  id location;

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumRangeOfUnit:", 512);
  v5 = v4;
  objc_msgSend(v3, "maximumRangeOfUnit:", 4096);
  v7 = (void *)(v6 - 1);
  self->_collectionViewAspectRatio = (double)(unint64_t)(v6 - 1) / (double)(unint64_t)v5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setScrollDirection:", 1);
  objc_initWeak(&location, self);
  v9 = [UICollectionViewCompositionalLayout alloc];
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__UICalendarView__reloadCollectionViewLayout__block_invoke;
  v15[3] = &unk_1E16C73D0;
  objc_copyWeak(v17, &location);
  v11 = v3;
  v16 = v11;
  v17[1] = v5;
  v17[2] = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __45__UICalendarView__reloadCollectionViewLayout__block_invoke_2;
  v13[3] = &unk_1E16B1B50;
  v13[4] = self;
  v12 = -[UICollectionViewCompositionalLayout initWithSectionProvider:configuration:](v9, "initWithSectionProvider:configuration:", v15, v8);
  v14 = v12;
  -[UICalendarView _performIgnoringScrollCallbacks:](self, "_performIgnoringScrollCallbacks:", v13);
  -[UICalendarView _setNeedsCollectionViewScrollPositionUpdate](self, "_setNeedsCollectionViewScrollPositionUpdate");

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

id __45__UICalendarView__reloadCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
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
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v60 = v5;
    objc_msgSend(WeakRetained, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UICalendarViewGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "directionalLayoutMargins");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7[54], "snapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(void **)(a1 + 32);
    v59 = v16;
    objc_msgSend(v16, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rangeOfUnit:inUnit:forDate:", 0x2000, 8, v18);
    v20 = v19;

    objc_msgSend(v9, "dateViewCellSpacing");
    v22 = v21;
    if (v21 <= 0.0)
    {
      objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0 / (double)*(unint64_t *)(a1 + 48));
    }
    else
    {
      objc_msgSend(v9, "dateViewCellBackgroundSize");
      objc_msgSend(off_1E1679980, "absoluteDimension:");
    }
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v26;
    objc_msgSend(off_1E1679998, "itemWithLayoutSize:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v24;
    if (v22 <= 0.0)
    {
      v29 = *(_QWORD *)(a1 + 56);
      if (v29 <= v20)
        v29 = v20;
      objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0 / (double)v29);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "dateViewCellBackgroundSize");
      objc_msgSend(off_1E1679980, "absoluteDimension:");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v28;
    objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v30;
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v31, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (void *)v27;
    v62[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679990, "horizontalGroupWithLayoutSize:subitems:", v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 > 0.0)
    {
      objc_msgSend(v9, "dateViewCellSpacing");
      objc_msgSend(off_1E16799B0, "flexibleSpacing:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setInterItemSpacing:", v35);

    }
    objc_msgSend(v7, "__dayAndWeekdayLabelWidth");
    v37 = v36;
    objc_msgSend(v60, "container");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "effectiveContentSize");
    v40 = v39;

    v41 = 0.0;
    if (v22 <= 0.0)
      v41 = (v40 - v11 - v13 - fmax(v37, 1.0) * (double)*(unint64_t *)(a1 + 48))
          / (double)(unint64_t)(*(_QWORD *)(a1 + 48) - 1)
          * 0.5;
    objc_msgSend(v32, "widthDimension");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:subitems:", v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 > 0.0)
    {
      objc_msgSend(v9, "dateViewCellSpacing");
      if (v20 > *(_QWORD *)(a1 + 56))
        v47 = 0.0;
      objc_msgSend(off_1E16799B0, "flexibleSpacing:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setInterItemSpacing:", v48);

    }
    v49 = v11 - v41;
    v50 = *(_QWORD *)(a1 + 56);
    v51 = 0.0;
    if (v20 > v50)
      v51 = (double)(v20 - v50) / ((double)v20 * (double)v50) * 0.5;
    if (v49 < 0.5)
      v49 = 0.0;
    if (v13 - v41 >= 0.5)
      v52 = v13 - v41;
    else
      v52 = 0.0;
    if (v51 >= 0.5)
      v53 = v51;
    else
      v53 = 0.0;
    objc_msgSend(v46, "setContentInsets:", v53, v49, v53, v52);
    objc_msgSend(off_1E16799A0, "sectionWithGroup:", v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentInsets:", 1.0, 0.0, 1.0, 0.0);

    v5 = v60;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __45__UICalendarView__reloadCollectionViewLayout__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "setCollectionViewLayout:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_reloadEverythingIncludingLayout:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[UICalendarView _reloadVisibleMonthIfNeeded](self, "_reloadVisibleMonthIfNeeded");
  -[UICalendarView _reloadDateFormatters](self, "_reloadDateFormatters");
  -[UICalendarView _reloadPossibleDayValues](self, "_reloadPossibleDayValues");
  -[UICalendarView _reloadDataSourceController](self, "_reloadDataSourceController");
  if (v3)
    -[UICalendarView _reloadCollectionViewLayout](self, "_reloadCollectionViewLayout");
}

- (void)_reloadVisibleMonthIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _UIDatePickerCalendarMonth *v9;
  void *v10;
  _UIDatePickerCalendarMonth *v11;
  id v12;

  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_ui_containsMonth:", v4);

  if ((v5 & 1) == 0)
  {
    -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_ui_dateInRangeForDate:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v9 = [_UIDatePickerCalendarMonth alloc];
    -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v9, "initWithDate:calendar:", v12, v10);

    -[UICalendarView _setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:](self, "_setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:", v11, 0, 1, 1, 0);
  }
}

- (void)_reloadDataSourceController
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  UICalendarView *v9;
  id v10;

  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __45__UICalendarView__reloadDataSourceController__block_invoke;
  v8 = &unk_1E16B1B50;
  v9 = self;
  v10 = v3;
  v4 = v3;
  -[UICalendarView _performIgnoringScrollCallbacks:](self, "_performIgnoringScrollCallbacks:", &v5);
  -[UICalendarView _setVisibleMonth:](self, "_setVisibleMonth:", v4, v5, v6, v7, v8, v9);

}

uint64_t __45__UICalendarView__reloadDataSourceController__block_invoke(uint64_t a1)
{
  _UICalendarViewDataSourceController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = [_UICalendarViewDataSourceController alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "effectiveCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UICalendarViewDataSourceController initWithCalendar:dataSource:](v2, "initWithCalendar:dataSource:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v4;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "reloadDataSourceAroundMonth:", *(_QWORD *)(a1 + 40));
}

- (void)_reloadPossibleDayValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[_UICalendarDataModel effectiveLocale](self->_dataModel, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  v5 = (void *)objc_opt_new();
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maximumRangeOfUnit:", 16);
  v9 = v8;

  if (v7 < v7 + v9)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringFromNumber:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v11);
      ++v7;
      --v9;
    }
    while (v9);
  }
  v12 = (void *)objc_msgSend(v5, "copy");
  v14[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerLinkedLabel setPossibleTitles:](self->_daySizingLabel, "setPossibleTitles:", v13);

}

- (void)setSelectionBehavior:(UICalendarSelection *)selectionBehavior
{
  UICalendarSelection **p_selectionBehavior;
  UICalendarSelection *v6;
  UICalendarSelection *v7;

  v7 = selectionBehavior;
  p_selectionBehavior = &self->_selectionBehavior;
  v6 = self->_selectionBehavior;
  if (v6)
    -[UICalendarSelection setView:](v6, "setView:", 0);
  objc_storeStrong((id *)&self->_selectionBehavior, selectionBehavior);
  if (*p_selectionBehavior)
    -[UICalendarSelection setView:](*p_selectionBehavior, "setView:", self);
  -[UICalendarView _reconfigureVisibleItems](self, "_reconfigureVisibleItems");

}

- (void)_selectDates:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v17 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  _asCalendarDay(v5, v6, -[UICalendarSelection renderOverhangDays](self->_selectionBehavior, "renderOverhangDays"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", v13, v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSelectionRoundedEdge:", -[UICalendarView _selectionRoundedEdgeForDay:](self, "_selectionRoundedEdgeForDay:", v13));
          -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v14, v17, 0);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)_deselectDates:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _asCalendarDay(v6, v7, -[UICalendarSelection renderOverhangDays](self->_selectionBehavior, "renderOverhangDays"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", v14, v4);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (BOOL)allowsMultipleSelection
{
  return -[UICollectionView allowsMultipleSelection](self->_collectionView, "allowsMultipleSelection");
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  -[UICollectionView setAllowsMultipleSelection:](self->_collectionView, "setAllowsMultipleSelection:", a3);
}

- (_UICalendarViewDecorationSystem)decorationSystem
{
  _UICalendarViewDecorationSystem *decorationSystem;
  _UICalendarViewDecorationSystem *v4;
  _UICalendarViewDecorationSystem *v5;

  decorationSystem = self->_decorationSystem;
  if (!decorationSystem)
  {
    v4 = (_UICalendarViewDecorationSystem *)objc_opt_new();
    v5 = self->_decorationSystem;
    self->_decorationSystem = v4;

    decorationSystem = self->_decorationSystem;
  }
  return decorationSystem;
}

- (BOOL)_hasCellDecorations
{
  return (~*(_BYTE *)&self->_flags & 0x50) == 0;
}

- (void)_reconfigureVisibleItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[UICalendarView _reloadCollectionViewLayout](self, "_reloadCollectionViewLayout");
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__UICalendarView__reconfigureVisibleItems__block_invoke;
  v6[3] = &unk_1E16C73F8;
  v6[4] = self;
  _UICalendarMap(v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v5);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v3, 0);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __42__UICalendarView__reconfigureVisibleItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "itemIdentifierForIndexPath:", a2);
}

- (void)setDelegate:(id)delegate
{
  id v4;
  _BOOL4 v5;
  char v6;
  char v7;
  char v8;

  v4 = delegate;
  v5 = -[UICalendarView _hasCellDecorations](self, "_hasCellDecorations");
  objc_storeWeak((id *)&self->_delegate, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 16;
  else
    v6 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 32;
  else
    v8 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v8;
  if (v5 != -[UICalendarView _hasCellDecorations](self, "_hasCellDecorations"))
    -[UICalendarView _reconfigureVisibleItems](self, "_reconfigureVisibleItems");
}

- (BOOL)wantsDateDecorations
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (void)setWantsDateDecorations:(BOOL)wantsDateDecorations
{
  _BOOL4 v3;
  _BOOL4 v5;
  char v6;

  v3 = wantsDateDecorations;
  v5 = -[UICalendarView _hasCellDecorations](self, "_hasCellDecorations");
  if (v3)
    v6 = 64;
  else
    v6 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v6;
  if (v5 != -[UICalendarView _hasCellDecorations](self, "_hasCellDecorations"))
  {
    if (!-[UICalendarView _hasCellDecorations](self, "_hasCellDecorations"))
      -[_UICalendarViewDecorationSystem reset](self->_decorationSystem, "reset");
    -[UICalendarView _reconfigureVisibleItems](self, "_reconfigureVisibleItems");
  }
}

- (void)reloadDecorationsForDateComponents:(NSArray *)dates animated:(BOOL)animated
{
  _BOOL8 v4;
  UICollectionViewDiffableDataSource *dataSource;
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = animated;
  dataSource = self->_dataSource;
  v7 = dates;
  -[UICollectionViewDiffableDataSource snapshot](dataSource, "snapshot");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _asCalendarDay(v7, v9, -[UICalendarSelection renderOverhangDays](self->_selectionBehavior, "renderOverhangDays"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intersectSet:", v12);

  objc_msgSend(v11, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reconfigureItemsWithIdentifiers:", v13);

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v14, v4);
}

- (BOOL)_canSelectItemAtIndexPath:(id)a3 forSelection:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UICalendarSelection renderOverhangDays](self->_selectionBehavior, "renderOverhangDays")
     || (objc_msgSend(v6, "assignedMonth"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
    && (-[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_ui_containsDay:", v6),
        v8,
        v9))
  {
    if (self->_selectionBehavior)
    {
      objc_msgSend(v6, "components");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCalendar:", v11);

      v12 = -[UICalendarSelection canSelectDate:](self->_selectionBehavior, "canSelectDate:", v10);
    }
    else
    {
      v12 = !a4;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[UICalendarView _canSelectItemAtIndexPath:forSelection:](self, "_canSelectItemAtIndexPath:forSelection:", a4, 1);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return -[UICalendarView _canSelectItemAtIndexPath:forSelection:](self, "_canSelectItemAtIndexPath:forSelection:", a4, 1);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  -[UICalendarSelection didSelectDate:](self->_selectionBehavior, "didSelectDate:", v5);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  UICalendarView *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = self;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel effectiveCalendar](v4->_dataModel, "effectiveCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v7);

  LOBYTE(v4) = -[UICalendarSelection shouldDeselectDate:](v4->_selectionBehavior, "shouldDeselectDate:", v6);
  return (char)v4;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  -[UICalendarSelection didDeselectDate:](self->_selectionBehavior, "didDeselectDate:", v5);
}

- (NSCalendar)calendar
{
  return -[_UICalendarDataModel calendar](self->_dataModel, "calendar");
}

- (NSLocale)locale
{
  return -[_UICalendarDataModel locale](self->_dataModel, "locale");
}

- (NSTimeZone)timeZone
{
  return -[_UICalendarDataModel timeZone](self->_dataModel, "timeZone");
}

- (UIFontDescriptorSystemDesign)fontDesign
{
  return -[_UICalendarDataModel fontDesign](self->_dataModel, "fontDesign");
}

- (void)setCalendar:(NSCalendar *)calendar
{
  NSCalendar *v4;
  void *v5;
  NSCalendar *v6;
  char v7;
  NSCalendar *v8;

  v4 = calendar;
  -[_UICalendarDataModel calendar](self->_dataModel, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = -[NSCalendar isEqual:](v8, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UICalendarDataModel setCalendar:](self->_dataModel, "setCalendar:", v8);
    -[_UICalendarHeaderView didUpdateCalendar](self->_headerView, "didUpdateCalendar");
    -[_UICalendarWeekdayView didUpdateCalendar](self->_weekdayView, "didUpdateCalendar");
    -[_UICalendarMonthYearSelector didUpdateCalendar](self->_monthYearSelector, "didUpdateCalendar");
    -[UICalendarSelection didChangeCalendar:](self->_selectionBehavior, "didChangeCalendar:", v8);
    -[UICalendarView _reloadEverythingIncludingLayout:](self, "_reloadEverythingIncludingLayout:", 1);
  }
LABEL_9:

}

- (void)setLocale:(NSLocale *)locale
{
  NSLocale *v4;
  void *v5;
  NSLocale *v6;
  char v7;
  NSLocale *v8;

  v4 = locale;
  -[_UICalendarDataModel locale](self->_dataModel, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = -[NSLocale isEqual:](v8, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UICalendarDataModel setLocale:](self->_dataModel, "setLocale:", v8);
    -[_UICalendarHeaderView didUpdateLocale](self->_headerView, "didUpdateLocale");
    -[_UICalendarWeekdayView didUpdateLocale](self->_weekdayView, "didUpdateLocale");
    -[_UICalendarMonthYearSelector didUpdateLocale](self->_monthYearSelector, "didUpdateLocale");
    -[UICalendarView _reloadEverythingIncludingLayout:](self, "_reloadEverythingIncludingLayout:", 1);
  }
LABEL_9:

}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v4;
  void *v5;
  NSTimeZone *v6;
  char v7;
  NSTimeZone *v8;

  v4 = timeZone;
  -[_UICalendarDataModel timeZone](self->_dataModel, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = -[NSTimeZone isEqual:](v8, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UICalendarDataModel setTimeZone:](self->_dataModel, "setTimeZone:", v8);
    -[_UICalendarHeaderView didUpdateTimeZone](self->_headerView, "didUpdateTimeZone");
    -[_UICalendarMonthYearSelector didUpdateTimeZone](self->_monthYearSelector, "didUpdateTimeZone");
    -[UICalendarView _reloadEverythingIncludingLayout:](self, "_reloadEverythingIncludingLayout:", 1);
  }
LABEL_9:

}

- (void)setFontDesign:(UIFontDescriptorSystemDesign)fontDesign
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;

  v4 = fontDesign;
  -[_UICalendarDataModel fontDesign](self->_dataModel, "fontDesign");
  v5 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UICalendarDataModel setFontDesign:](self->_dataModel, "setFontDesign:", v8);
    -[_UICalendarHeaderView didUpdateFontDesign](self->_headerView, "didUpdateFontDesign");
    -[_UICalendarWeekdayView didUpdateFontDesign](self->_weekdayView, "didUpdateFontDesign");
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    -[UICalendarSelection selectAllDatesAnimated:](self->_selectionBehavior, "selectAllDatesAnimated:", 0);
  }
LABEL_9:

}

- (NSDateInterval)availableDateRange
{
  return -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
}

- (void)setAvailableDateRange:(NSDateInterval *)availableDateRange
{
  NSDateInterval *v4;
  NSDateInterval *v5;
  NSDateInterval *v6;
  char v7;
  NSDateInterval *v8;

  v4 = availableDateRange;
  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v5 = (NSDateInterval *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSDateInterval isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UICalendarDataModel setAvailableDateRange:](self->_dataModel, "setAvailableDateRange:", v8);
    -[UICalendarSelection didChangeAvailableDateRange:](self->_selectionBehavior, "didChangeAvailableDateRange:", v8);
    -[_UICalendarHeaderView didUpdateDateRange](self->_headerView, "didUpdateDateRange");
    -[UICalendarView _updateCollectionViewSelection:](self, "_updateCollectionViewSelection:", 0);
    -[UICalendarView _reloadEverythingIncludingLayout:](self, "_reloadEverythingIncludingLayout:", 0);
  }
LABEL_9:

}

- (NSDateComponents)visibleDateComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 1048590, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (void)setVisibleDateComponents:(NSDateComponents *)visibleDateComponents
{
  -[UICalendarView setVisibleDateComponents:animated:](self, "setVisibleDateComponents:animated:", visibleDateComponents, 0);
}

- (void)setVisibleDateComponents:(NSDateComponents *)dateComponents animated:(BOOL)animated
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _UIDatePickerCalendarMonth *v15;
  void *v16;
  void *v17;
  NSDateComponents *v18;

  v4 = animated;
  v18 = dateComponents;
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v7 = (void *)-[NSDateComponents copy](v18, "copy");
    objc_msgSend(v7, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(v7, "setCalendar:", v6);
    if (v6)
    {
      objc_msgSend(v7, "calendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v6);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v7, "calendar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateFromComponents:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDateComponents * _Nullable _UICalendarSanitizeWithCalendar(NSDateComponents * _Nonnull __strong, NSCalendar * _Nonnull __strong)");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_UICalendarViewHelper.h"), 92, CFSTR("Date components yielded an invalid NSDate"));

        }
        objc_msgSend(v6, "components:fromDate:", 1048606, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:]([_UIDatePickerCalendarMonth alloc], "initWithDate:calendar:", v14, v6);
  -[UICalendarView _setVisibleMonth:animated:](self, "_setVisibleMonth:animated:", v15, v4);

}

- (void)_freezeContentOffset
{
  CGPoint *p_frozenContentOffset;
  double y;
  double v5;
  CGFloat v7;
  CGFloat v8;
  void *v10;

  p_frozenContentOffset = &self->_frozenContentOffset;
  y = self->_frozenContentOffset.y;
  v5 = INFINITY;
  if (self->_frozenContentOffset.x != INFINITY || y != INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", INFINITY, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1137, CFSTR("Frozen content offset found. You need to clear the current one out by calling _restoreContentOffsetWithPageOffset: first."));

  }
  -[UIScrollView contentOffset](self->_collectionView, "contentOffset", v5, y);
  p_frozenContentOffset->x = v7;
  p_frozenContentOffset->y = v8;
}

- (void)_restoreContentOffsetWithPageOffset:(int64_t)a3
{
  CGPoint *p_frozenContentOffset;
  double y;
  double x;
  void *v10;
  CGRect v11;

  p_frozenContentOffset = &self->_frozenContentOffset;
  x = self->_frozenContentOffset.x;
  y = self->_frozenContentOffset.y;
  if (x == INFINITY && y == INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1144, CFSTR("No content offset found to restore. You need to call _freezeContentOffset first."));

  }
  -[UIView bounds](self->_collectionView, "bounds");
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", x + CGRectGetWidth(v11) * (double)a3, y);
  *p_frozenContentOffset = (CGPoint)InvalidFrozenContentOffset;
}

- (void)_setVisibleMonth:(id)a3
{
  -[UICalendarView _setVisibleMonth:animated:](self, "_setVisibleMonth:animated:", a3, 0);
}

- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];

  v4 = a4;
  v7 = a3;
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_ui_containsMonth:", v7);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1167, CFSTR("Unable to set a visible month that is before the minimum or after the maximum date."));

    }
    -[UICalendarView _setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:](self, "_setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:", v7, v4, 1, 1, 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__UICalendarView__setVisibleMonth_animated___block_invoke;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    -[UICalendarView _performIfNotIgnoringScrollCallbacks:](self, "_performIfNotIgnoringScrollCallbacks:", v13);
  }

}

uint64_t __44__UICalendarView__setVisibleMonth_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDataIfNecessary");
}

- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4 updateDataSource:(BOOL)a5 updateCollectionView:(BOOL)a6 notifyDelegate:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v10;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  UICalendarView *v23;
  id v24;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v12 = a3;
  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_ui_containsMonth:", v12);

  if (v14)
  {
    -[UICalendarView visibleDateComponents](self, "visibleDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarDataModel setVisibleMonth:](self->_dataModel, "setVisibleMonth:", v12);
    -[_UICalendarHeaderView didUpdateVisibleMonth](self->_headerView, "didUpdateVisibleMonth");
    -[_UICalendarMonthYearSelector didUpdateVisibleMonth](self->_monthYearSelector, "didUpdateVisibleMonth");
    if (a5 || v8)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __97__UICalendarView__setVisibleMonth_animated_updateDataSource_updateCollectionView_notifyDelegate___block_invoke;
      v22 = &unk_1E16B1B50;
      v23 = self;
      v24 = v12;
      -[UICalendarView _performIgnoringScrollCallbacks:](self, "_performIgnoringScrollCallbacks:", &v19);
      -[UICalendarView _updateCollectionViewSelection:](self, "_updateCollectionViewSelection:", 0, v19, v20, v21, v22, v23);

    }
    if (v8)
      -[UICalendarView _updateCollectionViewScrollPosition:](self, "_updateCollectionViewScrollPosition:", v10);
    -[UICalendarView visibleDateComponents](self, "visibleDateComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v7 && (v17 & 1) == 0 && (*(_BYTE *)&self->_flags & 0x20) != 0)
    {
      -[UICalendarView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "calendarView:didChangeVisibleDateComponentsFrom:", self, v15);

    }
  }

}

uint64_t __97__UICalendarView__setVisibleMonth_animated_updateDataSource_updateCollectionView_notifyDelegate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_freezeContentOffset");
  return objc_msgSend(*(id *)(a1 + 32), "_restoreContentOffsetWithPageOffset:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "prepareDataSourceWithScrollPositionIfNecessary:", *(_QWORD *)(a1 + 40)));
}

- (void)_shouldDifferentiateWithoutColorUpdated:(id)a3
{
  -[UICollectionView reloadData](self->_collectionView, "reloadData", a3);
}

- (void)_setNeedsCollectionViewSelectionUpdate
{
  *(_BYTE *)&self->_flags |= 1u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setNeedsCollectionViewScrollPositionUpdate
{
  *(_BYTE *)&self->_flags |= 2u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateCollectionViewSelection:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;

  v3 = a3;
  *(_BYTE *)&self->_flags &= ~1u;
  -[UIView bounds](self->_collectionView, "bounds");
  if (v6 == 0.0 || v5 == 0.0)
  {
    -[UICalendarView _setNeedsCollectionViewSelectionUpdate](self, "_setNeedsCollectionViewSelectionUpdate");
  }
  else
  {
    -[UICalendarSelection selectAllDatesAnimated:](self->_selectionBehavior, "selectAllDatesAnimated:", v3);
    -[UICalendarView _updateCollectionViewContentInsets](self, "_updateCollectionViewContentInsets");
  }
}

- (void)_updateCollectionViewScrollPosition:(BOOL)a3
{
  _BOOL8 v3;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UICollectionView *collectionView;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  *(_BYTE *)&self->_flags &= ~2u;
  -[UIView bounds](self->_collectionView, "bounds");
  if (v7 == 0.0 || v6 == 0.0)
  {
    -[UICalendarView _setNeedsCollectionViewScrollPositionUpdate](self, "_setNeedsCollectionViewScrollPositionUpdate");
  }
  else
  {
    -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v14);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1269, CFSTR("Trying to scroll to a month marked as visible that is not loaded."));

    }
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v12, 9, v3);

  }
}

- (void)_updateCollectionViewContentInsets
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v17, "count") <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1278, CFSTR("Internal inconsistency. Unable to set content insets, need at least 3 loaded months."));

  }
  if (objc_msgSend(v17, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "_ui_containsMonth:", v7);

      if ((v8 & 1) != 0)
        break;
      if (++v5 >= objc_msgSend(v17, "count"))
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = objc_msgSend(v17, "count");
  while (--v9 >= 0)
  {
    -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_ui_containsMonth:", v11);

    if (v12)
      goto LABEL_13;
  }
  v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1302, CFSTR("Invalid state. Unable to find a lower bounds in range."));

  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1303, CFSTR("Invalid state. Unable to find an upper bounds in range."));

  }
  -[UIView bounds](self->_collectionView, "bounds");
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, -(v13 * (double)v5), 0.0, -(v13 * (double)(unint64_t)(objc_msgSend(v17, "count") + ~v9)));

}

- (void)_performIgnoringScrollCallbacks:(id)a3
{
  id v5;
  char flags;
  void *v7;
  id v8;

  v5 = a3;
  flags = (char)self->_flags;
  v8 = v5;
  if ((flags & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarView.m"), 1316, CFSTR("A block is already being executed while ignoring scroll callbacks. This guard is not reentrant safe."));

    v5 = v8;
    flags = (char)self->_flags;
  }
  *(_BYTE *)&self->_flags = flags | 8;
  (*((void (**)(void))v5 + 2))();
  *(_BYTE *)&self->_flags &= ~8u;

}

- (void)_performIfNotIgnoringScrollCallbacks:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)_updateVisibleMonthIfNecessary
{
  UICollectionView *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGSize v31;
  CGPoint v32;
  CGSize v33;
  CGPoint v34;
  CGRect v35;
  CGRect v36;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = self->_collectionView;
  if (!-[UIScrollView isScrollAnimating](v3, "isScrollAnimating"))
  {
    -[UIScrollView contentOffset](v3, "contentOffset");
    v5 = v4;
    v7 = v6;
    -[UIView bounds](v3, "bounds");
    v8 = v5 + CGRectGetWidth(v35) * 0.5;
    -[UIView bounds](v3, "bounds");
    v9 = (unint64_t)(v8 / CGRectGetWidth(v36));
    -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") > v9)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v12);

      if ((v14 & 1) == 0)
        -[UICalendarView _setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:](self, "_setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:", v12, 0, 1, 0, 1);

      goto LABEL_13;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
      -[UIView bounds](v3, "bounds");
      v33.width = v22;
      v33.height = v23;
      NSStringFromCGSize(v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34.x = v5;
      v34.y = v7;
      NSStringFromCGPoint(v34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = v11;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "[UIDatePicker] Calendar scroll offset is outside of available sections (%@). bounds.size: %@, contentOffset: %@", (uint8_t *)&v24, 0x20u);
    }
    else
    {
      v15 = _updateVisibleMonthIfNecessary___s_category;
      if (!_updateVisibleMonthIfNecessary___s_category)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&_updateVisibleMonthIfNecessary___s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v17 = v16;
      -[UIView bounds](v3, "bounds");
      v31.width = v18;
      v31.height = v19;
      NSStringFromCGSize(v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32.x = v5;
      v32.y = v7;
      NSStringFromCGPoint(v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = v11;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "[UIDatePicker] Calendar scroll offset is outside of available sections (%@). bounds.size: %@, contentOffset: %@", (uint8_t *)&v24, 0x20u);
    }

LABEL_12:
LABEL_13:

  }
}

- (void)_cleanupDataIfNecessary
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__UICalendarView__cleanupDataIfNecessary__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UICalendarView _performIgnoringScrollCallbacks:](self, "_performIgnoringScrollCallbacks:", v3);
  -[UICalendarView _updateCollectionViewSelection:](self, "_updateCollectionViewSelection:", 0);
}

uint64_t __41__UICalendarView__cleanupDataIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_freezeContentOffset");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 440);
  objc_msgSend(*(id *)(v2 + 528), "visibleMonth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "cleanupDataSourceWithScrollPositionIfNecessary:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_restoreContentOffsetWithPageOffset:", v5);
}

- (void)scrollViewDidScroll:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__UICalendarView_scrollViewDidScroll___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UICalendarView _performIfNotIgnoringScrollCallbacks:](self, "_performIfNotIgnoringScrollCallbacks:", v3);
}

uint64_t __38__UICalendarView_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibleMonthIfNecessary");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  UICalendarView *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  _QWORD v4[5];

  result = objc_msgSend(*(id *)(a1 + 32), "isScrollAnimating");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isTracking");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isDecelerating");
      if ((result & 1) == 0)
      {
        result = objc_msgSend(*(id *)(a1 + 32), "isDragging");
        if ((result & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "_updateVisibleMonthIfNecessary");
          v3 = *(void **)(a1 + 40);
          v4[0] = MEMORY[0x1E0C809B0];
          v4[1] = 3221225472;
          v4[2] = __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke_2;
          v4[3] = &unk_1E16B1B28;
          v4[4] = v3;
          return objc_msgSend(v3, "_performIfNotIgnoringScrollCallbacks:", v4);
        }
      }
    }
  }
  return result;
}

uint64_t __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDataIfNecessary");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__UICalendarView_scrollViewDidEndDecelerating___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UICalendarView _performIfNotIgnoringScrollCallbacks:](self, "_performIfNotIgnoringScrollCallbacks:", v3);
}

uint64_t __47__UICalendarView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDataIfNecessary");
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UICalendarView");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (UICalendarSelection)selectionBehavior
{
  return self->_selectionBehavior;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (_UICalendarHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (_UICalendarWeekdayView)weekdayView
{
  return self->_weekdayView;
}

- (void)setWeekdayView:(id)a3
{
  objc_storeStrong((id *)&self->_weekdayView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setDecorationSystem:(id)a3
{
  objc_storeStrong((id *)&self->_decorationSystem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationSystem, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_weekdayView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_selectionBehavior, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_storeStrong((id *)&self->_daySizingLabel, 0);
  objc_storeStrong((id *)&self->_monthYearSelector, 0);
  objc_storeStrong((id *)&self->_dataSourceController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cellFormatter, 0);
}

@end
