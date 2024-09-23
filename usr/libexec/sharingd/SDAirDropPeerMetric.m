@implementation SDAirDropPeerMetric

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)bluetoothDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBluetoothDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)bonjourPTRDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBonjourPTRDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)bonjourTXTRecordDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBonjourTXTRecordDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)bonjourResolveComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBonjourResolveComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)tcpConnectionComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTcpConnectionComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)tlsHandshakeComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTlsHandshakeComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)identityQueryComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdentityQueryComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)totalDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTotalDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)verifiableIdentity
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setVerifiableIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiableIdentity, 0);
  objc_storeStrong((id *)&self->_totalDiscovery, 0);
  objc_storeStrong((id *)&self->_identityQueryComplete, 0);
  objc_storeStrong((id *)&self->_tlsHandshakeComplete, 0);
  objc_storeStrong((id *)&self->_tcpConnectionComplete, 0);
  objc_storeStrong((id *)&self->_bonjourResolveComplete, 0);
  objc_storeStrong((id *)&self->_bonjourTXTRecordDiscovery, 0);
  objc_storeStrong((id *)&self->_bonjourPTRDiscovery, 0);
  objc_storeStrong((id *)&self->_bluetoothDiscovery, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
