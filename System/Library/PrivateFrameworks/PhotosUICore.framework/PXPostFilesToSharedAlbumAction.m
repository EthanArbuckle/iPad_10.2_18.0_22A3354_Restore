@implementation PXPostFilesToSharedAlbumAction

- (PXPostFilesToSharedAlbumAction)initWithSharedAlbum:(id)a3 fileURLs:(id)a4 comment:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PXPostFilesToSharedAlbumAction *v14;
  uint64_t v15;
  NSArray *fileURLs;
  uint64_t v17;
  NSString *comment;
  void *v20;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPostFilesToSharedAlbumAction.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedAlbum"));

  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPostFilesToSharedAlbumAction.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURLs.count"));

  }
  objc_msgSend(v10, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)PXPostFilesToSharedAlbumAction;
  v14 = -[PXPhotosAction initWithPhotoLibrary:](&v22, sel_initWithPhotoLibrary_, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharedAlbum, a3);
    v15 = objc_msgSend(v11, "copy");
    fileURLs = v14->_fileURLs;
    v14->_fileURLs = (NSArray *)v15;

    v17 = objc_msgSend(v12, "copy");
    comment = v14->_comment;
    v14->_comment = (NSString *)v17;

  }
  return v14;
}

- (id)actionIdentifier
{
  return CFSTR("PostFilesToSharedAlbum");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXPostToSharedAlbumActionName");
}

- (void)performAction:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSArray *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *comment;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(id, _QWORD, id);
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = self->_fileURLs;
  if (!-[NSArray count](v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<PLStreamShareSource *> * _Nullable _StreamShareSourcesForFileURLs(NSArray<NSURL *> *__strong, NSError *__autoreleasing *)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPostFilesToSharedAlbumAction.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURLs.count"));

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__181326;
  v33 = __Block_byref_object_dispose__181327;
  v34 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___StreamShareSourcesForFileURLs_block_invoke;
  v25[3] = &unk_1E5132438;
  v8 = v6;
  v26 = v8;
  v27 = &v35;
  v28 = &v29;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v25);
  if (*((_BYTE *)v36 + 24))
  {
    v9 = v8;
    v10 = 0;
  }
  else
  {
    v10 = objc_retainAutorelease((id)v30[5]);
    v9 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  v11 = v10;
  if (!v9)
  {
    v4[2](v4, 0, v11);
    goto LABEL_11;
  }
  -[PHCloudSharedAlbum pl_assetContainer](self->_sharedAlbum, "pl_assetContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPostFilesToSharedAlbumAction performAction:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXPostFilesToSharedAlbumAction.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_sharedAlbum.pl_assetContainer"), v20);
LABEL_14:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPostFilesToSharedAlbumAction performAction:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXPostFilesToSharedAlbumAction.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_sharedAlbum.pl_assetContainer"), v20, v22);

    goto LABEL_14;
  }
LABEL_9:
  v13 = (void *)MEMORY[0x1E0D71648];
  comment = self->_comment;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __48__PXPostFilesToSharedAlbumAction_performAction___block_invoke;
  v23[3] = &unk_1E51417E8;
  v24 = v4;
  objc_msgSend(v13, "publishMediaFromSources:toSharedAlbum:withCommentText:completionHandler:", v9, v12, comment, v23);

LABEL_11:
}

- (void)performUndo:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", CFSTR("No undo support for post actions"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
}

uint64_t __48__PXPostFilesToSharedAlbumAction_performAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
