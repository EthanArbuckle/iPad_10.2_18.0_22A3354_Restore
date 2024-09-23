@implementation FLOWSchemaFLOWWebAnswerExecutionTier1

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
  v7.super_class = (Class)FLOWSchemaFLOWWebAnswerExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 deleteAnswerId](self, "deleteAnswerId");

  return v5;
}

- (BOOL)hasAnswerId
{
  return self->_answerId != 0;
}

- (void)deleteAnswerId
{
  -[FLOWSchemaFLOWWebAnswerExecutionTier1 setAnswerId:](self, "setAnswerId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWWebAnswerExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FLOWSchemaFLOWWebAnswerExecutionTier1 answerId](self, "answerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 answerId](self, "answerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answerId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[FLOWSchemaFLOWWebAnswerExecutionTier1 answerId](self, "answerId");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[FLOWSchemaFLOWWebAnswerExecutionTier1 answerId](self, "answerId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "answerId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_answerId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_answerId)
  {
    -[FLOWSchemaFLOWWebAnswerExecutionTier1 answerId](self, "answerId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("answerId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWWebAnswerExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWWebAnswerExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWWebAnswerExecutionTier1 *v5;
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
    self = -[FLOWSchemaFLOWWebAnswerExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWWebAnswerExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWWebAnswerExecutionTier1 *v5;
  void *v6;
  void *v7;
  FLOWSchemaFLOWWebAnswerExecutionTier1 *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWWebAnswerExecutionTier1;
  v5 = -[FLOWSchemaFLOWWebAnswerExecutionTier1 init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answerId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[FLOWSchemaFLOWWebAnswerExecutionTier1 setAnswerId:](v5, "setAnswerId:", v7);

    }
    v8 = v5;

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

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerId, 0);
}

@end
