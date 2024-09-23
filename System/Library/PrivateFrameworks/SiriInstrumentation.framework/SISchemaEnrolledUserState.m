@implementation SISchemaEnrolledUserState

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
  v9.super_class = (Class)SISchemaEnrolledUserState;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaEnrolledUserState personalization](self, "personalization", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaEnrolledUserState deletePersonalization](self, "deletePersonalization");
  return v5;
}

- (BOOL)hasSiriLinkedSpeechID
{
  return self->_siriLinkedSpeechID != 0;
}

- (void)deleteSiriLinkedSpeechID
{
  -[SISchemaEnrolledUserState setSiriLinkedSpeechID:](self, "setSiriLinkedSpeechID:", 0);
}

- (BOOL)hasPersonalization
{
  return self->_personalization != 0;
}

- (void)deletePersonalization
{
  -[SISchemaEnrolledUserState setPersonalization:](self, "setPersonalization:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEnrolledUserStateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaEnrolledUserState siriLinkedSpeechID](self, "siriLinkedSpeechID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaEnrolledUserState personalization](self, "personalization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaEnrolledUserState personalization](self, "personalization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[SISchemaEnrolledUserState siriLinkedSpeechID](self, "siriLinkedSpeechID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriLinkedSpeechID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaEnrolledUserState siriLinkedSpeechID](self, "siriLinkedSpeechID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaEnrolledUserState siriLinkedSpeechID](self, "siriLinkedSpeechID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriLinkedSpeechID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaEnrolledUserState personalization](self, "personalization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaEnrolledUserState personalization](self, "personalization");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SISchemaEnrolledUserState personalization](self, "personalization");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personalization");
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

  v3 = -[NSString hash](self->_siriLinkedSpeechID, "hash");
  return -[SISchemaPersonalization hash](self->_personalization, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_personalization)
  {
    -[SISchemaEnrolledUserState personalization](self, "personalization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("personalization"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("personalization"));

    }
  }
  if (self->_siriLinkedSpeechID)
  {
    -[SISchemaEnrolledUserState siriLinkedSpeechID](self, "siriLinkedSpeechID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriLinkedSpeechID"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaEnrolledUserState dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaEnrolledUserState)initWithJSON:(id)a3
{
  void *v4;
  SISchemaEnrolledUserState *v5;
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
    self = -[SISchemaEnrolledUserState initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaEnrolledUserState)initWithDictionary:(id)a3
{
  id v4;
  SISchemaEnrolledUserState *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaPersonalization *v9;
  SISchemaEnrolledUserState *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaEnrolledUserState;
  v5 = -[SISchemaEnrolledUserState init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriLinkedSpeechID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaEnrolledUserState setSiriLinkedSpeechID:](v5, "setSiriLinkedSpeechID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalization"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaPersonalization initWithDictionary:]([SISchemaPersonalization alloc], "initWithDictionary:", v8);
      -[SISchemaEnrolledUserState setPersonalization:](v5, "setPersonalization:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)siriLinkedSpeechID
{
  return self->_siriLinkedSpeechID;
}

- (void)setSiriLinkedSpeechID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaPersonalization)personalization
{
  return self->_personalization;
}

- (void)setPersonalization:(id)a3
{
  objc_storeStrong((id *)&self->_personalization, a3);
}

- (void)setHasSiriLinkedSpeechID:(BOOL)a3
{
  self->_hasSiriLinkedSpeechID = a3;
}

- (void)setHasPersonalization:(BOOL)a3
{
  self->_hasPersonalization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_siriLinkedSpeechID, 0);
}

@end
