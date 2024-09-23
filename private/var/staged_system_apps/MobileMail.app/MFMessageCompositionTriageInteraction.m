@implementation MFMessageCompositionTriageInteraction

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176DCC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA1F8 != -1)
    dispatch_once(&qword_1005AA1F8, block);
  return (OS_os_log *)(id)qword_1005AA1F0;
}

+ (id)compositionRepresentationRequestForMessage:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc((Class)MessageContentRepresentationRequest);
  v5 = objc_msgSend(v4, "initWithMessage:includeSuggestions:representationType:delegate:", v3, 0, EMContentRepresentationTypeHTML, 0);

  return v5;
}

+ (id)interactionWithContentRequest:(id)a3 scene:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = objc_alloc((Class)MSMessageListItemSelection);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v12 = objc_msgSend(v9, "initWithMessageListItems:", v11);
  objc_msgSend(v8, "setMessageListItemSelection:", v12);

  objc_msgSend(v8, "setContentRequest:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
  objc_msgSend(v8, "setDaemonInterface:", v13);

  objc_msgSend(v8, "setPromptForAttachmentsResult:", 0);
  objc_msgSend(v8, "setScene:", v7);

  return v8;
}

- (MFMessageCompositionTriageInteraction)init
{
  MFMessageCompositionTriageInteraction *v2;
  MFMessageCompositionTriageInteraction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageCompositionTriageInteraction;
  v2 = -[MFMessageCompositionTriageInteraction init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MFMessageCompositionTriageInteraction setShouldPromptToLoadRestOfMessage:](v2, "setShouldPromptToLoadRestOfMessage:", 1);
    -[MFMessageCompositionTriageInteraction setIsActingOnEML:](v3, "setIsActingOnEML:", 0);
  }
  return v3;
}

- (EMMessage)emailMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "result"));

  return (EMMessage *)v6;
}

- (BOOL)_hasIncompleteAttachments
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction contentRequest](self, "contentRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resultIfAvailable"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedContentItems"));
  v5 = objc_msgSend(v4, "ef_any:", &stru_100521898);

  return v5;
}

- (unint64_t)includeAttachmentsForCurrentPolicy
{
  int64_t v3;

  v3 = -[MFMessageCompositionTriageInteraction attachmentPolicy](self, "attachmentPolicy");
  if (v3 == 3)
  {
    if (-[MFMessageCompositionTriageInteraction includeAttachmentsWithoutPrompting](self, "includeAttachmentsWithoutPrompting"))
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if (v3 == 2)
  {
    return 0;
  }
  else if (v3)
  {
    return 2;
  }
  else
  {
    return -[MFMessageCompositionTriageInteraction includeAttachmentsByDefault](self, "includeAttachmentsByDefault");
  }
}

- (unint64_t)includeAttachmentsByDefault
{
  return 1;
}

- (BOOL)includeAttachmentsWithoutPrompting
{
  return 0;
}

- (unint64_t)shouldLoadRestOfMessage
{
  unsigned __int8 v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  char v8;
  char v9;
  unint64_t v10;

  v3 = -[MFMessageCompositionTriageInteraction shouldPromptToLoadRestOfMessage](self, "shouldPromptToLoadRestOfMessage");
  v4 = -[MFMessageCompositionTriageInteraction promptForAttachmentsResult](self, "promptForAttachmentsResult");
  if (!v4)
    v4 = -[MFMessageCompositionTriageInteraction includeAttachmentsForCurrentPolicy](self, "includeAttachmentsForCurrentPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction contentRequest](self, "contentRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultIfAvailable"));

  if (v6)
  {
    v7 = objc_msgSend(v6, "hasMoreContent");
    v8 = v7;
    if ((v3 & 1) == 0)
    {
      if ((v7 & 1) != 0)
        goto LABEL_18;
LABEL_16:
      if (v4 != 2
        || !-[MFMessageCompositionTriageInteraction _hasIncompleteAttachments](self, "_hasIncompleteAttachments"))
      {
        v10 = 1;
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  else
  {
    if ((v3 & 1) == 0)
    {
LABEL_18:
      v10 = 2;
      goto LABEL_20;
    }
    v8 = 1;
  }
  if ((id)-[MFMessageCompositionTriageInteraction promptForAttachmentsResult](self, "promptForAttachmentsResult") == (id)2)
    v9 = 0;
  else
    v9 = v8;
  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = 2;
  if ((v8 & 1) == 0)
    goto LABEL_16;
LABEL_20:

  return v10;
}

- (BOOL)_selectedTextContainsAttachments
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction originalContent](self, "originalContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = objc_msgSend(v3, "containsString:", CFSTR("<attachment"));

  return v4;
}

- (BOOL)_noSelection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction originalContent](self, "originalContent"));
  v3 = v2 == 0;

  return v3;
}

- (unint64_t)shouldIncludeAttachments
{
  void *v3;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
  if (!objc_msgSend(v3, "hasAttachments"))
  {

    return 1;
  }
  if (!-[MFMessageCompositionTriageInteraction _noSelection](self, "_noSelection"))
  {
    v5 = -[MFMessageCompositionTriageInteraction _selectedTextContainsAttachments](self, "_selectedTextContainsAttachments");

    if ((v5 & 1) != 0)
      return -[MFMessageCompositionTriageInteraction includeAttachmentsForCurrentPolicy](self, "includeAttachmentsForCurrentPolicy");
    return 1;
  }

  return -[MFMessageCompositionTriageInteraction includeAttachmentsForCurrentPolicy](self, "includeAttachmentsForCurrentPolicy");
}

- (id)_confirmLoadingRestOfMessage
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = -[MFMessageCompositionTriageInteraction shouldLoadRestOfMessage](self, "shouldLoadRestOfMessage");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3 == 2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v4));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_REST_OF_MESSAGE"), &stru_100531B00, CFSTR("Main")));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100177814;
    v24[3] = &unk_10051D948;
    v9 = v6;
    v25 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController mf_actionSheetWithTitle:cancellationHandler:](UIAlertController, "mf_actionSheetWithTitle:cancellationHandler:", v8, v24));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("YES"), &stru_100531B00, CFSTR("Main")));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100177860;
    v22[3] = &unk_10051D948;
    v13 = v9;
    v23 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v22));
    objc_msgSend(v10, "addAction:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NO"), &stru_100531B00, CFSTR("Main")));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100177870;
    v20[3] = &unk_10051D948;
    v17 = v13;
    v21 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v20));
    objc_msgSend(v10, "addAction:", v18);

    -[MFTriageInteraction _presentConfirmationSheet:](self, "_presentConfirmationSheet:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "future"));

  }
  return v5;
}

- (id)_confirmIncludingAttachments
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = -[MFMessageCompositionTriageInteraction shouldIncludeAttachments](self, "shouldIncludeAttachments");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3 == 2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v4));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INCLUDE_ATTACHMENTS"), &stru_100531B00, CFSTR("Main")));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100177C38;
    v25[3] = &unk_10051D948;
    v9 = v6;
    v26 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController mf_actionSheetWithTitle:cancellationHandler:](UIAlertController, "mf_actionSheetWithTitle:cancellationHandler:", v8, v25));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("YES_INCLUDE"), &stru_100531B00, CFSTR("Main")));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100177C84;
    v23[3] = &unk_10051D948;
    v13 = v9;
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v23));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NO_INCLUDE"), &stru_100531B00, CFSTR("Main")));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100177C94;
    v21[3] = &unk_10051D948;
    v17 = v13;
    v22 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v21));

    objc_msgSend(v10, "addAction:", v14);
    objc_msgSend(v10, "addAction:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
    objc_msgSend(v19, "setAccessibilityIdentifier:", MSAccessibiltyIdentifierIncludeAttachmentsAlert);

    objc_msgSend(v14, "setAccessibilityIdentifier:", MSAccessibiltyIdentifierIncludeAttachmentsAlertYesInclude);
    objc_msgSend(v18, "setAccessibilityIdentifier:", MSAccessibiltyIdentifierIncludeAttachmentsAlertNoInclude);
    -[MFTriageInteraction _presentConfirmationSheet:](self, "_presentConfirmationSheet:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "future"));

  }
  return v5;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction _confirmIncludingAttachments](self, "_confirmIncludingAttachments"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100177E44;
  v15[3] = &unk_1005218C0;
  v15[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "then:", v15));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100177EA8;
  v14[3] = &unk_1005218C0;
  v14[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "then:", v14));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100177F08;
  v12[3] = &unk_100520628;
  v12[4] = self;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v8, "addSuccessBlock:", v12);
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100178420;
    v10[3] = &unk_100520CB8;
    v10[4] = self;
    v11 = v9;
    objc_msgSend(v8, "addFailureBlock:", v10);

  }
}

- (void)_performInteraction_Internal
{
  -[MFMessageCompositionTriageInteraction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageCompositionTriageInteraction _performInteraction_Internal]", "MFMessageCompositionTriageInteraction.m", 254, "0");
}

- (void)presentComposeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  char v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setShowKeyboardImmediately:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction scene](self, "scene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction fromAddress](self, "fromAddress"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction fromAddress](self, "fromAddress"));
      objc_msgSend(v5, "setPreferredSendingEmailAddress:", v8);
    }
    else
    {
      v20 = 1;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "composeAccountIsDefault:", &v20));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddresses"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "simpleAddress"));
      objc_msgSend(v5, "setPreferredSendingEmailAddress:", v11);

    }
    objc_msgSend(v5, "setLoadRest:", -[MFMessageCompositionTriageInteraction loadRestOfMessage](self, "loadRestOfMessage"));
    objc_msgSend(v5, "setIncludeAttachments:", (id)-[MFMessageCompositionTriageInteraction promptForAttachmentsResult](self, "promptForAttachmentsResult") == (id)2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction loadingContext](self, "loadingContext"));
    objc_msgSend(v5, "setLoadingContext:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction mailboxObjectID](self, "mailboxObjectID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serializedRepresentation"));
    objc_msgSend(v5, "setSerializedMailboxObjectID:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction originalContent](self, "originalContent"));
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction originalContent](self, "originalContent"));
      objc_msgSend(v5, "setOriginalContent:", v17);

    }
    v18 = -[MFTriageInteraction isTriggeredFromMenuAction](self, "isTriggeredFromMenuAction");
    if (v18)
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));
    else
      v19 = 0;
    objc_msgSend(v6, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v5, 1, 0, v19, 0);
    if (v18)

  }
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (MFMessageLoadingContext)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(id)a3
{
  objc_storeStrong((id *)&self->_loadingContext, a3);
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (void)setContentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_contentRequest, a3);
}

- (NSArray)originalContent
{
  return self->_originalContent;
}

- (void)setOriginalContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)messageSourceMailboxes
{
  return self->_messageSourceMailboxes;
}

- (void)setMessageSourceMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_messageSourceMailboxes, a3);
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (BOOL)shouldPromptToLoadRestOfMessage
{
  return self->_shouldPromptToLoadRestOfMessage;
}

- (void)setShouldPromptToLoadRestOfMessage:(BOOL)a3
{
  self->_shouldPromptToLoadRestOfMessage = a3;
}

- (int64_t)attachmentPolicy
{
  return self->_attachmentPolicy;
}

- (void)setAttachmentPolicy:(int64_t)a3
{
  self->_attachmentPolicy = a3;
}

- (BOOL)isActingOnEML
{
  return self->_isActingOnEML;
}

- (void)setIsActingOnEML:(BOOL)a3
{
  self->_isActingOnEML = a3;
}

- (NSString)fromAddress
{
  return self->_fromAddress;
}

- (void)setFromAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (void)setMailboxObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxObjectID, a3);
}

- (BOOL)loadRestOfMessage
{
  return self->_loadRestOfMessage;
}

- (void)setLoadRestOfMessage:(BOOL)a3
{
  self->_loadRestOfMessage = a3;
}

- (unint64_t)promptForAttachmentsResult
{
  return self->_promptForAttachmentsResult;
}

- (void)setPromptForAttachmentsResult:(unint64_t)a3
{
  self->_promptForAttachmentsResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);
  objc_storeStrong((id *)&self->_fromAddress, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageSourceMailboxes, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
