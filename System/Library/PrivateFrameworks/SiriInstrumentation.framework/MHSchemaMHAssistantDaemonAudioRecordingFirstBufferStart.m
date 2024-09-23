@implementation MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFirstBufferStartTimeOffsetInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_firstBufferStartTimeOffsetInNs = a3;
}

- (BOOL)hasFirstBufferStartTimeOffsetInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFirstBufferStartTimeOffsetInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFirstBufferStartTimeOffsetInNs
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setFirstBufferStartTimeOffsetInNs:](self, "setFirstBufferStartTimeOffsetInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setAudioInterfaceVendorId:](self, "setAudioInterfaceVendorId:", 0);
}

- (BOOL)hasAudioInterfaceProductName
{
  return self->_audioInterfaceProductName != 0;
}

- (void)deleteAudioInterfaceProductName
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setAudioInterfaceProductName:](self, "setAudioInterfaceProductName:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStartReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceProductName](self, "audioInterfaceProductName");
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
  unint64_t firstBufferStartTimeOffsetInNs;
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
    firstBufferStartTimeOffsetInNs = self->_firstBufferStartTimeOffsetInNs;
    if (firstBufferStartTimeOffsetInNs != objc_msgSend(v4, "firstBufferStartTimeOffsetInNs"))
      goto LABEL_15;
  }
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceVendorId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceVendorId](self, "audioInterfaceVendorId");
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
  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceProductName](self, "audioInterfaceProductName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceProductName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceProductName](self, "audioInterfaceProductName");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceProductName](self, "audioInterfaceProductName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceProductName");
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
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_firstBufferStartTimeOffsetInNs;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_audioInterfaceVendorId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_audioInterfaceProductName, "hash");
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
  if (self->_audioInterfaceProductName)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceProductName](self, "audioInterfaceProductName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioInterfaceProductName"));

  }
  if (self->_audioInterfaceVendorId)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioInterfaceVendorId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart firstBufferStartTimeOffsetInNs](self, "firstBufferStartTimeOffsetInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("firstBufferStartTimeOffsetInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart;
  v5 = -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstBufferStartTimeOffsetInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setFirstBufferStartTimeOffsetInNs:](v5, "setFirstBufferStartTimeOffsetInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceVendorId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setAudioInterfaceVendorId:](v5, "setAudioInterfaceVendorId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceProductName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setAudioInterfaceProductName:](v5, "setAudioInterfaceProductName:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unint64_t)firstBufferStartTimeOffsetInNs
{
  return self->_firstBufferStartTimeOffsetInNs;
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioInterfaceProductName
{
  return self->_audioInterfaceProductName;
}

- (void)setAudioInterfaceProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAudioInterfaceProductName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInterfaceProductName, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
}

@end
