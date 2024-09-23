@implementation _UIKeyCommandInvocation

- (_UIKeyCommandInvocation)initWithKeyCommand:(id)a3 triggeringEvent:(id)a4 target:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIKeyCommandInvocation *v12;
  _UIKeyCommandInvocation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIKeyCommandInvocation;
  v12 = -[_UIKeyCommandInvocation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyCommand, a3);
    objc_storeStrong((id *)&v13->_triggeringEvent, a4);
    objc_storeWeak(&v13->_target, v11);
  }

  return v13;
}

- (UIKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (UIPhysicalKeyboardEvent)triggeringEvent
{
  return self->_triggeringEvent;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_triggeringEvent, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
}

@end
