@implementation PXYearAssetsSectionConfigurator

- (PXYearAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6;
  id v7;
  PXYearAssetsSectionConfigurator *v8;
  PXYearAssetsSectionConfigurator *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PXYearAssetsSkimmingSectionHeaderLayoutSpec *v19;
  PXYearAssetsSkimmingSectionHeaderLayoutSpec *skimmingHeaderSpec;
  PXYearAssetsSectionHeaderLayoutSpec *v21;
  PXYearAssetsSectionHeaderLayoutSpec *normalHeaderSpec;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PXYearAssetsSectionConfigurator;
  v8 = -[PXCuratedLibraryCardSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:](&v24, sel_initWithExtendedTraitCollection_assetsSectionLayoutSpec_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[PXCuratedLibraryCardSectionConfigurator cardSpec](v8, "cardSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "padding");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = -[PXYearAssetsSkimmingSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXYearAssetsSkimmingSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v6, 0, objc_msgSend(v7, "variant"), v12, v14, v16, v18);
    skimmingHeaderSpec = v9->_skimmingHeaderSpec;
    v9->_skimmingHeaderSpec = v19;

    v21 = -[PXYearAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXYearAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v6, 0, objc_msgSend(v7, "variant"), v12, v14, v16, v18);
    normalHeaderSpec = v9->_normalHeaderSpec;
    v9->_normalHeaderSpec = v21;

  }
  return v9;
}

- (id)createCardSpecWithExtendedTraitCollection:(id)a3
{
  id v3;
  PXYearCardSectionBodyLayoutSpec *v4;

  v3 = a3;
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXYearCardSectionBodyLayoutSpec alloc], "initWithExtendedTraitCollection:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalHeaderSpec, 0);
  objc_storeStrong((id *)&self->_skimmingHeaderSpec, 0);
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXYearAssetsSectionConfigurator;
  -[PXCuratedLibraryCardSectionConfigurator configureAssetSectionLayout:](&v14, sel_configureAssetSectionLayout_, v5);
  objc_msgSend(v5, "headerLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFloating");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "headerLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXYearAssetsSectionConfigurator.m"), 39, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("sectionLayout.headerLayout"), v12, v13);

      }
    }
    objc_msgSend(v8, "setEllipsisButtonActionPerformer:", 0);

  }
  PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryYearsZoomLevelButtonTitle"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAxLocalizedBaseLabel:", v9);

}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  id v5;
  int *v6;
  id v7;

  v5 = a4;
  v6 = &OBJC_IVAR___PXYearAssetsSectionConfigurator__skimmingHeaderSpec;
  if ((objc_msgSend(v5, "showsSkimmingInteraction") & 1) == 0
    && !objc_msgSend(v5, "showsSkimmingSlideshow"))
  {
    v6 = &OBJC_IVAR___PXYearAssetsSectionConfigurator__normalHeaderSpec;
  }
  v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

@end
