@implementation INFERENCESchemaINFERENCESpeechAlternativeRanks

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsError:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isError = a3;
}

- (BOOL)hasIsError
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsError:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsError
{
  -[INFERENCESchemaINFERENCESpeechAlternativeRanks setIsError:](self, "setIsError:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVersion
{
  -[INFERENCESchemaINFERENCESpeechAlternativeRanks setVersion:](self, "setVersion:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setGivenNameRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_givenNameRank = a3;
}

- (BOOL)hasGivenNameRank
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasGivenNameRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteGivenNameRank
{
  -[INFERENCESchemaINFERENCESpeechAlternativeRanks setGivenNameRank:](self, "setGivenNameRank:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setMiddleNameRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_middleNameRank = a3;
}

- (BOOL)hasMiddleNameRank
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMiddleNameRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteMiddleNameRank
{
  -[INFERENCESchemaINFERENCESpeechAlternativeRanks setMiddleNameRank:](self, "setMiddleNameRank:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setFamilyNameRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_familyNameRank = a3;
}

- (BOOL)hasFamilyNameRank
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasFamilyNameRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteFamilyNameRank
{
  -[INFERENCESchemaINFERENCESpeechAlternativeRanks setFamilyNameRank:](self, "setFamilyNameRank:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setFullNameRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_fullNameRank = a3;
}

- (BOOL)hasFullNameRank
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasFullNameRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteFullNameRank
{
  -[INFERENCESchemaINFERENCESpeechAlternativeRanks setFullNameRank:](self, "setFullNameRank:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCESpeechAlternativeRanksReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $81156445DA16256DF4E3E07EE8BEC159 has;
  unsigned int v6;
  int isError;
  int v8;
  unsigned int version;
  int v10;
  unsigned int givenNameRank;
  int v12;
  unsigned int middleNameRank;
  int v14;
  unsigned int familyNameRank;
  int v16;
  unsigned int fullNameRank;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isError = self->_isError;
    if (isError != objc_msgSend(v4, "isError"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    version = self->_version;
    if (version != objc_msgSend(v4, "version"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    givenNameRank = self->_givenNameRank;
    if (givenNameRank != objc_msgSend(v4, "givenNameRank"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    middleNameRank = self->_middleNameRank;
    if (middleNameRank != objc_msgSend(v4, "middleNameRank"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    familyNameRank = self->_familyNameRank;
    if (familyNameRank == objc_msgSend(v4, "familyNameRank"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v16)
  {
    fullNameRank = self->_fullNameRank;
    if (fullNameRank != objc_msgSend(v4, "fullNameRank"))
      goto LABEL_26;
  }
  v18 = 1;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isError;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_version;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_givenNameRank;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_middleNameRank;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_familyNameRank;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_fullNameRank;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks familyNameRank](self, "familyNameRank"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("familyNameRank"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks fullNameRank](self, "fullNameRank"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("fullNameRank"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks givenNameRank](self, "givenNameRank"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("givenNameRank"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks middleNameRank](self, "middleNameRank"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("middleNameRank"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks isError](self, "isError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isError"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks version](self, "version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("version"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCESpeechAlternativeRanks dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCESpeechAlternativeRanks)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCESpeechAlternativeRanks *v5;
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
    self = -[INFERENCESchemaINFERENCESpeechAlternativeRanks initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCESpeechAlternativeRanks)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCESpeechAlternativeRanks *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INFERENCESchemaINFERENCESpeechAlternativeRanks *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INFERENCESchemaINFERENCESpeechAlternativeRanks;
  v5 = -[INFERENCESchemaINFERENCESpeechAlternativeRanks init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setIsError:](v5, "setIsError:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setVersion:](v5, "setVersion:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("givenNameRank"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setGivenNameRank:](v5, "setGivenNameRank:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("middleNameRank"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setMiddleNameRank:](v5, "setMiddleNameRank:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("familyNameRank"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setFamilyNameRank:](v5, "setFamilyNameRank:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullNameRank"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setFullNameRank:](v5, "setFullNameRank:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (BOOL)isError
{
  return self->_isError;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)givenNameRank
{
  return self->_givenNameRank;
}

- (unsigned)middleNameRank
{
  return self->_middleNameRank;
}

- (unsigned)familyNameRank
{
  return self->_familyNameRank;
}

- (unsigned)fullNameRank
{
  return self->_fullNameRank;
}

@end
