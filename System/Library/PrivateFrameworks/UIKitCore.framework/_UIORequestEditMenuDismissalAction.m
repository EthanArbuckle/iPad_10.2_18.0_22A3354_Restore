@implementation _UIORequestEditMenuDismissalAction

- (_UIORequestEditMenuDismissalAction)initWithConfigurationIdentifier:(id)a3 reason:(int64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _UIORequestEditMenuDismissalAction *v10;
  objc_super v12;

  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setObject:forSetting:", v7, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  v12.receiver = self;
  v12.super_class = (Class)_UIORequestEditMenuDismissalAction;
  v10 = -[_UIOServerAction initWithOriginContext:info:responder:](&v12, sel_initWithOriginContext_info_responder_, 0, v8, 0);

  return v10;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[_UIORequestEditMenuDismissalAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)reason
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIORequestEditMenuDismissalAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isPermitted
{
  return +[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled](UIEditMenuInteraction, "_isOutOfProcessEditMenusEnabled");
}

- (void)performActionFromConnection:(id)a3
{
  void *v4;
  id v5;

  +[_UIEditMenuPresentationServer sharedPresentationServer](_UIEditMenuPresentationServer, "sharedPresentationServer", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIORequestEditMenuDismissalAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissEditMenuForIdentifier:hideReason:", v4, -[_UIORequestEditMenuDismissalAction reason](self, "reason"));

}

@end
