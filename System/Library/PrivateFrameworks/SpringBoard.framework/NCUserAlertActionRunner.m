@implementation NCUserAlertActionRunner

- (NCUserAlertActionRunner)initWithSBAlertItem:(id)a3
{
  id v4;
  NCUserAlertActionRunner *v5;
  NCUserAlertActionRunner *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCUserAlertActionRunner;
  v5 = -[NCUserAlertActionRunner init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_alertItem, v4);

  return v6;
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

- (SBAlertItem)alertItem
{
  return (SBAlertItem *)objc_loadWeakRetained((id *)&self->_alertItem);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertItem);
}

@end
