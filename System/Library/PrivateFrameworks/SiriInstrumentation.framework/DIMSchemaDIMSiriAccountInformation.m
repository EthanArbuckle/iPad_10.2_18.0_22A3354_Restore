@implementation DIMSchemaDIMSiriAccountInformation

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 4);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 8);
  return v2;
}

- (BOOL)hasSiriDeviceId
{
  return self->_siriDeviceId != 0;
}

- (void)deleteSiriDeviceId
{
  -[DIMSchemaDIMSiriAccountInformation setSiriDeviceId:](self, "setSiriDeviceId:", 0);
}

- (BOOL)hasSiriSpeechId
{
  return self->_siriSpeechId != 0;
}

- (void)deleteSiriSpeechId
{
  -[DIMSchemaDIMSiriAccountInformation setSiriSpeechId:](self, "setSiriSpeechId:", 0);
}

- (BOOL)hasSiriUserId
{
  return self->_siriUserId != 0;
}

- (void)deleteSiriUserId
{
  -[DIMSchemaDIMSiriAccountInformation setSiriUserId:](self, "setSiriUserId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMSiriAccountInformationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DIMSchemaDIMSiriAccountInformation siriDeviceId](self, "siriDeviceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[DIMSchemaDIMSiriAccountInformation siriSpeechId](self, "siriSpeechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[DIMSchemaDIMSiriAccountInformation siriUserId](self, "siriUserId");
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
  -[DIMSchemaDIMSiriAccountInformation siriDeviceId](self, "siriDeviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[DIMSchemaDIMSiriAccountInformation siriDeviceId](self, "siriDeviceId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DIMSchemaDIMSiriAccountInformation siriDeviceId](self, "siriDeviceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDeviceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[DIMSchemaDIMSiriAccountInformation siriSpeechId](self, "siriSpeechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSpeechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[DIMSchemaDIMSiriAccountInformation siriSpeechId](self, "siriSpeechId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DIMSchemaDIMSiriAccountInformation siriSpeechId](self, "siriSpeechId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSpeechId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[DIMSchemaDIMSiriAccountInformation siriUserId](self, "siriUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[DIMSchemaDIMSiriAccountInformation siriUserId](self, "siriUserId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[DIMSchemaDIMSiriAccountInformation siriUserId](self, "siriUserId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriUserId");
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

  v3 = -[NSString hash](self->_siriDeviceId, "hash");
  v4 = -[NSString hash](self->_siriSpeechId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_siriUserId, "hash");
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
  if (self->_siriDeviceId)
  {
    -[DIMSchemaDIMSiriAccountInformation siriDeviceId](self, "siriDeviceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("siriDeviceId"));

  }
  if (self->_siriSpeechId)
  {
    -[DIMSchemaDIMSiriAccountInformation siriSpeechId](self, "siriSpeechId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("siriSpeechId"));

  }
  if (self->_siriUserId)
  {
    -[DIMSchemaDIMSiriAccountInformation siriUserId](self, "siriUserId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriUserId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaDIMSiriAccountInformation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DIMSchemaDIMSiriAccountInformation)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaDIMSiriAccountInformation *v5;
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
    self = -[DIMSchemaDIMSiriAccountInformation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaDIMSiriAccountInformation)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaDIMSiriAccountInformation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DIMSchemaDIMSiriAccountInformation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DIMSchemaDIMSiriAccountInformation;
  v5 = -[DIMSchemaDIMSiriAccountInformation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDeviceId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DIMSchemaDIMSiriAccountInformation setSiriDeviceId:](v5, "setSiriDeviceId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSpeechId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[DIMSchemaDIMSiriAccountInformation setSiriSpeechId:](v5, "setSiriSpeechId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriUserId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[DIMSchemaDIMSiriAccountInformation setSiriUserId:](v5, "setSiriUserId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)siriDeviceId
{
  return self->_siriDeviceId;
}

- (void)setSiriDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)siriSpeechId
{
  return self->_siriSpeechId;
}

- (void)setSiriSpeechId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)siriUserId
{
  return self->_siriUserId;
}

- (void)setSiriUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasSiriDeviceId:(BOOL)a3
{
  self->_hasSiriDeviceId = a3;
}

- (void)setHasSiriSpeechId:(BOOL)a3
{
  self->_hasSiriSpeechId = a3;
}

- (void)setHasSiriUserId:(BOOL)a3
{
  self->_hasSiriUserId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriUserId, 0);
  objc_storeStrong((id *)&self->_siriSpeechId, 0);
  objc_storeStrong((id *)&self->_siriDeviceId, 0);
}

@end
