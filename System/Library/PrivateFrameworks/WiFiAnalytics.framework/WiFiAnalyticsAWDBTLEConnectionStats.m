@implementation WiFiAnalyticsAWDBTLEConnectionStats

- (void)setStart:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStart
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setComplete:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_complete = a3;
}

- (void)setHasComplete:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasComplete
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPeakOutage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_peakOutage = a3;
}

- (void)setHasPeakOutage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPeakOutage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTotalDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDc0:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dc0 = a3;
}

- (void)setHasDc0:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDc0
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDc1:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dc1 = a3;
}

- (void)setHasDc1:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDc1
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDc2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dc2 = a3;
}

- (void)setHasDc2:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDc2
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDc3:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dc3 = a3;
}

- (void)setHasDc3:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDc3
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDc4:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dc4 = a3;
}

- (void)setHasDc4:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDc4
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDc5:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_dc5 = a3;
}

- (void)setHasDc5:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDc5
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDBTLEConnectionStats;
  -[WiFiAnalyticsAWDBTLEConnectionStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDBTLEConnectionStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_start);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("start"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_complete);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("complete"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peakOutage);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("peakOutage"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("totalDuration"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dc0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dc0"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dc1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("dc1"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dc2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dc2"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dc4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("dc4"));

    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dc3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dc3"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x40) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dc5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dc5"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDBTLEConnectionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
LABEL_21:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x40) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = self->_start;
    *((_WORD *)v4 + 24) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_complete;
  *((_WORD *)v4 + 24) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v4[9] = self->_peakOutage;
  *((_WORD *)v4 + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v4[11] = self->_totalDuration;
  *((_WORD *)v4 + 24) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v4[3] = self->_dc0;
  *((_WORD *)v4 + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v4[4] = self->_dc1;
  *((_WORD *)v4 + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v4[5] = self->_dc2;
  *((_WORD *)v4 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
LABEL_21:
    v4[7] = self->_dc4;
    *((_WORD *)v4 + 24) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  v4[6] = self->_dc3;
  *((_WORD *)v4 + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x40) != 0)
  {
LABEL_11:
    v4[8] = self->_dc5;
    *((_WORD *)v4 + 24) |= 0x40u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = self->_start;
    *((_WORD *)result + 24) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_complete;
  *((_WORD *)result + 24) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 9) = self->_peakOutage;
  *((_WORD *)result + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 11) = self->_totalDuration;
  *((_WORD *)result + 24) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 3) = self->_dc0;
  *((_WORD *)result + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_dc1;
  *((_WORD *)result + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 5) = self->_dc2;
  *((_WORD *)result + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 6) = self->_dc3;
  *((_WORD *)result + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 7) = self->_dc4;
  *((_WORD *)result + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return result;
LABEL_11:
  *((_DWORD *)result + 8) = self->_dc5;
  *((_WORD *)result + 24) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 24);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_start != *((_DWORD *)v4 + 10))
      goto LABEL_52;
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
LABEL_52:
    v7 = 0;
    goto LABEL_53;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_complete != *((_DWORD *)v4 + 2))
      goto LABEL_52;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_peakOutage != *((_DWORD *)v4 + 9))
      goto LABEL_52;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) == 0 || self->_totalDuration != *((_DWORD *)v4 + 11))
      goto LABEL_52;
  }
  else if ((*((_WORD *)v4 + 24) & 0x200) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dc0 != *((_DWORD *)v4 + 3))
      goto LABEL_52;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dc1 != *((_DWORD *)v4 + 4))
      goto LABEL_52;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dc2 != *((_DWORD *)v4 + 5))
      goto LABEL_52;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dc3 != *((_DWORD *)v4 + 6))
      goto LABEL_52;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dc4 != *((_DWORD *)v4 + 7))
      goto LABEL_52;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_dc5 != *((_DWORD *)v4 + 8))
      goto LABEL_52;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x40) == 0;
  }
LABEL_53:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v3 = 2654435761 * self->_start;
    if ((has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_complete;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_peakOutage;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_totalDuration;
    if ((has & 2) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_dc0;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_dc1;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_dc2;
    if ((has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_dc3;
    if ((has & 0x20) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_dc4;
  if ((has & 0x40) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_dc5;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) != 0)
  {
    self->_start = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_complete = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_peakOutage = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_totalDuration = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_dc0 = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_dc1 = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_dc2 = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
LABEL_21:
    self->_dc4 = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x20u;
    if ((*((_WORD *)v4 + 24) & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  self->_dc3 = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) != 0)
    goto LABEL_21;
LABEL_10:
  if ((v5 & 0x40) != 0)
  {
LABEL_11:
    self->_dc5 = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_12:

}

- (unsigned)start
{
  return self->_start;
}

- (unsigned)complete
{
  return self->_complete;
}

- (unsigned)peakOutage
{
  return self->_peakOutage;
}

- (unsigned)totalDuration
{
  return self->_totalDuration;
}

- (unsigned)dc0
{
  return self->_dc0;
}

- (unsigned)dc1
{
  return self->_dc1;
}

- (unsigned)dc2
{
  return self->_dc2;
}

- (unsigned)dc3
{
  return self->_dc3;
}

- (unsigned)dc4
{
  return self->_dc4;
}

- (unsigned)dc5
{
  return self->_dc5;
}

@end
