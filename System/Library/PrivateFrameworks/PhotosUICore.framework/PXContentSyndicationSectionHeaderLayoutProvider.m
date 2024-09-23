@implementation PXContentSyndicationSectionHeaderLayoutProvider

- (PXContentSyndicationSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  id v7;
  id v8;
  PXContentSyndicationSectionHeaderLayoutProvider *v9;
  PXContentSyndicationSectionHeaderLayoutProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXContentSyndicationSectionHeaderLayoutProvider;
  v9 = -[PXContentSyndicationSectionHeaderLayoutProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_viewProvider, v8);
  }

  return v10;
}

- (PXContentSyndicationSectionHeaderLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationSectionHeaderLayoutProvider.m"), 67, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationSectionHeaderLayoutProvider init]");

  abort();
}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _PXContentSyndicationSectionHeaderLayout *v16;
  void *v17;
  void *v18;
  __int128 v19;
  double v20;
  _OWORD v22[2];

  v11 = a6;
  v12 = a4;
  +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syndicationItemsDataSourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "socialLayerHighlightProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_PXContentSyndicationSectionHeaderLayout initWithSpec:socialLayerHighlightProvider:]([_PXContentSyndicationSectionHeaderLayout alloc], "initWithSpec:socialLayerHighlightProvider:", v11, v15);

  -[PXContentSyndicationSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assetCollectionActionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXContentSyndicationSectionHeaderLayout setAssetCollectionManager:](v16, "setAssetCollectionManager:", v18);

  -[_PXContentSyndicationSectionHeaderLayout setDataSource:](v16, "setDataSource:", v12);
  v19 = *(_OWORD *)&a5->item;
  v22[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v22[1] = v19;
  -[_PXContentSyndicationSectionHeaderLayout setSectionIndexPath:](v16, "setSectionIndexPath:", v22);
  -[PXGSingleViewLayout setStyle:](v16, "setStyle:", 0);
  LODWORD(v20) = -1080452710;
  -[PXGSingleViewLayout setZPosition:](v16, "setZPosition:", v20);
  *a7 = 1;

  return v16;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
