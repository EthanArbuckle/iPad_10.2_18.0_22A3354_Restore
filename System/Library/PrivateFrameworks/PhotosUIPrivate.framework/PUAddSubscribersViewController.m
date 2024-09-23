@implementation PUAddSubscribersViewController

- (PUAddSubscribersViewController)initWithSharedAlbum:(id)a3
{
  id v5;
  PUAddSubscribersViewController *v6;
  void *v7;
  PUPhotoStreamRecipientViewController *v8;
  PUPhotoStreamRecipientViewController *composeRecipientController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUAddSubscribersViewController;
  v6 = -[PUAddSubscribersViewController init](&v11, sel_init);
  if (v6)
  {
    PLLocalizedFrameworkString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAddSubscribersViewController setTitle:](v6, "setTitle:", v7);

    objc_storeStrong((id *)&v6->_album, a3);
    v8 = objc_alloc_init(PUPhotoStreamRecipientViewController);
    composeRecipientController = v6->_composeRecipientController;
    v6->_composeRecipientController = v8;

    -[PUPhotoStreamRecipientViewController setDelegate:](v6->_composeRecipientController, "setDelegate:", v6);
    -[PUAddSubscribersViewController addChildViewController:](v6, "addChildViewController:", v6->_composeRecipientController);
    -[PUPhotoStreamRecipientViewController didMoveToParentViewController:](v6->_composeRecipientController, "didMoveToParentViewController:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PUPhotoStreamRecipientViewController setDelegate:](self->_composeRecipientController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUAddSubscribersViewController;
  -[PUAddSubscribersViewController dealloc](&v3, sel_dealloc);
}

- (id)contentScrollView
{
  return 0;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  -[PUPhotoStreamRecipientViewController view](self->_composeRecipientController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[PUAddSubscribersViewController setView:](self, "setView:", v7);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *addButton;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUAddSubscribersViewController;
  -[PUAddSubscribersViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonHandler);
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PLLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel__addButtonHandler);
  addButton = self->_addButton;
  self->_addButton = v6;

  -[UIBarButtonItem setEnabled:](self->_addButton, "setEnabled:", 0);
  -[PUAddSubscribersViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v3);
  objc_msgSend(v8, "setRightBarButtonItem:", self->_addButton);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAddSubscribersViewController;
  -[PUAddSubscribersViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  -[PUPhotoStreamRecipientViewController makeRecipientViewFirstResponder](self->_composeRecipientController, "makeRecipientViewFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAddSubscribersViewController;
  -[PUAddSubscribersViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  -[PUAddSubscribersViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 != 2 || v5 == 1;
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  -[PUPhotoStreamRecipientViewController setBottomTableOffset:](self->_composeRecipientController, "setBottomTableOffset:", v7);
}

- (void)_dismiss
{
  id v2;
  id v3;

  -[PUAddSubscribersViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)_saveAndDismiss
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  PUAddSubscribersViewController *v13;
  id v14;

  -[PUPhotoStreamRecipientViewController makeRecipientViewResignFirstResponder](self->_composeRecipientController, "makeRecipientViewResignFirstResponder");
  -[PUAddSubscribersViewController album](self, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamRecipientViewController recipients](self->_composeRecipientController, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PUAddSubscribersViewController__saveAndDismiss__block_invoke;
  v10[3] = &unk_1E58A9AE0;
  v11 = v3;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PUAddSubscribersViewController__saveAndDismiss__block_invoke_47;
  v9[3] = &unk_1E58ABD10;
  v9[4] = self;
  v6 = v5;
  v7 = v4;
  v8 = v3;
  objc_msgSend(v6, "performTransaction:completionHandler:", v10, v9);

}

- (void)recipientViewControllerDidAddRecipient:(id)a3
{
  id v4;

  objc_msgSend(a3, "recipients");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](self->_addButton, "setEnabled:", objc_msgSend(v4, "count") != 0);

}

- (void)recipientViewControllerDidRemoveRecipient:(id)a3
{
  id v4;

  objc_msgSend(a3, "recipients");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](self->_addButton, "setEnabled:", objc_msgSend(v4, "count") != 0);

}

- (void)recipientViewController:(id)a3 didEnterText:(id)a4
{
  void *v6;
  _BOOL8 v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = 1;
  else
    v7 = objc_msgSend(v8, "length") != 0;
  -[UIBarButtonItem setEnabled:](self->_addButton, "setEnabled:", v7);

}

- (PLCloudSharedAlbum)album
{
  return self->_album;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_composeRecipientController, 0);
}

void __49__PUAddSubscribersViewController__saveAndDismiss__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int IsEqual;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cloudGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134218242;
    v68 = v4;
    v69 = 2114;
    v70 = v2;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Adding %lu recipients to album %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", *(_QWORD *)(a1 + 48));
  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PXSharedAlbumsValidateRecipientsToAddToAlbum();
  objc_msgSend(*(id *)(*(_QWORD *)(v5 + 48) + 968), "makeRecipientViewFirstResponder");
  if (v7)
  {
    v44 = v6;
    v45 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = *(id *)(v5 + 40);
    v8 = v5;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v50)
    {
      v48 = *(_QWORD *)v61;
      v49 = v5;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v61 != v48)
            objc_enumerationMutation(obj);
          v52 = v9;
          v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v9);
          objc_msgSend(v10, "allEmailsArray");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v10;
          objc_msgSend(v10, "allPhonesArray");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v8 + 32), "cloudAlbumSubscriberRecords");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v57;
LABEL_11:
            v19 = 0;
            while (1)
            {
              if (*(_QWORD *)v57 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v19);
              objc_msgSend(v20, "inviteeEmails");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((PLObjectIsEqual() & 1) != 0)
              {
                objc_msgSend(v20, "inviteePhones");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                IsEqual = PLObjectIsEqual();

                if (IsEqual)
                {
                  PLPhotoSharingGetLog();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v68 = (uint64_t)v20;
                    _os_log_impl(&dword_1AAB61000, v34, OS_LOG_TYPE_DEFAULT, "Found existing invitation record %{public}@", buf, 0xCu);
                  }

                  objc_msgSend(v20, "invitationState");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "integerValue");

                  v31 = v15;
                  v8 = v49;
                  v25 = v51;
                  if ((unint64_t)(v37 - 3) <= 2)
                  {
                    objc_msgSend(v20, "cloudGUID");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v38, "copy");

                    PLPhotoSharingGetLog();
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      v68 = v37;
                      _os_log_impl(&dword_1AAB61000, v39, OS_LOG_TYPE_DEFAULT, "Resending invitation with state %ld", buf, 0xCu);
                    }

                    objc_msgSend(v46, "addObject:", v33);
                    v31 = v15;
                    goto LABEL_34;
                  }
                  goto LABEL_35;
                }
              }
              else
              {

              }
              if (v17 == ++v19)
              {
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
                if (v17)
                  goto LABEL_11;
                break;
              }
            }
          }

          PLPhotoSharingGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v51;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = (uint64_t)v51;
            _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_DEFAULT, "Adding new invitation record with %@", buf, 0xCu);
          }

          v26 = (void *)MEMORY[0x1E0D71630];
          v8 = v49;
          v27 = *(_QWORD *)(v49 + 32);
          objc_msgSend(v51, "firstName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "lastName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "displayName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:", v27, v28, v29, v30, v11, v12, *(_QWORD *)(v49 + 56));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          PLPhotoSharingGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v31)
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_DEFAULT, "Created new invitation record", buf, 2u);
            }
          }
          else
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_ERROR, "Failed to create new invitation record", buf, 2u);
            }
            v31 = 0;
          }
LABEL_34:

LABEL_35:
          v64 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          PXSharedAlbumsRecordRecentInvitationRecipients();

          v9 = v52 + 1;
        }
        while (v52 + 1 != v50);
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v50);
    }

    v41 = *(void **)(v8 + 56);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __49__PUAddSubscribersViewController__saveAndDismiss__block_invoke_44;
    v53[3] = &unk_1E58ABCA8;
    v2 = v45;
    v54 = v45;
    v55 = v46;
    v42 = v46;
    objc_msgSend(v41, "addCompletionHandlerToCurrentTransaction:", v53);

    v6 = v44;
  }
  else
  {
    PLPhotoSharingGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = *(_QWORD *)(v5 + 40);
      *(_DWORD *)buf = 138412290;
      v68 = v43;
      _os_log_impl(&dword_1AAB61000, v42, OS_LOG_TYPE_ERROR, "Invalid receipients %@", buf, 0xCu);
    }
  }

}

uint64_t __49__PUAddSubscribersViewController__saveAndDismiss__block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

void __49__PUAddSubscribersViewController__saveAndDismiss__block_invoke_44(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71640], "sendServerPendingInvitationsForAlbumWithGUID:", *(_QWORD *)(a1 + 32));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0D71640], "resendPendingInvitationWithGUID:albumGUID:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(_QWORD *)(a1 + 32), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

@end
