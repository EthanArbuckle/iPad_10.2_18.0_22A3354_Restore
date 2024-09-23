@implementation PXEditorialBodyLayoutProvider

- (PXEditorialBodyLayoutProvider)initWithViewModel:(id)a3
{
  id v5;
  PXEditorialBodyLayoutProvider *v6;
  PXEditorialBodyLayoutProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXEditorialBodyLayoutProvider;
  v6 = -[PXEditorialBodyLayoutProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (PXEditorialBodyLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialBodyLayoutProvider.m"), 36, CFSTR("%s is not available as initializer"), "-[PXEditorialBodyLayoutProvider init]");

  abort();
}

- (void)setAvoidsFullWidthHeroes:(BOOL)a3
{
  id v4;

  if (self->_avoidsFullWidthHeroes != a3)
  {
    self->_avoidsFullWidthHeroes = a3;
    -[PXEditorialBodyLayoutProvider invalidationDelegate](self, "invalidationDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosSectionBodyLayoutInvalidateConfiguredLayouts:", self);

  }
}

- (void)setBodyCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  id v11;

  if (self->_bodyCornerRadius.var0.var0.topLeft != v3
    || self->_bodyCornerRadius.var0.var0.topRight != v4
    || self->_bodyCornerRadius.var0.var0.bottomLeft != v5
    || self->_bodyCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_bodyCornerRadius.var0.var0.topLeft = v3;
    self->_bodyCornerRadius.var0.var0.topRight = v4;
    self->_bodyCornerRadius.var0.var0.bottomLeft = v5;
    self->_bodyCornerRadius.var0.var0.bottomRight = v6;
    -[PXEditorialBodyLayoutProvider invalidationDelegate](self, "invalidationDelegate", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photosSectionBodyLayoutInvalidateConfiguredLayouts:", self);

  }
}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PXAssetsSectionBodyLemonadeEditorialLayoutSpec *v15;
  PXAssetsSectionBodyLemonadeEditorialLayoutSpec *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22 = v9;
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialBodyLayoutProvider.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("bodyLayout"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditorialBodyLayoutProvider.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("bodyLayout"), v19);
  }

LABEL_3:
  objc_msgSend(v22, "setDelegate:", v10);
  objc_msgSend(v22, "setMediaKind:", 2);
  objc_msgSend(v22, "setContentSource:", v10);
  objc_msgSend(v22, "setKeyItemIndex:", objc_msgSend(v10, "keyItemIndex"));
  v12 = objc_msgSend(v10, "numberOfAssets");
  if (objc_msgSend(v22, "numberOfItems") != v12)
    objc_msgSend(v22, "setNumberOfItems:", v12);
  -[PXPhotosViewModel specManager](self->_viewModel, "specManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extendedTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [PXAssetsSectionBodyLemonadeEditorialLayoutSpec alloc];
  objc_msgSend(v11, "preferredCornerRadius");
  v16 = -[PXAssetsSectionBodyLemonadeEditorialLayoutSpec initWithExtendedTraitCollection:bodyCornerRadius:](v15, "initWithExtendedTraitCollection:bodyCornerRadius:", v14);
  objc_msgSend(v22, "setSpec:", v16);

}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v10;
  PXEditorialSectionBodyLayout *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = a4;
  *a7 = 1;
  v11 = objc_alloc_init(PXEditorialSectionBodyLayout);
  if (-[PXPhotosViewModel scrollingBehavior](self->_viewModel, "scrollingBehavior") == 1)
    -[PXEditorialSectionBodyLayout setDisableClipping:](v11, "setDisableClipping:", 1);
  v12 = objc_msgSend(v10, "numberOfItemsInSection:", a5->section);
  -[PXGGeneratedLayout setPadding:](v11, "setPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  if (v12 > +[PXSmallCollectionLayoutGenerator maximumNumberOfItemsSupportedForStyle:](PXSmallCollectionLayoutGenerator, "maximumNumberOfItemsSupportedForStyle:", 0)|| -[PXPhotosViewModel gridStyle](self->_viewModel, "gridStyle") == 4)
  {
    if (-[PXEditorialBodyLayoutProvider avoidsFullWidthHeroes](self, "avoidsFullWidthHeroes"))
      v13 = 5;
    else
      v13 = 3;
  }
  else
  {
    v13 = 6;
  }
  -[PXDayAssetsSectionBodyLayout setStyle:](v11, "setStyle:", v13);

  return v11;
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->invalidationDelegate, a3);
}

- (BOOL)avoidsFullWidthHeroes
{
  return self->_avoidsFullWidthHeroes;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)bodyCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->invalidationDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
