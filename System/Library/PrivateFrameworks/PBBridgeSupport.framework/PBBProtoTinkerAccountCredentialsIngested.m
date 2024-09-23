@implementation PBBProtoTinkerAccountCredentialsIngested

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

- (void)setCdpStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cdpStatus = a3;
}

- (void)setHasCdpStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCdpStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDetailedError
{
  return self->_detailedError != 0;
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
  v8.super_class = (Class)PBBProtoTinkerAccountCredentialsIngested;
  -[PBBProtoTinkerAccountCredentialsIngested description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoTinkerAccountCredentialsIngested dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *detailedError;

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
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cdpStatus);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cdpStatus"));

  }
  detailedError = self->_detailedError;
  if (detailedError)
    objc_msgSend(v3, "setObject:forKey:", detailedError, CFSTR("detailedError"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTinkerAccountCredentialsIngestedReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_detailedError)
  {
    PBDataWriterWriteDataField();
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
    v4[32] = self->_success;
    v4[36] |= 2u;
  }
  v5 = v4;
  if (self->_errorDescription)
  {
    objc_msgSend(v4, "setErrorDescription:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_cdpStatus;
    v4[36] |= 1u;
  }
  if (self->_detailedError)
  {
    objc_msgSend(v5, "setDetailedError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_success;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_cdpStatus;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_detailedError, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *errorDescription;
  NSData *detailedError;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_20;
    if (self->_success)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_20;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_20;
  }
  errorDescription = self->_errorDescription;
  if (!((unint64_t)errorDescription | *((_QWORD *)v4 + 3)))
    goto LABEL_13;
  if (!-[NSString isEqual:](errorDescription, "isEqual:"))
  {
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  has = (char)self->_has;
LABEL_13:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_cdpStatus != *((_DWORD *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_20;
  }
  detailedError = self->_detailedError;
  if ((unint64_t)detailedError | *((_QWORD *)v4 + 2))
    v8 = -[NSData isEqual:](detailedError, "isEqual:");
  else
    v8 = 1;
LABEL_21:

  return v8;
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
    v5 = 2654435761 * self->_cdpStatus;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSData hash](self->_detailedError, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_success = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PBBProtoTinkerAccountCredentialsIngested setErrorDescription:](self, "setErrorDescription:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_cdpStatus = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PBBProtoTinkerAccountCredentialsIngested setDetailedError:](self, "setDetailedError:");
    v4 = v5;
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

- (unsigned)cdpStatus
{
  return self->_cdpStatus;
}

- (NSData)detailedError
{
  return self->_detailedError;
}

- (void)setDetailedError:(id)a3
{
  objc_storeStrong((id *)&self->_detailedError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_detailedError, 0);
}

@end
