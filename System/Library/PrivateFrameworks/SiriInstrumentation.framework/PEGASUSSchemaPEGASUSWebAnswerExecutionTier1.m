@implementation PEGASUSSchemaPEGASUSWebAnswerExecutionTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteEntityUrl](self, "deleteEntityUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteEntityUrl](self, "deleteEntityUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteEntityUrl](self, "deleteEntityUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteEntityUrl](self, "deleteEntityUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 deleteEntityUrl](self, "deleteEntityUrl");
  }

  return v5;
}

- (BOOL)hasAnswerId
{
  return self->_answerId != 0;
}

- (void)deleteAnswerId
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 setAnswerId:](self, "setAnswerId:", 0);
}

- (BOOL)hasEntityUrl
{
  return self->_entityUrl != 0;
}

- (void)deleteEntityUrl
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 setEntityUrl:](self, "setEntityUrl:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 answerId](self, "answerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 entityUrl](self, "entityUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
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
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 answerId](self, "answerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "answerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 answerId](self, "answerId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 answerId](self, "answerId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answerId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 entityUrl](self, "entityUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 entityUrl](self, "entityUrl");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 entityUrl](self, "entityUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityUrl");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_answerId, "hash");
  return -[NSString hash](self->_entityUrl, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_answerId)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 answerId](self, "answerId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("answerId"));

  }
  if (self->_entityUrl)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 entityUrl](self, "entityUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityUrl"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerExecutionTier1;
  v5 = -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answerId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 setAnswerId:](v5, "setAnswerId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 setEntityUrl:](v5, "setEntityUrl:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)answerId
{
  return self->_answerId;
}

- (void)setAnswerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)entityUrl
{
  return self->_entityUrl;
}

- (void)setEntityUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void)setHasEntityUrl:(BOOL)a3
{
  self->_hasEntityUrl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityUrl, 0);
  objc_storeStrong((id *)&self->_answerId, 0);
}

@end
