@implementation MHSchemaMHVoiceProfileICloudSyncFinished

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasEnrollmentId
{
  return self->_enrollmentId != 0;
}

- (void)deleteEnrollmentId
{
  -[MHSchemaMHVoiceProfileICloudSyncFinished setEnrollmentId:](self, "setEnrollmentId:", 0);
}

- (void)setIsVoiceProfileSyncSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isVoiceProfileSyncSuccess = a3;
}

- (BOOL)hasIsVoiceProfileSyncSuccess
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsVoiceProfileSyncSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsVoiceProfileSyncSuccess
{
  -[MHSchemaMHVoiceProfileICloudSyncFinished setIsVoiceProfileSyncSuccess:](self, "setIsVoiceProfileSyncSuccess:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasVoiceProfileSyncFailureReason
{
  return self->_voiceProfileSyncFailureReason != 0;
}

- (void)deleteVoiceProfileSyncFailureReason
{
  -[MHSchemaMHVoiceProfileICloudSyncFinished setVoiceProfileSyncFailureReason:](self, "setVoiceProfileSyncFailureReason:", 0);
}

- (void)setLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locale = a3;
}

- (BOOL)hasLocale
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteLocale
{
  -[MHSchemaMHVoiceProfileICloudSyncFinished setLocale:](self, "setLocale:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceProfileICloudSyncFinishedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MHSchemaMHVoiceProfileICloudSyncFinished enrollmentId](self, "enrollmentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[MHSchemaMHVoiceProfileICloudSyncFinished voiceProfileSyncFailureReason](self, "voiceProfileSyncFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = v7;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
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
  int isVoiceProfileSyncSuccess;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int v20;
  int locale;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[MHSchemaMHVoiceProfileICloudSyncFinished enrollmentId](self, "enrollmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[MHSchemaMHVoiceProfileICloudSyncFinished enrollmentId](self, "enrollmentId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHVoiceProfileICloudSyncFinished enrollmentId](self, "enrollmentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[36] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isVoiceProfileSyncSuccess = self->_isVoiceProfileSyncSuccess;
    if (isVoiceProfileSyncSuccess != objc_msgSend(v4, "isVoiceProfileSyncSuccess"))
      goto LABEL_15;
  }
  -[MHSchemaMHVoiceProfileICloudSyncFinished voiceProfileSyncFailureReason](self, "voiceProfileSyncFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceProfileSyncFailureReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[MHSchemaMHVoiceProfileICloudSyncFinished voiceProfileSyncFailureReason](self, "voiceProfileSyncFailureReason");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MHSchemaMHVoiceProfileICloudSyncFinished voiceProfileSyncFailureReason](self, "voiceProfileSyncFailureReason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceProfileSyncFailureReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  else
  {

  }
  v20 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20 || (locale = self->_locale, locale == objc_msgSend(v4, "locale")))
    {
      v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_enrollmentId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isVoiceProfileSyncSuccess;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_voiceProfileSyncFailureReason, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_locale;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_enrollmentId)
  {
    -[MHSchemaMHVoiceProfileICloudSyncFinished enrollmentId](self, "enrollmentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("enrollmentId"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceProfileICloudSyncFinished isVoiceProfileSyncSuccess](self, "isVoiceProfileSyncSuccess"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isVoiceProfileSyncSuccess"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = -[MHSchemaMHVoiceProfileICloudSyncFinished locale](self, "locale") - 1;
    if (v8 > 0x3D)
      v9 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v9 = *(&off_1E563E730 + v8);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locale"));
  }
  if (self->_voiceProfileSyncFailureReason)
  {
    -[MHSchemaMHVoiceProfileICloudSyncFinished voiceProfileSyncFailureReason](self, "voiceProfileSyncFailureReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("voiceProfileSyncFailureReason"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceProfileICloudSyncFinished dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceProfileICloudSyncFinished)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceProfileICloudSyncFinished *v5;
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
    self = -[MHSchemaMHVoiceProfileICloudSyncFinished initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceProfileICloudSyncFinished)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceProfileICloudSyncFinished *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MHSchemaMHVoiceProfileICloudSyncFinished *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MHSchemaMHVoiceProfileICloudSyncFinished;
  v5 = -[MHSchemaMHVoiceProfileICloudSyncFinished init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHVoiceProfileICloudSyncFinished setEnrollmentId:](v5, "setEnrollmentId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVoiceProfileSyncSuccess"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceProfileICloudSyncFinished setIsVoiceProfileSyncSuccess:](v5, "setIsVoiceProfileSyncSuccess:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceProfileSyncFailureReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[MHSchemaMHVoiceProfileICloudSyncFinished setVoiceProfileSyncFailureReason:](v5, "setVoiceProfileSyncFailureReason:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceProfileICloudSyncFinished setLocale:](v5, "setLocale:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (NSString)enrollmentId
{
  return self->_enrollmentId;
}

- (void)setEnrollmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isVoiceProfileSyncSuccess
{
  return self->_isVoiceProfileSyncSuccess;
}

- (NSString)voiceProfileSyncFailureReason
{
  return self->_voiceProfileSyncFailureReason;
}

- (void)setVoiceProfileSyncFailureReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)locale
{
  return self->_locale;
}

- (void)setHasEnrollmentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVoiceProfileSyncFailureReason:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileSyncFailureReason, 0);
  objc_storeStrong((id *)&self->_enrollmentId, 0);
}

@end
