@implementation WFCatalystContentHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558B9D48);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558B88A0);
}

+ (id)_allowedItemPayloadClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
}

- (void)actionInterfaceListenerDidBecomeActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFCatalystContentHostContext handler](self, "handler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionInterfaceListenerDidBecomeActive:", v4);

}

- (WFCatalystContentHost)handler
{
  return (WFCatalystContentHost *)objc_loadWeakRetained((id *)&self->_handler);
}

- (void)setHandler:(id)a3
{
  objc_storeWeak((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
}

@end
