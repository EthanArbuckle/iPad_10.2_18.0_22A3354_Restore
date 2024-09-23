@implementation NLXSchemaSSUBackgroundUpdateAppCategoryInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCategoryType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_categoryType = a3;
}

- (BOOL)hasCategoryType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCategoryType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCategoryType
{
  -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setCategoryType:](self, "setCategoryType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumAppExamplesPositive:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numAppExamplesPositive = a3;
}

- (BOOL)hasNumAppExamplesPositive
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumAppExamplesPositive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumAppExamplesPositive
{
  -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setNumAppExamplesPositive:](self, "setNumAppExamplesPositive:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumAppExamplesNegative:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numAppExamplesNegative = a3;
}

- (BOOL)hasNumAppExamplesNegative
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumAppExamplesNegative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumAppExamplesNegative
{
  -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setNumAppExamplesNegative:](self, "setNumAppExamplesNegative:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCacheAction:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cacheAction = a3;
}

- (BOOL)hasCacheAction
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCacheAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCacheAction
{
  -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setCacheAction:](self, "setCacheAction:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUBackgroundUpdateAppCategoryInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8069672B67CAA32AB4B7CFF3B6621F51 has;
  unsigned int v6;
  int categoryType;
  int v8;
  unsigned int numAppExamplesPositive;
  int v10;
  unsigned int numAppExamplesNegative;
  int v12;
  int cacheAction;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    categoryType = self->_categoryType;
    if (categoryType != objc_msgSend(v4, "categoryType"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    numAppExamplesPositive = self->_numAppExamplesPositive;
    if (numAppExamplesPositive != objc_msgSend(v4, "numAppExamplesPositive"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    numAppExamplesNegative = self->_numAppExamplesNegative;
    if (numAppExamplesNegative == objc_msgSend(v4, "numAppExamplesNegative"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    cacheAction = self->_cacheAction;
    if (cacheAction != objc_msgSend(v4, "cacheAction"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_categoryType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_numAppExamplesPositive;
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
  v4 = 2654435761 * self->_numAppExamplesNegative;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_cacheAction;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo cacheAction](self, "cacheAction") - 1;
    if (v5 > 2)
      v6 = CFSTR("SSUCACHEACTION_UNKNOWN");
    else
      v6 = off_1E563A8E0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cacheAction"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo categoryType](self, "categoryType") - 1;
    if (v7 > 3)
      v8 = CFSTR("SSUCATEGORYTYPE_UNKNOWN");
    else
      v8 = off_1E563A8F8[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("categoryType"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo numAppExamplesNegative](self, "numAppExamplesNegative"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numAppExamplesNegative"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo numAppExamplesPositive](self, "numAppExamplesPositive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numAppExamplesPositive"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaSSUBackgroundUpdateAppCategoryInfo)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaSSUBackgroundUpdateAppCategoryInfo *v5;
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
    self = -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaSSUBackgroundUpdateAppCategoryInfo)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaSSUBackgroundUpdateAppCategoryInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLXSchemaSSUBackgroundUpdateAppCategoryInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaSSUBackgroundUpdateAppCategoryInfo;
  v5 = -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setCategoryType:](v5, "setCategoryType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppExamplesPositive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setNumAppExamplesPositive:](v5, "setNumAppExamplesPositive:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppExamplesNegative"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setNumAppExamplesNegative:](v5, "setNumAppExamplesNegative:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setCacheAction:](v5, "setCacheAction:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int)categoryType
{
  return self->_categoryType;
}

- (unsigned)numAppExamplesPositive
{
  return self->_numAppExamplesPositive;
}

- (unsigned)numAppExamplesNegative
{
  return self->_numAppExamplesNegative;
}

- (int)cacheAction
{
  return self->_cacheAction;
}

@end
