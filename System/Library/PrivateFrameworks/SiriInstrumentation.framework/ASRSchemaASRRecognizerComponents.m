@implementation ASRSchemaASRRecognizerComponents

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasFrontend
{
  return self->_frontend != 0;
}

- (void)deleteFrontend
{
  -[ASRSchemaASRRecognizerComponents setFrontend:](self, "setFrontend:", 0);
}

- (BOOL)hasDecodable
{
  return self->_decodable != 0;
}

- (void)deleteDecodable
{
  -[ASRSchemaASRRecognizerComponents setDecodable:](self, "setDecodable:", 0);
}

- (BOOL)hasDecoder
{
  return self->_decoder != 0;
}

- (void)deleteDecoder
{
  -[ASRSchemaASRRecognizerComponents setDecoder:](self, "setDecoder:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRecognizerComponentsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASRSchemaASRRecognizerComponents frontend](self, "frontend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRRecognizerComponents decodable](self, "decodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRRecognizerComponents decoder](self, "decoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
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
  -[ASRSchemaASRRecognizerComponents frontend](self, "frontend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frontend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRRecognizerComponents frontend](self, "frontend");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRRecognizerComponents frontend](self, "frontend");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frontend");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRRecognizerComponents decodable](self, "decodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRRecognizerComponents decodable](self, "decodable");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRRecognizerComponents decodable](self, "decodable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRRecognizerComponents decoder](self, "decoder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRRecognizerComponents decoder](self, "decoder");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ASRSchemaASRRecognizerComponents decoder](self, "decoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decoder");
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_frontend, "hash");
  v4 = -[NSString hash](self->_decodable, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_decoder, "hash");
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
  if (self->_decodable)
  {
    -[ASRSchemaASRRecognizerComponents decodable](self, "decodable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("decodable"));

  }
  if (self->_decoder)
  {
    -[ASRSchemaASRRecognizerComponents decoder](self, "decoder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("decoder"));

  }
  if (self->_frontend)
  {
    -[ASRSchemaASRRecognizerComponents frontend](self, "frontend");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("frontend"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRRecognizerComponents dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRRecognizerComponents)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRRecognizerComponents *v5;
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
    self = -[ASRSchemaASRRecognizerComponents initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRRecognizerComponents)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRRecognizerComponents *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ASRSchemaASRRecognizerComponents *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASRSchemaASRRecognizerComponents;
  v5 = -[ASRSchemaASRRecognizerComponents init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frontend"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ASRSchemaASRRecognizerComponents setFrontend:](v5, "setFrontend:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decodable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ASRSchemaASRRecognizerComponents setDecodable:](v5, "setDecodable:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decoder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ASRSchemaASRRecognizerComponents setDecoder:](v5, "setDecoder:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)frontend
{
  return self->_frontend;
}

- (void)setFrontend:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)decodable
{
  return self->_decodable;
}

- (void)setDecodable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasFrontend:(BOOL)a3
{
  self->_hasFrontend = a3;
}

- (void)setHasDecodable:(BOOL)a3
{
  self->_hasDecodable = a3;
}

- (void)setHasDecoder:(BOOL)a3
{
  self->_hasDecoder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_decodable, 0);
  objc_storeStrong((id *)&self->_frontend, 0);
}

@end
