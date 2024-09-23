@implementation FMDCommandHandlerAccessoryConfiguration

- (FMDCommandHandlerAccessoryConfiguration)initWithParams:(id)a3 supportedAccessoryRegistry:(id)a4
{
  id v6;
  FMDCommandHandlerAccessoryConfiguration *v7;
  FMDCommandHandlerAccessoryConfiguration *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMDCommandHandlerAccessoryConfiguration;
  v7 = -[FMDCommandHandler initWithParams:provider:](&v10, "initWithParams:provider:", a3, 0);
  v8 = v7;
  if (v7)
    -[FMDCommandHandlerAccessoryConfiguration setSupportedAccessoryRegistry:](v7, "setSupportedAccessoryRegistry:", v6);

  return v8;
}

- (void)handleCommand
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportedAccessories")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerAccessoryConfiguration supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  objc_msgSend(v4, "updateSupportedAccessories:completion:", v5, 0);

}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return (FMDSupportedAccessoryRegistry *)objc_loadWeakRetained((id *)&self->_supportedAccessoryRegistry);
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_supportedAccessoryRegistry, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_supportedAccessoryRegistry);
}

@end
