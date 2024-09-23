@implementation AWDPowerTouchMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTouchStateActiveDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_touchStateActiveDuration = a3;
}

- (void)setHasTouchStateActiveDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTouchStateActiveDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTouchStateReadyDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_touchStateReadyDuration = a3;
}

- (void)setHasTouchStateReadyDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTouchStateReadyDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTouchStateAnticipateDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_touchStateAnticipateDuration = a3;
}

- (void)setHasTouchStateAnticipateDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTouchStateAnticipateDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTouchStateOffDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_touchStateOffDuration = a3;
}

- (void)setHasTouchStateOffDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTouchStateOffDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTouchStateOnDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_touchStateOnDuration = a3;
}

- (void)setHasTouchStateOnDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTouchStateOnDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTouchStateOthersDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_touchStateOthersDuration = a3;
}

- (void)setHasTouchStateOthersDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTouchStateOthersDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTouchTotalPowerMicroWatt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_touchTotalPowerMicroWatt = a3;
}

- (void)setHasTouchTotalPowerMicroWatt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTouchTotalPowerMicroWatt
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTouchTotalUserTouchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_touchTotalUserTouchCount = a3;
}

- (void)setHasTouchTotalUserTouchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTouchTotalUserTouchCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTocuhTotalUserInteractionDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_tocuhTotalUserInteractionDuration = a3;
}

- (void)setHasTocuhTotalUserInteractionDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTocuhTotalUserInteractionDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerTouchMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerTouchMetrics description](&v3, sel_description), -[AWDPowerTouchMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchStateActiveDuration), CFSTR("touchStateActiveDuration"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchStateReadyDuration), CFSTR("touchStateReadyDuration"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchStateAnticipateDuration), CFSTR("touchStateAnticipateDuration"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchStateOffDuration), CFSTR("touchStateOffDuration"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchStateOnDuration), CFSTR("touchStateOnDuration"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchStateOthersDuration), CFSTR("touchStateOthersDuration"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchTotalUserTouchCount), CFSTR("touchTotalUserTouchCount"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_touchTotalPowerMicroWatt), CFSTR("touchTotalPowerMicroWatt"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 2) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tocuhTotalUserInteractionDuration), CFSTR("tocuhTotalUserInteractionDuration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerTouchMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return;
LABEL_21:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_touchStateActiveDuration;
  *((_WORD *)a3 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_touchStateReadyDuration;
  *((_WORD *)a3 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 6) = self->_touchStateAnticipateDuration;
  *((_WORD *)a3 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 7) = self->_touchStateOffDuration;
  *((_WORD *)a3 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 8) = self->_touchStateOnDuration;
  *((_WORD *)a3 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_touchStateOthersDuration;
  *((_WORD *)a3 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_touchTotalPowerMicroWatt;
  *((_WORD *)a3 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return;
LABEL_21:
    *((_DWORD *)a3 + 4) = self->_tocuhTotalUserInteractionDuration;
    *((_WORD *)a3 + 26) |= 2u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 12) = self->_touchTotalUserTouchCount;
  *((_WORD *)a3 + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_touchStateActiveDuration;
  *((_WORD *)result + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_touchStateReadyDuration;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_touchStateAnticipateDuration;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_touchStateOffDuration;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_touchStateOnDuration;
  *((_WORD *)result + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_touchStateOthersDuration;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_touchTotalPowerMicroWatt;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 12) = self->_touchTotalUserTouchCount;
  *((_WORD *)result + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_11:
  *((_DWORD *)result + 4) = self->_tocuhTotalUserInteractionDuration;
  *((_WORD *)result + 26) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 26);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_51;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_touchStateActiveDuration != *((_DWORD *)a3 + 5))
        goto LABEL_51;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_touchStateReadyDuration != *((_DWORD *)a3 + 10))
        goto LABEL_51;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_touchStateAnticipateDuration != *((_DWORD *)a3 + 6))
        goto LABEL_51;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_touchStateOffDuration != *((_DWORD *)a3 + 7))
        goto LABEL_51;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_touchStateOnDuration != *((_DWORD *)a3 + 8))
        goto LABEL_51;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_touchStateOthersDuration != *((_DWORD *)a3 + 9))
        goto LABEL_51;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_touchTotalPowerMicroWatt != *((_DWORD *)a3 + 11))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x200) == 0 || self->_touchTotalUserTouchCount != *((_DWORD *)a3 + 12))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 26) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_tocuhTotalUserInteractionDuration != *((_DWORD *)a3 + 4))
        goto LABEL_51;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
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
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_touchStateActiveDuration;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_touchStateReadyDuration;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_touchStateAnticipateDuration;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_touchStateOffDuration;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_touchStateOnDuration;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_touchStateOthersDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_touchTotalPowerMicroWatt;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_touchTotalUserTouchCount;
  if ((has & 2) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_tocuhTotalUserInteractionDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v3 = *((_WORD *)a3 + 26);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_touchStateActiveDuration = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_touchStateReadyDuration = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_touchStateAnticipateDuration = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_touchStateOffDuration = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_touchStateOnDuration = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_touchStateOthersDuration = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_touchTotalPowerMicroWatt = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0)
      return;
LABEL_21:
    self->_tocuhTotalUserInteractionDuration = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_20:
  self->_touchTotalUserTouchCount = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 26) & 2) != 0)
    goto LABEL_21;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)touchStateActiveDuration
{
  return self->_touchStateActiveDuration;
}

- (unsigned)touchStateReadyDuration
{
  return self->_touchStateReadyDuration;
}

- (unsigned)touchStateAnticipateDuration
{
  return self->_touchStateAnticipateDuration;
}

- (unsigned)touchStateOffDuration
{
  return self->_touchStateOffDuration;
}

- (unsigned)touchStateOnDuration
{
  return self->_touchStateOnDuration;
}

- (unsigned)touchStateOthersDuration
{
  return self->_touchStateOthersDuration;
}

- (unsigned)touchTotalPowerMicroWatt
{
  return self->_touchTotalPowerMicroWatt;
}

- (unsigned)touchTotalUserTouchCount
{
  return self->_touchTotalUserTouchCount;
}

- (unsigned)tocuhTotalUserInteractionDuration
{
  return self->_tocuhTotalUserInteractionDuration;
}

@end
