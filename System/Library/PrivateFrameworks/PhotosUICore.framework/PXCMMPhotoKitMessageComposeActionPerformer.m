@implementation PXCMMPhotoKitMessageComposeActionPerformer

- (void)performUserInteractionTask
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  MFMessageComposeViewController *v13;
  MFMessageComposeViewController *messageComposeViewController;
  NSObject *v15;
  NSObject *v16;
  PXCMMPhotoKitMessageComposeActionPerformer *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  SEL v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  PXCMMPhotoKitMessageComposeActionPerformer *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PXCMMShowMessageComposeActionPerformer shareURL](self, "shareURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pl_redactedShareURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = self;
    v48 = 2114;
    v49 = v6;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Performer: %@ Presenting Message Compose for URL %{public}@", buf, 0x16u);

  }
  if ((objc_msgSend(getMFMessageComposeViewControllerClass(), "canSendText") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1010, CFSTR("Unable to send text"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v10);
    goto LABEL_37;
  }
  PLSharingGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ActionPerformerMessageComposeViewController", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXCMMShowMessageComposeActionPerformer shareURL](self, "shareURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PLIsMobileSlideShow();
  if (v11)
  {
    PXMessageForMomentShareURL(v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = (MFMessageComposeViewController *)objc_alloc_init((Class)getMFMessageComposeViewControllerClass());
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = v13;

  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", self);
  if (v12)
  {
    -[MFMessageComposeViewController setMessage:](self->_messageComposeViewController, "setMessage:", v12);
    goto LABEL_20;
  }
  PLSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "pl_redactedShareURL");
      v17 = (PXCMMPhotoKitMessageComposeActionPerformer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v17;
      v18 = "Message Compose Action: Unable to create MSMessage for URL: %{public}@. Falling back to plain link";
      v19 = v16;
      v20 = OS_LOG_TYPE_ERROR;
LABEL_18:
      _os_log_impl(&dword_1A6789000, v19, v20, v18, buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "pl_redactedShareURL");
    v17 = (PXCMMPhotoKitMessageComposeActionPerformer *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v17;
    v18 = "Share Sheet: Live Bubbles not supported. Sending moment share URL as text: %{public}@";
    v19 = v16;
    v20 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }

  objc_msgSend(v10, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageComposeViewController setBody:](self->_messageComposeViewController, "setBody:", v21);

LABEL_20:
  v39 = a2;
  v40 = (void *)v12;
  PLSharingGetLog();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_make_with_pointer(v22, self);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_END, v24, "ActionPerformerMessageComposeViewController", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMActionPerformer session](self, "session");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "viewModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "recipients");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "suggestedTransport", v39, v40, (_QWORD)v41);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "addressKind");
        if ((unint64_t)(v35 - 1) >= 2)
        {
          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("PXCMMPhotoKitMessageComposeActionPerformer.m"), 84, CFSTR("Code which should be unreachable has been reached"));

            abort();
          }
        }
        else
        {
          objc_msgSend(v34, "address");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v36);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v31);
  }

  -[MFMessageComposeViewController setRecipients:](self->_messageComposeViewController, "setRecipients:", v25);
  if (!self->_messageComposeViewController
    || !-[PXActionPerformer presentViewController:](self, "presentViewController:"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to present the message compose view controller"), v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v37);

  }
LABEL_37:

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  MFMessageComposeViewController *v6;
  uint64_t v7;
  MFMessageComposeViewController *v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  MFMessageComposeViewController *messageComposeViewController;
  uint64_t v13;
  int v14;
  MFMessageComposeViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MFMessageComposeViewController *v21;
  uint64_t aBlock;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  MFMessageComposeViewController *v26;
  id v27;
  char v28;
  uint8_t buf[4];
  MFMessageComposeViewController *v30;
  __int16 v31;
  MFMessageComposeViewController *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (MFMessageComposeViewController *)a3;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1008, CFSTR("Message Compose reported send failure"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      v10 = 1;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1007, CFSTR("User cancelled Message Compose"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (MFMessageComposeViewController *)v7;
  PLSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to send CMM message with error: %@", buf, 0xCu);
  }

  v10 = 0;
LABEL_9:
  if (v6 && self->_messageComposeViewController == v6)
  {
    v14 = 1;
  }
  else
  {
    PLSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      messageComposeViewController = self->_messageComposeViewController;
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = messageComposeViewController;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Unexpected controller: %@ expected: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1007, CFSTR("Unexpected controller"));
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v10 = 0;
    v8 = (MFMessageComposeViewController *)v13;
  }
  objc_initWeak((id *)buf, self);
  aBlock = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __95__PXCMMPhotoKitMessageComposeActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke;
  v25 = &unk_1E5144F48;
  objc_copyWeak(&v27, (id *)buf);
  v28 = v10;
  v15 = v8;
  v26 = v15;
  v16 = _Block_copy(&aBlock);
  v17 = v16;
  if (v14)
  {
    if (!-[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v6, v16))
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      PXLocalizedStringFromTable(CFSTR("PXCMMShareError"), CFSTR("PhotosUICore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_errorWithDomain:code:underlyingError:localizedDescription:", CFSTR("PXCMMErrorDomain"), -1005, 0, CFSTR("%@"), v19, aBlock, v23, v24, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v20);
    }
  }
  else
  {
    (*((void (**)(void *))v16 + 2))(v16);
  }
  -[MFMessageComposeViewController setMessageComposeDelegate:](v6, "setMessageComposeDelegate:", 0);
  v21 = self->_messageComposeViewController;
  self->_messageComposeViewController = 0;

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
}

void __95__PXCMMPhotoKitMessageComposeActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
