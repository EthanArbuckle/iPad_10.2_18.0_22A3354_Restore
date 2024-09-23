@implementation PXMonthChapterSectionConfigurator

- (PXMonthChapterSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6;
  PXMonthChapterSectionConfigurator *v7;
  PXCuratedLibraryChapterHeaderLayoutSpec *v8;
  PXCuratedLibraryChapterHeaderLayoutSpec *chapterHeaderSpec;
  PXMonthCardSectionBodyLayoutSpec *v10;
  PXMonthCardSectionBodyLayoutSpec *cardBodySpec;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXMonthChapterSectionConfigurator;
  v7 = -[PXAssetsSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:](&v13, sel_initWithExtendedTraitCollection_assetsSectionLayoutSpec_, v6, a4);
  if (v7)
  {
    v8 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXCuratedLibraryChapterHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:", v6);
    chapterHeaderSpec = v7->_chapterHeaderSpec;
    v7->_chapterHeaderSpec = v8;

    v10 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXMonthCardSectionBodyLayoutSpec alloc], "initWithExtendedTraitCollection:", v6);
    cardBodySpec = v7->_cardBodySpec;
    v7->_cardBodySpec = v10;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardBodySpec, 0);
  objc_storeStrong((id *)&self->_chapterHeaderSpec, 0);
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  return 0;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "headerLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMonthChapterSectionConfigurator updatedHeaderLayout:withHeaderStyle:forAssetSectionLayout:](self, "updatedHeaderLayout:withHeaderStyle:forAssetSectionLayout:", v5, 2, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  objc_msgSend(v4, "setMode:", 0);
  objc_msgSend(v4, "setWantsShadow:", 0);
  objc_msgSend(v4, "setShowAllActionPerformer:", 0);
  objc_msgSend(v4, "setHeaderLayoutGuide:", 0);
  -[PXAssetsSectionConfigurator assetsSectionLayoutSpec](self, "assetsSectionLayoutSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpec:", v6);

  objc_msgSend(v4, "setHeaderLayout:", v7);
  objc_msgSend(v4, "setBodyContentLayout:wantsDecoration:", 0, 0);

}

- (id)updatedHeaderLayout:(id)a3 withHeaderStyle:(int64_t)a4 forAssetSectionLayout:(id)a5
{
  id v7;
  id v8;
  PXCuratedLibraryChapterHeaderLayout *v9;
  PXCuratedLibraryChapterHeaderLayout *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  v7 = a3;
  v8 = a5;
  v9 = (PXCuratedLibraryChapterHeaderLayout *)v7;
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = objc_alloc_init(PXCuratedLibraryChapterHeaderLayout);

  }
  objc_msgSend(v8, "assetCollectionReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout setAssetCollectionReference:](v10, "setAssetCollectionReference:", v11);

  if (v8)
  {
    objc_msgSend(v8, "sectionIndexPath");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  v15[0] = v16;
  v15[1] = v17;
  -[PXCuratedLibraryChapterHeaderLayout setSectionIndexPath:](v10, "setSectionIndexPath:", v15);
  -[PXMonthChapterSectionConfigurator cardBodySpec](self, "cardBodySpec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "padding");
  -[PXCuratedLibraryChapterHeaderLayout setPadding:](v10, "setPadding:");

  -[PXMonthChapterSectionConfigurator chapterHeaderSpec](self, "chapterHeaderSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout setSpec:](v10, "setSpec:", v13);

  return v10;
}

- (PXCuratedLibraryChapterHeaderLayoutSpec)chapterHeaderSpec
{
  return self->_chapterHeaderSpec;
}

- (PXMonthCardSectionBodyLayoutSpec)cardBodySpec
{
  return self->_cardBodySpec;
}

@end
