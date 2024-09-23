@implementation _UISaveToCameraRollSaveItemsController

- (_UISaveToCameraRollSaveItemsController)initWithItems:(id)a3 saveCompletionBlock:(id)a4
{
  id v7;
  id v8;
  _UISaveToCameraRollSaveItemsController *v9;
  _UISaveToCameraRollSaveItemsController *v10;
  uint64_t v11;
  id saveCompletionBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISaveToCameraRollSaveItemsController;
  v9 = -[_UISaveToCameraRollSaveItemsController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemsToSchedule, a3);
    v10->_successToReport = 1;
    v11 = MEMORY[0x1A1AE9514](v8);
    saveCompletionBlock = v10->_saveCompletionBlock;
    v10->_saveCompletionBlock = (id)v11;

  }
  return v10;
}

- (void)beginSaving
{
  NSArray *v3;
  NSArray *itemsToSchedule;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = self->_itemsToSchedule;
  itemsToSchedule = self->_itemsToSchedule;
  self->_itemsToSchedule = 0;

  self->_pendingSaveCount += -[NSArray count](v3, "count");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_UISaveToCameraRollSaveItemsController beginSavingItem:](self, "beginSavingItem:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)beginSavingItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UISaveToCameraRollSaveItemsController _saveImage:](self, "_saveImage:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 1, &v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      v7 = v6;
      if (v5)
      {
        -[_UISaveToCameraRollSaveItemsController _saveImageData:](self, "_saveImageData:", v5);
      }
      else
      {
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[_UISaveToCameraRollSaveItemsController _didCompleteSavingItem:error:contextInfo:](self, "_didCompleteSavingItem:error:contextInfo:", 0, v7, 0);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_UISaveToCameraRollSaveItemsController _saveImageData:](self, "_saveImageData:", v4);
      }
      else if (_UIActivityItemIsLivePhoto(v4))
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __58___UISaveToCameraRollSaveItemsController_beginSavingItem___block_invoke;
        v8[3] = &unk_1E4003530;
        v8[4] = self;
        v9 = v4;
        objc_msgSend(v9, "saveToPhotoLibraryWithCompletionHandler:", v8);

      }
      else
      {
        -[_UISaveToCameraRollSaveItemsController _saveVideoAtPath:](self, "_saveVideoAtPath:", v4);
      }
    }
  }

}

- (void)_saveImage:(id)a3
{
  UIImageWriteToSavedPhotosAlbum((UIImage *)a3, self, sel__didCompleteSavingItem_error_contextInfo_, 0);
}

- (void)_saveImageData:(id)a3
{
  UIImageDataWriteToSavedPhotosAlbum();
}

- (void)_saveVideoAtPath:(id)a3
{
  UISaveVideoAtPathToSavedPhotosAlbum((NSString *)a3, self, sel__didCompleteSavingItem_error_contextInfo_, 0);
}

- (void)_didCompleteSavingItem:(id)a3 error:(id)a4 contextInfo:(void *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___UISaveToCameraRollSaveItemsController__didCompleteSavingItem_error_contextInfo___block_invoke;
  block[3] = &unk_1E4001730;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_noteDidCompleteSavingItem:(id)a3 error:(id)a4
{
  NSError *errorToReport;
  NSError **p_errorToReport;

  p_errorToReport = &self->_errorToReport;
  errorToReport = self->_errorToReport;
  --self->_pendingSaveCount;
  if (errorToReport)
    a4 = errorToReport;
  objc_storeStrong((id *)&self->_errorToReport, a4);
  *((_BYTE *)p_errorToReport - 32) = *p_errorToReport == 0;
  if (!*(p_errorToReport - 1))
    -[_UISaveToCameraRollSaveItemsController _invokeSaveCompletionBlock](self, "_invokeSaveCompletionBlock");
}

- (void)_invokeSaveCompletionBlock
{
  id saveCompletionBlock;
  void (**v4)(id, BOOL, NSError *);

  v4 = (void (**)(id, BOOL, NSError *))MEMORY[0x1A1AE9514](self->_saveCompletionBlock, a2);
  saveCompletionBlock = self->_saveCompletionBlock;
  self->_saveCompletionBlock = 0;

  v4[2](v4, self->_successToReport, self->_errorToReport);
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (NSArray)itemsToSchedule
{
  return self->_itemsToSchedule;
}

- (int64_t)pendingSaveCount
{
  return self->_pendingSaveCount;
}

- (NSError)errorToReport
{
  return self->_errorToReport;
}

- (BOOL)successToReport
{
  return self->_successToReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_itemsToSchedule, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
}

@end
