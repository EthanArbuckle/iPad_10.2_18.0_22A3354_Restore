@implementation ViewInvitation

void ___ViewInvitation_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  PXSharedLibraryViewInvitationActionPerformer *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Will review invitation", buf, 0xCu);
  }

  v4 = -[PXSharedLibraryViewInvitationActionPerformer initWithSharedLibraryStatusProvider:]([PXSharedLibraryViewInvitationActionPerformer alloc], "initWithSharedLibraryStatusProvider:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___ViewInvitation_block_invoke_506;
  v8[3] = &unk_1E5148348;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 72);
  -[PXSharedLibraryViewInvitationActionPerformer performActionWithInvitation:legacyDevicesFallbackMonitor:presentationEnvironment:completionHandler:](v4, "performActionWithInvitation:legacyDevicesFallbackMonitor:presentationEnvironment:completionHandler:", v5, v6, v7, v8);

}

void ___ViewInvitation_block_invoke_507(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlertTitle_HasPreview_iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlertMessage_HasPreview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v5);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlert_ExitSetup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addActionWithTitle:style:action:", v6, 0, *(_QWORD *)(a1 + 32));

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlert_Cancel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___ViewInvitation_block_invoke_2;
  v8[3] = &unk_1E5148A40;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v7, 1, v8);

}

void ___ViewInvitation_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Delete Shared Library Preview"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void ___ViewInvitation_block_invoke_506(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  _BOOL4 IsUserCanceledError;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((_DWORD)a2)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v7 = *(_QWORD *)(a1 + 32);
    v17 = 138543362;
    v18 = v7;
    v8 = "%{public}@: Did review invitation";
LABEL_7:
    v12 = v6;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 12;
    goto LABEL_10;
  }
  IsUserCanceledError = PXAssistantIsUserCanceledError(v5);
  PLSharedLibraryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v11 = *(_QWORD *)(a1 + 32);
    v17 = 138543362;
    v18 = v11;
    v8 = "%{public}@: User canceled review of invitation";
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    goto LABEL_11;
  v15 = *(_QWORD *)(a1 + 32);
  v17 = 138543618;
  v18 = v15;
  v19 = 2112;
  v20 = v5;
  v8 = "%{public}@: Failed to review invitation: %@";
  v12 = v6;
  v13 = OS_LOG_TYPE_ERROR;
  v14 = 22;
LABEL_10:
  _os_log_impl(&dword_1A6789000, v12, v13, v8, (uint8_t *)&v17, v14);
LABEL_11:

  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

@end
