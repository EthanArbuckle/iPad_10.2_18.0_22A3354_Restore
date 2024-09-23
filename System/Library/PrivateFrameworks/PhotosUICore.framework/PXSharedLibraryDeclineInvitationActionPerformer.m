@implementation PXSharedLibraryDeclineInvitationActionPerformer

- (PXSharedLibraryDeclineInvitationActionPerformer)init
{
  objc_class *v3;
  void *v4;
  PXSharedLibraryDeclineInvitationActionPerformer *v5;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryDeclineInvitationActionPerformer;
  v5 = -[PXActionPerformer initWithActionType:](&v7, sel_initWithActionType_, v4);

  return v5;
}

- (void)performActionWithInvitation:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDeclineInvitationActionPerformer.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDeclineInvitationActionPerformer.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  -[PXSharedLibraryDeclineInvitationActionPerformer setInvitation:](self, "setInvitation:", v9);
  -[PXActionPerformer setPresentationEnvironment:](self, "setPresentationEnvironment:", v10);
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryDeclineInvitationActionPerformer;
  -[PXActionPerformer performActionWithCompletionHandler:](&v14, sel_performActionWithCompletionHandler_, v11);

}

- (void)performUserInteractionTask
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  PLSharedLibraryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Will present the decline invitation confirmation alert", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5138B28;
  v7[4] = self;
  -[PXActionPerformer presentAlertWithConfigurationHandler:](self, "presentAlertWithConfigurationHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PLSharedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Did present the decline invitation confirmation alert", buf, 2u);
    }
  }
  else
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to present the decline invitation confirmation alert", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present the decline invitation confirmation alert"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v5);
  }

}

- (PXSharedLibrary)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
}

void __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryInvitationDeclineConfirmationAlertTitle_iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(v3, "setStyle:", 0);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryInvitationDeclineConfirmationAlertButtonTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2;
  v9[3] = &unk_1E5149198;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v5, 2, v9);
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2_146;
  v8[3] = &unk_1E5149198;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v7, 1, v8);

}

void __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed the decline invitation confirmation alert", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "invitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_141;
  v4[3] = &unk_1E5148B78;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "declineInvitationWithCompletion:", v4);

}

void __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_2_146(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User canceled the decline invitation confirmation alert", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Decline Assistant Confirmation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completeUserInteractionTaskWithSuccess:error:", 0, v4);

}

uint64_t __77__PXSharedLibraryDeclineInvitationActionPerformer_performUserInteractionTask__block_invoke_141(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

@end
