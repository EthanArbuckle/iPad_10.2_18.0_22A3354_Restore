@implementation PXMonthCardSectionConfigurator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingHeaderSpec, 0);
}

- (PXMonthCardSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6;
  id v7;
  PXMonthCardSectionConfigurator *v8;
  PXMonthCardSectionConfigurator *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PXMonthsAssetsSectionHeaderLayoutSpec *v19;
  PXMonthsAssetsSectionHeaderLayoutSpec *floatingHeaderSpec;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXMonthCardSectionConfigurator;
  v8 = -[PXCuratedLibraryCardSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:](&v22, sel_initWithExtendedTraitCollection_assetsSectionLayoutSpec_, v6, v7);
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

    v19 = -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXMonthsAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v6, 0, objc_msgSend(v7, "variant"), v12, v14, v16, v18);
    floatingHeaderSpec = v9->_floatingHeaderSpec;
    v9->_floatingHeaderSpec = v19;

  }
  return v9;
}

- (id)createCardSpecWithExtendedTraitCollection:(id)a3
{
  id v3;
  PXMonthCardSectionBodyLayoutSpec *v4;

  v3 = a3;
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXMonthCardSectionBodyLayoutSpec alloc], "initWithExtendedTraitCollection:", v3);

  return v4;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXMonthCardSectionConfigurator;
  v3 = a3;
  -[PXCuratedLibraryCardSectionConfigurator configureAssetSectionLayout:](&v5, sel_configureAssetSectionLayout_, v3);
  PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryMonthsZoomLevelButtonTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAxLocalizedBaseLabel:", v4, v5.receiver, v5.super_class);

}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  return self->_floatingHeaderSpec;
}

+ (int64_t)zoomLevel
{
  return 2;
}

@end
