@implementation DODMLASRSchemaDODMLASRConfusionPair

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
  v9.super_class = (Class)DODMLASRSchemaDODMLASRConfusionPair;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[DODMLASRSchemaDODMLASRConfusionPair deleteAsrId](self, "deleteAsrId");
  return v5;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (void)deleteAsrId
{
  -[DODMLASRSchemaDODMLASRConfusionPair setAsrId:](self, "setAsrId:", 0);
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorCode
{
  -[DODMLASRSchemaDODMLASRConfusionPair setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEditMethod:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_editMethod = a3;
}

- (BOOL)hasEditMethod
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEditMethod:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEditMethod
{
  -[DODMLASRSchemaDODMLASRConfusionPair setEditMethod:](self, "setEditMethod:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setEditReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_editReason = a3;
}

- (BOOL)hasEditReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEditReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEditReason
{
  -[DODMLASRSchemaDODMLASRConfusionPair setEditReason:](self, "setEditReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setRecognizedTextStartIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_recognizedTextStartIndex = a3;
}

- (BOOL)hasRecognizedTextStartIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasRecognizedTextStartIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteRecognizedTextStartIndex
{
  -[DODMLASRSchemaDODMLASRConfusionPair setRecognizedTextStartIndex:](self, "setRecognizedTextStartIndex:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRConfusionPairReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId");
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
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }
LABEL_9:

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
  $691E37601F70C0C341DF7725D80A806D has;
  unsigned int v14;
  int errorCode;
  int v16;
  int editMethod;
  int v18;
  int editReason;
  int v20;
  int recognizedTextStartIndex;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    editMethod = self->_editMethod;
    if (editMethod != objc_msgSend(v4, "editMethod"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    editReason = self->_editReason;
    if (editReason == objc_msgSend(v4, "editReason"))
    {
      has = self->_has;
      v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    recognizedTextStartIndex = self->_recognizedTextStartIndex;
    if (recognizedTextStartIndex != objc_msgSend(v4, "recognizedTextStartIndex"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_asrId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_editMethod;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_editReason;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_recognizedTextStartIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asrId)
  {
    -[DODMLASRSchemaDODMLASRConfusionPair asrId](self, "asrId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrId"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = -[DODMLASRSchemaDODMLASRConfusionPair editMethod](self, "editMethod");
    v9 = CFSTR("ASREDITMETHOD_UNKNOWN");
    if (v8 == 1)
      v9 = CFSTR("ASREDITMETHOD_ALTERNATIVE_SELECTION");
    if (v8 == 2)
      v10 = CFSTR("ASREDITMETHOD_KEYBOARD_CORRECTION");
    else
      v10 = v9;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("editMethod"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = -[DODMLASRSchemaDODMLASRConfusionPair editReason](self, "editReason") - 1;
    if (v11 > 2)
      v12 = CFSTR("ASREDITREASON_UNKNOWN");
    else
      v12 = off_1E562D188[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("editReason"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DODMLASRSchemaDODMLASRConfusionPair errorCode](self, "errorCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("errorCode"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DODMLASRSchemaDODMLASRConfusionPair recognizedTextStartIndex](self, "recognizedTextStartIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("recognizedTextStartIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRConfusionPair dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRConfusionPair)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRConfusionPair *v5;
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
    self = -[DODMLASRSchemaDODMLASRConfusionPair initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRConfusionPair)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRConfusionPair *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DODMLASRSchemaDODMLASRConfusionPair *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DODMLASRSchemaDODMLASRConfusionPair;
  v5 = -[DODMLASRSchemaDODMLASRConfusionPair init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DODMLASRSchemaDODMLASRConfusionPair setAsrId:](v5, "setAsrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRConfusionPair setErrorCode:](v5, "setErrorCode:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editMethod"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRConfusionPair setEditMethod:](v5, "setEditMethod:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRConfusionPair setEditReason:](v5, "setEditReason:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizedTextStartIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRConfusionPair setRecognizedTextStartIndex:](v5, "setRecognizedTextStartIndex:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)editMethod
{
  return self->_editMethod;
}

- (int)editReason
{
  return self->_editReason;
}

- (int)recognizedTextStartIndex
{
  return self->_recognizedTextStartIndex;
}

- (void)setHasAsrId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrId, 0);
}

@end
