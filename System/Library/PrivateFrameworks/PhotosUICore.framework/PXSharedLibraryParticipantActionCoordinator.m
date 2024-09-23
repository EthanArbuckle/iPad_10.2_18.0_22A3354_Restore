@implementation PXSharedLibraryParticipantActionCoordinator

- (PXSharedLibraryParticipantActionCoordinator)initWithParticipant:(id)a3 sharedLibrary:(id)a4
{
  id v7;
  id v8;
  PXSharedLibraryParticipantActionCoordinator *v9;
  PXSharedLibraryParticipantActionCoordinator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryParticipantActionCoordinator;
  v9 = -[PXSharedLibraryParticipantActionCoordinator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_storeStrong((id *)&v10->_sharedLibrary, a4);
  }

  return v10;
}

- (void)_resendInvitation:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantActionCoordinator.m"), 38, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sender"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantActionCoordinator.m"), 38, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sender"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  -[PXSharedLibrary shareURL](self->_sharedLibrary, "shareURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantActionCoordinator actionViewController](self, "actionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", v6, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedLibraryShareInvitation(v5, v7, CFSTR("Preferences"), 0);
}

- (void)_removeParticipant:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  objc_class *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  PXSharedLibraryParticipantActionCoordinator *v38;
  id v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  -[PXSharedLibraryParticipantActionCoordinator participant](self, "participant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryShortNameForParticipant(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreferences_RemoveParticipantAlertTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v7 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "status", v5) == 2)
  {
    v8 = 0;
  }
  else
  {
    PXSharedLibrarySettingsMessageForRemovingPendingParticipant(v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreferences_RemoveParticipantAlertRemoveButtonTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantActionCoordinator actionViewController](self, "actionViewController", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v8;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v8);
  v40 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttributes:range:", v16, 0, objc_msgSend(v14, "length"));

  objc_msgSend(v13, "_setAttributedMessage:", v14);
  v17 = (void *)MEMORY[0x1E0DC3448];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke;
  v36[3] = &unk_1E5133F18;
  v18 = v12;
  v37 = v18;
  v38 = self;
  v19 = v4;
  v39 = v19;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v10, 2, v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v20);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v11, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v21);

  v22 = v32;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantActionCoordinator.m"), 72, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sender"), v33);
LABEL_9:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_descriptionForAssertionMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v27;
    v28 = v27;
    v24 = v30;
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantActionCoordinator.m"), 72, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sender"), v28, v29);

    goto LABEL_9;
  }
LABEL_6:
  objc_msgSend(v13, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceView:", v22);

  objc_msgSend(v18, "presentViewController:animated:completion:", v13, 1, 0);
}

- (UIViewController)actionViewController
{
  UIViewController *actionViewController;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  UIViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  int v32;
  PXSharedLibrary *sharedLibrary;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIViewController *v39;
  void *v41;
  id v42;
  id v43;
  UIViewController *v44;
  UIViewController *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  actionViewController = self->_actionViewController;
  if (!actionViewController)
  {
    -[PXSharedLibraryParticipantActionCoordinator participant](self, "participant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v5;
    v6 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryContactForParticipantAndKeys(v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v8);
      v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)*MEMORY[0x1E0C966A8];
      v11 = (void *)*MEMORY[0x1E0C967C0];
      v59[0] = *MEMORY[0x1E0C966A8];
      v59[1] = v11;
      v59[2] = *MEMORY[0x1E0C967B0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController setDisplayedPropertyKeys:](v9, "setDisplayedPropertyKeys:", v12);

      objc_msgSend(v4, "emailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "phoneNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        v44 = v9;
        v46 = v14;
        v15 = v4;
        v42 = v10;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v47 = v8;
        objc_msgSend(v8, "emailAddresses");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v53;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v53 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_msgSend(v21, "value");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "isEqualToString:", v13);

              if (v23)
              {
                objc_msgSend(v21, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v4 = v15;
                v25 = v42;
                v9 = v44;
                goto LABEL_28;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
            if (v18)
              continue;
            break;
          }
        }

        v24 = 0;
        v4 = v15;
        v14 = v46;
        v8 = v47;
        v25 = v42;
        v9 = v44;
        v6 = 0x1E0C99000;
      }
      else if (objc_msgSend(v14, "length"))
      {
        v25 = v11;
        v46 = v14;
        objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v47 = v8;
        objc_msgSend(v8, "phoneNumbers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v24)
        {
          v43 = v25;
          v45 = v9;
          v41 = v4;
          v28 = *(_QWORD *)v49;
          while (2)
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(_QWORD *)v49 != v28)
                objc_enumerationMutation(v27);
              v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v30, "value");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isLikePhoneNumber:", v16);

              if (v32)
              {
                objc_msgSend(v30, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_26;
              }
            }
            v24 = (void *)objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            if (v24)
              continue;
            break;
          }
LABEL_26:
          v4 = v41;
          v25 = v43;
          v9 = v45;
        }

LABEL_28:
        v8 = v47;
        v6 = 0x1E0C99000;
        if (v25)
        {
          v14 = v46;
          if (v24)
            -[UIViewController highlightPropertyWithKey:identifier:important:](v9, "highlightPropertyWithKey:identifier:important:", v25, v24, 1);
        }
        else
        {
          v14 = v46;
        }
      }
      else
      {
        v25 = 0;
        v24 = 0;
      }

    }
    else
    {
      -[PXSharedLibraryParticipantActionCoordinator participant](self, "participant");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PXSharedLibraryMakeContactForParticipant(v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v8);
      v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      -[UIViewController contentViewController](v9, "contentViewController");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAllowsAddingToAddressBook:", 1);
    }

    if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) <= 1)
      -[UIViewController setDisplayMode:](v9, "setDisplayMode:", 1);
    -[UIViewController setAllowsEditing:](v9, "setAllowsEditing:", 0);
    -[UIViewController setAllowsActions:](v9, "setAllowsActions:", 0);
    sharedLibrary = self->_sharedLibrary;
    v56 = v4;
    objc_msgSend(*(id *)(v6 + 3360), "arrayWithObjects:count:", &v56, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(sharedLibrary) = -[PXSharedLibrary canDeleteParticipants:](sharedLibrary, "canDeleteParticipants:", v34);

    if ((_DWORD)sharedLibrary)
    {
      -[UIViewController contentViewController](v9, "contentViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "cardFooterGroup");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v4, "status") - 5) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryParticipant_ResendInvitationMenuTitle"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addActionWithTitle:target:selector:inGroup:destructive:", v37, self, sel__resendInvitation_, v36, 0);

      }
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreferences_RemoveParticipantActionButtonTitle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addActionWithTitle:target:selector:inGroup:destructive:", v38, self, sel__removeParticipant_, v36, 1);

    }
    v39 = self->_actionViewController;
    self->_actionViewController = v9;

    actionViewController = self->_actionViewController;
  }
  return actionViewController;
}

- (PXSharedLibraryParticipant)participant
{
  return self->_participant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_actionViewController, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
}

void __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v9[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke_2;
  v6[3] = &unk_1E5147B40;
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v5 = v2;
  objc_msgSend(v3, "deleteParticipants:presentationEnvironment:withCompletion:", v4, v5, v6);

}

void __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
  else
  {
    PXHandleErrorDeletingParticipants(a3, *(void **)(a1 + 40), 0);
  }
}

@end
