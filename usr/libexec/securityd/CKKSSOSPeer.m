@implementation CKKSSOSPeer

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

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer peerID](self, "peerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyData"));
  v7 = objc_msgSend(v6, "length");

  if ((unint64_t)v7 >= 0x10)
    v8 = 16;
  else
    v8 = (uint64_t)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", 0, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicSigningKey](self, "publicSigningKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicSigningKey](self, "publicSigningKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyData"));
  v14 = objc_msgSend(v13, "length");

  if ((unint64_t)v14 >= 0x10)
    v15 = 16;
  else
    v15 = (uint64_t)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", 0, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer viewList](self, "viewList"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSSOSPeer(%@): pubEnc:%@ pubSign:%@ views:%d>"), v20, v9, v16, objc_msgSend(v17, "count")));

  return (NSString *)v18;
}

- (CKKSSOSPeer)initWithSOSPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKKSSOSPeer *v14;
  NSString *v15;
  NSString *spid;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSSOSPeer;
  v14 = -[CKKSSOSPeer init](&v18, "init");
  if (v14)
  {
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("spid-")))
      v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("spid-"), "length")));
    else
      v15 = (NSString *)v10;
    spid = v14->_spid;
    v14->_spid = v15;

    objc_storeStrong((id *)&v14->_publicEncryptionKey, a4);
    objc_storeStrong((id *)&v14->_publicSigningKey, a5);
    objc_storeStrong((id *)&v14->_viewList, a6);
  }

  return v14;
}

- (NSString)peerID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer spid](self, "spid"));
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer peerID](self, "peerID"));
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer peerID](self, "peerID"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer viewList](self, "viewList"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer spid](self, "spid"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("spid"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodeSubjectPublicKeyInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("encryptionKey"));

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicSigningKey](self, "publicSigningKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "encodeSubjectPublicKeyInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("signingKey"));

}

- (CKKSSOSPeer)initWithCoder:(id)a3
{
  id v4;
  CKKSSOSPeer *v5;
  id v6;
  uint64_t v7;
  NSString *spid;
  id v9;
  void *v10;
  uint64_t v11;
  _SFECPublicKey *publicEncryptionKey;
  id v13;
  void *v14;
  uint64_t v15;
  _SFECPublicKey *publicSigningKey;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKKSSOSPeer;
  v5 = -[CKKSSOSPeer init](&v18, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("spid"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    spid = v5->_spid;
    v5->_spid = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("encryptionKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[_SFECPublicKey keyWithSubjectPublicKeyInfo:](_SFECPublicKey, "keyWithSubjectPublicKeyInfo:", v10));
      publicEncryptionKey = v5->_publicEncryptionKey;
      v5->_publicEncryptionKey = (_SFECPublicKey *)v11;

    }
    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("signingKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[_SFECPublicKey keyWithSubjectPublicKeyInfo:](_SFECPublicKey, "keyWithSubjectPublicKeyInfo:", v14));
      publicSigningKey = v5->_publicSigningKey;
      v5->_publicSigningKey = (_SFECPublicKey *)v15;

    }
  }

  return v5;
}

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 8, 1);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)spid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSpid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setViewList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_spid, 0);
  objc_storeStrong((id *)&self->_publicSigningKey, 0);
  objc_storeStrong((id *)&self->_publicEncryptionKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
