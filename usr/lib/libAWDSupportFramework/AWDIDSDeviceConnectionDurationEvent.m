@implementation AWDIDSDeviceConnectionDurationEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSDeviceConnectionDurationEvent setServiceName:](self, "setServiceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSDeviceConnectionDurationEvent;
  -[AWDIDSDeviceConnectionDurationEvent dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuccess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setClientInitToDaemonOpenSocket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_clientInitToDaemonOpenSocket = a3;
}

- (void)setHasClientInitToDaemonOpenSocket:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClientInitToDaemonOpenSocket
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setClientInitToClientOpenSocketHandler:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clientInitToClientOpenSocketHandler = a3;
}

- (void)setHasClientInitToClientOpenSocketHandler:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClientInitToClientOpenSocketHandler
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClientOpenSocketHandlerToIncomingFirstPacket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clientOpenSocketHandlerToIncomingFirstPacket = a3;
}

- (void)setHasClientOpenSocketHandlerToIncomingFirstPacket:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClientOpenSocketHandlerToIncomingFirstPacket
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDaemonOpenSocketToDaemonCompletionHandler:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_daemonOpenSocketToDaemonCompletionHandler = a3;
}

- (void)setHasDaemonOpenSocketToDaemonCompletionHandler:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDaemonOpenSocketToDaemonCompletionHandler
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDaemonCompletionHandlerToClientOpenSocketCompletion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_daemonCompletionHandlerToClientOpenSocketCompletion = a3;
}

- (void)setHasDaemonCompletionHandlerToClientOpenSocketCompletion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDaemonCompletionHandlerToClientOpenSocketCompletion
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDaemonCompletionHandlerToIncomingFirstPacket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_daemonCompletionHandlerToIncomingFirstPacket = a3;
}

- (void)setHasDaemonCompletionHandlerToIncomingFirstPacket:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDaemonCompletionHandlerToIncomingFirstPacket
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConnectionInitToIncomingFirstPacket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionInitToIncomingFirstPacket = a3;
}

- (void)setHasConnectionInitToIncomingFirstPacket:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionInitToIncomingFirstPacket
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSDeviceConnectionDurationEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSDeviceConnectionDurationEvent description](&v3, sel_description), -[AWDIDSDeviceConnectionDurationEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *serviceName;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v3, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success), CFSTR("success"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_clientInitToDaemonOpenSocket), CFSTR("clientInitToDaemonOpenSocket"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_clientInitToClientOpenSocketHandler), CFSTR("clientInitToClientOpenSocketHandler"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_clientOpenSocketHandlerToIncomingFirstPacket), CFSTR("clientOpenSocketHandlerToIncomingFirstPacket"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_daemonOpenSocketToDaemonCompletionHandler), CFSTR("daemonOpenSocketToDaemonCompletionHandler"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_daemonCompletionHandlerToIncomingFirstPacket), CFSTR("daemonCompletionHandlerToIncomingFirstPacket"));
    if ((*(_WORD *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_daemonCompletionHandlerToClientOpenSocketCompletion), CFSTR("daemonCompletionHandlerToClientOpenSocketCompletion"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_21;
LABEL_12:
  if ((has & 8) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionInitToIncomingFirstPacket), CFSTR("connectionInitToIncomingFirstPacket"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSDeviceConnectionDurationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      return;
LABEL_21:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_QWORD *)a3 + 8) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 0x80u;
  }
  if (self->_serviceName)
    objc_msgSend(a3, "setServiceName:");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_BYTE *)a3 + 80) = self->_success;
    *((_WORD *)a3 + 42) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 2) = self->_clientInitToDaemonOpenSocket;
  *((_WORD *)a3 + 42) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 1) = self->_clientInitToClientOpenSocketHandler;
  *((_WORD *)a3 + 42) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 3) = self->_clientOpenSocketHandlerToIncomingFirstPacket;
  *((_WORD *)a3 + 42) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 7) = self->_daemonOpenSocketToDaemonCompletionHandler;
  *((_WORD *)a3 + 42) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 5) = self->_daemonCompletionHandlerToClientOpenSocketCompletion;
  *((_WORD *)a3 + 42) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      return;
    goto LABEL_13;
  }
LABEL_21:
  *((_QWORD *)a3 + 6) = self->_daemonCompletionHandlerToIncomingFirstPacket;
  *((_WORD *)a3 + 42) |= 0x20u;
  if ((*(_WORD *)&self->_has & 8) == 0)
    return;
LABEL_13:
  *((_QWORD *)a3 + 4) = self->_connectionInitToIncomingFirstPacket;
  *((_WORD *)a3 + 42) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 0x80u;
  }

  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_success;
    *(_WORD *)(v6 + 84) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 16) = self->_clientInitToDaemonOpenSocket;
  *(_WORD *)(v6 + 84) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_QWORD *)(v6 + 8) = self->_clientInitToClientOpenSocketHandler;
  *(_WORD *)(v6 + 84) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *(_QWORD *)(v6 + 24) = self->_clientOpenSocketHandlerToIncomingFirstPacket;
  *(_WORD *)(v6 + 84) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *(_QWORD *)(v6 + 56) = self->_daemonOpenSocketToDaemonCompletionHandler;
  *(_WORD *)(v6 + 84) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
LABEL_19:
    *(_QWORD *)(v6 + 48) = self->_daemonCompletionHandlerToIncomingFirstPacket;
    *(_WORD *)(v6 + 84) |= 0x20u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      return (id)v6;
    goto LABEL_11;
  }
LABEL_18:
  *(_QWORD *)(v6 + 40) = self->_daemonCompletionHandlerToClientOpenSocketCompletion;
  *(_WORD *)(v6 + 84) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 8) != 0)
  {
LABEL_11:
    *(_QWORD *)(v6 + 32) = self->_connectionInitToIncomingFirstPacket;
    *(_WORD *)(v6 + 84) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *serviceName;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 42);
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_timestamp != *((_QWORD *)a3 + 8))
      goto LABEL_52;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  serviceName = self->_serviceName;
  if ((unint64_t)serviceName | *((_QWORD *)a3 + 9))
  {
    v5 = -[NSString isEqual:](serviceName, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)a3 + 42);
  if ((has & 0x100) == 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x100) != 0)
      goto LABEL_52;
    goto LABEL_18;
  }
  if ((*((_WORD *)a3 + 42) & 0x100) == 0)
    goto LABEL_52;
  if (self->_success)
  {
    if (!*((_BYTE *)a3 + 80))
      goto LABEL_52;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 80))
  {
LABEL_52:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_clientInitToDaemonOpenSocket != *((_QWORD *)a3 + 2))
      goto LABEL_52;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_clientInitToClientOpenSocketHandler != *((_QWORD *)a3 + 1))
      goto LABEL_52;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_clientOpenSocketHandlerToIncomingFirstPacket != *((_QWORD *)a3 + 3))
      goto LABEL_52;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_daemonOpenSocketToDaemonCompletionHandler != *((_QWORD *)a3 + 7))
      goto LABEL_52;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_daemonCompletionHandlerToClientOpenSocketCompletion != *((_QWORD *)a3 + 5))
      goto LABEL_52;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_daemonCompletionHandlerToIncomingFirstPacket != *((_QWORD *)a3 + 6))
      goto LABEL_52;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  LOBYTE(v5) = (v9 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_connectionInitToIncomingFirstPacket != *((_QWORD *)a3 + 4))
      goto LABEL_52;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  __int16 has;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_serviceName, "hash");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v6 = 2654435761 * self->_success;
    if ((has & 2) != 0)
    {
LABEL_6:
      v7 = 2654435761u * self->_clientInitToDaemonOpenSocket;
      if ((has & 1) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
    if ((has & 2) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_clientInitToClientOpenSocketHandler;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_clientOpenSocketHandlerToIncomingFirstPacket;
    if ((has & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_daemonOpenSocketToDaemonCompletionHandler;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_daemonCompletionHandlerToClientOpenSocketCompletion;
    if ((has & 0x20) != 0)
      goto LABEL_11;
LABEL_19:
    v12 = 0;
    if ((has & 8) != 0)
      goto LABEL_12;
LABEL_20:
    v13 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_18:
  v11 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_19;
LABEL_11:
  v12 = 2654435761u * self->_daemonCompletionHandlerToIncomingFirstPacket;
  if ((has & 8) == 0)
    goto LABEL_20;
LABEL_12:
  v13 = 2654435761u * self->_connectionInitToIncomingFirstPacket;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if ((*((_WORD *)a3 + 42) & 0x80) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)a3 + 9))
    -[AWDIDSDeviceConnectionDurationEvent setServiceName:](self, "setServiceName:");
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x100) != 0)
  {
    self->_success = *((_BYTE *)a3 + 80);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)a3 + 42);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_clientInitToDaemonOpenSocket = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_clientInitToClientOpenSocketHandler = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  self->_clientOpenSocketHandlerToIncomingFirstPacket = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  self->_daemonOpenSocketToDaemonCompletionHandler = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  self->_daemonCompletionHandlerToClientOpenSocketCompletion = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0)
      return;
    goto LABEL_13;
  }
LABEL_21:
  self->_daemonCompletionHandlerToIncomingFirstPacket = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 42) & 8) == 0)
    return;
LABEL_13:
  self->_connectionInitToIncomingFirstPacket = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)success
{
  return self->_success;
}

- (unint64_t)clientInitToDaemonOpenSocket
{
  return self->_clientInitToDaemonOpenSocket;
}

- (unint64_t)clientInitToClientOpenSocketHandler
{
  return self->_clientInitToClientOpenSocketHandler;
}

- (unint64_t)clientOpenSocketHandlerToIncomingFirstPacket
{
  return self->_clientOpenSocketHandlerToIncomingFirstPacket;
}

- (unint64_t)daemonOpenSocketToDaemonCompletionHandler
{
  return self->_daemonOpenSocketToDaemonCompletionHandler;
}

- (unint64_t)daemonCompletionHandlerToClientOpenSocketCompletion
{
  return self->_daemonCompletionHandlerToClientOpenSocketCompletion;
}

- (unint64_t)daemonCompletionHandlerToIncomingFirstPacket
{
  return self->_daemonCompletionHandlerToIncomingFirstPacket;
}

- (unint64_t)connectionInitToIncomingFirstPacket
{
  return self->_connectionInitToIncomingFirstPacket;
}

@end
