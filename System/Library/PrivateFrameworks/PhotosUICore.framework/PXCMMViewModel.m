@implementation PXCMMViewModel

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMViewModel;
  -[PXCMMViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setOriginalTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *originalTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_originalTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      originalTitle = self->_originalTitle;
      self->_originalTitle = v6;

      -[PXCMMViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewModel.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v5 = self->_title;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      title = self->_title;
      self->_title = v8;

      -[PXCMMViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewModel.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtitle"));

  }
  v5 = self->_subtitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v8;

      -[PXCMMViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v5;
  PXSectionedSelectionManager *selectionManager;
  void *v7;
  void *v8;
  PXSectionedSelectionManager *v9;

  v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->_selectionManager;
  v9 = v5;
  if (selectionManager != v5)
  {
    -[PXSectionedSelectionManager unregisterChangeObserver:context:](selectionManager, "unregisterChangeObserver:context:", self, PXSelectionManagerObservationContext);
    objc_storeStrong((id *)&self->_selectionManager, a3);
    -[PXSectionedSelectionManager selectionSnapshot](v9, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXCMMUpdateCountsWithSelectionSnapshot(self, v7);
    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewModel setShouldShowPlaceholder:](self, "setShouldShowPlaceholder:", objc_msgSend(v8, "containsAnyItems") ^ 1);

    -[PXSectionedSelectionManager registerChangeObserver:context:](self->_selectionManager, "registerChangeObserver:context:", self, PXSelectionManagerObservationContext);
    -[PXCMMViewModel signalChange:](self, "signalChange:", 2);

  }
}

- (void)setSelecting:(BOOL)a3
{
  if (self->_selecting != a3)
  {
    self->_selecting = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setSelectionEnabled:(BOOL)a3
{
  if (self->_selectionEnabled != a3)
  {
    self->_selectionEnabled = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_recipients, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    recipients = self->_recipients;
    self->_recipients = v4;

    -[PXCMMViewModel signalChange:](self, "signalChange:", 4);
  }

}

- (void)setOriginatorRecipient:(id)a3
{
  PXRecipient *v5;
  PXRecipient *v6;

  v5 = (PXRecipient *)a3;
  if (self->_originatorRecipient != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_originatorRecipient, a3);
    -[PXCMMViewModel signalChange:](self, "signalChange:", 8);
    v5 = v6;
  }

}

- (void)setNumberOfReceivedAssets:(unint64_t)a3
{
  if (self->_numberOfReceivedAssets != a3)
  {
    self->_numberOfReceivedAssets = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setShareURL:(id)a3
{
  NSURL *v4;
  char v5;
  NSURL *v6;
  NSURL *shareURL;
  NSURL *v8;

  v8 = (NSURL *)a3;
  v4 = self->_shareURL;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSURL isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSURL *)-[NSURL copy](v8, "copy");
      shareURL = self->_shareURL;
      self->_shareURL = v6;

      -[PXCMMViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setShareUUID:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *shareUUID;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_shareUUID;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      shareUUID = self->_shareUUID;
      self->_shareUUID = v6;

      -[PXCMMViewModel signalChange:](self, "signalChange:", 64);
    }
  }

}

- (void)setPosterAsset:(id)a3 posterMediaProvider:(id)a4
{
  PXUIImageProvider *v7;
  PXDisplayAsset *v8;
  int v9;
  PXUIImageProvider *v10;
  PXUIImageProvider *v11;
  PXUIImageProvider *v12;
  char v13;
  PXDisplayAsset *v14;

  v14 = (PXDisplayAsset *)a3;
  v7 = (PXUIImageProvider *)a4;
  v8 = self->_posterAsset;
  if (v8 == v14)
  {

  }
  else
  {
    v9 = -[PXDisplayAsset isEqual:](v14, "isEqual:", v8);

    if (!v9)
    {
LABEL_7:
      objc_storeStrong((id *)&self->_posterAsset, a3);
      objc_storeStrong((id *)&self->_posterMediaProvider, a4);
      -[PXCMMViewModel signalChange:](self, "signalChange:", 128);
      goto LABEL_9;
    }
  }
  v10 = self->_posterMediaProvider;
  if (v10 == v7)
  {

    goto LABEL_9;
  }
  v11 = v10;
  v12 = v7;
  v13 = -[PXUIImageProvider isEqual:](v12, "isEqual:", v11);

  if ((v13 & 1) == 0)
    goto LABEL_7;
LABEL_9:

}

- (void)setStartDate:(id)a3
{
  NSDate *v5;
  char v6;
  NSDate *v7;

  v7 = (NSDate *)a3;
  v5 = self->_startDate;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSDate isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_startDate, a3);
      -[PXCMMViewModel signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setEndDate:(id)a3
{
  NSDate *v5;
  char v6;
  NSDate *v7;

  v7 = (NSDate *)a3;
  v5 = self->_endDate;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSDate isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_endDate, a3);
      -[PXCMMViewModel signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setSelectedPhotosCount:(int64_t)a3
{
  if (self->_selectedPhotosCount != a3)
  {
    self->_selectedPhotosCount = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x10000);
  }
}

- (void)setSelectedVideosCount:(int64_t)a3
{
  if (self->_selectedVideosCount != a3)
  {
    self->_selectedVideosCount = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x10000);
  }
}

- (void)setSelectedCount:(int64_t)a3
{
  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x10000);
  }
}

- (void)setPhotosCount:(int64_t)a3
{
  if (self->_photosCount != a3)
  {
    self->_photosCount = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)setVideosCount:(int64_t)a3
{
  if (self->_videosCount != a3)
  {
    self->_videosCount = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)setTotalCount:(int64_t)a3
{
  if (self->_totalCount != a3)
  {
    self->_totalCount = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)setLoadingPeopleSuggestions:(BOOL)a3
{
  if (self->_loadingPeopleSuggestions != a3)
  {
    self->_loadingPeopleSuggestions = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setShouldShowPlaceholder:(BOOL)a3
{
  if (self->_shouldShowPlaceholder != a3)
  {
    self->_shouldShowPlaceholder = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setContainsUnverifiedPersons:(BOOL)a3
{
  if (self->_containsUnverifiedPersons != a3)
  {
    self->_containsUnverifiedPersons = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x8000);
  }
}

- (void)setDisabledActionTypes:(id)a3
{
  NSSet *v5;
  NSSet *v6;

  v5 = (NSSet *)a3;
  if (self->_disabledActionTypes != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledActionTypes, a3);
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x2000);
    v5 = v6;
  }

}

- (void)setOneUpDisabled:(BOOL)a3
{
  if (self->_oneUpDisabled != a3)
  {
    self->_oneUpDisabled = a3;
    -[PXCMMViewModel signalChange:](self, "signalChange:", 0x20000);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  char v17;
  _QWORD v18[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXSelectionManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewModel.m"), 369, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__PXCMMViewModel_observable_didChange_context___block_invoke;
    v18[3] = &unk_1E5140490;
    v18[4] = self;
    -[PXCMMViewModel performChanges:](self, "performChanges:", v18);
    -[PXCMMViewModel selectionManager](self, "selectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __47__PXCMMViewModel_observable_didChange_context___block_invoke_2;
    v16[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
    v17 = objc_msgSend(v14, "containsAnyItems") ^ 1;
    -[PXCMMViewModel performChanges:](self, "performChanges:", v16);

  }
}

- (NSString)originalTitle
{
  return self->_originalTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSString)shareUUID
{
  return self->_shareUUID;
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (BOOL)selectionEnabled
{
  return self->_selectionEnabled;
}

- (BOOL)oneUpDisabled
{
  return self->_oneUpDisabled;
}

- (PXRecipient)originatorRecipient
{
  return self->_originatorRecipient;
}

- (unint64_t)numberOfReceivedAssets
{
  return self->_numberOfReceivedAssets;
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)photosCount
{
  return self->_photosCount;
}

- (int64_t)videosCount
{
  return self->_videosCount;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (int64_t)selectedPhotosCount
{
  return self->_selectedPhotosCount;
}

- (int64_t)selectedVideosCount
{
  return self->_selectedVideosCount;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (NSSet)disabledActionTypes
{
  return self->_disabledActionTypes;
}

- (BOOL)shouldShowPlaceholder
{
  return self->_shouldShowPlaceholder;
}

- (BOOL)containsUnverifiedPersons
{
  return self->_containsUnverifiedPersons;
}

- (BOOL)isLoadingPeopleSuggestions
{
  return self->_loadingPeopleSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledActionTypes, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_originatorRecipient, 0);
  objc_storeStrong((id *)&self->_shareUUID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
}

void __47__PXCMMViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  PXCMMUpdateCountsWithSelectionSnapshot(v3, v5);
}

uint64_t __47__PXCMMViewModel_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldShowPlaceholder:", *(unsigned __int8 *)(a1 + 32));
}

- (int64_t)aggregateMediaType
{
  int64_t v3;
  int64_t v4;
  int64_t result;

  v3 = -[PXCMMViewModel photosCount](self, "photosCount");
  v4 = -[PXCMMViewModel videosCount](self, "videosCount");
  result = -[PXCMMViewModel totalCount](self, "totalCount");
  if (result)
  {
    if (v4 || v3 != result)
    {
      if (v4 == result && v3 == 0)
        return 2;
      else
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (int64_t)aggregateMediaTypeForSelection
{
  int64_t v3;
  int64_t v4;
  int64_t result;

  v3 = -[PXCMMViewModel selectedPhotosCount](self, "selectedPhotosCount");
  v4 = -[PXCMMViewModel selectedVideosCount](self, "selectedVideosCount");
  result = -[PXCMMViewModel selectedCount](self, "selectedCount");
  if (result)
  {
    if (v4 || v3 != result)
    {
      if (v4 == result && v3 == 0)
        return 2;
      else
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end
