@implementation MHSchemaMHAdMatchingEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAdBlockerDismissalType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adBlockerDismissalType = a3;
}

- (BOOL)hasAdBlockerDismissalType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAdBlockerDismissalType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAdBlockerDismissalType
{
  -[MHSchemaMHAdMatchingEnded setAdBlockerDismissalType:](self, "setAdBlockerDismissalType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAdName
{
  return self->_adName != 0;
}

- (void)deleteAdName
{
  -[MHSchemaMHAdMatchingEnded setAdName:](self, "setAdName:", 0);
}

- (void)setShazamScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shazamScore = a3;
}

- (BOOL)hasShazamScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasShazamScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteShazamScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHAdMatchingEnded setShazamScore:](self, "setShazamScore:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAdBlockerSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_adBlockerSource = a3;
}

- (BOOL)hasAdBlockerSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAdBlockerSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAdBlockerSource
{
  -[MHSchemaMHAdMatchingEnded setAdBlockerSource:](self, "setAdBlockerSource:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHAdMatchingEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[MHSchemaMHAdMatchingEnded adName](self, "adName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int adBlockerDismissalType;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $73EB44B0B05169248299CBFE4D2A7E72 has;
  int v15;
  unsigned int v16;
  float shazamScore;
  float v18;
  int v19;
  int adBlockerSource;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    adBlockerDismissalType = self->_adBlockerDismissalType;
    if (adBlockerDismissalType != objc_msgSend(v4, "adBlockerDismissalType"))
      goto LABEL_19;
  }
  -[MHSchemaMHAdMatchingEnded adName](self, "adName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_19;
  }
  -[MHSchemaMHAdMatchingEnded adName](self, "adName");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[MHSchemaMHAdMatchingEnded adName](self, "adName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v15 = (*(unsigned int *)&has >> 1) & 1;
  v16 = v4[32];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  if (v15)
  {
    shazamScore = self->_shazamScore;
    objc_msgSend(v4, "shazamScore");
    if (shazamScore == v18)
    {
      has = self->_has;
      v16 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1))
    goto LABEL_19;
  if (v19)
  {
    adBlockerSource = self->_adBlockerSource;
    if (adBlockerSource != objc_msgSend(v4, "adBlockerSource"))
      goto LABEL_19;
  }
  v21 = 1;
LABEL_20:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  float shazamScore;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_adBlockerDismissalType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_adName, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    shazamScore = self->_shazamScore;
    v8 = shazamScore;
    if (shazamScore < 0.0)
      v8 = -shazamScore;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
    v11 = 2654435761 * self->_adBlockerSource;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[MHSchemaMHAdMatchingEnded adBlockerDismissalType](self, "adBlockerDismissalType") - 1;
    if (v5 > 3)
      v6 = CFSTR("ADBLOCKERDISMISSALTYPE_UNKNOWN");
    else
      v6 = off_1E562FF00[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("adBlockerDismissalType"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v7 = -[MHSchemaMHAdMatchingEnded adBlockerSource](self, "adBlockerSource");
    v8 = CFSTR("MHADBLOCKERSOURCE_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("MHADBLOCKERSOURCE_BUILTIN");
    if (v7 == 2)
      v9 = CFSTR("MHADBLOCKERSOURCE_ENDPOINT");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("adBlockerSource"));
  }
  if (self->_adName)
  {
    -[MHSchemaMHAdMatchingEnded adName](self, "adName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("adName"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHAdMatchingEnded shazamScore](self, "shazamScore");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("shazamScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAdMatchingEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAdMatchingEnded)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAdMatchingEnded *v5;
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
    self = -[MHSchemaMHAdMatchingEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAdMatchingEnded)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAdMatchingEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHAdMatchingEnded *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHAdMatchingEnded;
  v5 = -[MHSchemaMHAdMatchingEnded init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adBlockerDismissalType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAdMatchingEnded setAdBlockerDismissalType:](v5, "setAdBlockerDismissalType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[MHSchemaMHAdMatchingEnded setAdName:](v5, "setAdName:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shazamScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHAdMatchingEnded setShazamScore:](v5, "setShazamScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adBlockerSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAdMatchingEnded setAdBlockerSource:](v5, "setAdBlockerSource:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (int)adBlockerDismissalType
{
  return self->_adBlockerDismissalType;
}

- (NSString)adName
{
  return self->_adName;
}

- (void)setAdName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (float)shazamScore
{
  return self->_shazamScore;
}

- (int)adBlockerSource
{
  return self->_adBlockerSource;
}

- (void)setHasAdName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adName, 0);
}

@end
