@implementation PXStoryChapterCollectionAction

- (PXStoryChapterCollectionAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapterCollectionAction.m"), 33, CFSTR("%s is not available as initializer"), "-[PXStoryChapterCollectionAction init]");

  abort();
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 editChapterWithIdentifier:(id)a4 changeRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXStoryConcreteChapterCollectionChapterModification *v11;
  void *v12;
  PXStoryChapterCollectionAction *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PXStoryConcreteChapterCollectionChapterModification initWithEditedChapterIdentifier:chapterChangeRequest:]([PXStoryConcreteChapterCollectionChapterModification alloc], "initWithEditedChapterIdentifier:chapterChangeRequest:", v9, v8);

  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXStoryChapterCollectionAction initWithChapterCollectionManager:edits:](self, "initWithChapterCollectionManager:edits:", v10, v12);

  return v13;
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 insertChapterWithFirstAsset:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXStoryConcreteChapterCollectionChapterInsertion *v11;
  void *v12;
  PXStoryChapterCollectionAction *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PXStoryConcreteChapterCollectionChapterInsertion initWithFirstAsset:chapterConfiguration:]([PXStoryConcreteChapterCollectionChapterInsertion alloc], "initWithFirstAsset:chapterConfiguration:", v9, v8);

  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXStoryChapterCollectionAction initWithChapterCollectionManager:edits:](self, "initWithChapterCollectionManager:edits:", v10, v12);

  return v13;
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 deleteChapterWithIdentifier:(id)a4
{
  id v6;
  id v7;
  PXStoryConcreteChapterCollectionChapterDeletion *v8;
  void *v9;
  PXStoryChapterCollectionAction *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[PXStoryConcreteChapterCollectionChapterDeletion initWithDeletedChapterIdentifier:]([PXStoryConcreteChapterCollectionChapterDeletion alloc], "initWithDeletedChapterIdentifier:", v6);

  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryChapterCollectionAction initWithChapterCollectionManager:edits:](self, "initWithChapterCollectionManager:edits:", v7, v9);

  return v10;
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 edits:(id)a4
{
  id v7;
  id v8;
  PXStoryChapterCollectionAction *v9;
  PXStoryChapterCollectionAction *v10;
  uint64_t v11;
  NSArray *edits;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *originalChapters;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PXStoryChapterCollectionAction;
  v9 = -[PXStoryChapterCollectionAction init](&v38, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chapterCollectionManager, a3);
    v11 = objc_msgSend(v8, "copy");
    edits = v10->_edits;
    v10->_edits = (NSArray *)v11;

    v30 = v7;
    objc_msgSend(v7, "chapterCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PXStoryChapterCollectionAction_initWithChapterCollectionManager_edits___block_invoke;
    aBlock[3] = &unk_1E5121440;
    v15 = v13;
    v36 = v15;
    v16 = v14;
    v37 = v16;
    v17 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (!v19)
      goto LABEL_14;
    v20 = v19;
    v21 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v24 = objc_msgSend(v23, "kind");
        if (v24 == 3)
        {
          objc_msgSend(v23, "deletedChapterIdentifier");
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v24 != 1)
            continue;
          objc_msgSend(v23, "editedChapterIdentifier");
          v25 = objc_claimAutoreleasedReturnValue();
        }
        v26 = (void *)v25;
        v17[2](v17, v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (!v20)
      {
LABEL_14:

        v27 = objc_msgSend(v16, "copy");
        originalChapters = v10->_originalChapters;
        v10->_originalChapters = (NSArray *)v27;

        v7 = v30;
        break;
      }
    }
  }

  return v10;
}

- (void)performAction:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[6];

  v5 = a3;
  -[PXStoryChapterCollectionAction chapterCollectionManager](self, "chapterCollectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PXStoryChapterCollectionAction_performAction___block_invoke;
  v7[3] = &unk_1E5121468;
  v7[4] = self;
  v7[5] = a2;
  objc_msgSend(v6, "performChanges:completionHandler:", v7, v5);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[PXStoryChapterCollectionAction chapterCollectionManager](self, "chapterCollectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXStoryChapterCollectionAction_performUndo___block_invoke;
  v6[3] = &unk_1E51214B8;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:completionHandler:", v6, v4);

}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  return self->_chapterCollectionManager;
}

- (NSArray)edits
{
  return self->_edits;
}

- (NSArray)originalChapters
{
  return self->_originalChapters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChapters, 0);
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_chapterCollectionManager, 0);
}

void __46__PXStoryChapterCollectionAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "originalChapters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __46__PXStoryChapterCollectionAction_performUndo___block_invoke_2;
        v12[3] = &unk_1E5121490;
        v12[4] = v10;
        objc_msgSend(v3, "editChapterWithIdentifier:changeRequest:", v11, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __46__PXStoryChapterCollectionAction_performUndo___block_invoke_2(uint64_t a1, void *a2)
{
  PXStoryMutableChapterSetChapter(a2, *(void **)(a1 + 32));
}

void __48__PXStoryChapterCollectionAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "edits", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        switch(objc_msgSend(v9, "kind"))
        {
          case 0:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXStoryChapterCollectionAction.m"), 92, CFSTR("Code which should be unreachable has been reached"));

            abort();
          case 1:
            v10 = v9;
            objc_msgSend(v10, "editedChapterIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "chapterChangeRequest");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "editChapterWithIdentifier:changeRequest:", v11, v12);
            goto LABEL_9;
          case 2:
            v13 = v9;
            objc_msgSend(v13, "firstAsset");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "chapterConfiguration");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "insertChapterWithFirstAsset:configuration:", v11, v12);
LABEL_9:

            goto LABEL_11;
          case 3:
            objc_msgSend(v9, "deletedChapterIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "deleteChapterWithIdentifier:", v11);
LABEL_11:

            break;
          default:
            continue;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

void __73__PXStoryChapterCollectionAction_initWithChapterCollectionManager_edits___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*(id *)(a1 + 32), "indexOfChapterWithIdentifier:", a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "chapterAtIndex:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

@end
