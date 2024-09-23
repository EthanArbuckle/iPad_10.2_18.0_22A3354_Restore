@implementation TrustedPeersHelperPeer

- (TrustedPeersHelperPeer)initWithPeerID:(id)a3 signingSPKI:(id)a4 encryptionSPKI:(id)a5 secureElementIdentity:(id)a6 viewList:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TrustedPeersHelperPeer *v17;
  TrustedPeersHelperPeer *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TrustedPeersHelperPeer;
  v17 = -[TrustedPeersHelperPeer init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerID, a3);
    objc_storeStrong((id *)&v18->_signingSPKI, a4);
    objc_storeStrong((id *)&v18->_encryptionSPKI, a5);
    objc_storeStrong((id *)&v18->_secureElementIdentity, a6);
    objc_storeStrong((id *)&v18->_viewList, a7);
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer peerID](self, "peerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer signingSPKI](self, "signingSPKI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer encryptionSPKI](self, "encryptionSPKI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer secureElementIdentity](self, "secureElementIdentity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64EncodedStringWithOptions:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer viewList](self, "viewList"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TPHPeer: %@ %@ %@ se:%@ (%lu views)>"), v3, v4, v5, v8, objc_msgSend(v9, "count")));

  return v10;
}

- (TrustedPeersHelperPeer)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperPeer *v5;
  id v6;
  uint64_t v7;
  NSString *peerID;
  id v9;
  uint64_t v10;
  NSData *signingSPKI;
  id v12;
  uint64_t v13;
  NSData *encryptionSPKI;
  id v15;
  uint64_t v16;
  TPPBSecureElementIdentity *secureElementIdentity;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *viewList;
  objc_super v23;
  _QWORD v24[2];

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TrustedPeersHelperPeer;
  v5 = -[TrustedPeersHelperPeer init](&v23, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("peerID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("signingSPKI"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    signingSPKI = v5->_signingSPKI;
    v5->_signingSPKI = (NSData *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("encryptionSPKI"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    encryptionSPKI = v5->_encryptionSPKI;
    v5->_encryptionSPKI = (NSData *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(TPPBSecureElementIdentity), CFSTR("seIdentity"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    secureElementIdentity = v5->_secureElementIdentity;
    v5->_secureElementIdentity = (TPPBSecureElementIdentity *)v16;

    v24[0] = objc_opt_class(NSSet);
    v24[1] = objc_opt_class(NSString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("viewList")));
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v20;

  }
  return v5;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer peerID](self, "peerID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("peerID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer signingSPKI](self, "signingSPKI"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("signingSPKI"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer encryptionSPKI](self, "encryptionSPKI"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("encryptionSPKI"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer secureElementIdentity](self, "secureElementIdentity"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("seIdentity"));

  v9 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer viewList](self, "viewList"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("viewList"));

}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)signingSPKI
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSigningSPKI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)encryptionSPKI
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEncryptionSPKI:(id)a3
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

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return (TPPBSecureElementIdentity *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecureElementIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_encryptionSPKI, 0);
  objc_storeStrong((id *)&self->_signingSPKI, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
