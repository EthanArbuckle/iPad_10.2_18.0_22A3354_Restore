@implementation AWDNetworkUsage

- (void)dealloc
{
  objc_super v3;

  -[AWDNetworkUsage setBundleName:](self, "setBundleName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkUsage;
  -[AWDNetworkUsage dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBundleName
{
  return self->_bundleName != 0;
}

- (void)setWifiIn:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wifiIn = a3;
}

- (void)setHasWifiIn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWifiIn
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWifiOut:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_wifiOut = a3;
}

- (void)setHasWifiOut:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifiOut
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCellIn:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cellIn = a3;
}

- (void)setHasCellIn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellIn
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCellOut:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cellOut = a3;
}

- (void)setHasCellOut:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellOut
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumConnections:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numConnections = a3;
}

- (void)setHasNumConnections:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumConnections
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkUsage;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNetworkUsage description](&v3, sel_description), -[AWDNetworkUsage dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleName;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  bundleName = self->_bundleName;
  if (bundleName)
    objc_msgSend(v3, "setObject:forKey:", bundleName, CFSTR("bundleName"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wifiIn), CFSTR("wifiIn"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wifiOut), CFSTR("wifiOut"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_13:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cellOut), CFSTR("cellOut"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v4;
    goto LABEL_8;
  }
LABEL_12:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cellIn), CFSTR("cellIn"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x10) != 0)
LABEL_8:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numConnections), CFSTR("numConnections"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_bundleName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_bundleName)
    objc_msgSend(a3, "setBundleName:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_wifiIn;
    *((_BYTE *)a3 + 52) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)a3 + 4) = self->_wifiOut;
  *((_BYTE *)a3 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_cellIn;
  *((_BYTE *)a3 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      return;
    goto LABEL_8;
  }
LABEL_13:
  *((_QWORD *)a3 + 2) = self->_cellOut;
  *((_BYTE *)a3 + 52) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return;
LABEL_8:
  *((_DWORD *)a3 + 12) = self->_numConnections;
  *((_BYTE *)a3 + 52) |= 0x10u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_bundleName, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_wifiIn;
    *(_BYTE *)(v5 + 52) |= 4u;
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
  *(_QWORD *)(v5 + 32) = self->_wifiOut;
  *(_BYTE *)(v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    *(_QWORD *)(v5 + 16) = self->_cellOut;
    *(_BYTE *)(v5 + 52) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_6;
  }
LABEL_10:
  *(_QWORD *)(v5 + 8) = self->_cellIn;
  *(_BYTE *)(v5 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 48) = self->_numConnections;
    *(_BYTE *)(v5 + 52) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *bundleName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    bundleName = self->_bundleName;
    if (!((unint64_t)bundleName | *((_QWORD *)a3 + 5))
      || (v5 = -[NSString isEqual:](bundleName, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_wifiIn != *((_QWORD *)a3 + 3))
          goto LABEL_28;
      }
      else if ((*((_BYTE *)a3 + 52) & 4) != 0)
      {
LABEL_28:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_wifiOut != *((_QWORD *)a3 + 4))
          goto LABEL_28;
      }
      else if ((*((_BYTE *)a3 + 52) & 8) != 0)
      {
        goto LABEL_28;
      }
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_cellIn != *((_QWORD *)a3 + 1))
          goto LABEL_28;
      }
      else if ((*((_BYTE *)a3 + 52) & 1) != 0)
      {
        goto LABEL_28;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_cellOut != *((_QWORD *)a3 + 2))
          goto LABEL_28;
      }
      else if ((*((_BYTE *)a3 + 52) & 2) != 0)
      {
        goto LABEL_28;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 0x10) == 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_numConnections != *((_DWORD *)a3 + 12))
          goto LABEL_28;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_bundleName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761u * self->_wifiIn;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_wifiOut;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_cellIn;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761u * self->_cellOut;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_numConnections;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 5))
    -[AWDNetworkUsage setBundleName:](self, "setBundleName:");
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_wifiIn = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 52);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_wifiOut = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  self->_cellIn = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      return;
    goto LABEL_8;
  }
LABEL_13:
  self->_cellOut = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 52) & 0x10) == 0)
    return;
LABEL_8:
  self->_numConnections = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)wifiIn
{
  return self->_wifiIn;
}

- (unint64_t)wifiOut
{
  return self->_wifiOut;
}

- (unint64_t)cellIn
{
  return self->_cellIn;
}

- (unint64_t)cellOut
{
  return self->_cellOut;
}

- (unsigned)numConnections
{
  return self->_numConnections;
}

@end
