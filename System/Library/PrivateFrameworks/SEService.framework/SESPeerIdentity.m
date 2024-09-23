@implementation SESPeerIdentity

+ (id)withPeerIdentifier:(id)a3 peerData:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

+ (id)withOTPeerIdentity:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  objc_msgSend(v3, "peerIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  objc_msgSend(v3, "peerData");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (id)asOTPeerIdentity
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setPeerData:", self->_peerData);
  objc_msgSend(v3, "setPeerIdentifier:", self->_peerIdentifier);
  return v3;
}

- (NSData)peerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)peerData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerData, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
}

@end
