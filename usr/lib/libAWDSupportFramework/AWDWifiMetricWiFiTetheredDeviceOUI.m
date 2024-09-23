@implementation AWDWifiMetricWiFiTetheredDeviceOUI

- (void)dealloc
{
  objc_super v3;

  -[AWDWifiMetricWiFiTetheredDeviceOUI setTetheredOUI:](self, "setTetheredOUI:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMetricWiFiTetheredDeviceOUI;
  -[AWDWifiMetricWiFiTetheredDeviceOUI dealloc](&v3, sel_dealloc);
}

- (BOOL)hasTetheredOUI
{
  return self->_tetheredOUI != 0;
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMetricWiFiTetheredDeviceOUI;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiMetricWiFiTetheredDeviceOUI description](&v3, sel_description), -[AWDWifiMetricWiFiTetheredDeviceOUI dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *tetheredOUI;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  tetheredOUI = self->_tetheredOUI;
  if (tetheredOUI)
    objc_msgSend(v3, "setObject:forKey:", tetheredOUI, CFSTR("tetheredOUI"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiMetricWiFiTetheredDeviceOUIReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_tetheredOUI)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if (self->_tetheredOUI)
    objc_msgSend(a3, "setTetheredOUI:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSData copyWithZone:](self->_tetheredOUI, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *tetheredOUI;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    tetheredOUI = self->_tetheredOUI;
    if (!((unint64_t)tetheredOUI | *((_QWORD *)a3 + 2))
      || (v5 = -[NSData isEqual:](tetheredOUI, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_timestamp == *((_QWORD *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSData hash](self->_tetheredOUI, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_timestamp;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[AWDWifiMetricWiFiTetheredDeviceOUI setTetheredOUI:](self, "setTetheredOUI:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSData)tetheredOUI
{
  return self->_tetheredOUI;
}

- (void)setTetheredOUI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
