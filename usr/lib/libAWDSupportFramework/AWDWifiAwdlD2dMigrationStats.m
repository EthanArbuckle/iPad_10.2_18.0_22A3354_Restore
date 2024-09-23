@implementation AWDWifiAwdlD2dMigrationStats

- (void)setSessionDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionDuration = a3;
}

- (void)setHasSessionDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRxBytes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPeerRssi:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_peerRssi = a3;
}

- (void)setHasPeerRssi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPeerRssi
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTxFailureCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_txFailureCount = a3;
}

- (void)setHasTxFailureCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasTxFailureCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTxBytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMigrationRole:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_migrationRole = a3;
}

- (void)setHasMigrationRole:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMigrationRole
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAvgCCA:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_avgCCA = a3;
}

- (void)setHasAvgCCA:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAvgCCA
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlD2dMigrationStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiAwdlD2dMigrationStats description](&v3, sel_description), -[AWDWifiAwdlD2dMigrationStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sessionDuration), CFSTR("sessionDuration"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxBytes), CFSTR("rxBytes"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_peerRssi), CFSTR("peerRssi"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txFailureCount), CFSTR("txFailureCount"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_migrationRole), CFSTR("migrationRole"));
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytes), CFSTR("txBytes"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 8) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgCCA), CFSTR("avgCCA"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiAwdlD2dMigrationStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_sessionDuration;
    *((_BYTE *)a3 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 9) = self->_channel;
  *((_BYTE *)a3 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_rxBytes;
  *((_BYTE *)a3 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 11) = self->_peerRssi;
  *((_BYTE *)a3 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 12) = self->_txFailureCount;
  *((_BYTE *)a3 + 52) |= 0x80u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 3) = self->_txBytes;
  *((_BYTE *)a3 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      return;
LABEL_17:
    *((_DWORD *)a3 + 8) = self->_avgCCA;
    *((_BYTE *)a3 + 52) |= 8u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_migrationRole;
  *((_BYTE *)a3 + 52) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_sessionDuration;
    *((_BYTE *)result + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_channel;
  *((_BYTE *)result + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 1) = self->_rxBytes;
  *((_BYTE *)result + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 11) = self->_peerRssi;
  *((_BYTE *)result + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 12) = self->_txFailureCount;
  *((_BYTE *)result + 52) |= 0x80u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 3) = self->_txBytes;
  *((_BYTE *)result + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_migrationRole;
  *((_BYTE *)result + 52) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 8) = self->_avgCCA;
  *((_BYTE *)result + 52) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_sessionDuration != *((_QWORD *)a3 + 2))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_channel != *((_DWORD *)a3 + 9))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_rxBytes != *((_QWORD *)a3 + 1))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x40) == 0 || self->_peerRssi != *((_DWORD *)a3 + 11))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x80) == 0 || self->_txFailureCount != *((_DWORD *)a3 + 12))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_txBytes != *((_QWORD *)a3 + 3))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x20) == 0 || self->_migrationRole != *((_DWORD *)a3 + 10))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_avgCCA != *((_DWORD *)a3 + 8))
        goto LABEL_41;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_sessionDuration;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_channel;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_rxBytes;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_peerRssi;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_txFailureCount;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_txBytes;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_migrationRole;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_avgCCA;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 2) != 0)
  {
    self->_sessionDuration = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 52);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_channel = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_rxBytes = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_peerRssi = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_txFailureCount = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x80u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_txBytes = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0)
      return;
LABEL_17:
    self->_avgCCA = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
LABEL_16:
  self->_migrationRole = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 52) & 8) != 0)
    goto LABEL_17;
}

- (unint64_t)sessionDuration
{
  return self->_sessionDuration;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (int)peerRssi
{
  return self->_peerRssi;
}

- (unsigned)txFailureCount
{
  return self->_txFailureCount;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unsigned)migrationRole
{
  return self->_migrationRole;
}

- (unsigned)avgCCA
{
  return self->_avgCCA;
}

@end
