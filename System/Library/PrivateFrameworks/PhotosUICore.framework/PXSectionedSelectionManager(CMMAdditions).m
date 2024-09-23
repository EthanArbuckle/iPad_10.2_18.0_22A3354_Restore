@implementation PXSectionedSelectionManager(CMMAdditions)

- (void)selectNonCopiedAssetsWithImportStatusManager:()CMMAdditions
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _OWORD v28[2];

  v5 = a3;
  objc_msgSend(a1, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSectionedSelectionManager+CMM.m"), 20, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("dataSourceSnapshot"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSectionedSelectionManager+CMM.m"), 20, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("dataSourceSnapshot"), v19);
  }

LABEL_3:
  objc_msgSend(off_1E50B3668, "indexPathSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "firstItemIndexPath");
  else
    memset(v28, 0, sizeof(v28));
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke;
  v24[3] = &unk_1E513B078;
  v10 = v7;
  v25 = v10;
  v11 = v5;
  v26 = v11;
  v12 = v8;
  v27 = v12;
  objc_msgSend(v10, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v28, 0, v24);
  objc_msgSend(v6, "selectedIndexPaths");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v12)
  {

    v16 = v12;
    goto LABEL_10;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, "isEqual:", v12);

  if ((v15 & 1) == 0)
  {
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke_2;
    v22[3] = &unk_1E513C668;
    v23 = v12;
    objc_msgSend(a1, "performChanges:", v22);
    v16 = v23;
LABEL_10:

  }
}

@end
