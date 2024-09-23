@implementation PXStoryMemoryFeedPlaceholderFactory

- (id)createPlaceholderViewForFeedWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  PXLocalizedStringFromTable(CFSTR("PXEmptyMemoriesTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMemoryFeedPlaceholderFactory _placeholderViewMessageForFeedWithViewModel:](self, "_placeholderViewMessageForFeedWithViewModel:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);
  objc_msgSend(v7, "setSecondaryText:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v7);

  return v8;
}

- (void)updatePlaceholderView:(id)a3 forFeedWithViewModel:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v12 = v6;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    v9 = v12;
    goto LABEL_6;
  }
  v8 = v12;

  if (v8)
  {
    PXLocalizedStringFromTable(CFSTR("PXEmptyMemoriesTitle"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMemoryFeedPlaceholderFactory _placeholderViewMessageForFeedWithViewModel:](self, "_placeholderViewMessageForFeedWithViewModel:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v9);
    objc_msgSend(v11, "setSecondaryText:", v10);
    objc_msgSend(v8, "setConfiguration:", v11);

LABEL_6:
  }

}

- (BOOL)supportsDynamicPlaceholderContentSize
{
  return 0;
}

- (id)_placeholderViewMessageForFeedWithViewModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PXLibraryFilterState *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint8_t v14[16];

  v3 = a3;
  PXLocalizedStringFromTable(CFSTR("PXEmptyMemoriesMessage"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
    {
      objc_msgSend(v6, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hasSharedLibraryOrPreview"))
      {
        v9 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v8);
        if (-[PXLibraryFilterState viewMode](v9, "viewMode"))
        {
          PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_EmptyMemoriesMessage"));
          v10 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v10;
        }

      }
      v11 = v4;

      goto LABEL_13;
    }
  }
  else
  {

  }
  PXAssertGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "PXFeedViewModel dataSourceManager is not of class PXStoryMemoryFeedDataSourceManager", v14, 2u);
  }

  v11 = v4;
  v6 = 0;
LABEL_13:

  return v11;
}

@end
