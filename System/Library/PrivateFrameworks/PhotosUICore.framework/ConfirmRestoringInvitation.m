@implementation ConfirmRestoringInvitation

void ___ConfirmRestoringInvitation_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_RestoreInvitationAlert_Title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_RestoreInvitationAlert_Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v5);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_RestoreInvitationAlertConfirmationButton_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___ConfirmRestoringInvitation_block_invoke_2;
  v11[3] = &unk_1E5148A40;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v6, 0, v11);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlert_Cancel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = ___ConfirmRestoringInvitation_block_invoke_3;
  v9[3] = &unk_1E5148A40;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v8, 1, v9);

}

uint64_t ___ConfirmRestoringInvitation_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void ___ConfirmRestoringInvitation_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Restore Declined Shared Library Invitation"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

@end
