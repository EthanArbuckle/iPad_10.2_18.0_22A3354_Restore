@implementation SDSession

- (id)description
{
  id v3;
  void *v4;
  NSUUID *identifier;
  id v6;
  NSUUID *peerIdentifier;
  id v8;
  SFSession *clientSession;
  id v10;
  const char *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v20 = 0;
  NSAppendPrintF(&v20, "SDSession %{ptr}", self);
  v3 = v20;
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    v19 = v3;
    NSAppendPrintF(&v19, ", ID %@", identifier);
    v6 = v19;

    v4 = v6;
  }
  peerIdentifier = self->_peerIdentifier;
  if (peerIdentifier)
  {
    v18 = v4;
    NSAppendPrintF(&v18, ", Peer %@", peerIdentifier);
    v8 = v18;

    v4 = v8;
  }
  clientSession = self->_clientSession;
  if (clientSession)
  {
    v17 = v4;
    NSAppendPrintF(&v17, ", %@", clientSession);
    v10 = v17;

    v4 = v10;
  }
  v16 = v4;
  if (self->_sessionCreated)
    v11 = "yes";
  else
    v11 = "no";
  NSAppendPrintF(&v16, ", SessionCreated %s", v11);
  v12 = v16;

  if (-[NSMutableArray count](self->_sendDataQueue, "count"))
  {
    v15 = v12;
    NSAppendPrintF(&v15, ", %ld pending sends", -[NSMutableArray count](self->_sendDataQueue, "count"));
    v13 = v15;

    v12 = v13;
  }
  return v12;
}

- (SFSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
  objc_storeStrong((id *)&self->_clientSession, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)dhSecretKey
{
  return self->_dhSecretKey;
}

- (void)setDhSecretKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)readKey
{
  return self->_readKey;
}

- (void)setReadKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)readNonce
{
  return self->_readNonce;
}

- (void)setReadNonce:(unint64_t)a3
{
  self->_readNonce = a3;
}

- (NSData)writeKey
{
  return self->_writeKey;
}

- (void)setWriteKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)writeNonce
{
  return self->_writeNonce;
}

- (void)setWriteNonce:(unint64_t)a3
{
  self->_writeNonce = a3;
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableArray)sendDataQueue
{
  return self->_sendDataQueue;
}

- (void)setSendDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sendDataQueue, a3);
}

- (BOOL)sessionCreated
{
  return self->_sessionCreated;
}

- (void)setSessionCreated:(BOOL)a3
{
  self->_sessionCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDataQueue, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_writeKey, 0);
  objc_storeStrong((id *)&self->_readKey, 0);
  objc_storeStrong((id *)&self->_dhSecretKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
}

@end
