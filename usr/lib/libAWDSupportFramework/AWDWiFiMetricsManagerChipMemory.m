@implementation AWDWiFiMetricsManagerChipMemory

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

- (void)setHeapTotal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_heapTotal = a3;
}

- (void)setHasHeapTotal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHeapTotal
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHeapTotalMin:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_heapTotalMin = a3;
}

- (void)setHasHeapTotalMin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasHeapTotalMin
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHeapTotalMax:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_heapTotalMax = a3;
}

- (void)setHasHeapTotalMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasHeapTotalMax
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHeapFree:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_heapFree = a3;
}

- (void)setHasHeapFree:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHeapFree
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHeapFreeMin:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_heapFreeMin = a3;
}

- (void)setHasHeapFreeMin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHeapFreeMin
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHeapFreeMax:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_heapFreeMax = a3;
}

- (void)setHasHeapFreeMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeapFreeMax
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerChipMemory;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerChipMemory description](&v3, sel_description), -[AWDWiFiMetricsManagerChipMemory dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heapTotal), CFSTR("heapTotal"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heapTotalMin), CFSTR("heapTotal_min"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heapTotalMax), CFSTR("heapTotal_max"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heapFreeMin), CFSTR("heapFree_min"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heapFree), CFSTR("heapFree"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 4) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heapFreeMax), CFSTR("heapFree_max"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerChipMemoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_heapTotal;
  *((_BYTE *)a3 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 9) = self->_heapTotalMin;
  *((_BYTE *)a3 + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 8) = self->_heapTotalMax;
  *((_BYTE *)a3 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 4) = self->_heapFree;
  *((_BYTE *)a3 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return;
LABEL_15:
    *((_DWORD *)a3 + 5) = self->_heapFreeMax;
    *((_BYTE *)a3 + 40) |= 4u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 6) = self->_heapFreeMin;
  *((_BYTE *)a3 + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_15;
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
    *((_BYTE *)result + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_heapTotal;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 9) = self->_heapTotalMin;
  *((_BYTE *)result + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_heapTotalMax;
  *((_BYTE *)result + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 4) = self->_heapFree;
  *((_BYTE *)result + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 6) = self->_heapFreeMin;
  *((_BYTE *)result + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 5) = self->_heapFreeMax;
  *((_BYTE *)result + 40) |= 4u;
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
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_heapTotal != *((_DWORD *)a3 + 7))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x40) == 0 || self->_heapTotalMin != *((_DWORD *)a3 + 9))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x20) == 0 || self->_heapTotalMax != *((_DWORD *)a3 + 8))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_heapFree != *((_DWORD *)a3 + 4))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_heapFreeMin != *((_DWORD *)a3 + 6))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 8) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_heapFreeMax != *((_DWORD *)a3 + 5))
        goto LABEL_36;
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
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_heapTotal;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_heapTotalMin;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_heapTotalMax;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_heapFree;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_heapFreeMin;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_heapFreeMax;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 40);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_heapTotal = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_heapTotalMin = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_heapTotalMax = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_heapFree = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0)
      return;
LABEL_15:
    self->_heapFreeMax = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
LABEL_14:
  self->_heapFreeMin = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 40) & 4) != 0)
    goto LABEL_15;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)heapTotal
{
  return self->_heapTotal;
}

- (unsigned)heapTotalMin
{
  return self->_heapTotalMin;
}

- (unsigned)heapTotalMax
{
  return self->_heapTotalMax;
}

- (unsigned)heapFree
{
  return self->_heapFree;
}

- (unsigned)heapFreeMin
{
  return self->_heapFreeMin;
}

- (unsigned)heapFreeMax
{
  return self->_heapFreeMax;
}

@end
