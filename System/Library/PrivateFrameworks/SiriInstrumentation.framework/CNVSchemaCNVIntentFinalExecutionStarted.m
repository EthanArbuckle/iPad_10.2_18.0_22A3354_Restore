@implementation CNVSchemaCNVIntentFinalExecutionStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPlugin:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_plugin = a3;
}

- (BOOL)hasPlugin
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPlugin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePlugin
{
  -[CNVSchemaCNVIntentFinalExecutionStarted setPlugin:](self, "setPlugin:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setStackDepth:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_stackDepth = a3;
}

- (BOOL)hasStackDepth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStackDepth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteStackDepth
{
  -[CNVSchemaCNVIntentFinalExecutionStarted setStackDepth:](self, "setStackDepth:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentFinalExecutionStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $FB2CBB024570DF547870A1C3382B55AA has;
  unsigned int v6;
  int plugin;
  int v8;
  unsigned int stackDepth;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    plugin = self->_plugin;
    if (plugin != objc_msgSend(v4, "plugin"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    stackDepth = self->_stackDepth;
    if (stackDepth != objc_msgSend(v4, "stackDepth"))
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_plugin;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_stackDepth;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[CNVSchemaCNVIntentFinalExecutionStarted plugin](self, "plugin") - 1;
    if (v5 > 0x23)
      v6 = CFSTR("CNVPLUGIN_UNKNOWN");
    else
      v6 = off_1E562C3F0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("plugin"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CNVSchemaCNVIntentFinalExecutionStarted stackDepth](self, "stackDepth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("stackDepth"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVIntentFinalExecutionStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVIntentFinalExecutionStarted)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVIntentFinalExecutionStarted *v5;
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
    self = -[CNVSchemaCNVIntentFinalExecutionStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVIntentFinalExecutionStarted)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVIntentFinalExecutionStarted *v5;
  void *v6;
  void *v7;
  CNVSchemaCNVIntentFinalExecutionStarted *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVSchemaCNVIntentFinalExecutionStarted;
  v5 = -[CNVSchemaCNVIntentFinalExecutionStarted init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plugin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentFinalExecutionStarted setPlugin:](v5, "setPlugin:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stackDepth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentFinalExecutionStarted setStackDepth:](v5, "setStackDepth:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = v5;

  }
  return v5;
}

- (int)plugin
{
  return self->_plugin;
}

- (unsigned)stackDepth
{
  return self->_stackDepth;
}

@end
