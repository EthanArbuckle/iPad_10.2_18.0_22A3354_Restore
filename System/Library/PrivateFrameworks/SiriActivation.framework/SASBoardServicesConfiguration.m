@implementation SASBoardServicesConfiguration

- (id)_init
{
  SASBoardServicesConfiguration *v2;
  SASBoardServicesConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASBoardServicesConfiguration;
  v2 = -[SASBoardServicesConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SASBoardServicesConfiguration setMachServiceIdentifier:](v2, "setMachServiceIdentifier:", CFSTR("com.apple.siri.activation.service"));
    -[SASBoardServicesConfiguration setPresentationDomain:](v3, "setPresentationDomain:", CFSTR("com.apple.siri.activation"));
    -[SASBoardServicesConfiguration setPresentationIdentifier:](v3, "setPresentationIdentifier:", CFSTR("com.apple.siri.activation.presentation"));
    -[SASBoardServicesConfiguration setSignalDomain:](v3, "setSignalDomain:", CFSTR("com.apple.siri.activation"));
    -[SASBoardServicesConfiguration setSignalIdentifier:](v3, "setSignalIdentifier:", CFSTR("com.apple.siri.activation.signal"));
  }
  return v3;
}

- (SASBoardServicesConfiguration)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)configuration
{
  if (configuration_onceToken != -1)
    dispatch_once(&configuration_onceToken, &__block_literal_global_4);
  return (id)configuration_sharedConfiguration;
}

void __46__SASBoardServicesConfiguration_configuration__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SASBoardServicesConfiguration _init]([SASBoardServicesConfiguration alloc], "_init");
  v1 = (void *)configuration_sharedConfiguration;
  configuration_sharedConfiguration = (uint64_t)v0;

}

- (id)domainForService:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    -[SASBoardServicesConfiguration signalDomain](self, "signalDomain");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[SASBoardServicesConfiguration presentationDomain](self, "presentationDomain");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)identifierForService:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    -[SASBoardServicesConfiguration signalIdentifier](self, "signalIdentifier");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[SASBoardServicesConfiguration presentationIdentifier](self, "presentationIdentifier");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (NSString)machServiceIdentifier
{
  return self->_machServiceIdentifier;
}

- (void)setMachServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_machServiceIdentifier, a3);
}

- (NSString)presentationDomain
{
  return self->_presentationDomain;
}

- (void)setPresentationDomain:(id)a3
{
  objc_storeStrong((id *)&self->_presentationDomain, a3);
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationIdentifier, a3);
}

- (NSString)signalDomain
{
  return self->_signalDomain;
}

- (void)setSignalDomain:(id)a3
{
  objc_storeStrong((id *)&self->_signalDomain, a3);
}

- (NSString)signalIdentifier
{
  return self->_signalIdentifier;
}

- (void)setSignalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_signalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalDomain, 0);
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationDomain, 0);
  objc_storeStrong((id *)&self->_machServiceIdentifier, 0);
}

@end
