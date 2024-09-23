@implementation _UIClientToHostGestureChangeAction

- (_UIClientToHostGestureChangeAction)initWithHostGestureIdentifier:(id)a3 changeToState:(int64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _UIClientToHostGestureChangeAction *v10;

  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setObject:forSetting:", v7, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  v10 = -[_UIClientToHostGestureChangeAction initWithInfo:responder:](self, "initWithInfo:responder:", v8, 0);
  return v10;
}

- (NSString)hostGestureIdentifier
{
  void *v2;
  void *v3;

  -[_UIClientToHostGestureChangeAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)state
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIClientToHostGestureChangeAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)UIActionType
{
  return 55;
}

- (void)dispatchToHostGestureRecognizer
{
  int64_t v3;
  id v4;

  v3 = -[_UIClientToHostGestureChangeAction state](self, "state");
  -[_UIClientToHostGestureChangeAction hostGestureIdentifier](self, "hostGestureIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIClientToHostRelationshipGestureInteraction dispatchGestureRecognizerStateChange:toHostGestureWithIdentifier:](_UIClientToHostRelationshipGestureInteraction, "dispatchGestureRecognizerStateChange:toHostGestureWithIdentifier:", v3, v4);

}

@end
