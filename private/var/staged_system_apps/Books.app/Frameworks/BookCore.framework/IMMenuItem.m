@implementation IMMenuItem

+ (id)menuItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:target:action:", v9, v8, a5);

  return v10;
}

+ (id)menuItemWithTitle:(id)a3 actionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:actionBlock:", v7, v6);

  return v8;
}

- (IMMenuItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  IMMenuItem *v10;
  NSString *v11;
  NSString *title;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMenuItem;
  v10 = -[IMMenuItem init](&v14, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = v11;

    objc_storeWeak(&v10->_target, v9);
    v10->_action = a5;
  }

  return v10;
}

- (IMMenuItem)initWithTitle:(id)a3 actionBlock:(id)a4
{
  id v6;
  id v7;
  IMMenuItem *v8;
  NSString *v9;
  NSString *title;
  id v11;
  id actionBlock;

  v6 = a3;
  v7 = a4;
  v8 = -[IMMenuItem init](self, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = v9;

    v11 = objc_msgSend(v7, "copy");
    actionBlock = v8->_actionBlock;
    v8->_actionBlock = v11;

  }
  return v8;
}

- (void)dealloc
{
  id actionBlock;
  objc_super v4;

  actionBlock = self->_actionBlock;
  self->_actionBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMMenuItem;
  -[IMMenuItem dealloc](&v4, "dealloc");
}

- (void)performActionBlock:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuItem actionBlock](self, "actionBlock", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[IMMenuItem actionBlock](self, "actionBlock"));
    v5[2]();

  }
}

- (NSString)title
{
  return self->_title;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
