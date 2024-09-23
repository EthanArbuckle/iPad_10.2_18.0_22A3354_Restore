@implementation PXAssetsSectionConfigurator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetsSectionLayoutSpec);
}

- (PXAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v5;
  PXAssetsSectionConfigurator *v6;
  objc_super v8;

  v5 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PXAssetsSectionConfigurator;
  v6 = -[PXAssetsSectionConfigurator init](&v8, sel_init);
  if (v6)
  {
    v6->_variant = objc_msgSend(v5, "variant");
    objc_storeWeak((id *)&v6->_assetsSectionLayoutSpec, v5);
  }

  return v6;
}

- (CGRect)containerFrameForAssetSectionLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "contentSize");
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v9 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[PXAssetsSectionConfigurator containerInsets](self, "containerInsets");
    objc_msgSend(v4, "padding");
    PXEdgeInsetsInsetRect();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (UIEdgeInsets)containerInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_containerInsets.top;
  left = self->_containerInsets.left;
  bottom = self->_containerInsets.bottom;
  right = self->_containerInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)updatedHeaderLayout:(id)a3 withHeaderStyle:(int64_t)a4 forAssetSectionLayout:(id)a5
{
  id v9;
  id v10;
  PXCuratedLibrarySectionHeaderLayout *v11;
  PXCuratedLibrarySectionHeaderLayout *v12;
  void *v13;
  PXCuratedLibrarySectionHeaderLayout *v14;
  PXCuratedLibrarySectionHeaderLayout *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  SEL v27;

  v9 = a3;
  v10 = a5;
  v11 = (PXCuratedLibrarySectionHeaderLayout *)v9;
  v12 = v11;
  if ((unint64_t)(a4 - 1) < 2)
  {
    v27 = a2;
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = objc_alloc_init(PXCuratedLibrarySectionHeaderLayout);

    }
    -[PXAssetsSectionConfigurator headerSpecForHeaderStyle:assetSectionLayout:](self, "headerSpecForHeaderStyle:assetSectionLayout:", a4, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout setSpec:](v15, "setSpec:", v16);

    objc_msgSend(v10, "assetCollectionReference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout setAssetCollectionReference:](v15, "setAssetCollectionReference:", v17);
    -[PXCuratedLibrarySectionHeaderLayout setShowsDebugDescription:](v15, "setShowsDebugDescription:", objc_msgSend(v13, "showDebugInformationInFloatingHeader"));
    objc_msgSend(v10, "actionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ellipsisButtonActionPerformerWithAssetCollectionReference:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonActionPerformer:](v15, "setEllipsisButtonActionPerformer:", v19);

    objc_msgSend(v10, "actionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFilters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "px_descriptionForAssertionMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v27, self, CFSTR("PXAssetsSectionConfigurator.m"), 65, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[sectionLayout.actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]"), v25, v24);

      }
    }
    -[PXCuratedLibrarySectionHeaderLayout setShowFiltersActionPerformer:](v15, "setShowFiltersActionPerformer:", v21);

    -[PXCuratedLibrarySectionHeaderLayout setSafeAreaBehavior:](v15, "setSafeAreaBehavior:", a4 == 1);
    -[PXCuratedLibrarySectionHeaderLayout setExternalLeadingButtonConfigurations:](v15, "setExternalLeadingButtonConfigurations:", 0);

    goto LABEL_9;
  }
  v15 = v11;
  if (a4)
  {
LABEL_9:
    v11 = v15;
    a4 = (int64_t)v11;
  }

  return (id)a4;
}

- (PXAssetsSectionConfigurator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionConfigurator.m"), 23, CFSTR("%s is not available as initializer"), "-[PXAssetsSectionConfigurator init]");

  abort();
}

- (PXAssetsSectionLayoutSpec)assetsSectionLayoutSpec
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_assetsSectionLayoutSpec);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionConfigurator.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsSectionLayoutSpec != nil"));

  }
  return (PXAssetsSectionLayoutSpec *)WeakRetained;
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionConfigurator.m"), 42, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetsSectionConfigurator headerSpecForHeaderStyle:assetSectionLayout:]", v9);

  abort();
}

- (void)configureAssetSectionLayout:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionConfigurator.m"), 80, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetsSectionConfigurator configureAssetSectionLayout:]", v8);

  abort();
}

- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6
{
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionConfigurator.m"), 101, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetsSectionConfigurator estimatedSizeOfSectionForAssetCollection:isCurated:numberOfAssets:referenceSize:]", v11);

  abort();
}

- (int64_t)numberOfZoomStepsWithDataSource:(id)a3
{
  return 0;
}

- (int64_t)initialZoomStep
{
  return 0;
}

- (BOOL)supportsAspectRatioToggle
{
  return 0;
}

- (int64_t)variant
{
  return self->_variant;
}

@end
