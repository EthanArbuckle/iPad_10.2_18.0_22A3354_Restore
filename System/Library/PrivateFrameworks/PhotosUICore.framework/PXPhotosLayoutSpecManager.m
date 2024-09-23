@implementation PXPhotosLayoutSpecManager

- (PXPhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 enableSectionHeaders:(BOOL)a5
{
  id v8;
  PXPhotosLayoutSpecManager *v9;
  PXPhotosLayoutSpecManager *v10;
  uint64_t v11;
  PXPhotosHeaderCustomizationModel *headerCustomizationModel;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosLayoutSpecManager;
  v9 = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v14, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_sectionHeadersEnabled = a5;
    objc_msgSend(v8, "headerCustomizationModel");
    v11 = objc_claimAutoreleasedReturnValue();
    headerCustomizationModel = v10->_headerCustomizationModel;
    v10->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v11;

  }
  return v10;
}

- (PXPhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXPhotosLayoutSpecManager initWithExtendedTraitCollection:options:enableSectionHeaders:](self, "initWithExtendedTraitCollection:options:enableSectionHeaders:", a3, a4, 0);
}

- (Class)specClass
{
  -[PXPhotosLayoutSpecManager sectionHeadersEnabled](self, "sectionHeadersEnabled");
  return (Class)(id)objc_opt_class();
}

- (id)createSpec
{
  void *v3;
  void *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(-[PXPhotosLayoutSpecManager specClass](self, "specClass")), "initWithExtendedTraitCollection:options:gridStyle:wantsToggleSidebarButton:shouldMakeSpaceForToggleSidebarButton:", v3, -[PXFeatureSpecManager options](self, "options"), -[PXPhotosLayoutSpecManager gridStyle](self, "gridStyle"), -[PXPhotosLayoutSpecManager wantsToggleSidebarButton](self, "wantsToggleSidebarButton"), -[PXPhotosLayoutSpecManager shouldMakeSpaceForToggleSidebarButton](self, "shouldMakeSpaceForToggleSidebarButton"));

  return v4;
}

- (void)setGridStyle:(int64_t)a3
{
  if (self->_gridStyle != a3)
  {
    self->_gridStyle = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setWantsToggleSidebarButton:(BOOL)a3
{
  if (self->_wantsToggleSidebarButton != a3)
  {
    self->_wantsToggleSidebarButton = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setShouldMakeSpaceForToggleSidebarButton:(BOOL)a3
{
  if (self->_shouldMakeSpaceForToggleSidebarButton != a3)
  {
    self->_shouldMakeSpaceForToggleSidebarButton = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  v6 = a3;
  if ((-[PXFeatureSpecManager options](self, "options") & 2) != 0)
  {
    v7 = ((-[PXFeatureSpecManager defaultChangesToUpdateFor](self, "defaultChangesToUpdateFor") & 0xFFFFFFFFFFFF5CFFLL | 0xA000) & a4) != 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXPhotosLayoutSpecManager;
    v7 = -[PXFeatureSpecManager shouldUpdateSpecForExtendedTraitCollection:change:](&v9, sel_shouldUpdateSpecForExtendedTraitCollection_change_, v6, a4);
  }

  return v7;
}

- (NSArray)availableThumbnailSizes
{
  return self->_availableThumbnailSizes;
}

- (void)setAvailableThumbnailSizes:(id)a3
{
  objc_storeStrong((id *)&self->_availableThumbnailSizes, a3);
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (BOOL)sectionHeadersEnabled
{
  return self->_sectionHeadersEnabled;
}

- (BOOL)wantsToggleSidebarButton
{
  return self->_wantsToggleSidebarButton;
}

- (BOOL)shouldMakeSpaceForToggleSidebarButton
{
  return self->_shouldMakeSpaceForToggleSidebarButton;
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
}

@end
