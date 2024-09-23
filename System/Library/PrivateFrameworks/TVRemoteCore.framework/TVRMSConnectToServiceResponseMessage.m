@implementation TVRMSConnectToServiceResponseMessage

- (void)setResponseCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSessionIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasControlInterface
{
  return self->_controlInterface != 0;
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
  v8.super_class = (Class)TVRMSConnectToServiceResponseMessage;
  -[TVRMSConnectToServiceResponseMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSConnectToServiceResponseMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  TVRMSControlInterfaceMessage *controlInterface;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_responseCode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("responseCode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sessionIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sessionIdentifier"));

  }
  controlInterface = self->_controlInterface;
  if (controlInterface)
  {
    -[TVRMSControlInterfaceMessage dictionaryRepresentation](controlInterface, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("controlInterface"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSConnectToServiceResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_controlInterface)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_responseCode;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[5] = self->_sessionIdentifier;
    *((_BYTE *)v4 + 24) |= 2u;
  }
  if (self->_controlInterface)
  {
    v6 = v4;
    objc_msgSend(v4, "setControlInterface:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_responseCode;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_sessionIdentifier;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v8 = -[TVRMSControlInterfaceMessage copyWithZone:](self->_controlInterface, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  TVRMSControlInterfaceMessage *controlInterface;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_responseCode != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  controlInterface = self->_controlInterface;
  if ((unint64_t)controlInterface | *((_QWORD *)v4 + 1))
    v6 = -[TVRMSControlInterfaceMessage isEqual:](controlInterface, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_responseCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[TVRMSControlInterfaceMessage hash](self->_controlInterface, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_sessionIdentifier;
  return v3 ^ v2 ^ -[TVRMSControlInterfaceMessage hash](self->_controlInterface, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  TVRMSControlInterfaceMessage *controlInterface;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 1) != 0)
  {
    self->_responseCode = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 24);
  }
  if ((v6 & 2) != 0)
  {
    self->_sessionIdentifier = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  controlInterface = self->_controlInterface;
  v8 = v5[1];
  if (controlInterface)
  {
    if (v8)
    {
      v9 = v5;
      -[TVRMSControlInterfaceMessage mergeFrom:](controlInterface, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[TVRMSConnectToServiceResponseMessage setControlInterface:](self, "setControlInterface:");
    goto LABEL_10;
  }

}

- (int)responseCode
{
  return self->_responseCode;
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (TVRMSControlInterfaceMessage)controlInterface
{
  return self->_controlInterface;
}

- (void)setControlInterface:(id)a3
{
  objc_storeStrong((id *)&self->_controlInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlInterface, 0);
}

@end
