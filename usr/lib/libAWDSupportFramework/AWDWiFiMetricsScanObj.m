@implementation AWDWiFiMetricsScanObj

- (void)setScanType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_scanType = a3;
}

- (void)setHasScanType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScanType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumScans:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numScans = a3;
}

- (void)setHasNumScans:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumScans
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDurScans:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_durScans = a3;
}

- (void)setHasDurScans:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurScans
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsScanObj;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsScanObj description](&v3, sel_description), -[AWDWiFiMetricsScanObj dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numScans), CFSTR("num_scans"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanType), CFSTR("scan_type"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durScans), CFSTR("dur_scans"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsScanObjReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_scanType;
    *((_BYTE *)a3 + 20) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_durScans;
      *((_BYTE *)a3 + 20) |= 1u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_numScans;
  *((_BYTE *)a3 + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_scanType;
    *((_BYTE *)result + 20) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_numScans;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_durScans;
  *((_BYTE *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 4) == 0 || self->_scanType != *((_DWORD *)a3 + 4))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 20) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 2) == 0 || self->_numScans != *((_DWORD *)a3 + 3))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 20) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_durScans != *((_DWORD *)a3 + 2))
        goto LABEL_16;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_scanType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_numScans;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_durScans;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 20);
  if ((v3 & 4) != 0)
  {
    self->_scanType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        return;
LABEL_7:
      self->_durScans = *((_DWORD *)a3 + 2);
      *(_BYTE *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_numScans = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
    goto LABEL_7;
}

- (unsigned)scanType
{
  return self->_scanType;
}

- (unsigned)numScans
{
  return self->_numScans;
}

- (unsigned)durScans
{
  return self->_durScans;
}

@end
