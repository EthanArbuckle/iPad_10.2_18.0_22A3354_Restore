@implementation ASRSchemaASRIntermediateUtteranceInfoTier1

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
  v7.super_class = (Class)ASRSchemaASRIntermediateUtteranceInfoTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deleteUnrepairedPostItn](self, "deleteUnrepairedPostItn");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchInput](self, "deletePhoneticMatchInput");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchOutput](self, "deletePhoneticMatchOutput");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deleteUnrepairedPostItn](self, "deleteUnrepairedPostItn");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchInput](self, "deletePhoneticMatchInput");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchOutput](self, "deletePhoneticMatchOutput");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deleteUnrepairedPostItn](self, "deleteUnrepairedPostItn");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchInput](self, "deletePhoneticMatchInput");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchOutput](self, "deletePhoneticMatchOutput");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deleteUnrepairedPostItn](self, "deleteUnrepairedPostItn");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchInput](self, "deletePhoneticMatchInput");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchOutput](self, "deletePhoneticMatchOutput");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deleteUnrepairedPostItn](self, "deleteUnrepairedPostItn");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchInput](self, "deletePhoneticMatchInput");
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deletePhoneticMatchOutput](self, "deletePhoneticMatchOutput");
  }
  if (objc_msgSend(v4, "isConditionSet:", 8))
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 deleteLoggableSharedUserId](self, "deleteLoggableSharedUserId");

  return v5;
}

- (BOOL)hasUnrepairedPostItn
{
  return self->_unrepairedPostItn != 0;
}

- (void)deleteUnrepairedPostItn
{
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 setUnrepairedPostItn:](self, "setUnrepairedPostItn:", 0);
}

- (BOOL)hasPhoneticMatchInput
{
  return self->_phoneticMatchInput != 0;
}

- (void)deletePhoneticMatchInput
{
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 setPhoneticMatchInput:](self, "setPhoneticMatchInput:", 0);
}

- (BOOL)hasPhoneticMatchOutput
{
  return self->_phoneticMatchOutput != 0;
}

- (void)deletePhoneticMatchOutput
{
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 setPhoneticMatchOutput:](self, "setPhoneticMatchOutput:", 0);
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deleteLoggableSharedUserId
{
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 setLoggableSharedUserId:](self, "setLoggableSharedUserId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRIntermediateUtteranceInfoTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 unrepairedPostItn](self, "unrepairedPostItn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchInput](self, "phoneticMatchInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchOutput](self, "phoneticMatchOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 loggableSharedUserId](self, "loggableSharedUserId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 unrepairedPostItn](self, "unrepairedPostItn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unrepairedPostItn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 unrepairedPostItn](self, "unrepairedPostItn");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 unrepairedPostItn](self, "unrepairedPostItn");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unrepairedPostItn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchInput](self, "phoneticMatchInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticMatchInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchInput](self, "phoneticMatchInput");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchInput](self, "phoneticMatchInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticMatchInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchOutput](self, "phoneticMatchOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticMatchOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchOutput](self, "phoneticMatchOutput");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchOutput](self, "phoneticMatchOutput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticMatchOutput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ASRSchemaASRIntermediateUtteranceInfoTier1 loggableSharedUserId](self, "loggableSharedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggableSharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 loggableSharedUserId](self, "loggableSharedUserId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 loggableSharedUserId](self, "loggableSharedUserId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggableSharedUserId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_unrepairedPostItn, "hash");
  v4 = -[NSString hash](self->_phoneticMatchInput, "hash") ^ v3;
  v5 = -[NSString hash](self->_phoneticMatchOutput, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_loggableSharedUserId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_loggableSharedUserId)
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 loggableSharedUserId](self, "loggableSharedUserId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("loggableSharedUserId"));

  }
  if (self->_phoneticMatchInput)
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchInput](self, "phoneticMatchInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("phoneticMatchInput"));

  }
  if (self->_phoneticMatchOutput)
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 phoneticMatchOutput](self, "phoneticMatchOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("phoneticMatchOutput"));

  }
  if (self->_unrepairedPostItn)
  {
    -[ASRSchemaASRIntermediateUtteranceInfoTier1 unrepairedPostItn](self, "unrepairedPostItn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("unrepairedPostItn"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRIntermediateUtteranceInfoTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRIntermediateUtteranceInfoTier1)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *v5;
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
    self = -[ASRSchemaASRIntermediateUtteranceInfoTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRIntermediateUtteranceInfoTier1)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASRSchemaASRIntermediateUtteranceInfoTier1;
  v5 = -[ASRSchemaASRIntermediateUtteranceInfoTier1 init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unrepairedPostItn"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ASRSchemaASRIntermediateUtteranceInfoTier1 setUnrepairedPostItn:](v5, "setUnrepairedPostItn:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneticMatchInput"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ASRSchemaASRIntermediateUtteranceInfoTier1 setPhoneticMatchInput:](v5, "setPhoneticMatchInput:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneticMatchOutput"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ASRSchemaASRIntermediateUtteranceInfoTier1 setPhoneticMatchOutput:](v5, "setPhoneticMatchOutput:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggableSharedUserId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ASRSchemaASRIntermediateUtteranceInfoTier1 setLoggableSharedUserId:](v5, "setLoggableSharedUserId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)unrepairedPostItn
{
  return self->_unrepairedPostItn;
}

- (void)setUnrepairedPostItn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)phoneticMatchInput
{
  return self->_phoneticMatchInput;
}

- (void)setPhoneticMatchInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneticMatchOutput
{
  return self->_phoneticMatchOutput;
}

- (void)setPhoneticMatchOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void)setLoggableSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasUnrepairedPostItn:(BOOL)a3
{
  self->_hasUnrepairedPostItn = a3;
}

- (void)setHasPhoneticMatchInput:(BOOL)a3
{
  self->_hasPhoneticMatchInput = a3;
}

- (void)setHasPhoneticMatchOutput:(BOOL)a3
{
  self->_hasPhoneticMatchOutput = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  self->_hasLoggableSharedUserId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_phoneticMatchOutput, 0);
  objc_storeStrong((id *)&self->_phoneticMatchInput, 0);
  objc_storeStrong((id *)&self->_unrepairedPostItn, 0);
}

@end
