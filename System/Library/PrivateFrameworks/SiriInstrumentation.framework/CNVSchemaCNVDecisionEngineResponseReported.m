@implementation CNVSchemaCNVDecisionEngineResponseReported

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
  v9.super_class = (Class)CNVSchemaCNVDecisionEngineResponseReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[CNVSchemaCNVDecisionEngineResponseReported deleteParseHypothesisId](self, "deleteParseHypothesisId");
  return v5;
}

- (BOOL)hasFlowHandlerId
{
  return self->_flowHandlerId != 0;
}

- (void)deleteFlowHandlerId
{
  -[CNVSchemaCNVDecisionEngineResponseReported setFlowHandlerId:](self, "setFlowHandlerId:", 0);
}

- (BOOL)hasParseHypothesisId
{
  return self->_parseHypothesisId != 0;
}

- (void)deleteParseHypothesisId
{
  -[CNVSchemaCNVDecisionEngineResponseReported setParseHypothesisId:](self, "setParseHypothesisId:", 0);
}

- (void)setIsExistingFlowSelected:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 1) |= 1u;
  self->_isExistingFlowSelected = a3;
}

- (BOOL)hasIsExistingFlowSelected
{
  return *(&self->_isInterpretableAsUniversalCommand + 1);
}

- (void)setHasIsExistingFlowSelected:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 1) = *(&self->_isInterpretableAsUniversalCommand + 1) & 0xFE | a3;
}

- (void)deleteIsExistingFlowSelected
{
  -[CNVSchemaCNVDecisionEngineResponseReported setIsExistingFlowSelected:](self, "setIsExistingFlowSelected:", 0);
  *(&self->_isInterpretableAsUniversalCommand + 1) &= ~1u;
}

- (void)setIsInterpretableAsUniversalCommand:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 1) |= 2u;
  self->_isInterpretableAsUniversalCommand = a3;
}

- (BOOL)hasIsInterpretableAsUniversalCommand
{
  return (*((unsigned __int8 *)&self->_isInterpretableAsUniversalCommand + 1) >> 1) & 1;
}

- (void)setHasIsInterpretableAsUniversalCommand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isInterpretableAsUniversalCommand + 1) = *(&self->_isInterpretableAsUniversalCommand + 1) & 0xFD | v3;
}

- (void)deleteIsInterpretableAsUniversalCommand
{
  -[CNVSchemaCNVDecisionEngineResponseReported setIsInterpretableAsUniversalCommand:](self, "setIsInterpretableAsUniversalCommand:", 0);
  *(&self->_isInterpretableAsUniversalCommand + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVDecisionEngineResponseReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNVSchemaCNVDecisionEngineResponseReported flowHandlerId](self, "flowHandlerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = *(&self->_isInterpretableAsUniversalCommand + 1);
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *(&self->_isInterpretableAsUniversalCommand + 1);
  }
  v8 = v9;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = v9;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  unsigned int v19;
  unsigned int v20;
  int isExistingFlowSelected;
  int v22;
  int isInterpretableAsUniversalCommand;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[CNVSchemaCNVDecisionEngineResponseReported flowHandlerId](self, "flowHandlerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowHandlerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[CNVSchemaCNVDecisionEngineResponseReported flowHandlerId](self, "flowHandlerId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CNVSchemaCNVDecisionEngineResponseReported flowHandlerId](self, "flowHandlerId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowHandlerId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parseHypothesisId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parseHypothesisId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = *((unsigned __int8 *)&self->_isInterpretableAsUniversalCommand + 1);
  v20 = v4[26];
  if ((v19 & 1) == (v20 & 1))
  {
    if ((v19 & 1) != 0)
    {
      isExistingFlowSelected = self->_isExistingFlowSelected;
      if (isExistingFlowSelected != objc_msgSend(v4, "isExistingFlowSelected"))
        goto LABEL_12;
      v19 = *((unsigned __int8 *)&self->_isInterpretableAsUniversalCommand + 1);
      v20 = v4[26];
    }
    v22 = (v19 >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (isInterpretableAsUniversalCommand = self->_isInterpretableAsUniversalCommand,
            isInterpretableAsUniversalCommand == objc_msgSend(v4, "isInterpretableAsUniversalCommand")))
      {
        v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_flowHandlerId, "hash");
  v4 = -[SISchemaUUID hash](self->_parseHypothesisId, "hash");
  if (*(&self->_isInterpretableAsUniversalCommand + 1))
  {
    v5 = 2654435761 * self->_isExistingFlowSelected;
    if ((*(&self->_isInterpretableAsUniversalCommand + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(&self->_isInterpretableAsUniversalCommand + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_isInterpretableAsUniversalCommand;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_flowHandlerId)
  {
    -[CNVSchemaCNVDecisionEngineResponseReported flowHandlerId](self, "flowHandlerId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("flowHandlerId"));

  }
  v6 = *(&self->_isInterpretableAsUniversalCommand + 1);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNVSchemaCNVDecisionEngineResponseReported isExistingFlowSelected](self, "isExistingFlowSelected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isExistingFlowSelected"));

    v6 = *(&self->_isInterpretableAsUniversalCommand + 1);
  }
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNVSchemaCNVDecisionEngineResponseReported isInterpretableAsUniversalCommand](self, "isInterpretableAsUniversalCommand"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isInterpretableAsUniversalCommand"));

  }
  if (self->_parseHypothesisId)
  {
    -[CNVSchemaCNVDecisionEngineResponseReported parseHypothesisId](self, "parseHypothesisId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("parseHypothesisId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("parseHypothesisId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVDecisionEngineResponseReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVDecisionEngineResponseReported)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVDecisionEngineResponseReported *v5;
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
    self = -[CNVSchemaCNVDecisionEngineResponseReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVDecisionEngineResponseReported)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVDecisionEngineResponseReported *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  CNVSchemaCNVDecisionEngineResponseReported *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNVSchemaCNVDecisionEngineResponseReported;
  v5 = -[CNVSchemaCNVDecisionEngineResponseReported init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowHandlerId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[CNVSchemaCNVDecisionEngineResponseReported setFlowHandlerId:](v5, "setFlowHandlerId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parseHypothesisId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[CNVSchemaCNVDecisionEngineResponseReported setParseHypothesisId:](v5, "setParseHypothesisId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExistingFlowSelected"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVDecisionEngineResponseReported setIsExistingFlowSelected:](v5, "setIsExistingFlowSelected:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInterpretableAsUniversalCommand"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVDecisionEngineResponseReported setIsInterpretableAsUniversalCommand:](v5, "setIsInterpretableAsUniversalCommand:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (NSString)flowHandlerId
{
  return self->_flowHandlerId;
}

- (void)setFlowHandlerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)parseHypothesisId
{
  return self->_parseHypothesisId;
}

- (void)setParseHypothesisId:(id)a3
{
  objc_storeStrong((id *)&self->_parseHypothesisId, a3);
}

- (BOOL)isExistingFlowSelected
{
  return self->_isExistingFlowSelected;
}

- (BOOL)isInterpretableAsUniversalCommand
{
  return self->_isInterpretableAsUniversalCommand;
}

- (void)setHasFlowHandlerId:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 2) = a3;
}

- (void)setHasParseHypothesisId:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseHypothesisId, 0);
  objc_storeStrong((id *)&self->_flowHandlerId, 0);
}

@end
