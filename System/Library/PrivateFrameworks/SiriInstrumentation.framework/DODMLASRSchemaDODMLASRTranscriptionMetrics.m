@implementation DODMLASRSchemaDODMLASRTranscriptionMetrics

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DODMLASRSchemaDODMLASRTranscriptionMetrics;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics deleteTrain](self, "deleteTrain");
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics deleteDev](self, "deleteDev");
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics deleteTest](self, "deleteTest");
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics deleteExternal](self, "deleteExternal");

  return v5;
}

- (BOOL)hasTrain
{
  return self->_train != 0;
}

- (void)deleteTrain
{
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics setTrain:](self, "setTrain:", 0);
}

- (BOOL)hasDev
{
  return self->_dev != 0;
}

- (void)deleteDev
{
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics setDev:](self, "setDev:", 0);
}

- (BOOL)hasTest
{
  return self->_test != 0;
}

- (void)deleteTest
{
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics setTest:](self, "setTest:", 0);
}

- (BOOL)hasExternal
{
  return self->_external != 0;
}

- (void)deleteExternal
{
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics setExternal:](self, "setExternal:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRTranscriptionMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "train");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "train");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dev");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dev");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "test");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "external");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "external");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[DODMLASRSchemaDODMLASRTranscriptMetadata hash](self->_train, "hash");
  v4 = -[DODMLASRSchemaDODMLASRTranscriptMetadata hash](self->_dev, "hash") ^ v3;
  v5 = -[DODMLASRSchemaDODMLASRTranscriptMetadata hash](self->_test, "hash");
  return v4 ^ v5 ^ -[DODMLASRSchemaDODMLASRTranscriptMetadata hash](self->_external, "hash");
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
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dev)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics dev](self, "dev");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dev"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dev"));

    }
  }
  if (self->_external)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics external](self, "external");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("external"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("external"));

    }
  }
  if (self->_test)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics test](self, "test");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("test"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("test"));

    }
  }
  if (self->_train)
  {
    -[DODMLASRSchemaDODMLASRTranscriptionMetrics train](self, "train");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("train"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("train"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRTranscriptionMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRTranscriptionMetrics)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRTranscriptionMetrics *v5;
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
    self = -[DODMLASRSchemaDODMLASRTranscriptionMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRTranscriptionMetrics)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRTranscriptionMetrics *v5;
  void *v6;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v7;
  void *v8;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v9;
  void *v10;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v11;
  void *v12;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v13;
  DODMLASRSchemaDODMLASRTranscriptionMetrics *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DODMLASRSchemaDODMLASRTranscriptionMetrics;
  v5 = -[DODMLASRSchemaDODMLASRTranscriptionMetrics init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("train"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[DODMLASRSchemaDODMLASRTranscriptMetadata initWithDictionary:]([DODMLASRSchemaDODMLASRTranscriptMetadata alloc], "initWithDictionary:", v6);
      -[DODMLASRSchemaDODMLASRTranscriptionMetrics setTrain:](v5, "setTrain:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dev"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[DODMLASRSchemaDODMLASRTranscriptMetadata initWithDictionary:]([DODMLASRSchemaDODMLASRTranscriptMetadata alloc], "initWithDictionary:", v8);
      -[DODMLASRSchemaDODMLASRTranscriptionMetrics setDev:](v5, "setDev:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("test"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[DODMLASRSchemaDODMLASRTranscriptMetadata initWithDictionary:]([DODMLASRSchemaDODMLASRTranscriptMetadata alloc], "initWithDictionary:", v10);
      -[DODMLASRSchemaDODMLASRTranscriptionMetrics setTest:](v5, "setTest:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("external"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[DODMLASRSchemaDODMLASRTranscriptMetadata initWithDictionary:]([DODMLASRSchemaDODMLASRTranscriptMetadata alloc], "initWithDictionary:", v12);
      -[DODMLASRSchemaDODMLASRTranscriptionMetrics setExternal:](v5, "setExternal:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)train
{
  return self->_train;
}

- (void)setTrain:(id)a3
{
  objc_storeStrong((id *)&self->_train, a3);
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)dev
{
  return self->_dev;
}

- (void)setDev:(id)a3
{
  objc_storeStrong((id *)&self->_dev, a3);
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)test
{
  return self->_test;
}

- (void)setTest:(id)a3
{
  objc_storeStrong((id *)&self->_test, a3);
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)external
{
  return self->_external;
}

- (void)setExternal:(id)a3
{
  objc_storeStrong((id *)&self->_external, a3);
}

- (void)setHasTrain:(BOOL)a3
{
  self->_hasTrain = a3;
}

- (void)setHasDev:(BOOL)a3
{
  self->_hasDev = a3;
}

- (void)setHasTest:(BOOL)a3
{
  self->_hasTest = a3;
}

- (void)setHasExternal:(BOOL)a3
{
  self->_hasExternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_test, 0);
  objc_storeStrong((id *)&self->_dev, 0);
  objc_storeStrong((id *)&self->_train, 0);
}

@end
