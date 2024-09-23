@implementation _UISceneDisplayLinkTargetAndAction

- (_UISceneDisplayLinkTargetAndAction)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  _UISceneDisplayLinkTargetAndAction *v7;
  _UISceneDisplayLinkTargetAndAction *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISceneDisplayLinkTargetAndAction;
  v7 = -[_UISceneDisplayLinkTargetAndAction init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_action = a4;
  }

  return v8;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
