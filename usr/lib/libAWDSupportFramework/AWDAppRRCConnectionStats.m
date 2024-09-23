@implementation AWDAppRRCConnectionStats

- (void)dealloc
{
  objc_super v3;

  -[AWDAppRRCConnectionStats setBundleName:](self, "setBundleName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDAppRRCConnectionStats;
  -[AWDAppRRCConnectionStats dealloc](&v3, sel_dealloc);
}

- (int)rAT
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_rAT;
  else
    return 0;
}

- (void)setRAT:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_rAT = a3;
}

- (void)setHasRAT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRAT
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)rATAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DEF8[a3];
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

- (void)setBundleFGDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bundleFGDuration = a3;
}

- (void)setHasBundleFGDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBundleFGDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBundleBGDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bundleBGDuration = a3;
}

- (void)setHasBundleBGDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBundleBGDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumMOConnectionTriggered:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numMOConnectionTriggered = a3;
}

- (void)setHasNumMOConnectionTriggered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumMOConnectionTriggered
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumMTConnectionTriggered:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numMTConnectionTriggered = a3;
}

- (void)setHasNumMTConnectionTriggered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumMTConnectionTriggered
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalBytesTransferred:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_totalBytesTransferred = a3;
}

- (void)setHasTotalBytesTransferred:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalBytesTransferred
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDAppRRCConnectionStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDAppRRCConnectionStats description](&v3, sel_description), -[AWDAppRRCConnectionStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t rAT;
  __CFString *v5;
  NSString *bundleName;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    rAT = self->_rAT;
    if (rAT >= 8)
      v5 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rAT);
    else
      v5 = off_24C10DEF8[rAT];
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("RAT"));
  }
  bundleName = self->_bundleName;
  if (bundleName)
    objc_msgSend(v3, "setObject:forKey:", bundleName, CFSTR("bundleName"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bundleFGDuration), CFSTR("bundleFGDuration"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 4) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bundleBGDuration), CFSTR("bundleBGDuration"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMTConnectionTriggered), CFSTR("numMTConnectionTriggered"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMOConnectionTriggered), CFSTR("numMOConnectionTriggered"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_12:
  if ((has & 0x20) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalBytesTransferred), CFSTR("totalBytesTransferred"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDAppRRCConnectionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bundleName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_rAT;
    *((_BYTE *)a3 + 40) |= 0x10u;
  }
  if (self->_bundleName)
    objc_msgSend(a3, "setBundleName:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_bundleFGDuration;
    *((_BYTE *)a3 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 2) = self->_bundleBGDuration;
  *((_BYTE *)a3 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 6) = self->_numMOConnectionTriggered;
  *((_BYTE *)a3 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      return;
    goto LABEL_10;
  }
LABEL_15:
  *((_DWORD *)a3 + 7) = self->_numMTConnectionTriggered;
  *((_BYTE *)a3 + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return;
LABEL_10:
  *((_DWORD *)a3 + 9) = self->_totalBytesTransferred;
  *((_BYTE *)a3 + 40) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_rAT;
    *(_BYTE *)(v5 + 40) |= 0x10u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_bundleName, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_bundleFGDuration;
    *(_BYTE *)(v6 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 8) = self->_bundleBGDuration;
  *(_BYTE *)(v6 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_13:
    *(_DWORD *)(v6 + 28) = self->_numMTConnectionTriggered;
    *(_BYTE *)(v6 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v6;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 24) = self->_numMOConnectionTriggered;
  *(_BYTE *)(v6 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 36) = self->_totalBytesTransferred;
    *(_BYTE *)(v6 + 40) |= 0x20u;
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
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_rAT != *((_DWORD *)a3 + 8))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    bundleName = self->_bundleName;
    if ((unint64_t)bundleName | *((_QWORD *)a3 + 2))
    {
      v5 = -[NSString isEqual:](bundleName, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_bundleFGDuration != *((_DWORD *)a3 + 3))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_bundleBGDuration != *((_DWORD *)a3 + 2))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_numMOConnectionTriggered != *((_DWORD *)a3 + 6))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_numMTConnectionTriggered != *((_DWORD *)a3 + 7))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 40) & 8) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x20) == 0 || self->_totalBytesTransferred != *((_DWORD *)a3 + 9))
        goto LABEL_34;
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_rAT;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_bundleFGDuration;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_bundleBGDuration;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_numMOConnectionTriggered;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = 2654435761 * self->_numMTConnectionTriggered;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v9 = 2654435761 * self->_totalBytesTransferred;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
  {
    self->_rAT = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDAppRRCConnectionStats setBundleName:](self, "setBundleName:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_bundleFGDuration = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_bundleBGDuration = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  self->_numMOConnectionTriggered = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      return;
    goto LABEL_10;
  }
LABEL_15:
  self->_numMTConnectionTriggered = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 40) & 0x20) == 0)
    return;
LABEL_10:
  self->_totalBytesTransferred = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x20u;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)bundleFGDuration
{
  return self->_bundleFGDuration;
}

- (unsigned)bundleBGDuration
{
  return self->_bundleBGDuration;
}

- (unsigned)numMOConnectionTriggered
{
  return self->_numMOConnectionTriggered;
}

- (unsigned)numMTConnectionTriggered
{
  return self->_numMTConnectionTriggered;
}

- (unsigned)totalBytesTransferred
{
  return self->_totalBytesTransferred;
}

@end
