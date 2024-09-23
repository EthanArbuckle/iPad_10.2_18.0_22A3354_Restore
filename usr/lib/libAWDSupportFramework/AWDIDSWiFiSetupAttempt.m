@implementation AWDIDSWiFiSetupAttempt

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSWiFiSetupAttempt setClient:](self, "setClient:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWiFiSetupAttempt;
  -[AWDIDSWiFiSetupAttempt dealloc](&v3, sel_dealloc);
}

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

- (void)setType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setResult:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResult
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasClient
{
  return self->_client != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWiFiSetupAttempt;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSWiFiSetupAttempt description](&v3, sel_description), -[AWDIDSWiFiSetupAttempt dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *client;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type), CFSTR("type"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_result), CFSTR("result"));
LABEL_6:
  client = self->_client;
  if (client)
    objc_msgSend(v3, "setObject:forKey:", client, CFSTR("client"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSWiFiSetupAttemptReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 1) == 0)
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
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_client)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSString *client;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_type;
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_duration;
  *((_BYTE *)a3 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_QWORD *)a3 + 2) = self->_result;
    *((_BYTE *)a3 + 48) |= 2u;
  }
LABEL_6:
  client = self->_client;
  if (client)
    objc_msgSend(a3, "setClient:", client);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_duration;
      *(_BYTE *)(v5 + 48) |= 1u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 32) = self->_type;
  *(_BYTE *)(v5 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 16) = self->_result;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
LABEL_6:

  v6[5] = -[NSString copyWithZone:](self->_client, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *client;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_type != *((_QWORD *)a3 + 4))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_result != *((_QWORD *)a3 + 2))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    client = self->_client;
    if ((unint64_t)client | *((_QWORD *)a3 + 5))
      LOBYTE(v5) = -[NSString isEqual:](client, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_type;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_client, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761u * self->_duration;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761u * self->_result;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_client, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_type = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  self->_duration = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
LABEL_5:
    self->_result = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 5))
    -[AWDIDSWiFiSetupAttempt setClient:](self, "setClient:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSString)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
