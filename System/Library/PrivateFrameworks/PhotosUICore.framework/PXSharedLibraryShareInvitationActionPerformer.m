@implementation PXSharedLibraryShareInvitationActionPerformer

- (PXSharedLibraryShareInvitationActionPerformer)initWithPresentationEnvironment:(id)a3
{
  id v5;
  PXSharedLibraryShareInvitationActionPerformer *v6;
  PXSharedLibraryShareInvitationActionPerformer *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryShareInvitationActionPerformer.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

  }
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryShareInvitationActionPerformer;
  v6 = -[PXActionPerformer initWithActionType:](&v10, sel_initWithActionType_, CFSTR("PXActionSharedLibraryShareInvitation"));
  v7 = v6;
  if (v6)
    -[PXActionPerformer setPresentationEnvironment:](v6, "setPresentationEnvironment:", v5);

  return v7;
}

- (void)performActionWithInvitationURL:(id)a3 completionHandler:(id)a4
{
  NSURL *v7;
  NSURL *invitationURL;
  void *v9;
  id v10;

  v7 = (NSURL *)a3;
  v10 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryShareInvitationActionPerformer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationURL"));

  }
  invitationURL = self->_invitationURL;
  self->_invitationURL = v7;

  -[PXActionPerformer performActionWithCompletionHandler:](self, "performActionWithCompletionHandler:", v10);
}

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[16];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "simulateErrorType");

  if (v5 == 7)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Simulated Error: Share Invitation Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Share Invitation Failed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v7);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0D96D28]);
    v14[0] = self->_invitationURL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PXSharedLibraryShareInvitationActionPerformer_performUserInteractionTask__block_invoke;
    v12[3] = &unk_1E51336F0;
    v12[4] = self;
    objc_msgSend(v7, "setCompletionWithItemsHandler:", v12);
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryShareInvitationActionPerformer.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

    }
    objc_msgSend(v10, "presentViewController:animated:completionHandler:", v7, 1, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationURL, 0);
}

void __75__PXSharedLibraryShareInvitationActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v9 = a4;
  v10 = a5;
  if (!v11 || (_DWORD)a3)
  {
    if (!v10 && (a3 & 1) == 0)
    {
      PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Share Invitation"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a3, v10);
  }

}

@end
