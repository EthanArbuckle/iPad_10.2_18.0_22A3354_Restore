@implementation PXStoryMemoryFeedActionPerformer

- (PXStoryMemoryFeedActionPerformer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedActionPerformer.m"), 41, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryFeedActionPerformer init]");

  abort();
}

- (PXStoryMemoryFeedActionPerformer)initWithViewControllerSetupBlock:(id)a3
{
  id v4;
  PXStoryMemoryFeedActionPerformer *v5;
  uint64_t v6;
  id viewControllerSetupBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMemoryFeedActionPerformer;
  v5 = -[PXStoryMemoryFeedActionPerformer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    viewControllerSetupBlock = v5->_viewControllerSetupBlock;
    v5->_viewControllerSetupBlock = (id)v6;

  }
  return v5;
}

- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 fromViewController:(id)a5
{
  id v9;
  __int128 v10;
  void *v11;
  BOOL v12;
  void *v14;
  _OWORD v15[2];

  v9 = a5;
  v10 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v10;
  objc_msgSend(a4, "objectReferenceAtIndexPath:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedActionPerformer.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference != nil"));

  }
  v12 = -[PXStoryMemoryFeedActionPerformer navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:](self, "navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:", v11, CFSTR("ForYou"), v9, 1, 0, 0);

  return v12;
}

- (BOOL)navigateToObjectReference:(id)a3 originalSource:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 willPresentHandler:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  void (**v16)(id, id);
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  v10 = a6;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, id))a7;
  v17 = a8;
  PXStoryConfigurationForObjectReference(a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "configureWithNavigationSource:", v14);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "enableProtoPlayground");

    if (v21)
    {
      PXSoftLinkedProtoMemoriesPlayerViewController(v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
    }
    else
    {
      v31 = 0;
      +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:](PXStoryUIFactory, "viewControllerWithConfiguration:contentViewController:", v19, &v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v31;
    }
    -[PXStoryMemoryFeedActionPerformer viewControllerSetupBlock](self, "viewControllerSetupBlock");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[PXStoryMemoryFeedActionPerformer viewControllerSetupBlock](self, "viewControllerSetupBlock");
      v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v25)[2](v25, v23);

    }
    if (v16)
      v16[2](v16, v23);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __142__PXStoryMemoryFeedActionPerformer_navigateToObjectReference_originalSource_fromViewController_animated_willPresentHandler_completionHandler___block_invoke;
    v28[3] = &unk_1E5148CE0;
    v29 = v23;
    v30 = v17;
    v26 = v23;
    -[PXStoryMemoryFeedActionPerformer _presentViewController:contentViewController:fromViewController:animated:completion:](self, "_presentViewController:contentViewController:fromViewController:animated:completion:", v22, v26, v15, v10, v28);

  }
  return v19 != 0;
}

- (void)deleteItemsInSelection:(id)a3 undoManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PXStoryMemoryFeedActionPerformer *v14;

  v6 = a4;
  objc_msgSend(a3, "fetchSelectedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_2;
  v11[3] = &unk_1E5142230;
  v12 = v8;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v8;
  PXMemoriesDeleteConfirmationAlertShow(v10, 0, v11);

}

- (void)_presentViewController:(id)a3 contentViewController:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = a6;
  if (a4)
    v12 = a4;
  else
    v12 = a3;
  v13 = v12;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[PXGViewControllerTransition prepareTransitionFromSummaryViewController:toPresentedViewController:detailViewController:](PXGViewControllerTransition, "prepareTransitionFromSummaryViewController:toPresentedViewController:detailViewController:", v15, v17, v13);
  objc_msgSend(v15, "presentViewController:animated:completion:", v17, v8, v14);

}

- (id)viewControllerSetupBlock
{
  return self->_viewControllerSetupBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewControllerSetupBlock, 0);
}

void __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_2(_QWORD *a1, int a2)
{
  PXRejectMemoriesAction *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (a2)
  {
    v3 = -[PXMemoriesAction initWithMemories:]([PXRejectMemoriesAction alloc], "initWithMemories:", a1[4]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_3;
    v5[3] = &unk_1E5148B78;
    v4 = a1[5];
    v5[4] = a1[6];
    -[PXAction executeWithUndoManager:completionHandler:](v3, "executeWithUndoManager:completionHandler:", v4, v5);

  }
}

void __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed execute reject memories action for %@. Error: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

uint64_t __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetCollection");
}

uint64_t __142__PXStoryMemoryFeedActionPerformer_navigateToObjectReference_originalSource_fromViewController_animated_willPresentHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

@end
