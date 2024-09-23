@implementation NLXSchemaCDMClientSetupStarted

- (void)setServiceGraphName:(int)a3
{
  *(&self->_performWarmupOperations + 1) |= 2u;
  self->_serviceGraphName = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_performWarmupOperations + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_performWarmupOperations + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(&self->_performWarmupOperations + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  v5 = *(&self->_performWarmupOperations + 1);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setExists:(BOOL)a3
{
  *(&self->_performWarmupOperations + 1) |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(&self->_performWarmupOperations + 1);
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_performWarmupOperations + 1) = *(&self->_performWarmupOperations + 1) & 0xFE | a3;
}

- (void)deleteExists
{
  -[NLXSchemaCDMClientSetupStarted setExists:](self, "setExists:", 0);
  *(&self->_performWarmupOperations + 1) &= ~1u;
}

- (BOOL)hasServiceGraphName
{
  return (*((unsigned __int8 *)&self->_performWarmupOperations + 1) >> 1) & 1;
}

- (void)setHasServiceGraphName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_performWarmupOperations + 1) = *(&self->_performWarmupOperations + 1) & 0xFD | v3;
}

- (void)deleteServiceGraphName
{
  -[NLXSchemaCDMClientSetupStarted setServiceGraphName:](self, "setServiceGraphName:", 0);
  *(&self->_performWarmupOperations + 1) &= ~2u;
}

- (void)setPerformWarmupOperations:(BOOL)a3
{
  *(&self->_performWarmupOperations + 1) |= 4u;
  self->_performWarmupOperations = a3;
}

- (BOOL)hasPerformWarmupOperations
{
  return (*((unsigned __int8 *)&self->_performWarmupOperations + 1) >> 2) & 1;
}

- (void)setHasPerformWarmupOperations:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_performWarmupOperations + 1) = *(&self->_performWarmupOperations + 1) & 0xFB | v3;
}

- (void)deletePerformWarmupOperations
{
  -[NLXSchemaCDMClientSetupStarted setPerformWarmupOperations:](self, "setPerformWarmupOperations:", 0);
  *(&self->_performWarmupOperations + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMClientSetupStartedReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int exists;
  int v8;
  int serviceGraphName;
  int v10;
  int performWarmupOperations;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_performWarmupOperations + 1);
  v6 = v4[17];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_performWarmupOperations + 1);
    v6 = v4[17];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    serviceGraphName = self->_serviceGraphName;
    if (serviceGraphName == objc_msgSend(v4, "serviceGraphName"))
    {
      v5 = *((unsigned __int8 *)&self->_performWarmupOperations + 1);
      v6 = v4[17];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    performWarmupOperations = self->_performWarmupOperations;
    if (performWarmupOperations != objc_msgSend(v4, "performWarmupOperations"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(&self->_performWarmupOperations + 1))
  {
    v2 = 0;
    if ((*(&self->_performWarmupOperations + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_performWarmupOperations + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_exists;
  if ((*(&self->_performWarmupOperations + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_serviceGraphName;
  if ((*(&self->_performWarmupOperations + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_performWarmupOperations;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_performWarmupOperations + 1);
  if ((v4 & 1) == 0)
  {
    if ((*(&self->_performWarmupOperations + 1) & 4) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaCDMClientSetupStarted performWarmupOperations](self, "performWarmupOperations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("performWarmupOperations"));

    if ((*(&self->_performWarmupOperations + 1) & 2) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaCDMClientSetupStarted exists](self, "exists"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("exists"));

  v4 = *(&self->_performWarmupOperations + 1);
  if ((v4 & 4) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v4 & 2) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = -[NLXSchemaCDMClientSetupStarted serviceGraphName](self, "serviceGraphName") - 1;
  if (v7 > 6)
    v8 = CFSTR("CDMSERVICEGRAPHNAME_UNKNOWN");
  else
    v8 = off_1E5631A00[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("serviceGraphName"));
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMClientSetupStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMClientSetupStarted)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMClientSetupStarted *v5;
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
    self = -[NLXSchemaCDMClientSetupStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMClientSetupStarted)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMClientSetupStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  NLXSchemaCDMClientSetupStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMClientSetupStarted;
  v5 = -[NLXSchemaCDMClientSetupStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMClientSetupStarted setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceGraphName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMClientSetupStarted setServiceGraphName:](v5, "setServiceGraphName:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performWarmupOperations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMClientSetupStarted setPerformWarmupOperations:](v5, "setPerformWarmupOperations:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (int)serviceGraphName
{
  return self->_serviceGraphName;
}

- (BOOL)performWarmupOperations
{
  return self->_performWarmupOperations;
}

@end
