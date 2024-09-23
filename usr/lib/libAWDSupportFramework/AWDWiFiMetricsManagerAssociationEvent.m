@implementation AWDWiFiMetricsManagerAssociationEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerAssociationEvent setEventInfo:](self, "setEventInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAssociationEvent;
  -[AWDWiFiMetricsManagerAssociationEvent dealloc](&v3, sel_dealloc);
}

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

- (BOOL)hasEventInfo
{
  return self->_eventInfo != 0;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E610 + a3);
}

- (int)StringAsEventType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("APPLE80211_JOINASSOC_AUTH_EVENT")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("APPLE80211_JOINASSOC_ASSOC_START_EVENT")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("APPLE80211_JOINASSOC_ASSOC_DONE_EVENT")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("APPLE80211_JOINASSOC_LINK_STATUS_EVENT")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("APPLE80211_JOINASSOC_LINK_CHANGE_EVENT")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("APPLE80211_JOINASSOC_SSID_CHANGE_EVENT")))
    return 5;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAssociationEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerAssociationEvent description](&v3, sel_description), -[AWDWiFiMetricsManagerAssociationEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiMetricsManagerEvent *eventInfo;
  uint64_t eventType;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  eventInfo = self->_eventInfo;
  if (eventInfo)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerEvent dictionaryRepresentation](eventInfo, "dictionaryRepresentation"), CFSTR("eventInfo"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 6)
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    else
      v6 = (uint64_t)*(&off_24C10E610 + eventType);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("eventType"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAssociationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_eventInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
  }
  if (self->_eventInfo)
    objc_msgSend(a3, "setEventInfo:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_eventType;
    *((_BYTE *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 28) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[AWDWiFiMetricsManagerEvent copyWithZone:](self->_eventInfo, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_eventType;
    *(_BYTE *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  AWDWiFiMetricsManagerEvent *eventInfo;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    eventInfo = self->_eventInfo;
    if ((unint64_t)eventInfo | *((_QWORD *)a3 + 2))
    {
      v5 = -[AWDWiFiMetricsManagerEvent isEqual:](eventInfo, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_eventType != *((_DWORD *)a3 + 6))
        goto LABEL_14;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDWiFiMetricsManagerEvent hash](self->_eventInfo, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_eventType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiMetricsManagerEvent *eventInfo;
  uint64_t v6;

  if ((*((_BYTE *)a3 + 28) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  eventInfo = self->_eventInfo;
  v6 = *((_QWORD *)a3 + 2);
  if (eventInfo)
  {
    if (v6)
      -[AWDWiFiMetricsManagerEvent mergeFrom:](eventInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerAssociationEvent setEventInfo:](self, "setEventInfo:");
  }
  if ((*((_BYTE *)a3 + 28) & 2) != 0)
  {
    self->_eventType = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiMetricsManagerEvent)eventInfo
{
  return self->_eventInfo;
}

- (void)setEventInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
