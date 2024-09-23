@implementation PXNavigationListItemDataSectionManager

- (PXNavigationListItemDataSectionManager)initWithCollection:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PXNavigationListItemDataSectionManager *v9;
  PXNavigationListItemDataSectionManager *v10;
  uint64_t v11;
  PXContentPrivacyController *privacyController;
  uint64_t v13;
  PXLibraryFilterState *libraryFilterState;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXNavigationListItemDataSectionManager;
  v9 = -[PXDataSectionManager initWithChildDataSectionManagers:](&v16, sel_initWithChildDataSectionManagers_, MEMORY[0x1E0C9AA60]);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v10->_enabled = 1;
    +[PXContentPrivacyController privacyControllerForCollection:](PXContentPrivacyController, "privacyControllerForCollection:", v10->_collection);
    v11 = objc_claimAutoreleasedReturnValue();
    privacyController = v10->_privacyController;
    v10->_privacyController = (PXContentPrivacyController *)v11;

    -[PXContentPrivacyController registerChangeObserver:context:](v10->_privacyController, "registerChangeObserver:context:", v10, PrivacyControllerObservationContext_270281);
    v10->_lockState = objc_msgSend((id)objc_opt_class(), "lockStateFromPrivacyController:", v10->_privacyController);
    objc_msgSend(v8, "libraryFilterState");
    v13 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v10->_libraryFilterState;
    v10->_libraryFilterState = (PXLibraryFilterState *)v13;

    -[PXLibraryFilterState registerChangeObserver:context:](v10->_libraryFilterState, "registerChangeObserver:context:", v10, PXLibraryFilterStateObservationContext_270282);
  }

  return v10;
}

- (PXNavigationListItemDataSectionManager)initWithItem:(id)a3
{
  id v5;
  PXNavigationListItemDataSectionManager *v6;
  PXNavigationListItemDataSectionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListItemDataSectionManager;
  v6 = -[PXDataSectionManager initWithChildDataSectionManagers:](&v9, sel_initWithChildDataSectionManagers_, MEMORY[0x1E0C9AA60]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listItem, a3);
    v7->_enabled = 1;
  }

  return v7;
}

- (PXNavigationListItemDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListItemDataSectionManager.m"), 71, CFSTR("%s is not available as initializer"), "-[PXNavigationListItemDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (BOOL)allowsEmptyDataSection
{
  return !-[PXNavigationListItemDataSectionManager isHiddenWhenEmpty](self, "isHiddenWhenEmpty")
      && -[PXNavigationListItemDataSectionManager isEnabled](self, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__PXNavigationListItemDataSectionManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXNavigationListItemDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)setHiddenWhenEmpty:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_hiddenWhenEmpty != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __61__PXNavigationListItemDataSectionManager_setHiddenWhenEmpty___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXNavigationListItemDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)setFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;
  char v7;
  PHFetchResult *v8;
  PHFetchResult *fetchResult;
  void *v10;
  PHFetchResult *v11;

  v11 = (PHFetchResult *)a3;
  v5 = self->_fetchResult;
  if (v5 == v11)
  {

LABEL_12:
    v8 = v11;
    goto LABEL_13;
  }
  v6 = v5;
  v7 = -[PHFetchResult isEqual:](v5, "isEqual:", v11);

  v8 = v11;
  if ((v7 & 1) == 0)
  {
    fetchResult = self->_fetchResult;
    if (!v11 || fetchResult)
    {
      if (v11 || !fetchResult)
        goto LABEL_11;
      -[PHCollection photoLibrary](self->_collection, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_unregisterChangeObserver:", self);
    }
    else
    {
      -[PHCollection photoLibrary](self->_collection, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_registerChangeObserver:", self);
    }

LABEL_11:
    objc_storeStrong((id *)&self->_fetchResult, a3);
    -[PXNavigationListItemDataSectionManager updateDataSectionIfNecessary](self, "updateDataSectionIfNecessary");
    goto LABEL_12;
  }
LABEL_13:

}

- (void)setLockState:(unint64_t)a3
{
  _QWORD v3[6];

  if (self->_lockState != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PXNavigationListItemDataSectionManager_setLockState___block_invoke;
    v3[3] = &unk_1E5144FE8;
    v3[4] = self;
    v3[5] = a3;
    -[PXNavigationListItemDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (BOOL)isCollectionEmpty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PXNavigationListItemDataSectionManager collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItemDataSectionManager fetchResult](self, "fetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItemDataSectionManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsFilterPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = objc_msgSend(v4, "count") == 0;
  }
  else if (v3)
  {
    objc_msgSend(v3, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setInternalPredicate:", v6);
    if ((objc_msgSend(v3, "px_isSharedAlbum") & 1) == 0 && (objc_msgSend(v3, "px_isUnableToUploadSmartAlbum") & 1) == 0)
    {
      -[PXNavigationListItemDataSectionManager libraryFilterState](self, "libraryFilterState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSharingFilter:", objc_msgSend(v10, "sharingFilter"));

    }
    v7 = objc_msgSend(v3, "px_fetchIsEmptyWithOptions:", v9);
    +[PXCollectionFetchOperation fetchOperationWithCollection:delegate:](PXCollectionFetchOperation, "fetchOperationWithCollection:delegate:", v3, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFetchOptions:", v9);
    objc_msgSend(v5, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v11);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isCollectionVisible
{
  void *v3;
  int v4;
  int v5;

  if (-[PXNavigationListItemDataSectionManager isCollectionEmpty](self, "isCollectionEmpty"))
  {
    -[PXNavigationListItemDataSectionManager collection](self, "collection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "px_isAllLibraryDuplicatesSmartAlbum"))
      v4 = !-[PXNavigationListItemDataSectionManager isInitialDuplicateDetectorProcessingCompleted](self, "isInitialDuplicateDetectorProcessingCompleted");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  v5 = -[PXNavigationListItemDataSectionManager isEnabled](self, "isEnabled");
  if (v5)
  {
    if (-[PXNavigationListItemDataSectionManager isHiddenWhenEmpty](self, "isHiddenWhenEmpty"))
      LOBYTE(v5) = !-[PXNavigationListItemDataSectionManager isCollectionEmpty](self, "isCollectionEmpty") | v4;
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  BOOL isInitialDuplicateDetectorProcessingCompleted;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_lastDuplicatesProcessingCheckDate || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > 300.0))
  {
    -[PXNavigationListItemDataSectionManager collection](self, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isInitialDuplicateDetectorProcessingCompleted = objc_msgSend(v7, "isInitialDuplicateDetectorProcessingCompleted");

    objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, v4);
  }
  isInitialDuplicateDetectorProcessingCompleted = self->_isInitialDuplicateDetectorProcessingCompleted;

  return isInitialDuplicateDetectorProcessingCompleted;
}

- (void)updateDataSectionIfNecessary
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v5, "count")
      || !-[PXNavigationListItemDataSectionManager isCollectionVisible](self, "isCollectionVisible"))
    {
      if (objc_msgSend(v5, "count") < 1
        || -[PXNavigationListItemDataSectionManager isCollectionVisible](self, "isCollectionVisible"))
      {
        if (!-[PXNavigationListItemDataSectionManager isCollectionVisible](self, "isCollectionVisible")
          || (-[PXNavigationListItemDataSectionManager currentChanges](self, "currentChanges") & 8) == 0)
        {
          goto LABEL_13;
        }
        objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexRange:", 0, 1);
        v3 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, 1);
        v3 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, 1);
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v3;
    if (v3)
    {
      -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v3);

    }
  }
LABEL_13:

}

- (id)createDataSection
{
  PXArrayDataSection *v3;
  uint64_t v4;
  PXCollectionsDataSection *v5;
  PXNavigationListDataSection *v6;
  void *v7;
  PXCollectionsDataSection *v8;
  void *v9;
  PXNavigationListDataSection *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_listItem && -[PXNavigationListItemDataSectionManager isEnabled](self, "isEnabled"))
  {
    v3 = [PXArrayDataSection alloc];
    v12[0] = self->_listItem;
    v4 = v12[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v5 = (PXCollectionsDataSection *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXArrayDataSection initWithOutlineObject:sectionContent:](v3, "initWithOutlineObject:sectionContent:", v4, v5);
  }
  else
  {
    if (-[PXNavigationListItemDataSectionManager isCollectionVisible](self, "isCollectionVisible")
      && (-[PXNavigationListItemDataSectionManager collection](self, "collection"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v8 = [PXCollectionsDataSection alloc];
      -[PXNavigationListItemDataSectionManager collection](self, "collection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PXCollectionsDataSection initWithDisplayCollection:lockState:](v8, "initWithDisplayCollection:lockState:", v9, -[PXNavigationListItemDataSectionManager lockState](self, "lockState"));

    }
    else
    {
      v5 = objc_alloc_init(PXCollectionsDataSection);
    }
    v6 = -[PXNavigationListDataSection initWithCollectionsDataSection:]([PXNavigationListDataSection alloc], "initWithCollectionsDataSection:", v5);
  }
  v10 = v6;

  return v10;
}

- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4
{
  return (a4 & 9) != 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; collection = %@>"),
                       objc_opt_class(),
                       self,
                       self->_collection);
}

- (void)collectionFetchOperationDidComplete:(id)a3
{
  id v4;

  objc_msgSend(a3, "outputFetchResult");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItemDataSectionManager setFetchResult:](self, "setFetchResult:", v4);

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PXNavigationListItemDataSectionManager fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v8, "fetchResultAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationListItemDataSectionManager setFetchResult:](self, "setFetchResult:", v7);

    v6 = v8;
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
  if ((void *)PrivacyControllerObservationContext_270281 == a5)
  {
    if ((v6 & 3) != 0)
    {
      v11 = v9;
      -[PXNavigationListItemDataSectionManager setLockState:](self, "setLockState:", objc_msgSend((id)objc_opt_class(), "lockStateFromPrivacyController:", self->_privacyController));
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_270282 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListItemDataSectionManager.m"), 256, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v11 = v9;
      -[PXNavigationListItemDataSectionManager setFetchResult:](self, "setFetchResult:", 0);
LABEL_7:
      v9 = v11;
    }
  }

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PXDataSectionEnablementForwarder)enablementForwarder
{
  return self->_enablementForwarder;
}

- (void)setEnablementForwarder:(id)a3
{
  objc_storeStrong((id *)&self->_enablementForwarder, a3);
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PXNavigationListItem)listItem
{
  return self->_listItem;
}

- (BOOL)isHiddenWhenEmpty
{
  return self->_hiddenWhenEmpty;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (PXSidebarDataContext)context
{
  return self->_context;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setIsInitialDuplicateDetectorProcessingCompleted:(BOOL)a3
{
  self->_isInitialDuplicateDetectorProcessingCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_enablementForwarder, 0);
  objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, 0);
}

uint64_t __55__PXNavigationListItemDataSectionManager_setLockState___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8);
  return objc_msgSend(*(id *)(a1 + 32), "updateDataSectionIfNecessary");
}

uint64_t __61__PXNavigationListItemDataSectionManager_setHiddenWhenEmpty___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 153) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "updateDataSectionIfNecessary");
}

uint64_t __53__PXNavigationListItemDataSectionManager_setEnabled___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4);
  return objc_msgSend(*(id *)(a1 + 32), "updateDataSectionIfNecessary");
}

+ (unint64_t)lockStateFromPrivacyController:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isContentPrivacyEnabled"))
  {
    if (objc_msgSend(v4, "isLocked"))
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
