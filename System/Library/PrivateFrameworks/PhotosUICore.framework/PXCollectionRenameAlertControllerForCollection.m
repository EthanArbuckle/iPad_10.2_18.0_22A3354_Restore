@implementation PXCollectionRenameAlertControllerForCollection

void __PXCollectionRenameAlertControllerForCollection_block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  PXRenameCollectionAction *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if ((a3 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CD13C8];
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v7, "validateAssetCollectionTitle:error:", v8, &v18);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v18;

    if (-[NSObject length](v9, "length"))
    {
      v11 = -[PXRenameCollectionAction initWithCollection:title:]([PXRenameCollectionAction alloc], "initWithCollection:title:", *(_QWORD *)(a1 + 32), v9);
      if (v11)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __PXCollectionRenameAlertControllerForCollection_block_invoke_165;
        v16[3] = &unk_1E51417E8;
        v12 = *(_QWORD *)(a1 + 40);
        v17 = *(id *)(a1 + 48);
        -[PXAction executeWithUndoManager:completionHandler:](v11, "executeWithUndoManager:completionHandler:", v12, v16);
        v13 = v17;
      }
      else
      {
        PLUIGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v15 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v20 = v15;
          v21 = 2112;
          v22 = v9;
          _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "unable to create action to rename %@ to '%@'", buf, 0x16u);
        }
      }

    }
    else
    {
      PLUIGetLog();
      v11 = (PXRenameCollectionAction *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v14;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_1A6789000, &v11->super.super.super, OS_LOG_TYPE_ERROR, "unable to get a valid title for input '%@': %@", buf, 0x16u);

      }
    }

  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "title editor did not succeed", buf, 2u);
    }
  }

}

uint64_t __PXCollectionRenameAlertControllerForCollection_block_invoke_165(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL __PXCollectionRenameAlertControllerForCollection_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x1E0CD13C8];
  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validateAssetCollectionTitle:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

@end
