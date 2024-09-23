@implementation SDBLEIdentifiedDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_btAddr, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
}

- (RPIdentity)identity
{
  return self->_identity;
}

- (NSData)btAddr
{
  return self->_btAddr;
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (void)setLastUpdateTicks:(unint64_t)a3
{
  self->_lastUpdateTicks = a3;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (unint64_t)lastUpdateTicks
{
  return self->_lastUpdateTicks;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setBtAddr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

@end
