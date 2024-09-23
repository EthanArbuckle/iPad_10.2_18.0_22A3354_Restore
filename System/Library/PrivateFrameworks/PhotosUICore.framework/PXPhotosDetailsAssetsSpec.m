@implementation PXPhotosDetailsAssetsSpec

- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXPhotosDetailsAssetsSpec initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, a4, 0);
}

- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return -[PXPhotosDetailsAssetsSpec initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, 0, a4);
}

- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  id v8;
  PXPhotosDetailsAssetsSpec *v9;
  PXPhotosDetailsAssetsSpec *v10;
  PXWidgetSpec *v11;
  PXWidgetSpec *widgetSpec;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  double v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDetailsAssetsSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v20, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_detailsOptions = a5;
    v11 = -[PXWidgetSpec initWithExtendedTraitCollection:detailsOptions:]([PXWidgetSpec alloc], "initWithExtendedTraitCollection:detailsOptions:", v8, a5);
    widgetSpec = v10->__widgetSpec;
    v10->__widgetSpec = v11;

    -[PXWidgetSpec contentGuideInsets](v10->__widgetSpec, "contentGuideInsets");
    v10->_contentGuideInsets.top = v13;
    v10->_contentGuideInsets.left = v14;
    v10->_contentGuideInsets.bottom = v15;
    v10->_contentGuideInsets.right = v16;
    if (!-[PXFeatureSpec shouldInsetAllPhotoDetailsContent](v10, "shouldInsetAllPhotoDetailsContent"))
    {
      v10->_contentGuideInsets.right = 0.0;
      v10->_contentGuideInsets.left = 0.0;
    }
    v10->_shouldShowTitle = (a5 & 8) == 0;
    v10->_defaultCornerRadius = 0.0;
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interitemSpacingForDays");
    v10->_exploreInteritemSpacing = v18;

    if (objc_msgSend(v8, "userInterfaceIdiom") == 5)
    {
      v10->_defaultCornerRadius = 2.0;
      v10->_shouldShowTitle = 0;
      v10->_exploreInteritemSpacing = 2.0;
    }
    -[PXPhotosDetailsAssetsSpec _computeSpecWithExtendedTraitCollection:](v10, "_computeSpecWithExtendedTraitCollection:", v8);
  }

  return v10;
}

- (void)_computeSpecWithExtendedTraitCollection:(id)a3
{
  id v4;

  v4 = a3;
  -[PXPhotosDetailsAssetsSpec _computeEditorialWithExtendedTraitCollection:](self, "_computeEditorialWithExtendedTraitCollection:", v4);
  -[PXPhotosDetailsAssetsSpec _computeGridWithExtendedTraitCollection:](self, "_computeGridWithExtendedTraitCollection:", v4);

}

- (void)_computeEditorialWithExtendedTraitCollection:(id)a3
{
  int64_t *p_editorialNumberOfColumns;
  double v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "userInterfaceIdiom") == 1 && objc_msgSend(v11, "layoutOrientation") == 1)
  {
    p_editorialNumberOfColumns = &self->_editorialNumberOfColumns;
    self->_editorialNumberOfColumns = 3;
    v5 = 2.0;
LABEL_9:
    v7 = v11;
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "userInterfaceIdiom") != 2)
  {
    p_editorialNumberOfColumns = &self->_editorialNumberOfColumns;
    self->_editorialNumberOfColumns = 5;
    v5 = 3.0;
    goto LABEL_9;
  }
  p_editorialNumberOfColumns = &self->_editorialNumberOfColumns;
  v6 = objc_msgSend(v11, "layoutSizeClass") == 1;
  v7 = v11;
  if (v6)
  {
    *p_editorialNumberOfColumns = 3;
    v5 = 2.0;
  }
  else
  {
    *p_editorialNumberOfColumns = 5;
    v5 = 3.0;
  }
LABEL_10:
  self->_editorialInterTileSpacing = v5;
  if (objc_msgSend(v7, "userInterfaceIdiom") == 3)
    self->_editorialInterTileSpacing = 50.0;
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "editorialLayoutEdit");

  if (v9)
  {
    +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *p_editorialNumberOfColumns = objc_msgSend(v10, "editorialLayoutColumns");

  }
}

- (void)_computeGridWithExtendedTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  int64_t v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutReferenceSize");
  v7 = v6;
  -[PXPhotosDetailsAssetsSpec contentGuideInsets](self, "contentGuideInsets");
  v10 = v7 - (v8 + v9);
  v11 = objc_msgSend((id)objc_opt_class(), "shouldUsePhoneLayoutWithTraitCollection:", v5);
  v12 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v12 == 2)
  {
    v22 = *MEMORY[0x1E0DC49E8];
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v16 = (v10 - v21 - v18 + -200.0) / 5.0;
    v17 = 50.0;
    v20 = 1;
LABEL_10:
    v15 = v16;
    goto LABEL_11;
  }
  if (!v11)
  {
    if (-[PXFeatureSpec shouldInsetAllPhotoDetailsContent](self, "shouldInsetAllPhotoDetailsContent"))
    {
      v22 = *(double *)off_1E50B8020;
      v21 = *((double *)off_1E50B8020 + 1);
      v19 = *((double *)off_1E50B8020 + 2);
      v18 = *((double *)off_1E50B8020 + 3);
    }
    else
    {
      -[PXPhotosDetailsAssetsSpec _widgetSpec](self, "_widgetSpec");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentGuideInsets");
      PXEdgeInsetsForEdges();
      v22 = v24;
      v21 = v25;
      v19 = v26;
      v18 = v27;

    }
    v28 = v10 - (v18 + v21);
    v29 = (v28 + 12.0) / 144.0;
    v30 = vcvtmd_s64_f64(v29);
    v31 = (double)(uint64_t)floor(v29);
    v16 = 132.0;
    v32 = (double)(uint64_t)(v30 - 1);
    v17 = (v28 - v31 * 132.0) / v32;
    v20 = 0;
    if (v17 > 20.0)
    {
      v16 = floor(v28 + v32 * -20.0) / v31;
      v17 = (v28 + -v31 * v16) / v32;
    }
    goto LABEL_10;
  }
  v13 = +[PXLayoutMetricInterpolator photosGridLayoutColumnsForWidth:](PXLayoutMetricInterpolator, "photosGridLayoutColumnsForWidth:", v10);
  objc_msgSend(v4, "displayScale");
  v33 = 0.0;
  v34 = 0.0;
  +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:](PXLayoutMetricInterpolator, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v13, &v34, &v33, v10, v14);
  v18 = v33;
  v17 = v34;
  v19 = 0.0;
  v20 = 1;
  v21 = v33;
  v22 = 0.0;
LABEL_11:
  self->_gridInterItemSpacing.width = v17;
  self->_gridInterItemSpacing.height = v17;
  self->_gridContentInsets.top = v22;
  self->_gridContentInsets.left = v21;
  self->_gridContentInsets.bottom = v19;
  self->_gridContentInsets.right = v18;
  self->_gridItemSize.width = v15;
  self->_gridItemSize.height = v16;
  self->_gridContentMode = v20;
  self->_enableBadges = v12 != 2;

}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentGuideInsets.top;
  left = self->_contentGuideInsets.left;
  bottom = self->_contentGuideInsets.bottom;
  right = self->_contentGuideInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)shouldShowTitle
{
  return self->_shouldShowTitle;
}

- (int64_t)editorialNumberOfColumns
{
  return self->_editorialNumberOfColumns;
}

- (double)editorialInterTileSpacing
{
  return self->_editorialInterTileSpacing;
}

- (BOOL)enableBadges
{
  return self->_enableBadges;
}

- (CGSize)gridInterItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_gridInterItemSpacing.width;
  height = self->_gridInterItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)gridContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridContentInsets.top;
  left = self->_gridContentInsets.left;
  bottom = self->_gridContentInsets.bottom;
  right = self->_gridContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)gridItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_gridItemSize.width;
  height = self->_gridItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)gridContentMode
{
  return self->_gridContentMode;
}

- (double)exploreInteritemSpacing
{
  return self->_exploreInteritemSpacing;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (PXWidgetSpec)_widgetSpec
{
  return self->__widgetSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__widgetSpec, 0);
}

+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 1 || objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

@end
