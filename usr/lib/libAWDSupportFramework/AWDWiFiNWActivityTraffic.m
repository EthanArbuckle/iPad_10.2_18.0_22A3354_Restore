@implementation AWDWiFiNWActivityTraffic

- (void)setValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)traffic
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_traffic;
  else
    return 0;
}

- (void)setTraffic:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_traffic = a3;
}

- (void)setHasTraffic:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTraffic
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)trafficAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E6A0 + a3);
}

- (int)StringAsTraffic:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Rx")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Tx")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TxBK")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TxBE")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TxVO")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("TxVI")))
    return 5;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityTraffic;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityTraffic description](&v3, sel_description), -[AWDWiFiNWActivityTraffic dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t traffic;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_value), CFSTR("value"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    traffic = self->_traffic;
    if (traffic >= 6)
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_traffic);
    else
      v6 = (uint64_t)*(&off_24C10E6A0 + traffic);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("traffic"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityTrafficReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return;
LABEL_5:
    *((_DWORD *)a3 + 4) = self->_traffic;
    *((_BYTE *)a3 + 20) |= 2u;
    return;
  }
  *((_QWORD *)a3 + 1) = self->_value;
  *((_BYTE *)a3 + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_value;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_traffic;
    *((_BYTE *)result + 20) |= 2u;
  }
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
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_value != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 2) == 0 || self->_traffic != *((_DWORD *)a3 + 4))
        goto LABEL_11;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_value;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_traffic;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 20) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 20) & 2) == 0)
      return;
LABEL_5:
    self->_traffic = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
  self->_value = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 20) & 2) != 0)
    goto LABEL_5;
}

- (unint64_t)value
{
  return self->_value;
}

@end
