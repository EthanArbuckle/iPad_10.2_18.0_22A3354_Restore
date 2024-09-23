@implementation MHSchemaMHAssistantDaemonAudioRecordingStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAudioInputRoute:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioInputRoute = a3;
}

- (BOOL)hasAudioInputRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioInputRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioInputRoute
{
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInputRoute:](self, "setAudioInputRoute:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSource
{
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInterfaceVendorId:](self, "setAudioInterfaceVendorId:", 0);
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceProductId
{
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInterfaceProductId:](self, "setAudioInterfaceProductId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceProductId](self, "audioInterfaceProductId");
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
  unsigned __int8 *v4;
  $9C7A9C04C23C81C86CB20AFCA1BADD63 has;
  unsigned int v6;
  int audioInputRoute;
  int v8;
  int source;
  void *v10;
  void *v11;
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

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioInputRoute = self->_audioInputRoute;
    if (audioInputRoute != objc_msgSend(v4, "audioInputRoute"))
      goto LABEL_19;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    source = self->_source;
    if (source != objc_msgSend(v4, "source"))
      goto LABEL_19;
  }
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceVendorId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_18;
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceVendorId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_19;
  }
  else
  {

  }
  -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceProductId](self, "audioInterfaceProductId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterfaceProductId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceProductId](self, "audioInterfaceProductId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_22:
      v22 = 1;
      goto LABEL_20;
    }
    v18 = (void *)v17;
    -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceProductId](self, "audioInterfaceProductId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterfaceProductId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
LABEL_18:

  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_audioInputRoute;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_source;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_audioInterfaceVendorId, "hash");
  return v5 ^ -[NSString hash](self->_audioInterfaceProductId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInputRoute](self, "audioInputRoute") - 1;
    if (v4 > 0xE)
      v5 = CFSTR("AUDIOINPUTROUTE_UNKNOWN");
    else
      v5 = off_1E5630120[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioInputRoute"));
  }
  if (self->_audioInterfaceProductId)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceProductId](self, "audioInterfaceProductId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioInterfaceProductId"));

  }
  if (self->_audioInterfaceVendorId)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingStarted audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioInterfaceVendorId"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = -[MHSchemaMHAssistantDaemonAudioRecordingStarted source](self, "source") - 1;
    if (v10 > 7)
      v11 = CFSTR("MHASSISTANTDAEMONAUDIOSOURCE_UNKNOWN");
    else
      v11 = off_1E5630198[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("source"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioRecordingStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioRecordingStarted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioRecordingStarted *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioRecordingStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingStarted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioRecordingStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MHSchemaMHAssistantDaemonAudioRecordingStarted *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingStarted;
  v5 = -[MHSchemaMHAssistantDaemonAudioRecordingStarted init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInputRoute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInputRoute:](v5, "setAudioInputRoute:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingStarted setSource:](v5, "setSource:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceVendorId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInterfaceVendorId:](v5, "setAudioInterfaceVendorId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterfaceProductId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInterfaceProductId:](v5, "setAudioInterfaceProductId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (int)audioInputRoute
{
  return self->_audioInputRoute;
}

- (int)source
{
  return self->_source;
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
