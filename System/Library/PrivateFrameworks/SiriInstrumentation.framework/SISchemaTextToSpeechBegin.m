@implementation SISchemaTextToSpeechBegin

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
  v9.super_class = (Class)SISchemaTextToSpeechBegin;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaTextToSpeechBegin deleteHardwareInterfaceVendorID](self, "deleteHardwareInterfaceVendorID");
  return v5;
}

- (BOOL)hasAceID
{
  return self->_aceID != 0;
}

- (void)deleteAceID
{
  -[SISchemaTextToSpeechBegin setAceID:](self, "setAceID:", 0);
}

- (void)setAudioOutputRoute:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioOutputRoute = a3;
}

- (BOOL)hasAudioOutputRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioOutputRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioOutputRoute
{
  -[SISchemaTextToSpeechBegin setAudioOutputRoute:](self, "setAudioOutputRoute:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasHardwareInterfaceVendorID
{
  return self->_hardwareInterfaceVendorID != 0;
}

- (void)deleteHardwareInterfaceVendorID
{
  -[SISchemaTextToSpeechBegin setHardwareInterfaceVendorID:](self, "setHardwareInterfaceVendorID:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaTextToSpeechBeginReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaTextToSpeechBegin aceID](self, "aceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
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
  int audioOutputRoute;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[SISchemaTextToSpeechBegin aceID](self, "aceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[SISchemaTextToSpeechBegin aceID](self, "aceID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaTextToSpeechBegin aceID](self, "aceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    audioOutputRoute = self->_audioOutputRoute;
    if (audioOutputRoute != objc_msgSend(v4, "audioOutputRoute"))
      goto LABEL_15;
  }
  -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareInterfaceVendorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareInterfaceVendorID");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_aceID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_audioOutputRoute;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[SISchemaHardwareInterfaceIdentifier hash](self->_hardwareInterfaceVendorID, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceID)
  {
    -[SISchemaTextToSpeechBegin aceID](self, "aceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceID"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = -[SISchemaTextToSpeechBegin audioOutputRoute](self, "audioOutputRoute") - 1;
    if (v6 > 6)
      v7 = CFSTR("AUDIOOUTPUTROUTE_UNKNOWN_AUDIO_OUTPUT_ROUTE");
    else
      v7 = off_1E5637260[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioOutputRoute"));
  }
  if (self->_hardwareInterfaceVendorID)
  {
    -[SISchemaTextToSpeechBegin hardwareInterfaceVendorID](self, "hardwareInterfaceVendorID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hardwareInterfaceVendorID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hardwareInterfaceVendorID"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaTextToSpeechBegin dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaTextToSpeechBegin)initWithJSON:(id)a3
{
  void *v4;
  SISchemaTextToSpeechBegin *v5;
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
    self = -[SISchemaTextToSpeechBegin initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaTextToSpeechBegin)initWithDictionary:(id)a3
{
  id v4;
  SISchemaTextToSpeechBegin *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaHardwareInterfaceIdentifier *v10;
  SISchemaTextToSpeechBegin *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaTextToSpeechBegin;
  v5 = -[SISchemaTextToSpeechBegin init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaTextToSpeechBegin setAceID:](v5, "setAceID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioOutputRoute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaTextToSpeechBegin setAudioOutputRoute:](v5, "setAudioOutputRoute:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareInterfaceVendorID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaHardwareInterfaceIdentifier initWithDictionary:]([SISchemaHardwareInterfaceIdentifier alloc], "initWithDictionary:", v9);
      -[SISchemaTextToSpeechBegin setHardwareInterfaceVendorID:](v5, "setHardwareInterfaceVendorID:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)aceID
{
  return self->_aceID;
}

- (void)setAceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)audioOutputRoute
{
  return self->_audioOutputRoute;
}

- (SISchemaHardwareInterfaceIdentifier)hardwareInterfaceVendorID
{
  return self->_hardwareInterfaceVendorID;
}

- (void)setHardwareInterfaceVendorID:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareInterfaceVendorID, a3);
}

- (void)setHasAceID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasHardwareInterfaceVendorID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareInterfaceVendorID, 0);
  objc_storeStrong((id *)&self->_aceID, 0);
}

@end
