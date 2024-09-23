@implementation SPPeerTrustDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPeerTrustDataIntegrity)initWithPeerTrustRecord:(id)a3 messagingDestination:(id)a4
{
  id v7;
  id v8;
  SPPeerTrustDataIntegrity *v9;
  SPPeerTrustDataIntegrity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPPeerTrustDataIntegrity;
  v9 = -[SPPeerTrustDataIntegrity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peerTrustRecord, a3);
    objc_storeStrong((id *)&v10->_messagingDestination, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPPeerTrustDataIntegrity *v4;
  void *v5;
  void *v6;
  SPPeerTrustDataIntegrity *v7;

  v4 = [SPPeerTrustDataIntegrity alloc];
  -[SPPeerTrustDataIntegrity peerTrustRecord](self, "peerTrustRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeerTrustDataIntegrity messagingDestination](self, "messagingDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPPeerTrustDataIntegrity initWithPeerTrustRecord:messagingDestination:](v4, "initWithPeerTrustRecord:messagingDestination:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  SPDataIntegrityCheck *peerTrustRecord;
  id v5;

  peerTrustRecord = self->_peerTrustRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", peerTrustRecord, CFSTR("peerTrustRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagingDestination, CFSTR("messagingDestination"));

}

- (SPPeerTrustDataIntegrity)initWithCoder:(id)a3
{
  id v4;
  SPDataIntegrityCheck *v5;
  SPDataIntegrityCheck *peerTrustRecord;
  SPDataIntegrityCheck *v7;
  SPDataIntegrityCheck *messagingDestination;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerTrustRecord"));
  v5 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  peerTrustRecord = self->_peerTrustRecord;
  self->_peerTrustRecord = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messagingDestination"));
  v7 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();

  messagingDestination = self->_messagingDestination;
  self->_messagingDestination = v7;

  return self;
}

- (SPDataIntegrityCheck)peerTrustRecord
{
  return self->_peerTrustRecord;
}

- (void)setPeerTrustRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SPDataIntegrityCheck)messagingDestination
{
  return self->_messagingDestination;
}

- (void)setMessagingDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingDestination, 0);
  objc_storeStrong((id *)&self->_peerTrustRecord, 0);
}

@end
