@implementation MailConversationScene

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E0B54;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9D18 != -1)
    dispatch_once(&qword_1005A9D18, block);
  return (id)qword_1005A9D10;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  ConversationViewController *v4;
  id v5;
  MailDetailNavigationController *v6;
  MFMailComposeControllerViewDelegateHandler *v7;
  void *v8;
  MFMailComposeControllerViewDelegateHandler *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  _BOOL4 v31;

  v27.receiver = self;
  v27.super_class = (Class)MailConversationScene;
  v26 = a3;
  -[MailScene mailSceneDidConnectWithOptions:](&v27, "mailSceneDidConnectWithOptions:");
  v4 = -[ConversationViewController initWithScene:]([ConversationViewController alloc], "initWithScene:", self);
  -[ConversationViewControllerBase setIsPrimary:](v4, "setIsPrimary:", 1);
  -[ConversationViewControllerBase setIsStandalone:](v4, "setIsStandalone:", 1);
  -[ConversationViewControllerBase setDelegate:](v4, "setDelegate:", self);
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonPressed");
  -[ConversationViewControllerBase setDoneButton:](v4, "setDoneButton:", v5);

  v6 = -[MailDetailNavigationController initWithRootViewController:]([MailDetailNavigationController alloc], "initWithRootViewController:", v4);
  v7 = [MFMailComposeControllerViewDelegateHandler alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v9 = -[MFMailComposeControllerViewDelegateHandler initWithUICoordinator:daemonInterface:](v7, "initWithUICoordinator:daemonInterface:", self, v8);
  -[MailConversationScene setComposeViewDelegateHandler:](self, "setComposeViewDelegateHandler:", v9);

  -[MailConversationScene setConversationViewController:](self, "setConversationViewController:", v4);
  -[MailConversationScene setNavigationController:](self, "setNavigationController:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene session](self, "session"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateRestorationActivity"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userActivities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ef_anyPassingTest:", &stru_10051E360));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", MSMailActivityHandoffDisplayMessageKeyRestorationState));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene activationConditions](self, "activationConditions"));
  objc_msgSend(v16, "setCanActivateForTargetContentIdentifierPredicate:", v15);

  v17 = objc_claimAutoreleasedReturnValue(+[MailConversationScene log](MailConversationScene, "log"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene session](self, "session"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "persistentIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene session](self, "session"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stateRestorationActivity"));
    *(_DWORD *)buf = 138412546;
    v29 = v19;
    v30 = 1024;
    v31 = v21 != 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Connection conditions: sessionID=%@ hasRestorationActivity=%{BOOL}d", buf, 0x12u);

  }
  if (v14)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "messageRepository"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState loadFromDictionary:usingRepository:](ConversationViewRestorationState, "loadFromDictionary:usingRepository:", v14, v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene conversationViewController](self, "conversationViewController"));
    objc_msgSend(v25, "restoreState:", v24);

  }
}

- (id)stateRestorationActivityForMailScene
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene conversationViewController](self, "conversationViewController"));
  v4 = objc_msgSend(v3, "newBackgroundMonitor");
  objc_msgSend(v4, "setAction:", 1);
  -[MailScene addBackgroundMonitor:](self, "addBackgroundMonitor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "captureRestorationState"));
  if (v5)
  {
    v6 = objc_alloc((Class)NSUserActivity);
    v7 = MSMailActivityHandoffTypeDisplayMessage;
    v8 = objc_msgSend(v6, "initWithActivityType:", MSMailActivityHandoffTypeDisplayMessage);
    v13[0] = v7;
    v12[0] = MSMailActivityHandoffTypeKey;
    v12[1] = MSMailActivityHandoffDisplayMessageKeyRestorationState;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));
    v13[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
    objc_msgSend(v8, "setUserInfo:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mailSceneDidDisconnect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailConversationScene;
  -[MailScene mailSceneDidDisconnect](&v7, "mailSceneDidDisconnect");
  if (-[MailConversationScene isComposeWindowActive](self, "isComposeWindowActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

    if (!objc_msgSend(v4, "resolution"))
    {
      objc_msgSend(v4, "_setCompositionContext:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dockPersistence"));
      objc_msgSend(v6, "recoverAbandonedDrafts");

    }
  }
}

- (id)_createURLRoutes
{
  MFComposeURLRoute *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = -[MFComposeURLRoute initWithScene:]([MFComposeURLRoute alloc], "initWithScene:", self);
  v8.receiver = self;
  v8.super_class = (Class)MailConversationScene;
  v4 = -[MailScene _createURLRoutes](&v8, "_createURLRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObject:", v3));

  return v6;
}

- (BOOL)shouldUpdateWidgetWhenSceneResignsActive
{
  return 1;
}

- (MFMailPopoverManager)popoverManager
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if (pthread_main_np() != 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailConversationScene.m"), 135, CFSTR("Current thread must be main"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailPopoverManager managerForWindow:createIfNeeded:](MFMailPopoverManager, "managerForWindow:createIfNeeded:", v5, 1));
  else
    v6 = 0;

  return (MFMailPopoverManager *)v6;
}

- (BOOL)displayMessage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", EMErrorDomain, 2050, 0));
  objc_msgSend(v3, "requestAbortedWithError:", v4);

  return 0;
}

- (BOOL)isComposeWindowActive
{
  void *v2;
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  v4 = objc_opt_class(ComposeNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  ComposeNavigationController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void (**v23)(void);
  ComposeNavigationController *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  Class v32;
  char isKindOfClass;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  id v37;
  id v38;
  _QWORD v39[5];
  ComposeNavigationController *v40;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[ComposeNavigationController initWithComposition:]([ComposeNavigationController alloc], "initWithComposition:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController presentationController](v16, "presentationController"));
  objc_msgSend(v17, "setDelegate:", self);

  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController presentationController](v16, "presentationController"));
    v37 = v15;
    v38 = v14;
    v19 = objc_opt_class(UISheetPresentationController);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      v20 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");

      if (!v20)
        goto LABEL_6;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController presentationController](v16, "presentationController"));
      objc_msgSend(v18, "_setAllowsTearOff:", 1);
      objc_msgSend(v18, "setPrefersGrabberVisible:", 1);
    }

LABEL_6:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene composeViewDelegateHandler](self, "composeViewDelegateHandler"));
    -[ComposeNavigationController setMailComposeDelegate:](v16, "setMailComposeDelegate:", v21);

    if (v13 || (v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "draftSubject"))) != 0)
      -[ComposeNavigationController setInitialTitle:](v16, "setInitialTitle:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene composeCompletionBlock](self, "composeCompletionBlock"));

    if (v22)
    {
      v23 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MailConversationScene composeCompletionBlock](self, "composeCompletionBlock"));
      v23[2]();

    }
    -[MailConversationScene setComposeCompletionBlock:](self, "setComposeCompletionBlock:", v15);
    v36 = v10;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000E19B8;
    v39[3] = &unk_10051A910;
    v39[4] = self;
    v24 = v16;
    v40 = v24;
    v25 = objc_retainBlock(v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CLFSystemShellSwitcher sharedSystemShellSwitcher](CLFSystemShellSwitcher, "sharedSystemShellSwitcher"));
    v28 = objc_msgSend(v27, "isClarityBoardEnabled");

    if (((+[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1 | v28) & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachmentToMarkupContentID"));
      if (v29
        && (v30 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController")),
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "presentedViewController")),
            v32 = off_10059FA78(),
            isKindOfClass = objc_opt_isKindOfClass(v31, v32),
            v31,
            v30,
            v29,
            (isKindOfClass & 1) != 0))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "presentedViewController"));
        objc_msgSend(v34, "presentViewController:animated:completion:", v24, v36, v25);

      }
      else
      {
        objc_msgSend(v26, "presentViewController:animated:completion:", v24, v36, v25);
      }
    }
    else
    {
      +[MFBayAdoption openComposeWithContext:presentationSource:requestingScene:](MFBayAdoption, "openComposeWithContext:presentationSource:requestingScene:", v12, v38, self);
    }

    v15 = v37;
    v14 = v38;
    goto LABEL_21;
  }
  v35 = objc_claimAutoreleasedReturnValue(+[MailConversationScene log](MailConversationScene, "log"));
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    sub_100392308(v35);

LABEL_21:
}

- (id)composeAccountIsDefault:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  *a3 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene conversationViewController](self, "conversationViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceMessageListItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene mailboxProvider](self, "mailboxProvider")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legacyMailboxForObjectID:", v10)),
        v10,
        v9,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "account")),
        v11,
        !v12))
  {
    *a3 = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery"));
  }

  return v12;
}

- (void)showComposeWithUserActivity:(id)a3 completion:(id)a4
{
  +[MFBayAdoption migrateQuickReplyDraft:completion:](MFBayAdoption, "migrateQuickReplyDraft:completion:", a3, a4);
}

- (void)_composeCommandInvoked:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;

  v4 = objc_claimAutoreleasedReturnValue(+[MailConversationScene log](MailConversationScene, "log", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Created invocation to update aliases.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
  v6 = +[MFMonitoredInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", "updateEmailAliasesForActiveAccounts", objc_opt_class(MailAccount));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "addInvocation:", v7);

  v14 = -86;
  v8 = objc_alloc_init((Class)_MFMailCompositionContext);
  objc_msgSend(v8, "setShowKeyboardImmediately:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene composeAccountIsDefault:](self, "composeAccountIsDefault:", &v14));
  v10 = objc_claimAutoreleasedReturnValue(+[MailConversationScene log](MailConversationScene, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
    *(_DWORD *)buf = 138412546;
    v16 = v11;
    v17 = 1024;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Compose using account:%@, isDefault: %{BOOL}d.", buf, 0x12u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultEmailAddress"));
  v13 = v12;
  if (!v12)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstEmailAddress"));
  objc_msgSend(v8, "setPreferredSendingEmailAddress:", v13);
  if (!v12)

  objc_msgSend(v8, "setIsUsingDefaultAccount:", v14);
  objc_msgSend(v8, "setPrefersFirstLineSelection:", 1);
  -[MailConversationScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v8, 1, 0, 0, 0);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  if ("_composeCommandInvoked:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene mf_rootViewController](self, "mf_rootViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    v7 = v9 == 0;

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MailConversationScene;
    v7 = -[MailScene canPerformAction:withSender:](&v11, "canPerformAction:withSender:", a3, v6);
  }

  return v7;
}

- (BOOL)conversationViewControllerIsResultOfSearch:(id)a3
{
  return 0;
}

- (BOOL)conversationViewController:(id)a3 canAdvanceToNextConversationWithDirection:(int)a4
{
  return 0;
}

- (void)referenceMessageNoLongerAvailableInConversationView:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E1F84;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)conversationViewControllerWantsDismissal:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E2018;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (BOOL)conversationViewControllerShouldDismissOnDestructiveAction:(id)a3
{
  return 1;
}

- (BOOL)conversationViewControllerAllowsRemindMeAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v3 = a3;
  if (_os_feature_enabled_impl("Mail", "RemindMeEverywhere"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "referenceMessageListItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxes"));
    v6 = objc_msgSend(v5, "ef_all:", &stru_10051E380);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "referenceMessageListItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxes"));
    v6 = objc_msgSend(v5, "ef_any:", &stru_10051E3A0);
  }
  v7 = v6;

  return v7;
}

- (BOOL)conversationViewControllerCanShowNoMessageSelectedView:(id)a3
{
  return 1;
}

- (int64_t)currentlySelectedBucketForConversationViewController:(id)a3
{
  return 0;
}

- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (((unint64_t)objc_msgSend(v9, "status") & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
    -[MailScene displayError:forAccount:mode:](self, "displayError:forAccount:mode:", v10, v11, 2);

  }
}

- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene activeViewController](self, "activeViewController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MailConversationScene activeViewController](self, "activeViewController"));

  if (v10 == v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene session](self, "session"));
    objc_msgSend(v12, "mf_setActiveDraftIdentifier:", 0);

    if (v6 && v5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController"));
      objc_msgSend(v13, "dismissViewControllerWithTransition:completion:", 3, 0);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController"));
      objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v6, 0);
    }

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailConversationScene log](MailConversationScene, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100392348((uint64_t)v8, (uint64_t)v9, v11);

  }
}

- (id)activeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailConversationScene navigationController](self, "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleViewController"));

  return v3;
}

- (AppStoreReviewManager)appStoreReviewManager
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl("Mail", "AppStoreReviewPrompt"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appStoreReviewManager"));

  }
  else
  {
    v3 = 0;
  }
  return (AppStoreReviewManager *)v3;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v4 = objc_msgSend(v3, "isDirty") ^ 1;

  return v4;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2550;
  block[3] = &unk_10051AA98;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mailComposeController"));
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_sheetPresentationControllerDidTearOff:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailConversationScene session](self, "session", a3));
  objc_msgSend(v3, "mf_setActiveDraftIdentifier:", 0);

}

- (void)_doneButtonPressed
{
  -[MailScene closeSceneWithAnimation:](self, "closeSceneWithAnimation:", 1);
}

- (void)_escapeShortcutInvoked:(id)a3
{
  -[MailConversationScene _doneButtonPressed](self, "_doneButtonPressed", a3);
}

- (id)composeCompletionBlock
{
  return self->composeCompletionBlock;
}

- (void)setComposeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (ConversationViewController)conversationViewController
{
  return self->_conversationViewController;
}

- (void)setConversationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationViewController, a3);
}

- (MailDetailNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (MFMailComposeControllerViewDelegateHandler)composeViewDelegateHandler
{
  return self->_composeViewDelegateHandler;
}

- (void)setComposeViewDelegateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_composeViewDelegateHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewDelegateHandler, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_conversationViewController, 0);
  objc_storeStrong(&self->composeCompletionBlock, 0);
}

@end
