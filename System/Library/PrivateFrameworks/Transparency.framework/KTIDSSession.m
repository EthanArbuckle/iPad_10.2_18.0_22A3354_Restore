@implementation KTIDSSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[KTIDSSession state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDSSession peerHandle](self, "peerHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDSSession peerAccountIdentity](self, "peerAccountIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicAccountIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDSSession sasCode](self, "sasCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = -[KTIDSSession peerDisconnected](self, "peerDisconnected");
  v11 = CFSTR("connected");
  if (v10)
    v11 = CFSTR("disconnected");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KTIDSSession: state: %@ handle: %@ peerIdentity: %@ sasCode: %@ %@>"), v4, v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (KTIDSSession)init
{
  KTIDSSession *v2;
  id v3;
  void *v4;
  KTIDSSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KTIDSSession;
  v2 = -[KTIDSSession init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 16));
    if (SecRandomCopyBytes(0, 0x10uLL, (void *)objc_msgSend(v3, "mutableBytes")))
      abort();
    objc_msgSend(v3, "kt_hexString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDSSession setSessionID:](v2, "setSessionID:", v4);

    -[KTIDSSession setState:](v2, "setState:", kTransparencyStaticKeyStateInit);
    v5 = v2;

  }
  return v2;
}

- (BOOL)markAsVerified:(id *)a3
{
  void *v5;
  id v6;
  BOOL v7;
  void *v8;

  -[KTIDSSession contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[KTIDSSession contactIdentifier](self, "contactIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[KTIDSSession markContactAsVerified:error:](self, "markContactAsVerified:error:", v6, a3);
  }
  else
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorDecode"), -297, CFSTR("Static key have not contact identifier, can't mark as verified"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (a3)
    {
      v6 = objc_retainAutorelease(v8);
      v7 = 0;
      *a3 = v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)markContactAsVerified:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  if (v6)
  {
    -[KTIDSSession state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", kTransparencyStaticKeyStateCodeAvailable) & 1) != 0)
    {
      -[KTIDSSession sasCode](self, "sasCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = 1;
        goto LABEL_11;
      }
    }
    else
    {

    }
    v10 = CFSTR("Static key exchange not complete, can't mark as verified");
    v11 = -295;
  }
  else
  {
    v10 = CFSTR("Static key have not contact identifier, can't mark as verified");
    v11 = -297;
  }
  +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorDecode"), v11, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    *a4 = v12;
  }

  v9 = 0;
LABEL_11:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[KTIDSSession state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("state"));

  -[KTIDSSession sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("sessionID"));

  -[KTIDSSession sessionExpire](self, "sessionExpire");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTIDSSession sessionExpire](self, "sessionExpire");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("sessionExpire"));

  }
  -[KTIDSSession peerHandle](self, "peerHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[KTIDSSession peerHandle](self, "peerHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("peerHandle"));

  }
  -[KTIDSSession contactIdentifier](self, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[KTIDSSession contactIdentifier](self, "contactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("contactIdentifier"));

  }
  -[KTIDSSession peerAccountIdentity](self, "peerAccountIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[KTIDSSession peerAccountIdentity](self, "peerAccountIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("peerAccountIdentity"));

  }
  -[KTIDSSession sasCode](self, "sasCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[KTIDSSession sasCode](self, "sasCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("sasCode"));

  }
  objc_msgSend(v16, "encodeBool:forKey:", -[KTIDSSession peerDisconnected](self, "peerDisconnected"), CFSTR("disconnected"));

}

- (KTIDSSession)initWithCoder:(id)a3
{
  id v4;
  KTIDSSession *v5;
  void *v6;
  void *v7;
  KTIDSSession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KTIDSSession;
  v5 = -[KTIDSSession init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDSSession setState:](v5, "setState:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDSSession setSessionID:](v5, "setSessionID:", v7);

  -[KTIDSSession state](v5, "state");
  v8 = (KTIDSSession *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[KTIDSSession sessionID](v5, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionExpire"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTIDSSession setSessionExpire:](v5, "setSessionExpire:", v10);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerHandle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTIDSSession setPeerHandle:](v5, "setPeerHandle:", v11);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerAccountIdentity"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTIDSSession setPeerAccountIdentity:](v5, "setPeerAccountIdentity:", v12);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sasCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTIDSSession setSasCode:](v5, "setSasCode:", v13);

      -[KTIDSSession setPeerDisconnected:](v5, "setPeerDisconnected:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disconnected")));
      v8 = v5;
      goto LABEL_6;
    }
LABEL_5:
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (NSData)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDSSession sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionID"));

  -[KTIDSSession state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("state"));

  -[KTIDSSession sessionExpire](self, "sessionExpire");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("expire"));

  -[KTIDSSession peerHandle](self, "peerHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("peerHandle"));

  -[KTIDSSession contactIdentifier](self, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contactIdentifier"));

  -[KTIDSSession peerAccountIdentity](self, "peerAccountIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publicAccountIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("peerAccountIdentity"));

  -[KTIDSSession sasCode](self, "sasCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sasCode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTIDSSession peerDisconnected](self, "peerDisconnected"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("disconnected"));

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v13;
}

- (NSDate)sessionExpire
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSessionExpire:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)peerHandle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)sasCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSasCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)expectedPeerHandles
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExpectedPeerHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)peerDisconnected
{
  return self->_peerDisconnected;
}

- (void)setPeerDisconnected:(BOOL)a3
{
  self->_peerDisconnected = a3;
}

- (KTAccountPublicID)peerAccountIdentity
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeerAccountIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerAccountIdentity, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_expectedPeerHandles, 0);
  objc_storeStrong((id *)&self->sasCode, 0);
  objc_storeStrong((id *)&self->state, 0);
  objc_storeStrong((id *)&self->peerHandle, 0);
  objc_storeStrong((id *)&self->sessionID, 0);
  objc_storeStrong((id *)&self->sessionExpire, 0);
}

@end
