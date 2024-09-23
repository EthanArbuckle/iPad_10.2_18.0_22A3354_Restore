@implementation SFTouchRemoteAccountServicesHandlerConfiguration

- (SFTouchRemoteAccountServicesHandlerConfiguration)init
{
  SFTouchRemoteAccountServicesHandlerConfiguration *v2;
  SFTouchRemoteAccountServicesHandlerConfiguration *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSSet *supportedTRAccountServices;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFTouchRemoteAccountServicesHandlerConfiguration;
  v2 = -[SFTouchRemoteAccountServicesHandlerConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E48917B0);
    v6 = objc_claimAutoreleasedReturnValue();
    supportedTRAccountServices = v3->_supportedTRAccountServices;
    v3->_supportedTRAccountServices = (NSSet *)v6;

    *(_DWORD *)&v3->_isPrimaryAppleAccount = 16842753;
    v3->_isHomeSharingSetupNeeded = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SFTouchRemoteAccountServicesHandlerConfiguration *v4;
  uint64_t v5;
  NSSet *supportedTRAccountServices;

  v4 = objc_alloc_init(SFTouchRemoteAccountServicesHandlerConfiguration);
  objc_storeStrong((id *)&v4->_dispatchQueue, self->_dispatchQueue);
  v5 = -[NSSet copy](self->_supportedTRAccountServices, "copy");
  supportedTRAccountServices = v4->_supportedTRAccountServices;
  v4->_supportedTRAccountServices = (NSSet *)v5;

  v4->_isPrimaryAppleAccount = self->_isPrimaryAppleAccount;
  v4->_shouldActivateStoreAccount = self->_shouldActivateStoreAccount;
  v4->_shouldSuppressStoreSignInDialogs = self->_shouldSuppressStoreSignInDialogs;
  v4->_shouldIgnoreStoreAccountConversion = self->_shouldIgnoreStoreAccountConversion;
  v4->_isHomeSharingSetupNeeded = self->_isHomeSharingSetupNeeded;
  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSSet)supportedTRAccountServices
{
  return self->_supportedTRAccountServices;
}

- (void)setSupportedTRAccountServices:(id)a3
{
  objc_storeStrong((id *)&self->_supportedTRAccountServices, a3);
}

- (BOOL)isPrimaryAppleAccount
{
  return self->_isPrimaryAppleAccount;
}

- (void)setIsPrimaryAppleAccount:(BOOL)a3
{
  self->_isPrimaryAppleAccount = a3;
}

- (BOOL)shouldActivateStoreAccount
{
  return self->_shouldActivateStoreAccount;
}

- (void)setShouldActivateStoreAccount:(BOOL)a3
{
  self->_shouldActivateStoreAccount = a3;
}

- (BOOL)shouldSuppressStoreSignInDialogs
{
  return self->_shouldSuppressStoreSignInDialogs;
}

- (void)setShouldSuppressStoreSignInDialogs:(BOOL)a3
{
  self->_shouldSuppressStoreSignInDialogs = a3;
}

- (BOOL)shouldIgnoreStoreAccountConversion
{
  return self->_shouldIgnoreStoreAccountConversion;
}

- (void)setShouldIgnoreStoreAccountConversion:(BOOL)a3
{
  self->_shouldIgnoreStoreAccountConversion = a3;
}

- (BOOL)isHomeSharingSetupNeeded
{
  return self->_isHomeSharingSetupNeeded;
}

- (void)setIsHomeSharingSetupNeeded:(BOOL)a3
{
  self->_isHomeSharingSetupNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTRAccountServices, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
