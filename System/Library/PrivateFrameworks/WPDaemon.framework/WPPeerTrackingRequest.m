@implementation WPPeerTrackingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WPPeerTrackingRequest)init
{
  WPPeerTrackingRequest *v2;
  WPPeerTrackingRequest *v3;
  NSDictionary *peerTrackingDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WPPeerTrackingRequest;
  v2 = -[WPPeerTrackingRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    peerTrackingDictionary = v2->_peerTrackingDictionary;
    v2->_peerTrackingDictionary = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v3->_clientType = 27;
  }
  return v3;
}

- (WPPeerTrackingRequest)initWithCoder:(id)a3
{
  id v4;
  WPPeerTrackingRequest *v5;
  uint64_t v6;
  NSUUID *peerUUID;
  uint64_t v8;
  NSDictionary *peerTrackingDictionary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPPeerTrackingRequest;
  v5 = -[WPPeerTrackingRequest init](&v11, sel_init);
  if (v5)
  {
    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kClientType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPeerUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    peerUUID = v5->_peerUUID;
    v5->_peerUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPeerTrackingData"));
    v8 = objc_claimAutoreleasedReturnValue();
    peerTrackingDictionary = v5->_peerTrackingDictionary;
    v5->_peerTrackingDictionary = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPPeerTrackingRequest clientType](self, "clientType"), CFSTR("kClientType"));
  -[WPPeerTrackingRequest peerUUID](self, "peerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kPeerUUID"));

  -[WPPeerTrackingRequest peerTrackingDictionary](self, "peerTrackingDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kPeerTrackingData"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[WPPeerTrackingRequest peerUUID](self, "peerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("peer tracking request for UUID %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WPPeerTrackingRequest *v4;
  WPPeerTrackingRequest *v5;
  WPPeerTrackingRequest *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (WPPeerTrackingRequest *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[WPPeerTrackingRequest clientType](v6, "clientType");
    if (v7 == -[WPPeerTrackingRequest clientType](self, "clientType"))
    {
      -[WPPeerTrackingRequest peerUUID](v6, "peerUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPPeerTrackingRequest peerUUID](self, "peerUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WPPeerTrackingRequest peerUUID](self, "peerUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

- (NSUUID)peerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeerUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)peerTrackingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerTrackingDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrackingDictionary, 0);
  objc_storeStrong((id *)&self->_peerUUID, 0);
}

@end
