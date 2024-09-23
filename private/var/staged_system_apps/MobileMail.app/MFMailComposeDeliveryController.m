@implementation MFMailComposeDeliveryController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016D6D0;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA1C0 != -1)
    dispatch_once(&qword_1005AA1C0, block);
  return (OS_os_log *)(id)qword_1005AA1B8;
}

- (MFMailComposeDeliveryController)initWithComposeController:(id)a3
{
  return -[MFMailComposeDeliveryController initWithComposeController:backupCompletionHandler:](self, "initWithComposeController:backupCompletionHandler:", a3, 0);
}

- (MFMailComposeDeliveryController)initWithComposeController:(id)a3 backupCompletionHandler:(id)a4
{
  id v6;
  id v7;
  MFMailComposeDeliveryController *v8;
  uint64_t v9;
  EFFuture *futureDraft;
  MFMailComposeDeliveryController *v11;
  uint64_t v12;
  MFOutgoingMessageDelivery *delivery;
  uint64_t v14;
  NSString *sendingAddress;
  uint64_t v16;
  EMMessage *draftMessage;
  uint64_t v18;
  NSString *draftDocumentID;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MFMailMessage *originalMessage;
  void *v25;
  uint64_t v26;
  MFMailMessage *v27;
  id v28;
  id backupCompletionHandler;
  void *v30;
  uint64_t v31;
  NSDate *sendLaterDate;
  uint64_t v33;
  NSString *autosaveIdentifier;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "needsDelivery") & 1) != 0)
  {
    v36.receiver = self;
    v36.super_class = (Class)MFMailComposeDeliveryController;
    v8 = -[MFMailComposeDeliveryController init](&v36, "init");
    if (v8)
    {
      if (objc_msgSend(v6, "isSavingAsDraft"))
      {
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_messageForDraft"));
        futureDraft = v8->_futureDraft;
        v8->_futureDraft = (EFFuture *)v9;

      }
      else
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delivery"));
        delivery = v8->_delivery;
        v8->_delivery = (MFOutgoingMessageDelivery *)v12;

        -[MFOutgoingMessageDelivery setDelegate:](v8->_delivery, "setDelegate:", v8);
      }
      v8->_isHideMyEmailMessage = objc_msgSend(v6, "isHideMyEmailMessage");
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sendingEmailAddress"));
      sendingAddress = v8->_sendingAddress;
      v8->_sendingAddress = (NSString *)v14;

      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastDraftMessage"));
      draftMessage = v8->_draftMessage;
      v8->_draftMessage = (EMMessage *)v16;

      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentID"));
      draftDocumentID = v8->_draftDocumentID;
      v8->_draftDocumentID = (NSString *)v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "compositionContext"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "legacyMessage"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "compositionContext"));
      if (v21)
      {
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "legacyMessage"));
        originalMessage = v8->_originalMessage;
        v8->_originalMessage = (MFMailMessage *)v23;
      }
      else
      {
        originalMessage = (MFMailMessage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "originalMessage"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount outboxMailboxUid](MailAccount, "outboxMailboxUid"));
        v26 = objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:", originalMessage, v25));
        v27 = v8->_originalMessage;
        v8->_originalMessage = (MFMailMessage *)v26;

      }
      v8->_composeType = (int64_t)objc_msgSend(v6, "compositionType");
      v28 = objc_retainBlock(v7);
      backupCompletionHandler = v8->_backupCompletionHandler;
      v8->_backupCompletionHandler = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "compositionContext"));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "sendLaterDate"));
      sendLaterDate = v8->_sendLaterDate;
      v8->_sendLaterDate = (NSDate *)v31;

      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autosaveIdentifier"));
      autosaveIdentifier = v8->_autosaveIdentifier;
      v8->_autosaveIdentifier = (NSString *)v33;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[MFOutgoingMessageDelivery setDelegate:](self->_delivery, "setDelegate:", 0);
  -[EFFuture cancel](self->_futureDraft, "cancel");
  -[MFOutgoingMessage setMessageBody:](self->_outgoingMessage, "setMessageBody:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeDeliveryController;
  -[MFMailComposeDeliveryController dealloc](&v3, "dealloc");
}

- (BOOL)deliverMessage
{
  NSObject *v3;
  _QWORD v5[4];
  dispatch_semaphore_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016DB50;
  v5[3] = &unk_100521460;
  v6 = dispatch_semaphore_create(0);
  v7 = &v8;
  v3 = v6;
  -[MFMailComposeDeliveryController deliverMessage:](self, "deliverMessage:", v5);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)deliverMessage:(id)a3
{
  id v4;
  void *v5;
  atomic_flag *p_isDeliveringMessage;
  unsigned __int8 v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  p_isDeliveringMessage = &self->_isDeliveringMessage;
  do
    v7 = __ldaxr((unsigned __int8 *)p_isDeliveringMessage);
  while (__stlxr(1u, (unsigned __int8 *)p_isDeliveringMessage));
  if ((v7 & 1) != 0)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  else
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10016DC78;
    v8[3] = &unk_100521488;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    -[MFMailComposeDeliveryController _deliverMessage:](self, "_deliverMessage:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_deliverMessage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  MFOutgoingMessage *v27;
  MFOutgoingMessage *outgoingMessage;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void (**backupCompletionHandler)(id, uint64_t);
  objc_class *v37;
  void *v38;
  id v39;
  MFOutgoingMessageDelivery *delivery;
  uint64_t v41;
  int isKindOfClass;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  id v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  id *v56;
  id *v57;
  id *v58;
  id *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[2];
  id v76;
  id v77;
  _QWORD *v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[2];
  id v85;
  _QWORD v86[4];
  id v87;
  MFMailComposeDeliveryController *v88;
  id v89;
  id v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  _QWORD v93[4];
  id v94;
  id location;
  id v96;
  uint8_t buf[4];
  id v98;
  char v99[24];

  v68 = a3;
  if (pthread_main_np())
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeDeliveryController.m"), 150, CFSTR("Current thread is main"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount outboxMailboxUid](MailAccount, "outboxMailboxUid"));
  objc_msgSend(v5, "setMailbox:", v6);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeDeliveryController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outgoingMessageRepository"));

  v70 = (void *)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery compositionSpecification](self->_delivery, "compositionSpecification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", MFSecureMIMECompositionSpecificationRecipientCertificates));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));

  v66 = v12;
  if (objc_msgSend(v12, "count")
    && _os_feature_enabled_impl("Mail", "EncryptedMail")
    && +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 29))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "daemonInterface"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageRepository"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metadataForAddresses:", v12));
    v96 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "result:", &v96));
    v18 = v96;
    if (objc_msgSend(v17, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery compositionSpecification](self->_delivery, "compositionSpecification"));
      v20 = objc_msgSend(v19, "mutableCopy");

      -[NSObject setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v17, MFSecureMIMECompositionSpecificationAddressMetadata);
      -[MFOutgoingMessageDelivery setCompositionSpecification:](self->_delivery, "setCompositionSpecification:", v20);
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[MFMailComposeDeliveryController log](MFMailComposeDeliveryController, "log"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ef_publicDescription"));
        sub_100394380(v21, (uint64_t)v99, v20);
      }
    }

  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", self->_sendingAddress));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mailboxUidOfType:createIfNeeded:", 5, 1));
  v22 = objc_alloc((Class)EMMailboxObjectID);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URL"));
  v72 = objc_msgSend(v22, "initWithURL:", v23);

  v24 = objc_claimAutoreleasedReturnValue(+[MFMailComposeDeliveryController log](MFMailComposeDeliveryController, "log"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v98 = v72;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Delivering message from draft: %@", buf, 0xCu);
  }

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_10016EA70;
  v93[3] = &unk_10051B1B8;
  objc_copyWeak(&v94, &location);
  v67 = objc_retainBlock(v93);
  if (self->_delivery)
  {
    if ((objc_opt_respondsToSelector(v71, "mailComposeDeliveryControllerWillAttemptToSend:") & 1) != 0)
      objc_msgSend(v71, "mailComposeDeliveryControllerWillAttemptToSend:", self);
    if (self->_isHideMyEmailMessage)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[MFMailComposeDeliveryController log](MFMailComposeDeliveryController, "log"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery originalMessageObjectID](self->_delivery, "originalMessageObjectID"));
        *(_DWORD *)buf = 138543362;
        v98 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not updating CoreRecents library as message:<%{public}@> is HME message.", buf, 0xCu);

      }
    }
    else
    {
      v37 = -[objc_class defaultInstance](off_1005A21B8(), "defaultInstance");
      v25 = objc_claimAutoreleasedReturnValue(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery originalHeaders](self->_delivery, "originalHeaders"));
      -[NSObject recordContactEventsForHeaders:recentsDomain:](v25, "recordContactEventsForHeaders:recentsDomain:", v38, kMFMobileMailBundleIdentifier);

    }
    v39 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", -[MFOutgoingMessageDelivery conversationFlags](self->_delivery, "conversationFlags"));
    delivery = self->_delivery;
    v41 = objc_opt_class(MFMailDropMailDelivery);
    isKindOfClass = objc_opt_isKindOfClass(delivery, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery message](self->_delivery, "message"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery originalMessageObjectID](self->_delivery, "originalMessageObjectID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessageDelivery compositionSpecification](self->_delivery, "compositionSpecification"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", MFSecureMIMECompositionSpecificationShouldEncrypt));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", MFSecureMIMECompositionSpecificationShouldSign));
    v47 = (void *)v46;
    v63 = (void *)v46;
    if (v45)
    {
      v48 = objc_msgSend(v45, "BOOLValue");
      if (v47)
      {
LABEL_30:
        v49 = objc_msgSend(v47, "BOOLValue");
LABEL_33:
        v50 = objc_alloc((Class)EMOutgoingMessage);
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_10016EAF0;
        v86[3] = &unk_1005214B0;
        v32 = v43;
        v87 = v32;
        v88 = self;
        v34 = v64;
        v91 = v49;
        v92 = v48;
        v89 = v34;
        v90 = v39;
        v51 = objc_msgSend(v50, "initWithBuilder:", v86);
        if (self->_sendLaterDate)
        {
          v52 = objc_claimAutoreleasedReturnValue(+[MFMailComposeDeliveryController log](MFMailComposeDeliveryController, "log"));
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v98 = v72;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Draft message: %@ will be sent on a send later date", buf, 0xCu);
          }

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "saveSendLaterMessage:sendLaterDate:", v51, self->_sendLaterDate));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_10016EBA8;
          v82[3] = &unk_1005214D8;
          v83 = v70;
          v84[0] = v72;
          v84[1] = self;
          v55 = v68;
          v85 = v55;
          objc_msgSend(v53, "onScheduler:addSuccessBlock:", v54, v82);

          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472;
          v80[2] = sub_10016EC7C;
          v80[3] = &unk_10051B000;
          v81 = v55;
          objc_msgSend(v53, "addFailureBlock:", v80);
          v56 = &v83;
          v57 = (id *)v84;
          v58 = &v85;
          v59 = &v81;
        }
        else
        {
          v60 = objc_msgSend(v70, "deliverMessage:usingMailDrop:isCancelable:", v51, isKindOfClass & 1, _os_feature_enabled_impl("Mail", "UndoSend") & (isKindOfClass ^ 1));
          v53 = (void *)objc_claimAutoreleasedReturnValue(v60);
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_10016ED54;
          v73[3] = &unk_100521548;
          v74 = v72;
          v75[0] = v70;
          v75[1] = self;
          v76 = v51;
          v77 = v71;
          v78 = v67;
          v79 = v68;
          objc_msgSend(v53, "addSuccessBlock:", v73);

          v56 = &v74;
          v57 = (id *)v75;
          v58 = &v76;
          v59 = &v77;
        }

LABEL_39:
        goto LABEL_40;
      }
    }
    else
    {
      v48 = 0;
      if (v46)
        goto LABEL_30;
    }
    v49 = 0;
    goto LABEL_33;
  }
  v27 = (MFOutgoingMessage *)objc_claimAutoreleasedReturnValue(-[EFFuture result:](self->_futureDraft, "result:", 0));
  outgoingMessage = self->_outgoingMessage;
  self->_outgoingMessage = v27;

  if (v27)
  {
    v29 = objc_claimAutoreleasedReturnValue(+[MFMailComposeDeliveryController log](MFMailComposeDeliveryController, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v72;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Creating future for outgoingMessage: %@", buf, 0xCu);
    }

    v30 = objc_alloc((Class)EMOutgoingMessage);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MFOutgoingMessage messageData](self->_outgoingMessage, "messageData"));
    v32 = objc_msgSend(v30, "initWithMessageData:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[EMMessage objectID](self->_draftMessage, "objectID"));
    v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "saveDraftMessage:mailboxObjectID:previousDraftObjectID:", v32, v72, v33));

    v35 = objc_msgSend(v34, "result:", 0);
    if ((objc_opt_respondsToSelector(v71, "mailComposeDeliveryControllerDidAttemptToSaveDraft:account:result:") & 1) != 0)
      objc_msgSend(v71, "mailComposeDeliveryControllerDidAttemptToSaveDraft:account:result:", self, v65, 1);
    backupCompletionHandler = (void (**)(id, uint64_t))self->_backupCompletionHandler;
    if (backupCompletionHandler)
      backupCompletionHandler[2](backupCompletionHandler, 1);
    ((void (*)(void))v67[2])();
    (*((void (**)(id, uint64_t))v68 + 2))(v68, 1);
    goto LABEL_39;
  }
  v61 = objc_claimAutoreleasedReturnValue(+[MFMailComposeDeliveryController log](MFMailComposeDeliveryController, "log"));
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v98 = v72;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Failed to deliver draft message: %@", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD))v68 + 2))(v68, 0);
LABEL_40:

  objc_destroyWeak(&v94);
  objc_destroyWeak(&location);

}

- (id)error
{
  return self->_error;
}

- (void)setPercentDone:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  v4 = MFLookupLocalizedString(CFSTR("SENDING_DATA_FORMAT"), CFSTR("Sending data (%d%% done)"), CFSTR("Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, 10));
  objc_msgSend(v7, "setStatusMessage:percentDone:", v6, a3);

}

- (void)notifyUserDeliverySucceeded:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor", a3));
  objc_msgSend(v3, "reset");

}

- (MailComposeDeliveryControllerDelegate)delegate
{
  return (MailComposeDeliveryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void)setSendingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (MFMailboxUid)draftMailbox
{
  return self->_draftMailbox;
}

- (void)setDraftMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_draftMailbox, a3);
}

- (MFMailMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessage, a3);
}

- (int64_t)composeType
{
  return self->_composeType;
}

- (void)setComposeType:(int64_t)a3
{
  self->_composeType = a3;
}

- (id)backupCompletionHandler
{
  return self->_backupCompletionHandler;
}

- (void)setBackupCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (EMMessage)draftMessage
{
  return self->_draftMessage;
}

- (void)setDraftMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftMessage, 0);
  objc_storeStrong(&self->_backupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_draftMailbox, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_futureDraft, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_draftDocumentID, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingMessage, 0);
  objc_storeStrong((id *)&self->_delivery, 0);
}

@end
