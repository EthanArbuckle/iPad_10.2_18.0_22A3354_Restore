@implementation AWDIDSMagnetCorruptionDetailed

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLinkType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLinkType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDiscardedRawBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_discardedRawBytes = a3;
}

- (void)setHasDiscardedRawBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDiscardedRawBytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCorrectRawBytesSinceLastCorruption:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_correctRawBytesSinceLastCorruption = a3;
}

- (void)setHasCorrectRawBytesSinceLastCorruption:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCorrectRawBytesSinceLastCorruption
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCorrectFramesSinceLastCorruption:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_correctFramesSinceLastCorruption = a3;
}

- (void)setHasCorrectFramesSinceLastCorruption:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCorrectFramesSinceLastCorruption
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRecoveryTimeInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_recoveryTimeInMs = a3;
}

- (void)setHasRecoveryTimeInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRecoveryTimeInMs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSMagnetCorruptionDetailed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSMagnetCorruptionDetailed description](&v3, sel_description), -[AWDIDSMagnetCorruptionDetailed dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_linkType), CFSTR("linkType"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_discardedRawBytes), CFSTR("discardedRawBytes"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_correctFramesSinceLastCorruption), CFSTR("correctFramesSinceLastCorruption"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_correctRawBytesSinceLastCorruption), CFSTR("correctRawBytesSinceLastCorruption"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_recoveryTimeInMs), CFSTR("recoveryTimeInMs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSMagnetCorruptionDetailedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_linkType;
  *((_BYTE *)a3 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)a3 + 3) = self->_discardedRawBytes;
  *((_BYTE *)a3 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)a3 + 2) = self->_correctRawBytesSinceLastCorruption;
  *((_BYTE *)a3 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    *((_QWORD *)a3 + 5) = self->_recoveryTimeInMs;
    *((_BYTE *)a3 + 56) |= 0x10u;
    return;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_correctFramesSinceLastCorruption;
  *((_BYTE *)a3 + 56) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)result + 6) = self->_timestamp;
    *((_BYTE *)result + 56) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_linkType;
  *((_BYTE *)result + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)result + 3) = self->_discardedRawBytes;
  *((_BYTE *)result + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 2) = self->_correctRawBytesSinceLastCorruption;
  *((_BYTE *)result + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)result + 1) = self->_correctFramesSinceLastCorruption;
  *((_BYTE *)result + 56) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 5) = self->_recoveryTimeInMs;
  *((_BYTE *)result + 56) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_timestamp != *((_QWORD *)a3 + 6))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_linkType != *((_QWORD *)a3 + 4))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_discardedRawBytes != *((_QWORD *)a3 + 3))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 4) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_correctRawBytesSinceLastCorruption != *((_QWORD *)a3 + 2))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_correctFramesSinceLastCorruption != *((_QWORD *)a3 + 1))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 0x10) == 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_recoveryTimeInMs != *((_QWORD *)a3 + 5))
        goto LABEL_31;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_linkType;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_discardedRawBytes;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_correctRawBytesSinceLastCorruption;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761u * self->_correctFramesSinceLastCorruption;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761u * self->_recoveryTimeInMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 0x20) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    v3 = *((_BYTE *)a3 + 56);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_linkType = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_discardedRawBytes = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_correctRawBytesSinceLastCorruption = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      return;
LABEL_13:
    self->_recoveryTimeInMs = *((_QWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    return;
  }
LABEL_12:
  self->_correctFramesSinceLastCorruption = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    goto LABEL_13;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)discardedRawBytes
{
  return self->_discardedRawBytes;
}

- (unint64_t)correctRawBytesSinceLastCorruption
{
  return self->_correctRawBytesSinceLastCorruption;
}

- (unint64_t)correctFramesSinceLastCorruption
{
  return self->_correctFramesSinceLastCorruption;
}

- (unint64_t)recoveryTimeInMs
{
  return self->_recoveryTimeInMs;
}

@end
