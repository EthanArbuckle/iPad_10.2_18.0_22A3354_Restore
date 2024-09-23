@implementation PXCreateSharedAlbumActionPerformer

- (void)performLemonadeUserInteractionTask
{
  PXCreateSharedAlbumActionPerformer *v2;

  v2 = self;
  PXCreateSharedAlbumActionPerformer.performLemonadeUserInteractionTask()();

}

- (PXCreateSharedAlbumActionPerformer)initWithPhotoLibrary:(id)a3 presentationEnvironment:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXCreateSharedAlbumActionPerformer *v10;
  PXCreateSharedAlbumActionPerformer *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedAlbumActionPerformer.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedAlbumActionPerformer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)PXCreateSharedAlbumActionPerformer;
  v10 = -[PXActionPerformer initWithActionType:](&v15, sel_initWithActionType_, CFSTR("PXActionCreateEmptySharedAlbum"));
  v11 = v10;
  if (v10)
  {
    -[PXCreateSharedAlbumActionPerformer setPhotoLibrary:](v10, "setPhotoLibrary:", v7);
    -[PXActionPerformer setPresentationEnvironment:](v11, "setPresentationEnvironment:", v9);
  }

  return v11;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  -[PXCreateSharedAlbumActionPerformer photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedAlbumActionPerformer.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

  }
  v6 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v8 = objc_msgSend(v6, "canCreateStreamInPhotoLibrary:error:", v7, &v24);
  v9 = v24;

  if (!v8)
  {
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedFailureReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke_4;
    v21[3] = &unk_1E51458F8;
    v21[4] = self;
    v22 = v9;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAction:", v17);
    objc_msgSend(v5, "presentViewController:animated:completionHandler:", v14, 1, 0);

LABEL_8:
    goto LABEL_9;
  }
  +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useLemonadeSettingsView");

  if (!v11)
  {
    +[PXPhotoStreamComposeServiceViewController createCanonicalInstance](PXPhotoStreamComposeServiceViewController, "createCanonicalInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "setAddToExistingWorkflow:", 0);
    objc_msgSend(v12, "setModalPresentationStyle:", 17);
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceLevel:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOverrideTraitCollection:", v18);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke;
    v23[3] = &unk_1E513C010;
    v23[4] = self;
    objc_msgSend(v12, "setCompletion:", v23);
    objc_msgSend(v5, "presentViewController:animated:completionHandler:", v12, 1, 0);
    goto LABEL_8;
  }
  -[PXCreateSharedAlbumActionPerformer performLemonadeUserInteractionTask](self, "performLemonadeUserInteractionTask");
LABEL_9:

}

- (void)photoStreamComposeService:(id)a3 didPostComment:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedAlbumActionPerformer.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

  }
  objc_msgSend(v6, "dismissViewController:animated:completionHandler:", v8, 1, 0);

}

- (void)photoStreamComposeServiceDidCancel:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedAlbumActionPerformer.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

  }
  objc_msgSend(v5, "dismissViewController:animated:completionHandler:", v7, 1, 0);

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, int a6)
{
  _QWORD v6[5];

  if (a6)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke_2;
    v6[3] = &unk_1E513BFE8;
    v6[4] = *(_QWORD *)(a1 + 32);
    PXSharedAlbumsCreateNewAlbum(a3, a4, 1, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
}

uint64_t __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = v6;
  v5 = a2;
  px_dispatch_on_main_queue();

}

uint64_t __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
