@implementation MailDebugScene

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  id v4;
  MFMailDebugMenuController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailDebugScene;
  -[MailScene mailSceneDidConnectWithOptions:](&v10, "mailSceneDidConnectWithOptions:", v4);
  v5 = -[MFMailDebugMenuController initWithScene:]([MFMailDebugMenuController alloc], "initWithScene:", self);
  -[MailDebugScene setDebugMenu:](self, "setDebugMenu:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailDebugScene debugMenu](self, "debugMenu"));
  objc_msgSend(v6, "setPresenter:", self);

  -[MailDebugScene setTitle:](self, "setTitle:", CFSTR("Debugging"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self == %@"), CFSTR("com.apple.mail.private.debugmenu")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailDebugScene activationConditions](self, "activationConditions"));
  objc_msgSend(v8, "setCanActivateForTargetContentIdentifierPredicate:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailDebugScene activationConditions](self, "activationConditions"));
  objc_msgSend(v9, "setPrefersToActivateForTargetContentIdentifierPredicate:", v7);

}

- (void)debugMenuWantsDismissal:(id)a3
{
  -[MailScene closeSceneWithAnimation:](self, "closeSceneWithAnimation:", 1);
}

- (MFMailDebugMenuController)debugMenu
{
  return self->_debugMenu;
}

- (void)setDebugMenu:(id)a3
{
  objc_storeStrong((id *)&self->_debugMenu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugMenu, 0);
}

@end
