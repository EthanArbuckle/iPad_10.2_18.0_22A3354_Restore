@implementation PXFilterFooterController

- (PXFilterFooterController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFilterFooterController.m"), 38, CFSTR("%s is not available as initializer"), "-[PXFilterFooterController init]");

  abort();
}

- (PXFilterFooterController)initWithActionManager:(id)a3 photoLibrary:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXFilterFooterController *v11;
  PXFilterFooterController *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFilterFooterController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionManager"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFilterFooterController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXFilterFooterController;
  v11 = -[PXFilterFooterController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionManager, a3);
    objc_storeStrong((id *)&v12->_photoLibrary, a4);
  }

  return v12;
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
  id v5;
  PXLibraryFilterState *v6;

  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, a3);
  v5 = a3;
  -[PXFilterFooterView setSharedLibraryStatusProvider:](self->_footerFilterView, "setSharedLibraryStatusProvider:", v5);
  v6 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v5);

  -[PXFilterFooterController setLibraryFilterState:](self, "setLibraryFilterState:", v6);
}

- (void)setLibraryFilterState:(id)a3
{
  PXLibraryFilterState *v4;
  void *libraryFilterState;
  PXLibraryFilterState *v6;
  PXLibraryFilterState *v7;
  PXLibraryFilterState *v8;

  if (a3)
  {
    v4 = (PXLibraryFilterState *)objc_msgSend(a3, "copy");
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v4;
  }
  else
  {
    v6 = [PXLibraryFilterState alloc];
    -[PXFilterFooterController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    libraryFilterState = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:](v6, "initWithSharedLibraryStatusProvider:", libraryFilterState);
    v8 = self->_libraryFilterState;
    self->_libraryFilterState = v7;

  }
  -[PXFilterFooterView setLibraryFilterState:](self->_footerFilterView, "setLibraryFilterState:", self->_libraryFilterState);
}

- (void)setContentFilterState:(id)a3
{
  void *v4;
  void *v5;
  PXContentFilterState *v6;
  PXContentFilterState *contentFilterState;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[PXContentFilterState defaultFilterStateForPhotoLibrary:](PXContentFilterState, "defaultFilterStateForPhotoLibrary:", self->_photoLibrary);
    v6 = (PXContentFilterState *)objc_claimAutoreleasedReturnValue();
  }
  contentFilterState = self->_contentFilterState;
  self->_contentFilterState = v6;

  -[PXFilterFooterView setContentFilterState:](self->_footerFilterView, "setContentFilterState:", self->_contentFilterState);
}

- (PXFilterFooterView)footerFilterView
{
  PXFilterFooterView *footerFilterView;
  PXFilterFooterView *v4;
  PXFilterFooterView *v5;
  PXFilterFooterView *v6;

  footerFilterView = self->_footerFilterView;
  if (!footerFilterView)
  {
    v4 = [PXFilterFooterView alloc];
    v5 = -[PXFilterFooterView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_footerFilterView;
    self->_footerFilterView = v5;

    -[PXFilterFooterView setDelegate:](self->_footerFilterView, "setDelegate:", self);
    -[PXFilterFooterView setSharedLibraryStatusProvider:](self->_footerFilterView, "setSharedLibraryStatusProvider:", self->_sharedLibraryStatusProvider);
    -[PXFilterFooterView setLibraryFilterState:](self->_footerFilterView, "setLibraryFilterState:", self->_libraryFilterState);
    -[PXFilterFooterView setContentFilterState:](self->_footerFilterView, "setContentFilterState:", self->_contentFilterState);
    footerFilterView = self->_footerFilterView;
  }
  return footerFilterView;
}

- (UIView)view
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[PXFilterFooterController libraryFilterState](self, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFiltering"))
  {

  }
  else
  {
    -[PXFilterFooterController contentFilterState](self, "contentFilterState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFiltering");

    if (!v5)
    {
      v6 = 0;
      return (UIView *)v6;
    }
  }
  -[PXFilterFooterController footerFilterView](self, "footerFilterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIView *)v6;
}

- (void)filterFooterViewDidTapShowFilter:(id)a3 sender:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[PXActionManager actionPerformerForActionType:](self->_actionManager, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFilters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PXActionManager actionPerformerForActionType:](self->_actionManager, "actionPerformerForActionType:", CFSTR("PXPhotosGridActionShowFilters"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setSender:", v6);
  objc_msgSend(v5, "performActionWithCompletionHandler:", 0);

}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_footerFilterView, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end
