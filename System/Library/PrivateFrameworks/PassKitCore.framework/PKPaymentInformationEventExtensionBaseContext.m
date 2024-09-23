@implementation PKPaymentInformationEventExtensionBaseContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_230 != -1)
    dispatch_once(&_MergedGlobals_230, &__block_literal_global_97);
  return (id)qword_1ECF22540;
}

void __80__PKPaymentInformationEventExtensionBaseContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE231D40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22540;
  qword_1ECF22540 = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECF22548 != -1)
    dispatch_once(&qword_1ECF22548, &__block_literal_global_1);
  return (id)qword_1ECF22550;
}

void __82__PKPaymentInformationEventExtensionBaseContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE231CC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22550;
  qword_1ECF22550 = v0;

}

- (id)remoteContext
{
  return -[PKPaymentInformationEventExtensionBaseContext remoteContextWithErrorHandler:](self, "remoteContextWithErrorHandler:", &__block_literal_global_9_0);
}

void __62__PKPaymentInformationEventExtensionBaseContext_remoteContext__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "error getting remote context for extension: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)remoteContextWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPaymentInformationEventExtensionBaseContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
