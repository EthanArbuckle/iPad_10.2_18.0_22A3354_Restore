@implementation ASRSchemaASRSampledAudioFileDeletionFailed

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
  v9.super_class = (Class)ASRSchemaASRSampledAudioFileDeletionFailed;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASRSampledAudioFileDeletionFailed deleteOriginalAsrId](self, "deleteOriginalAsrId");
  return v5;
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

- (void)deleteOriginalAsrId
{
  -[ASRSchemaASRSampledAudioFileDeletionFailed setOriginalAsrId:](self, "setOriginalAsrId:", 0);
}

- (void)setErrorCode:(int)a3
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
  -[ASRSchemaASRSampledAudioFileDeletionFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)deleteErrorDomain
{
  -[ASRSchemaASRSampledAudioFileDeletionFailed setErrorDomain:](self, "setErrorDomain:", 0);
}

- (void)setUnderlyingErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_underlyingErrorCode = a3;
}

- (BOOL)hasUnderlyingErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUnderlyingErrorCode
{
  -[ASRSchemaASRSampledAudioFileDeletionFailed setUnderlyingErrorCode:](self, "setUnderlyingErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return self->_underlyingErrorDomain != 0;
}

- (void)deleteUnderlyingErrorDomain
{
  -[ASRSchemaASRSampledAudioFileDeletionFailed setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRSampledAudioFileDeletionFailedReadFrom(self, (uint64_t)a3);
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
  -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[ASRSchemaASRSampledAudioFileDeletionFailed errorDomain](self, "errorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ASRSchemaASRSampledAudioFileDeletionFailed underlyingErrorDomain](self, "underlyingErrorDomain");
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
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int errorCode;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int underlyingErrorCode;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalAsrId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_23;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_23;
  }
  -[ASRSchemaASRSampledAudioFileDeletionFailed errorDomain](self, "errorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[ASRSchemaASRSampledAudioFileDeletionFailed errorDomain](self, "errorDomain");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ASRSchemaASRSampledAudioFileDeletionFailed errorDomain](self, "errorDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  v18 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v18 != ((v4[48] >> 1) & 1))
    goto LABEL_23;
  if (v18)
  {
    underlyingErrorCode = self->_underlyingErrorCode;
    if (underlyingErrorCode != objc_msgSend(v4, "underlyingErrorCode"))
      goto LABEL_23;
  }
  -[ASRSchemaASRSampledAudioFileDeletionFailed underlyingErrorDomain](self, "underlyingErrorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingErrorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRSampledAudioFileDeletionFailed underlyingErrorDomain](self, "underlyingErrorDomain");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_26:
      v25 = 1;
      goto LABEL_24;
    }
    v21 = (void *)v20;
    -[ASRSchemaASRSampledAudioFileDeletionFailed underlyingErrorDomain](self, "underlyingErrorDomain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingErrorDomain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v25 = 0;
LABEL_24:

  return v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_originalAsrId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_errorCode;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_underlyingErrorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_underlyingErrorDomain, "hash");
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRSampledAudioFileDeletionFailed errorCode](self, "errorCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errorCode"));

  }
  if (self->_errorDomain)
  {
    -[ASRSchemaASRSampledAudioFileDeletionFailed errorDomain](self, "errorDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

  }
  if (self->_originalAsrId)
  {
    -[ASRSchemaASRSampledAudioFileDeletionFailed originalAsrId](self, "originalAsrId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalAsrId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalAsrId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRSampledAudioFileDeletionFailed underlyingErrorCode](self, "underlyingErrorCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("underlyingErrorCode"));

  }
  if (self->_underlyingErrorDomain)
  {
    -[ASRSchemaASRSampledAudioFileDeletionFailed underlyingErrorDomain](self, "underlyingErrorDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("underlyingErrorDomain"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRSampledAudioFileDeletionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRSampledAudioFileDeletionFailed)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRSampledAudioFileDeletionFailed *v5;
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
    self = -[ASRSchemaASRSampledAudioFileDeletionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRSampledAudioFileDeletionFailed)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRSampledAudioFileDeletionFailed *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ASRSchemaASRSampledAudioFileDeletionFailed *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASRSchemaASRSampledAudioFileDeletionFailed;
  v5 = -[ASRSchemaASRSampledAudioFileDeletionFailed init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalAsrId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRSampledAudioFileDeletionFailed setOriginalAsrId:](v5, "setOriginalAsrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRSampledAudioFileDeletionFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[ASRSchemaASRSampledAudioFileDeletionFailed setErrorDomain:](v5, "setErrorDomain:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingErrorCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRSampledAudioFileDeletionFailed setUnderlyingErrorCode:](v5, "setUnderlyingErrorCode:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingErrorDomain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ASRSchemaASRSampledAudioFileDeletionFailed setUnderlyingErrorDomain:](v5, "setUnderlyingErrorDomain:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (void)setOriginalAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_originalAsrId, a3);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

@end
