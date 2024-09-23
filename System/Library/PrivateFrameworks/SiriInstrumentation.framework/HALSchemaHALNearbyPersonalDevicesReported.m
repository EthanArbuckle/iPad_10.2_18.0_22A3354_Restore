@implementation HALSchemaHALNearbyPersonalDevicesReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIPhoneCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iPhoneCount = a3;
}

- (BOOL)hasIPhoneCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIPhoneCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIPhoneCount
{
  -[HALSchemaHALNearbyPersonalDevicesReported setIPhoneCount:](self, "setIPhoneCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIPadCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_iPadCount = a3;
}

- (BOOL)hasIPadCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIPadCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIPadCount
{
  -[HALSchemaHALNearbyPersonalDevicesReported setIPadCount:](self, "setIPadCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setWatchCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_watchCount = a3;
}

- (BOOL)hasWatchCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasWatchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteWatchCount
{
  -[HALSchemaHALNearbyPersonalDevicesReported setWatchCount:](self, "setWatchCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setMacBookCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_macBookCount = a3;
}

- (BOOL)hasMacBookCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMacBookCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteMacBookCount
{
  -[HALSchemaHALNearbyPersonalDevicesReported setMacBookCount:](self, "setMacBookCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setMacStudioCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_macStudioCount = a3;
}

- (BOOL)hasMacStudioCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasMacStudioCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteMacStudioCount
{
  -[HALSchemaHALNearbyPersonalDevicesReported setMacStudioCount:](self, "setMacStudioCount:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIMacCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_iMacCount = a3;
}

- (BOOL)hasIMacCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIMacCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIMacCount
{
  -[HALSchemaHALNearbyPersonalDevicesReported setIMacCount:](self, "setIMacCount:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALNearbyPersonalDevicesReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
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
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $2603D206256D646781B8C1B61506BA35 has;
  unsigned int v6;
  unsigned int iPhoneCount;
  int v8;
  unsigned int iPadCount;
  int v10;
  unsigned int watchCount;
  int v12;
  unsigned int macBookCount;
  int v14;
  unsigned int macStudioCount;
  int v16;
  unsigned int iMacCount;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    iPhoneCount = self->_iPhoneCount;
    if (iPhoneCount != objc_msgSend(v4, "iPhoneCount"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    iPadCount = self->_iPadCount;
    if (iPadCount != objc_msgSend(v4, "iPadCount"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    watchCount = self->_watchCount;
    if (watchCount != objc_msgSend(v4, "watchCount"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    macBookCount = self->_macBookCount;
    if (macBookCount != objc_msgSend(v4, "macBookCount"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    macStudioCount = self->_macStudioCount;
    if (macStudioCount == objc_msgSend(v4, "macStudioCount"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v16)
  {
    iMacCount = self->_iMacCount;
    if (iMacCount != objc_msgSend(v4, "iMacCount"))
      goto LABEL_26;
  }
  v18 = 1;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_iPhoneCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_iPadCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_watchCount;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_macBookCount;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_macStudioCount;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_iMacCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported iMacCount](self, "iMacCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("iMacCount"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported iPadCount](self, "iPadCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("iPadCount"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported iPhoneCount](self, "iPhoneCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("iPhoneCount"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported macStudioCount](self, "macStudioCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("macStudioCount"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported macBookCount](self, "macBookCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("macBookCount"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported watchCount](self, "watchCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("watchCount"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALNearbyPersonalDevicesReported dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (HALSchemaHALNearbyPersonalDevicesReported)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALNearbyPersonalDevicesReported *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[HALSchemaHALNearbyPersonalDevicesReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALNearbyPersonalDevicesReported)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALNearbyPersonalDevicesReported *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HALSchemaHALNearbyPersonalDevicesReported *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HALSchemaHALNearbyPersonalDevicesReported;
  v5 = -[HALSchemaHALNearbyPersonalDevicesReported init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iPhoneCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALNearbyPersonalDevicesReported setIPhoneCount:](v5, "setIPhoneCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iPadCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALNearbyPersonalDevicesReported setIPadCount:](v5, "setIPadCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALNearbyPersonalDevicesReported setWatchCount:](v5, "setWatchCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macBookCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALNearbyPersonalDevicesReported setMacBookCount:](v5, "setMacBookCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macStudioCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALNearbyPersonalDevicesReported setMacStudioCount:](v5, "setMacStudioCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iMacCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALNearbyPersonalDevicesReported setIMacCount:](v5, "setIMacCount:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (unsigned)iPhoneCount
{
  return self->_iPhoneCount;
}

- (unsigned)iPadCount
{
  return self->_iPadCount;
}

- (unsigned)watchCount
{
  return self->_watchCount;
}

- (unsigned)macBookCount
{
  return self->_macBookCount;
}

- (unsigned)macStudioCount
{
  return self->_macStudioCount;
}

- (unsigned)iMacCount
{
  return self->_iMacCount;
}

@end
