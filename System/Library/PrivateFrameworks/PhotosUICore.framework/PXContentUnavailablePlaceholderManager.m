@implementation PXContentUnavailablePlaceholderManager

- (PXContentUnavailablePlaceholderManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentUnavailablePlaceholderManager.m"), 44, CFSTR("%s is not available as initializer"), "-[PXContentUnavailablePlaceholderManager init]");

  abort();
}

- (PXContentUnavailablePlaceholderManager)initWithGadgetDataSourceManager:(id)a3 customTitle:(id)a4 customMessage:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXContentUnavailablePlaceholderManager *v12;
  PXContentUnavailablePlaceholderManager *v13;
  uint64_t v14;
  NSString *customTitle;
  uint64_t v16;
  NSString *customMessage;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PXContentUnavailablePlaceholderManager;
  v12 = -[PXContentUnavailablePlaceholderManager init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_gadgetDataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v13->_gadgetDataSourceManager, "registerChangeObserver:context:", v13, PXGadgetDataSourceManagerObservationContext);
    -[PXContentUnavailablePlaceholderManager _gadgetDataSourceDidChange](v13, "_gadgetDataSourceDidChange");
    v14 = objc_msgSend(v10, "copy");
    customTitle = v13->_customTitle;
    v13->_customTitle = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    customMessage = v13->_customMessage;
    v13->_customMessage = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setInternalSortDescriptors:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v19, "setFetchLimit:", 1);
    objc_msgSend(v19, "setIncludeAssetSourceTypes:", 5);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentUnavailablePlaceholderManager setSingleAssetFetchResult:](v13, "setSingleAssetFetchResult:", v20);

    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_registerChangeObserver:", v13);

  }
  return v13;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didChange = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setSingleAssetFetchResult:(id)a3
{
  PHFetchResult *v5;

  v5 = (PHFetchResult *)a3;
  if (self->_singleAssetFetchResult != v5)
  {
    objc_storeStrong((id *)&self->_singleAssetFetchResult, a3);
    -[PXContentUnavailablePlaceholderManager setLibraryEmpty:](self, "setLibraryEmpty:", -[PHFetchResult count](v5, "count") == 0);
  }

}

- (void)setDataSourceEmpty:(BOOL)a3
{
  if (self->_dataSourceEmpty != a3)
  {
    self->_dataSourceEmpty = a3;
    -[PXContentUnavailablePlaceholderManager _invalidate](self, "_invalidate");
  }
}

- (void)setLibraryEmpty:(BOOL)a3
{
  if (self->_libraryEmpty != a3)
  {
    self->_libraryEmpty = a3;
    -[PXContentUnavailablePlaceholderManager _invalidate](self, "_invalidate");
  }
}

- (NSString)placeholderTitle
{
  if (-[PXContentUnavailablePlaceholderManager isLibraryEmpty](self, "isLibraryEmpty"))
    +[PXLocalization titleForEmptyPhotoLibrary](PXLocalization, "titleForEmptyPhotoLibrary");
  else
    -[PXContentUnavailablePlaceholderManager customTitle](self, "customTitle");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)placeholderMessage
{
  if (-[PXContentUnavailablePlaceholderManager isLibraryEmpty](self, "isLibraryEmpty"))
    +[PXLocalization messageForEmptyPhotoLibrary](PXLocalization, "messageForEmptyPhotoLibrary");
  else
    -[PXContentUnavailablePlaceholderManager customMessage](self, "customMessage");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)placeholderButtonTitle
{
  void *v2;

  if (-[PXContentUnavailablePlaceholderManager isLibraryEmpty](self, "isLibraryEmpty"))
  {
    +[PXLocalization openCameraButtonTitleForEmptyPhotoLibrary](PXLocalization, "openCameraButtonTitleForEmptyPhotoLibrary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)performPlaceholderButtonAction
{
  void *v2;
  id v3;

  if (-[PXContentUnavailablePlaceholderManager isLibraryEmpty](self, "isLibraryEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "px_openCameraAppURL");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, MEMORY[0x1E0C9AA70]);

  }
}

- (void)_gadgetDataSourceDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PXContentUnavailablePlaceholderManager gadgetDataSourceManager](self, "gadgetDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PXContentUnavailablePlaceholderManager__gadgetDataSourceDidChange__block_invoke;
  v5[3] = &unk_1E51410E0;
  v5[4] = &v6;
  objc_msgSend(v4, "enumerateGadgetsUsingBlock:", v5);

  -[PXContentUnavailablePlaceholderManager setDataSourceEmpty:](self, "setDataSourceEmpty:", *((_BYTE *)v7 + 24) == 0);
  _Block_object_dispose(&v6, 8);
}

- (void)_invalidate
{
  id v3;

  if (self->_delegateRespondsTo.didChange)
  {
    -[PXContentUnavailablePlaceholderManager delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentUnavailablePlaceholderManagerDidChange:", self);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXGadgetDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentUnavailablePlaceholderManager.m"), 155, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXContentUnavailablePlaceholderManager _gadgetDataSourceDidChange](self, "_gadgetDataSourceDidChange");
    v9 = v11;
  }

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PXContentUnavailablePlaceholderManager singleAssetFetchResult](self, "singleAssetFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v8, "fetchResultAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentUnavailablePlaceholderManager setSingleAssetFetchResult:](self, "setSingleAssetFetchResult:", v7);

    v6 = v8;
  }

}

- (PXContentUnavailablePlaceholderManagerDelegate)delegate
{
  return (PXContentUnavailablePlaceholderManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (PXGadgetDataSourceManager)gadgetDataSourceManager
{
  return self->_gadgetDataSourceManager;
}

- (void)setGadgetDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetDataSourceManager, a3);
}

- (PHFetchResult)singleAssetFetchResult
{
  return self->_singleAssetFetchResult;
}

- (BOOL)isDataSourceEmpty
{
  return self->_dataSourceEmpty;
}

- (BOOL)isLibraryEmpty
{
  return self->_libraryEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_gadgetDataSourceManager, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __68__PXContentUnavailablePlaceholderManager__gadgetDataSourceDidChange__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "gadgetType");
  if (result)
  {
    if (result != 6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  return result;
}

@end
