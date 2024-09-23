@implementation ASRSchemaASRSampledAudioFileStorageFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
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
  -[ASRSchemaASRSampledAudioFileStorageFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)deleteErrorDomain
{
  -[ASRSchemaASRSampledAudioFileStorageFailed setErrorDomain:](self, "setErrorDomain:", 0);
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
  -[ASRSchemaASRSampledAudioFileStorageFailed setUnderlyingErrorCode:](self, "setUnderlyingErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return self->_underlyingErrorDomain != 0;
}

- (void)deleteUnderlyingErrorDomain
{
  -[ASRSchemaASRSampledAudioFileStorageFailed setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:", 0);
}

- (void)setSampledAudioStorageFailureReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sampledAudioStorageFailureReason = a3;
}

- (BOOL)hasSampledAudioStorageFailureReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSampledAudioStorageFailureReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSampledAudioStorageFailureReason
{
  -[ASRSchemaASRSampledAudioFileStorageFailed setSampledAudioStorageFailureReason:](self, "setSampledAudioStorageFailureReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRSampledAudioFileStorageFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[ASRSchemaASRSampledAudioFileStorageFailed errorDomain](self, "errorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorDomain](self, "underlyingErrorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int errorCode;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int underlyingErrorCode;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  int v22;
  int sampledAudioStorageFailureReason;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != (v4[44] & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_18;
  }
  -[ASRSchemaASRSampledAudioFileStorageFailed errorDomain](self, "errorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[ASRSchemaASRSampledAudioFileStorageFailed errorDomain](self, "errorDomain");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ASRSchemaASRSampledAudioFileStorageFailed errorDomain](self, "errorDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  v13 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v13 != ((v4[44] >> 1) & 1))
    goto LABEL_18;
  if (v13)
  {
    underlyingErrorCode = self->_underlyingErrorCode;
    if (underlyingErrorCode != objc_msgSend(v4, "underlyingErrorCode"))
      goto LABEL_18;
  }
  -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorDomain](self, "underlyingErrorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingErrorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorDomain](self, "underlyingErrorDomain");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorDomain](self, "underlyingErrorDomain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingErrorDomain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_18;
  }
  else
  {

  }
  v22 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v22 == ((v4[44] >> 2) & 1))
  {
    if (!v22
      || (sampledAudioStorageFailureReason = self->_sampledAudioStorageFailureReason,
          sampledAudioStorageFailureReason == objc_msgSend(v4, "sampledAudioStorageFailureReason")))
    {
      v20 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_errorCode;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_underlyingErrorCode;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_underlyingErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_sampledAudioStorageFailureReason;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRSampledAudioFileStorageFailed errorCode](self, "errorCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errorCode"));

  }
  if (self->_errorDomain)
  {
    -[ASRSchemaASRSampledAudioFileStorageFailed errorDomain](self, "errorDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = -[ASRSchemaASRSampledAudioFileStorageFailed sampledAudioStorageFailureReason](self, "sampledAudioStorageFailureReason")- 1;
    if (v8 > 3)
      v9 = CFSTR("ASRSAMPLEDAUDIOSTORAGEFAILUREREASON_UNKNOWN");
    else
      v9 = off_1E562B660[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sampledAudioStorageFailureReason"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorCode](self, "underlyingErrorCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("underlyingErrorCode"));

  }
  if (self->_underlyingErrorDomain)
  {
    -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorDomain](self, "underlyingErrorDomain");
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

  -[ASRSchemaASRSampledAudioFileStorageFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRSampledAudioFileStorageFailed)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRSampledAudioFileStorageFailed *v5;
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
    self = -[ASRSchemaASRSampledAudioFileStorageFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRSampledAudioFileStorageFailed)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRSampledAudioFileStorageFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ASRSchemaASRSampledAudioFileStorageFailed *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASRSchemaASRSampledAudioFileStorageFailed;
  v5 = -[ASRSchemaASRSampledAudioFileStorageFailed init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRSampledAudioFileStorageFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[ASRSchemaASRSampledAudioFileStorageFailed setErrorDomain:](v5, "setErrorDomain:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingErrorCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRSampledAudioFileStorageFailed setUnderlyingErrorCode:](v5, "setUnderlyingErrorCode:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingErrorDomain"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ASRSchemaASRSampledAudioFileStorageFailed setUnderlyingErrorDomain:](v5, "setUnderlyingErrorDomain:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioStorageFailureReason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRSampledAudioFileStorageFailed setSampledAudioStorageFailureReason:](v5, "setSampledAudioStorageFailureReason:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)sampledAudioStorageFailureReason
{
  return self->_sampledAudioStorageFailureReason;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
