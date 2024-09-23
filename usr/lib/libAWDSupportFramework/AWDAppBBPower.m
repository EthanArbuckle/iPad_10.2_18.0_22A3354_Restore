@implementation AWDAppBBPower

- (void)dealloc
{
  objc_super v3;

  -[AWDAppBBPower setBundleName:](self, "setBundleName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDAppBBPower;
  -[AWDAppBBPower dealloc](&v3, sel_dealloc);
}

- (int)rAT
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_rAT;
  else
    return 0;
}

- (void)setRAT:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rAT = a3;
}

- (void)setHasRAT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRAT
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)rATAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DEB8[a3];
}

- (int)StringAsRAT:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_UMTS")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_GSM")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_WCDMA")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_1xEVDO")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_LTE")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_TDSCDMA")) & 1) != 0)
    return 6;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RAT_TYPE_TDLTE")))
    return 7;
  return 0;
}

- (BOOL)hasBundleName
{
  return self->_bundleName != 0;
}

- (void)setPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_powerMicroWatt = a3;
}

- (void)setHasPowerMicroWatt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPowerMicroWatt
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDAppBBPower;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDAppBBPower description](&v3, sel_description), -[AWDAppBBPower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t rAT;
  __CFString *v5;
  NSString *bundleName;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    rAT = self->_rAT;
    if (rAT >= 8)
      v5 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rAT);
    else
      v5 = off_24C10DEB8[rAT];
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("RAT"));
  }
  bundleName = self->_bundleName;
  if (bundleName)
    objc_msgSend(v3, "setObject:forKey:", bundleName, CFSTR("bundleName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_powerMicroWatt), CFSTR("powerMicroWatt"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDAppBBPowerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bundleName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_rAT;
    *((_BYTE *)a3 + 24) |= 2u;
  }
  if (self->_bundleName)
    objc_msgSend(a3, "setBundleName:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_powerMicroWatt;
    *((_BYTE *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_rAT;
    *(_BYTE *)(v5 + 24) |= 2u;
  }

  *(_QWORD *)(v6 + 8) = -[NSString copyWithZone:](self->_bundleName, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_powerMicroWatt;
    *(_BYTE *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *bundleName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_rAT != *((_DWORD *)a3 + 5))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    bundleName = self->_bundleName;
    if ((unint64_t)bundleName | *((_QWORD *)a3 + 1))
    {
      v5 = -[NSString isEqual:](bundleName, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_powerMicroWatt != *((_DWORD *)a3 + 4))
        goto LABEL_14;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_rAT;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_powerMicroWatt;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 2) != 0)
  {
    self->_rAT = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 1))
    -[AWDAppBBPower setBundleName:](self, "setBundleName:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_powerMicroWatt = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)powerMicroWatt
{
  return self->_powerMicroWatt;
}

@end
