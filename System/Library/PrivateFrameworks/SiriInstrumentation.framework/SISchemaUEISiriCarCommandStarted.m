@implementation SISchemaUEISiriCarCommandStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCarPlayConnection:(int)a3
{
  *(&self->_isEnhancedSiriRequest + 1) |= 1u;
  self->_carPlayConnection = a3;
}

- (BOOL)hasCarPlayConnection
{
  return *(&self->_isEnhancedSiriRequest + 1);
}

- (void)setHasCarPlayConnection:(BOOL)a3
{
  *(&self->_isEnhancedSiriRequest + 1) = *(&self->_isEnhancedSiriRequest + 1) & 0xFE | a3;
}

- (void)deleteCarPlayConnection
{
  -[SISchemaUEISiriCarCommandStarted setCarPlayConnection:](self, "setCarPlayConnection:", 0);
  *(&self->_isEnhancedSiriRequest + 1) &= ~1u;
}

- (void)setIsEnhancedSiriEnabled:(BOOL)a3
{
  *(&self->_isEnhancedSiriRequest + 1) |= 2u;
  self->_isEnhancedSiriEnabled = a3;
}

- (BOOL)hasIsEnhancedSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1) >> 1) & 1;
}

- (void)setHasIsEnhancedSiriEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEnhancedSiriRequest + 1) = *(&self->_isEnhancedSiriRequest + 1) & 0xFD | v3;
}

- (void)deleteIsEnhancedSiriEnabled
{
  -[SISchemaUEISiriCarCommandStarted setIsEnhancedSiriEnabled:](self, "setIsEnhancedSiriEnabled:", 0);
  *(&self->_isEnhancedSiriRequest + 1) &= ~2u;
}

- (void)setIsEnhancedSiriRequest:(BOOL)a3
{
  *(&self->_isEnhancedSiriRequest + 1) |= 4u;
  self->_isEnhancedSiriRequest = a3;
}

- (BOOL)hasIsEnhancedSiriRequest
{
  return (*((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1) >> 2) & 1;
}

- (void)setHasIsEnhancedSiriRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEnhancedSiriRequest + 1) = *(&self->_isEnhancedSiriRequest + 1) & 0xFB | v3;
}

- (void)deleteIsEnhancedSiriRequest
{
  -[SISchemaUEISiriCarCommandStarted setIsEnhancedSiriRequest:](self, "setIsEnhancedSiriRequest:", 0);
  *(&self->_isEnhancedSiriRequest + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEISiriCarCommandStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isEnhancedSiriRequest + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isEnhancedSiriRequest + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(&self->_isEnhancedSiriRequest + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  v5 = *(&self->_isEnhancedSiriRequest + 1);
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

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int carPlayConnection;
  int v8;
  int isEnhancedSiriEnabled;
  int v10;
  int isEnhancedSiriRequest;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1);
  v6 = v4[14];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    carPlayConnection = self->_carPlayConnection;
    if (carPlayConnection != objc_msgSend(v4, "carPlayConnection"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1);
    v6 = v4[14];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isEnhancedSiriEnabled = self->_isEnhancedSiriEnabled;
    if (isEnhancedSiriEnabled == objc_msgSend(v4, "isEnhancedSiriEnabled"))
    {
      v5 = *((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1);
      v6 = v4[14];
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
    isEnhancedSiriRequest = self->_isEnhancedSiriRequest;
    if (isEnhancedSiriRequest != objc_msgSend(v4, "isEnhancedSiriRequest"))
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

  if (!*(&self->_isEnhancedSiriRequest + 1))
  {
    v2 = 0;
    if ((*(&self->_isEnhancedSiriRequest + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isEnhancedSiriRequest + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_carPlayConnection;
  if ((*(&self->_isEnhancedSiriRequest + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isEnhancedSiriEnabled;
  if ((*(&self->_isEnhancedSiriRequest + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isEnhancedSiriRequest;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isEnhancedSiriRequest + 1);
  if ((v4 & 1) != 0)
  {
    v5 = -[SISchemaUEISiriCarCommandStarted carPlayConnection](self, "carPlayConnection") - 1;
    if (v5 > 2)
      v6 = CFSTR("CARPLAYCONNECTION_UNKNOWN");
    else
      v6 = off_1E563AC48[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("carPlayConnection"));
    v4 = *(&self->_isEnhancedSiriRequest + 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEISiriCarCommandStarted isEnhancedSiriEnabled](self, "isEnhancedSiriEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isEnhancedSiriEnabled"));

    v4 = *(&self->_isEnhancedSiriRequest + 1);
  }
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEISiriCarCommandStarted isEnhancedSiriRequest](self, "isEnhancedSiriRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isEnhancedSiriRequest"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEISiriCarCommandStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEISiriCarCommandStarted)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEISiriCarCommandStarted *v5;
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
    self = -[SISchemaUEISiriCarCommandStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEISiriCarCommandStarted)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEISiriCarCommandStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUEISiriCarCommandStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEISiriCarCommandStarted;
  v5 = -[SISchemaUEISiriCarCommandStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayConnection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEISiriCarCommandStarted setCarPlayConnection:](v5, "setCarPlayConnection:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnhancedSiriEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEISiriCarCommandStarted setIsEnhancedSiriEnabled:](v5, "setIsEnhancedSiriEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnhancedSiriRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEISiriCarCommandStarted setIsEnhancedSiriRequest:](v5, "setIsEnhancedSiriRequest:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (int)carPlayConnection
{
  return self->_carPlayConnection;
}

- (BOOL)isEnhancedSiriEnabled
{
  return self->_isEnhancedSiriEnabled;
}

- (BOOL)isEnhancedSiriRequest
{
  return self->_isEnhancedSiriRequest;
}

@end
