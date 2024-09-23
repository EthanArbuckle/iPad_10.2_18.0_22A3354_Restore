@implementation DODMLASRSchemaDODMLASRTokenInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRTokenInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[DODMLASRSchemaDODMLASRTokenInfo deleteToken](self, "deleteToken");
  return v5;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (void)deleteToken
{
  -[DODMLASRSchemaDODMLASRTokenInfo setToken:](self, "setToken:", 0);
}

- (void)setAcousticCost:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_acousticCost = a3;
}

- (BOOL)hasAcousticCost
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAcousticCost:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAcousticCost
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRTokenInfo setAcousticCost:](self, "setAcousticCost:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSilenceAcousticCost:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_silenceAcousticCost = a3;
}

- (BOOL)hasSilenceAcousticCost
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSilenceAcousticCost:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSilenceAcousticCost
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRTokenInfo setSilenceAcousticCost:](self, "setSilenceAcousticCost:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearNumBackoffs
{
  -[NSArray removeAllObjects](self->_numBackoffs, "removeAllObjects");
}

- (void)addNumBackoffs:(unsigned int)a3
{
  uint64_t v3;
  NSArray *numBackoffs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  numBackoffs = self->_numBackoffs;
  if (!numBackoffs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_numBackoffs;
    self->_numBackoffs = v6;

    numBackoffs = self->_numBackoffs;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](numBackoffs, "addObject:", v8);

}

- (unint64_t)numBackoffsCount
{
  return -[NSArray count](self->_numBackoffs, "count");
}

- (unsigned)numBackoffsAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_numBackoffs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearLanguageModelCosts
{
  -[NSArray removeAllObjects](self->_languageModelCosts, "removeAllObjects");
}

- (void)addLanguageModelCosts:(float)a3
{
  NSArray *languageModelCosts;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  languageModelCosts = self->_languageModelCosts;
  if (!languageModelCosts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_languageModelCosts;
    self->_languageModelCosts = v6;

    languageModelCosts = self->_languageModelCosts;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](languageModelCosts, "addObject:", v9);

}

- (unint64_t)languageModelCostsCount
{
  return -[NSArray count](self->_languageModelCosts, "count");
}

- (float)languageModelCostsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_languageModelCosts, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return DODMLASRSchemaDODMLASRTokenInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char has;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_numBackoffs;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_languageModelCosts;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "floatValue", (_QWORD)v18);
        PBDataWriterWriteFloatField();
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $61D434AF3480A26A09F428C40ED43F2C has;
  unsigned int v13;
  float acousticCost;
  float v15;
  int v16;
  float silenceAcousticCost;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_24;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    acousticCost = self->_acousticCost;
    objc_msgSend(v4, "acousticCost");
    if (acousticCost != v15)
      goto LABEL_24;
    has = self->_has;
    v13 = v4[40];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    silenceAcousticCost = self->_silenceAcousticCost;
    objc_msgSend(v4, "silenceAcousticCost");
    if (silenceAcousticCost != v18)
      goto LABEL_24;
  }
  -[DODMLASRSchemaDODMLASRTokenInfo numBackoffs](self, "numBackoffs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numBackoffs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[DODMLASRSchemaDODMLASRTokenInfo numBackoffs](self, "numBackoffs");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[DODMLASRSchemaDODMLASRTokenInfo numBackoffs](self, "numBackoffs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numBackoffs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_24;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRTokenInfo languageModelCosts](self, "languageModelCosts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageModelCosts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[DODMLASRSchemaDODMLASRTokenInfo languageModelCosts](self, "languageModelCosts");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_27:
    v29 = 1;
    goto LABEL_25;
  }
  v25 = (void *)v24;
  -[DODMLASRSchemaDODMLASRTokenInfo languageModelCosts](self, "languageModelCosts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageModelCosts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v29 = 0;
LABEL_25:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  float acousticCost;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float silenceAcousticCost;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;

  v3 = -[ASRSchemaASRToken hash](self->_token, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    acousticCost = self->_acousticCost;
    v7 = acousticCost;
    if (acousticCost < 0.0)
      v7 = -acousticCost;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    silenceAcousticCost = self->_silenceAcousticCost;
    v12 = silenceAcousticCost;
    if (silenceAcousticCost < 0.0)
      v12 = -silenceAcousticCost;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = v5 ^ v3 ^ v10 ^ -[NSArray hash](self->_numBackoffs, "hash");
  return v15 ^ -[NSArray hash](self->_languageModelCosts, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASRTokenInfo acousticCost](self, "acousticCost");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("acousticCost"));

  }
  if (-[NSArray count](self->_languageModelCosts, "count"))
  {
    -[DODMLASRSchemaDODMLASRTokenInfo languageModelCosts](self, "languageModelCosts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("languageModelCosts"));

  }
  if (-[NSArray count](self->_numBackoffs, "count"))
  {
    -[DODMLASRSchemaDODMLASRTokenInfo numBackoffs](self, "numBackoffs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numBackoffs"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASRTokenInfo silenceAcousticCost](self, "silenceAcousticCost");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("silenceAcousticCost"));

  }
  if (self->_token)
  {
    -[DODMLASRSchemaDODMLASRTokenInfo token](self, "token");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("token"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("token"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRTokenInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRTokenInfo)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRTokenInfo *v5;
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
    self = -[DODMLASRSchemaDODMLASRTokenInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRTokenInfo)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRTokenInfo *v5;
  void *v6;
  ASRSchemaASRToken *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  DODMLASRSchemaDODMLASRTokenInfo *v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DODMLASRSchemaDODMLASRTokenInfo;
  v5 = -[DODMLASRSchemaDODMLASRTokenInfo init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ASRSchemaASRToken initWithDictionary:]([ASRSchemaASRToken alloc], "initWithDictionary:", v6);
      -[DODMLASRSchemaDODMLASRTokenInfo setToken:](v5, "setToken:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acousticCost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[DODMLASRSchemaDODMLASRTokenInfo setAcousticCost:](v5, "setAcousticCost:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("silenceAcousticCost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[DODMLASRSchemaDODMLASRTokenInfo setSilenceAcousticCost:](v5, "setSilenceAcousticCost:");
    }
    v27 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numBackoffs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v34;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v34 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[DODMLASRSchemaDODMLASRTokenInfo addNumBackoffs:](v5, "addNumBackoffs:", objc_msgSend(v16, "unsignedIntValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v13);
      }

      v8 = v28;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageModelCosts"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v6;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v23, "floatValue");
              -[DODMLASRSchemaDODMLASRTokenInfo addLanguageModelCosts:](v5, "addLanguageModelCosts:");
            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v20);
      }

      v6 = v26;
      v8 = v28;
    }
    v24 = v5;

  }
  return v5;
}

- (ASRSchemaASRToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (float)acousticCost
{
  return self->_acousticCost;
}

- (float)silenceAcousticCost
{
  return self->_silenceAcousticCost;
}

- (NSArray)numBackoffs
{
  return self->_numBackoffs;
}

- (void)setNumBackoffs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)languageModelCosts
{
  return self->_languageModelCosts;
}

- (void)setLanguageModelCosts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasToken:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageModelCosts, 0);
  objc_storeStrong((id *)&self->_numBackoffs, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
