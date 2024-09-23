@implementation WBSKeyBagLockStatusChangedHandlerToken

- (WBSKeyBagLockStatusChangedHandlerToken)initWithHandler:(id)a3
{
  id v4;
  WBSKeyBagLockStatusChangedHandlerToken *v5;
  void *v6;
  id handler;
  WBSKeyBagLockStatusChangedHandlerToken *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSKeyBagLockStatusChangedHandlerToken;
  v5 = -[WBSKeyBagLockStatusChangedHandlerToken init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    handler = v5->_handler;
    v5->_handler = v6;

    v8 = v5;
  }

  return v5;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
