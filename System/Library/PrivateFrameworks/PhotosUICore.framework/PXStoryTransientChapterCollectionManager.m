@implementation PXStoryTransientChapterCollectionManager

- (PXStoryTransientChapterCollectionManager)initWithUneditedChapterCollection:(id)a3
{
  id v5;
  PXStoryTransientChapterCollectionManager *v6;
  PXStoryTransientChapterCollectionManager *v7;
  uint64_t v8;
  PXUpdater *updater;
  NSArray *v10;
  NSArray *edits;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryTransientChapterCollectionManager;
  v6 = -[PXStoryChapterCollectionManager initWithChapterCollection:](&v13, sel_initWithChapterCollection_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uneditedChapterCollection, a3);
    v8 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateChapterCollection);
    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    edits = v7->_edits;
    v7->_edits = v10;

  }
  return v7;
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  -[PXStoryTransientChapterCollectionManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)PXStoryTransientChapterCollectionManager;
  -[PXStoryChapterCollectionManager didPerformChanges](&v4, sel_didPerformChanges);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransientChapterCollectionManager;
  -[PXStoryTransientChapterCollectionManager performChanges:](&v3, sel_performChanges_, a3);
}

- (BOOL)applyEditTransaction:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  v15 = 0;
  v7 = -[PXStoryTransientChapterCollectionManager _validateEditTransaction:error:](self, "_validateEditTransaction:error:", v6, &v15);
  v8 = v15;
  if (v7)
  {
    -[PXStoryTransientChapterCollectionManager edits](self, "edits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "edits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTransientChapterCollectionManager setEdits:](self, "setEdits:", v11);

    -[PXStoryTransientChapterCollectionManager updater](self, "updater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateIfNeeded");

    -[PXStoryTransientChapterCollectionManager persistenceDelegate](self, "persistenceDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chapterCollectionManager:didApplyEditTransaction:", self, v6);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)_validateEditTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v12;

  v5 = a3;
  objc_msgSend(v5, "originalChapterCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EEA18BE0) & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v5, "edits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v7, "canApplyEdits:error:", v8, &v12);

    v10 = v12;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXStoryChapterErrorDomain"), 3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v10);
LABEL_6:

  return v9;
}

- (void)setEdits:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *edits;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_edits;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      edits = self->_edits;
      self->_edits = v6;

      -[PXStoryTransientChapterCollectionManager _invalidateChapterCollection](self, "_invalidateChapterCollection");
    }
  }

}

- (void)_setNeedsUpdate
{
  -[PXStoryTransientChapterCollectionManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateChapterCollection
{
  id v2;

  -[PXStoryTransientChapterCollectionManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChapterCollection);

}

- (void)_updateChapterCollection
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  -[PXStoryTransientChapterCollectionManager uneditedChapterCollection](self, "uneditedChapterCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransientChapterCollectionManager edits](self, "edits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v3;
  v7 = v6;
  v8 = v6;
  if (v5)
  {
    v9 = (id)objc_msgSend(v6, "copyByApplyingEdits:", v4);

    v8 = v9;
  }
  v10 = v8;
  -[PXStoryChapterCollectionManager setChapterCollection:](self, "setChapterCollection:", v8);

}

- (void)setUneditedChapterCollection:(id)a3
{
  PXStoryChapterCollection *v5;
  PXStoryChapterCollection *v6;

  v5 = (PXStoryChapterCollection *)a3;
  if (self->_uneditedChapterCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_uneditedChapterCollection, a3);
    -[PXStoryTransientChapterCollectionManager _invalidateChapterCollection](self, "_invalidateChapterCollection");
    v5 = v6;
  }

}

- (PXStoryChapterCollection)uneditedChapterCollection
{
  return self->_uneditedChapterCollection;
}

- (PXStoryTransientChapterCollectionManagerPersistenceDelegate)persistenceDelegate
{
  return (PXStoryTransientChapterCollectionManagerPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_persistenceDelegate);
}

- (void)setPersistenceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_persistenceDelegate, a3);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSArray)edits
{
  return self->_edits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_persistenceDelegate);
  objc_storeStrong((id *)&self->_uneditedChapterCollection, 0);
}

@end
