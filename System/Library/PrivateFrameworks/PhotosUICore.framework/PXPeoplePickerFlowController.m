@implementation PXPeoplePickerFlowController

- (PXPeoplePickerFlowController)initWithPeople:(id)a3
{
  id v6;
  PXPeoplePickerFlowController *v7;
  PXPeoplePickerFlowController *v8;
  NSMutableArray *v9;
  NSMutableArray *bootstrappedSourceUUIDs;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerFlowController.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("people.count > 0"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXPeoplePickerFlowController;
  v7 = -[PXPeoplePickerFlowController init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_people, a3);
    v8->_viewControllerIndex = -1;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bootstrappedSourceUUIDs = v8->_bootstrappedSourceUUIDs;
    v8->_bootstrappedSourceUUIDs = v9;

  }
  return v8;
}

- (PXPeoplePickerFlowController)initWithPeople:(id)a3 backingScaleFactor:(double)a4
{
  id v7;
  PXPeoplePickerFlowController *v8;
  PXPeoplePickerFlowController *v9;
  void *v11;

  v7 = a3;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerFlowController.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backingScaleFactor > 0"));

  }
  v8 = -[PXPeoplePickerFlowController initWithPeople:](self, "initWithPeople:", v7);
  v9 = v8;
  if (v8)
    v8->_backingScaleFactor = a4;

  return v9;
}

- (NSMutableArray)bootstrappedSourceUUIDs
{
  return (NSMutableArray *)(id)-[NSMutableArray copy](self->_bootstrappedSourceUUIDs, "copy");
}

- (NSArray)viewControllers
{
  NSArray *v3;
  void *v4;

  v3 = self->_viewControllers;
  if (!v3)
  {
    -[PXPeoplePickerFlowController people](self, "people");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeoplePickerFlowController _computeViewControllersForPeople:](self, "_computeViewControllersForPeople:", v4);

    v3 = self->_viewControllers;
  }
  return v3;
}

- (BOOL)hasNextViewController
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[PXPeoplePickerFlowController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[PXPeoplePickerFlowController viewControllerIndex](self, "viewControllerIndex");
  return v4 > 0 && v5 < v4 - 1;
}

- (PXPeopleFlowViewController)nextViewController
{
  int64_t v3;
  void *v4;
  void *v5;

  if (-[PXPeoplePickerFlowController hasNextViewController](self, "hasNextViewController"))
  {
    v3 = -[PXPeoplePickerFlowController viewControllerIndex](self, "viewControllerIndex") + 1;
    -[PXPeoplePickerFlowController setViewControllerIndex:](self, "setViewControllerIndex:", v3);
    -[PXPeoplePickerFlowController viewControllers](self, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PXPeopleFlowViewController *)v5;
}

- (BOOL)hasPreviousViewController
{
  return -[PXPeoplePickerFlowController viewControllerIndex](self, "viewControllerIndex") > 0;
}

- (PXPeopleFlowViewController)previousViewController
{
  int64_t v3;
  void *v4;
  void *v5;

  if (-[PXPeoplePickerFlowController hasPreviousViewController](self, "hasPreviousViewController"))
  {
    v3 = -[PXPeoplePickerFlowController viewControllerIndex](self, "viewControllerIndex") - 1;
    -[PXPeoplePickerFlowController setViewControllerIndex:](self, "setViewControllerIndex:", v3);
    -[PXPeoplePickerFlowController viewControllers](self, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PXPeopleFlowViewController *)v5;
}

- (void)done:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *bootstrappedSourceUUIDs;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXPeoplePickerFlowController contexts](self, "contexts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        objc_msgSend(v8, "sourcePerson");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_8;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "px_descriptionForAssertionMessage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerFlowController.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v14, v18);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerFlowController.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v14);
        }

LABEL_8:
        +[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:](PXPeopleBootstrap, "performBootstrapWithSourcePerson:context:synchronous:completion:", v9, v8, 0, 0);
        bootstrappedSourceUUIDs = self->_bootstrappedSourceUUIDs;
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](bootstrappedSourceUUIDs, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v5 = v16;
    }
    while (v16);
  }

  -[PXPeoplePickerFlowController flowDelegate](self, "flowDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "done:", v20);

}

- (void)cancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeoplePickerFlowController flowDelegate](self, "flowDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel:", v4);

}

- (void)_computeViewControllersForPeople:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, unint64_t, BOOL *);
  void *v12;
  PXPeoplePickerFlowController *v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[4];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __65__PXPeoplePickerFlowController__computeViewControllersForPeople___block_invoke;
  v12 = &unk_1E5148E88;
  v13 = self;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  v16 = v17;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);
  -[PXPeoplePickerFlowController setViewControllers:](self, "setViewControllers:", v8, v9, v10, v11, v12, v13);
  -[PXPeoplePickerFlowController setContexts:](self, "setContexts:", v7);

  _Block_object_dispose(v17, 8);
}

- (id)_dataSource
{
  PXPeopleSuggestionDataSource *v2;

  v2 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
  -[PXPeopleSuggestionDataSource setSuggestionFetchType:](v2, "setSuggestionFetchType:", 0);
  return v2;
}

- (BOOL)_hasMergeCandidatesForDataSource:(id)a3 person:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "fetchAndCacheMergeCandidatesForPerson:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (PXPeoplePickerFlowController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerFlowController.m"), 162, CFSTR("%s is not available as initializer"), "-[PXPeoplePickerFlowController init]");

  abort();
}

- (PXPeopleFlowDelegate)flowDelegate
{
  return (PXPeopleFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (void)setBootstrappedSourceUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrappedSourceUUIDs, a3);
}

- (NSArray)people
{
  return self->_people;
}

- (void)setViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)viewControllerIndex
{
  return self->_viewControllerIndex;
}

- (void)setViewControllerIndex:(int64_t)a3
{
  self->_viewControllerIndex = a3;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (void)setBackingScaleFactor:(double)a3
{
  self->_backingScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_bootstrappedSourceUUIDs, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
}

void __65__PXPeoplePickerFlowController__computeViewControllersForPeople___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXPeopleBootstrapConfirmationViewController *v15;
  PXPeopleBootstrapSummaryViewController *v16;
  void *v17;
  void *v18;
  BOOL v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_hasMergeCandidatesForDataSource:person:", v8, v7))
  {
    +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v7, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWantsNaming:", 0);
    objc_msgSend(*(id *)(a1 + 32), "backingScaleFactor");
    objc_msgSend(v9, "setBackingScaleFactor:");
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/Photo Picker/People Picker/Shared/PXPeoplePickerFlowController.m"), "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v12, v13, "-[PXPeoplePickerFlowController _computeViewControllersForPeople:]_block_invoke", 125);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCallerInfo:", v14);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v15 = -[PXPeopleBootstrapConfirmationViewController initWithContext:dataSource:]([PXPeopleBootstrapConfirmationViewController alloc], "initWithContext:dataSource:", v9, v8);
    -[PXPeopleBootstrapConfirmationViewController setUseLowMemoryMode:](v15, "setUseLowMemoryMode:", 1);
    v16 = -[PXPeopleBootstrapSummaryViewController initWithContext:]([PXPeopleBootstrapSummaryViewController alloc], "initWithContext:", v9);
    -[PXPeopleBootstrapSummaryViewController setUseLowMemoryMode:](v16, "setUseLowMemoryMode:", 1);
    v17 = *(void **)(a1 + 48);
    v21[0] = v15;
    v21[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  v20 = a3 > 9 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 4;
  *a4 = v20;

}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeoplePickerFlowController.m"), 166, CFSTR("%s is not available as initializer"), "+[PXPeoplePickerFlowController new]");

  abort();
}

@end
