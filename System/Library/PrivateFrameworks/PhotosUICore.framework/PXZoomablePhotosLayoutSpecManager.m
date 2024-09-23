@implementation PXZoomablePhotosLayoutSpecManager

uint64_t __64__PXZoomablePhotosLayoutSpecManager_setAvailableThumbnailSizes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "CGSizeValue");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "CGSizeValue");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)createSpec
{
  PXZoomablePhotosLayoutSpec *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int64_t v7;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PXZoomablePhotosLayoutSpec *v17;

  v3 = [PXZoomablePhotosLayoutSpec alloc];
  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXFeatureSpecManager options](self, "options");
  -[PXZoomablePhotosLayoutSpecManager availableThumbnailSizes](self, "availableThumbnailSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXZoomablePhotosLayoutSpecManager gridStyle](self, "gridStyle");
  -[PXZoomablePhotosLayoutSpecManager itemAspectRatio](self, "itemAspectRatio");
  v9 = v8;
  -[PXZoomablePhotosLayoutSpecManager userDefaults](self, "userDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXZoomablePhotosLayoutSpecManager forceSaliency](self, "forceSaliency");
  v12 = -[PXZoomablePhotosLayoutSpecManager preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle");
  -[PXZoomablePhotosLayoutSpecManager additionalAspectFitEdgeMargins](self, "additionalAspectFitEdgeMargins");
  v17 = -[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:](v3, "initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:", v4, v5, v6, v7, v10, v11, v9, v13, v14, v15, v16, v12, -[PXZoomablePhotosLayoutSpecManager overrideDefaultNumberOfColumns](self, "overrideDefaultNumberOfColumns"));

  return v17;
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  __int16 v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = (v4 & 0x10) != 0 && objc_msgSend(v5, "layoutSizeClass") == 2 || (v4 & 0xBC12) != 0;

  return v7;
}

- (PXZoomablePhotosUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (BOOL)forceSaliency
{
  return self->_forceSaliency;
}

- (NSArray)availableThumbnailSizes
{
  return self->_availableThumbnailSizes;
}

- (UIEdgeInsets)additionalAspectFitEdgeMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalAspectFitEdgeMargins.top;
  left = self->_additionalAspectFitEdgeMargins.left;
  bottom = self->_additionalAspectFitEdgeMargins.bottom;
  right = self->_additionalAspectFitEdgeMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setUserDefaults:(id)a3
{
  PXZoomablePhotosUserDefaults *v5;
  PXZoomablePhotosUserDefaults *v6;

  v5 = (PXZoomablePhotosUserDefaults *)a3;
  if (self->_userDefaults != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userDefaults, a3);
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
    v5 = v6;
  }

}

- (void)setAvailableThumbnailSizes:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *obj;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_118650);
  obj = (NSArray *)objc_claimAutoreleasedReturnValue();
  v4 = self->_availableThumbnailSizes;
  if (v4 == obj)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", obj);

    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_availableThumbnailSizes, obj);
      -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
    }
  }

}

- (PXZoomablePhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXZoomablePhotosLayoutSpecManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXZoomablePhotosLayoutSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v5, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_itemAspectRatio = 1.0;
  return result;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (void)setGridStyle:(int64_t)a3
{
  if (self->_gridStyle != a3)
  {
    self->_gridStyle = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setPreferredUserInterfaceStyleForInlineAddButton:(int64_t)a3
{
  if (self->_preferredUserInterfaceStyle != a3)
  {
    self->_preferredUserInterfaceStyle = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setItemAspectRatio:(double)a3
{
  if (self->_itemAspectRatio != a3)
  {
    self->_itemAspectRatio = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setForceSaliency:(BOOL)a3
{
  if (self->_forceSaliency != a3)
  {
    self->_forceSaliency = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setAdditionalAspectFitEdgeMargins:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_additionalAspectFitEdgeMargins;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_additionalAspectFitEdgeMargins = &self->_additionalAspectFitEdgeMargins;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_additionalAspectFitEdgeMargins->top = top;
    p_additionalAspectFitEdgeMargins->left = left;
    p_additionalAspectFitEdgeMargins->bottom = bottom;
    p_additionalAspectFitEdgeMargins->right = right;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
