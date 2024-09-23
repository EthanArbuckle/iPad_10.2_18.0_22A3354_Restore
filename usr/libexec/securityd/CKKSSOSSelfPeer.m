@implementation CKKSSOSSelfPeer

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer peerID](self, "peerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyData"));
  v7 = objc_msgSend(v6, "length");

  if ((unint64_t)v7 >= 0x10)
    v8 = 16;
  else
    v8 = (uint64_t)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", 0, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicSigningKey](self, "publicSigningKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicSigningKey](self, "publicSigningKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyData"));
  v14 = objc_msgSend(v13, "length");

  if ((unint64_t)v14 >= 0x10)
    v15 = 16;
  else
    v15 = (uint64_t)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", 0, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer viewList](self, "viewList"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSSOSSelfPeer(%@): pubEnc:%@ pubSign:%@ views:%d>"), v20, v9, v16, objc_msgSend(v17, "count")));

  return (NSString *)v18;
}

- (CKKSSOSSelfPeer)initWithSOSPeerID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 viewList:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKKSSOSSelfPeer *v14;
  NSString *v15;
  NSString *spid;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSSOSSelfPeer;
  v14 = -[CKKSSOSSelfPeer init](&v18, "init");
  if (v14)
  {
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("spid-")))
      v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("spid-"), "length")));
    else
      v15 = (NSString *)v10;
    spid = v14->_spid;
    v14->_spid = v15;

    objc_storeStrong((id *)&v14->_encryptionKey, a4);
    objc_storeStrong((id *)&v14->_signingKey, a5);
    objc_storeStrong((id *)&v14->_viewList, a6);
  }

  return v14;
}

- (_SFECPublicKey)publicEncryptionKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer encryptionKey](self, "encryptionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publicKey"));

  return (_SFECPublicKey *)v3;
}

- (_SFECPublicKey)publicSigningKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer signingKey](self, "signingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publicKey"));

  return (_SFECPublicKey *)v3;
}

- (NSString)peerID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer spid](self, "spid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("spid-"), v2));

  return (NSString *)v3;
}

- (BOOL)matchesPeer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer peerID](self, "peerID"));
  if (!v6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer peerID](self, "peerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (BOOL)shouldHaveView:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer viewList](self, "viewList"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (_SFECKeyPair)encryptionKey
{
  return (_SFECKeyPair *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_SFECKeyPair)signingKey
{
  return (_SFECKeyPair *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSigningKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)spid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSpid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spid, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_viewList, 0);
}

@end
