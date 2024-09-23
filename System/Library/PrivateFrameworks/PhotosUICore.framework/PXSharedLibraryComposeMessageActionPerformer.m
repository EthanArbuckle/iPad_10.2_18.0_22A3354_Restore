@implementation PXSharedLibraryComposeMessageActionPerformer

- (void)performActionWithInvitationURL:(id)a3 originatorDisplayName:(id)a4 recipients:(id)a5 completionHandler:(id)a6
{
  NSURL *v11;
  id v12;
  id v13;
  NSURL *invitationURL;
  NSURL *v15;
  NSString *v16;
  NSString *displayName;
  NSArray *v18;
  NSArray *recipients;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v11 = (NSURL *)a3;
  v23 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryComposeMessageActionPerformer+iOS.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationURL"));

  }
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryComposeMessageActionPerformer+iOS.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayName"));

    if (v12)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryComposeMessageActionPerformer+iOS.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipients"));

    goto LABEL_5;
  }
  if (!v12)
    goto LABEL_7;
LABEL_5:
  invitationURL = self->_invitationURL;
  self->_invitationURL = v11;
  v15 = v11;

  v16 = (NSString *)objc_msgSend(v23, "copy");
  displayName = self->_displayName;
  self->_displayName = v16;

  v18 = (NSArray *)objc_msgSend(v12, "copy");
  recipients = self->_recipients;
  self->_recipients = v18;

  -[PXActionPerformer performActionWithCompletionHandler:](self, "performActionWithCompletionHandler:", v13);
}

- (void)performUserInteractionTask
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  MFMessageComposeViewController *v7;
  MFMessageComposeViewController *messageComposeViewController;
  NSObject *v9;
  NSURL *invitationURL;
  NSArray *recipients;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  _BYTE v16[12];
  __int16 v17;
  NSArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "simulateErrorType");

  if (v4 == 7)
  {
    PLSharedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Simulated Error: Send Invite Failed", v16, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Send Invite Failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if ((objc_msgSend(getMFMessageComposeViewControllerClass_293854(), "canSendText") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("MFMessageComposeViewController can't send text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      v15 = "Compose Message Action: MFMessageComposeViewController can't send text";
LABEL_17:
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    }
LABEL_18:

LABEL_19:
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6, *(_QWORD *)v16);
    goto LABEL_20;
  }
  v7 = (MFMessageComposeViewController *)objc_alloc_init((Class)getMFMessageComposeViewControllerClass_293854());
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = v7;

  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", self);
  if (!self->_messageComposeViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to create MFMessageComposeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      v15 = "Compose Message Action: Failed to create the MFMessageComposeViewController";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    invitationURL = self->_invitationURL;
    recipients = self->_recipients;
    *(_DWORD *)v16 = 138412546;
    *(_QWORD *)&v16[4] = invitationURL;
    v17 = 2112;
    v18 = recipients;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Compose Message Action: Will send message with invitation URL: %@, recipients: %@", v16, 0x16u);
  }

  PXSharedLibraryLinkMetadataDataRepresentationForInvitationURL(self->_invitationURL, self->_displayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageComposeViewController addRichLinkData:withWebpageURL:](self->_messageComposeViewController, "addRichLinkData:withWebpageURL:", v6, self->_invitationURL);
  -[MFMessageComposeViewController setBody:](self->_messageComposeViewController, "setBody:", 0);
  -[MFMessageComposeViewController setShouldHideClearPluginButton:](self->_messageComposeViewController, "setShouldHideClearPluginButton:", 1);
  -[MFMessageComposeViewController setRecipients:](self->_messageComposeViewController, "setRecipients:", self->_recipients);
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", self->_messageComposeViewController))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present MFMessageComposeViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Compose Message Action: Failed to present MFMessageComposeViewController", v16, 2u);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v12);
  }
LABEL_20:

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  MFMessageComposeViewController *messageComposeViewController;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  char v18;
  uint8_t buf[16];

  v6 = a3;
  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", 0);
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = 0;

  if (!a4)
  {
    PLSharedLibraryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Compose Message Action: Message send: user cancelled or MessagesViewServices crashed", buf, 2u);
    }

    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Compose Message Action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a4 == 2)
  {
    PLSharedLibraryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Compose Message Action: Message send: failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Message send: failed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    v9 = 0;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Compose Message Action: Message send: successful", buf, 2u);
  }

  v9 = 0;
  v10 = 1;
LABEL_15:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__PXSharedLibraryComposeMessageActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke;
  v16[3] = &unk_1E51473C0;
  v16[4] = self;
  v18 = v10;
  v13 = v9;
  v17 = v13;
  if (!-[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v6, v16))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXSharedLibraryErrorDomain"), -1000, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Compose Message Action: Failed to dismiss the message compose view controller", buf, 2u);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_invitationURL, 0);
}

uint64_t __97__PXSharedLibraryComposeMessageActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
