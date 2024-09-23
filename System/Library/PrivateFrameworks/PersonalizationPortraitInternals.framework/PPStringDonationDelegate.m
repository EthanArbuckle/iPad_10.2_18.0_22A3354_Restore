@implementation PPStringDonationDelegate

- (PPStringDonationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPStringDonationDelegate;
  return -[PPStringDonationDelegate init](&v3, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v5 = a4;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1EF8F2FF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v5, CFSTR("com.apple.suggestd.PersonalizationPortrait.StringDonation"), v6, 0, v7, &__block_literal_global_19053, 0, &__block_literal_global_43_19058, &__block_literal_global_44_19059);

  return v8;
}

BOOL __63__PPStringDonationDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (+[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite"), v2, CFSTR("com.apple.suggestd.PersonalizationPortrait.StringDonation")))
  {
    v3 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readWrite"), v2, CFSTR("com.apple.suggestd.PersonalizationPortrait.StringDonation"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
