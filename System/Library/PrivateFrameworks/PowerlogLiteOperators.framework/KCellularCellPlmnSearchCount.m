@implementation KCellularCellPlmnSearchCount

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

- (void)setDurationMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGsmSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gsmSearchCount = a3;
}

- (void)setHasGsmSearchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGsmSearchCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setUmtsSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_umtsSearchCount = a3;
}

- (void)setHasUmtsSearchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUmtsSearchCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTdscdmaSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_tdscdmaSearchCount = a3;
}

- (void)setHasTdscdmaSearchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTdscdmaSearchCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLteSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lteSearchCount = a3;
}

- (void)setHasLteSearchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLteSearchCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCdma1xSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cdma1xSearchCount = a3;
}

- (void)setHasCdma1xSearchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCdma1xSearchCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCdmaEvdoSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cdmaEvdoSearchCount = a3;
}

- (void)setHasCdmaEvdoSearchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCdmaEvdoSearchCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSubsId
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)KCellularCellPlmnSearchCount;
  -[KCellularCellPlmnSearchCount description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularCellPlmnSearchCount dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durationMs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration_ms"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gsmSearchCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("gsm_search_count"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_umtsSearchCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("umts_search_count"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tdscdmaSearchCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("tdscdma_search_count"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lteSearchCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("lte_search_count"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cdmaEvdoSearchCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cdma_evdo_search_count"));

    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cdma1xSearchCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cdma_1x_search_count"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x40) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularCellPlmnSearchCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
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
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x40) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 24) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_durationMs;
  *((_WORD *)v4 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 7) = self->_gsmSearchCount;
  *((_WORD *)v4 + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 11) = self->_umtsSearchCount;
  *((_WORD *)v4 + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 10) = self->_tdscdmaSearchCount;
  *((_WORD *)v4 + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 8) = self->_lteSearchCount;
  *((_WORD *)v4 + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
LABEL_19:
    *((_DWORD *)v4 + 5) = self->_cdmaEvdoSearchCount;
    *((_WORD *)v4 + 24) |= 4u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  *((_DWORD *)v4 + 4) = self->_cdma1xSearchCount;
  *((_WORD *)v4 + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x40) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 9) = self->_subsId;
    *((_WORD *)v4 + 24) |= 0x40u;
  }
LABEL_11:

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
    *((_WORD *)result + 24) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_durationMs;
  *((_WORD *)result + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 7) = self->_gsmSearchCount;
  *((_WORD *)result + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_umtsSearchCount;
  *((_WORD *)result + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 10) = self->_tdscdmaSearchCount;
  *((_WORD *)result + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_lteSearchCount;
  *((_WORD *)result + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_cdma1xSearchCount;
  *((_WORD *)result + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 5) = self->_cdmaEvdoSearchCount;
  *((_WORD *)result + 24) |= 4u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return result;
LABEL_10:
  *((_DWORD *)result + 9) = self->_subsId;
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
    goto LABEL_47;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 24);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_47;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_47:
    v7 = 0;
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durationMs != *((_DWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gsmSearchCount != *((_DWORD *)v4 + 7))
      goto LABEL_47;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_umtsSearchCount != *((_DWORD *)v4 + 11))
      goto LABEL_47;
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_tdscdmaSearchCount != *((_DWORD *)v4 + 10))
      goto LABEL_47;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lteSearchCount != *((_DWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cdma1xSearchCount != *((_DWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cdmaEvdoSearchCount != *((_DWORD *)v4 + 5))
      goto LABEL_47;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 9))
      goto LABEL_47;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x40) == 0;
  }
LABEL_48:

  return v7;
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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_durationMs;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_gsmSearchCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_umtsSearchCount;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_tdscdmaSearchCount;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_lteSearchCount;
    if ((has & 2) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_cdma1xSearchCount;
    if ((has & 4) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 4) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_cdmaEvdoSearchCount;
  if ((has & 0x40) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_gsmSearchCount = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_umtsSearchCount = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_tdscdmaSearchCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_lteSearchCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
LABEL_19:
    self->_cdmaEvdoSearchCount = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 24) & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_cdma1xSearchCount = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v5 & 0x40) != 0)
  {
LABEL_10:
    self->_subsId = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_11:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)gsmSearchCount
{
  return self->_gsmSearchCount;
}

- (unsigned)umtsSearchCount
{
  return self->_umtsSearchCount;
}

- (unsigned)tdscdmaSearchCount
{
  return self->_tdscdmaSearchCount;
}

- (unsigned)lteSearchCount
{
  return self->_lteSearchCount;
}

- (unsigned)cdma1xSearchCount
{
  return self->_cdma1xSearchCount;
}

- (unsigned)cdmaEvdoSearchCount
{
  return self->_cdmaEvdoSearchCount;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
