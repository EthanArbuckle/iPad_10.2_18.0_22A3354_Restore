@implementation AWDWifiHardwareVersion

- (void)dealloc
{
  objc_super v3;

  -[AWDWifiHardwareVersion setHardwareVersion:](self, "setHardwareVersion:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiHardwareVersion;
  -[AWDWifiHardwareVersion dealloc](&v3, sel_dealloc);
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

- (BOOL)hasHardwareVersion
{
  return self->_hardwareVersion != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiHardwareVersion;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiHardwareVersion description](&v3, sel_description), -[AWDWifiHardwareVersion dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *hardwareVersion;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  hardwareVersion = self->_hardwareVersion;
  if (hardwareVersion)
    objc_msgSend(v3, "setObject:forKey:", hardwareVersion, CFSTR("hardwareVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiHardwareVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_hardwareVersion)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *hardwareVersion;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  hardwareVersion = self->_hardwareVersion;
  if (hardwareVersion)
    objc_msgSend(a3, "setHardwareVersion:", hardwareVersion);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 24) |= 1u;
  }

  v6[2] = -[NSString copyWithZone:](self->_hardwareVersion, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *hardwareVersion;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    hardwareVersion = self->_hardwareVersion;
    if ((unint64_t)hardwareVersion | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSString isEqual:](hardwareVersion, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  return -[NSString hash](self->_hardwareVersion, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDWifiHardwareVersion setHardwareVersion:](self, "setHardwareVersion:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
