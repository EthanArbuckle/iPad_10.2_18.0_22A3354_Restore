@implementation AWDLibnetcoreTCPStatsReport

- (void)setTcpIPv4AvgRTT:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tcpIPv4AvgRTT = a3;
}

- (void)setHasTcpIPv4AvgRTT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTcpIPv4AvgRTT
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTcpIPv6AvgRTT:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tcpIPv6AvgRTT = a3;
}

- (void)setHasTcpIPv6AvgRTT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTcpIPv6AvgRTT
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTcpSendPLR:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_tcpSendPLR = a3;
}

- (void)setHasTcpSendPLR:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTcpSendPLR
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTcpRecvPLR:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tcpRecvPLR = a3;
}

- (void)setHasTcpRecvPLR:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTcpRecvPLR
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTcpSendTLRTO:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_tcpSendTLRTO = a3;
}

- (void)setHasTcpSendTLRTO:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasTcpSendTLRTO
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTcpSendReorderRate:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_tcpSendReorderRate = a3;
}

- (void)setHasTcpSendReorderRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTcpSendReorderRate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTcpConnectionAttempts:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tcpConnectionAttempts = a3;
}

- (void)setHasTcpConnectionAttempts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTcpConnectionAttempts
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTcpConnectionAccepts:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tcpConnectionAccepts = a3;
}

- (void)setHasTcpConnectionAccepts:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTcpConnectionAccepts
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPStatsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreTCPStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPStatsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpIPv4AvgRTT), CFSTR("tcpIPv4AvgRTT"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpIPv6AvgRTT), CFSTR("tcpIPv6AvgRTT"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpSendPLR), CFSTR("tcpSendPLR"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpRecvPLR), CFSTR("tcpRecvPLR"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpSendTLRTO), CFSTR("tcpSendTLRTO"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpConnectionAttempts), CFSTR("tcpConnectionAttempts"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpSendReorderRate), CFSTR("tcpSendReorderRate"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 1) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpConnectionAccepts), CFSTR("tcpConnectionAccepts"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_tcpIPv4AvgRTT;
    *((_BYTE *)a3 + 72) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_tcpIPv6AvgRTT;
  *((_BYTE *)a3 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)a3 + 6) = self->_tcpSendPLR;
  *((_BYTE *)a3 + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)a3 + 5) = self->_tcpRecvPLR;
  *((_BYTE *)a3 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)a3 + 8) = self->_tcpSendTLRTO;
  *((_BYTE *)a3 + 72) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 7) = self->_tcpSendReorderRate;
  *((_BYTE *)a3 + 72) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      return;
LABEL_17:
    *((_QWORD *)a3 + 1) = self->_tcpConnectionAccepts;
    *((_BYTE *)a3 + 72) |= 1u;
    return;
  }
LABEL_16:
  *((_QWORD *)a3 + 2) = self->_tcpConnectionAttempts;
  *((_BYTE *)a3 + 72) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_tcpIPv4AvgRTT;
    *((_BYTE *)result + 72) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_tcpIPv6AvgRTT;
  *((_BYTE *)result + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 6) = self->_tcpSendPLR;
  *((_BYTE *)result + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 5) = self->_tcpRecvPLR;
  *((_BYTE *)result + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 8) = self->_tcpSendTLRTO;
  *((_BYTE *)result + 72) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 7) = self->_tcpSendReorderRate;
  *((_BYTE *)result + 72) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_QWORD *)result + 2) = self->_tcpConnectionAttempts;
  *((_BYTE *)result + 72) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_9:
  *((_QWORD *)result + 1) = self->_tcpConnectionAccepts;
  *((_BYTE *)result + 72) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_tcpIPv4AvgRTT != *((_QWORD *)a3 + 3))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_tcpIPv6AvgRTT != *((_QWORD *)a3 + 4))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x20) == 0 || self->_tcpSendPLR != *((_QWORD *)a3 + 6))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_tcpRecvPLR != *((_QWORD *)a3 + 5))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x80) == 0 || self->_tcpSendTLRTO != *((_QWORD *)a3 + 8))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x40) == 0 || self->_tcpSendReorderRate != *((_QWORD *)a3 + 7))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_tcpConnectionAttempts != *((_QWORD *)a3 + 2))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_tcpConnectionAccepts != *((_QWORD *)a3 + 1))
        goto LABEL_41;
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
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_tcpIPv4AvgRTT;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_tcpIPv6AvgRTT;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_tcpSendPLR;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_tcpRecvPLR;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v6 = 2654435761u * self->_tcpSendTLRTO;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_tcpSendReorderRate;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761u * self->_tcpConnectionAttempts;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761u * self->_tcpConnectionAccepts;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 4) != 0)
  {
    self->_tcpIPv4AvgRTT = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 72);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpIPv6AvgRTT = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_tcpSendPLR = *((_QWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_tcpRecvPLR = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_tcpSendTLRTO = *((_QWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x80u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_tcpSendReorderRate = *((_QWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 1) == 0)
      return;
LABEL_17:
    self->_tcpConnectionAccepts = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
LABEL_16:
  self->_tcpConnectionAttempts = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 72) & 1) != 0)
    goto LABEL_17;
}

- (unint64_t)tcpIPv4AvgRTT
{
  return self->_tcpIPv4AvgRTT;
}

- (unint64_t)tcpIPv6AvgRTT
{
  return self->_tcpIPv6AvgRTT;
}

- (unint64_t)tcpSendPLR
{
  return self->_tcpSendPLR;
}

- (unint64_t)tcpRecvPLR
{
  return self->_tcpRecvPLR;
}

- (unint64_t)tcpSendTLRTO
{
  return self->_tcpSendTLRTO;
}

- (unint64_t)tcpSendReorderRate
{
  return self->_tcpSendReorderRate;
}

- (unint64_t)tcpConnectionAttempts
{
  return self->_tcpConnectionAttempts;
}

- (unint64_t)tcpConnectionAccepts
{
  return self->_tcpConnectionAccepts;
}

@end
