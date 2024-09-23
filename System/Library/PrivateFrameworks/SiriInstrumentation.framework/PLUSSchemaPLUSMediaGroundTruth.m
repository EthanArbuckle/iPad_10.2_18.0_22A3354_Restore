@implementation PLUSSchemaPLUSMediaGroundTruth

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
  int v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSMediaGroundTruth;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PLUSSchemaPLUSMediaGroundTruth deleteSelectedMediaEntityAdamId](self, "deleteSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaGroundTruth deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PLUSSchemaPLUSMediaGroundTruth deleteSelectedMediaEntityAdamId](self, "deleteSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaGroundTruth deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PLUSSchemaPLUSMediaGroundTruth deleteSelectedMediaEntityAdamId](self, "deleteSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaGroundTruth deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PLUSSchemaPLUSMediaGroundTruth deleteSelectedMediaEntityAdamId](self, "deleteSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaGroundTruth deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PLUSSchemaPLUSMediaGroundTruth deleteSelectedMediaEntityAdamId](self, "deleteSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaGroundTruth deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSMediaGroundTruth deleteGroundTruthId](self, "deleteGroundTruthId");

  return v5;
}

- (BOOL)hasGroundTruthId
{
  return self->_groundTruthId != 0;
}

- (void)deleteGroundTruthId
{
  -[PLUSSchemaPLUSMediaGroundTruth setGroundTruthId:](self, "setGroundTruthId:", 0);
}

- (void)setGroundTruthSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_groundTruthSource = a3;
}

- (BOOL)hasGroundTruthSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasGroundTruthSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteGroundTruthSource
{
  -[PLUSSchemaPLUSMediaGroundTruth setGroundTruthSource:](self, "setGroundTruthSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSelectedMediaEntityAdamId
{
  return self->_selectedMediaEntityAdamId != 0;
}

- (void)deleteSelectedMediaEntityAdamId
{
  -[PLUSSchemaPLUSMediaGroundTruth setSelectedMediaEntityAdamId:](self, "setSelectedMediaEntityAdamId:", 0);
}

- (BOOL)hasInferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId != 0;
}

- (void)deleteInferredMediaEntityAdamId
{
  -[PLUSSchemaPLUSMediaGroundTruth setInferredMediaEntityAdamId:](self, "setInferredMediaEntityAdamId:", 0);
}

- (void)setSelectedMediaEntitylocality:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_selectedMediaEntitylocality = a3;
}

- (BOOL)hasSelectedMediaEntitylocality
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSelectedMediaEntitylocality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSelectedMediaEntitylocality
{
  -[PLUSSchemaPLUSMediaGroundTruth setSelectedMediaEntitylocality:](self, "setSelectedMediaEntitylocality:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setInferredMediaEntitylocality:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_inferredMediaEntitylocality = a3;
}

- (BOOL)hasInferredMediaEntitylocality
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasInferredMediaEntitylocality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteInferredMediaEntitylocality
{
  -[PLUSSchemaPLUSMediaGroundTruth setInferredMediaEntitylocality:](self, "setInferredMediaEntitylocality:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaGroundTruthReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  id v10;

  v10 = a3;
  -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PLUSSchemaPLUSMediaGroundTruth selectedMediaEntityAdamId](self, "selectedMediaEntityAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSMediaGroundTruth inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int groundTruthSource;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  $A3E602CA8F7F563F5D81FFC19ABBE993 has;
  int v26;
  unsigned int v27;
  int selectedMediaEntitylocality;
  int v29;
  int inferredMediaEntitylocality;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groundTruthId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groundTruthId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    groundTruthSource = self->_groundTruthSource;
    if (groundTruthSource != objc_msgSend(v4, "groundTruthSource"))
      goto LABEL_20;
  }
  -[PLUSSchemaPLUSMediaGroundTruth selectedMediaEntityAdamId](self, "selectedMediaEntityAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedMediaEntityAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[PLUSSchemaPLUSMediaGroundTruth selectedMediaEntityAdamId](self, "selectedMediaEntityAdamId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PLUSSchemaPLUSMediaGroundTruth selectedMediaEntityAdamId](self, "selectedMediaEntityAdamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedMediaEntityAdamId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaGroundTruth inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferredMediaEntityAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[PLUSSchemaPLUSMediaGroundTruth inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PLUSSchemaPLUSMediaGroundTruth inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferredMediaEntityAdamId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v26 = (*(unsigned int *)&has >> 1) & 1;
  v27 = v4[48];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      selectedMediaEntitylocality = self->_selectedMediaEntitylocality;
      if (selectedMediaEntitylocality != objc_msgSend(v4, "selectedMediaEntitylocality"))
        goto LABEL_20;
      has = self->_has;
      v27 = v4[48];
    }
    v29 = (*(unsigned int *)&has >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (inferredMediaEntitylocality = self->_inferredMediaEntitylocality,
            inferredMediaEntitylocality == objc_msgSend(v4, "inferredMediaEntitylocality")))
      {
        v23 = 1;
        goto LABEL_21;
      }
    }
  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[SISchemaUUID hash](self->_groundTruthId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_groundTruthSource;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_selectedMediaEntityAdamId, "hash");
  v6 = -[NSString hash](self->_inferredMediaEntityAdamId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_selectedMediaEntitylocality;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_inferredMediaEntitylocality;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_groundTruthId)
  {
    -[PLUSSchemaPLUSMediaGroundTruth groundTruthId](self, "groundTruthId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groundTruthId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("groundTruthId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[PLUSSchemaPLUSMediaGroundTruth groundTruthSource](self, "groundTruthSource") - 1;
    if (v7 > 8)
      v8 = CFSTR("PLUSMEDIAGROUNDTRUTHSOURCE_UNKNOWN");
    else
      v8 = off_1E5639330[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("groundTruthSource"));
  }
  if (self->_inferredMediaEntityAdamId)
  {
    -[PLUSSchemaPLUSMediaGroundTruth inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("inferredMediaEntityAdamId"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v11 = -[PLUSSchemaPLUSMediaGroundTruth inferredMediaEntitylocality](self, "inferredMediaEntitylocality") - 1;
    if (v11 > 2)
      v12 = CFSTR("PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN");
    else
      v12 = off_1E5639378[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("inferredMediaEntitylocality"));
  }
  if (self->_selectedMediaEntityAdamId)
  {
    -[PLUSSchemaPLUSMediaGroundTruth selectedMediaEntityAdamId](self, "selectedMediaEntityAdamId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("selectedMediaEntityAdamId"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v15 = -[PLUSSchemaPLUSMediaGroundTruth selectedMediaEntitylocality](self, "selectedMediaEntitylocality") - 1;
    if (v15 > 2)
      v16 = CFSTR("PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN");
    else
      v16 = off_1E5639378[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("selectedMediaEntitylocality"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSMediaGroundTruth dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSMediaGroundTruth)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSMediaGroundTruth *v5;
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
    self = -[PLUSSchemaPLUSMediaGroundTruth initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSMediaGroundTruth)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSMediaGroundTruth *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLUSSchemaPLUSMediaGroundTruth *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLUSSchemaPLUSMediaGroundTruth;
  v5 = -[PLUSSchemaPLUSMediaGroundTruth init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSMediaGroundTruth setGroundTruthId:](v5, "setGroundTruthId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaGroundTruth setGroundTruthSource:](v5, "setGroundTruthSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedMediaEntityAdamId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PLUSSchemaPLUSMediaGroundTruth setSelectedMediaEntityAdamId:](v5, "setSelectedMediaEntityAdamId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferredMediaEntityAdamId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[PLUSSchemaPLUSMediaGroundTruth setInferredMediaEntityAdamId:](v5, "setInferredMediaEntityAdamId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedMediaEntitylocality"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaGroundTruth setSelectedMediaEntitylocality:](v5, "setSelectedMediaEntitylocality:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferredMediaEntitylocality"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaGroundTruth setInferredMediaEntitylocality:](v5, "setInferredMediaEntitylocality:", objc_msgSend(v14, "intValue"));
    v15 = v5;

  }
  return v5;
}

- (SISchemaUUID)groundTruthId
{
  return self->_groundTruthId;
}

- (void)setGroundTruthId:(id)a3
{
  objc_storeStrong((id *)&self->_groundTruthId, a3);
}

- (int)groundTruthSource
{
  return self->_groundTruthSource;
}

- (NSString)selectedMediaEntityAdamId
{
  return self->_selectedMediaEntityAdamId;
}

- (void)setSelectedMediaEntityAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)inferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId;
}

- (void)setInferredMediaEntityAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)selectedMediaEntitylocality
{
  return self->_selectedMediaEntitylocality;
}

- (int)inferredMediaEntitylocality
{
  return self->_inferredMediaEntitylocality;
}

- (void)setHasGroundTruthId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSelectedMediaEntityAdamId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasInferredMediaEntityAdamId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_selectedMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_groundTruthId, 0);
}

@end
