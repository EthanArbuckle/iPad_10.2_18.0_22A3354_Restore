@implementation ANCSchemaANCBackgroundContent

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMediaType:(int)a3
{
  *(&self->_isFocusModeEnabled + 1) |= 1u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaType
{
  return *(&self->_isFocusModeEnabled + 1);
}

- (void)setHasMediaType:(BOOL)a3
{
  *(&self->_isFocusModeEnabled + 1) = *(&self->_isFocusModeEnabled + 1) & 0xFE | a3;
}

- (void)deleteMediaType
{
  -[ANCSchemaANCBackgroundContent setMediaType:](self, "setMediaType:", 0);
  *(&self->_isFocusModeEnabled + 1) &= ~1u;
}

- (void)setIsFocusModeEnabled:(BOOL)a3
{
  *(&self->_isFocusModeEnabled + 1) |= 2u;
  self->_isFocusModeEnabled = a3;
}

- (BOOL)hasIsFocusModeEnabled
{
  return (*((unsigned __int8 *)&self->_isFocusModeEnabled + 1) >> 1) & 1;
}

- (void)setHasIsFocusModeEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isFocusModeEnabled + 1) = *(&self->_isFocusModeEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsFocusModeEnabled
{
  -[ANCSchemaANCBackgroundContent setIsFocusModeEnabled:](self, "setIsFocusModeEnabled:", 0);
  *(&self->_isFocusModeEnabled + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCBackgroundContentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isFocusModeEnabled + 1);
  v6 = v4;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    v5 = *(&self->_isFocusModeEnabled + 1);
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
  int mediaType;
  int v8;
  int isFocusModeEnabled;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  v5 = *((unsigned __int8 *)&self->_isFocusModeEnabled + 1);
  v6 = v4[13];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_10;
  if ((v5 & 1) != 0)
  {
    mediaType = self->_mediaType;
    if (mediaType != objc_msgSend(v4, "mediaType"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v5 = *((unsigned __int8 *)&self->_isFocusModeEnabled + 1);
    v6 = v4[13];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    isFocusModeEnabled = self->_isFocusModeEnabled;
    if (isFocusModeEnabled != objc_msgSend(v4, "isFocusModeEnabled"))
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

  if (*(&self->_isFocusModeEnabled + 1))
  {
    v2 = 2654435761 * self->_mediaType;
    if ((*(&self->_isFocusModeEnabled + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(&self->_isFocusModeEnabled + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_isFocusModeEnabled;
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
  v4 = *(&self->_isFocusModeEnabled + 1);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ANCSchemaANCBackgroundContent isFocusModeEnabled](self, "isFocusModeEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isFocusModeEnabled"));

    v4 = *(&self->_isFocusModeEnabled + 1);
  }
  if ((v4 & 1) != 0)
  {
    v6 = -[ANCSchemaANCBackgroundContent mediaType](self, "mediaType") - 1;
    if (v6 > 5)
      v7 = CFSTR("ANCMEDIATYPE_UNKNOWN");
    else
      v7 = off_1E5638930[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mediaType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ANCSchemaANCBackgroundContent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ANCSchemaANCBackgroundContent)initWithJSON:(id)a3
{
  void *v4;
  ANCSchemaANCBackgroundContent *v5;
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
    self = -[ANCSchemaANCBackgroundContent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ANCSchemaANCBackgroundContent)initWithDictionary:(id)a3
{
  id v4;
  ANCSchemaANCBackgroundContent *v5;
  void *v6;
  void *v7;
  ANCSchemaANCBackgroundContent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ANCSchemaANCBackgroundContent;
  v5 = -[ANCSchemaANCBackgroundContent init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCBackgroundContent setMediaType:](v5, "setMediaType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFocusModeEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCBackgroundContent setIsFocusModeEnabled:](v5, "setIsFocusModeEnabled:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (BOOL)isFocusModeEnabled
{
  return self->_isFocusModeEnabled;
}

@end
