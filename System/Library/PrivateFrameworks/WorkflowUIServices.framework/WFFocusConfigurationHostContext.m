@implementation WFFocusConfigurationHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549B0880);
}

+ (id)_allowedErrorClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
}

+ (id)_allowedItemPayloadClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (void)configurationUIStateDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFFocusConfigurationHostContext focusConfigurationDelegate](self, "focusConfigurationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusConfigurationHostContext:configurationUIStateDidChange:", self, v4);

}

- (void)didPressButtonWithIdentifier:(id)a3 cellFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[WFFocusConfigurationHostContext focusConfigurationDelegate](self, "focusConfigurationDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "focusConfigurationHostContext:didPressButtonWithIdentifier:cellFrame:", self, v9, x, y, width, height);

}

- (WFFocusConfigurationHostContextDelegate)focusConfigurationDelegate
{
  return (WFFocusConfigurationHostContextDelegate *)objc_loadWeakRetained((id *)&self->_focusConfigurationDelegate);
}

- (void)setFocusConfigurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusConfigurationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusConfigurationDelegate);
}

@end
