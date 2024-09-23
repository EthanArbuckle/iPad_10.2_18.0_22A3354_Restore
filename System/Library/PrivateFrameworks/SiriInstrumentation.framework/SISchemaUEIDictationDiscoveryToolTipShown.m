@implementation SISchemaUEIDictationDiscoveryToolTipShown

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setToolTipShown:(int)a3
{
  *(&self->_hasEmoji + 1) |= 1u;
  self->_toolTipShown = a3;
}

- (BOOL)hasToolTipShown
{
  return *(&self->_hasEmoji + 1);
}

- (void)setHasToolTipShown:(BOOL)a3
{
  *(&self->_hasEmoji + 1) = *(&self->_hasEmoji + 1) & 0xFE | a3;
}

- (void)deleteToolTipShown
{
  -[SISchemaUEIDictationDiscoveryToolTipShown setToolTipShown:](self, "setToolTipShown:", 0);
  *(&self->_hasEmoji + 1) &= ~1u;
}

- (void)setHasEmoji:(BOOL)a3
{
  *(&self->_hasEmoji + 1) |= 2u;
  self->_hasEmoji = a3;
}

- (BOOL)hasHasEmoji
{
  return (*((unsigned __int8 *)&self->_hasEmoji + 1) >> 1) & 1;
}

- (void)setHasHasEmoji:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasEmoji + 1) = *(&self->_hasEmoji + 1) & 0xFD | v3;
}

- (void)deleteHasEmoji
{
  -[SISchemaUEIDictationDiscoveryToolTipShown setHasEmoji:](self, "setHasEmoji:", 0);
  *(&self->_hasEmoji + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationDiscoveryToolTipShownReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_hasEmoji + 1);
  v6 = v4;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    v5 = *(&self->_hasEmoji + 1);
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
  int toolTipShown;
  int v8;
  int hasEmoji;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  v5 = *((unsigned __int8 *)&self->_hasEmoji + 1);
  v6 = v4[13];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_10;
  if ((v5 & 1) != 0)
  {
    toolTipShown = self->_toolTipShown;
    if (toolTipShown != objc_msgSend(v4, "toolTipShown"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v5 = *((unsigned __int8 *)&self->_hasEmoji + 1);
    v6 = v4[13];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    hasEmoji = self->_hasEmoji;
    if (hasEmoji != objc_msgSend(v4, "hasEmoji"))
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

  if (*(&self->_hasEmoji + 1))
  {
    v2 = 2654435761 * self->_toolTipShown;
    if ((*(&self->_hasEmoji + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(&self->_hasEmoji + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_hasEmoji;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_hasEmoji + 1);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEIDictationDiscoveryToolTipShown hasEmoji](self, "hasEmoji"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasEmoji"));

    v4 = *(&self->_hasEmoji + 1);
  }
  if ((v4 & 1) != 0)
  {
    v6 = -[SISchemaUEIDictationDiscoveryToolTipShown toolTipShown](self, "toolTipShown") - 1;
    if (v6 > 7)
      v7 = CFSTR("UEIDICTATIONDISCOVERYTOOLTIP_UNKNOWN");
    else
      v7 = off_1E5637298[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("toolTipShown"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationDiscoveryToolTipShown dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationDiscoveryToolTipShown)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationDiscoveryToolTipShown *v5;
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
    self = -[SISchemaUEIDictationDiscoveryToolTipShown initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationDiscoveryToolTipShown)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationDiscoveryToolTipShown *v5;
  void *v6;
  void *v7;
  SISchemaUEIDictationDiscoveryToolTipShown *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIDictationDiscoveryToolTipShown;
  v5 = -[SISchemaUEIDictationDiscoveryToolTipShown init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolTipShown"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationDiscoveryToolTipShown setToolTipShown:](v5, "setToolTipShown:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasEmoji"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationDiscoveryToolTipShown setHasEmoji:](v5, "setHasEmoji:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (int)toolTipShown
{
  return self->_toolTipShown;
}

- (BOOL)hasEmoji
{
  return self->_hasEmoji;
}

@end
