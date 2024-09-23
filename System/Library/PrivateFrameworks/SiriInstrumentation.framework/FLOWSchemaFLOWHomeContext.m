@implementation FLOWSchemaFLOWHomeContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHomeCount:(unsigned int)a3
{
  *(&self->_hasCurrentHome + 1) |= 1u;
  self->_homeCount = a3;
}

- (BOOL)hasHomeCount
{
  return *(&self->_hasCurrentHome + 1);
}

- (void)setHasHomeCount:(BOOL)a3
{
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xFE | a3;
}

- (void)deleteHomeCount
{
  -[FLOWSchemaFLOWHomeContext setHomeCount:](self, "setHomeCount:", 0);
  *(&self->_hasCurrentHome + 1) &= ~1u;
}

- (void)setHomePodCount:(unsigned int)a3
{
  *(&self->_hasCurrentHome + 1) |= 2u;
  self->_homePodCount = a3;
}

- (BOOL)hasHomePodCount
{
  return (*((unsigned __int8 *)&self->_hasCurrentHome + 1) >> 1) & 1;
}

- (void)setHasHomePodCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xFD | v3;
}

- (void)deleteHomePodCount
{
  -[FLOWSchemaFLOWHomeContext setHomePodCount:](self, "setHomePodCount:", 0);
  *(&self->_hasCurrentHome + 1) &= ~2u;
}

- (void)setAppleTvCount:(unsigned int)a3
{
  *(&self->_hasCurrentHome + 1) |= 4u;
  self->_appleTvCount = a3;
}

- (BOOL)hasAppleTvCount
{
  return (*((unsigned __int8 *)&self->_hasCurrentHome + 1) >> 2) & 1;
}

- (void)setHasAppleTvCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xFB | v3;
}

- (void)deleteAppleTvCount
{
  -[FLOWSchemaFLOWHomeContext setAppleTvCount:](self, "setAppleTvCount:", 0);
  *(&self->_hasCurrentHome + 1) &= ~4u;
}

- (void)setHasCurrentHome:(BOOL)a3
{
  *(&self->_hasCurrentHome + 1) |= 8u;
  self->_hasCurrentHome = a3;
}

- (BOOL)hasHasCurrentHome
{
  return (*((unsigned __int8 *)&self->_hasCurrentHome + 1) >> 3) & 1;
}

- (void)setHasHasCurrentHome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xF7 | v3;
}

- (void)deleteHasCurrentHome
{
  -[FLOWSchemaFLOWHomeContext setHasCurrentHome:](self, "setHasCurrentHome:", 0);
  *(&self->_hasCurrentHome + 1) &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = *(&self->_hasCurrentHome + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(&self->_hasCurrentHome + 1) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(&self->_hasCurrentHome + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int homeCount;
  int v8;
  unsigned int homePodCount;
  int v10;
  unsigned int appleTvCount;
  int v12;
  int hasCurrentHome;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
  v6 = v4[21];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_18;
  if ((v5 & 1) != 0)
  {
    homeCount = self->_homeCount;
    if (homeCount != objc_msgSend(v4, "homeCount"))
      goto LABEL_18;
    v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
    v6 = v4[21];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    homePodCount = self->_homePodCount;
    if (homePodCount != objc_msgSend(v4, "homePodCount"))
      goto LABEL_18;
    v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
    v6 = v4[21];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    appleTvCount = self->_appleTvCount;
    if (appleTvCount == objc_msgSend(v4, "appleTvCount"))
    {
      v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
      v6 = v4[21];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    hasCurrentHome = self->_hasCurrentHome;
    if (hasCurrentHome != objc_msgSend(v4, "hasCurrentHome"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*(&self->_hasCurrentHome + 1))
  {
    v2 = 2654435761 * self->_homeCount;
    if ((*(&self->_hasCurrentHome + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_homePodCount;
      if ((*(&self->_hasCurrentHome + 1) & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(&self->_hasCurrentHome + 1) & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_hasCurrentHome + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_hasCurrentHome + 1) & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_appleTvCount;
  if ((*(&self->_hasCurrentHome + 1) & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_hasCurrentHome;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeContext appleTvCount](self, "appleTvCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appleTvCount"));

    v4 = *(&self->_hasCurrentHome + 1);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeContext homeCount](self, "homeCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("homeCount"));

      if ((*(&self->_hasCurrentHome + 1) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(&self->_hasCurrentHome + 1) & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWHomeContext hasCurrentHome](self, "hasCurrentHome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasCurrentHome"));

  v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeContext homePodCount](self, "homePodCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homePodCount"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeContext *v5;
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
    self = -[FLOWSchemaFLOWHomeContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FLOWSchemaFLOWHomeContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWHomeContext;
  v5 = -[FLOWSchemaFLOWHomeContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeContext setHomeCount:](v5, "setHomeCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homePodCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeContext setHomePodCount:](v5, "setHomePodCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleTvCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeContext setAppleTvCount:](v5, "setAppleTvCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasCurrentHome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeContext setHasCurrentHome:](v5, "setHasCurrentHome:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)homeCount
{
  return self->_homeCount;
}

- (unsigned)homePodCount
{
  return self->_homePodCount;
}

- (unsigned)appleTvCount
{
  return self->_appleTvCount;
}

- (BOOL)hasCurrentHome
{
  return self->_hasCurrentHome;
}

@end
