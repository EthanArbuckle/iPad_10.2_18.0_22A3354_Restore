@implementation MFMailComposeControllerViewDelegateHandler

- (MFMailComposeControllerViewDelegateHandler)initWithUICoordinator:(id)a3 daemonInterface:(id)a4
{
  id v6;
  id v7;
  MFMailComposeControllerViewDelegateHandler *v8;
  MFMailComposeControllerViewDelegateHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeControllerViewDelegateHandler;
  v8 = -[MFMailComposeControllerViewDelegateHandler init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_coordinator, v6);
    objc_storeStrong((id *)&v9->_daemonInterface, a4);
  }

  return v9;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C724;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA1A0 != -1)
    dispatch_once(&qword_1005AA1A0, block);
  return (id)qword_1005AA198;
}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C808;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA1B0 != -1)
    dispatch_once(&qword_1005AA1B0, block);
  return (id)qword_1005AA1A8;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

- (void)mailComposeControllerWantsToBackUpDraft:(id)a3
{
  id v4;
  MFMailComposeDeliveryController *v5;
  id v6;
  MFMailComposeDeliveryController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = [MFMailComposeDeliveryController alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10016CA78;
  v13[3] = &unk_10051A848;
  v6 = v4;
  v14 = v6;
  v7 = -[MFMailComposeDeliveryController initWithComposeController:backupCompletionHandler:](v5, "initWithComposeController:backupCompletionHandler:", v6, v13);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SAVING"), &stru_100531B00, CFSTR("Main")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler coordinator](self, "coordinator"));
    -[MFMailComposeDeliveryController setDelegate:](v7, "setDelegate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", "deliverMessage", v7, v9, 9, 1));
    objc_msgSend(v11, "addInvocation:", v12);

  }
}

- (void)mailComposeControllerCompositionFinished:(id)a3
{
  -[MFMailComposeControllerViewDelegateHandler mailComposeControllerCompositionFinished:prepareForDismissalHandler:](self, "mailComposeControllerCompositionFinished:prepareForDismissalHandler:", a3, 0);
}

- (void)mailComposeControllerCompositionFinished:(id)a3 prepareForDismissalHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  MFMailComposeDeliveryController *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void (**v20)(void);
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler log](MFMailComposeControllerViewDelegateHandler, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting up delivery controller", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler coordinator](self, "coordinator"));
  v10 = -[MFMailComposeDeliveryController initWithComposeController:]([MFMailComposeDeliveryController alloc], "initWithComposeController:", v6);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SENDING"), &stru_100531B00, CFSTR("Main")));

    -[MFMailComposeDeliveryController setDelegate:](v10, "setDelegate:", v9);
    v13 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler log](MFMailComposeControllerViewDelegateHandler, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Triggering deliverMessage on the delivery controller", v26, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", "deliverMessage", v10, v12, 9, 1));
    objc_msgSend(v14, "addInvocation:", v15);

  }
  if (_os_feature_enabled_impl("Mail", "AppStoreReviewPrompt"))
    -[MFMailComposeControllerViewDelegateHandler _presentAppStoreReviewPromptAndNotifyCriterionIfNecessary:](self, "_presentAppStoreReviewPromptAndNotifyCriterionIfNecessary:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "composeWebView"));
  v17 = objc_msgSend(v16, "isQuickReply");

  if (objc_msgSend(v6, "needsDelivery"))
    v18 = objc_msgSend(v6, "isSavingAsDraft") ^ 1;
  else
    v18 = 0;
  objc_msgSend(v9, "dismissComposeViewController:animated:afterSending:", v6, v17 ^ 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composeCompletionBlock"));

  if (v19)
  {
    v20 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composeCompletionBlock"));
    v20[2]();

    objc_msgSend(v9, "setComposeCompletionBlock:", 0);
  }
  v21 = objc_msgSend(v6, "resolution");
  if ((unint64_t)v21 <= 3)
    v22 = 3 - (_QWORD)v21;
  else
    v22 = 0;
  if (v7)
    v7[2](v7, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler delegate](self, "delegate"));
  objc_msgSend(v23, "composeFinishedWithResult:", v22);

  -[MFMailComposeControllerViewDelegateHandler setDelegate:](self, "setDelegate:", 0);
  -[MFMailComposeControllerViewDelegateHandler setEntitledDelegate:](self, "setEntitledDelegate:", 0);
  v24 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler log](MFMailComposeControllerViewDelegateHandler, "log"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Finished sending message", v25, 2u);
  }

}

- (void)_presentAppStoreReviewPromptAndNotifyCriterionIfNecessary:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "didUseOmittedAttachmentsOrRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compositionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sendLaterDate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler coordinator](self, "coordinator"));
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v5;
  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowSceneForAppStoreReviewPrompt"));
    if (v11)
    {
      if (v5)
        v12 = 4;
      else
        v12 = 3;
      v13 = v7 == 0;
      v14 = v5 ^ 1;
      if (v13)
        v15 = 0;
      else
        v15 = v5;
      if (v15 == 1)
      {
        v16 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler log](MFMailComposeControllerViewDelegateHandler, "log"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 134217984;
          v20 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App Store Review prompt: multiple reasons apply, but reporting %ld", (uint8_t *)&v19, 0xCu);
        }

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appStoreReviewManager"));
      objc_msgSend(v17, "notifyCriterionMet:", v12);

      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appStoreReviewManager"));
      -[NSObject attemptToShowPromptIn:reason:](v18, "attemptToShowPromptIn:reason:", v11, v14);
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler log](MFMailComposeControllerViewDelegateHandler, "log"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100394340(v18);
    }

  }
}

- (void)mailComposeControllerCompositionHandoffFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  MFMailComposeControllerViewDelegateHandler *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastDraftMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autosaveIdentifier"));
  global_queue = dispatch_get_global_queue(-2, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016D1A4;
  block[3] = &unk_10051A960;
  v10 = v6;
  v14 = v10;
  v15 = self;
  v11 = v7;
  v16 = v11;
  dispatch_async(v9, block);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler coordinator](self, "coordinator"));
  objc_msgSend(v12, "dismissComposeViewController:animated:afterSending:", v4, 1, 0);

}

- (void)mailComposeController:(id)a3 failedToHandoffCompositionWithError:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler coordinator](self, "coordinator"));
  objc_msgSend(v5, "didFailToContinueUserActivityWithType:error:", MSMailActivityHandoffTypeComposeWithStreams, v6);

}

- (BOOL)mailComposeControllerIsActiveComposeController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "navigationController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler coordinator](self, "coordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeViewController"));

    v7 = v6 == v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler entitledDelegate](self, "entitledDelegate"));
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler signpostLog](MFMailComposeControllerViewDelegateHandler, "signpostLog"));
    v14 = os_signpost_id_generate(v13);

    v15 = objc_claimAutoreleasedReturnValue(+[MFMailComposeControllerViewDelegateHandler signpostLog](MFMailComposeControllerViewDelegateHandler, "signpostLog"));
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MFMailComposeControllerViewDelegateHandlerShouldSendMail", ", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10016D510;
    v17[3] = &unk_100521430;
    v19 = v14;
    v18 = v11;
    objc_msgSend(v12, "composeShouldSendMail:toRecipients:completion:", v9, v10, v17);

  }
  else
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }

}

- (MSDOpenComposeProtocolDelegate)delegate
{
  return (MSDOpenComposeProtocolDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MSDEntitledOpenComposeProtocolDelegate)entitledDelegate
{
  return (MSDEntitledOpenComposeProtocolDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntitledDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MailComposeDeliveryUICoordinator)coordinator
{
  return (MailComposeDeliveryUICoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_entitledDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
