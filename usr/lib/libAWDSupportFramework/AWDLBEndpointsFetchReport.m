@implementation AWDLBEndpointsFetchReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setEndpointsFetchTaskCount:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endpointsFetchTaskCount = a3;
}

- (void)setHasEndpointsFetchTaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndpointsFetchTaskCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEndpointsFetchTaskSuccessCount:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_endpointsFetchTaskSuccessCount = a3;
}

- (void)setHasEndpointsFetchTaskSuccessCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasEndpointsFetchTaskSuccessCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEndpointsFetchTaskFailureCount:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_endpointsFetchTaskFailureCount = a3;
}

- (void)setHasEndpointsFetchTaskFailureCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEndpointsFetchTaskFailureCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEndpointsFetchTaskBadReplyCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endpointsFetchTaskBadReplyCount = a3;
}

- (void)setHasEndpointsFetchTaskBadReplyCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndpointsFetchTaskBadReplyCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setConnectionCellularFallbackCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionCellularFallbackCount = a3;
}

- (void)setHasConnectionCellularFallbackCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionCellularFallbackCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLBEndpointsFetchReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLBEndpointsFetchReport description](&v3, sel_description), -[AWDLBEndpointsFetchReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_endpointsFetchTaskCount), CFSTR("endpoints_fetch_task_count"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_endpointsFetchTaskSuccessCount), CFSTR("endpoints_fetch_task_success_count"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_endpointsFetchTaskBadReplyCount), CFSTR("endpoints_fetch_task_bad_reply_count"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_endpointsFetchTaskFailureCount), CFSTR("endpoints_fetch_task_failure_count"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 2) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionCellularFallbackCount), CFSTR("connection_cellular_fallback_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLBEndpointsFetchReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      return;
LABEL_13:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_endpointsFetchTaskCount;
  *((_BYTE *)a3 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)a3 + 8) = self->_endpointsFetchTaskSuccessCount;
  *((_BYTE *)a3 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 7) = self->_endpointsFetchTaskFailureCount;
  *((_BYTE *)a3 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      return;
LABEL_13:
    *((_DWORD *)a3 + 4) = self->_connectionCellularFallbackCount;
    *((_BYTE *)a3 + 36) |= 2u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 5) = self->_endpointsFetchTaskBadReplyCount;
  *((_BYTE *)a3 + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_endpointsFetchTaskCount;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_endpointsFetchTaskSuccessCount;
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 7) = self->_endpointsFetchTaskFailureCount;
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_endpointsFetchTaskBadReplyCount;
  *((_BYTE *)result + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 4) = self->_connectionCellularFallbackCount;
  *((_BYTE *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_endpointsFetchTaskCount != *((_DWORD *)a3 + 6))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 36) & 8) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 0x20) == 0 || self->_endpointsFetchTaskSuccessCount != *((_DWORD *)a3 + 8))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 36) & 0x20) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 0x10) == 0 || self->_endpointsFetchTaskFailureCount != *((_DWORD *)a3 + 7))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 36) & 0x10) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_endpointsFetchTaskBadReplyCount != *((_DWORD *)a3 + 5))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_connectionCellularFallbackCount != *((_DWORD *)a3 + 4))
        goto LABEL_31;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_endpointsFetchTaskCount;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
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
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_endpointsFetchTaskSuccessCount;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_endpointsFetchTaskFailureCount;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_endpointsFetchTaskBadReplyCount;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_connectionCellularFallbackCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_endpointsFetchTaskCount = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_endpointsFetchTaskSuccessCount = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_endpointsFetchTaskFailureCount = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 2) == 0)
      return;
LABEL_13:
    self->_connectionCellularFallbackCount = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_12:
  self->_endpointsFetchTaskBadReplyCount = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 36) & 2) != 0)
    goto LABEL_13;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)endpointsFetchTaskCount
{
  return self->_endpointsFetchTaskCount;
}

- (int)endpointsFetchTaskSuccessCount
{
  return self->_endpointsFetchTaskSuccessCount;
}

- (int)endpointsFetchTaskFailureCount
{
  return self->_endpointsFetchTaskFailureCount;
}

- (int)endpointsFetchTaskBadReplyCount
{
  return self->_endpointsFetchTaskBadReplyCount;
}

- (int)connectionCellularFallbackCount
{
  return self->_connectionCellularFallbackCount;
}

@end
