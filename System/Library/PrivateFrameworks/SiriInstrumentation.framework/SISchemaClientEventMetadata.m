@implementation SISchemaClientEventMetadata

- (void)willProduceDictionaryRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaClientEventMetadata turnID](self, "turnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length") == 16)
  {
    objc_msgSend(v5, "si_asNSUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("turnID"));

  }
}

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
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SISchemaClientEventMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v8, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isConditionSet:", 8, v8.receiver, v8.super_class);

  if (v6)
    -[SISchemaClientEventMetadata deleteSiriDeviceID](self, "deleteSiriDeviceID");
  return v5;
}

- (BOOL)hasTurnID
{
  return self->_turnID != 0;
}

- (void)deleteTurnID
{
  -[SISchemaClientEventMetadata setTurnID:](self, "setTurnID:", 0);
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
}

- (void)deleteSiriDeviceID
{
  -[SISchemaClientEventMetadata setSiriDeviceID:](self, "setSiriDeviceID:", 0);
}

- (BOOL)hasEventGeneratedTimestampRefId
{
  return self->_eventGeneratedTimestampRefId != 0;
}

- (void)deleteEventGeneratedTimestampRefId
{
  -[SISchemaClientEventMetadata setEventGeneratedTimestampRefId:](self, "setEventGeneratedTimestampRefId:", 0);
}

- (void)setEventGeneratedRelativeToBootTimeTimestampNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventGeneratedRelativeToBootTimeTimestampNs = a3;
}

- (BOOL)hasEventGeneratedRelativeToBootTimeTimestampNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventGeneratedRelativeToBootTimeTimestampNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventGeneratedRelativeToBootTimeTimestampNs
{
  -[SISchemaClientEventMetadata setEventGeneratedRelativeToBootTimeTimestampNs:](self, "setEventGeneratedRelativeToBootTimeTimestampNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaClientEventMetadata turnID](self, "turnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[SISchemaClientEventMetadata siriDeviceID](self, "siriDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteDataField();
  -[SISchemaClientEventMetadata eventGeneratedTimestampRefId](self, "eventGeneratedTimestampRefId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v7 = v8;
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
  BOOL v22;
  int64_t eventGeneratedRelativeToBootTimeTimestampNs;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SISchemaClientEventMetadata turnID](self, "turnID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaClientEventMetadata turnID](self, "turnID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaClientEventMetadata turnID](self, "turnID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaClientEventMetadata siriDeviceID](self, "siriDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaClientEventMetadata siriDeviceID](self, "siriDeviceID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaClientEventMetadata siriDeviceID](self, "siriDeviceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDeviceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaClientEventMetadata eventGeneratedTimestampRefId](self, "eventGeneratedTimestampRefId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventGeneratedTimestampRefId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[SISchemaClientEventMetadata eventGeneratedTimestampRefId](self, "eventGeneratedTimestampRefId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaClientEventMetadata eventGeneratedTimestampRefId](self, "eventGeneratedTimestampRefId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventGeneratedTimestampRefId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[40] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (eventGeneratedRelativeToBootTimeTimestampNs = self->_eventGeneratedRelativeToBootTimeTimestampNs,
          eventGeneratedRelativeToBootTimeTimestampNs == objc_msgSend(v4, "eventGeneratedRelativeToBootTimeTimestampNs")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_turnID, "hash");
  v4 = -[NSData hash](self->_siriDeviceID, "hash");
  v5 = -[NSString hash](self->_eventGeneratedTimestampRefId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_eventGeneratedRelativeToBootTimeTimestampNs;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaClientEventMetadata eventGeneratedRelativeToBootTimeTimestampNs](self, "eventGeneratedRelativeToBootTimeTimestampNs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("eventGeneratedRelativeToBootTimeTimestampNs"));

  }
  if (self->_eventGeneratedTimestampRefId)
  {
    -[SISchemaClientEventMetadata eventGeneratedTimestampRefId](self, "eventGeneratedTimestampRefId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventGeneratedTimestampRefId"));

  }
  if (self->_siriDeviceID)
  {
    -[SISchemaClientEventMetadata siriDeviceID](self, "siriDeviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriDeviceID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriDeviceID"));

    }
  }
  if (self->_turnID)
  {
    -[SISchemaClientEventMetadata turnID](self, "turnID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("turnID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("turnID"));

    }
  }
  -[SISchemaClientEventMetadata willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  SISchemaClientEventMetadata *v5;
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
    self = -[SISchemaClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  SISchemaClientEventMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaClientEventMetadata *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaClientEventMetadata;
  v5 = -[SISchemaClientEventMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[SISchemaClientEventMetadata setTurnID:](v5, "setTurnID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDeviceID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      -[SISchemaClientEventMetadata setSiriDeviceID:](v5, "setSiriDeviceID:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventGeneratedTimestampRefId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaClientEventMetadata setEventGeneratedTimestampRefId:](v5, "setEventGeneratedTimestampRefId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventGeneratedRelativeToBootTimeTimestampNs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaClientEventMetadata setEventGeneratedRelativeToBootTimeTimestampNs:](v5, "setEventGeneratedRelativeToBootTimeTimestampNs:", objc_msgSend(v12, "longLongValue"));
    v13 = v5;

  }
  return v5;
}

- (NSData)turnID
{
  return self->_turnID;
}

- (void)setTurnID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)siriDeviceID
{
  return self->_siriDeviceID;
}

- (void)setSiriDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)eventGeneratedTimestampRefId
{
  return self->_eventGeneratedTimestampRefId;
}

- (void)setEventGeneratedTimestampRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)eventGeneratedRelativeToBootTimeTimestampNs
{
  return self->_eventGeneratedRelativeToBootTimeTimestampNs;
}

- (void)setHasTurnID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSiriDeviceID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasEventGeneratedTimestampRefId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventGeneratedTimestampRefId, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
  objc_storeStrong((id *)&self->_turnID, 0);
}

@end
