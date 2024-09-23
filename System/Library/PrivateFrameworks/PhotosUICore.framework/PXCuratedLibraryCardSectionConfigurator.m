@implementation PXCuratedLibraryCardSectionConfigurator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSpec, 0);
}

- (PXCuratedLibraryCardSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6;
  PXCuratedLibraryCardSectionConfigurator *v7;
  PXCuratedLibraryCardSectionConfigurator *v8;
  uint64_t v9;
  PXCuratedLibraryCardSectionBodyLayoutSpec *cardSpec;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryCardSectionConfigurator;
  v7 = -[PXAssetsSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:](&v12, sel_initWithExtendedTraitCollection_assetsSectionLayoutSpec_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[PXCuratedLibraryCardSectionConfigurator createCardSpecWithExtendedTraitCollection:](v7, "createCardSpecWithExtendedTraitCollection:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    cardSpec = v8->_cardSpec;
    v8->_cardSpec = (PXCuratedLibraryCardSectionBodyLayoutSpec *)v9;

  }
  return v8;
}

- (PXCuratedLibraryCardSectionBodyLayoutSpec)cardSpec
{
  return self->_cardSpec;
}

- (id)createCardSpecWithExtendedTraitCollection:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryCardSectionConfigurator.m"), 32, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCuratedLibraryCardSectionConfigurator createCardSpecWithExtendedTraitCollection:]", v8);

  abort();
}

- (UIEdgeInsets)containerInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[PXCuratedLibraryCardSectionConfigurator cardSpec](self, "cardSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "padding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXCuratedLibraryCardSectionBodyLayout *v8;
  PXCuratedLibraryCardSectionBodyLayout *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  id v24;
  void *v25;
  void *v26;
  PXCuratedLibraryCardSectionBodyLayout *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];
  int64x2_t v33;
  _QWORD v34[2];
  int64x2_t v35;
  _QWORD v36[2];
  int64x2_t v37;

  v4 = a3;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionConfigurator updatedHeaderLayout:withHeaderStyle:forAssetSectionLayout:](self, "updatedHeaderLayout:withHeaderStyle:forAssetSectionLayout:", v6, 2, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bodyContentLayout");
  v8 = (PXCuratedLibraryCardSectionBodyLayout *)(id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_alloc_init(PXCuratedLibraryCardSectionBodyLayout);

    -[PXGLayout setContentSource:](v9, "setContentSource:", v9);
  }
  v31 = objc_msgSend(v4, "section");
  objc_msgSend(v4, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = objc_msgSend(v12, "identifier");
  v36[1] = objc_msgSend(v4, "section");
  v37 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  -[PXCuratedLibraryCardSectionBodyLayout setIsSelected:](v9, "setIsSelected:", objc_msgSend(v11, "containsIndexPath:", v36));

  -[PXCuratedLibraryCardSectionConfigurator cardSpec](self, "cardSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryCardSectionBodyLayout setSpec:](v9, "setSpec:", v13);

  -[PXCuratedLibraryCardSectionBodyLayout setIsSkimming:](v9, "setIsSkimming:", objc_msgSend(v4, "isSkimming"));
  objc_msgSend(v4, "skimmingIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryCardSectionBodyLayout setSkimmingIndexPaths:](v9, "setSkimmingIndexPaths:", v14);

  -[PXCuratedLibraryCardSectionBodyLayout setMaxSkimmingIndex:](v9, "setMaxSkimmingIndex:", objc_msgSend(v4, "maxSkimmingIndex"));
  -[PXCuratedLibraryCardSectionBodyLayout setCurrentSkimmingIndex:](v9, "setCurrentSkimmingIndex:", objc_msgSend(v4, "currentSkimmingIndex"));
  if (objc_msgSend(v4, "showsSkimmingInteraction"))
  {
    -[PXCuratedLibraryCardSectionBodyLayout assetFrame](v9, "assetFrame");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v5, "skimmingScale");
    v20 = (1.0 - v19) * 0.5;
    v21 = v16 * v20;
    v22 = v18 * v20;
  }
  else
  {
    v22 = *(double *)off_1E50B8020;
    v21 = *((double *)off_1E50B8020 + 1);
  }
  objc_msgSend(v4, "setPadding:", v22, v21);
  if (objc_msgSend(v4, "showsSkimmingSlideshow")
    && (objc_msgSend(v4, "showsSkimmingInteraction") & 1) == 0)
  {
    -[PXCuratedLibraryCardSectionBodyLayout dataSource](v9, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = objc_msgSend(v30, "identifier");
    v34[1] = -[PXCuratedLibraryCardSectionBodyLayout section](v9, "section");
    v35 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v4, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = objc_msgSend(v23, "identifier");
    v32[1] = objc_msgSend(v4, "section");
    v33 = v35;
    v24 = (id)objc_msgSend(v4, "createCuratedLibraryLayoutSkimmingSlideshowAnimationFromSectionIndexPath:toSectionIndexPath:", v34, v32);

  }
  objc_msgSend(v4, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryCardSectionBodyLayout setDataSource:section:](v9, "setDataSource:section:", v25, v31);

  -[PXCuratedLibraryCardSectionBodyLayout setZoomLevel:](v9, "setZoomLevel:", objc_msgSend(v4, "zoomLevel"));
  objc_msgSend(v4, "inlinePlaybackController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryCardSectionBodyLayout setInlinePlaybackController:](v9, "setInlinePlaybackController:", v26);

  v27 = v9;
  objc_msgSend(v4, "setMode:", 4);
  objc_msgSend(v4, "setWantsShadow:", 1);
  objc_msgSend(v4, "setShowAllActionPerformer:", 0);
  -[PXCuratedLibraryCardSectionBodyLayout assetLayoutGuide](v27, "assetLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeaderLayoutGuide:", v28);

  -[PXAssetsSectionConfigurator assetsSectionLayoutSpec](self, "assetsSectionLayoutSpec");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpec:", v29);

  objc_msgSend(v4, "setHeaderLayout:", v7);
  objc_msgSend(v4, "setBodyContentLayout:wantsDecoration:", v27, 1);

}

@end
