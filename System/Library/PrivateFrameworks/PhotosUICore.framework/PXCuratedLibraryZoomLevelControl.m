@implementation PXCuratedLibraryZoomLevelControl

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v9 = a3;
  if ((void *)PXViewModelObservationContext_47143 == a5)
  {
    v19 = v9;
    if ((a4 & 0x2004) == 0)
      goto LABEL_12;
    -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "zoomLevelTransitionPhase"))
    {
      -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "zoomLevelTransitionPhase");

      if (v12 != 2)
      {
LABEL_12:
        if ((a4 & 0x10000) != 0)
        {
          v14 = (void *)objc_opt_class();
          -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_enabledZoomLevelIdentifiersForViewModel:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXCuratedLibraryZoomLevelControl setEnabledZoomLevelIdentifiers:](self, "setEnabledZoomLevelIdentifiers:", v16);

        }
        v9 = v19;
        if (a4 >> 31)
          goto LABEL_4;
        goto LABEL_5;
      }
    }
    else
    {

    }
    -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryZoomLevelControl setSelectedZoomLevel:](self, "setSelectedZoomLevel:", objc_msgSend(v13, "zoomLevel"));

    goto LABEL_12;
  }
  if ((void *)PXCuratedLibraryStyleGuideObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryZoomLevelControl.m"), 332, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 4) != 0)
  {
LABEL_4:
    v18 = v9;
    -[PXCuratedLibraryZoomLevelControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
    v9 = v18;
  }
LABEL_5:

}

void __59__PXCuratedLibraryZoomLevelControl__updateSegmentedControl__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  PXCuratedLibraryZoomLevelLocalizedTitle(objc_msgSend(a2, "unsignedIntegerValue"), *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTitle:forSegmentAtIndex:", v5, a3);
  v6 = *(_QWORD *)(a1 + 40);
  v15 = *MEMORY[0x1E0DC1138];
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v7);
  v9 = v8;
  v11 = v10;

  v12 = ceil(v9);
  v13 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) + 16 * a3);
  *v13 = v12;
  v13[1] = v11;
  *(double *)(*(_QWORD *)(a1 + 32) + 472) = v12
                                            + *(double *)(*(_QWORD *)(a1 + 32) + 464)
                                            + *(double *)(*(_QWORD *)(a1 + 32) + 472);
  v14 = *(double *)(*(_QWORD *)(a1 + 32) + 480);
  if (v14 < v11)
    v14 = v11;
  *(double *)(*(_QWORD *)(a1 + 32) + 480) = v14;

}

- (PXCuratedLibraryZoomLevelControl)initWithViewModel:(id)a3 styleGuide:(id)a4
{
  id v7;
  id v8;
  PXCuratedLibraryZoomLevelControl *v9;
  id v10;
  void *v11;
  uint64_t v12;
  UIVisualEffectView *backgroundEffectView;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *zoomLevelIdentifiers;
  uint64_t v19;
  NSArray *enabledZoomLevelIdentifiers;
  _PXCuratedLibraryZoomLevelSegmentedControl *v21;
  _PXCuratedLibraryZoomLevelSegmentedControl *segmentedControl;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  PXUpdater *updater;
  void *v28;
  void *v29;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXCuratedLibraryZoomLevelControl;
  v9 = -[PXCuratedLibraryZoomLevelControl initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1202);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithEffect:", v11);
    backgroundEffectView = v9->_backgroundEffectView;
    v9->_backgroundEffectView = (UIVisualEffectView *)v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v9->_backgroundEffectView, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    -[UIVisualEffectView _setGroupName:](v9->_backgroundEffectView, "_setGroupName:", PXCuratedLibraryToolbarBackdropGroupName);
    -[PXCuratedLibraryZoomLevelControl addSubview:](v9, "addSubview:", v9->_backgroundEffectView);
    objc_msgSend((id)objc_opt_class(), "_allPotentialZoomLevelIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_textSizes = (CGSize *)malloc_type_calloc(objc_msgSend(v16, "count"), 0x10uLL, 0x1000040451B5BE8uLL);

    v9->_selectedZoomLevel = objc_msgSend(v7, "zoomLevel");
    objc_msgSend((id)objc_opt_class(), "_zoomLevelIdentifiersForViewModel:", v7);
    v17 = objc_claimAutoreleasedReturnValue();
    zoomLevelIdentifiers = v9->_zoomLevelIdentifiers;
    v9->_zoomLevelIdentifiers = (NSArray *)v17;

    objc_msgSend((id)objc_opt_class(), "_enabledZoomLevelIdentifiersForViewModel:", v7);
    v19 = objc_claimAutoreleasedReturnValue();
    enabledZoomLevelIdentifiers = v9->_enabledZoomLevelIdentifiers;
    v9->_enabledZoomLevelIdentifiers = (NSArray *)v19;

    v21 = objc_alloc_init(_PXCuratedLibraryZoomLevelSegmentedControl);
    segmentedControl = v9->_segmentedControl;
    v9->_segmentedControl = v21;

    -[_PXCuratedLibraryZoomLevelSegmentedControl addTarget:action:forControlEvents:](v9->_segmentedControl, "addTarget:action:forControlEvents:", v9, sel__handleSegmentedControlAction_, 0x2000);
    v23 = -[NSArray count](v9->_zoomLevelIdentifiers, "count");
    if (v23 >= 1)
    {
      v24 = v23;
      for (i = 0; i != v24; ++i)
        -[_PXCuratedLibraryZoomLevelSegmentedControl insertSegmentWithTitle:atIndex:animated:](v9->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", &stru_1E5149688, i, 0);
    }
    -[PXCuratedLibraryZoomLevelControl addSubview:](v9, "addSubview:", v9->_segmentedControl);
    objc_storeStrong((id *)&v9->_viewModel, a3);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v9->_viewModel, "registerChangeObserver:context:", v9, PXViewModelObservationContext_47143);
    objc_storeStrong((id *)&v9->_styleGuide, a4);
    -[PXCuratedLibraryStyleGuide registerChangeObserver:context:](v9->_styleGuide, "registerChangeObserver:context:", v9, PXCuratedLibraryStyleGuideObservationContext);
    v26 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v9, sel_setNeedsLayout);
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v26;

    -[PXUpdater addUpdateSelector:needsUpdate:](v9->_updater, "addUpdateSelector:needsUpdate:", sel__updateSegmentedControl, 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v9, sel__handleContentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    -[PXCuratedLibraryZoomLevelControl layer](v9, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAllowsGroupOpacity:", 0);

  }
  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_updateSegmentedControl
{
  uint64_t v2;
  id v4;
  char v5;
  id *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _PXCuratedLibraryZoomLevelSegmentedControl *segmentedControl;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _PXCuratedLibraryZoomLevelSegmentedControl *v24;
  void *v25;
  _PXCuratedLibraryZoomLevelSegmentedControl *v26;
  void *v27;
  __int128 v28;
  void *v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  id v34;
  double height;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  int64_t v39;
  char v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  char v45;
  uint8_t buf[4];
  int64_t v47;
  __int16 v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  switch(-[PXCuratedLibraryZoomLevelControl shrinkLevel](self, "shrinkLevel"))
  {
    case 0:
    case 1:
      v4 = (id)*MEMORY[0x1E0DC4B08];
      v5 = 0;
      goto LABEL_7;
    case 2:
    case 3:
      v6 = (id *)MEMORY[0x1E0DC4B08];
      goto LABEL_6;
    case 4:
      v6 = (id *)MEMORY[0x1E0DC4AB8];
LABEL_6:
      v4 = *v6;
      v5 = 1;
LABEL_7:
      v7 = -1.0;
      break;
    default:
      v4 = (id)*MEMORY[0x1E0DC4AB8];
      v7 = 13.0 - (double)v2;
      v5 = 1;
      break;
  }
  -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "secondaryToolbarStyle");

  if (v10 == 1)
    v11 = 1;
  else
    v11 = v5;
  v40 = v11;
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v4, *MEMORY[0x1E0DC48F8], 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v42 = v4;
  if (v7 > 0.0)
  {
    objc_msgSend(v12, "fontWithSize:", v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  -[PXCuratedLibraryZoomLevelControl styleGuide](self, "styleGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoomLevelControlTextColorOverLegibilityGradient:", objc_msgSend(v16, "secondaryToolbarLegibilityGradientIsVisible"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  segmentedControl = self->_segmentedControl;
  v22 = *MEMORY[0x1E0DC1140];
  v54[0] = *MEMORY[0x1E0DC1138];
  v21 = v54[0];
  v54[1] = v22;
  v55[0] = v13;
  v55[1] = v17;
  v41 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXCuratedLibraryZoomLevelSegmentedControl setTitleTextAttributes:forState:](segmentedControl, "setTitleTextAttributes:forState:", v23, 0);

  v24 = self->_segmentedControl;
  v52[0] = v21;
  v52[1] = v22;
  v53[0] = v13;
  v53[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXCuratedLibraryZoomLevelSegmentedControl setTitleTextAttributes:forState:](v24, "setTitleTextAttributes:forState:", v25, 4);

  v26 = self->_segmentedControl;
  v50[0] = v21;
  v50[1] = v22;
  v51[0] = v13;
  v51[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXCuratedLibraryZoomLevelSegmentedControl setTitleTextAttributes:forState:](v26, "setTitleTextAttributes:forState:", v27, 2);

  v28 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)&self->_padding.top = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&self->_padding.bottom = v28;
  -[PXCuratedLibraryZoomLevelControl styleGuide](self, "styleGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lateralMargin");
  v31 = v30 < 20.0;
  v32 = 14.0;
  if (!v31)
    v32 = 16.0;
  self->_padding.right = v32;
  self->_padding.left = v32;

  self->_minimumInterTextSpacing = 16.0;
  self->_intrinsicSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PXCuratedLibraryZoomLevelControl zoomLevelIdentifiers](self, "zoomLevelIdentifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __59__PXCuratedLibraryZoomLevelControl__updateSegmentedControl__block_invoke;
  v43[3] = &unk_1E511D510;
  v45 = v40;
  v43[4] = self;
  v34 = v13;
  v44 = v34;
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v43);
  height = self->_intrinsicSize.height;
  self->_intrinsicSize.width = self->_intrinsicSize.width
                             + self->_padding.left
                             + self->_padding.right
                             - self->_minimumInterTextSpacing;
  self->_intrinsicSize.height = height + self->_padding.top + self->_padding.bottom;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXCuratedLibraryZoomLevelControl selectedZoomLevel](self, "selectedZoomLevel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v33, "indexOfObject:", v36);

  if ((v37 & 0x8000000000000000) != 0
    || v37 >= -[_PXCuratedLibraryZoomLevelSegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments"))
  {
    PXAssertGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = -[PXCuratedLibraryZoomLevelControl selectedZoomLevel](self, "selectedZoomLevel");
      *(_DWORD *)buf = 134218242;
      v47 = v39;
      v48 = 2112;
      v49 = v33;
      _os_log_error_impl(&dword_1A6789000, v38, OS_LOG_TYPE_ERROR, "zoom level %li not found in %@", buf, 0x16u);
    }

  }
  else
  {
    -[_PXCuratedLibraryZoomLevelSegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", v37);
  }

}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (int64_t)shrinkLevel
{
  return self->_shrinkLevel;
}

- (int64_t)selectedZoomLevel
{
  return self->_selectedZoomLevel;
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
  void *v17;
  double v18;
  double v19;
  double minimumInterTextSpacing;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;

  v31.receiver = self;
  v31.super_class = (Class)PXCuratedLibraryZoomLevelControl;
  -[PXCuratedLibraryZoomLevelControl layoutSubviews](&v31, sel_layoutSubviews);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXCuratedLibraryZoomLevelControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = 0;
  do
  {
    -[PXCuratedLibraryZoomLevelControl setShrinkLevel:](self, "setShrinkLevel:", v11);
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    v12 = CGRectGetWidth(v32) - self->_intrinsicSize.width;
  }
  while (v12 < 0.0 && v11++ != 14);
  -[UIVisualEffectView setBounds:](self->_backgroundEffectView, "setBounds:", v4, v6, v8, v10);
  PXRectGetCenter();
  -[UIVisualEffectView setCenter:](self->_backgroundEffectView, "setCenter:");
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_backgroundEffectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, CGRectGetHeight(v33) * 0.5);
  -[_PXCuratedLibraryZoomLevelSegmentedControl setBounds:](self->_segmentedControl, "setBounds:", v4, v6, v8, v10);
  PXRectGetCenter();
  -[_PXCuratedLibraryZoomLevelSegmentedControl setCenter:](self->_segmentedControl, "setCenter:");
  -[PXCuratedLibraryZoomLevelControl zoomLevelIdentifiers](self, "zoomLevelIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryZoomLevelControl enabledZoomLevelIdentifiers](self, "enabledZoomLevelIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "count");
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "zoomLevelControlSegmentExpansionFactor");
  v19 = v18;

  minimumInterTextSpacing = self->_minimumInterTextSpacing;
  v30 = v16;
  v21 = (double)(v16 - 1);
  v22 = round(minimumInterTextSpacing + v12 * (1.0 - v19) / v21);
  if (v16 >= 1)
  {
    v23 = 0;
    v24 = 0;
    v25 = (v12 - v21 * (v22 - minimumInterTextSpacing)) / (double)v16;
    do
    {
      -[_PXCuratedLibraryZoomLevelSegmentedControl setWidth:forSegmentAtIndex:](self->_segmentedControl, "setWidth:forSegmentAtIndex:", v24, self->_padding.right+ round(v25 * (double)(v24 + 1))- round(v25 * (double)v24)+ self->_padding.left+ self->_textSizes[v23].width);
      objc_msgSend(v14, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      v28 = objc_msgSend(v15, "containsObject:", v26);

      v29 = v28;
      v15 = v27;
      -[_PXCuratedLibraryZoomLevelSegmentedControl setEnabled:forSegmentAtIndex:](self->_segmentedControl, "setEnabled:forSegmentAtIndex:", v29, v24);
      ++v23;
      ++v24;
    }
    while (v30 != v24);
  }
  -[_PXCuratedLibraryZoomLevelSegmentedControl _setInterSegmentSpacing:](self->_segmentedControl, "_setInterSegmentSpacing:", v22 - self->_padding.left - self->_padding.right);

}

- (NSArray)zoomLevelIdentifiers
{
  return self->_zoomLevelIdentifiers;
}

- (void)setShrinkLevel:(int64_t)a3
{
  if (self->_shrinkLevel != a3)
  {
    self->_shrinkLevel = a3;
    -[PXCuratedLibraryZoomLevelControl _updateSegmentedControl](self, "_updateSegmentedControl");
  }
}

- (NSArray)enabledZoomLevelIdentifiers
{
  return self->_enabledZoomLevelIdentifiers;
}

+ (id)_enabledZoomLevelIdentifiersForViewModel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "allowedActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToYearsMonthsOrDays"));

  if (v6)
  {
    objc_msgSend(a1, "_zoomLevelIdentifiersForViewModel:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isZoomLevelEnabled:", 4);
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v10 = &unk_1E53E8B50;
    v7 = v10;
    v4 = v8;
  }

  return v7;
}

- (PXCuratedLibraryZoomLevelControl)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryZoomLevelControl.m"), 63, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryZoomLevelControl initWithCoder:]");

  abort();
}

- (PXCuratedLibraryZoomLevelControl)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryZoomLevelControl.m"), 67, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryZoomLevelControl initWithFrame:]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_textSizes);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryZoomLevelControl;
  -[PXCuratedLibraryZoomLevelControl dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded", a3.width, a3.height);
  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEnabledZoomLevelIdentifiers:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *enabledZoomLevelIdentifiers;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_enabledZoomLevelIdentifiers;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      enabledZoomLevelIdentifiers = self->_enabledZoomLevelIdentifiers;
      self->_enabledZoomLevelIdentifiers = v6;

      -[PXCuratedLibraryZoomLevelControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
    }
  }

}

- (void)setSelectedZoomLevel:(int64_t)a3
{
  if (self->_selectedZoomLevel != a3)
  {
    self->_selectedZoomLevel = a3;
    -[PXCuratedLibraryZoomLevelControl _invalidateSegmentedControl](self, "_invalidateSegmentedControl");
  }
}

- (int64_t)zoomLevelDisplayedBeforeZoomLevel:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  -[PXCuratedLibraryZoomLevelControl zoomLevelIdentifiers](self, "zoomLevelIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if ((unint64_t)(v6 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  return v8;
}

- (void)_invalidateSegmentedControl
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateSegmentedControl);
}

- (void)_handleSegmentedControlAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  -[PXCuratedLibraryZoomLevelControl zoomLevelIdentifiers](self, "zoomLevelIdentifiers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[_PXCuratedLibraryZoomLevelSegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == -[PXCuratedLibraryZoomLevelControl selectedZoomLevel](self, "selectedZoomLevel"))
  {
    if (-[_PXCuratedLibraryZoomLevelSegmentedControl lastTouchRemainedOnSelectedSegment](self->_segmentedControl, "lastTouchRemainedOnSelectedSegment"))
    {
      -[PXCuratedLibraryZoomLevelControl delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[PXCuratedLibraryZoomLevelControl delegate](self, "delegate");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoomLevelControl:didTapOnAlreadySelectedZoomLevel:", self, v6);

      }
    }
  }
  else
  {
    -[PXCuratedLibraryZoomLevelControl viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PXCuratedLibraryZoomLevelControl__handleSegmentedControlAction___block_invoke;
    v11[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v11[4] = v6;
    objc_msgSend(v9, "performChanges:", v11);

  }
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryZoomLevelControlDelegate)delegate
{
  return (PXCuratedLibraryZoomLevelControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledZoomLevelIdentifiers, 0);
  objc_storeStrong((id *)&self->_zoomLevelIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

uint64_t __66__PXCuratedLibraryZoomLevelControl__handleSegmentedControlAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

+ (id)_allPotentialZoomLevelIdentifiers
{
  return &unk_1E53E8B38;
}

+ (id)_zoomLevelIdentifiersForViewModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;

  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allPotentialZoomLevelIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v4;
  PXFilter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __70__PXCuratedLibraryZoomLevelControl__zoomLevelIdentifiersForViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isZoomLevelEnabled:", objc_msgSend(a2, "integerValue"));
}

@end
