@implementation _UIOKeyShortcutHUDDismissalAction

- (_UIOKeyShortcutHUDDismissalAction)initWithResponse:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  _UIOKeyShortcutHUDDismissalAction *v8;
  objc_super v10;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v7, 0);
  v10.receiver = self;
  v10.super_class = (Class)_UIOKeyShortcutHUDDismissalAction;
  v8 = -[_UIOKeyShortcutHUDDismissalAction initWithInfo:responder:](&v10, sel_initWithInfo_responder_, v6, 0);

  return v8;
}

- (_UIKeyShortcutHUDDismissalResponse)response
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOKeyShortcutHUDDismissalAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyShortcutHUDDismissalResponse *)v7;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIOKeyShortcutHUDDismissalAction response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyShortcutHUDDidDismissWithResponse:toOverlayService:", v5, v4);

}

@end
