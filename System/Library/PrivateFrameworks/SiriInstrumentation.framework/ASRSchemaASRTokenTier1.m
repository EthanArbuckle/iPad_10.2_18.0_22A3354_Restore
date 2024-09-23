@implementation ASRSchemaASRTokenTier1

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
  v7.super_class = (Class)ASRSchemaASRTokenTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[ASRSchemaASRTokenTier1 deleteText](self, "deleteText");
    -[ASRSchemaASRTokenTier1 deletePhoneSequence](self, "deletePhoneSequence");
    -[ASRSchemaASRTokenTier1 deleteIpaPhoneSequence](self, "deleteIpaPhoneSequence");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[ASRSchemaASRTokenTier1 deleteText](self, "deleteText");
    -[ASRSchemaASRTokenTier1 deletePhoneSequence](self, "deletePhoneSequence");
    -[ASRSchemaASRTokenTier1 deleteIpaPhoneSequence](self, "deleteIpaPhoneSequence");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[ASRSchemaASRTokenTier1 deleteText](self, "deleteText");
    -[ASRSchemaASRTokenTier1 deletePhoneSequence](self, "deletePhoneSequence");
    -[ASRSchemaASRTokenTier1 deleteIpaPhoneSequence](self, "deleteIpaPhoneSequence");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[ASRSchemaASRTokenTier1 deleteText](self, "deleteText");
    -[ASRSchemaASRTokenTier1 deletePhoneSequence](self, "deletePhoneSequence");
    -[ASRSchemaASRTokenTier1 deleteIpaPhoneSequence](self, "deleteIpaPhoneSequence");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[ASRSchemaASRTokenTier1 deleteText](self, "deleteText");
    -[ASRSchemaASRTokenTier1 deletePhoneSequence](self, "deletePhoneSequence");
    -[ASRSchemaASRTokenTier1 deleteIpaPhoneSequence](self, "deleteIpaPhoneSequence");
  }

  return v5;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)deleteText
{
  -[ASRSchemaASRTokenTier1 setText:](self, "setText:", 0);
}

- (BOOL)hasPhoneSequence
{
  return self->_phoneSequence != 0;
}

- (void)deletePhoneSequence
{
  -[ASRSchemaASRTokenTier1 setPhoneSequence:](self, "setPhoneSequence:", 0);
}

- (BOOL)hasIpaPhoneSequence
{
  return self->_ipaPhoneSequence != 0;
}

- (void)deleteIpaPhoneSequence
{
  -[ASRSchemaASRTokenTier1 setIpaPhoneSequence:](self, "setIpaPhoneSequence:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRTokenTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASRSchemaASRTokenTier1 text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRTokenTier1 phoneSequence](self, "phoneSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRTokenTier1 ipaPhoneSequence](self, "ipaPhoneSequence");
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
  -[ASRSchemaASRTokenTier1 text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRTokenTier1 text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRTokenTier1 text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRTokenTier1 phoneSequence](self, "phoneSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneSequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRTokenTier1 phoneSequence](self, "phoneSequence");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRTokenTier1 phoneSequence](self, "phoneSequence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneSequence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRTokenTier1 ipaPhoneSequence](self, "ipaPhoneSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ipaPhoneSequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRTokenTier1 ipaPhoneSequence](self, "ipaPhoneSequence");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ASRSchemaASRTokenTier1 ipaPhoneSequence](self, "ipaPhoneSequence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipaPhoneSequence");
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

  v3 = -[NSString hash](self->_text, "hash");
  v4 = -[NSString hash](self->_phoneSequence, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_ipaPhoneSequence, "hash");
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
  if (self->_ipaPhoneSequence)
  {
    -[ASRSchemaASRTokenTier1 ipaPhoneSequence](self, "ipaPhoneSequence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ipaPhoneSequence"));

  }
  if (self->_phoneSequence)
  {
    -[ASRSchemaASRTokenTier1 phoneSequence](self, "phoneSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("phoneSequence"));

  }
  if (self->_text)
  {
    -[ASRSchemaASRTokenTier1 text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("text"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRTokenTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRTokenTier1)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRTokenTier1 *v5;
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
    self = -[ASRSchemaASRTokenTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRTokenTier1)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRTokenTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ASRSchemaASRTokenTier1 *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASRSchemaASRTokenTier1;
  v5 = -[ASRSchemaASRTokenTier1 init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ASRSchemaASRTokenTier1 setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneSequence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ASRSchemaASRTokenTier1 setPhoneSequence:](v5, "setPhoneSequence:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ipaPhoneSequence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ASRSchemaASRTokenTier1 setIpaPhoneSequence:](v5, "setIpaPhoneSequence:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setIpaPhoneSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasText:(BOOL)a3
{
  self->_hasText = a3;
}

- (void)setHasPhoneSequence:(BOOL)a3
{
  self->_hasPhoneSequence = a3;
}

- (void)setHasIpaPhoneSequence:(BOOL)a3
{
  self->_hasIpaPhoneSequence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
