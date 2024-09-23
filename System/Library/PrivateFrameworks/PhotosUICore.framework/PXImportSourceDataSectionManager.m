@implementation PXImportSourceDataSectionManager

- (PXImportSourceDataSectionManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXImportSourceDataSectionManager *v6;
  PXImportSourceDataSectionManager *v7;
  uint64_t v8;
  PXImportSourcesManager *importSourcesManager;
  uint64_t v10;
  NSArray *importSources;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXImportSourceDataSectionManager;
  v6 = -[PXDataSectionManager initWithChildDataSectionManagers:](&v13, sel_initWithChildDataSectionManagers_, MEMORY[0x1E0C9AA60]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    +[PXImportSourcesManager sharedController](PXImportSourcesManager, "sharedController");
    v8 = objc_claimAutoreleasedReturnValue();
    importSourcesManager = v7->_importSourcesManager;
    v7->_importSourcesManager = (PXImportSourcesManager *)v8;

    -[PXImportSourcesManager registerChangeObserver:context:](v7->_importSourcesManager, "registerChangeObserver:context:", v7, PXImportSourcesManagerObserverContext);
    -[PXImportSourcesManager importSources](v7->_importSourcesManager, "importSources");
    v10 = objc_claimAutoreleasedReturnValue();
    importSources = v7->_importSources;
    v7->_importSources = (NSArray *)v10;

    v7->_limitToSingleImportSource87746235 = 1;
  }

  return v7;
}

- (PXImportSourceDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportSourceDataSectionManager.m"), 57, CFSTR("%s is not available as initializer"), "-[PXImportSourceDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (id)createDataSection
{
  void *v2;
  void *v3;
  PXArrayDataSection *v4;

  -[PXImportSourceDataSectionManager importSources](self, "importSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXArrayDataSection initWithSectionContent:]([PXArrayDataSection alloc], "initWithSectionContent:", v3);

  return v4;
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  id v9;
  id v10;
  PXImageAsset *v11;
  void *v12;
  PXImageAsset *v13;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportSourceDataSectionManager.m"), 74, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("dataSectionObject"), v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportSourceDataSectionManager.m"), 74, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("dataSectionObject"), v17);
  }

LABEL_3:
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXNavigationListItemKeyAsset")))
  {
    v11 = [PXImageAsset alloc];
    objc_msgSend(v10, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXImageAsset initWithImage:](v11, "initWithImage:", v12);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PXImportSourceDataSectionManager;
    -[PXDataSectionManager auxiliaryObjectForKey:dataSectionObject:hintIndex:](&v20, sel_auxiliaryObjectForKey_dataSectionObject_hintIndex_, v9, v10, a5);
    v13 = (PXImageAsset *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0 && (void *)PXImportSourcesManagerObserverContext == a5)
  {
    -[PXImportSourceDataSectionManager importSourcesManager](self, "importSourcesManager", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "importSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PXImportSourceDataSectionManager limitToSingleImportSource87746235](self, "limitToSingleImportSource87746235"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }
    }
    -[PXImportSourceDataSectionManager importSources](self, "importSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v11, v7, MEMORY[0x1E0C9AA60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXImportSourceDataSectionManager setImportSources:](self, "setImportSources:", v7);
    -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v12);

  }
}

- (void)importSourcesManager:(id)a3 didUpdateImportSource:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[PXImportSourceDataSectionManager importSourcesManager](self, "importSourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importSources");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v10, "indexOfObject:", v5);
  if (!-[PXImportSourceDataSectionManager limitToSingleImportSource87746235](self, "limitToSingleImportSource87746235")
    || v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v9);

  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXImportSourcesManager)importSourcesManager
{
  return self->_importSourcesManager;
}

- (NSArray)importSources
{
  return self->_importSources;
}

- (void)setImportSources:(id)a3
{
  objc_storeStrong((id *)&self->_importSources, a3);
}

- (BOOL)limitToSingleImportSource87746235
{
  return self->_limitToSingleImportSource87746235;
}

- (void)setLimitToSingleImportSource87746235:(BOOL)a3
{
  self->_limitToSingleImportSource87746235 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSources, 0);
  objc_storeStrong((id *)&self->_importSourcesManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

PXImportSourceNavigationListItem *__53__PXImportSourceDataSectionManager_createDataSection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXImportSourceNavigationListItem *v4;
  void *v5;
  PXImportSourceNavigationListItem *v6;

  v3 = a2;
  v4 = [PXImportSourceNavigationListItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXImportSourceNavigationListItem initWithImportSource:photoLibrary:](v4, "initWithImportSource:photoLibrary:", v3, v5);

  return v6;
}

@end
