@implementation PBBProtoAcknowledgeBuysOnWatchCredentialIngestion

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PBBProtoAcknowledgeBuysOnWatchCredentialIngestion;
  -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *errorDescription;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("success"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v3, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("errorCode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoAcknowledgeBuysOnWatchCredentialIngestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[24] = self->_success;
    v4[28] |= 2u;
  }
  if (self->_errorDescription)
  {
    v5 = v4;
    objc_msgSend(v4, "setErrorDescription:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_errorCode;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_success;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_errorCode;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *errorDescription;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_17;
    if (self->_success)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  errorDescription = self->_errorDescription;
  if (!((unint64_t)errorDescription | *((_QWORD *)v4 + 2)))
    goto LABEL_13;
  if (!-[NSString isEqual:](errorDescription, "isEqual:"))
  {
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  has = (char)self->_has;
LABEL_13:
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_17;
    v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_success;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_errorDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_errorCode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    self->_success = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion setErrorDescription:](self, "setErrorDescription:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)success
{
  return self->_success;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
