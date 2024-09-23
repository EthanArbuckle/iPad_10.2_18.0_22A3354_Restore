@implementation PUSidebarReorderController

- (PUSidebarReorderController)initWithDataSource:(id)a3 outlineSectionController:(id)a4
{
  id v7;
  id v8;
  PUSidebarReorderController *v9;
  PUSidebarReorderController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUSidebarReorderController;
  v9 = -[PUSidebarReorderController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_sidebarOutlineSectionController, a4);
  }

  return v10;
}

- (BOOL)canReorderItem:(id)a3
{
  id v4;

  v4 = a3;
  -[PUSidebarReorderController setItemToReorder:](self, "setItemToReorder:", v4);
  LOBYTE(self) = objc_msgSend(v4, "isReorderable");

  return (char)self;
}

- (id)targetIndexPathForMoveFromItemAtIndexPath:(id)a3 toProposedIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v30;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[PUSidebarReorderController itemToReorder](self, "itemToReorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_FAULT, "Expected to have an item to move", buf, 2u);
    }

  }
  -[PUSidebarReorderController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIdentifierForIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isReorderable") && (objc_msgSend(v11, "isReorderable") & 1) != 0)
  {
    v30 = v6;
    -[PUSidebarReorderController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentSectionSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "parentOfChildItem:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "canPerformEditOperation:", 5);

    objc_msgSend(v13, "parentOfChildItem:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16 & objc_msgSend(v18, "canPerformEditOperation:", 5);

    v20 = v17;
    v21 = v20;
    if (v19 == 1 && v20)
    {
      v22 = objc_msgSend(v13, "levelOfItem:", v20);
      if (v22 > objc_msgSend(v13, "levelOfItem:", v14))
      {
        v23 = v21;
        while (1)
        {
          v24 = v23;
          v25 = objc_msgSend(v23, "isEqual:", v8);
          objc_msgSend(v13, "parentOfChildItem:", v23);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v25 & 1) != 0 || !v23)
            break;
          v26 = objc_msgSend(v13, "levelOfItem:", v21);
          if (v26 <= objc_msgSend(v13, "levelOfItem:", v14))
            goto LABEL_18;
        }
        if ((v25 & 1) != 0)
          goto LABEL_20;
LABEL_18:
        v6 = v30;
LABEL_21:
        v7 = v7;

        v27 = v7;
        goto LABEL_22;
      }
    }
    else
    {
      v23 = v20;
      if ((v19 & 1) == 0)
      {
LABEL_20:
        v6 = v30;
        v28 = v30;

        v7 = v28;
        goto LABEL_21;
      }
    }
    v23 = v21;
    goto LABEL_18;
  }
  v27 = v6;
LABEL_22:

  return v27;
}

- (void)performReorderWithTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  char v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  char v51;
  _QWORD block[6];

  objc_msgSend(a3, "sectionTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "difference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v8;
  objc_msgSend(v8, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "difference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "finalSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentOfChildItem:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "childrenOfParent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSidebarReorderController itemToReorder](self, "itemToReorder");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 != v17)
    {
      objc_msgSend(v14, "parentOfChildItem:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 == v15)
      {
        v19 = v17;

        v9 = v19;
        v13 = v9;
      }
    }
    v20 = objc_msgSend(v16, "indexOfObject:", v9);

  }
  else
  {
    v15 = 0;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v15, "collection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_14;
  }
  objc_msgSend(v5, "initialSnapshot");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "parentOfChild:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v23, "isEqual:", v15);

  -[PUSidebarReorderController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dataController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "infoForItem:childIndex:", v15, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "collection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "px_descriptionForAssertionMessage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarReorderController.m"), 124, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("childInfo.collection"), v35, v41);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarReorderController.m"), 124, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("childInfo.collection"), v35);
  }

LABEL_10:
  objc_msgSend(v9, "collection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarReorderController.m"), 125, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("insertedItem.collection"), v38);
LABEL_20:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "px_descriptionForAssertionMessage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarReorderController.m"), 125, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("insertedItem.collection"), v38, v40);

    goto LABEL_20;
  }
LABEL_12:
  objc_msgSend(v27, "photoLibrary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_2;
  v47[3] = &unk_1E58A7B50;
  v48 = v27;
  v49 = v26;
  v51 = v44;
  v50 = v28;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_3;
  v46[3] = &unk_1E58AB060;
  v46[4] = self;
  v30 = v28;
  v31 = v26;
  v32 = v27;
  objc_msgSend(v29, "performChanges:completionHandler:", v47, v46);

LABEL_14:
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSidebarOutlineSectionController)sidebarOutlineSectionController
{
  return self->_sidebarOutlineSectionController;
}

- (PXNavigationListItem)itemToReorder
{
  return self->_itemToReorder;
}

- (void)setItemToReorder:(id)a3
{
  objc_storeStrong((id *)&self->_itemToReorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemToReorder, 0);
  objc_storeStrong((id *)&self->_sidebarOutlineSectionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sidebarOutlineSectionController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v1, "animateDataSourceUpdates"), 0);

}

void __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD14E8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForCollectionList:childCollections:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56))
  {
    v12[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeChildCollections:", v6);

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "childIndexInFetchResult");
  if (v7 != *MEMORY[0x1E0D7C810])
  {
    v8 = v7;
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertChildCollections:atIndexes:", v9, v10);

  }
}

void __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Item reordering failed with error %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "sidebarOutlineSectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v7, "animateDataSourceUpdates"), 0);

  }
}

@end
