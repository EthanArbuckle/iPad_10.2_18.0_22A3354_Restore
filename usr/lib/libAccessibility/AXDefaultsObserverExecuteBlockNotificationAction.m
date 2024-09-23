@implementation AXDefaultsObserverExecuteBlockNotificationAction

- (AXDefaultsObserverExecuteBlockNotificationAction)initWithBlock:(id)a3
{
  id v4;
  AXDefaultsObserverExecuteBlockNotificationAction *v5;
  AXDefaultsObserverExecuteBlockNotificationAction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXDefaultsObserverExecuteBlockNotificationAction;
  v5 = -[AXDefaultsObserverExecuteBlockNotificationAction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AXDefaultsObserverExecuteBlockNotificationAction setBlock:](v5, "setBlock:", v4);

  return v6;
}

- (void)performForChangedDefault:(id)a3
{
  id v3;

  -[AXDefaultsObserverExecuteBlockNotificationAction block](self, "block", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
