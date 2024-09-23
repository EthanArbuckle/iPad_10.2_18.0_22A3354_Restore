@implementation ASRSchemaASRPackage

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASRSchemaASRPackage;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRPackage deleteRawRecognition](self, "deleteRawRecognition");
  -[ASRSchemaASRPackage postItn](self, "postItn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ASRSchemaASRPackage deletePostItn](self, "deletePostItn");

  return v5;
}

- (BOOL)hasRawRecognition
{
  return self->_rawRecognition != 0;
}

- (void)deleteRawRecognition
{
  -[ASRSchemaASRPackage setRawRecognition:](self, "setRawRecognition:", 0);
}

- (BOOL)hasPostItn
{
  return self->_postItn != 0;
}

- (void)deletePostItn
{
  -[ASRSchemaASRPackage setPostItn:](self, "setPostItn:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRPackageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRPackage postItn](self, "postItn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASRSchemaASRPackage postItn](self, "postItn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawRecognition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawRecognition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ASRSchemaASRPackage postItn](self, "postItn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postItn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRPackage postItn](self, "postItn");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[ASRSchemaASRPackage postItn](self, "postItn");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postItn");
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

  v3 = -[ASRSchemaASRRecognitionResult hash](self->_rawRecognition, "hash");
  return -[ASRSchemaASRRecognitionResult hash](self->_postItn, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_postItn)
  {
    -[ASRSchemaASRPackage postItn](self, "postItn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("postItn"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("postItn"));

    }
  }
  if (self->_rawRecognition)
  {
    -[ASRSchemaASRPackage rawRecognition](self, "rawRecognition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rawRecognition"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rawRecognition"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRPackage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRPackage)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRPackage *v5;
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
    self = -[ASRSchemaASRPackage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRPackage)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRPackage *v5;
  void *v6;
  ASRSchemaASRRecognitionResult *v7;
  void *v8;
  ASRSchemaASRRecognitionResult *v9;
  ASRSchemaASRPackage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRPackage;
  v5 = -[ASRSchemaASRPackage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawRecognition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ASRSchemaASRRecognitionResult initWithDictionary:]([ASRSchemaASRRecognitionResult alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRPackage setRawRecognition:](v5, "setRawRecognition:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postItn"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ASRSchemaASRRecognitionResult initWithDictionary:]([ASRSchemaASRRecognitionResult alloc], "initWithDictionary:", v8);
      -[ASRSchemaASRPackage setPostItn:](v5, "setPostItn:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (ASRSchemaASRRecognitionResult)rawRecognition
{
  return self->_rawRecognition;
}

- (void)setRawRecognition:(id)a3
{
  objc_storeStrong((id *)&self->_rawRecognition, a3);
}

- (ASRSchemaASRRecognitionResult)postItn
{
  return self->_postItn;
}

- (void)setPostItn:(id)a3
{
  objc_storeStrong((id *)&self->_postItn, a3);
}

- (void)setHasRawRecognition:(BOOL)a3
{
  self->_hasRawRecognition = a3;
}

- (void)setHasPostItn:(BOOL)a3
{
  self->_hasPostItn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postItn, 0);
  objc_storeStrong((id *)&self->_rawRecognition, 0);
}

@end
