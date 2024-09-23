@implementation AWDLQMDataTransfer

- (void)dealloc
{
  objc_super v3;

  -[AWDLQMDataTransfer setBundleName:](self, "setBundleName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDLQMDataTransfer;
  -[AWDLQMDataTransfer dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBundleName
{
  return self->_bundleName != 0;
}

- (int)lQM
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_lQM;
  else
    return 0;
}

- (void)setLQM:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lQM = a3;
}

- (void)setHasLQM:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLQM
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)lQMAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DF38[a3];
}

- (int)StringAsLQM:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("LQM_TYPE_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("LQM_TYPE_GOOD")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("LQM_TYPE_BAD")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LQM_TYPE_POOR")))
    return 3;
  return 0;
}

- (void)setTxBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTxBytes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRxBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRxBytes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStateDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_stateDuration = a3;
}

- (void)setHasStateDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStateDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLQMDataTransfer;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLQMDataTransfer description](&v3, sel_description), -[AWDLQMDataTransfer dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleName;
  char has;
  uint64_t lQM;
  __CFString *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  bundleName = self->_bundleName;
  if (bundleName)
    objc_msgSend(v3, "setObject:forKey:", bundleName, CFSTR("bundleName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    lQM = self->_lQM;
    if (lQM >= 4)
      v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lQM);
    else
      v8 = off_24C10DF38[lQM];
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("LQM"));
    has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((has & 2) == 0)
      goto LABEL_10;
LABEL_14:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxBytes), CFSTR("RxBytes"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_11;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txBytes), CFSTR("TxBytes"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((has & 4) != 0)
LABEL_11:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stateDuration), CFSTR("stateDuration"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLQMDataTransferReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_bundleName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_bundleName)
    objc_msgSend(a3, "setBundleName:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_lQM;
    *((_BYTE *)a3 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 7) = self->_txBytes;
  *((_BYTE *)a3 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  *((_DWORD *)a3 + 5) = self->_rxBytes;
  *((_BYTE *)a3 + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_7:
  *((_DWORD *)a3 + 6) = self->_stateDuration;
  *((_BYTE *)a3 + 32) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_bundleName, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_lQM;
    *(_BYTE *)(v5 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_rxBytes;
      *(_BYTE *)(v5 + 32) |= 2u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_txBytes;
  *(_BYTE *)(v5 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_stateDuration;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *bundleName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    bundleName = self->_bundleName;
    if (!((unint64_t)bundleName | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](bundleName, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_lQM != *((_DWORD *)a3 + 4))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 32) & 1) != 0)
      {
LABEL_23:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_txBytes != *((_DWORD *)a3 + 7))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 32) & 8) != 0)
      {
        goto LABEL_23;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_rxBytes != *((_DWORD *)a3 + 5))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 32) & 2) != 0)
      {
        goto LABEL_23;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 4) == 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_stateDuration != *((_DWORD *)a3 + 6))
          goto LABEL_23;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_bundleName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_lQM;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_txBytes;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_rxBytes;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_stateDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 1))
    -[AWDLQMDataTransfer setBundleName:](self, "setBundleName:");
  v5 = *((_BYTE *)a3 + 32);
  if ((v5 & 1) != 0)
  {
    self->_lQM = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_txBytes = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  self->_rxBytes = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 32) & 4) == 0)
    return;
LABEL_7:
  self->_stateDuration = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)txBytes
{
  return self->_txBytes;
}

- (unsigned)rxBytes
{
  return self->_rxBytes;
}

- (unsigned)stateDuration
{
  return self->_stateDuration;
}

@end
