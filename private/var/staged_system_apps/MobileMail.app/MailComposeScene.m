@implementation MailComposeScene

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DEC84;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9D08 != -1)
    dispatch_once(&qword_1005A9D08, block);
  return (OS_os_log *)(id)qword_1005A9D00;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  MFMailComposeControllerViewDelegateHandler *v7;
  void *v8;
  void *v9;
  void *v10;
  MFMailComposeControllerViewDelegateHandler *v11;
  ComposeNavigationController *v12;
  MFMailComposeControllerViewDelegateHandler *delegateHandler;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MailComposeScene;
  -[MailScene mailSceneDidConnectWithOptions:](&v24, "mailSceneDidConnectWithOptions:", v4);
  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  v5 = sub_1000DEFEC(self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = [MFMailComposeControllerViewDelegateHandler alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "daemonInterface"));
  v11 = -[MFMailComposeControllerViewDelegateHandler initWithUICoordinator:daemonInterface:](v7, "initWithUICoordinator:daemonInterface:", v8, v10);
  sub_1000DF374((uint64_t)self, v11);

  v12 = -[ComposeNavigationController initWithComposition:]([ComposeNavigationController alloc], "initWithComposition:", v6);
  -[MailComposeScene setComposeNavigationController:](self, "setComposeNavigationController:", v12);

  delegateHandler = self->_delegateHandler;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  objc_msgSend(v14, "setMailComposeDelegate:", delegateHandler);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "autosaveIdentifier"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene session](self, "session"));
  objc_msgSend(v17, "mf_setActiveDraftIdentifier:", v16);

  +[MailComposeViewAnnotationBridge registerMailViewAnnotationDelegate:](_TtC10MobileMail31MailComposeViewAnnotationBridge, "registerMailViewAnnotationDelegate:", self);
  v18 = v16;
  if (!v16)
  {
    v11 = (MFMailComposeControllerViewDelegateHandler *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler UUIDString](v11, "UUIDString"));
  }
  v19 = MSMailComposeWindowTargetContentIdentifierWithIdentifier(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self == %@"), v20));

  if (!v16)
  {

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene activationConditions](self, "activationConditions"));
  objc_msgSend(v22, "setCanActivateForTargetContentIdentifierPredicate:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene activationConditions](self, "activationConditions"));
  objc_msgSend(v23, "setPrefersToActivateForTargetContentIdentifierPredicate:", v21);

  sub_1000DF38C(self, v6);
}

- (void)mailSceneWillResignActive
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailComposeScene;
  -[MailScene mailSceneWillResignActive](&v7, "mailSceneWillResignActive");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  if (!objc_msgSend(v3, "resolution"))
  {

    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  v5 = objc_msgSend(v4, "resolution");

  if (v5 == (id)2)
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
    objc_msgSend(v6, "willBeginDocking");

  }
}

- (void)mailSceneDidEnterBackground
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  MFMailComposeControllerViewDelegateHandler *delegateHandler;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailComposeScene;
  -[MailScene mailSceneDidEnterBackground](&v9, "mailSceneDidEnterBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  if (objc_msgSend(v3, "resolution"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
    v5 = objc_msgSend(v4, "resolution");

    if (v5 != (id)2)
      return;
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  objc_msgSend(v6, "didCompleteDocking");

  if (self)
    delegateHandler = self->_delegateHandler;
  else
    delegateHandler = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeControllerViewDelegateHandler delegate](delegateHandler, "delegate"));
  objc_msgSend(v8, "composeFinishedWithResult:", 1);

}

- (id)stateRestorationActivityForMailScene
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userActivityForRestoration"));

  return v3;
}

- (void)mailSceneDidDisconnect
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MailComposeScene;
  -[MailScene mailSceneDidDisconnect](&v8, "mailSceneDidDisconnect");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  v4 = objc_msgSend(v3, "resolution");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
    objc_msgSend(v5, "_setCompositionContext:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dockPersistence"));
    objc_msgSend(v7, "recoverAbandonedDrafts");

  }
  +[MailComposeViewAnnotationBridge unregisterMailViewAnnotationDelegate:](_TtC10MobileMail31MailComposeViewAnnotationBridge, "unregisterMailViewAnnotationDelegate:", self);
}

- (BOOL)isComposeWindowActive
{
  return 1;
}

- (void)resumeCompositionOfDraft:(id)a3 legacyDraft:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initDraftRestoreOfMessage:legacyMessage:", v9, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  objc_msgSend(v8, "_setCompositionContext:", v7);

}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD))a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  objc_msgSend(v12, "_setCompositionContext:", v14);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene composeNavigationController](self, "composeNavigationController"));
  objc_msgSend(v13, "setInitialTitle:", v10);

  v11[2](v11);
}

- (id)composeAccountIsDefault:(BOOL *)a3
{
  *a3 = 1;
  return +[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery");
}

- (id)composeViewDelegate
{
  if (self)
    self = (MailComposeScene *)self->_delegateHandler;
  return self;
}

- (id)getAutosaveId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailComposeScene session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mf_activeDraftIdentifier"));

  return v3;
}

- (ComposeNavigationController)composeNavigationController
{
  return self->_composeNavigationController;
}

- (void)setComposeNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_composeNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteComposeService, 0);
  objc_storeStrong((id *)&self->_restorationActivity, 0);
  objc_storeStrong((id *)&self->_delegateHandler, 0);
  objc_storeStrong((id *)&self->_composeNavigationController, 0);
}

@end
