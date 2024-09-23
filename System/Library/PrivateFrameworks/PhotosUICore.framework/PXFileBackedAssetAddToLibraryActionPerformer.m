@implementation PXFileBackedAssetAddToLibraryActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3
{
  return objc_msgSend(a3, "isAnyItemSelected");
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[4];
  id v24;
  id v25;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAnyItemSelected") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No items selected for add to library action"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v4);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXFileBackedAssetAddToLibraryActionPerformer.m"), 40, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("snapshot.dataSource"), v15);
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXFileBackedAssetAddToLibraryActionPerformer.m"), 40, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("snapshot.dataSource"), v15, v17);

    goto LABEL_12;
  }
LABEL_4:
  objc_msgSend(v3, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke;
  v23[3] = &unk_1E5142450;
  v9 = v6;
  v24 = v9;
  v10 = v5;
  v25 = v10;
  objc_msgSend(v7, "enumerateItemIndexPathsUsingBlock:", v23);

  if (v4)
  {
    objc_initWeak(&location, self);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
    v20[3] = &unk_1E5149198;
    v21 = v10;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_3;
    v18[3] = &unk_1E5144F70;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v4, "performChanges:completionHandler:", v20, v18);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to acquire photo library to save to"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v11);

  }
LABEL_9:

}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _OWORD v14[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v14[0] = *a2;
  v14[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXFileBackedAssetAddToLibraryActionPerformer.m"), 42, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXFileBackedAssetAddToLibraryActionPerformer.m"), 42, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = (id)objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromImageAtFileURL:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;

  v5 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v8 = a2;
  v6 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v7);
}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_completeSaveWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
