@implementation MTSettingHeaderAction

+ (MTSettingHeaderAction)headerActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:actionHandler:", v7, v6);

  return (MTSettingHeaderAction *)v8;
}

- (MTSettingHeaderAction)initWithTitle:(id)a3 actionHandler:(id)a4
{
  id v7;
  id v8;
  MTSettingHeaderAction *v9;
  MTSettingHeaderAction *v10;
  id v11;
  id actionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTSettingHeaderAction;
  v9 = -[MTSettingHeaderAction init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    v11 = objc_retainBlock(v8);
    actionHandler = v10->_actionHandler;
    v10->_actionHandler = v11;

  }
  return v10;
}

- (void)performAction
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingHeaderAction actionHandler](self, "actionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTSettingHeaderAction actionHandler](self, "actionHandler"));
    v4[2]();

  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
