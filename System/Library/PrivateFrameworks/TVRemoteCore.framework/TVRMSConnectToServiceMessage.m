@implementation TVRMSConnectToServiceMessage

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasPairingGUID
{
  return self->_pairingGUID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVRMSConnectToServiceMessage;
  -[TVRMSConnectToServiceMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSConnectToServiceMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  TVRMSServiceMessage *service;
  void *v5;
  NSString *pairingGUID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  if (service)
  {
    -[TVRMSServiceMessage dictionaryRepresentation](service, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("service"));

  }
  pairingGUID = self->_pairingGUID;
  if (pairingGUID)
    objc_msgSend(v3, "setObject:forKey:", pairingGUID, CFSTR("pairingGUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSConnectToServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_service)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pairingGUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_service)
  {
    objc_msgSend(v4, "setService:");
    v4 = v5;
  }
  if (self->_pairingGUID)
  {
    objc_msgSend(v5, "setPairingGUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[TVRMSServiceMessage copyWithZone:](self->_service, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_pairingGUID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  TVRMSServiceMessage *service;
  NSString *pairingGUID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((service = self->_service, !((unint64_t)service | v4[2]))
     || -[TVRMSServiceMessage isEqual:](service, "isEqual:")))
  {
    pairingGUID = self->_pairingGUID;
    if ((unint64_t)pairingGUID | v4[1])
      v7 = -[NSString isEqual:](pairingGUID, "isEqual:");
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
  unint64_t v3;

  v3 = -[TVRMSServiceMessage hash](self->_service, "hash");
  return -[NSString hash](self->_pairingGUID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  TVRMSServiceMessage *service;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  service = self->_service;
  v6 = v4[2];
  v7 = v4;
  if (service)
  {
    if (!v6)
      goto LABEL_7;
    -[TVRMSServiceMessage mergeFrom:](service, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[TVRMSConnectToServiceMessage setService:](self, "setService:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[TVRMSConnectToServiceMessage setPairingGUID:](self, "setPairingGUID:");
    v4 = v7;
  }

}

- (TVRMSServiceMessage)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)pairingGUID
{
  return self->_pairingGUID;
}

- (void)setPairingGUID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pairingGUID, 0);
}

@end
