@implementation DMDFetchDeclarationCapabilitiesOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchDeclarationCapabilitiesRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2C40;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDFetchDeclarationCapabilitiesOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

- (unint64_t)queueGroup
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_opt_new(DMFFetchDeclarationCapabilitiesResultObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedCommandTypes](DMDConfigurationCapabilities, "supportedCommandTypes"));
  objc_msgSend(v11, "setSupportedCommands:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedAssetTypes](DMDConfigurationCapabilities, "supportedAssetTypes"));
  objc_msgSend(v11, "setSupportedAssets:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedConfigurationTypes](DMDConfigurationCapabilities, "supportedConfigurationTypes"));
  objc_msgSend(v11, "setSupportedConfigurations:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedEventTypes](DMDConfigurationCapabilities, "supportedEventTypes"));
  objc_msgSend(v11, "setSupportedEvents:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedActivationTypes](DMDConfigurationCapabilities, "supportedActivationTypes"));
  objc_msgSend(v11, "setSupportedActivations:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedPredicateTypes](DMDConfigurationCapabilities, "supportedPredicateTypes"));
  objc_msgSend(v11, "setSupportedPredicates:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationCapabilities supportedMessageTypes](DMDConfigurationCapabilities, "supportedMessageTypes"));
  objc_msgSend(v11, "setSupportedMessages:", v10);

  -[DMDFetchDeclarationCapabilitiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);
}

@end
