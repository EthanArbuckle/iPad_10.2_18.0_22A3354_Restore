@implementation PXSharedLibraryViewInvitationActionPerformer

- (PXSharedLibraryViewInvitationActionPerformer)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  PXSharedLibraryViewInvitationActionPerformer *v8;
  objc_super v10;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryViewInvitationActionPerformer;
  v8 = -[PXActionPerformer initWithActionType:](&v10, sel_initWithActionType_, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_sharedLibrartyStatusProvider, a3);

  return v8;
}

- (void)performActionWithInvitation:(id)a3 legacyDevicesFallbackMonitor:(id)a4 presentationEnvironment:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryViewInvitationActionPerformer.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryViewInvitationActionPerformer.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  -[PXSharedLibraryViewInvitationActionPerformer setInvitation:](self, "setInvitation:", v11);
  -[PXSharedLibraryViewInvitationActionPerformer setLegacyDevicesFallbackMonitor:](self, "setLegacyDevicesFallbackMonitor:", v12);
  -[PXActionPerformer setPresentationEnvironment:](self, "setPresentationEnvironment:", v13);
  v17.receiver = self;
  v17.super_class = (Class)PXSharedLibraryViewInvitationActionPerformer;
  -[PXActionPerformer performActionWithCompletionHandler:](&v17, sel_performActionWithCompletionHandler_, v14);

}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PXAssistantController *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryViewInvitationActionPerformer invitation](self, "invitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryViewInvitationActionPerformer sharedLibrartyStatusProvider](self, "sharedLibrartyStatusProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryViewInvitationActionPerformer legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryAssistantContext replyAssistantContextWithSharedLibraryStatusProvider:sharedLibrary:legacyDevicesFallbackMonitor:](PXSharedLibraryAssistantContext, "replyAssistantContextWithSharedLibraryStatusProvider:sharedLibrary:legacyDevicesFallbackMonitor:", v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLSharedLibraryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Present invitation assistant with context: %@", (uint8_t *)&v13, 0xCu);
  }

  v8 = -[PXAssistantController initWithContext:]([PXAssistantController alloc], "initWithContext:", v6);
  -[PXAssistantController setDelegate:](v8, "setDelegate:", self);
  if (-[PXActionPerformer presentViewController:](self, "presentViewController:", v8))
  {
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Invitation assistant presented. Marking shared library invitation as read %{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXPreferencesSetSharedLibraryInvitationLastSeenDate(v11, v9);

  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Failed to present invitation assistant", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present invitation assistant"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v9);
  }

}

- (void)assistantController:(id)a3 completedWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 IsUserCanceledError;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Invitation assistant completed with error: %@", buf, 0xCu);
  }

  objc_msgSend(v7, "setDelegate:", 0);
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryViewInvitationActionPerformer.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assistantController.context"), v17);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryViewInvitationActionPerformer.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assistantController.context"), v17, v19);

LABEL_16:
    if (v8)
      goto LABEL_6;
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_6:
    IsUserCanceledError = PXAssistantIsUserCanceledError(v8);
    PLSharedLibraryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (IsUserCanceledError)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Reply assistant cancelled by the user for context: %@", buf, 0xCu);
      }

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke;
      v24[3] = &unk_1E5148D08;
      v24[4] = self;
      v25 = v8;
      -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v24);
      v14 = v25;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v10;
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Reply assistant failed for context: %@, error: %@", buf, 0x16u);
      }

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_22;
      v22[3] = &unk_1E5148D08;
      v22[4] = self;
      v23 = v8;
      -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v22);
      v14 = v23;
    }

    goto LABEL_20;
  }
LABEL_17:
  PLSharedLibraryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "Reply assistant completed for context: %@", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_23;
  v21[3] = &unk_1E5149198;
  v21[4] = self;
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v21);
LABEL_20:

}

- (PXSharedLibraryStatusProvider)sharedLibrartyStatusProvider
{
  return self->_sharedLibrartyStatusProvider;
}

- (PXSharedLibrary)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (void)setLegacyDevicesFallbackMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_sharedLibrartyStatusProvider, 0);
}

uint64_t __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
