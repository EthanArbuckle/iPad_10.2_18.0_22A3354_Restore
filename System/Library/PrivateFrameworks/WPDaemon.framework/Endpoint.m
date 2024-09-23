@implementation Endpoint

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Endpoint: ack? %d enc? %d client %@"), self->_requireAck, self->_requireEncyption, self->_clientUUID);
}

- (unsigned)requireAck
{
  return self->_requireAck;
}

- (void)setRequireAck:(unsigned __int8)a3
{
  self->_requireAck = a3;
}

- (BOOL)requireEncyption
{
  return self->_requireEncyption;
}

- (void)setRequireEncyption:(BOOL)a3
{
  self->_requireEncyption = a3;
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUUID, 0);
}

@end
