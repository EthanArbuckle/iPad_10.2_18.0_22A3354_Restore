@implementation POWSchemaProvisionalPOWProcessUsage

- (void)setCpuCycles:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cpuCycles = a3;
}

- (BOOL)hasCpuCycles
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCpuCycles:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCpuCycles
{
  -[POWSchemaProvisionalPOWProcessUsage setCpuCycles:](self, "setCpuCycles:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCpuInstructions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cpuInstructions = a3;
}

- (BOOL)hasCpuInstructions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCpuInstructions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCpuInstructions
{
  -[POWSchemaProvisionalPOWProcessUsage setCpuInstructions:](self, "setCpuInstructions:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setGpuCycles:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_gpuCycles = a3;
}

- (BOOL)hasGpuCycles
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasGpuCycles:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteGpuCycles
{
  -[POWSchemaProvisionalPOWProcessUsage setGpuCycles:](self, "setGpuCycles:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setMemoryFootprint:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_memoryFootprint = a3;
}

- (BOOL)hasMemoryFootprint
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMemoryFootprint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteMemoryFootprint
{
  -[POWSchemaProvisionalPOWProcessUsage setMemoryFootprint:](self, "setMemoryFootprint:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return POWSchemaProvisionalPOWProcessUsageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint64Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  char has;
  char v6;
  unint64_t cpuCycles;
  char v8;
  unint64_t cpuInstructions;
  unint64_t gpuCycles;
  unint64_t memoryFootprint;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = (char)self->_has;
  v6 = v4[40];
  if ((v6 & 1) != (has & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    cpuCycles = self->_cpuCycles;
    if (cpuCycles != objc_msgSend(v4, "cpuCycles"))
      goto LABEL_18;
    has = (char)self->_has;
    v6 = v4[40];
  }
  v8 = v6 ^ has;
  if ((v8 & 2) != 0)
    goto LABEL_18;
  if ((has & 2) != 0)
  {
    cpuInstructions = self->_cpuInstructions;
    if (cpuInstructions != objc_msgSend(v4, "cpuInstructions"))
      goto LABEL_18;
    has = (char)self->_has;
    v8 = v4[40] ^ has;
  }
  if ((v8 & 4) != 0)
    goto LABEL_18;
  if ((has & 4) != 0)
  {
    gpuCycles = self->_gpuCycles;
    if (gpuCycles == objc_msgSend(v4, "gpuCycles"))
    {
      has = (char)self->_has;
      v8 = v4[40] ^ has;
      goto LABEL_14;
    }
LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
LABEL_14:
  if ((v8 & 8) != 0)
    goto LABEL_18;
  if ((has & 8) != 0)
  {
    memoryFootprint = self->_memoryFootprint;
    if (memoryFootprint != objc_msgSend(v4, "memoryFootprint"))
      goto LABEL_18;
  }
  v12 = 1;
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_cpuCycles;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_cpuInstructions;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761u * self->_gpuCycles;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761u * self->_memoryFootprint;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage cpuCycles](self, "cpuCycles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cpuCycles"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage gpuCycles](self, "gpuCycles"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("gpuCycles"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage cpuInstructions](self, "cpuInstructions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cpuInstructions"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage memoryFootprint](self, "memoryFootprint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("memoryFootprint"));

  }
LABEL_6:
  -[POWSchemaProvisionalPOWProcessUsage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POWSchemaProvisionalPOWProcessUsage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POWSchemaProvisionalPOWProcessUsage)initWithJSON:(id)a3
{
  void *v4;
  POWSchemaProvisionalPOWProcessUsage *v5;
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
    self = -[POWSchemaProvisionalPOWProcessUsage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POWSchemaProvisionalPOWProcessUsage)initWithDictionary:(id)a3
{
  id v4;
  POWSchemaProvisionalPOWProcessUsage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  POWSchemaProvisionalPOWProcessUsage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POWSchemaProvisionalPOWProcessUsage;
  v5 = -[POWSchemaProvisionalPOWProcessUsage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuCycles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POWSchemaProvisionalPOWProcessUsage setCpuCycles:](v5, "setCpuCycles:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuInstructions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POWSchemaProvisionalPOWProcessUsage setCpuInstructions:](v5, "setCpuInstructions:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gpuCycles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POWSchemaProvisionalPOWProcessUsage setGpuCycles:](v5, "setGpuCycles:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("memoryFootprint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POWSchemaProvisionalPOWProcessUsage setMemoryFootprint:](v5, "setMemoryFootprint:", objc_msgSend(v9, "unsignedLongLongValue"));
    v10 = v5;

  }
  return v5;
}

- (unint64_t)cpuCycles
{
  return self->_cpuCycles;
}

- (unint64_t)cpuInstructions
{
  return self->_cpuInstructions;
}

- (unint64_t)gpuCycles
{
  return self->_gpuCycles;
}

- (unint64_t)memoryFootprint
{
  return self->_memoryFootprint;
}

@end
