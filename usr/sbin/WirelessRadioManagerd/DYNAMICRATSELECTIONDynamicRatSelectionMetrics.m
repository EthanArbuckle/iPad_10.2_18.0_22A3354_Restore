@implementation DYNAMICRATSELECTIONDynamicRatSelectionMetrics

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYNAMICRATSELECTIONDynamicRatSelectionMetrics;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[DYNAMICRATSELECTIONDynamicRatSelectionMetrics description](&v3, "description"), -[DYNAMICRATSELECTIONDynamicRatSelectionMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  __int16 has;
  uint64_t ratType;
  __CFString *v6;
  uint64_t bbChipset;
  __CFString *v8;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    ratType = self->_ratType;
    if (ratType >= 4)
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ratType);
    else
      v6 = off_100201980[ratType];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ratType"));
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    bbChipset = self->_bbChipset;
    if (bbChipset >= 3)
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_bbChipset);
    else
      v8 = off_1002019A0[bbChipset];
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bbChipset"));
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc), CFSTR("mcc"));
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_14;
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc), CFSTR("mnc"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bandwidthInMhz), CFSTR("bandwidthInMhz"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_downlinkThroughputInMbps), CFSTR("downlinkThroughputInMbps"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      goto LABEL_17;
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_throughputCount), CFSTR("throughputCount"));
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_mmWavePresent), CFSTR("mmWavePresent"));
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_25;
LABEL_17:
  if ((has & 4) != 0)
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count), CFSTR("count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10002DB20((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_ratType, 1);
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_bbChipset, 2);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field(a3, self->_mcc, 3);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field(a3, self->_mnc, 4);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field(a3, self->_bandwidthInMhz, 5);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(a3, self->_downlinkThroughputInMbps, 6);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField(a3, self->_mmWavePresent, 7);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      return;
LABEL_19:
    PBDataWriterWriteUint32Field(a3, self->_count, 9);
    return;
  }
LABEL_18:
  PBDataWriterWriteUint32Field(a3, self->_throughputCount, 8);
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)result + 8) = self->_ratType;
    *((_WORD *)result + 22) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_bbChipset;
  *((_WORD *)result + 22) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 6) = self->_mcc;
  *((_WORD *)result + 22) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_mnc;
  *((_WORD *)result + 22) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 2) = self->_bandwidthInMhz;
  *((_WORD *)result + 22) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_downlinkThroughputInMbps;
  *((_WORD *)result + 22) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 40) = self->_mmWavePresent;
  *((_WORD *)result + 22) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_throughputCount;
  *((_WORD *)result + 22) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_10:
  *((_DWORD *)result + 4) = self->_count;
  *((_WORD *)result + 22) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 22);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_ratType != *((_DWORD *)a3 + 8))
      goto LABEL_49;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bbChipset != *((_DWORD *)a3 + 3))
      goto LABEL_49;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mcc != *((_DWORD *)a3 + 6))
      goto LABEL_49;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mnc != *((_DWORD *)a3 + 7))
      goto LABEL_49;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_bandwidthInMhz != *((_DWORD *)a3 + 2))
      goto LABEL_49;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_downlinkThroughputInMbps != *((_DWORD *)a3 + 5))
      goto LABEL_49;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    if ((*((_WORD *)a3 + 22) & 0x100) != 0)
      goto LABEL_49;
    goto LABEL_40;
  }
  if ((*((_WORD *)a3 + 22) & 0x100) == 0)
    goto LABEL_49;
  if (self->_mmWavePresent)
  {
    if (!*((_BYTE *)a3 + 40))
      goto LABEL_49;
    goto LABEL_40;
  }
  if (*((_BYTE *)a3 + 40))
  {
LABEL_49:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_40:
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_throughputCount != *((_DWORD *)a3 + 9))
      goto LABEL_49;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  LOBYTE(v5) = (v7 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_count != *((_DWORD *)a3 + 4))
      goto LABEL_49;
    LOBYTE(v5) = 1;
  }
  return v5;
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

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v3 = 2654435761 * self->_ratType;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_bbChipset;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_mcc;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_mnc;
    if ((has & 1) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 1) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_bandwidthInMhz;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_downlinkThroughputInMbps;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_mmWavePresent;
    if ((has & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((has & 4) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_throughputCount;
  if ((has & 4) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_count;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

@end
