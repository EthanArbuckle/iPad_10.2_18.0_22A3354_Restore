@implementation PLUSSchemaPLUSTMDCGroundTruthGenerated

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
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSTMDCGroundTruthGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated deleteOriginalPlusId](self, "deleteOriginalPlusId");
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated deleteGroundTruth](self, "deleteGroundTruth");
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated deleteOriginalRequestId](self, "deleteOriginalRequestId");

  return v5;
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

- (void)deleteOriginalPlusId
{
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated setOriginalPlusId:](self, "setOriginalPlusId:", 0);
}

- (BOOL)hasGroundTruth
{
  return self->_groundTruth != 0;
}

- (void)deleteGroundTruth
{
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated setGroundTruth:](self, "setGroundTruth:", 0);
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSTMDCGroundTruthGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalPlusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalPlusId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groundTruth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groundTruth");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SISchemaUUID hash](self->_originalPlusId, "hash");
  v4 = -[PLUSSchemaPLUSTMDCGroundTruth hash](self->_groundTruth, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_originalRequestId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_groundTruth)
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated groundTruth](self, "groundTruth");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groundTruth"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("groundTruth"));

    }
  }
  if (self->_originalPlusId)
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalPlusId](self, "originalPlusId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalPlusId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalPlusId"));

    }
  }
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSTMDCGroundTruthGenerated originalRequestId](self, "originalRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("originalRequestId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSTMDCGroundTruthGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSTMDCGroundTruthGenerated)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *v5;
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
    self = -[PLUSSchemaPLUSTMDCGroundTruthGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSTMDCGroundTruthGenerated)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PLUSSchemaPLUSTMDCGroundTruth *v9;
  void *v10;
  SISchemaUUID *v11;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSTMDCGroundTruthGenerated;
  v5 = -[PLUSSchemaPLUSTMDCGroundTruthGenerated init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalPlusId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSTMDCGroundTruthGenerated setOriginalPlusId:](v5, "setOriginalPlusId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLUSSchemaPLUSTMDCGroundTruth initWithDictionary:]([PLUSSchemaPLUSTMDCGroundTruth alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSTMDCGroundTruthGenerated setGroundTruth:](v5, "setGroundTruth:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSTMDCGroundTruthGenerated setOriginalRequestId:](v5, "setOriginalRequestId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (void)setOriginalPlusId:(id)a3
{
  objc_storeStrong((id *)&self->_originalPlusId, a3);
}

- (PLUSSchemaPLUSTMDCGroundTruth)groundTruth
{
  return self->_groundTruth;
}

- (void)setGroundTruth:(id)a3
{
  objc_storeStrong((id *)&self->_groundTruth, a3);
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setOriginalRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestId, a3);
}

- (void)setHasOriginalPlusId:(BOOL)a3
{
  self->_hasOriginalPlusId = a3;
}

- (void)setHasGroundTruth:(BOOL)a3
{
  self->_hasGroundTruth = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  self->_hasOriginalRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_groundTruth, 0);
  objc_storeStrong((id *)&self->_originalPlusId, 0);
}

@end
