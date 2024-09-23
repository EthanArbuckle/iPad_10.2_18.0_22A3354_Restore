@implementation AWDLBClientConnectionReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setConnectionJoiningFailure:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_connectionJoiningFailure = a3;
}

- (void)setHasConnectionJoiningFailure:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasConnectionJoiningFailure
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setConnectionJoiningLbConnectionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_connectionJoiningLbConnectionState = a3;
}

- (void)setHasConnectionJoiningLbConnectionState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasConnectionJoiningLbConnectionState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionJoiningLbConnectionMigration:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_connectionJoiningLbConnectionMigration = a3;
}

- (void)setHasConnectionJoiningLbConnectionMigration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasConnectionJoiningLbConnectionMigration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setConnectionServiceId:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionServiceId = a3;
}

- (void)setHasConnectionServiceId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionServiceId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConnectionDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectionDuration = a3;
}

- (void)setHasConnectionDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectionDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDataPathResult:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_dataPathResult = a3;
}

- (void)setHasDataPathResult:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasDataPathResult
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setBytesSent:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBytesReceived:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTimeToFirstResponse:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeToFirstResponse = a3;
}

- (void)setHasTimeToFirstResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeToFirstResponse
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimeToConnectionFailure:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timeToConnectionFailure = a3;
}

- (void)setHasTimeToConnectionFailure:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimeToConnectionFailure
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLBClientConnectionReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLBClientConnectionReport description](&v3, sel_description), -[AWDLBClientConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionJoiningFailure), CFSTR("connection_joining_failure"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionJoiningLbConnectionState), CFSTR("connection_joining_lb_connection_state"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionJoiningLbConnectionMigration), CFSTR("connection_joining_lb_connection_migration"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionServiceId), CFSTR("connection_service_id"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_connectionDuration), CFSTR("connection_duration"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_dataPathResult), CFSTR("data_path_result"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bytesSent), CFSTR("bytes_sent"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeToFirstResponse), CFSTR("time_to_first_response"));
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bytesReceived), CFSTR("bytes_received"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x10) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeToConnectionFailure), CFSTR("time_to_connection_failure"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLBClientConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      return;
LABEL_23:
    PBDataWriterWriteInt64Field();
    return;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    goto LABEL_23;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_WORD *)a3 + 40) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = self->_connectionJoiningFailure;
  *((_WORD *)a3 + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 18) = self->_connectionJoiningLbConnectionState;
  *((_WORD *)a3 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 17) = self->_connectionJoiningLbConnectionMigration;
  *((_WORD *)a3 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 4) = self->_connectionServiceId;
  *((_WORD *)a3 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 3) = self->_connectionDuration;
  *((_WORD *)a3 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 19) = self->_dataPathResult;
  *((_WORD *)a3 + 40) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 2) = self->_bytesSent;
  *((_WORD *)a3 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 1) = self->_bytesReceived;
  *((_WORD *)a3 + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      return;
LABEL_23:
    *((_QWORD *)a3 + 5) = self->_timeToConnectionFailure;
    *((_WORD *)a3 + 40) |= 0x10u;
    return;
  }
LABEL_22:
  *((_QWORD *)a3 + 6) = self->_timeToFirstResponse;
  *((_WORD *)a3 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    goto LABEL_23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)result + 7) = self->_timestamp;
    *((_WORD *)result + 40) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = self->_connectionJoiningFailure;
  *((_WORD *)result + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 18) = self->_connectionJoiningLbConnectionState;
  *((_WORD *)result + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 17) = self->_connectionJoiningLbConnectionMigration;
  *((_WORD *)result + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 4) = self->_connectionServiceId;
  *((_WORD *)result + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 3) = self->_connectionDuration;
  *((_WORD *)result + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 19) = self->_dataPathResult;
  *((_WORD *)result + 40) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 2) = self->_bytesSent;
  *((_WORD *)result + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 1) = self->_bytesReceived;
  *((_WORD *)result + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_QWORD *)result + 6) = self->_timeToFirstResponse;
  *((_WORD *)result + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) == 0)
    return result;
LABEL_12:
  *((_QWORD *)result + 5) = self->_timeToConnectionFailure;
  *((_WORD *)result + 40) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 40);
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
        goto LABEL_56;
    }
    else if ((v7 & 0x40) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_connectionJoiningFailure != *((_DWORD *)a3 + 16))
        goto LABEL_56;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 40) & 0x200) == 0 || self->_connectionJoiningLbConnectionState != *((_DWORD *)a3 + 18))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 40) & 0x200) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 40) & 0x100) == 0 || self->_connectionJoiningLbConnectionMigration != *((_DWORD *)a3 + 17))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_connectionServiceId != *((_QWORD *)a3 + 4))
        goto LABEL_56;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_connectionDuration != *((_QWORD *)a3 + 3))
        goto LABEL_56;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 40) & 0x400) == 0 || self->_dataPathResult != *((_DWORD *)a3 + 19))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_bytesSent != *((_QWORD *)a3 + 2))
        goto LABEL_56;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_bytesReceived != *((_QWORD *)a3 + 1))
        goto LABEL_56;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_timeToFirstResponse != *((_QWORD *)a3 + 6))
        goto LABEL_56;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 0x10) == 0;
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timeToConnectionFailure != *((_QWORD *)a3 + 5))
        goto LABEL_56;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_connectionJoiningFailure;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_connectionJoiningLbConnectionState;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_connectionJoiningLbConnectionMigration;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_connectionServiceId;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_connectionDuration;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_dataPathResult;
    if ((has & 2) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_bytesSent;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_bytesReceived;
    if ((has & 0x20) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_timeToFirstResponse;
  if ((has & 0x10) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_timeToConnectionFailure;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x40) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    v3 = *((_WORD *)a3 + 40);
    if ((v3 & 0x80) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((v3 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_connectionJoiningFailure = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_connectionJoiningLbConnectionState = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x100) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_connectionJoiningLbConnectionMigration = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_connectionServiceId = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_connectionDuration = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x400) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_dataPathResult = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 2) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_bytesSent = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_bytesReceived = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_11:
    if ((v3 & 0x10) == 0)
      return;
LABEL_23:
    self->_timeToConnectionFailure = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    return;
  }
LABEL_22:
  self->_timeToFirstResponse = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 40) & 0x10) != 0)
    goto LABEL_23;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)connectionJoiningFailure
{
  return self->_connectionJoiningFailure;
}

- (int)connectionJoiningLbConnectionState
{
  return self->_connectionJoiningLbConnectionState;
}

- (int)connectionJoiningLbConnectionMigration
{
  return self->_connectionJoiningLbConnectionMigration;
}

- (unint64_t)connectionServiceId
{
  return self->_connectionServiceId;
}

- (int64_t)connectionDuration
{
  return self->_connectionDuration;
}

- (int)dataPathResult
{
  return self->_dataPathResult;
}

- (int64_t)bytesSent
{
  return self->_bytesSent;
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (int64_t)timeToFirstResponse
{
  return self->_timeToFirstResponse;
}

- (int64_t)timeToConnectionFailure
{
  return self->_timeToConnectionFailure;
}

@end
