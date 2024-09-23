@implementation ICMoveAlertUtilities

+ (BOOL)suppressesAlerts
{
  return _suppressesAlerts;
}

+ (void)setSuppressesAlerts:(BOOL)a3
{
  _suppressesAlerts = a3;
}

+ (void)postAlertWithOKButtonWithTitle:(id)a3 message:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  if (objc_msgSend((id)objc_opt_class(), "suppressesAlerts"))
  {
    if (v12)
      v12[2](v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __106__ICMoveAlertUtilities_postAlertWithOKButtonWithTitle_message_presentingViewController_completionHandler___block_invoke;
    v17[3] = &unk_1E5C1F5F8;
    v18 = v12;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addAction:", v16);
    objc_msgSend(v11, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

uint64_t __106__ICMoveAlertUtilities_postAlertWithOKButtonWithTitle_message_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)postAlertWithProceedAndCancelButtonsWithTitle:(id)a3 message:(id)a4 proceedTitle:(id)a5 presentingViewController:(id)a6 proceedHandler:(id)a7 cancelHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  void (**v29)(_QWORD);
  _QWORD v30[4];
  id v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(_QWORD))a7;
  v18 = a8;
  if (!objc_msgSend((id)objc_opt_class(), "suppressesAlerts") && v13 && v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke;
    v30[3] = &unk_1E5C1F5F8;
    v31 = v18;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v22);
    v23 = (void *)MEMORY[0x1E0DC3448];
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke_2;
    v28 = &unk_1E5C1F5F8;
    v29 = v17;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v15, 0, &v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v24, v25, v26, v27, v28);
    objc_msgSend(v19, "setPreferredAction:", v24);
    objc_msgSend(v16, "presentViewController:animated:completion:", v19, 1, 0);

  }
  else if (v17)
  {
    v17[2](v17);
  }

}

uint64_t __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes:(unint64_t)a3 guiltyObjects:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  void (**v10)(_QWORD);
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  v10 = (void (**)(_QWORD))a6;
  if (objc_msgSend(a4, "ic_containsObjectPassingTest:", &__block_literal_global_26))
  {
    if (a3 == 1)
      v11 = CFSTR("Your note wasn’t moved.");
    else
      v11 = CFSTR("Your notes weren’t moved.");
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Locked notes can’t be shared."), CFSTR("Locked notes can’t be shared."), 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v12, v13, v14, v10);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

uint64_t __155__ICMoveAlertUtilities_postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes_guiltyObjects_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPasswordProtected");
}

+ (void)postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;

  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = a3;
  v11 = objc_msgSend(v10, "ic_containsObjectPassingTest:", &__block_literal_global_19);
  v12 = objc_msgSend(v10, "ic_containsObjectPassingTest:", &__block_literal_global_20);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t Share Folder"), CFSTR("Can’t Share Folder"), 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && v12)
  {
    v14 = (void *)MEMORY[0x1E0D64218];
    v15 = CFSTR("You can’t share folders that contain items shared with you or locked notes.");
  }
  else if (v11)
  {
    v14 = (void *)MEMORY[0x1E0D64218];
    v15 = CFSTR("You can’t share folders that contain locked notes.");
  }
  else
  {
    if (!v12)
    {
      v17 = 0;
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1E0D64218];
    v15 = CFSTR("You can’t share folders that contain items shared with you.");
  }
  objc_msgSend(v14, "localizedFrameworkStringForKey:value:table:allowSiri:", v15, v15, 0, 1);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v13 && v16)
  {
    objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v13, v16, v8, v9);
    goto LABEL_16;
  }
LABEL_12:
  v18 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:].cold.1(v18);

  if (v9)
    v9[2](v9);
LABEL_16:

}

uint64_t __145__ICMoveAlertUtilities_postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPasswordProtected");
}

uint64_t __145__ICMoveAlertUtilities_postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSharedRootObject"))
    v3 = objc_msgSend(v2, "isOwnedByCurrentUser") ^ 1;
  else
    v3 = 0;

  return v3;
}

+ (void)postAlertForOwnerStoppedSharingCurrentFolderWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Sharing Stopped"), CFSTR("Sharing Stopped"), 0, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("The owner stopped sharing this folder. It’s no longer available."), CFSTR("The owner stopped sharing this folder. It’s no longer available."), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v10, v9, v8, v7);

}

+ (void)postAlertForSharingFolderWithSharedNotes:(id)a3 sharedSubfolders:(id)a4 presentingViewController:(id)a5 shareHandler:(id)a6 cancelHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v12 = (void *)MEMORY[0x1E0D64218];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v12, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Sharing this folder will change who can read and edit all notes within it."), CFSTR("Sharing this folder will change who can read and edit all notes within it."), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "count");

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0D64218];
    v20 = CFSTR("This folder already contains shared notes and folders. People who currently have access to these may lose it.");
  }
  else if (objc_msgSend(v24, "count") == 1)
  {
    v19 = (void *)MEMORY[0x1E0D64218];
    v20 = CFSTR("This folder already contains a shared note. People who currently have access to this note may lose it.");
  }
  else
  {
    v21 = objc_msgSend(v24, "count");
    v19 = (void *)MEMORY[0x1E0D64218];
    if (v21 < 2)
      v20 = CFSTR("This folder is shared. People who currently have access to it may lose it.");
    else
      v20 = CFSTR("This folder already contains shared notes. People who currently have access to these notes may lose it.");
  }
  objc_msgSend(v19, "localizedFrameworkStringForKey:value:table:allowSiri:", v20, v20, 0, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Share"), CFSTR("Share"), 0, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "postAlertWithProceedAndCancelButtonsWithTitle:message:proceedTitle:presentingViewController:proceedHandler:cancelHandler:", v17, v22, v23, v15, v14, v13);

}

+ (void)postAlertForMovingFolderWithSharedNotes:(id)a3 sharedSubfolders:(id)a4 destination:(id)a5 presentingViewController:(id)a6 shareHandler:(id)a7 cancelHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;

  v39 = a3;
  v40 = a4;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  objc_opt_class();
  ICDynamicCast();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v19, "isSharedViaICloud");
  objc_msgSend(v18, "localizedName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v38 = a1;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(v19, "localizedTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(v20, "title");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v27;

  }
  if ((v21 & 1) != 0)
  {
    if (objc_msgSend(v40, "count") == 1)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move Shared Folder?"), CFSTR("Move Shared Folder?"), 0, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = (void *)MEMORY[0x1E0D64218];
      v31 = CFSTR("If you move this folder, only people added to the shared folder “%@” will be able to access it.");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move Shared Folders?"), CFSTR("Move Shared Folders?"), 0, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = (void *)MEMORY[0x1E0D64218];
      v31 = CFSTR("If you move these folders, only people added to the shared folder “%@” will be able to access them.");
    }
    objc_msgSend(v30, "localizedFrameworkStringForKey:value:table:allowSiri:", v31, v31, 0, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringWithFormat:", v34, v24);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Moving this folder will change who can read and edit all notes within it."), CFSTR("Moving this folder will change who can read and edit all notes within it."), 0, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "count"))
    {
      v32 = (void *)MEMORY[0x1E0D64218];
      v33 = CFSTR("This folder already contains shared notes and folders. People who currently have access to these may lose it.");
    }
    else if (objc_msgSend(v39, "count") == 1)
    {
      v32 = (void *)MEMORY[0x1E0D64218];
      v33 = CFSTR("This folder already contains a shared note. People who currently have access to this note may lose it.");
    }
    else
    {
      v36 = objc_msgSend(v39, "count");
      v32 = (void *)MEMORY[0x1E0D64218];
      if (v36 < 2)
        v33 = CFSTR("This folder is shared. People who currently have access to it may lose it.");
      else
        v33 = CFSTR("This folder already contains shared notes. People who currently have access to these notes may lose it.");
    }
    objc_msgSend(v32, "localizedFrameworkStringForKey:value:table:allowSiri:", v33, v33, 0, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move Anyway"), CFSTR("Move Anyway"), 0, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "postAlertWithProceedAndCancelButtonsWithTitle:message:proceedTitle:presentingViewController:proceedHandler:cancelHandler:", v28, v35, v37, v16, v15, v14);

}

+ (void)postAlertForMovingNotesContainingSharedNotesToSharedFolder:(id)a3 destination:(id)a4 presentingViewController:(id)a5 shareHandler:(id)a6 cancelHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v39, "count"))
  {
    objc_opt_class();
    ICDynamicCast();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isSharedViaICloud");
    v38 = v16;
    objc_msgSend(v16, "localizedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v37 = v17;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(v17, "localizedTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;
      }
      else
      {
        objc_msgSend(v18, "title");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v25;

    }
    v26 = objc_msgSend(v39, "count");
    if ((v19 & 1) != 0)
    {
      v36 = a1;
      if (v26 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move Shared Note?"), CFSTR("Move Shared Note?"), 0, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = (void *)MEMORY[0x1E0D64218];
        v30 = CFSTR("If you move this note, only people added to the shared folder “%@” will be able to access it.");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move Shared Notes?"), CFSTR("Move Shared Notes?"), 0, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = (void *)MEMORY[0x1E0D64218];
        v30 = CFSTR("If you move these notes, only people added to the shared folder “%@” will be able to access them.");
      }
      objc_msgSend(v29, "localizedFrameworkStringForKey:value:table:allowSiri:", v30, v30, 0, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v33, v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      a1 = v36;
    }
    else
    {
      if (v26 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Moving this note will change who can read and edit it."), CFSTR("Moving this note will change who can read and edit it."), 0, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0D64218];
        v32 = CFSTR("People who currently have access to this note may lose it.");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Moving these notes will change who can read and edit them."), CFSTR("Moving these notes will change who can read and edit them."), 0, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0D64218];
        v32 = CFSTR("There are shared notes among them. People who currently have access to these notes may lose it.");
      }
      objc_msgSend(v31, "localizedFrameworkStringForKey:value:table:allowSiri:", v32, v32, 0, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Move Anyway"), CFSTR("Move Anyway"), 0, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "postAlertWithProceedAndCancelButtonsWithTitle:message:proceedTitle:presentingViewController:proceedHandler:cancelHandler:", v27, v34, v35, v13, v14, v15);

  }
}

+ (void)postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes couldn’t be moved."), CFSTR("Notes couldn’t be moved."), 0, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared notes can’t be moved to a different account."), CFSTR("Shared notes can’t be moved to a different account."), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v10, v9, v8, v7);

}

+ (void)postAlertForMovingLockedNotesToOtherAccountIsCopy:(BOOL)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0D64218];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("One or more notes are locked."), CFSTR("One or more notes are locked."), 0, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    v11 = CFSTR("You must remove the lock from this note to copy it to a different account.");
  else
    v11 = CFSTR("You must remove the lock from this note to move it to a different account.");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v13, v12, v10, v9);

}

+ (void)postAlertForFolderDepthLimitWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t move folder"), CFSTR("Can’t move folder"), 0, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(MEMORY[0x1E0D63B10], "folderDepthLimit") + 1;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("FOLDER_DEPTH_LIMIT_MESSAGE_%lu"), CFSTR("FOLDER_DEPTH_LIMIT_MESSAGE_%lu"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v12, v11, v8, v7);

}

+ (void)postAlertForUnsupportedAttachmentsInLegacyAccount:(id)a3 presentingViewController:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("The folder couldn’t be added because one or more notes have attachments."), CFSTR("The folder couldn’t be added because one or more notes have attachments."), 0, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedAttachmentsNotSupportedReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v10, v9, v7, 0);
}

+ (void)postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:(id)a3 presentingViewController:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0D64218];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t Move Folder"), CFSTR("Can’t Move Folder"), 0, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Smart Folders using Shared and Mentions filters can’t be moved to the “%@” account."), CFSTR("Smart Folders using Shared and Mentions filters can’t be moved to the “%@” account."), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "postAlertWithOKButtonWithTitle:message:presentingViewController:completionHandler:", v13, v12, v7, 0);
}

+ (void)postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:(os_log_t)log presentingViewController:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "alert title or message is not set when running postAlertForMovingFolderContainingLockedOrJoinedNotesWithGuiltyObjects:CompletionHandler:", v1, 2u);
}

@end
