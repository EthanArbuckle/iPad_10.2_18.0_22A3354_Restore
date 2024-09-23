@implementation PXCMMInvitationsGadgetProvider

- (PXCMMInvitationsGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsGadgetProvider.m"), 35, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationsGadgetProvider init]");

  abort();
}

- (PXCMMInvitationsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsGadgetProvider.m"), 39, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationsGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXCMMInvitationsGadgetProvider)initWithDataSourceManager:(id)a3 workflowPresenter:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXCMMInvitationsGadgetProvider *v11;
  PXCMMInvitationsGadgetProvider *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsGadgetProvider.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceManager"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsGadgetProvider.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowPresenter"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXCMMInvitationsGadgetProvider;
  v11 = -[PXGadgetProvider init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v12->_dataSourceManager, "registerChangeObserver:context:", v12, PXDataSourceManagerObservationContext_126468);
    objc_storeStrong((id *)&v12->_workflowPresenter, a4);
  }

  return v12;
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  unint64_t v3;

  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsInSection:", 0);

  return v3;
}

- (void)generateGadgets
{
  id v3;

  self->_didGenerateGadgets = 1;
  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationsGadgetProvider _setDataSource:changes:](self, "_setDataSource:changes:", v3, 0);

}

- (id)_newGadgetForObjectID:(id)a3
{
  id v4;
  PXCMMInvitationGadget *v5;

  v4 = a3;
  v5 = -[PXCMMInvitationGadget initWithWorkflowPresenter:]([PXCMMInvitationGadget alloc], "initWithWorkflowPresenter:", self->_workflowPresenter);
  -[PXCMMInvitationGadget setInvitationGadgetDelegate:](v5, "setInvitationGadgetDelegate:", self);
  -[PXCMMInvitationGadget setObjectID:](v5, "setObjectID:", v4);

  return v5;
}

- (void)_setDataSource:(id)a3 changes:(id)a4
{
  id v7;
  id v8;
  PXCMMInvitationsDataSource **p_dataSource;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  PXCMMInvitationsDataSource *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _OWORD v34[2];
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  PXCMMInvitationsGadgetProvider *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;

  v7 = a3;
  v8 = a4;
  if (self->_didGenerateGadgets)
  {
    p_dataSource = &self->_dataSource;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXGadgetProvider gadgets](self, "gadgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "itemChangesInSection:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasIncrementalChanges");
    v14 = MEMORY[0x1E0C809B0];
    v30 = v8;
    if (v13)
    {
      v29 = v11;
      v28 = v10;
      v15 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v12, "removedIndexes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectsAtIndexes:", v16);
      objc_msgSend(v12, "insertedIndexes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v14;
      v45[1] = 3221225472;
      v45[2] = __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke;
      v45[3] = &unk_1E51460E8;
      v45[4] = self;
      v18 = v15;
      v46 = v18;
      objc_msgSend(v17, "enumerateIndexesUsingBlock:", v45);
      v42[0] = v14;
      v42[1] = 3221225472;
      v42[2] = __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_2;
      v42[3] = &unk_1E5142428;
      v43 = (id)objc_msgSend(v18, "copy");
      v19 = v14;
      v20 = v18;
      v44 = v20;
      v21 = v43;
      objc_msgSend(v12, "enumerateMovedIndexesUsingBlock:", v42);
      objc_msgSend(v12, "changedIndexes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v19;
      v39[1] = 3221225472;
      v39[2] = __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_3;
      v39[3] = &unk_1E51460E8;
      v23 = v20;
      v40 = v23;
      v41 = self;
      objc_msgSend(v22, "enumerateIndexesUsingBlock:", v39);
      if (objc_msgSend(v16, "count"))
      {
        v24 = 0;
      }
      else if (objc_msgSend(v17, "count"))
      {
        v24 = 0;
      }
      else
      {
        v24 = objc_msgSend(v12, "hasMoves") ^ 1;
      }
      v10 = v28;

      v11 = v29;
      v27 = MEMORY[0x1E0C809B0];
      v8 = v30;
      if ((v24 & 1) != 0)
        goto LABEL_17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      if (*p_dataSource)
      {
        -[PXCMMInvitationsDataSource firstItemIndexPath](*p_dataSource, "firstItemIndexPath");
        v26 = *p_dataSource;
      }
      else
      {
        v26 = 0;
      }
      v35[0] = v14;
      v35[1] = 3221225472;
      v35[2] = __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_4;
      v35[3] = &unk_1E5142450;
      v35[4] = self;
      v23 = v25;
      v36 = v23;
      v34[0] = v37;
      v34[1] = v38;
      -[PXCMMInvitationsDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](v26, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v34, 0, v35);

      v27 = v14;
      v8 = v30;
    }
    v31[0] = v27;
    v31[1] = 3221225472;
    v31[2] = __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_5;
    v31[3] = &unk_1E5142478;
    v32 = v10;
    v23 = v23;
    v33 = v23;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v31);

LABEL_17:
  }

}

- (id)invitationForGadget:(id)a3
{
  PXCMMInvitationsDataSource *dataSource;
  void *v4;
  void *v5;

  dataSource = self->_dataSource;
  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationsDataSource invitationForObjectID:](dataSource, "invitationForObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  PXCMMInvitationsDataSourceManager *dataSourceManager;
  PXCMMInvitationsDataSource *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;

  if ((void *)PXDataSourceManagerObservationContext_126468 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsGadgetProvider.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context == PXDataSourceManagerObservationContext"));

  }
  dataSourceManager = self->_dataSourceManager;
  v7 = self->_dataSource;
  -[PXSectionedDataSourceManager dataSource](dataSourceManager, "dataSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager changeHistory](self->_dataSourceManager, "changeHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXCMMInvitationsDataSource identifier](v7, "identifier");

  objc_msgSend(v8, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v9, objc_msgSend(v13, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMInvitationsGadgetProvider _setDataSource:changes:](self, "_setDataSource:changes:", v13, v10);
}

- (PXCMMInvitationsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXCMMWorkflowPresenting)workflowPresenter
{
  return self->_workflowPresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowPresenter, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "identifier");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v8[0] = v4;
  v8[1] = 0;
  v8[2] = a2;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "objectIDAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newGadgetForObjectID:", v6);
  objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v7, a2);

}

void __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, v5);

}

void __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(v7, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invitationForObjectID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setInvitation:", v6);
  }

}

void __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[2];

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  objc_msgSend(v3, "objectIDAtItemIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newGadgetForObjectID:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __57__PXCMMInvitationsGadgetProvider__setDataSource_changes___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v3, "removeAllGadgets");
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(v3, "addGadgets:", *(_QWORD *)(a1 + 40));

}

@end
