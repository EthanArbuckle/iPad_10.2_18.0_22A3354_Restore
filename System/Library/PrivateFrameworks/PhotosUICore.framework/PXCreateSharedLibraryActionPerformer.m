@implementation PXCreateSharedLibraryActionPerformer

- (PXCreateSharedLibraryActionPerformer)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  PXCreateSharedLibraryActionPerformer *v8;
  objc_super v10;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PXCreateSharedLibraryActionPerformer;
  v8 = -[PXActionPerformer initWithActionType:](&v10, sel_initWithActionType_, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_statusProvider, a3);

  return v8;
}

- (void)performActionWithLegacyDevicesFallbackMonitor:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedLibraryActionPerformer.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

  }
  -[PXCreateSharedLibraryActionPerformer setLegacyDevicesFallbackMonitor:](self, "setLegacyDevicesFallbackMonitor:", v9);
  -[PXActionPerformer setPresentationEnvironment:](self, "setPresentationEnvironment:", v10);
  v13.receiver = self;
  v13.super_class = (Class)PXCreateSharedLibraryActionPerformer;
  -[PXActionPerformer performActionWithCompletionHandler:](&v13, sel_performActionWithCompletionHandler_, v11);

}

- (void)performUserInteractionTask
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  PXSharedLibrarySourceLibraryInfoPhotoKit *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PXAssistantController *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXCreateSharedLibraryActionPerformer statusProvider](self, "statusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSharedLibrary");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchExiting");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Cannot create, publish, or join a Shared Library when one already exist.", (uint8_t *)&v19, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Cannot create, publish, or join a Shared Library when one already exist."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v7);
  }
  else
  {
    objc_msgSend(v3, "fetchPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8
      && (objc_msgSend(v8, "owner"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isCurrentUser"),
          v9,
          (v10 & 1) == 0))
    {
      -[PXCreateSharedLibraryActionPerformer legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
      v12 = (PXSharedLibrarySourceLibraryInfoPhotoKit *)objc_claimAutoreleasedReturnValue();
      +[PXSharedLibraryAssistantContext replyAssistantContextWithSharedLibraryStatusProvider:sharedLibrary:legacyDevicesFallbackMonitor:](PXSharedLibraryAssistantContext, "replyAssistantContextWithSharedLibraryStatusProvider:sharedLibrary:legacyDevicesFallbackMonitor:", v3, v7, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_os_feature_enabled_impl() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      else
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PXSharedLibrarySourceLibraryInfoPhotoKit initWithPhotoLibrary:]([PXSharedLibrarySourceLibraryInfoPhotoKit alloc], "initWithPhotoLibrary:", v11);

      -[PXCreateSharedLibraryActionPerformer legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSharedLibraryAssistantContext setupAssistantContextWithSharedLibraryStatusProvider:sharedLibrary:sourceLibraryInfo:legacyDevicesFallbackMonitor:](PXSharedLibraryAssistantContext, "setupAssistantContextWithSharedLibraryStatusProvider:sharedLibrary:sourceLibraryInfo:legacyDevicesFallbackMonitor:", v3, v7, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PLSharedLibraryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Present setup assistant with context: %@", (uint8_t *)&v19, 0xCu);
    }

    v16 = -[PXAssistantController initWithContext:]([PXAssistantController alloc], "initWithContext:", v14);
    -[PXAssistantController setDelegate:](v16, "setDelegate:", self);
    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v16))
    {
      PXAssertGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v19) = 0;
        _os_log_fault_impl(&dword_1A6789000, v17, OS_LOG_TYPE_FAULT, "Failed to present setup assistant", (uint8_t *)&v19, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present setup assistant"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v18);

    }
  }

}

- (void)assistantController:(id)a3 completedWithError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "setDelegate:", 0);
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedLibraryActionPerformer.m"), 99, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assistantController.context"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCreateSharedLibraryActionPerformer.m"), 99, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assistantController.context"), v21);
  }

LABEL_3:
  if (v8)
  {
    if (PXAssistantIsUserCanceledError(v8))
    {
      PLSharedLibraryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Setup assistant cancelled by the user for context: %@", buf, 0xCu);
      }

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke;
      v32[3] = &unk_1E5148D08;
      v32[4] = self;
      v33 = v8;
      -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v32);
      v11 = v33;
LABEL_21:

      goto LABEL_22;
    }
    if (objc_msgSend(v8, "code") != -1002)
    {
      PLSharedLibraryGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v9;
        v36 = 2112;
        v37 = v8;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Setup assistant failed for context: %@, error: %@", buf, 0x16u);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_154;
      v25[3] = &unk_1E5148D08;
      v25[4] = self;
      v26 = v8;
      -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v25);
      v11 = v26;
      goto LABEL_21;
    }
    -[PXCreateSharedLibraryActionPerformer statusProvider](self, "statusProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchSharedLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v13, "fetchPreview"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      PLSharedLibraryGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Setup assistant cancelled by the user calling for destruction of progress for context: %@", buf, 0xCu);
      }

      -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_151;
      v29[3] = &unk_1E5146AF0;
      v29[4] = self;
      v30 = v7;
      v31 = v8;
      _ExitSharedLibraryOrPreview(v14, 0, 1, v16, CFSTR("PXCreateSharedLibraryActionPerformer"), v29);

    }
    else
    {
      PLSharedLibraryGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "Setup assistant cancelled by the user with destruction of progress, but no preview library could be found to delete.", buf, 2u);
      }

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_153;
      v27[3] = &unk_1E5148D08;
      v27[4] = self;
      v28 = v8;
      -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v27);

    }
  }
  else
  {
    PLSharedLibraryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Setup assistant completed for context: %@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_155;
    v24[3] = &unk_1E5149198;
    v24[4] = self;
    -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, v24);
  }
LABEL_22:

}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (void)setLegacyDevicesFallbackMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, a3);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_151(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_2;
  v3[3] = &unk_1E5148D08;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "dismissViewController:completionHandler:", v2, v3);

}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_154(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_155(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

@end
