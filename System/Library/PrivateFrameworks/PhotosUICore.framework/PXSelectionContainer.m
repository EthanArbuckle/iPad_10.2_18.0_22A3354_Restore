@implementation PXSelectionContainer

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6 privacyController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXSelectionContainer *v17;
  PXSelectionContainer *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PXSelectionContainer;
  v17 = -[PXSelectionContainer init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_selectionSnapshot, a3);
    objc_storeStrong((id *)&v18->_undoManager, a5);
    v18->_context = a6;
    objc_storeStrong((id *)&v18->_collection, a4);
    objc_storeStrong((id *)&v18->_privacyController, a7);
  }

  return v18;
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  return -[PXSelectionContainer initWithSelectionSnapshot:collection:undoManager:context:privacyController:](self, "initWithSelectionSnapshot:collection:undoManager:context:privacyController:", a3, a4, a5, a6, 0);
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4 context:(int64_t)a5 privacyController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PXSelectionContainer *v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "containerCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = -[PXSelectionContainer initWithSelectionSnapshot:collection:undoManager:context:privacyController:](self, "initWithSelectionSnapshot:collection:undoManager:context:privacyController:", v10, v14, v11, a5, v12);

  return v15;
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4 context:(int64_t)a5
{
  return -[PXSelectionContainer initWithSelectionSnapshot:undoManager:context:privacyController:](self, "initWithSelectionSnapshot:undoManager:context:privacyController:", a3, a4, a5, 0);
}

- (PXSelectionContainer)initWithDataSection:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  id v8;
  id v9;
  PXStackedDataSource *v10;
  void *v11;
  PXStackedDataSource *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  PXSelectionContainer *v20;
  id v24;
  _QWORD v25[4];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = a4;
  v9 = a5;
  v10 = [PXStackedDataSource alloc];
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXStackedDataSource initWithDataSections:](v10, "initWithDataSections:", v11);

  v13 = objc_alloc_init((Class)off_1E50B3668);
  if (objc_msgSend(v8, "count") >= 1)
  {
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v25[0] = -[PXStackedDataSource identifier](v12, "identifier");
      v25[1] = 0;
      v25[2] = v15;
      v25[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v13, "addIndexPath:", v25);
      if (!v14)
        break;
LABEL_14:
      if (++v15 >= objc_msgSend(v8, "count"))
        goto LABEL_18;
    }
    objc_msgSend(v8, "objectAtIndex:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;

      if (!v17)
      {
        v14 = 0;
        goto LABEL_13;
      }
      +[PXContentPrivacyController privacyControllerForCollection:](PXContentPrivacyController, "privacyControllerForCollection:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v18;
      if (v18 && objc_msgSend(v18, "isLocked"))
      {
        v16 = v16;
        v14 = v16;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      v17 = 0;
    }
    v14 = 0;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_18:
  v19 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A80), "initWithDataSource:selectedIndexPaths:", v12, v13);
  v20 = -[PXSelectionContainer initWithSelectionSnapshot:collection:undoManager:context:privacyController:](self, "initWithSelectionSnapshot:collection:undoManager:context:privacyController:", v19, v24, v9, a6, v14);

  return v20;
}

- (PXSelectionContainer)initWithContent:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  PXArrayDataSection *v13;
  PXSelectionContainer *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PXArrayDataSection initWithSectionContent:]([PXArrayDataSection alloc], "initWithSectionContent:", v12);

  v14 = -[PXSelectionContainer initWithDataSection:collection:undoManager:context:](self, "initWithDataSection:collection:undoManager:context:", v13, v11, v10, a6);
  return v14;
}

- (PXSelectionContainer)initWithContent:(id)a3 undoManager:(id)a4 context:(int64_t)a5
{
  return -[PXSelectionContainer initWithContent:collection:undoManager:context:](self, "initWithContent:collection:undoManager:context:", a3, 0, a4, a5);
}

- (PXSelectionContainer)initWithCollection:(id)a3 collectionFetcher:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  id v10;
  PXSelectionContainer *v11;
  PXSelectionContainer *v12;

  v10 = a4;
  v11 = -[PXSelectionContainer initWithContent:collection:undoManager:context:](self, "initWithContent:collection:undoManager:context:", MEMORY[0x1E0C9AA60], a3, a5, a6);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_collectionFetcher, v10);

  return v12;
}

- (PXSelectionContainer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionContainer.m"), 159, CFSTR("%s is not available as initializer"), "-[PXSelectionContainer init]");

  abort();
}

- (int64_t)selectionCount
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  int64_t v8;

  -[PXSelectionContainer privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if ((v4 & 1) != 0)
    return 0;
  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (BOOL)hasExplicitSelection
{
  return -[PXSelectionContainer selectionCount](self, "selectionCount") > 0;
}

- (id)selectedObjects:(BOOL)a3
{
  void *v4;

  if (a3 && !-[PXSelectionContainer hasExplicitSelection](self, "hasExplicitSelection"))
  {
    -[PXSelectionContainer allDataSourceObjects](self, "allDataSourceObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXSelectionContainer selectedObjects](self, "selectedObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (PXFastEnumeration)selectedObjects
{
  void *v3;
  PXFastEnumeration *v4;
  PXFastEnumeration *selectedObjects;
  void *v6;
  char v7;
  PXFastEnumeration *v8;

  if (!self->_selectedObjects)
  {
    -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchSelectedObjects");
    v4 = (PXFastEnumeration *)objc_claimAutoreleasedReturnValue();
    selectedObjects = self->_selectedObjects;
    self->_selectedObjects = v4;

  }
  -[PXSelectionContainer privacyController](self, "privacyController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocked");

  if ((v7 & 1) != 0)
    v8 = (PXFastEnumeration *)MEMORY[0x1E0C9AA60];
  else
    v8 = self->_selectedObjects;
  return v8;
}

- (id)firstSelectedObjectOfClass:(Class)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)singleSelectedObjectOfClass:(Class)a3
{
  void *v5;

  if (-[PXSelectionContainer selectionCount](self, "selectionCount") == 1)
  {
    -[PXSelectionContainer firstSelectedObjectOfClass:](self, "firstSelectedObjectOfClass:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)enumerateSelectedObjectsOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  Class v11;

  v6 = a4;
  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PXSelectionContainer_enumerateSelectedObjectsOfClass_usingBlock___block_invoke;
  v9[3] = &unk_1E512BED0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "enumerateSelectedObjectsUsingBlock:", v9);

}

- (id)selectedObjectsOfClass:(Class)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PXSelectionContainer_selectedObjectsOfClass___block_invoke;
  v8[3] = &unk_1E51351A0;
  v6 = v5;
  v9 = v6;
  -[PXSelectionContainer enumerateSelectedObjectsOfClass:usingBlock:](self, "enumerateSelectedObjectsOfClass:usingBlock:", a3, v8);

  return v6;
}

- (BOOL)containsObjectOfClass:(Class)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PXSelectionContainer_containsObjectOfClass_passingTest___block_invoke;
  v9[3] = &unk_1E512BEF8;
  v11 = &v12;
  v7 = v6;
  v10 = v7;
  -[PXSelectionContainer enumerateSelectedObjectsOfClass:usingBlock:](self, "enumerateSelectedObjectsOfClass:usingBlock:", a3, v9);
  LOBYTE(a3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a3;
}

- (BOOL)containsReferencedFileAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_134927);
}

- (BOOL)containsRAWPlusJPEGAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_209);
}

- (BOOL)containsRAWAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_210);
}

- (BOOL)containsSpatialAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_211_134926);
}

- (BOOL)containsSpatialVideoAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_212);
}

- (BOOL)containsUnsavedContentSyndicationAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_213);
}

- (BOOL)containsContentSyndicationAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_214);
}

- (BOOL)containsNonContentSyndicationAssets
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_215_134925);
}

- (BOOL)containsAssetsWithNonEditableProperties
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_216_134923);
}

- (BOOL)containsPeople
{
  return -[PXSelectionContainer containsObjectOfClass:passingTest:](self, "containsObjectOfClass:passingTest:", objc_opt_class(), &__block_literal_global_219);
}

- (id)selectedContainedAssets:(BOOL)a3 allowedClasses:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PXArrayDataSection *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void *);
  void *v33;
  PXSelectionContainer *v34;
  SEL v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PXSelectionContainer selectedObjects:](self, "selectedObjects:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __63__PXSelectionContainer_selectedContainedAssets_allowedClasses___block_invoke;
    v33 = &unk_1E512C0A0;
    v34 = self;
    v35 = a2;
    PXMap();
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EEA4EBD0))
  {
    PXMap();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
    v8 = v11;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v19 = [PXArrayDataSection alloc];
          v20 = v8;
          goto LABEL_16;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      if (v15)
        continue;
      break;
    }
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[PXDataSection dataSectionForAssetsInAssetContainers:](PXStackedDataSection, "dataSectionForAssetsInAssetContainers:", v8, v26);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v9 && v4)
    {
      -[PXSelectionContainer collection](self, "collection", v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[PXSelectionContainer collection](self, "collection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXDataSection dataSectionForAssetsInAssetContainers:](PXStackedDataSection, "dataSectionForAssetsInAssetContainers:", v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
    }
    v19 = [PXArrayDataSection alloc];
    v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_16:
    v18 = -[PXArrayDataSection initWithSectionContent:](v19, "initWithSectionContent:", v20, v26);
  }
  v21 = (void *)v18;
LABEL_18:

  return v21;
}

- (id)selectedContainedAssets:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionContainer selectedContainedAssets:allowedClasses:](self, "selectedContainedAssets:allowedClasses:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXFastEnumeration)selectedContainedAssets
{
  return (PXFastEnumeration *)-[PXSelectionContainer selectedContainedAssets:](self, "selectedContainedAssets:", 0);
}

- (BOOL)allowImplicitSelectionForProjectsOrSharing
{
  unint64_t v3;
  void *v5;
  char v6;

  v3 = -[PXSelectionContainer context](self, "context");
  if (v3 > 0x1C)
    return 0;
  if (((1 << v3) & 0x1808008) != 0)
    return 1;
  if (((1 << v3) & 0x18000000) == 0)
    return 0;
  -[PXSelectionContainer collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "px_allowsImplicitSelectionForProjectOrSharingAction");

  return v6;
}

- (PXFastEnumeration)selectedContainedAssetsForProjectsOrSharing
{
  return (PXFastEnumeration *)-[PXSelectionContainer selectedContainedAssets:](self, "selectedContainedAssets:", -[PXSelectionContainer allowImplicitSelectionForProjectsOrSharing](self, "allowImplicitSelectionForProjectsOrSharing"));
}

- (PXFastEnumeration)allDataSourceObjects
{
  void *v3;
  void *v4;
  PXFastEnumeration *v5;
  PXFastEnumeration *allDataSourceObjects;
  void *v7;
  char v8;
  PXFastEnumeration *v9;

  if (!self->_allDataSourceObjects)
  {
    -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fetchAllItemObjects");
    v5 = (PXFastEnumeration *)objc_claimAutoreleasedReturnValue();
    allDataSourceObjects = self->_allDataSourceObjects;
    self->_allDataSourceObjects = v5;

  }
  -[PXSelectionContainer privacyController](self, "privacyController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocked");

  if ((v8 & 1) != 0)
    v9 = (PXFastEnumeration *)MEMORY[0x1E0C9AA60];
  else
    v9 = self->_allDataSourceObjects;
  return v9;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t, void *, BOOL *);
  void *v42;
  id v43;
  id v44;
  PXSelectionContainer *v45;
  id v46;
  uint64_t *v47;
  _QWORD aBlock[4];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXSelectionContainer context](self, "context") == 17)
  {
    -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    -[PXSelectionContainer collection](self, "collection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    if (v9)
    {
      -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allItemsEnumerator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPeopleUtilities titleStringForPeople:](PXPeopleUtilities, "titleStringForPeople:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v22)
      {
        +[PXPeopleUtilities titleStringForSocialGroup:](PXPeopleUtilities, "titleStringForSocialGroup:", v22);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (!v24)
      {
        v28 = 0;
        goto LABEL_24;
      }
      if (!objc_msgSend(v4, "totalNumberOfItems"))
      {
        v28 = &stru_1E5149688;
        goto LABEL_24;
      }
      objc_msgSend(v24, "photoLibrary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v25, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleHomeSummaryQuantityTitle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v26, CFSTR("%ld"));
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (__CFString *)v27;

LABEL_24:
    goto LABEL_27;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__PXSelectionContainer_title__block_invoke;
  aBlock[3] = &unk_1E512C108;
  v12 = v10;
  v49 = v12;
  v13 = _Block_copy(aBlock);
  v39 = v11;
  v40 = 3221225472;
  v41 = __29__PXSelectionContainer_title__block_invoke_2;
  v42 = &unk_1E512C180;
  v43 = v4;
  v9 = v12;
  v44 = v9;
  v47 = &v50;
  v14 = v13;
  v45 = self;
  v46 = v14;
  objc_msgSend(v6, "enumerateItemIndexSetsUsingBlock:", &v39);
  if (v51[3] < 3)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v9);
    objc_msgSend(v15, "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXCollectionPickerAdditionalMomentsFormat"), CFSTR("PhotosUICore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v51[3] - 1;
    PXLocalizedStringWithValidatedFormat(v15, CFSTR("%ld"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v9, "firstObject", v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithObjects:", v18, v16, 0, v39, v40, v41, v42, v43, v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v19, "count"))
  {
    PXLocalizedStringFromTable(CFSTR("PXCollectionPickerNewCollectionNameComponentsSeparator"), CFSTR("PhotosUICore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", v29);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  _Block_object_dispose(&v50, 8);
LABEL_27:

  if (!v28)
  {
    -[PXSelectionContainer collection](self, "collection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedTitle");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      -[PXSelectionContainer collection](self, "collection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = (objc_class *)MEMORY[0x1E0D716B0];
        v33 = v31;
        v34 = (void *)objc_msgSend([v32 alloc], "initWithPreset:", 2);
        objc_msgSend(v33, "localStartDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localEndDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "stringFromDate:toDate:", v35, v36);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else if (-[PXSelectionContainer context](self, "context") == 23)
      {
        PXLocalizedStringFromTable(CFSTR("SEARCH_TITLE"), CFSTR("PhotosUICore"));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }

    }
  }

  return (NSString *)v28;
}

- (BOOL)isEqualToSelection:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  v5 = -[PXSelectionContainer selectionCount](self, "selectionCount");
  if (v5 != objc_msgSend(v4, "selectionCount"))
    goto LABEL_5;
  v6 = -[PXSelectionContainer context](self, "context");
  if (v6 != objc_msgSend(v4, "context"))
    goto LABEL_5;
  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectedIndexPaths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqual:", v15);

  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PXSelectionContainer *v4;
  BOOL v5;

  v4 = (PXSelectionContainer *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXSelectionContainer isEqualToSelection:](self, "isEqualToSelection:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PXSelectionContainer selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[PXSelectionContainer context](self, "context");
  if ((unint64_t)(v5 - 1) > 0x1E)
    v6 = CFSTR("Undefined");
  else
    v6 = off_1E512C1A0[v5 - 1];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; context = %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXDisplayCollection)collection
{
  return self->_collection;
}

- (PXDisplayCollectionFetcher)collectionFetcher
{
  return (PXDisplayCollectionFetcher *)objc_loadWeakRetained((id *)&self->_collectionFetcher);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (int64_t)context
{
  return self->_context;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_collectionFetcher);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_allDataSourceObjects, 0);
  objc_storeStrong((id *)&self->_selectedObjects, 0);
}

void __29__PXSelectionContainer_title__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __29__PXSelectionContainer_title__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, BOOL *a5)
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  int64x2_t v30;

  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v10 = *(void **)(a1 + 32);
    v29[0] = a2;
    v29[1] = a3;
    v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v10, "objectAtIndexPath:", v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      if (objc_msgSend(v12, "assetCollectionType") != 2 || objc_msgSend(v12, "assetCollectionSubtype") == 1000000204)
      {
        objc_msgSend(v12, "localizedSubtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 || (objc_msgSend(v12, "localizedTitle"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

        }
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v11;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __29__PXSelectionContainer_title__block_invoke_3;
        v25[3] = &unk_1E512C130;
        v26 = v14;
        v15 = *(id *)(a1 + 56);
        v16 = *(_QWORD *)(a1 + 64);
        v27 = v15;
        v28 = v16;
        objc_msgSend(v9, "enumerateIndexesUsingBlock:", v25);

        v12 = v26;
      }
      else
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __29__PXSelectionContainer_title__block_invoke_4;
        v19[3] = &unk_1E512C158;
        v20 = *(id *)(a1 + 32);
        v23 = a2;
        v24 = a3;
        v17 = *(id *)(a1 + 56);
        v18 = *(_QWORD *)(a1 + 64);
        v21 = v17;
        v22 = v18;
        objc_msgSend(v9, "enumerateIndexesUsingBlock:", v19);

        v12 = v20;
      }
    }

    *a5 = objc_msgSend(*(id *)(a1 + 48), "context") == 6;
  }

}

void __29__PXSelectionContainer_title__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __29__PXSelectionContainer_title__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v6 = a2;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "objectAtIndexPath:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

uint64_t __63__PXSelectionContainer_selectedContainedAssets_allowedClasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetCollection");
}

uint64_t __63__PXSelectionContainer_selectedContainedAssets_allowedClasses___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetCollection");
}

uint64_t __38__PXSelectionContainer_containsPeople__block_invoke()
{
  return 1;
}

uint64_t __63__PXSelectionContainer_containsAssetsWithNonEditableProperties__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canPerformEditOperation:", 3) ^ 1;
}

uint64_t __59__PXSelectionContainer_containsNonContentSyndicationAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isSyndicatedAsset") ^ 1;
}

uint64_t __56__PXSelectionContainer_containsContentSyndicationAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isSyndicatedAsset");
}

uint64_t __63__PXSelectionContainer_containsUnsavedContentSyndicationAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

BOOL __50__PXSelectionContainer_containsSpatialVideoAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSpatialMedia"))
    v3 = objc_msgSend(v2, "mediaType") == 2;
  else
    v3 = 0;

  return v3;
}

uint64_t __45__PXSelectionContainer_containsSpatialAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSpatialMedia");
}

uint64_t __41__PXSelectionContainer_containsRAWAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isRAW") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isRAWPlusJPEG");

  return v3;
}

uint64_t __49__PXSelectionContainer_containsRAWPlusJPEGAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRAWPlusJPEG");
}

uint64_t __52__PXSelectionContainer_containsReferencedFileAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReferencedAsset");
}

uint64_t __58__PXSelectionContainer_containsObjectOfClass_passingTest___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;
  BOOL v6;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v6 = 1;
  else
    v6 = *a3;
  *a3 = v6;
  return result;
}

uint64_t __47__PXSelectionContainer_selectedObjectsOfClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __67__PXSelectionContainer_enumerateSelectedObjectsOfClass_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
