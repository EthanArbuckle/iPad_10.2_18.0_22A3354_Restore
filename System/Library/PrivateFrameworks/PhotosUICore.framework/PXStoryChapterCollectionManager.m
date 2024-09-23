@implementation PXStoryChapterCollectionManager

- (PXStoryChapterCollectionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapterCollectionManager.m"), 35, CFSTR("%s is not available as initializer"), "-[PXStoryChapterCollectionManager init]");

  abort();
}

- (PXStoryChapterCollectionManager)initWithChapterCollection:(id)a3
{
  id v5;
  PXStoryChapterCollectionManager *v6;
  PXStoryChapterCollectionManager *v7;
  NSMutableArray *v8;
  NSMutableArray *pendingEdits;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryChapterCollectionManager;
  v6 = -[PXStoryChapterCollectionManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_chapterCollection, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingEdits = v7->_pendingEdits;
    v7->_pendingEdits = v8;

  }
  return v7;
}

- (void)performChanges:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke;
  v10[3] = &unk_1E512D8C8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[PXStoryChapterCollectionManager performChanges:](self, "performChanges:", v10);

}

- (void)didPerformChanges
{
  void *v3;
  void *v4;
  void *v5;
  PXStoryConcreteChapterCollectionEditTransaction *v6;
  void *v7;
  PXStoryConcreteChapterCollectionEditTransaction *v8;
  _BOOL8 v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryChapterCollectionManager;
  -[PXStoryChapterCollectionManager didPerformChanges](&v13, sel_didPerformChanges);
  -[PXStoryChapterCollectionManager pendingEdits](self, "pendingEdits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[PXStoryChapterCollectionManager pendingEdits](self, "pendingEdits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  if (objc_msgSend(v4, "count"))
  {
    v6 = [PXStoryConcreteChapterCollectionEditTransaction alloc];
    -[PXStoryChapterCollectionManager chapterCollection](self, "chapterCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXStoryConcreteChapterCollectionEditTransaction initWithOriginalChapterCollection:edits:](v6, "initWithOriginalChapterCollection:edits:", v7, v4);

    v12 = 0;
    v9 = -[PXStoryChapterCollectionManager applyEditTransaction:error:](self, "applyEditTransaction:error:", v8, &v12);
    v10 = v12;

  }
  else
  {
    v10 = 0;
    v9 = 1;
  }
  -[PXStoryChapterCollectionManager pendingCompletionHandler](self, "pendingCompletionHandler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PXStoryChapterCollectionManager setPendingCompletionHandler:](self, "setPendingCompletionHandler:", 0);
    ((void (**)(_QWORD, _BOOL8, id))v11)[2](v11, v9, v10);
  }

}

- (BOOL)applyEditTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryChapterCollectionManager applyEditTransaction:error:]", v8);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PXStoryChapterCollectionManagerErrorDomain"), 1, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)setChapterCollection:(id)a3
{
  PXStoryChapterCollection *v5;
  PXStoryChapterCollection *v6;

  v5 = (PXStoryChapterCollection *)a3;
  if (self->_chapterCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_chapterCollection, a3);
    -[PXStoryChapterCollectionManager signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)editChapterWithIdentifier:(id)a3 changeRequest:(id)a4
{
  id v6;
  id v7;
  PXStoryConcreteChapterCollectionChapterModification *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXStoryChapterCollectionManager pendingEdits](self, "pendingEdits");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryConcreteChapterCollectionChapterModification initWithEditedChapterIdentifier:chapterChangeRequest:]([PXStoryConcreteChapterCollectionChapterModification alloc], "initWithEditedChapterIdentifier:chapterChangeRequest:", v7, v6);

  objc_msgSend(v9, "addObject:", v8);
}

- (void)insertChapterWithFirstAsset:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  PXStoryConcreteChapterCollectionChapterInsertion *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXStoryChapterCollectionManager pendingEdits](self, "pendingEdits");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryConcreteChapterCollectionChapterInsertion initWithFirstAsset:chapterConfiguration:]([PXStoryConcreteChapterCollectionChapterInsertion alloc], "initWithFirstAsset:chapterConfiguration:", v7, v6);

  objc_msgSend(v9, "addObject:", v8);
}

- (void)deleteChapterWithIdentifier:(id)a3
{
  id v4;
  PXStoryConcreteChapterCollectionChapterDeletion *v5;
  id v6;

  v4 = a3;
  -[PXStoryChapterCollectionManager pendingEdits](self, "pendingEdits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PXStoryConcreteChapterCollectionChapterDeletion initWithDeletedChapterIdentifier:]([PXStoryConcreteChapterCollectionChapterDeletion alloc], "initWithDeletedChapterIdentifier:", v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)deleteAllChapters
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  PXStoryConcreteChapterCollectionChapterDeletion *v8;
  void *v9;
  PXStoryConcreteChapterCollectionChapterDeletion *v10;
  void *v11;
  id v12;

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryChapterCollectionManager chapterCollection](self, "chapterCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfChapters");

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      -[PXStoryChapterCollectionManager chapterCollection](self, "chapterCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chapterAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = [PXStoryConcreteChapterCollectionChapterDeletion alloc];
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PXStoryConcreteChapterCollectionChapterDeletion initWithDeletedChapterIdentifier:](v8, "initWithDeletedChapterIdentifier:", v9);

      objc_msgSend(v12, "addObject:", v10);
    }
  }
  -[PXStoryChapterCollectionManager pendingEdits](self, "pendingEdits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (id)pendingCompletionHandler
{
  return self->_pendingCompletionHandler;
}

- (void)setPendingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSMutableArray)pendingEdits
{
  return self->_pendingEdits;
}

- (void)setPendingEdits:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEdits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEdits, 0);
  objc_storeStrong(&self->_pendingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
}

uint64_t __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingCompletionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke_2;
    v9[3] = &unk_1E512D8A0;
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    objc_msgSend(v6, "setPendingCompletionHandler:", v9);

  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), a3, a4);
}

void __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
