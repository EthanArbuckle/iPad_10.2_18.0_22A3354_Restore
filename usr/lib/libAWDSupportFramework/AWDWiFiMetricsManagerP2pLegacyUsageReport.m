@implementation AWDWiFiMetricsManagerP2pLegacyUsageReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setActivationsSinceLastReport:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_activationsSinceLastReport = a3;
}

- (void)setHasActivationsSinceLastReport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasActivationsSinceLastReport
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTotalActiveDurationSinceLastReport:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalActiveDurationSinceLastReport = a3;
}

- (void)setHasTotalActiveDurationSinceLastReport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalActiveDurationSinceLastReport
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLongestActiveDurationSinceLastReport:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_longestActiveDurationSinceLastReport = a3;
}

- (void)setHasLongestActiveDurationSinceLastReport:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLongestActiveDurationSinceLastReport
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setShortestActiveDurationSinceLastReport:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shortestActiveDurationSinceLastReport = a3;
}

- (void)setHasShortestActiveDurationSinceLastReport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShortestActiveDurationSinceLastReport
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerP2pLegacyUsageReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerP2pLegacyUsageReport description](&v3, sel_description), -[AWDWiFiMetricsManagerP2pLegacyUsageReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_activationsSinceLastReport), CFSTR("activationsSinceLastReport"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_longestActiveDurationSinceLastReport), CFSTR("longestActiveDurationSinceLastReport"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalActiveDurationSinceLastReport), CFSTR("totalActiveDurationSinceLastReport"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_shortestActiveDurationSinceLastReport), CFSTR("shortestActiveDurationSinceLastReport"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerP2pLegacyUsageReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_activationsSinceLastReport;
  *((_BYTE *)a3 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_QWORD *)a3 + 4) = self->_totalActiveDurationSinceLastReport;
  *((_BYTE *)a3 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    *((_QWORD *)a3 + 2) = self->_shortestActiveDurationSinceLastReport;
    *((_BYTE *)a3 + 44) |= 2u;
    return;
  }
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_longestActiveDurationSinceLastReport;
  *((_BYTE *)a3 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_timestamp;
    *((_BYTE *)result + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_activationsSinceLastReport;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 4) = self->_totalActiveDurationSinceLastReport;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 1) = self->_longestActiveDurationSinceLastReport;
  *((_BYTE *)result + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 2) = self->_shortestActiveDurationSinceLastReport;
  *((_BYTE *)result + 44) |= 2u;
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
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_activationsSinceLastReport != *((_DWORD *)a3 + 10))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_totalActiveDurationSinceLastReport != *((_QWORD *)a3 + 4))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_longestActiveDurationSinceLastReport != *((_QWORD *)a3 + 1))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_shortestActiveDurationSinceLastReport != *((_QWORD *)a3 + 2))
        goto LABEL_26;
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
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_activationsSinceLastReport;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_totalActiveDurationSinceLastReport;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761u * self->_longestActiveDurationSinceLastReport;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761u * self->_shortestActiveDurationSinceLastReport;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 44);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_activationsSinceLastReport = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_totalActiveDurationSinceLastReport = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      return;
LABEL_11:
    self->_shortestActiveDurationSinceLastReport = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_longestActiveDurationSinceLastReport = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 44) & 2) != 0)
    goto LABEL_11;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)activationsSinceLastReport
{
  return self->_activationsSinceLastReport;
}

- (unint64_t)totalActiveDurationSinceLastReport
{
  return self->_totalActiveDurationSinceLastReport;
}

- (unint64_t)longestActiveDurationSinceLastReport
{
  return self->_longestActiveDurationSinceLastReport;
}

- (unint64_t)shortestActiveDurationSinceLastReport
{
  return self->_shortestActiveDurationSinceLastReport;
}

@end
