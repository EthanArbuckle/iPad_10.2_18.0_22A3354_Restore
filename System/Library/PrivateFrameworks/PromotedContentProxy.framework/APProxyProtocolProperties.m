@implementation APProxyProtocolProperties

- (void)setSessionDemultiplexerManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDemultiplexerManager, a3);
}

- (void)setProxyURLCredentialService:(id)a3
{
  objc_storeStrong((id *)&self->_proxyURLCredentialService, a3);
}

- (void)setProxySessionConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxySessionConfigurationProvider, a3);
}

- (APProxySessionConfigurationProvider)proxySessionConfigurationProvider
{
  return self->_proxySessionConfigurationProvider;
}

- (APNSURLSessionDemultiplexerManager)sessionDemultiplexerManager
{
  return self->_sessionDemultiplexerManager;
}

- (APProxyURLCredentialService)proxyURLCredentialService
{
  return self->_proxyURLCredentialService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyURLCredentialService, 0);
  objc_storeStrong((id *)&self->_sessionDemultiplexerManager, 0);
  objc_storeStrong((id *)&self->_proxySessionConfigurationProvider, 0);
}

@end
