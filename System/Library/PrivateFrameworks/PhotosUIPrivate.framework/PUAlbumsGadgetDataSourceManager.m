@implementation PUAlbumsGadgetDataSourceManager

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PUAlbumsGadgetDataSourceManager)initWithTraitCollection:(id)a3 sessionInfo:(id)a4 photoLibrary:(id)a5 libraryFilterState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PUAlbumsGadgetDataSourceManager *v15;
  PUAlbumsGadgetDataSourceManager *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PUAlbumsGadgetDataSourceManager;
  v15 = -[PXGadgetDataSourceManager init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a5);
    objc_storeStrong((id *)&v16->_libraryFilterState, a6);
    objc_storeStrong((id *)&v16->_traitCollection, a3);
    objc_storeStrong((id *)&v16->_sessionInfo, a4);
    objc_msgSend(v14, "registerChangeObserver:context:", v16, PXLibraryFilterStateObservationContext);
  }

  return v16;
}

- (void)removeCachedProviders
{
  NSArray *providers;
  objc_super v4;

  providers = self->_providers;
  self->_providers = 0;

  v4.receiver = self;
  v4.super_class = (Class)PUAlbumsGadgetDataSourceManager;
  -[PXGadgetDataSourceManager removeCachedProviders](&v4, sel_removeCachedProviders);
}

- (id)gadgetProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(void *, uint64_t);
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSArray *v22;
  id v23;
  id v24;
  void (**v25)(void *, _QWORD);
  NSArray *providers;
  NSArray *v27;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  PUAlbumsGadgetDataSourceManager *v33;
  NSArray *v34;
  BOOL v35;
  char v36;
  char v37;
  _QWORD aBlock[4];
  id v39;
  PUAlbumsGadgetDataSourceManager *v40;
  id v41;

  if (!-[NSArray count](self->_providers, "count"))
  {
    -[PUAlbumsGadgetDataSourceManager traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v5 != 0;

    -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetAlbumName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = 1;
    }
    else
    {
      -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetAlbum");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v8 = 1;
      }
      else
      {
        -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "excludesHiddenAlbum");

      }
    }

    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__PUAlbumsGadgetDataSourceManager_gadgetProviders__block_invoke;
    aBlock[3] = &unk_1E589C6E8;
    v13 = v3;
    v39 = v13;
    v40 = self;
    v14 = v4;
    v41 = v14;
    v15 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "excludesSharedAlbums");

    v15[2](v15, 1);
    if ((v17 & 1) == 0)
      v15[2](v15, 2);
    v15[2](v15, 3);
    v15[2](v15, 4);
    v15[2](v15, 5);
    -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isLimitedLibraryPicker");

    -[PUAlbumsGadgetDataSourceManager sessionInfo](self, "sessionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "assetsFilterPredicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __50__PUAlbumsGadgetDataSourceManager_gadgetProviders__block_invoke_2;
    v30[3] = &unk_1E589C710;
    v35 = v29;
    v36 = v19;
    v31 = v13;
    v32 = v21;
    v37 = v8;
    v33 = self;
    v22 = (NSArray *)v14;
    v34 = v22;
    v23 = v21;
    v24 = v13;
    v25 = (void (**)(void *, _QWORD))_Block_copy(v30);
    v25[2](v25, 0);
    v25[2](v25, 1);
    providers = self->_providers;
    self->_providers = v22;
    v27 = v22;

  }
  return self->_providers;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXLibraryFilterStateObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumsGadgetDataSourceManager.m"), 110, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PUAlbumsGadgetDataSourceManager removeCachedProviders](self, "removeCachedProviders");
    -[PXGadgetDataSourceManager invalidateGadgets](self, "invalidateGadgets");
    v9 = v11;
  }

}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (NSArray)providers
{
  return self->_providers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

void __50__PUAlbumsGadgetDataSourceManager_gadgetProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  PUHorizontalAlbumListGadgetProvider *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PUHorizontalAlbumListGadgetProvider *v8;

  v4 = [PUHorizontalAlbumListGadgetProvider alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUHorizontalAlbumListGadgetProvider initWithType:extendedTraitCollection:sessionInfo:photoLibrary:](v4, "initWithType:extendedTraitCollection:sessionInfo:photoLibrary:", a2, v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
}

void __50__PUAlbumsGadgetDataSourceManager_gadgetProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0D7B618]);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6 = *(unsigned __int8 *)(a1 + 65);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(unsigned __int8 *)(a1 + 66);
  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithType:extendedTraitCollection:isPresentedInPicker:isLimitedLibraryPicker:assetsFilterPredicate:excludesHiddenAlbum:photoLibrary:", a2, v7, v5, v6, v8, v9, v10);

  objc_msgSend(v11, "setShouldShowNavigationListOnIpad:", 1);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);

}

@end
