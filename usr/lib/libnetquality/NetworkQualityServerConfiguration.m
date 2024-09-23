@implementation NetworkQualityServerConfiguration

- (NetworkQualityServerConfiguration)init
{
  NetworkQualityServerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NetworkQualityServerConfiguration;
  result = -[NetworkQualityServerConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_httpProtocol = 0xFFFFFFFF00000000;
    result->_idleTimeoutSeconds = 5;
    *(_WORD *)&result->_tlsEnabled = 257;
    result->_mirrorServerIP = 0;
  }
  return result;
}

+ (unsigned)defaultIdleTimeout
{
  return 5;
}

- (unsigned)httpProtocol
{
  return self->_httpProtocol;
}

- (void)setHttpProtocol:(unsigned int)a3
{
  self->_httpProtocol = a3;
}

- (int)listenPort
{
  return self->_listenPort;
}

- (void)setListenPort:(int)a3
{
  self->_listenPort = a3;
}

- (unsigned)idleTimeoutSeconds
{
  return self->_idleTimeoutSeconds;
}

- (void)setIdleTimeoutSeconds:(unsigned int)a3
{
  self->_idleTimeoutSeconds = a3;
}

- (BOOL)tlsEnabled
{
  return self->_tlsEnabled;
}

- (void)setTlsEnabled:(BOOL)a3
{
  self->_tlsEnabled = a3;
}

- (BOOL)bonjourEnabled
{
  return self->_bonjourEnabled;
}

- (void)setBonjourEnabled:(BOOL)a3
{
  self->_bonjourEnabled = a3;
}

- (BOOL)mirrorServerIP
{
  return self->_mirrorServerIP;
}

- (void)setMirrorServerIP:(BOOL)a3
{
  self->_mirrorServerIP = a3;
}

@end
