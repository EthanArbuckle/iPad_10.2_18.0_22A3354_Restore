@implementation TVRMSPairingSessionDidPairMessage

- (void)setSessionIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasServiceNetworkName
{
  return self->_serviceNetworkName != 0;
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
  v8.super_class = (Class)TVRMSPairingSessionDidPairMessage;
  -[TVRMSPairingSessionDidPairMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSPairingSessionDidPairMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *serviceNetworkName;
  NSString *pairingGUID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sessionIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sessionIdentifier"));

  }
  serviceNetworkName = self->_serviceNetworkName;
  if (serviceNetworkName)
    objc_msgSend(v3, "setObject:forKey:", serviceNetworkName, CFSTR("serviceNetworkName"));
  pairingGUID = self->_pairingGUID;
  if (pairingGUID)
    objc_msgSend(v3, "setObject:forKey:", pairingGUID, CFSTR("pairingGUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSPairingSessionDidPairMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_serviceNetworkName)
  {
    PBDataWriterWriteStringField();
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
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_sessionIdentifier;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_serviceNetworkName)
  {
    objc_msgSend(v4, "setServiceNetworkName:");
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
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_sessionIdentifier;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_serviceNetworkName, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_pairingGUID, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *serviceNetworkName;
  NSString *pairingGUID;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  serviceNetworkName = self->_serviceNetworkName;
  if ((unint64_t)serviceNetworkName | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](serviceNetworkName, "isEqual:"))
  {
    goto LABEL_11;
  }
  pairingGUID = self->_pairingGUID;
  if ((unint64_t)pairingGUID | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](pairingGUID, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_sessionIdentifier;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_serviceNetworkName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_pairingGUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_sessionIdentifier = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[TVRMSPairingSessionDidPairMessage setServiceNetworkName:](self, "setServiceNetworkName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[TVRMSPairingSessionDidPairMessage setPairingGUID:](self, "setPairingGUID:");
    v4 = v5;
  }

}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)serviceNetworkName
{
  return self->_serviceNetworkName;
}

- (void)setServiceNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNetworkName, a3);
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
  objc_storeStrong((id *)&self->_serviceNetworkName, 0);
  objc_storeStrong((id *)&self->_pairingGUID, 0);
}

@end
