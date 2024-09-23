@implementation CNVSchemaCNVIntentReformationStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setTransformer:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_transformer = a3;
}

- (BOOL)hasTransformer
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTransformer:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTransformer
{
  -[CNVSchemaCNVIntentReformationStarted setTransformer:](self, "setTransformer:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTargetPlugin:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_targetPlugin = a3;
}

- (BOOL)hasTargetPlugin
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTargetPlugin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTargetPlugin
{
  -[CNVSchemaCNVIntentReformationStarted setTargetPlugin:](self, "setTargetPlugin:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentReformationStartedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $E775A283EB6C608189653C15C16CDAF5 has;
  unsigned int v6;
  int transformer;
  int v8;
  int targetPlugin;
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
    transformer = self->_transformer;
    if (transformer != objc_msgSend(v4, "transformer"))
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
    targetPlugin = self->_targetPlugin;
    if (targetPlugin != objc_msgSend(v4, "targetPlugin"))
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
    v2 = 2654435761 * self->_transformer;
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
  v3 = 2654435761 * self->_targetPlugin;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[CNVSchemaCNVIntentReformationStarted targetPlugin](self, "targetPlugin") - 1;
    if (v5 > 0x23)
      v6 = CFSTR("CNVPLUGIN_UNKNOWN");
    else
      v6 = off_1E562C510[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("targetPlugin"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if (-[CNVSchemaCNVIntentReformationStarted transformer](self, "transformer") == 1)
      v7 = CFSTR("CNVTRANSFORMER_TIMER_TO_ALARM");
    else
      v7 = CFSTR("CNVTRANSFORMER_UNKNOWN");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("transformer"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVIntentReformationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVIntentReformationStarted)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVIntentReformationStarted *v5;
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
    self = -[CNVSchemaCNVIntentReformationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVIntentReformationStarted)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVIntentReformationStarted *v5;
  void *v6;
  void *v7;
  CNVSchemaCNVIntentReformationStarted *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVSchemaCNVIntentReformationStarted;
  v5 = -[CNVSchemaCNVIntentReformationStarted init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transformer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentReformationStarted setTransformer:](v5, "setTransformer:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetPlugin"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentReformationStarted setTargetPlugin:](v5, "setTargetPlugin:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)transformer
{
  return self->_transformer;
}

- (int)targetPlugin
{
  return self->_targetPlugin;
}

@end
