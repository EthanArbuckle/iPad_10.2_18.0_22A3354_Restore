@implementation PXAssetsSectionLayoutSpec

- (id)sectionConfiguratorForAssetCollection:(id)a3 inZoomLevel:(int64_t)a4
{
  id v7;
  id v8;
  int *v9;
  _BOOL4 v10;
  void *v12;

  v7 = a3;
  if (!-[PXAssetsSectionLayoutSpec disableConfigurators](self, "disableConfigurators"))
  {
    v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__yearSectionConfigurator;
    switch(a4)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayoutSpec.m"), 91, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
        goto LABEL_9;
      case 2:
        v10 = PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v7, 2);
        v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__monthSectionConfigurator;
        if (v10)
          v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__monthsChapterConfigurator;
        goto LABEL_9;
      case 3:
        v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__daySectionConfigurator;
        goto LABEL_9;
      case 4:
        v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__gridConfigurator;
LABEL_9:
        v8 = *(id *)((char *)&self->super.super.isa + *v9);
        goto LABEL_10;
      default:
        break;
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)disableConfigurators
{
  return self->_disableConfigurators;
}

- (int64_t)variant
{
  return self->_variant;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)canShowSelectAllButton
{
  return self->_canShowSelectAllButton;
}

- (BOOL)allowsBlur
{
  return self->_allowsBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomableSpec, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_gridConfigurator, 0);
  objc_storeStrong((id *)&self->_daySectionConfigurator, 0);
  objc_storeStrong((id *)&self->_monthsChapterConfigurator, 0);
  objc_storeStrong((id *)&self->_monthSectionConfigurator, 0);
  objc_storeStrong((id *)&self->_yearSectionConfigurator, 0);
}

- (BOOL)allowsPositionDependentHeaderContentOpacityInZoomLevel:(int64_t)a3
{
  _BOOL4 v6;
  void *v7;

  if ((-[PXFeatureSpec options](self, "options") & 4) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    if ((unint64_t)a3 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayoutSpec.m"), 127, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    return (0x18u >> a3) & 1;
  }
  return v6;
}

- (PXAssetsSectionLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXAssetsSectionLayoutSpec initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:](self, "initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:", a3, a4, 0, 0, 0, 0.0);
}

- (PXAssetsSectionLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5 allowsBlur:(BOOL)a6 itemCornerRadius:(double)a7 zoomableSpec:(id)a8
{
  id v14;
  id v15;
  PXAssetsSectionLayoutSpec *v16;
  PXAssetsSectionLayoutSpec *v17;
  char v18;
  PXYearAssetsSectionConfigurator *v19;
  PXYearAssetsSectionConfigurator *yearSectionConfigurator;
  PXMonthCardSectionConfigurator *v21;
  PXMonthCardSectionConfigurator *monthSectionConfigurator;
  PXMonthChapterSectionConfigurator *v23;
  PXMonthChapterSectionConfigurator *monthsChapterConfigurator;
  PXDayAssetsSectionConfigurator *v25;
  PXDayAssetsSectionConfigurator *daySectionConfigurator;
  PXAssetsSectionGridConfigurator *v27;
  PXAssetsSectionGridConfigurator *gridConfigurator;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v14 = a3;
  v15 = a8;
  v37.receiver = self;
  v37.super_class = (Class)PXAssetsSectionLayoutSpec;
  v16 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v37, sel_initWithExtendedTraitCollection_options_, v14, a4);
  v17 = v16;
  if (v16)
  {
    v16->_variant = a5;
    v16->_allowsBlur = a6;
    v18 = -[PXFeatureSpec options](v16, "options");
    v17->_disableConfigurators = (v18 & 2) != 0;
    if ((v18 & 2) == 0)
    {
      objc_storeStrong((id *)&v17->_zoomableSpec, a8);
      v17->_userInterfaceStyleAllowsShadow = objc_msgSend(v14, "userInterfaceStyle") != 2;
      v19 = -[PXYearAssetsSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:]([PXYearAssetsSectionConfigurator alloc], "initWithExtendedTraitCollection:assetsSectionLayoutSpec:", v14, v17);
      yearSectionConfigurator = v17->_yearSectionConfigurator;
      v17->_yearSectionConfigurator = v19;

      v21 = -[PXMonthCardSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:]([PXMonthCardSectionConfigurator alloc], "initWithExtendedTraitCollection:assetsSectionLayoutSpec:", v14, v17);
      monthSectionConfigurator = v17->_monthSectionConfigurator;
      v17->_monthSectionConfigurator = v21;

      v23 = -[PXMonthChapterSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:]([PXMonthChapterSectionConfigurator alloc], "initWithExtendedTraitCollection:assetsSectionLayoutSpec:", v14, v17);
      monthsChapterConfigurator = v17->_monthsChapterConfigurator;
      v17->_monthsChapterConfigurator = v23;

      v25 = -[PXDayAssetsSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:]([PXDayAssetsSectionConfigurator alloc], "initWithExtendedTraitCollection:assetsSectionLayoutSpec:", v14, v17);
      daySectionConfigurator = v17->_daySectionConfigurator;
      v17->_daySectionConfigurator = v25;

      v27 = -[PXAssetsSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:]([PXAssetsSectionGridConfigurator alloc], "initWithExtendedTraitCollection:assetsSectionLayoutSpec:", v14, v17);
      gridConfigurator = v17->_gridConfigurator;
      v17->_gridConfigurator = v27;

    }
    -[PXFeatureSpec curatedLibraryEdgeToEdgeContentDefaultPadding](v17, "curatedLibraryEdgeToEdgeContentDefaultPadding");
    v17->_padding.top = v29;
    v17->_padding.left = v30;
    v17->_padding.bottom = v31;
    v17->_padding.right = v32;
    v17->_canShowSelectAllButton = 1;
    v17->_itemCornerRadius = a7;
    v17->_preferredUserInterfaceStyle = (a4 >> 2) & 2;
    v33 = objc_msgSend(v14, "contentSizeCategory") - 8;
    if (v33 >= 5)
      v34 = 1;
    else
      v34 = 2;
    v17->_numberOfLinesForShowAllButton = v34;
    if (v33 > 4)
      v35 = 0x4042000000000000;
    else
      +[PXAssetsSectionButton preferredHeightWithExtendedTraitCollection:numberOfLines:](PXAssetsSectionButton, "preferredHeightWithExtendedTraitCollection:numberOfLines:", v14, 2);
    *(_QWORD *)&v17->_showAllButtonHeight = v35;
  }

  return v17;
}

- (NSShadow)shadow
{
  NSShadow *shadow;
  void *v4;
  NSShadow *v5;
  NSShadow *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  shadow = self->_shadow;
  if (!shadow)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSShadow *)objc_alloc_init(MEMORY[0x1E0DC1298]);
    v6 = self->_shadow;
    self->_shadow = v5;

    v7 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "sectionShadowOpacity");
    objc_msgSend(v7, "colorWithWhite:alpha:", 0.0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSShadow setShadowColor:](self->_shadow, "setShadowColor:", v9);

    -[NSShadow setShadowBlurRadius:](self->_shadow, "setShadowBlurRadius:", 30.0);
    -[NSShadow setShadowOffset:](self->_shadow, "setShadowOffset:", 0.0, 10.0);
    self->_shadowCornerRadius = 10.0;
    if (objc_msgSend(v4, "exaggerateContrast"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSShadow setShadowColor:](self->_shadow, "setShadowColor:", v10);

    }
    shadow = self->_shadow;
  }
  return shadow;
}

- (id)_configuratorForZoomLevel:(int64_t)a3
{
  id v5;

  if (-[PXAssetsSectionLayoutSpec disableConfigurators](self, "disableConfigurators") || (unint64_t)(a3 - 1) > 3)
    v5 = 0;
  else
    v5 = *(id *)((char *)&self->super.super.isa + *off_1E5131708[a3 - 1]);
  return v5;
}

- (PXZoomablePhotosLayoutSpec)zoomableSpec
{
  return self->_zoomableSpec;
}

- (double)shadowCornerRadius
{
  return self->_shadowCornerRadius;
}

- (BOOL)userInterfaceStyleAllowsShadow
{
  return self->_userInterfaceStyleAllowsShadow;
}

- (int64_t)numberOfLinesForShowAllButton
{
  return self->_numberOfLinesForShowAllButton;
}

- (double)showAllButtonHeight
{
  return self->_showAllButtonHeight;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (id)gridConfigurator
{
  return -[PXAssetsSectionLayoutSpec _configuratorForZoomLevel:](self, "_configuratorForZoomLevel:", 4);
}

- (BOOL)supportsGridAspectRatioToggle
{
  void *v2;
  char v3;

  -[PXAssetsSectionLayoutSpec gridConfigurator](self, "gridConfigurator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAspectRatioToggle");

  return v3;
}

- (int64_t)numberOfGridZoomStepsWithDataSource:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PXAssetsSectionLayoutSpec gridConfigurator](self, "gridConfigurator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfZoomStepsWithDataSource:", v4);

  return v6;
}

@end
