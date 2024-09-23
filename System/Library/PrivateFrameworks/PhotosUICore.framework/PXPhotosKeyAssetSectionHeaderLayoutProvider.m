@implementation PXPhotosKeyAssetSectionHeaderLayoutProvider

- (PXPhotosKeyAssetSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4 bannerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotosKeyAssetSectionHeaderLayoutProvider *v12;
  PXPhotosKeyAssetSectionHeaderLayoutProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayoutProvider;
  v12 = -[PXPhotosKeyAssetSectionHeaderLayoutProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeWeak((id *)&v13->_viewProvider, v10);
    objc_storeStrong((id *)&v13->_bannerProvider, a5);
  }

  return v13;
}

- (PXPhotosKeyAssetSectionHeaderLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosKeyAssetSectionHeaderLayoutProvider.m"), 26, CFSTR("%s is not available as initializer"), "-[PXPhotosKeyAssetSectionHeaderLayoutProvider init]");

  abort();
}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11;
  id v12;
  PXPhotosKeyAssetSectionHeaderLayout *v13;
  void *v14;
  PXPhotosKeyAssetSectionHeaderLayout *v15;
  __int128 v16;
  void *v17;
  _OWORD v19[2];

  v11 = a6;
  v12 = a4;
  v13 = [PXPhotosKeyAssetSectionHeaderLayout alloc];
  -[PXPhotosKeyAssetSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXPhotosKeyAssetSectionHeaderLayout initWithViewModel:](v13, "initWithViewModel:", v14);

  -[PXPhotosKeyAssetSectionHeaderLayout setDataSource:](v15, "setDataSource:", v12);
  v16 = *(_OWORD *)&a5->item;
  v19[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v19[1] = v16;
  -[PXPhotosKeyAssetSectionHeaderLayout setSectionIndexPath:](v15, "setSectionIndexPath:", v19);
  -[PXPhotosKeyAssetSectionHeaderLayoutProvider bannerProvider](self, "bannerProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosKeyAssetSectionHeaderLayout setBannerProvider:](v15, "setBannerProvider:", v17);

  -[PXPhotosKeyAssetSectionHeaderLayout setSpec:](v15, "setSpec:", v11);
  *a7 = 2;
  return v15;
}

- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7
{
  id v9;
  __int128 v10;
  _OWORD v11[2];

  v9 = a4;
  objc_msgSend(v9, "setDataSource:", a5);
  v10 = *(_OWORD *)&a6->item;
  v11[0] = *(_OWORD *)&a6->dataSourceIdentifier;
  v11[1] = v10;
  objc_msgSend(v9, "setSectionIndexPath:", v11);

}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  return (PXPhotosSectionHeaderLayoutViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (PXPhotosBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
