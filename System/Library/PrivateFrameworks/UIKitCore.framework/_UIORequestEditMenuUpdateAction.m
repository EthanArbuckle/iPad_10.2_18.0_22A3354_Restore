@implementation _UIORequestEditMenuUpdateAction

- (_UIORequestEditMenuUpdateAction)initWithConfigurationIdentifier:(id)a3 updatedMenu:(id)a4 reason:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _UIORequestEditMenuUpdateAction *v13;
  objc_super v15;

  v8 = (void *)MEMORY[0x1E0CB36F8];
  v9 = a3;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v11, "setObject:forSetting:", v9, 0);

  objc_msgSend(v11, "setObject:forSetting:", v10, 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v12, 2);

  v15.receiver = self;
  v15.super_class = (Class)_UIORequestEditMenuUpdateAction;
  v13 = -[_UIOServerAction initWithOriginContext:info:responder:](&v15, sel_initWithOriginContext_info_responder_, 0, v11, 0);

  return v13;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[_UIORequestEditMenuUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIMenu)updatedMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = objc_opt_class();
  -[_UIORequestEditMenuUpdateAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v7;
}

- (int64_t)reason
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIORequestEditMenuUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
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
  void *v5;
  id v6;

  +[_UIEditMenuPresentationServer sharedPresentationServer](_UIEditMenuPresentationServer, "sharedPresentationServer", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIORequestEditMenuUpdateAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIORequestEditMenuUpdateAction updatedMenu](self, "updatedMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceEditMenuForIdentifier:updatedMenu:reason:", v4, v5, -[_UIORequestEditMenuUpdateAction reason](self, "reason"));

}

@end
