@implementation PXMemoriesSpec

- (PXMemoriesSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXMemoriesSpec initWithExtendedTraitCollection:options:style:](self, "initWithExtendedTraitCollection:options:style:", a3, a4, 0);
}

- (PXMemoriesSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  id v8;
  PXMemoriesSpec *v9;
  PXMemoriesSpec *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v22;
  int64_t idiom;
  uint64_t v24;
  UIColor *feedBackgroundColor;
  uint64_t v26;
  UIFont *tabTitleFont;
  uint64_t v28;
  UIColor *tabTitleTextColor;
  double v30;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  UIColor *v48;
  double v49;
  objc_super v51;

  v8 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PXMemoriesSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v51, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_feedShouldAllowHeaders = 1;
    objc_msgSend(v8, "layoutMargins");
    PXEdgeInsetsMake();
    v10->_favoriteBadgeInset.top = v11;
    v10->_favoriteBadgeInset.left = v12;
    v10->_favoriteBadgeInset.bottom = v13;
    v10->_favoriteBadgeInset.right = v14;
    v10->_favoriteBadgeSize = (CGSize)PXFavoriteBadgetSize;
    v10->__style = a5;
    if (a5 == 1)
      v10->_feedShouldAllowHeaders = 0;
    v10->_idiom = objc_msgSend(v8, "userInterfaceIdiom");
    v15 = -[PXFeatureSpec sizeClass](v10, "sizeClass");
    if (v15 == 2)
    {
      v16 = 1.77777779;
    }
    else
    {
      v17 = objc_msgSend(v8, "layoutOrientation");
      v16 = 1.77777779;
      if (v17 != 2)
        v16 = 1.0;
    }
    if (a5 == 2)
      v16 = 1.0;
    v10->_feedHeroImageAspectRatio = v16;
    v10->_feedHeroPosition = 0;
    v10->_feedMemoriesPerRow = 2;
    if (objc_msgSend(v8, "layoutOrientation") == 2)
    {
      v10->_feedMemoriesPerRow = 3;
      if (v15 != 2)
      {
        +[PXLayoutMetricInterpolator gadgetColumnWidthSpanSingleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnWidthSpanSingleSetAInterpolator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layoutReferenceSize");
        objc_msgSend(v18, "valueForMetric:");
        v10->__columnWidth = v19;

      }
    }
    v10->_feedInteritemSpacing = 11.0;
    v20 = -[PXFeatureSpec userInterfaceFeature](v10, "userInterfaceFeature");
    v10->_feedAxis = 1;
    if (v20 == 2 || v10->_idiom == 3)
      v22 = 2;
    else
      v22 = 1;
    v10->_feedAxis = v22;
    idiom = v10->_idiom;
    if (idiom == 4)
    {
      objc_msgSend(v8, "layoutReferenceSize");
      -[PXMemoriesSpec _feedInteritemSpacingForReferenceSize:](v10, "_feedInteritemSpacingForReferenceSize:");
      v10->_feedInteritemSpacing = v30;
      v10->_feedEntryHeaderHeight = 16.0;
      v10->_distanceBetweenHeaderBaselineAndImageTop = 15.0;
      __asm { FMOV            V0.2D, #-4.0 }
      v10->_borderOffset = _Q0;
      v10->_borderWidth = 3.0;
      v10->_shouldRemoveHighlightOnScroll = 1;
    }
    else if (idiom == 3)
    {
      v10->_feedHeroImageAspectRatio = 1.0;
      v10->_feedInteritemSpacing = 50.0;
      v10->_feedEntryHeaderHeight = 24.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v24 = objc_claimAutoreleasedReturnValue();
      feedBackgroundColor = v10->_feedBackgroundColor;
      v10->_feedBackgroundColor = (UIColor *)v24;

      v10->_highlightedSectionHeaderOffset = (CGPoint)xmmword_1A7C0C970;
      PXFontWithTextStyle();
      v26 = objc_claimAutoreleasedReturnValue();
      tabTitleFont = v10->_tabTitleFont;
      v10->_tabTitleFont = (UIFont *)v26;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.349999994, 0.600000024);
      v28 = objc_claimAutoreleasedReturnValue();
      tabTitleTextColor = v10->_tabTitleTextColor;
      v10->_tabTitleTextColor = (UIColor *)v28;

      v10->_tabTitleBaselineOffset = 130.0;
      v10->_tabTopContentPadding = 185.0;
      v10->_shouldRemoveHighlightOnScroll = 0;
    }
    else
    {
      objc_msgSend(v8, "layoutReferenceSize");
      v36 = v35;
      objc_msgSend(v8, "safeAreaInsets");
      v39 = v36 - v37 - v38;
      +[PXLayoutMetricInterpolator memoriesFeedInteritemSpacingInterpolator](PXLayoutMetricInterpolator, "memoriesFeedInteritemSpacingInterpolator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "valueForMetric:", v39);
      v10->_feedInteritemSpacing = v41;

      +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanSingleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnSpacingSpanSingleSetAInterpolator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "valueForMetric:", v36);
      v10->_feedInteritemSpacing = v43;

      PXScaledValueForTextStyleWithSymbolicTraits();
      v10->_feedEntryHeaderHeight = v44;
      PXScaledValueForTextStyleWithSymbolicTraits();
      v10->_firstFeedEntryHeaderHeight = v45;
      PXScaledValueForTextStyleWithSymbolicTraits();
      v10->_distanceBetweenHeaderBaselineAndImageTop = v46;
      v10->_shouldRemoveHighlightOnScroll = 1;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v10->_feedBackgroundColor;
      v10->_feedBackgroundColor = (UIColor *)v47;

    }
    v10->_orbPreviewSize = 0.75;
    v10->_feedAdditionalContentThreshold = 512.0;
    objc_msgSend(v8, "displayScale");
    v10->__displayScale = v49;
    -[PXMemoriesSpec _calculateSectionInsetWithExtendedTraitCollection:](v10, "_calculateSectionInsetWithExtendedTraitCollection:", v8);
  }

  return v10;
}

- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  unint64_t var1;
  void *v6;
  void *v7;
  int64_t var0;
  CGSize var2;
  CGSize v10;
  id v11;
  void *v12;
  double v13;
  int64_t idiom;
  void *v15;
  CGSize v16;
  CGSize v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  __int128 v26;
  CGSize v27;
  objc_super v28;
  _QWORD aBlock[5];

  var1 = a3->var1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PXMemoriesSpec_createViewSpecWithDescriptor___block_invoke;
  aBlock[3] = &unk_1E5146258;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  var0 = a3->var0;
  switch(a3->var0)
  {
    case 0x7D0:
      v11 = objc_alloc_init((Class)off_1E50B5EE8);
      -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v11);
      -[PXMemoriesSpec selectionHighlightColor](self, "selectionHighlightColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelectionHighlightColor:", v12);
      goto LABEL_14;
    case 0x7D1:
      v11 = objc_alloc_init((Class)off_1E50B5EE8);
      -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v11);
      if ((var1 & 2) != 0)
      {
        -[PXMemoriesSpec borderColor](self, "borderColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBorderColor:", v18);

        -[PXMemoriesSpec borderWidth](self, "borderWidth");
        objc_msgSend(v11, "setBorderWidth:");
        -[PXFeatureSpec collectionTileImageCornerRadius](self, "collectionTileImageCornerRadius");
        v13 = v19 + v19;
      }
      else
      {
        objc_msgSend(v11, "setBorderColor:", 0);
        v13 = 0.0;
        objc_msgSend(v11, "setBorderWidth:", 0.0);
      }
      objc_msgSend(v11, "setCornerRadius:", v13);
      break;
    case 0x7D2:
      v11 = objc_alloc_init((Class)off_1E50B31F8);
      -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v11);
      idiom = self->_idiom;
      if (idiom == 4)
      {
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v20);
      }
      else
      {
        if (idiom == 3)
        {
          PXFontWithTextStyle();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFont:", v15);

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.349999994, 0.600000024);
        }
        else
        {
          PXFontWithTextStyleSymbolicTraits();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFont:", v21);

          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTextColor:", v20);
      }

      objc_msgSend(v11, "setCapitalization:", 0);
      objc_msgSend(v11, "setNumberOfLines:", 1);
      objc_msgSend(v11, "setTextAlignment:", -[PXFeatureSpec localizedLeadingTextAlignment](self, "localizedLeadingTextAlignment"));
      objc_msgSend(v11, "setVerticalAlignment:", 0);
      objc_msgSend(v11, "setContentInsets:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
      break;
    case 0x7D3:
    case 0x7D4:
      a3->var0 = (*((uint64_t (**)(void *, BOOL))v6 + 2))(v6, var0 == 2003) + 1960;
      v28.receiver = self;
      v28.super_class = (Class)PXMemoriesSpec;
      var2 = a3->var2;
      v26 = *(_OWORD *)&a3->var0;
      v27 = var2;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v28, sel_createViewSpecWithDescriptor_, &v26, v23.receiver, v23.super_class);
      goto LABEL_11;
    case 0x7D5:
      a3->var0 = 1915;
      v24.receiver = self;
      v24.super_class = (Class)PXMemoriesSpec;
      v17 = a3->var2;
      v26 = *(_OWORD *)&a3->var0;
      v27 = v17;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v24, sel_createViewSpecWithDescriptor_, &v26);
      goto LABEL_13;
    case 0x7D6:
    case 0x7D7:
      a3->var0 = (*((uint64_t (**)(void *, BOOL))v6 + 2))(v6, var0 == 2006) + 1975;
      v25.receiver = self;
      v25.super_class = (Class)PXMemoriesSpec;
      v10 = a3->var2;
      v26 = *(_OWORD *)&a3->var0;
      v27 = v10;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v25, sel_createViewSpecWithDescriptor_, &v26);
LABEL_13:
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PXMemoriesSpec feedBackgroundColor](self, "feedBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v12);
LABEL_14:

      break;
    default:
      v23.receiver = self;
      v23.super_class = (Class)PXMemoriesSpec;
      v16 = a3->var2;
      v26 = *(_OWORD *)&a3->var0;
      v27 = v16;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v23, sel_createViewSpecWithDescriptor_, &v26, self, PXMemoriesSpec);
LABEL_11:
      v11 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v11;
}

- (Class)feedDataSourceManagerClass
{
  -[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)feedLayoutMetricsClass
{
  void *v2;

  if ((unint64_t)-[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature") > 7)
    v2 = 0;
  else
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

- (Class)feedTransitionAnimationCoordinatorClass
{
  return (Class)objc_opt_class();
}

- (id)newLayoutGeneratorWithMetrics:(id)a3
{
  id v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PXGridLayoutMetrics *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  PXMemoriesGridLayoutGenerator *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
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
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v48;

  v5 = a3;
  v6 = -[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature");
  if (-[PXMemoriesSpec _style](self, "_style") == 2)
  {
    objc_msgSend(v5, "referenceSize");
    v8 = v7;
    v10 = v9;
    v11 = objc_alloc_init(PXGridLayoutMetrics);
    -[PXLayoutMetrics setReferenceSize:](v11, "setReferenceSize:", v8, v10);
    -[PXGridLayoutMetrics setAxis:](v11, "setAxis:", 1);
    if (-[PXMemoriesSpec idiom](self, "idiom") == 3)
    {
      PXEdgeInsetsMake();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = (v8 - v14 - v18 + -200.0) / 5.0;
      -[PXGridLayoutMetrics setInterItemSpacing:](v11, "setInterItemSpacing:", 50.0, 50.0);
      -[PXGridLayoutMetrics setContentInsets:](v11, "setContentInsets:", v13, v15, v17, v19);
      -[PXGridLayoutMetrics setItemSize:](v11, "setItemSize:", v20, v20);
    }
    else
    {
      if (v6 == 1)
        +[PXLayoutMetricInterpolator memoriesFeedPortraitEdgeInsetsInterpolator](PXLayoutMetricInterpolator, "memoriesFeedPortraitEdgeInsetsInterpolator");
      else
        +[PXLayoutMetricInterpolator memoriesDetailsEdgeInsetsInterpolator](PXLayoutMetricInterpolator, "memoriesDetailsEdgeInsetsInterpolator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFeatureSpec sizeClass](self, "sizeClass");
      objc_msgSend(v5, "spec");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safeAreaInsets");
      v25 = v24;
      v27 = v26;

      v28 = v8 - v25 - v27;
      objc_msgSend(v22, "valueForMetric:", v28);
      v30 = v29;
      v31 = v28 + v29 * -2.0;
      PXEdgeInsetsMake();
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      +[PXLayoutMetricInterpolator memoriesItemWidthInterpolator](PXLayoutMetricInterpolator, "memoriesItemWidthInterpolator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "valueForMetric:", v31);
      v42 = v41;
      -[PXMemoriesSpec _displayScale](self, "_displayScale");
      PXFloatFloorToPixel();
      v44 = v43;
      -[PXGridLayoutMetrics setContentInsets:](v11, "setContentInsets:", v33, v35, v37, v39);
      -[PXGridLayoutMetrics setItemSize:](v11, "setItemSize:", v42, v42);
      -[PXGridLayoutMetrics setInterItemSpacing:](v11, "setInterItemSpacing:", v44, v44);
      -[PXMemoriesSpec feedEntryHeaderHeight](self, "feedEntryHeaderHeight");
      -[PXGridLayoutMetrics setHeaderSize:](v11, "setHeaderSize:", v30, v45);
      -[PXMemoriesSpec distanceBetweenHeaderBaselineAndImageTop](self, "distanceBetweenHeaderBaselineAndImageTop");
      -[PXGridLayoutMetrics setHeaderSpacing:](v11, "setHeaderSpacing:", 0.0, v46);

    }
    v21 = -[PXGridLayoutGenerator initWithMetrics:]([PXMemoriesGridLayoutGenerator alloc], "initWithMetrics:", v11);

  }
  else if (v6 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesSpec.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metrics isKindOfClass:[PXMemoriesFeedWidgetLayoutMetrics class]]"));

    }
    v21 = -[PXMemoriesFeedWidgetLayoutGenerator initWithMetrics:]([PXMemoriesFeedWidgetLayoutGenerator alloc], "initWithMetrics:", v5);
  }
  else
  {
    v21 = -[PXMemoriesFeedEntryLayoutGenerator initWithMetrics:]([PXMemoriesFeedEntryLayoutGenerator alloc], "initWithMetrics:", v5);
    -[PXMemoriesGridLayoutGenerator setLayoutAxis:](v21, "setLayoutAxis:", -[PXMemoriesSpec feedSectionLayoutAxis](self, "feedSectionLayoutAxis"));
  }

  return v21;
}

- (int64_t)feedSectionLayoutAxis
{
  if (-[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature") == 2 || self->_idiom == 3)
    return 2;
  else
    return 1;
}

- (double)feedHeroImagePaddingTop
{
  double result;

  result = 0.0;
  if (self->_idiom == 3)
    return 22.0;
  return result;
}

- (double)feedHeroImagePaddingBottom
{
  return 22.0;
}

- (double)bottomShadowPadding
{
  return 97.0;
}

- (double)feedSecondaryImagePaddingBottom
{
  double result;

  result = 67.0;
  if (self->_idiom != 3)
    return 22.0;
  return result;
}

- (id)feedCategoryLabelTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.300000012, 1.0);
}

- (UIEdgeInsets)layoutInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (-[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature") == 2)
    goto LABEL_4;
  if (self->_idiom != 3)
  {
    if (-[PXFeatureSpec sizeClass](self, "sizeClass") == 2
      && -[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature") == 1)
    {
      -[PXMemoriesSpec feedInteritemSpacing](self, "feedInteritemSpacing");
    }
    goto LABEL_8;
  }
  if (-[PXMemoriesSpec _style](self, "_style") != 2)
  {
LABEL_8:
    PXEdgeInsetsMake();
    goto LABEL_9;
  }
LABEL_4:
  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
LABEL_9:
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_calculateSectionInsetWithExtendedTraitCollection:(id)a3
{
  CGFloat v5;
  CGFloat v6;
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
  int IsNull;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  SEL v26;
  PXMemoriesSpec *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;

  v33 = a3;
  v6 = *(double *)off_1E50B8020;
  v5 = *((double *)off_1E50B8020 + 1);
  v7 = *((double *)off_1E50B8020 + 2);
  v8 = *((double *)off_1E50B8020 + 3);
  if (-[PXFeatureSpec userInterfaceFeature](self, "userInterfaceFeature") != 2)
  {
    if (self->_idiom == 3)
    {
      PXEdgeInsetsMake();
      v6 = v9;
      v5 = v10;
      v7 = v11;
      v8 = v12;
      goto LABEL_20;
    }
    v13 = -[PXMemoriesSpec feedAxis](self, "feedAxis");
    objc_msgSend(v33, "layoutReferenceSize");
    v15 = v14;
    v17 = v16;
    IsNull = PXSizeIsNull();
    if (IsNull)
      v19 = *MEMORY[0x1E0C9D820];
    else
      v19 = v15;
    if (IsNull)
      v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    else
      v20 = v17;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", kPXMemoriesFeedLayoutResizingModeKey);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_msgSend(v22, "integerValue");
      if (v23 == 3)
      {
        if (v13 != 1)
        {
          if (v13 != 2)
          {
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              v26 = a2;
              v27 = self;
              v28 = 452;
LABEL_25:
              objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, CFSTR("PXMemoriesSpec.m"), v28, CFSTR("Code which should be unreachable has been reached"));

              abort();
            }
LABEL_19:

            goto LABEL_20;
          }
          v7 = 50.0;
LABEL_31:
          v6 = v7;
          goto LABEL_19;
        }
        v8 = 50.0;
LABEL_29:
        v5 = v8;
        goto LABEL_19;
      }
      if (v23 != 2)
      {
        if (v23 != 1)
          goto LABEL_19;
        if (v13 != 1)
        {
          if (v13 != 2)
          {
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              v26 = a2;
              v27 = self;
              v28 = 434;
              goto LABEL_25;
            }
            goto LABEL_19;
          }
          v7 = (v20 + -600.0) * 0.5;
          goto LABEL_31;
        }
        v8 = (v19 + -800.0) * 0.5;
        goto LABEL_29;
      }
    }
    -[PXFeatureSpec contentGuideInsetsForScrollAxis:](self, "contentGuideInsetsForScrollAxis:", v13);
    v6 = v29;
    v5 = v30;
    v7 = v31;
    v8 = v32;
    goto LABEL_19;
  }
LABEL_20:
  self->_feedEntryEdgeInsets.top = v6;
  self->_feedEntryEdgeInsets.left = v5;
  self->_feedEntryEdgeInsets.bottom = v7;
  self->_feedEntryEdgeInsets.right = v8;

}

- (double)_feedInteritemSpacingForReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  height = a3.height;
  width = a3.width;
  -[PXMemoriesSpec feedInteritemSpacing](self, "feedInteritemSpacing");
  v8 = v7;
  if (self->_idiom != 4)
    return v8;
  v9 = -[PXMemoriesSpec feedAxis](self, "feedAxis");
  -[PXFeatureSpec contentGuideInsetsForScrollAxis:](self, "contentGuideInsetsForScrollAxis:", v9);
  switch(v9)
  {
    case 1:
      v15 = width - v11 - v13;
      return v15 * 0.05;
    case 2:
      v15 = height - v10 - v12;
      return v15 * 0.05;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesSpec.m"), 474, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return v8;
}

- (UIColor)feedBackgroundColor
{
  return self->_feedBackgroundColor;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (int64_t)feedHeroPosition
{
  return self->_feedHeroPosition;
}

- (int64_t)feedAxis
{
  return self->_feedAxis;
}

- (unint64_t)feedMemoriesPerRow
{
  return self->_feedMemoriesPerRow;
}

- (UIEdgeInsets)feedEntryEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_feedEntryEdgeInsets.top;
  left = self->_feedEntryEdgeInsets.left;
  bottom = self->_feedEntryEdgeInsets.bottom;
  right = self->_feedEntryEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)feedShouldAllowHeaders
{
  return self->_feedShouldAllowHeaders;
}

- (double)feedEntryHeaderHeight
{
  return self->_feedEntryHeaderHeight;
}

- (double)firstFeedEntryHeaderHeight
{
  return self->_firstFeedEntryHeaderHeight;
}

- (double)distanceBetweenHeaderBaselineAndImageTop
{
  return self->_distanceBetweenHeaderBaselineAndImageTop;
}

- (double)feedInteritemSpacing
{
  return self->_feedInteritemSpacing;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (double)feedHeroImageAspectRatio
{
  return self->_feedHeroImageAspectRatio;
}

- (CGSize)favoriteBadgeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_favoriteBadgeSize.width;
  height = self->_favoriteBadgeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)favoriteBadgeInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_favoriteBadgeInset.top;
  left = self->_favoriteBadgeInset.left;
  bottom = self->_favoriteBadgeInset.bottom;
  right = self->_favoriteBadgeInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)highlightedSectionHeaderOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_highlightedSectionHeaderOffset.x;
  y = self->_highlightedSectionHeaderOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)shouldRemoveHighlightOnScroll
{
  return self->_shouldRemoveHighlightOnScroll;
}

- (double)feedAdditionalContentThreshold
{
  return self->_feedAdditionalContentThreshold;
}

- (UIFont)tabTitleFont
{
  return self->_tabTitleFont;
}

- (UIColor)tabTitleTextColor
{
  return self->_tabTitleTextColor;
}

- (double)tabTitleBaselineOffset
{
  return self->_tabTitleBaselineOffset;
}

- (double)tabTopContentPadding
{
  return self->_tabTopContentPadding;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (CGPoint)borderOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_borderOffset.x;
  y = self->_borderOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (double)orbPreviewSize
{
  return self->_orbPreviewSize;
}

- (unint64_t)_style
{
  return self->__style;
}

- (double)_displayScale
{
  return self->__displayScale;
}

- (double)_columnWidth
{
  return self->__columnWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_tabTitleTextColor, 0);
  objc_storeStrong((id *)&self->_tabTitleFont, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColor, 0);
}

uint64_t __47__PXMemoriesSpec_createViewSpecWithDescriptor___block_invoke(uint64_t a1, int a2)
{
  double v2;

  if (!a2)
    return 3;
  objc_msgSend(*(id *)(a1 + 32), "feedHeroImageAspectRatio");
  if (v2 == 1.0)
    return 1;
  else
    return 2;
}

@end
