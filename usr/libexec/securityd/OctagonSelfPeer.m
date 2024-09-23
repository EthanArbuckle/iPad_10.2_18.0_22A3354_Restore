@implementation OctagonSelfPeer

- (OctagonSelfPeer)initWithPeerID:(id)a3 signingIdentity:(id)a4 encryptionIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  OctagonSelfPeer *v12;
  OctagonSelfPeer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OctagonSelfPeer;
  v12 = -[OctagonSelfPeer init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peerID, a3);
    objc_storeStrong((id *)&v13->_signingIdentity, a4);
    objc_storeStrong((id *)&v13->_encryptionIdentity, a5);
  }

  return v13;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer peerID](self, "peerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonSelfPeer: %@>"), v2));

  return (NSString *)v3;
}

- (_SFECPublicKey)publicEncryptionKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer encryptionIdentity](self, "encryptionIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publicKey"));

  return (_SFECPublicKey *)v3;
}

- (_SFECPublicKey)publicSigningKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer signingIdentity](self, "signingIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publicKey"));

  return (_SFECPublicKey *)v3;
}

- (_SFECKeyPair)encryptionKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer encryptionIdentity](self, "encryptionIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyPair"));

  return (_SFECKeyPair *)v3;
}

- (_SFECKeyPair)signingKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer signingIdentity](self, "signingIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyPair"));

  return (_SFECKeyPair *)v3;
}

- (BOOL)matchesPeer:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerID"));
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer peerID](self, "peerID"));
  v6 = v5 | v4;

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonSelfPeer peerID](self, "peerID"));
    v7 = objc_msgSend(v8, "isEqualToString:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (_SFIdentity)encryptionIdentity
{
  return (_SFIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEncryptionIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_SFIdentity)signingIdentity
{
  return (_SFIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSigningIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_encryptionIdentity, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
}

@end
