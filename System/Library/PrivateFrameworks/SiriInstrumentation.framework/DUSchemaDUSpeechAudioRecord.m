@implementation DUSchemaDUSpeechAudioRecord

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
  v13.super_class = (Class)DUSchemaDUSpeechAudioRecord;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[DUSchemaDUSpeechAudioRecord deleteInteractionId](self, "deleteInteractionId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechIdString](self, "deleteSpeechIdString");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[DUSchemaDUSpeechAudioRecord deleteInteractionId](self, "deleteInteractionId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechIdString](self, "deleteSpeechIdString");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[DUSchemaDUSpeechAudioRecord deleteInteractionId](self, "deleteInteractionId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechIdString](self, "deleteSpeechIdString");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[DUSchemaDUSpeechAudioRecord deleteInteractionId](self, "deleteInteractionId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechIdString](self, "deleteSpeechIdString");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[DUSchemaDUSpeechAudioRecord deleteInteractionId](self, "deleteInteractionId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechIdString](self, "deleteSpeechIdString");
  }
  if (objc_msgSend(v4, "isConditionSet:", 8))
  {
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");
    -[DUSchemaDUSpeechAudioRecord deleteSpeechIdString](self, "deleteSpeechIdString");
  }
  -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DUSchemaDUSpeechAudioRecord deleteInteractionId](self, "deleteInteractionId");
  -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DUSchemaDUSpeechAudioRecord deleteSpeechId](self, "deleteSpeechId");

  return v5;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)deleteLanguage
{
  -[DUSchemaDUSpeechAudioRecord setLanguage:](self, "setLanguage:", 0);
}

- (BOOL)hasCodec
{
  return self->_codec != 0;
}

- (void)deleteCodec
{
  -[DUSchemaDUSpeechAudioRecord setCodec:](self, "setCodec:", 0);
}

- (BOOL)hasInteractionId
{
  return self->_interactionId != 0;
}

- (void)deleteInteractionId
{
  -[DUSchemaDUSpeechAudioRecord setInteractionId:](self, "setInteractionId:", 0);
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteSpeechId
{
  -[DUSchemaDUSpeechAudioRecord setSpeechId:](self, "setSpeechId:", 0);
}

- (BOOL)hasSpeechIdString
{
  return self->_speechIdString != 0;
}

- (void)deleteSpeechIdString
{
  -[DUSchemaDUSpeechAudioRecord setSpeechIdString:](self, "setSpeechIdString:", 0);
}

- (void)setAudioCreatedTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioCreatedTimestampMs = a3;
}

- (BOOL)hasAudioCreatedTimestampMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioCreatedTimestampMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioCreatedTimestampMs
{
  -[DUSchemaDUSpeechAudioRecord setAudioCreatedTimestampMs:](self, "setAudioCreatedTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return DUSchemaDUSpeechAudioRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[DUSchemaDUSpeechAudioRecord language](self, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[DUSchemaDUSpeechAudioRecord codec](self, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DUSchemaDUSpeechAudioRecord speechIdString](self, "speechIdString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v11 = v12;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  unint64_t audioCreatedTimestampMs;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[DUSchemaDUSpeechAudioRecord language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[DUSchemaDUSpeechAudioRecord language](self, "language");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DUSchemaDUSpeechAudioRecord language](self, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[DUSchemaDUSpeechAudioRecord codec](self, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[DUSchemaDUSpeechAudioRecord codec](self, "codec");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DUSchemaDUSpeechAudioRecord codec](self, "codec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[DUSchemaDUSpeechAudioRecord speechIdString](self, "speechIdString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechIdString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[DUSchemaDUSpeechAudioRecord speechIdString](self, "speechIdString");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[DUSchemaDUSpeechAudioRecord speechIdString](self, "speechIdString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechIdString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_27;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[56] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (audioCreatedTimestampMs = self->_audioCreatedTimestampMs,
          audioCreatedTimestampMs == objc_msgSend(v4, "audioCreatedTimestampMs")))
    {
      v32 = 1;
      goto LABEL_28;
    }
  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_language, "hash");
  v4 = -[NSString hash](self->_codec, "hash");
  v5 = -[SISchemaUUID hash](self->_interactionId, "hash");
  v6 = -[SISchemaUUID hash](self->_speechId, "hash");
  v7 = -[NSString hash](self->_speechIdString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761u * self->_audioCreatedTimestampMs;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DUSchemaDUSpeechAudioRecord audioCreatedTimestampMs](self, "audioCreatedTimestampMs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("audioCreatedTimestampMs"));

  }
  if (self->_codec)
  {
    -[DUSchemaDUSpeechAudioRecord codec](self, "codec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("codec"));

  }
  if (self->_interactionId)
  {
    -[DUSchemaDUSpeechAudioRecord interactionId](self, "interactionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("interactionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("interactionId"));

    }
  }
  if (self->_language)
  {
    -[DUSchemaDUSpeechAudioRecord language](self, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("language"));

  }
  if (self->_speechId)
  {
    -[DUSchemaDUSpeechAudioRecord speechId](self, "speechId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("speechId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("speechId"));

    }
  }
  if (self->_speechIdString)
  {
    -[DUSchemaDUSpeechAudioRecord speechIdString](self, "speechIdString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("speechIdString"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DUSchemaDUSpeechAudioRecord dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DUSchemaDUSpeechAudioRecord)initWithJSON:(id)a3
{
  void *v4;
  DUSchemaDUSpeechAudioRecord *v5;
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
    self = -[DUSchemaDUSpeechAudioRecord initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DUSchemaDUSpeechAudioRecord)initWithDictionary:(id)a3
{
  id v4;
  DUSchemaDUSpeechAudioRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  void *v15;
  void *v16;
  DUSchemaDUSpeechAudioRecord *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DUSchemaDUSpeechAudioRecord;
  v5 = -[DUSchemaDUSpeechAudioRecord init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("language"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DUSchemaDUSpeechAudioRecord setLanguage:](v5, "setLanguage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codec"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[DUSchemaDUSpeechAudioRecord setCodec:](v5, "setCodec:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[DUSchemaDUSpeechAudioRecord setInteractionId:](v5, "setInteractionId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[DUSchemaDUSpeechAudioRecord setSpeechId:](v5, "setSpeechId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechIdString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[DUSchemaDUSpeechAudioRecord setSpeechIdString:](v5, "setSpeechIdString:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioCreatedTimestampMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DUSchemaDUSpeechAudioRecord setAudioCreatedTimestampMs:](v5, "setAudioCreatedTimestampMs:", objc_msgSend(v16, "unsignedLongLongValue"));
    v17 = v5;

  }
  return v5;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)codec
{
  return self->_codec;
}

- (void)setCodec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaUUID)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionId, a3);
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_speechId, a3);
}

- (NSString)speechIdString
{
  return self->_speechIdString;
}

- (void)setSpeechIdString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)audioCreatedTimestampMs
{
  return self->_audioCreatedTimestampMs;
}

- (void)setHasLanguage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasInteractionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSpeechId:(BOOL)a3
{
  self->_hasLanguage = a3;
}

- (void)setHasSpeechIdString:(BOOL)a3
{
  self->_hasCodec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechIdString, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
