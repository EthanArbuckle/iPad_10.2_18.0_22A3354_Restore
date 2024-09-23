@implementation ASRSchemaASRAlternativeSelectionTextCategorized

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
  v10.super_class = (Class)ASRSchemaASRAlternativeSelectionTextCategorized;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[ASRSchemaASRAlternativeSelectionTextCategorized deleteFullCorrectedText](self, "deleteFullCorrectedText");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[ASRSchemaASRAlternativeSelectionTextCategorized deleteFullCorrectedText](self, "deleteFullCorrectedText");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[ASRSchemaASRAlternativeSelectionTextCategorized deleteFullCorrectedText](self, "deleteFullCorrectedText");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[ASRSchemaASRAlternativeSelectionTextCategorized deleteFullCorrectedText](self, "deleteFullCorrectedText");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[ASRSchemaASRAlternativeSelectionTextCategorized deleteFullCorrectedText](self, "deleteFullCorrectedText");
  -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRAlternativeSelectionTextCategorized deleteOriginalAsrId](self, "deleteOriginalAsrId");

  return v5;
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

- (void)deleteOriginalAsrId
{
  -[ASRSchemaASRAlternativeSelectionTextCategorized setOriginalAsrId:](self, "setOriginalAsrId:", 0);
}

- (BOOL)hasFullCorrectedText
{
  return self->_fullCorrectedText != 0;
}

- (void)deleteFullCorrectedText
{
  -[ASRSchemaASRAlternativeSelectionTextCategorized setFullCorrectedText:](self, "setFullCorrectedText:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRAlternativeSelectionTextCategorizedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRAlternativeSelectionTextCategorized fullCorrectedText](self, "fullCorrectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalAsrId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ASRSchemaASRAlternativeSelectionTextCategorized fullCorrectedText](self, "fullCorrectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullCorrectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRAlternativeSelectionTextCategorized fullCorrectedText](self, "fullCorrectedText");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[ASRSchemaASRAlternativeSelectionTextCategorized fullCorrectedText](self, "fullCorrectedText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullCorrectedText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaUUID hash](self->_originalAsrId, "hash");
  return -[NSString hash](self->_fullCorrectedText, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fullCorrectedText)
  {
    -[ASRSchemaASRAlternativeSelectionTextCategorized fullCorrectedText](self, "fullCorrectedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fullCorrectedText"));

  }
  if (self->_originalAsrId)
  {
    -[ASRSchemaASRAlternativeSelectionTextCategorized originalAsrId](self, "originalAsrId");
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
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalAsrId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRAlternativeSelectionTextCategorized dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRAlternativeSelectionTextCategorized)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRAlternativeSelectionTextCategorized *v5;
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
    self = -[ASRSchemaASRAlternativeSelectionTextCategorized initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRAlternativeSelectionTextCategorized)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRAlternativeSelectionTextCategorized *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  ASRSchemaASRAlternativeSelectionTextCategorized *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRAlternativeSelectionTextCategorized;
  v5 = -[ASRSchemaASRAlternativeSelectionTextCategorized init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalAsrId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRAlternativeSelectionTextCategorized setOriginalAsrId:](v5, "setOriginalAsrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullCorrectedText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ASRSchemaASRAlternativeSelectionTextCategorized setFullCorrectedText:](v5, "setFullCorrectedText:", v9);

    }
    v10 = v5;

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

- (NSString)fullCorrectedText
{
  return self->_fullCorrectedText;
}

- (void)setFullCorrectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  self->_hasOriginalAsrId = a3;
}

- (void)setHasFullCorrectedText:(BOOL)a3
{
  self->_hasFullCorrectedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullCorrectedText, 0);
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

@end
