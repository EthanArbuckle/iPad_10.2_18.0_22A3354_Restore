@implementation MHSchemaMHAssistantDaemonAudioRecordingFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReason
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed setAudioInterfaceVendorId:](self, "setAudioInterfaceVendorId:", 0);
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceProductId
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed setAudioInterfaceProductId:](self, "setAudioInterfaceProductId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceProductId](self, "audioInterfaceProductId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int reason;
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
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_15;
  }
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceVendorId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceVendorId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceProductId](self, "audioInterfaceProductId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceProductId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceProductId](self, "audioInterfaceProductId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceProductId](self, "audioInterfaceProductId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceProductId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_reason;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_audioInterfaceVendorId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_audioInterfaceProductId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioInterfaceProductId)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceProductId](self, "audioInterfaceProductId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioInterfaceProductId"));

  }
  if (self->_audioInterfaceVendorId)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFailed audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioInterfaceVendorId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if (-[MHSchemaMHAssistantDaemonAudioRecordingFailed reason](self, "reason") == 1)
      v8 = CFSTR("MHSPEECHERRORTYPE_SPEECH_PREPARE_FAILED");
    else
      v8 = CFSTR("MHSPEECHERRORTYPE_UNKNOWN");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioRecordingFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioRecordingFailed)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioRecordingFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailed)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingFailed;
  v5 = -[MHSchemaMHAssistantDaemonAudioRecordingFailed init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingFailed setReason:](v5, "setReason:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceVendorId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[MHSchemaMHAssistantDaemonAudioRecordingFailed setAudioInterfaceVendorId:](v5, "setAudioInterfaceVendorId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceProductId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[MHSchemaMHAssistantDaemonAudioRecordingFailed setAudioInterfaceProductId:](v5, "setAudioInterfaceProductId:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)reason
{
  return self->_reason;
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (void)setAudioInterfaceProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAudioInterfaceProductId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
}

@end
