@implementation ASRSchemaASRSampledAudioFileEnqueued

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
  v9.super_class = (Class)ASRSchemaASRSampledAudioFileEnqueued;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASRSampledAudioFileEnqueued deleteOriginalAsrId](self, "deleteOriginalAsrId");
  return v5;
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

- (void)deleteOriginalAsrId
{
  -[ASRSchemaASRSampledAudioFileEnqueued setOriginalAsrId:](self, "setOriginalAsrId:", 0);
}

- (void)setAudioCodec:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioCodec = a3;
}

- (BOOL)hasAudioCodec
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioCodec:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioCodec
{
  -[ASRSchemaASRSampledAudioFileEnqueued setAudioCodec:](self, "setAudioCodec:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRSampledAudioFileEnqueuedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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
  int audioCodec;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalAsrId");
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
    audioCodec = self->_audioCodec;
    if (audioCodec != objc_msgSend(v4, "audioCodec"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_originalAsrId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_audioCodec;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[ASRSchemaASRSampledAudioFileEnqueued audioCodec](self, "audioCodec") - 1;
    if (v4 > 0xA)
      v5 = CFSTR("MHASRAUDIOCODEC_UNKNOWN");
    else
      v5 = off_1E562B608[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioCodec"));
  }
  if (self->_originalAsrId)
  {
    -[ASRSchemaASRSampledAudioFileEnqueued originalAsrId](self, "originalAsrId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originalAsrId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalAsrId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRSampledAudioFileEnqueued dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRSampledAudioFileEnqueued)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRSampledAudioFileEnqueued *v5;
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
    self = -[ASRSchemaASRSampledAudioFileEnqueued initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRSampledAudioFileEnqueued)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRSampledAudioFileEnqueued *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  ASRSchemaASRSampledAudioFileEnqueued *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASRSchemaASRSampledAudioFileEnqueued;
  v5 = -[ASRSchemaASRSampledAudioFileEnqueued init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalAsrId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRSampledAudioFileEnqueued setOriginalAsrId:](v5, "setOriginalAsrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioCodec"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRSampledAudioFileEnqueued setAudioCodec:](v5, "setAudioCodec:", objc_msgSend(v8, "intValue"));
    v9 = v5;

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

- (int)audioCodec
{
  return self->_audioCodec;
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

@end
