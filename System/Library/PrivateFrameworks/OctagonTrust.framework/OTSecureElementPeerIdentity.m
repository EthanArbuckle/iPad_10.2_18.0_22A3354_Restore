@implementation OTSecureElementPeerIdentity

- (BOOL)hasPeerIdentifier
{
  return self->_peerIdentifier != 0;
}

- (BOOL)hasPeerData
{
  return self->_peerData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)OTSecureElementPeerIdentity;
  -[OTSecureElementPeerIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTSecureElementPeerIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *peerIdentifier;
  NSData *peerData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerIdentifier = self->_peerIdentifier;
  if (peerIdentifier)
    objc_msgSend(v3, "setObject:forKey:", peerIdentifier, CFSTR("peerIdentifier"));
  peerData = self->_peerData;
  if (peerData)
    objc_msgSend(v4, "setObject:forKey:", peerData, CFSTR("peerData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTSecureElementPeerIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_peerIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_peerData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_peerIdentifier)
  {
    objc_msgSend(v4, "setPeerIdentifier:");
    v4 = v5;
  }
  if (self->_peerData)
  {
    objc_msgSend(v5, "setPeerData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_peerIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_peerData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *peerIdentifier;
  NSData *peerData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((peerIdentifier = self->_peerIdentifier, !((unint64_t)peerIdentifier | v4[2]))
     || -[NSData isEqual:](peerIdentifier, "isEqual:")))
  {
    peerData = self->_peerData;
    if ((unint64_t)peerData | v4[1])
      v7 = -[NSData isEqual:](peerData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_peerIdentifier, "hash");
  return -[NSData hash](self->_peerData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[OTSecureElementPeerIdentity setPeerIdentifier:](self, "setPeerIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[OTSecureElementPeerIdentity setPeerData:](self, "setPeerData:");
    v4 = v5;
  }

}

- (NSData)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_peerIdentifier, a3);
}

- (NSData)peerData
{
  return self->_peerData;
}

- (void)setPeerData:(id)a3
{
  objc_storeStrong((id *)&self->_peerData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_peerData, 0);
}

@end
