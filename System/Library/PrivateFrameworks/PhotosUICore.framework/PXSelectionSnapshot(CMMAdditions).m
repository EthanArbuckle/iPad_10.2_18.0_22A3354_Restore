@implementation PXSelectionSnapshot(CMMAdditions)

- (uint64_t)areAllUnsavedAssetsSelectedWithImportStatusManager:()CMMAdditions
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  _OWORD v23[2];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v5 = a3;
  objc_msgSend(a1, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 1;
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSectionedSelectionManager+CMM.m"), 44, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSectionedSelectionManager+CMM.m"), 44, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v15);
  }

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  if (!v7)
  {
    memset(v23, 0, sizeof(v23));
    goto LABEL_5;
  }
LABEL_4:
  objc_msgSend(v7, "firstItemIndexPath");
LABEL_5:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PXSelectionSnapshot_CMMAdditions__areAllUnsavedAssetsSelectedWithImportStatusManager___block_invoke;
  v18[3] = &unk_1E513B0A0;
  v8 = v7;
  v19 = v8;
  v9 = v5;
  v20 = v9;
  v10 = v6;
  v21 = v10;
  v22 = &v24;
  objc_msgSend(v8, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v23, 0, v18);
  v11 = *((unsigned __int8 *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v11;
}

@end
