@implementation PXExitSharedLibraryActionPerformer

- (PXExitSharedLibraryActionPerformer)init
{
  objc_class *v3;
  void *v4;
  PXExitSharedLibraryActionPerformer *v5;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PXExitSharedLibraryActionPerformer;
  v5 = -[PXActionPerformer initWithActionType:](&v7, sel_initWithActionType_, v4);

  return v5;
}

- (void)performActionWithSharedLibraryOrPreview:(id)a3 shouldConfirmExit:(BOOL)a4 exitRetentionPolicy:(int64_t)a5 presentationEnvironment:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a4;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExitSharedLibraryActionPerformer.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryOrPreview"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExitSharedLibraryActionPerformer.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_5;
LABEL_3:
  -[PXExitSharedLibraryActionPerformer setSharedLibraryOrPreview:](self, "setSharedLibraryOrPreview:", v13);
  -[PXExitSharedLibraryActionPerformer setShouldConfirmExit:](self, "setShouldConfirmExit:", v10);
  -[PXExitSharedLibraryActionPerformer setExitRetentionPolicy:](self, "setExitRetentionPolicy:", a5);
  -[PXActionPerformer setPresentationEnvironment:](self, "setPresentationEnvironment:", v14);
  v18.receiver = self;
  v18.super_class = (Class)PXExitSharedLibraryActionPerformer;
  -[PXActionPerformer performActionWithCompletionHandler:](&v18, sel_performActionWithCompletionHandler_, v15);

}

- (void)performUserInteractionTask
{
  void *v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  PXSharedLibraryExitAssistantViewController *v9;
  void *v10;
  PXSharedLibraryExitAssistantViewController *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t v15[8];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[16];

  -[PXExitSharedLibraryActionPerformer sharedLibraryOrPreview](self, "sharedLibraryOrPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXExitSharedLibraryActionPerformer exitRetentionPolicy](self, "exitRetentionPolicy");
  if ((objc_msgSend(v3, "isInPreview") & 1) != 0 || v4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__PXExitSharedLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &unk_1E5148B78;
    v14[4] = self;
    -[PXExitSharedLibraryActionPerformer _beginExitWithExitAssistantViewController:dismissalHandler:](self, "_beginExitWithExitAssistantViewController:dismissalHandler:", 0, v14);
  }
  else
  {
    PLSharedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Present exit assistant", buf, 2u);
    }

    objc_msgSend(v3, "sourceLibraryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    *(_QWORD *)buf = 0;
    v16 = 0;
    v17 = 0;
    objc_msgSend(v6, "fetchEstimatedAssetsCountsForExit:imageCount:videoCount:audioCount:itemCount:", 0, buf, &v18, &v17, &v16);
    PLLocalizedCountDescription();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchEstimatedAssetsCountsForExit:imageCount:videoCount:audioCount:itemCount:", 1, buf, &v18, &v17, &v16);
    PLLocalizedCountDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PXSharedLibraryExitAssistantViewController alloc];
    objc_msgSend(v3, "owner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSharedLibraryExitAssistantViewController initWithOwnerAsCurrentUser:keepAllCountsString:contributedOnlyCountsString:](v9, "initWithOwnerAsCurrentUser:keepAllCountsString:contributedOnlyCountsString:", objc_msgSend(v10, "isCurrentUser"), v7, v8);

    -[PXSharedLibraryExitAssistantViewController setDelegate:](v11, "setDelegate:", self);
    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v11))
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Failed to present exit assistant", v15, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present exit assistant"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v13);

    }
  }

}

- (void)_handlePresentationErrorWithDismissalHandler:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void (**)(id, _QWORD, void *))a3;
  PXAssertGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_1A6789000, v4, OS_LOG_TYPE_FAULT, "Failed to present exit assistant", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present exit assistant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0, v5);

}

- (void)_presentFailureAlertForSharedLibraryOrPreview:(id)a3 error:(id)a4 dismissalHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __CFString *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id v24;
  PXAlertAction *v25;
  PXAlertAction *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  PXExitSharedLibraryActionPerformer *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isInPreview");
  v13 = MEMORY[0x1E0C809B0];
  v14 = "LemonadeProfileButtonFactory" + 16;
  if (v12)
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExit_Error_Preview_Title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  else
  {
    v31 = self;
    objc_msgSend(v8, "owner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isCurrentUser");

    if (v18)
      v19 = CFSTR("PXSharedLibraryExit_Error_Owner_Title");
    else
      v19 = CFSTR("PXSharedLibraryExit_Error_Participant_Title");
    PXLocalizedSharedLibraryString(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceLibraryInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v37 = 0;
    v21 = objc_msgSend(v20, "presentServerGeneratedMessageForError:customMessage:learnMoreURL:", v9, &v38, &v37);
    v22 = v38;
    v23 = v37;
    if (v21)
    {
      v24 = v22;

      if (v23)
      {
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExitFailureLearnMoreActionTitle"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = [PXAlertAction alloc];
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke;
        v35[3] = &unk_1E5149198;
        v36 = v23;
        v26 = -[PXAlertAction initWithTitle:style:action:](v25, "initWithTitle:style:action:", v30, 0, v35);
        v39[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
      v24 = v11;
    }

    v11 = v24;
    self = v31;
    v13 = MEMORY[0x1E0C809B0];
    v14 = "uttonFactory";
  }
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v32[1] = *((_QWORD *)v14 + 7);
  v32[2] = __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke_2;
  v32[3] = &unk_1E5148CE0;
  v33 = v9;
  v34 = v10;
  v28 = v10;
  v29 = v9;
  PXPresentFailureWithLocalizedTitle(v15, v11, v16, v29, v27, v32);

}

- (void)_beginExitWithExitAssistantViewController:(id)a3 dismissalHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  PXExitSharedLibraryActionPerformer *v36;
  id v37;
  uint64_t v38;
  uint8_t buf[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PXSharedLibraryExitRetentionPolicyDescription(-[PXExitSharedLibraryActionPerformer exitRetentionPolicy](self, "exitRetentionPolicy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Exit assistant completed successfully with exitRetentionPolicy: %{public}@", buf, 0xCu);

  }
  if (!self->_shouldConfirmExit)
  {
    -[PXExitSharedLibraryActionPerformer _performExitWithExitAssistantViewController:dismissalHandler:](self, "_performExitWithExitAssistantViewController:dismissalHandler:", v6, v7);
    goto LABEL_29;
  }
  -[PXExitSharedLibraryActionPerformer sharedLibraryOrPreview](self, "sharedLibraryOrPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isInPreview"))
  {
    v38 = 0;
    *(_QWORD *)buf = 0;
    objc_msgSend(v10, "sourceLibraryInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchEstimatedAssetsCountsForExit:imageCount:videoCount:audioCount:itemCount:", -[PXExitSharedLibraryActionPerformer exitRetentionPolicy](self, "exitRetentionPolicy") == 1, buf, &v38, 0, 0);

    objc_msgSend(v10, "owner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isCurrentUser");

    if (v16)
      v17 = CFSTR("PXSharedLibraryExit_Confirmation_Owner_Title");
    else
      v17 = CFSTR("PXSharedLibraryExit_Confirmation_Participant_Title");
    PXLocalizedSharedLibraryString(v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)buf && v38)
    {
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExit_Confirmation_Message_%lu_Photos_%lu_Videos"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("%lu %lu");
    }
    else
    {
      if (*(_QWORD *)buf)
      {
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExit_Confirmation_Message_%lu_Photos"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
      }
      else
      {
        if (!v38)
        {
          v11 = 0;
          goto LABEL_19;
        }
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExit_Confirmation_Message_%lu_Videos"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
      }
      v20 = CFSTR("%lu");
    }
    PXLocalizedStringWithValidatedFormat(v18, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
    if (v16)
      v21 = CFSTR("PXSharedLibraryExit_Confirmation_Owner_Button_Title");
    else
      v21 = CFSTR("PXSharedLibraryExit_Confirmation_Participant_Button_Title");
    PXLocalizedSharedLibraryString(v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExit_Confirmation_Preview_Message_iOS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryExit_Confirmation_Preview_Button_Title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_23:
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke;
  v30[3] = &unk_1E5133B38;
  v31 = v13;
  v32 = v11;
  v33 = v6;
  v34 = v22;
  v35 = v12;
  v36 = self;
  v23 = v7;
  v37 = v23;
  v24 = v12;
  v25 = v22;
  v26 = v11;
  v27 = v13;
  -[PXActionPerformer presentAlertWithConfigurationHandler:](self, "presentAlertWithConfigurationHandler:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    PLSharedLibraryGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "Did present the exit assistant confirmation alert", buf, 2u);
    }

  }
  else
  {
    -[PXExitSharedLibraryActionPerformer _handlePresentationErrorWithDismissalHandler:](self, "_handlePresentationErrorWithDismissalHandler:", v23);
  }

LABEL_29:
}

- (void)_performExitWithExitAssistantViewController:(id)a3 dismissalHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  PXExitSharedLibraryActionPerformer *v24;
  id v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Exit assistant confirmation alert confirmed by the user", buf, 2u);
  }

  -[PXExitSharedLibraryActionPerformer sharedLibraryOrPreview](self, "sharedLibraryOrPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInPreview");
  objc_msgSend(v6, "setDisableControlsWithBusyIndicator:", 1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXExitSharedLibraryActionPerformer__performExitWithExitAssistantViewController_dismissalHandler___block_invoke;
  aBlock[3] = &unk_1E5133B60;
  v11 = v6;
  v22 = v11;
  v26 = v10;
  v12 = v9;
  v23 = v12;
  v13 = v7;
  v24 = self;
  v25 = v13;
  v14 = _Block_copy(aBlock);
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PLSharedLibraryGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v12;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "Exit assistant will exit shared library preview: %@", buf, 0xCu);
    }

    objc_msgSend(v12, "exitPreviewWithPresentationEnvironment:completion:", v15, v14);
  }
  else
  {
    v17 = -[PXExitSharedLibraryActionPerformer exitRetentionPolicy](self, "exitRetentionPolicy");
    PLSharedLibraryGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      PXSharedLibraryExitRetentionPolicyDescription(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "Exit assistant will exit shared library: %@ with policy: %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exitWithRetentionPolicy:presentationEnvironment:progress:completion:", v17, v15, v20, v14);

  }
}

- (void)cancelExitAssistantViewController:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  PLSharedLibraryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Exit assistant cancelled by the user", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PXExitSharedLibraryActionPerformer_cancelExitAssistantViewController___block_invoke;
  v6[3] = &unk_1E5149198;
  v6[4] = self;
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v4, v6);

}

- (void)completeExitAssistantViewController:(id)a3 withExitRetentionPolicy:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  -[PXExitSharedLibraryActionPerformer setExitRetentionPolicy:](self, "setExitRetentionPolicy:", a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke;
  v8[3] = &unk_1E5147B40;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PXExitSharedLibraryActionPerformer _beginExitWithExitAssistantViewController:dismissalHandler:](self, "_beginExitWithExitAssistantViewController:dismissalHandler:", v7, v8);

}

- (PXSharedLibrary)sharedLibraryOrPreview
{
  return self->_sharedLibraryOrPreview;
}

- (void)setSharedLibraryOrPreview:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryOrPreview, a3);
}

- (BOOL)shouldConfirmExit
{
  return self->_shouldConfirmExit;
}

- (void)setShouldConfirmExit:(BOOL)a3
{
  self->_shouldConfirmExit = a3;
}

- (int64_t)exitRetentionPolicy
{
  return self->_exitRetentionPolicy;
}

- (void)setExitRetentionPolicy:(int64_t)a3
{
  self->_exitRetentionPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryOrPreview, 0);
}

void __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v5 = a3;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke_2;
  v9[3] = &unk_1E51473C0;
  v11 = a2;
  v9[4] = v7;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "dismissViewController:completionHandler:", v6, v9);

}

uint64_t __98__PXExitSharedLibraryActionPerformer_completeExitAssistantViewController_withExitRetentionPolicy___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __72__PXExitSharedLibraryActionPerformer_cancelExitAssistantViewController___block_invoke(uint64_t a1)
{
  id v2;

  PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Exit Shared Library"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

void __99__PXExitSharedLibraryActionPerformer__performExitWithExitAssistantViewController_dismissalHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  int IsUserCanceledError;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setDisableControlsWithBusyIndicator:", 0);
  if (*(_BYTE *)(a1 + 64))
    v6 = CFSTR(" preview");
  else
    v6 = &stru_1E5149688;
  v7 = v6;
  if (a2)
  {
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Exit assistant successfully exited shared library%@: %@", (uint8_t *)&v16, 0x16u);
    }

    if (!*(_BYTE *)(a1 + 64))
      PXPreferencesResetCameraSharingPreferences();
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_14:
    v10();
    goto LABEL_18;
  }
  IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v5);
  PLSharedLibraryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (IsUserCanceledError)
  {
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 40);
      v16 = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "User canceled exit assistant for shared library%@: %@, error: %@", (uint8_t *)&v16, 0x20u);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  if (v13)
  {
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 138412802;
    v17 = v7;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Exit assistant failed to exit shared library%@: %@, error: %@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_presentFailureAlertForSharedLibraryOrPreview:error:dismissalHandler:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 56));
LABEL_18:

}

void __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setStyle:", 0);
  objc_msgSend(*(id *)(a1 + 48), "exitButtonSourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceItem:", v5);

  objc_msgSend(v4, "addActionWithTitle:style:action:", *(_QWORD *)(a1 + 56), 1, &__block_literal_global_189427);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke_173;
  v7[3] = &unk_1E5145688;
  v6 = *(_QWORD *)(a1 + 64);
  v7[4] = *(_QWORD *)(a1 + 72);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v6, 2, v7);

}

uint64_t __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke_173(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performExitWithExitAssistantViewController:dismissalHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __97__PXExitSharedLibraryActionPerformer__beginExitWithExitAssistantViewController_dismissalHandler___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  PLSharedLibraryGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_DEFAULT, "Exit assistant confirmation alert cancelled by the user", v1, 2u);
  }

}

void __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke(uint64_t a1)
{
  PXOpenURL(*(void **)(a1 + 32), 0);
}

void __107__PXExitSharedLibraryActionPerformer__presentFailureAlertForSharedLibraryOrPreview_error_dismissalHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E5149688;
  if (v4)
    v6 = (const __CFString *)v4;
  objc_msgSend(v2, "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, v3, CFSTR("%@"), v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __64__PXExitSharedLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

@end
