@implementation AWDNanoPhoneIncomingCallPresented

- (void)dealloc
{
  objc_super v3;

  -[AWDNanoPhoneIncomingCallPresented setCallProviderIdentifier:](self, "setCallProviderIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNanoPhoneIncomingCallPresented;
  -[AWDNanoPhoneIncomingCallPresented dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setClientDisplayLatencyMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientDisplayLatencyMs = a3;
}

- (void)setHasClientDisplayLatencyMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientDisplayLatencyMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCallProviderIdentifier
{
  return self->_callProviderIdentifier != 0;
}

- (void)setIsVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsVideo
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsHosted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isHosted = a3;
}

- (void)setHasIsHosted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsHosted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNanoPhoneIncomingCallPresented;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNanoPhoneIncomingCallPresented description](&v3, sel_description), -[AWDNanoPhoneIncomingCallPresented dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *callProviderIdentifier;
  char v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_clientDisplayLatencyMs), CFSTR("clientDisplayLatencyMs"));
  callProviderIdentifier = self->_callProviderIdentifier;
  if (callProviderIdentifier)
    objc_msgSend(v3, "setObject:forKey:", callProviderIdentifier, CFSTR("callProviderIdentifier"));
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVideo), CFSTR("isVideo"));
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHosted), CFSTR("isHosted"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNanoPhoneIncomingCallPresentedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_callProviderIdentifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_clientDisplayLatencyMs;
    *((_BYTE *)a3 + 36) |= 1u;
  }
  if (self->_callProviderIdentifier)
    objc_msgSend(a3, "setCallProviderIdentifier:");
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_BYTE *)a3 + 33) = self->_isVideo;
    *((_BYTE *)a3 + 36) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_BYTE *)a3 + 32) = self->_isHosted;
    *((_BYTE *)a3 + 36) |= 4u;
  }
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
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_clientDisplayLatencyMs;
    *(_BYTE *)(v5 + 36) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_callProviderIdentifier, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    *(_BYTE *)(v6 + 33) = self->_isVideo;
    *(_BYTE *)(v6 + 36) |= 8u;
    v8 = (char)self->_has;
  }
  if ((v8 & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_isHosted;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *callProviderIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_clientDisplayLatencyMs != *((_QWORD *)a3 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    goto LABEL_25;
  }
  callProviderIdentifier = self->_callProviderIdentifier;
  if ((unint64_t)callProviderIdentifier | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](callProviderIdentifier, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 8) != 0)
    {
      if (self->_isVideo)
      {
        if (!*((_BYTE *)a3 + 33))
          goto LABEL_25;
        goto LABEL_23;
      }
      if (!*((_BYTE *)a3 + 33))
        goto LABEL_23;
    }
LABEL_25:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 36) & 8) != 0)
    goto LABEL_25;
LABEL_23:
  LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 4) == 0)
      goto LABEL_25;
    if (self->_isHosted)
    {
      if (!*((_BYTE *)a3 + 32))
        goto LABEL_25;
    }
    else if (*((_BYTE *)a3 + 32))
    {
      goto LABEL_25;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_clientDisplayLatencyMs;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_callProviderIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_isVideo;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_isHosted;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_clientDisplayLatencyMs = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDNanoPhoneIncomingCallPresented setCallProviderIdentifier:](self, "setCallProviderIdentifier:");
  v6 = *((_BYTE *)a3 + 36);
  if ((v6 & 8) != 0)
  {
    self->_isVideo = *((_BYTE *)a3 + 33);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)a3 + 36);
  }
  if ((v6 & 4) != 0)
  {
    self->_isHosted = *((_BYTE *)a3 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)clientDisplayLatencyMs
{
  return self->_clientDisplayLatencyMs;
}

- (NSString)callProviderIdentifier
{
  return self->_callProviderIdentifier;
}

- (void)setCallProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isHosted
{
  return self->_isHosted;
}

@end
