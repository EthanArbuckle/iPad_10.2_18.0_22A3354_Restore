@implementation SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion

- (void)setOsRelease:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_osRelease = a3;
}

- (void)setHasOsRelease:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOsRelease
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNcvNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ncvNumber = a3;
}

- (void)setHasNcvNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNcvNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPatchNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_patchNumber = a3;
}

- (void)setHasPatchNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPatchNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBoltTaskId
{
  return self->_boltTaskId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion;
  -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *boltTaskId;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_osRelease);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("os_release"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ncvNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ncv_number"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_patchNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("patch_number"));

  }
LABEL_5:
  boltTaskId = self->_boltTaskId;
  if (boltTaskId)
    objc_msgSend(v3, "setObject:forKey:", boltTaskId, CFSTR("bolt_task_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_boltTaskId)
  {
    PBDataWriterWriteStringField();
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
  if ((has & 2) != 0)
  {
    v4[5] = self->_osRelease;
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_ncvNumber;
  *((_BYTE *)v4 + 28) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[6] = self->_patchNumber;
    *((_BYTE *)v4 + 28) |= 4u;
  }
LABEL_5:
  if (self->_boltTaskId)
  {
    v6 = v4;
    objc_msgSend(v4, "setBoltTaskId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_ncvNumber;
    *(_BYTE *)(v5 + 28) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_osRelease;
  *(_BYTE *)(v5 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_patchNumber;
    *(_BYTE *)(v5 + 28) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_boltTaskId, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *boltTaskId;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_osRelease != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_ncvNumber != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_patchNumber != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  boltTaskId = self->_boltTaskId;
  if ((unint64_t)boltTaskId | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](boltTaskId, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_boltTaskId, "hash");
  }
  v2 = 2654435761 * self->_osRelease;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_ncvNumber;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_patchNumber;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_boltTaskId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_osRelease = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_ncvNumber = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_patchNumber = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion setBoltTaskId:](self, "setBoltTaskId:");
    v4 = v6;
  }

}

- (unsigned)osRelease
{
  return self->_osRelease;
}

- (unsigned)ncvNumber
{
  return self->_ncvNumber;
}

- (unsigned)patchNumber
{
  return self->_patchNumber;
}

- (NSString)boltTaskId
{
  return self->_boltTaskId;
}

- (void)setBoltTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_boltTaskId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boltTaskId, 0);
}

@end
