@implementation SISchemaSendWithoutConfirmation

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(&self->_isEnabledForCarPlay + 1) |= 1u;
  self->_isEnabled = a3;
}

- (BOOL)hasIsEnabled
{
  return *(&self->_isEnabledForCarPlay + 1);
}

- (void)setHasIsEnabled:(BOOL)a3
{
  *(&self->_isEnabledForCarPlay + 1) = *(&self->_isEnabledForCarPlay + 1) & 0xFE | a3;
}

- (void)deleteIsEnabled
{
  -[SISchemaSendWithoutConfirmation setIsEnabled:](self, "setIsEnabled:", 0);
  *(&self->_isEnabledForCarPlay + 1) &= ~1u;
}

- (void)setIsEnabledForHeadphones:(BOOL)a3
{
  *(&self->_isEnabledForCarPlay + 1) |= 2u;
  self->_isEnabledForHeadphones = a3;
}

- (BOOL)hasIsEnabledForHeadphones
{
  return (*((unsigned __int8 *)&self->_isEnabledForCarPlay + 1) >> 1) & 1;
}

- (void)setHasIsEnabledForHeadphones:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEnabledForCarPlay + 1) = *(&self->_isEnabledForCarPlay + 1) & 0xFD | v3;
}

- (void)deleteIsEnabledForHeadphones
{
  -[SISchemaSendWithoutConfirmation setIsEnabledForHeadphones:](self, "setIsEnabledForHeadphones:", 0);
  *(&self->_isEnabledForCarPlay + 1) &= ~2u;
}

- (void)setIsEnabledForCarPlay:(BOOL)a3
{
  *(&self->_isEnabledForCarPlay + 1) |= 4u;
  self->_isEnabledForCarPlay = a3;
}

- (BOOL)hasIsEnabledForCarPlay
{
  return (*((unsigned __int8 *)&self->_isEnabledForCarPlay + 1) >> 2) & 1;
}

- (void)setHasIsEnabledForCarPlay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEnabledForCarPlay + 1) = *(&self->_isEnabledForCarPlay + 1) & 0xFB | v3;
}

- (void)deleteIsEnabledForCarPlay
{
  -[SISchemaSendWithoutConfirmation setIsEnabledForCarPlay:](self, "setIsEnabledForCarPlay:", 0);
  *(&self->_isEnabledForCarPlay + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSendWithoutConfirmationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isEnabledForCarPlay + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isEnabledForCarPlay + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(&self->_isEnabledForCarPlay + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  v5 = *(&self->_isEnabledForCarPlay + 1);
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
  int isEnabled;
  int v8;
  int isEnabledForHeadphones;
  int v10;
  int isEnabledForCarPlay;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isEnabledForCarPlay + 1);
  v6 = v4[11];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    isEnabled = self->_isEnabled;
    if (isEnabled != objc_msgSend(v4, "isEnabled"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isEnabledForCarPlay + 1);
    v6 = v4[11];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isEnabledForHeadphones = self->_isEnabledForHeadphones;
    if (isEnabledForHeadphones == objc_msgSend(v4, "isEnabledForHeadphones"))
    {
      v5 = *((unsigned __int8 *)&self->_isEnabledForCarPlay + 1);
      v6 = v4[11];
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
    isEnabledForCarPlay = self->_isEnabledForCarPlay;
    if (isEnabledForCarPlay != objc_msgSend(v4, "isEnabledForCarPlay"))
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

  if (!*(&self->_isEnabledForCarPlay + 1))
  {
    v2 = 0;
    if ((*(&self->_isEnabledForCarPlay + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isEnabledForCarPlay + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_isEnabled;
  if ((*(&self->_isEnabledForCarPlay + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isEnabledForHeadphones;
  if ((*(&self->_isEnabledForCarPlay + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isEnabledForCarPlay;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isEnabledForCarPlay + 1);
  if ((v4 & 1) == 0)
  {
    if ((*(&self->_isEnabledForCarPlay + 1) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaSendWithoutConfirmation isEnabledForCarPlay](self, "isEnabledForCarPlay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isEnabledForCarPlay"));

    if ((*(&self->_isEnabledForCarPlay + 1) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaSendWithoutConfirmation isEnabled](self, "isEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isEnabled"));

  v4 = *(&self->_isEnabledForCarPlay + 1);
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaSendWithoutConfirmation isEnabledForHeadphones](self, "isEnabledForHeadphones"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isEnabledForHeadphones"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaSendWithoutConfirmation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaSendWithoutConfirmation)initWithJSON:(id)a3
{
  void *v4;
  SISchemaSendWithoutConfirmation *v5;
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
    self = -[SISchemaSendWithoutConfirmation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaSendWithoutConfirmation)initWithDictionary:(id)a3
{
  id v4;
  SISchemaSendWithoutConfirmation *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaSendWithoutConfirmation *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaSendWithoutConfirmation;
  v5 = -[SISchemaSendWithoutConfirmation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSendWithoutConfirmation setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabledForHeadphones"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSendWithoutConfirmation setIsEnabledForHeadphones:](v5, "setIsEnabledForHeadphones:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabledForCarPlay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSendWithoutConfirmation setIsEnabledForCarPlay:](v5, "setIsEnabledForCarPlay:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isEnabledForHeadphones
{
  return self->_isEnabledForHeadphones;
}

- (BOOL)isEnabledForCarPlay
{
  return self->_isEnabledForCarPlay;
}

@end
