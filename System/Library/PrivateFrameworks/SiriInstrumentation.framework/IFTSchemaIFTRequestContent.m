@implementation IFTSchemaIFTRequestContent

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
  v13.super_class = (Class)IFTSchemaIFTRequestContent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTRequestContent text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTRequestContent deleteText](self, "deleteText");
  -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTRequestContent deletePromptResolution](self, "deletePromptResolution");

  return v5;
}

- (void)setText:(id)a3
{
  IFTSchemaIFTRequestContentTextContent *v4;
  IFTSchemaIFTSystemPromptResolution *promptResolution;
  IFTSchemaIFTRequestContentTextContent *text;

  v4 = (IFTSchemaIFTRequestContentTextContent *)a3;
  promptResolution = self->_promptResolution;
  self->_promptResolution = 0;

  self->_whichOneof_Requestcontent = v4 != 0;
  text = self->_text;
  self->_text = v4;

}

- (IFTSchemaIFTRequestContentTextContent)text
{
  if (self->_whichOneof_Requestcontent == 1)
    return self->_text;
  else
    return (IFTSchemaIFTRequestContentTextContent *)0;
}

- (void)deleteText
{
  IFTSchemaIFTRequestContentTextContent *text;

  if (self->_whichOneof_Requestcontent == 1)
  {
    self->_whichOneof_Requestcontent = 0;
    text = self->_text;
    self->_text = 0;

  }
}

- (void)setPromptResolution:(id)a3
{
  IFTSchemaIFTSystemPromptResolution *v4;
  IFTSchemaIFTRequestContentTextContent *text;
  unint64_t v6;
  IFTSchemaIFTSystemPromptResolution *promptResolution;

  v4 = (IFTSchemaIFTSystemPromptResolution *)a3;
  text = self->_text;
  self->_text = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichOneof_Requestcontent = v6;
  promptResolution = self->_promptResolution;
  self->_promptResolution = v4;

}

- (IFTSchemaIFTSystemPromptResolution)promptResolution
{
  if (self->_whichOneof_Requestcontent == 3)
    return self->_promptResolution;
  else
    return (IFTSchemaIFTSystemPromptResolution *)0;
}

- (void)deletePromptResolution
{
  IFTSchemaIFTSystemPromptResolution *promptResolution;

  if (self->_whichOneof_Requestcontent == 3)
  {
    self->_whichOneof_Requestcontent = 0;
    promptResolution = self->_promptResolution;
    self->_promptResolution = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRequestContentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFTSchemaIFTRequestContent text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTRequestContent text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Requestcontent;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichOneof_Requestcontent = self->_whichOneof_Requestcontent;
  if (whichOneof_Requestcontent != objc_msgSend(v4, "whichOneof_Requestcontent"))
    goto LABEL_13;
  -[IFTSchemaIFTRequestContent text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[IFTSchemaIFTRequestContent text](self, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTRequestContent text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promptResolution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promptResolution");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[IFTSchemaIFTRequestContentTextContent hash](self->_text, "hash");
  return -[IFTSchemaIFTSystemPromptResolution hash](self->_promptResolution, "hash") ^ v3;
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
  if (self->_promptResolution)
  {
    -[IFTSchemaIFTRequestContent promptResolution](self, "promptResolution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("promptResolution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("promptResolution"));

    }
  }
  if (self->_text)
  {
    -[IFTSchemaIFTRequestContent text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("text"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("text"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTRequestContent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTRequestContent)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTRequestContent *v5;
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
    self = -[IFTSchemaIFTRequestContent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTRequestContent)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTRequestContent *v5;
  void *v6;
  IFTSchemaIFTRequestContentTextContent *v7;
  void *v8;
  IFTSchemaIFTSystemPromptResolution *v9;
  IFTSchemaIFTRequestContent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTRequestContent;
  v5 = -[IFTSchemaIFTRequestContent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTRequestContentTextContent initWithDictionary:]([IFTSchemaIFTRequestContentTextContent alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTRequestContent setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptResolution"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTSystemPromptResolution initWithDictionary:]([IFTSchemaIFTSystemPromptResolution alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTRequestContent setPromptResolution:](v5, "setPromptResolution:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Requestcontent
{
  return self->_whichOneof_Requestcontent;
}

- (BOOL)hasText
{
  return self->_hasText;
}

- (void)setHasText:(BOOL)a3
{
  self->_hasText = a3;
}

- (BOOL)hasPromptResolution
{
  return self->_hasPromptResolution;
}

- (void)setHasPromptResolution:(BOOL)a3
{
  self->_hasPromptResolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptResolution, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
