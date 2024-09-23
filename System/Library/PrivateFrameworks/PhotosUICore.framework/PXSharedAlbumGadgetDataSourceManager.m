@implementation PXSharedAlbumGadgetDataSourceManager

- (PXSharedAlbumGadgetDataSourceManager)initWithGadgetProviders:(id)a3
{
  id v5;
  PXSharedAlbumGadgetDataSourceManager *v6;
  PXSharedAlbumGadgetDataSourceManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedAlbumGadgetDataSourceManager;
  v6 = -[PXGadgetDataSourceManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gadgetProviders, a3);

  return v7;
}

- (id)gadgetSortComparator
{
  return &__block_literal_global_81621;
}

- (id)gadgetProviders
{
  return self->_gadgetProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetProviders, 0);
}

uint64_t __60__PXSharedAlbumGadgetDataSourceManager_gadgetSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "gadgetType");
  if (v6 == objc_msgSend(v5, "gadgetType"))
  {
    if (v6 == 3)
    {
      objc_msgSend(v4, "invitationSectionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invitationSectionInfo");
    }
    else
    {
      objc_msgSend(v4, "assetsSectionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetsSectionInfo");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "compare:", v10);

  }
  else if (v6 == 3)
  {
    v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
