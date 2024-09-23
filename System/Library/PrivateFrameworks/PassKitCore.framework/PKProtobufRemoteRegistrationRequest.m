@implementation PKProtobufRemoteRegistrationRequest

- (void)setRegisterBroker:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_registerBroker = a3;
}

- (void)setHasRegisterBroker:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRegisterBroker
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRegisterPeerPayment:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_registerPeerPayment = a3;
}

- (void)setHasRegisterPeerPayment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRegisterPeerPayment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)PKProtobufRemoteRegistrationRequest;
  -[PKProtobufRemoteRegistrationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemoteRegistrationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  char has;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_registerBroker);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("registerBroker"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_registerPeerPayment);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("registerPeerPayment"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemoteRegistrationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[2] = self->_version;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)v4 + 12) = self->_registerBroker;
    *((_BYTE *)v4 + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 13) = self->_registerPeerPayment;
    *((_BYTE *)v4 + 16) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_version;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 12) = self->_registerBroker;
    *((_BYTE *)result + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 13) = self->_registerPeerPayment;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_version != *((_DWORD *)v4 + 2))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0)
      goto LABEL_13;
    if (self->_registerBroker)
    {
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_13;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) != 0)
    {
      if (self->_registerPeerPayment)
      {
        if (!*((_BYTE *)v4 + 13))
          goto LABEL_13;
      }
      else if (*((_BYTE *)v4 + 13))
      {
        goto LABEL_13;
      }
      v5 = 1;
      goto LABEL_14;
    }
LABEL_13:
    v5 = 0;
  }
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_registerBroker;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v2 ^ v3 ^ (2654435761 * self->_version);
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_registerPeerPayment;
  return v2 ^ v3 ^ (2654435761 * self->_version);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 2);
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) != 0)
  {
    self->_registerBroker = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_registerPeerPayment = *((_BYTE *)v4 + 13);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)registerBroker
{
  return self->_registerBroker;
}

- (BOOL)registerPeerPayment
{
  return self->_registerPeerPayment;
}

@end
