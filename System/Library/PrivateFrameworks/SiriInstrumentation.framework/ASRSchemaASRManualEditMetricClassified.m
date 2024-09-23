@implementation ASRSchemaASRManualEditMetricClassified

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
  v9.super_class = (Class)ASRSchemaASRManualEditMetricClassified;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASRManualEditMetricClassified deleteOriginalAsrId](self, "deleteOriginalAsrId");
  return v5;
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

- (void)deleteOriginalAsrId
{
  -[ASRSchemaASRManualEditMetricClassified setOriginalAsrId:](self, "setOriginalAsrId:", 0);
}

- (void)setNumDeletions:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numDeletions = a3;
}

- (BOOL)hasNumDeletions
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumDeletions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumDeletions
{
  -[ASRSchemaASRManualEditMetricClassified setNumDeletions:](self, "setNumDeletions:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumInsertions:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numInsertions = a3;
}

- (BOOL)hasNumInsertions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumInsertions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumInsertions
{
  -[ASRSchemaASRManualEditMetricClassified setNumInsertions:](self, "setNumInsertions:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumSubstitutions:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSubstitutions = a3;
}

- (BOOL)hasNumSubstitutions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumSubstitutions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumSubstitutions
{
  -[ASRSchemaASRManualEditMetricClassified setNumSubstitutions:](self, "setNumSubstitutions:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRManualEditMetricClassifiedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $0733EC0DBCA0A975667092FC7B87D45A has;
  unsigned int v14;
  int numDeletions;
  int v16;
  int numInsertions;
  int v18;
  int numSubstitutions;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalAsrId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numDeletions = self->_numDeletions;
    if (numDeletions != objc_msgSend(v4, "numDeletions"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    numInsertions = self->_numInsertions;
    if (numInsertions == objc_msgSend(v4, "numInsertions"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    numSubstitutions = self->_numSubstitutions;
    if (numSubstitutions != objc_msgSend(v4, "numSubstitutions"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_originalAsrId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_numDeletions;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_numInsertions;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_numSubstitutions;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRManualEditMetricClassified numDeletions](self, "numDeletions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numDeletions"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRManualEditMetricClassified numInsertions](self, "numInsertions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numInsertions"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRManualEditMetricClassified numSubstitutions](self, "numSubstitutions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numSubstitutions"));

  }
LABEL_5:
  if (self->_originalAsrId)
  {
    -[ASRSchemaASRManualEditMetricClassified originalAsrId](self, "originalAsrId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originalAsrId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("originalAsrId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRManualEditMetricClassified dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRManualEditMetricClassified)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRManualEditMetricClassified *v5;
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
    self = -[ASRSchemaASRManualEditMetricClassified initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRManualEditMetricClassified)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRManualEditMetricClassified *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  ASRSchemaASRManualEditMetricClassified *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASRSchemaASRManualEditMetricClassified;
  v5 = -[ASRSchemaASRManualEditMetricClassified init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalAsrId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRManualEditMetricClassified setOriginalAsrId:](v5, "setOriginalAsrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDeletions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRManualEditMetricClassified setNumDeletions:](v5, "setNumDeletions:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numInsertions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRManualEditMetricClassified setNumInsertions:](v5, "setNumInsertions:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSubstitutions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRManualEditMetricClassified setNumSubstitutions:](v5, "setNumSubstitutions:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (void)setOriginalAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_originalAsrId, a3);
}

- (int)numDeletions
{
  return self->_numDeletions;
}

- (int)numInsertions
{
  return self->_numInsertions;
}

- (int)numSubstitutions
{
  return self->_numSubstitutions;
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

@end
