@implementation COMAPPLEPROACTIVEGMSGMSAssetEvent

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)loadType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_loadType;
  else
    return 0;
}

- (void)setLoadType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_loadType = a3;
}

- (void)setHasLoadType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLoadType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)loadTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E2A415F0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLoadType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_TYPE_LOAD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_TYPE_UNLOAD")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)loadReason
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_loadReason;
  else
    return 0;
}

- (void)setLoadReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_loadReason = a3;
}

- (void)setHasLoadReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLoadReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)loadReasonAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E2A41608 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLoadReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_REASON_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_REASON_USER_INITIATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_REASON_POLICY_CHANGE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_REASON_MEMORY_BUDGET_PRESSURE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_REASON_ACQUISITION_ERROR")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)loadResult
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_loadResult;
  else
    return 0;
}

- (void)setLoadResult:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_loadResult = a3;
}

- (void)setHasLoadResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLoadResult
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)loadResultAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E2A41630 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLoadResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_RESULT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_RESULT_LOADED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_RESULT_UNLOADED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_RESULT_LOAD_FAILURE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_LOAD_RESULT_UNLOAD_FAILURE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMemoryCostKB:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_memoryCostKB = a3;
}

- (void)setHasMemoryCostKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMemoryCostKB
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLatencyMillis:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latencyMillis = a3;
}

- (void)setHasLatencyMillis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatencyMillis
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSAssetEvent;
  -[COMAPPLEPROACTIVEGMSGMSAssetEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEPROACTIVEGMSGMSAssetEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  uint64_t loadType;
  void *v9;
  uint64_t loadReason;
  void *v11;
  uint64_t loadResult;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  loadType = self->_loadType;
  if (loadType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_loadType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = *(&off_1E2A415F0 + loadType);
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("loadType"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_14:
  loadReason = self->_loadReason;
  if (loadReason >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_loadReason);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(&off_1E2A41608 + loadReason);
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("loadReason"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_memoryCostKB);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("memoryCostKB"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_18:
  loadResult = self->_loadResult;
  if (loadResult >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_loadResult);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = *(&off_1E2A41630 + loadResult);
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("loadResult"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_22;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latencyMillis);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("latencyMillis"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSAssetEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_version;
    *((_BYTE *)v4 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_loadType;
  *((_BYTE *)v4 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 8) = self->_loadReason;
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    v4[2] = self->_memoryCostKB;
    *((_BYTE *)v4 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 9) = self->_loadResult;
  *((_BYTE *)v4 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    v4[1] = *(_QWORD *)&self->_latencyMillis;
    *((_BYTE *)v4 + 44) |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_version;
    *((_BYTE *)result + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_loadType;
  *((_BYTE *)result + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_loadReason;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 9) = self->_loadResult;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)result + 2) = self->_memoryCostKB;
  *((_BYTE *)result + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_latencyMillis;
  *((_BYTE *)result + 44) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_version != *((_QWORD *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_loadType != *((_DWORD *)v4 + 10))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_loadReason != *((_DWORD *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_loadResult != *((_DWORD *)v4 + 9))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_memoryCostKB != *((_QWORD *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_latencyMillis != *((double *)v4 + 1))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double latencyMillis;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_loadType;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_loadReason;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_loadResult;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_15:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_16:
    v11 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v11;
  }
LABEL_14:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_6:
  v6 = 2654435761u * self->_memoryCostKB;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_7:
  latencyMillis = self->_latencyMillis;
  v8 = -latencyMillis;
  if (latencyMillis >= 0.0)
    v8 = self->_latencyMillis;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_loadType = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_loadReason = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_13:
    self->_memoryCostKB = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_loadResult = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 1) != 0)
  {
LABEL_7:
    self->_latencyMillis = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:

}

- (int64_t)version
{
  return self->_version;
}

- (unint64_t)memoryCostKB
{
  return self->_memoryCostKB;
}

- (double)latencyMillis
{
  return self->_latencyMillis;
}

@end
