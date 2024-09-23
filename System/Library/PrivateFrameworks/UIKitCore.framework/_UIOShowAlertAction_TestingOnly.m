@implementation _UIOShowAlertAction_TestingOnly

- (_UIOShowAlertAction_TestingOnly)initWithTitle:(id)a3 message:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  _UIOShowAlertAction_TestingOnly *v10;
  objc_super v12;

  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forSetting:", v8, 0);

  objc_msgSend(v9, "setObject:forSetting:", v7, 1);
  v12.receiver = self;
  v12.super_class = (Class)_UIOShowAlertAction_TestingOnly;
  v10 = -[_UIOServerAction initWithOriginContext:info:responder:](&v12, sel_initWithOriginContext_info_responder_, 0, v9, 0);

  return v10;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[_UIOShowAlertAction_TestingOnly info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  -[_UIOShowAlertAction_TestingOnly info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPermitted
{
  return os_variant_has_internal_diagnostics();
}

- (void)performActionFromConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayDelegateForAction:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOShowAlertAction_TestingOnly title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOShowAlertAction_TestingOnly message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63___UIOShowAlertAction_TestingOnly_performActionFromConnection___block_invoke;
  v12[3] = &unk_1E16B3EC8;
  v13 = v9;
  v10 = v9;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v11);

  objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
