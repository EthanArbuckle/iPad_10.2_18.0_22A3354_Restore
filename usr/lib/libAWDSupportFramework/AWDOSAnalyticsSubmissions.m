@implementation AWDOSAnalyticsSubmissions

- (void)dealloc
{
  objc_super v3;

  -[AWDOSAnalyticsSubmissions setConnection:](self, "setConnection:", 0);
  -[AWDOSAnalyticsSubmissions setRouting:](self, "setRouting:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDOSAnalyticsSubmissions;
  -[AWDOSAnalyticsSubmissions dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setResponse:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_response = a3;
}

- (void)setHasResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResponse
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasConnection
{
  return self->_connection != 0;
}

- (BOOL)hasRouting
{
  return self->_routing != 0;
}

- (void)setSizeBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sizeBytes = a3;
}

- (void)setHasSizeBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSizeBytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLogs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_logs = a3;
}

- (void)setHasLogs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_seconds = a3;
}

- (void)setHasSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDOSAnalyticsSubmissions;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDOSAnalyticsSubmissions description](&v3, sel_description), -[AWDOSAnalyticsSubmissions dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *connection;
  NSString *routing;
  char v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_response), CFSTR("response"));
  connection = self->_connection;
  if (connection)
    objc_msgSend(v3, "setObject:forKey:", connection, CFSTR("connection"));
  routing = self->_routing;
  if (routing)
    objc_msgSend(v3, "setObject:forKey:", routing, CFSTR("routing"));
  v7 = (char)self->_has;
  if ((v7 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_logs), CFSTR("logs"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sizeBytes), CFSTR("sizeBytes"));
  v7 = (char)self->_has;
  if ((v7 & 1) != 0)
    goto LABEL_15;
LABEL_11:
  if ((v7 & 2) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_seconds), CFSTR("seconds"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDOSAnalyticsSubmissionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_connection)
    PBDataWriterWriteStringField();
  if (self->_routing)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_11:
      if ((v5 & 2) == 0)
        return;
LABEL_15:
      PBDataWriterWriteUint64Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_response;
    *((_BYTE *)a3 + 64) |= 0x10u;
  }
  if (self->_connection)
    objc_msgSend(a3, "setConnection:");
  if (self->_routing)
    objc_msgSend(a3, "setRouting:");
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_sizeBytes;
    *((_BYTE *)a3 + 64) |= 4u;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 2) == 0)
        return;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)a3 + 1) = self->_logs;
  *((_BYTE *)a3 + 64) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return;
LABEL_12:
  *((_QWORD *)a3 + 2) = self->_seconds;
  *((_BYTE *)a3 + 64) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_response;
    *(_BYTE *)(v5 + 64) |= 0x10u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_connection, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_routing, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    *(_QWORD *)(v6 + 8) = self->_logs;
    *(_BYTE *)(v6 + 64) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 24) = self->_sizeBytes;
  *(_BYTE *)(v6 + 64) |= 4u;
  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v8 & 2) != 0)
  {
LABEL_8:
    *(_QWORD *)(v6 + 16) = self->_seconds;
    *(_BYTE *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *connection;
  NSString *routing;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
        goto LABEL_30;
    }
    else if ((*((_BYTE *)a3 + 64) & 8) != 0)
    {
LABEL_30:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_response != *((_DWORD *)a3 + 12))
        goto LABEL_30;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_30;
    }
    connection = self->_connection;
    if (!((unint64_t)connection | *((_QWORD *)a3 + 5))
      || (v5 = -[NSString isEqual:](connection, "isEqual:")) != 0)
    {
      routing = self->_routing;
      if (!((unint64_t)routing | *((_QWORD *)a3 + 7)) || (v5 = -[NSString isEqual:](routing, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_sizeBytes != *((_QWORD *)a3 + 3))
            goto LABEL_30;
        }
        else if ((*((_BYTE *)a3 + 64) & 4) != 0)
        {
          goto LABEL_30;
        }
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_logs != *((_QWORD *)a3 + 1))
            goto LABEL_30;
        }
        else if ((*((_BYTE *)a3 + 64) & 1) != 0)
        {
          goto LABEL_30;
        }
        LOBYTE(v5) = (*((_BYTE *)a3 + 64) & 2) == 0;
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_seconds != *((_QWORD *)a3 + 2))
            goto LABEL_30;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_response;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_connection, "hash");
  v6 = -[NSString hash](self->_routing, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_11:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v7 = 2654435761u * self->_sizeBytes;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_8:
  v8 = 2654435761u * self->_logs;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = 2654435761u * self->_seconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 64);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_response = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDOSAnalyticsSubmissions setConnection:](self, "setConnection:");
  if (*((_QWORD *)a3 + 7))
    -[AWDOSAnalyticsSubmissions setRouting:](self, "setRouting:");
  v6 = *((_BYTE *)a3 + 64);
  if ((v6 & 4) != 0)
  {
    self->_sizeBytes = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)a3 + 64);
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 2) == 0)
        return;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_logs = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 64) & 2) == 0)
    return;
LABEL_12:
  self->_seconds = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)response
{
  return self->_response;
}

- (NSString)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)routing
{
  return self->_routing;
}

- (void)setRouting:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (unint64_t)logs
{
  return self->_logs;
}

- (unint64_t)seconds
{
  return self->_seconds;
}

@end
