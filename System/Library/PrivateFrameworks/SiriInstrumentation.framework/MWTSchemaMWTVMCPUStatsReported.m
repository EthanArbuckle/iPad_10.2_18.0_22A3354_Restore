@implementation MWTSchemaMWTVMCPUStatsReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSnapshotStage:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_snapshotStage = a3;
}

- (BOOL)hasSnapshotStage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasSnapshotStage:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteSnapshotStage
{
  -[MWTSchemaMWTVMCPUStatsReported setSnapshotStage:](self, "setSnapshotStage:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setCpuTicksSystem:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cpuTicksSystem = a3;
}

- (BOOL)hasCpuTicksSystem
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasCpuTicksSystem:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteCpuTicksSystem
{
  -[MWTSchemaMWTVMCPUStatsReported setCpuTicksSystem:](self, "setCpuTicksSystem:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setCpuTicksUser:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cpuTicksUser = a3;
}

- (BOOL)hasCpuTicksUser
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasCpuTicksUser:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteCpuTicksUser
{
  -[MWTSchemaMWTVMCPUStatsReported setCpuTicksUser:](self, "setCpuTicksUser:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setCpuTicksIdle:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cpuTicksIdle = a3;
}

- (BOOL)hasCpuTicksIdle
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasCpuTicksIdle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteCpuTicksIdle
{
  -[MWTSchemaMWTVMCPUStatsReported setCpuTicksIdle:](self, "setCpuTicksIdle:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setCpuTicksNice:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_cpuTicksNice = a3;
}

- (BOOL)hasCpuTicksNice
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasCpuTicksNice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteCpuTicksNice
{
  -[MWTSchemaMWTVMCPUStatsReported setCpuTicksNice:](self, "setCpuTicksNice:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setCompressions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_compressions = a3;
}

- (BOOL)hasCompressions
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasCompressions:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteCompressions
{
  -[MWTSchemaMWTVMCPUStatsReported setCompressions:](self, "setCompressions:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setDecompressions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_decompressions = a3;
}

- (BOOL)hasDecompressions
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasDecompressions:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteDecompressions
{
  -[MWTSchemaMWTVMCPUStatsReported setDecompressions:](self, "setDecompressions:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setPageins:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_pageins = a3;
}

- (BOOL)hasPageins
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasPageins:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deletePageins
{
  -[MWTSchemaMWTVMCPUStatsReported setPageins:](self, "setPageins:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setFaults:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_faults = a3;
}

- (BOOL)hasFaults
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasFaults:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteFaults
{
  -[MWTSchemaMWTVMCPUStatsReported setFaults:](self, "setFaults:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return MWTSchemaMWTVMCPUStatsReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteUint64Field();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $2F0359052CA830D7BE8AAAE42FB827D0 has;
  unsigned int v6;
  int snapshotStage;
  int v8;
  unint64_t cpuTicksSystem;
  int v10;
  unint64_t cpuTicksUser;
  int v12;
  unint64_t cpuTicksIdle;
  int v14;
  unint64_t cpuTicksNice;
  int v16;
  unint64_t compressions;
  int v18;
  unint64_t decompressions;
  int v20;
  unint64_t pageins;
  int v22;
  unint64_t faults;
  BOOL v24;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    snapshotStage = self->_snapshotStage;
    if (snapshotStage != objc_msgSend(v4, "snapshotStage"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_38;
  if (v8)
  {
    cpuTicksSystem = self->_cpuTicksSystem;
    if (cpuTicksSystem != objc_msgSend(v4, "cpuTicksSystem"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_38;
  if (v10)
  {
    cpuTicksUser = self->_cpuTicksUser;
    if (cpuTicksUser != objc_msgSend(v4, "cpuTicksUser"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_38;
  if (v12)
  {
    cpuTicksIdle = self->_cpuTicksIdle;
    if (cpuTicksIdle != objc_msgSend(v4, "cpuTicksIdle"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_38;
  if (v14)
  {
    cpuTicksNice = self->_cpuTicksNice;
    if (cpuTicksNice != objc_msgSend(v4, "cpuTicksNice"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_38;
  if (v16)
  {
    compressions = self->_compressions;
    if (compressions != objc_msgSend(v4, "compressions"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_38;
  if (v18)
  {
    decompressions = self->_decompressions;
    if (decompressions != objc_msgSend(v4, "decompressions"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[40];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_38;
  if (v20)
  {
    pageins = self->_pageins;
    if (pageins == objc_msgSend(v4, "pageins"))
    {
      has = self->_has;
      v6 = v4[40];
      goto LABEL_34;
    }
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_38;
  if (v22)
  {
    faults = self->_faults;
    if (faults != objc_msgSend(v4, "faults"))
      goto LABEL_38;
  }
  v24 = 1;
LABEL_39:

  return v24;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_snapshotStage;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_cpuTicksSystem;
      if ((has & 4) != 0)
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
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_cpuTicksUser;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_cpuTicksIdle;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_cpuTicksNice;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_compressions;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_decompressions;
    if ((has & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
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
  v10 = 2654435761u * self->_pageins;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761u * self->_faults;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported compressions](self, "compressions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("compressions"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksIdle](self, "cpuTicksIdle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cpuTicksIdle"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksNice](self, "cpuTicksNice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cpuTicksNice"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksSystem](self, "cpuTicksSystem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cpuTicksSystem"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksUser](self, "cpuTicksUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cpuTicksUser"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported decompressions](self, "decompressions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("decompressions"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported pageins](self, "pageins"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pageins"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported faults](self, "faults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("faults"));

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_18;
LABEL_9:
  if ((has & 1) == 0)
    goto LABEL_23;
LABEL_19:
  v13 = -[MWTSchemaMWTVMCPUStatsReported snapshotStage](self, "snapshotStage") - 1;
  if (v13 > 4)
    v14 = CFSTR("MWTVMCPUSNAPSHOTSTAGE_UNKNOWN");
  else
    v14 = off_1E56315A0[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("snapshotStage"));
LABEL_23:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MWTSchemaMWTVMCPUStatsReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MWTSchemaMWTVMCPUStatsReported)initWithJSON:(id)a3
{
  void *v4;
  MWTSchemaMWTVMCPUStatsReported *v5;
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
    self = -[MWTSchemaMWTVMCPUStatsReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MWTSchemaMWTVMCPUStatsReported)initWithDictionary:(id)a3
{
  id v4;
  MWTSchemaMWTVMCPUStatsReported *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MWTSchemaMWTVMCPUStatsReported *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MWTSchemaMWTVMCPUStatsReported;
  v5 = -[MWTSchemaMWTVMCPUStatsReported init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snapshotStage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setSnapshotStage:](v5, "setSnapshotStage:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuTicksSystem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksSystem:](v5, "setCpuTicksSystem:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuTicksUser"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksUser:](v5, "setCpuTicksUser:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuTicksIdle"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksIdle:](v5, "setCpuTicksIdle:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuTicksNice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksNice:](v5, "setCpuTicksNice:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compressions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setCompressions:](v5, "setCompressions:", objc_msgSend(v11, "unsignedLongLongValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decompressions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setDecompressions:](v5, "setDecompressions:", objc_msgSend(v12, "unsignedLongLongValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageins"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setPageins:](v5, "setPageins:", objc_msgSend(v14, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTVMCPUStatsReported setFaults:](v5, "setFaults:", objc_msgSend(v15, "unsignedLongLongValue"));
    v16 = v5;

  }
  return v5;
}

- (int)snapshotStage
{
  return self->_snapshotStage;
}

- (unint64_t)cpuTicksSystem
{
  return self->_cpuTicksSystem;
}

- (unint64_t)cpuTicksUser
{
  return self->_cpuTicksUser;
}

- (unint64_t)cpuTicksIdle
{
  return self->_cpuTicksIdle;
}

- (unint64_t)cpuTicksNice
{
  return self->_cpuTicksNice;
}

- (unint64_t)compressions
{
  return self->_compressions;
}

- (unint64_t)decompressions
{
  return self->_decompressions;
}

- (unint64_t)pageins
{
  return self->_pageins;
}

- (unint64_t)faults
{
  return self->_faults;
}

@end
