@implementation AWDPowerAudioMetrics

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerAudioMetrics;
  -[AWDPowerAudioMetrics dealloc](&v3, sel_dealloc);
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

- (void)setAudioSpeakerPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_audioSpeakerPowerMicroWatt = a3;
}

- (void)setHasAudioSpeakerPowerMicroWatt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAudioSpeakerPowerMicroWatt
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAudioHeadsetPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_audioHeadsetPowerMicroWatt = a3;
}

- (void)setHasAudioHeadsetPowerMicroWatt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAudioHeadsetPowerMicroWatt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAudioSpeakerDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_audioSpeakerDuration = a3;
}

- (void)setHasAudioSpeakerDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAudioSpeakerDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAudioHeadsetDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioHeadsetDuration = a3;
}

- (void)setHasAudioHeadsetDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioHeadsetDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)audioVolumeLevelDurationsCount
{
  return self->_audioVolumeLevelDurations.count;
}

- (unsigned)audioVolumeLevelDurations
{
  return self->_audioVolumeLevelDurations.list;
}

- (void)clearAudioVolumeLevelDurations
{
  PBRepeatedUInt32Clear();
}

- (void)addAudioVolumeLevelDuration:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)audioVolumeLevelDurationAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_audioVolumeLevelDurations;
  unint64_t count;

  p_audioVolumeLevelDurations = &self->_audioVolumeLevelDurations;
  count = self->_audioVolumeLevelDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_audioVolumeLevelDurations->list[a3];
}

- (void)setAudioVolumeLevelDurations:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)audioVolumeLevelDurationSpeakersCount
{
  return self->_audioVolumeLevelDurationSpeakers.count;
}

- (unsigned)audioVolumeLevelDurationSpeakers
{
  return self->_audioVolumeLevelDurationSpeakers.list;
}

- (void)clearAudioVolumeLevelDurationSpeakers
{
  PBRepeatedUInt32Clear();
}

- (void)addAudioVolumeLevelDurationSpeaker:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)audioVolumeLevelDurationSpeakerAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_audioVolumeLevelDurationSpeakers;
  unint64_t count;

  p_audioVolumeLevelDurationSpeakers = &self->_audioVolumeLevelDurationSpeakers;
  count = self->_audioVolumeLevelDurationSpeakers.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_audioVolumeLevelDurationSpeakers->list[a3];
}

- (void)setAudioVolumeLevelDurationSpeakers:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerAudioMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerAudioMetrics description](&v3, sel_description), -[AWDPowerAudioMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
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
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioSpeakerPowerMicroWatt), CFSTR("audioSpeakerPowerMicroWatt"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioSpeakerDuration), CFSTR("audioSpeakerDuration"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioHeadsetPowerMicroWatt), CFSTR("audioHeadsetPowerMicroWatt"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioHeadsetDuration), CFSTR("audioHeadsetDuration"));
LABEL_7:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("audioVolumeLevelDuration"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("audioVolumeLevelDurationSpeaker"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerAudioMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_audioVolumeLevelDurationSpeakers;
  unint64_t v7;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_audioVolumeLevelDurations.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_audioVolumeLevelDurations.count);
  }
  p_audioVolumeLevelDurationSpeakers = &self->_audioVolumeLevelDurationSpeakers;
  if (p_audioVolumeLevelDurationSpeakers->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < p_audioVolumeLevelDurationSpeakers->count);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_BYTE *)a3 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 19) = self->_audioSpeakerPowerMicroWatt;
  *((_BYTE *)a3 + 80) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_19:
    *((_DWORD *)a3 + 18) = self->_audioSpeakerDuration;
    *((_BYTE *)a3 + 80) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  *((_DWORD *)a3 + 17) = self->_audioHeadsetPowerMicroWatt;
  *((_BYTE *)a3 + 80) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 16) = self->_audioHeadsetDuration;
    *((_BYTE *)a3 + 80) |= 2u;
  }
LABEL_7:
  if (-[AWDPowerAudioMetrics audioVolumeLevelDurationsCount](self, "audioVolumeLevelDurationsCount"))
  {
    objc_msgSend(a3, "clearAudioVolumeLevelDurations");
    v6 = -[AWDPowerAudioMetrics audioVolumeLevelDurationsCount](self, "audioVolumeLevelDurationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addAudioVolumeLevelDuration:", -[AWDPowerAudioMetrics audioVolumeLevelDurationAtIndex:](self, "audioVolumeLevelDurationAtIndex:", i));
    }
  }
  if (-[AWDPowerAudioMetrics audioVolumeLevelDurationSpeakersCount](self, "audioVolumeLevelDurationSpeakersCount"))
  {
    objc_msgSend(a3, "clearAudioVolumeLevelDurationSpeakers");
    v9 = -[AWDPowerAudioMetrics audioVolumeLevelDurationSpeakersCount](self, "audioVolumeLevelDurationSpeakersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addAudioVolumeLevelDurationSpeaker:", -[AWDPowerAudioMetrics audioVolumeLevelDurationSpeakerAtIndex:](self, "audioVolumeLevelDurationSpeakerAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v4 + 56) = self->_timestamp;
    *(_BYTE *)(v4 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 76) = self->_audioSpeakerPowerMicroWatt;
  *(_BYTE *)(v4 + 80) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v4 + 72) = self->_audioSpeakerDuration;
    *(_BYTE *)(v4 + 80) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 68) = self->_audioHeadsetPowerMicroWatt;
  *(_BYTE *)(v4 + 80) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 64) = self->_audioHeadsetDuration;
    *(_BYTE *)(v4 + 80) |= 2u;
  }
LABEL_7:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 0x10) == 0 || self->_audioSpeakerPowerMicroWatt != *((_DWORD *)a3 + 19))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 4) == 0 || self->_audioHeadsetPowerMicroWatt != *((_DWORD *)a3 + 17))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 8) == 0 || self->_audioSpeakerDuration != *((_DWORD *)a3 + 18))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 8) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 2) == 0 || self->_audioHeadsetDuration != *((_DWORD *)a3 + 16))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 2) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual())
    return PBRepeatedUInt32IsEqual();
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_audioSpeakerPowerMicroWatt;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_audioHeadsetPowerMicroWatt;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_audioSpeakerDuration;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_audioHeadsetDuration;
LABEL_12:
  v7 = v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt32Hash();
  return v7 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;

  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 80);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)a3 + 80) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_audioSpeakerPowerMicroWatt = *((_DWORD *)a3 + 19);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_audioHeadsetPowerMicroWatt = *((_DWORD *)a3 + 17);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  self->_audioSpeakerDuration = *((_DWORD *)a3 + 18);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 80) & 2) != 0)
  {
LABEL_6:
    self->_audioHeadsetDuration = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  v6 = objc_msgSend(a3, "audioVolumeLevelDurationsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDPowerAudioMetrics addAudioVolumeLevelDuration:](self, "addAudioVolumeLevelDuration:", objc_msgSend(a3, "audioVolumeLevelDurationAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "audioVolumeLevelDurationSpeakersCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDPowerAudioMetrics addAudioVolumeLevelDurationSpeaker:](self, "addAudioVolumeLevelDurationSpeaker:", objc_msgSend(a3, "audioVolumeLevelDurationSpeakerAtIndex:", j));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)audioSpeakerPowerMicroWatt
{
  return self->_audioSpeakerPowerMicroWatt;
}

- (unsigned)audioHeadsetPowerMicroWatt
{
  return self->_audioHeadsetPowerMicroWatt;
}

- (unsigned)audioSpeakerDuration
{
  return self->_audioSpeakerDuration;
}

- (unsigned)audioHeadsetDuration
{
  return self->_audioHeadsetDuration;
}

@end
