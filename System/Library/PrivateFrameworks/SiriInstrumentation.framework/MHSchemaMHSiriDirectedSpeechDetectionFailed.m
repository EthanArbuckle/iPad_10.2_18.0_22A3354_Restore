@implementation MHSchemaMHSiriDirectedSpeechDetectionFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorMessage
{
  -[MHSchemaMHSiriDirectedSpeechDetectionFailed setErrorMessage:](self, "setErrorMessage:", 0);
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorCode
{
  -[MHSchemaMHSiriDirectedSpeechDetectionFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSiriDirectedSpeechDetectionFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorMessage](self, "errorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int errorCode;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorMessage](self, "errorMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorMessage](self, "errorMessage");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorMessage](self, "errorMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_errorMessage, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_errorCode;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorCode](self, "errorCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errorCode"));

  }
  if (self->_errorMessage)
  {
    -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorMessage](self, "errorMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorMessage"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHSiriDirectedSpeechDetectionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHSiriDirectedSpeechDetectionFailed)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *v5;
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
    self = -[MHSchemaMHSiriDirectedSpeechDetectionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHSiriDirectedSpeechDetectionFailed)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHSiriDirectedSpeechDetectionFailed;
  v5 = -[MHSchemaMHSiriDirectedSpeechDetectionFailed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHSiriDirectedSpeechDetectionFailed setErrorMessage:](v5, "setErrorMessage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSiriDirectedSpeechDetectionFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
