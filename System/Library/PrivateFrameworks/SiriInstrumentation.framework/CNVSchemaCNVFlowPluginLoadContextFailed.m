@implementation CNVSchemaCNVFlowPluginLoadContextFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(&self->_hasPluginCached + 1) |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return *(&self->_hasPluginCached + 1);
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(&self->_hasPluginCached + 1) = *(&self->_hasPluginCached + 1) & 0xFE | a3;
}

- (void)deleteErrorCode
{
  -[CNVSchemaCNVFlowPluginLoadContextFailed setErrorCode:](self, "setErrorCode:", 0);
  *(&self->_hasPluginCached + 1) &= ~1u;
}

- (void)setHasPluginCached:(BOOL)a3
{
  *(&self->_hasPluginCached + 1) |= 2u;
  self->_hasPluginCached = a3;
}

- (BOOL)hasHasPluginCached
{
  return (*((unsigned __int8 *)&self->_hasPluginCached + 1) >> 1) & 1;
}

- (void)setHasHasPluginCached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasPluginCached + 1) = *(&self->_hasPluginCached + 1) & 0xFD | v3;
}

- (void)deleteHasPluginCached
{
  -[CNVSchemaCNVFlowPluginLoadContextFailed setHasPluginCached:](self, "setHasPluginCached:", 0);
  *(&self->_hasPluginCached + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVFlowPluginLoadContextFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_hasPluginCached + 1);
  v6 = v4;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    v5 = *(&self->_hasPluginCached + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int errorCode;
  int v8;
  int hasPluginCached;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  v5 = *((unsigned __int8 *)&self->_hasPluginCached + 1);
  v6 = v4[13];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_10;
  if ((v5 & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v5 = *((unsigned __int8 *)&self->_hasPluginCached + 1);
    v6 = v4[13];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    hasPluginCached = self->_hasPluginCached;
    if (hasPluginCached != objc_msgSend(v4, "hasPluginCached"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if (*(&self->_hasPluginCached + 1))
  {
    v2 = 2654435761 * self->_errorCode;
    if ((*(&self->_hasPluginCached + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(&self->_hasPluginCached + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_hasPluginCached;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_hasPluginCached + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CNVSchemaCNVFlowPluginLoadContextFailed errorCode](self, "errorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

    v4 = *(&self->_hasPluginCached + 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNVSchemaCNVFlowPluginLoadContextFailed hasPluginCached](self, "hasPluginCached"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasPluginCached"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVFlowPluginLoadContextFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVFlowPluginLoadContextFailed)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVFlowPluginLoadContextFailed *v5;
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
    self = -[CNVSchemaCNVFlowPluginLoadContextFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVFlowPluginLoadContextFailed)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVFlowPluginLoadContextFailed *v5;
  void *v6;
  void *v7;
  CNVSchemaCNVFlowPluginLoadContextFailed *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVSchemaCNVFlowPluginLoadContextFailed;
  v5 = -[CNVSchemaCNVFlowPluginLoadContextFailed init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVFlowPluginLoadContextFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasPluginCached"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVFlowPluginLoadContextFailed setHasPluginCached:](v5, "setHasPluginCached:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)hasPluginCached
{
  return self->_hasPluginCached;
}

@end
