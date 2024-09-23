@implementation SISchemaClientTransportEventMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasEventTransmittedTimestampRefId
{
  return self->_eventTransmittedTimestampRefId != 0;
}

- (void)deleteEventTransmittedTimestampRefId
{
  -[SISchemaClientTransportEventMetadata setEventTransmittedTimestampRefId:](self, "setEventTransmittedTimestampRefId:", 0);
}

- (void)setEventTransmittedRelativeToBootTimeTimestampNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventTransmittedRelativeToBootTimeTimestampNs = a3;
}

- (BOOL)hasEventTransmittedRelativeToBootTimeTimestampNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventTransmittedRelativeToBootTimeTimestampNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventTransmittedRelativeToBootTimeTimestampNs
{
  -[SISchemaClientTransportEventMetadata setEventTransmittedRelativeToBootTimeTimestampNs:](self, "setEventTransmittedRelativeToBootTimeTimestampNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setServerArrivedTimestampNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_serverArrivedTimestampNs = a3;
}

- (BOOL)hasServerArrivedTimestampNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasServerArrivedTimestampNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteServerArrivedTimestampNs
{
  -[SISchemaClientTransportEventMetadata setServerArrivedTimestampNs:](self, "setServerArrivedTimestampNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasArrivedServerPod
{
  return self->_arrivedServerPod != 0;
}

- (void)deleteArrivedServerPod
{
  -[SISchemaClientTransportEventMetadata setArrivedServerPod:](self, "setArrivedServerPod:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientTransportEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaClientTransportEventMetadata eventTransmittedTimestampRefId](self, "eventTransmittedTimestampRefId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[SISchemaClientTransportEventMetadata arrivedServerPod](self, "arrivedServerPod");
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
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $40B14186B08E018462790434F5BB9021 has;
  unsigned int v13;
  int64_t eventTransmittedRelativeToBootTimeTimestampNs;
  int v15;
  int64_t serverArrivedTimestampNs;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[SISchemaClientTransportEventMetadata eventTransmittedTimestampRefId](self, "eventTransmittedTimestampRefId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTransmittedTimestampRefId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[SISchemaClientTransportEventMetadata eventTransmittedTimestampRefId](self, "eventTransmittedTimestampRefId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaClientTransportEventMetadata eventTransmittedTimestampRefId](self, "eventTransmittedTimestampRefId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventTransmittedTimestampRefId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    eventTransmittedRelativeToBootTimeTimestampNs = self->_eventTransmittedRelativeToBootTimeTimestampNs;
    if (eventTransmittedRelativeToBootTimeTimestampNs != objc_msgSend(v4, "eventTransmittedRelativeToBootTimeTimestampNs"))goto LABEL_19;
    has = self->_has;
    v13 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v15)
  {
    serverArrivedTimestampNs = self->_serverArrivedTimestampNs;
    if (serverArrivedTimestampNs != objc_msgSend(v4, "serverArrivedTimestampNs"))
      goto LABEL_19;
  }
  -[SISchemaClientTransportEventMetadata arrivedServerPod](self, "arrivedServerPod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivedServerPod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[SISchemaClientTransportEventMetadata arrivedServerPod](self, "arrivedServerPod");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

LABEL_22:
    v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  -[SISchemaClientTransportEventMetadata arrivedServerPod](self, "arrivedServerPod");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivedServerPod");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_22;
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_eventTransmittedTimestampRefId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_eventTransmittedRelativeToBootTimeTimestampNs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_arrivedServerPod, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_serverArrivedTimestampNs;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_arrivedServerPod, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_arrivedServerPod)
  {
    -[SISchemaClientTransportEventMetadata arrivedServerPod](self, "arrivedServerPod");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("arrivedServerPod"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaClientTransportEventMetadata eventTransmittedRelativeToBootTimeTimestampNs](self, "eventTransmittedRelativeToBootTimeTimestampNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventTransmittedRelativeToBootTimeTimestampNs"));

  }
  if (self->_eventTransmittedTimestampRefId)
  {
    -[SISchemaClientTransportEventMetadata eventTransmittedTimestampRefId](self, "eventTransmittedTimestampRefId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventTransmittedTimestampRefId"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaClientTransportEventMetadata serverArrivedTimestampNs](self, "serverArrivedTimestampNs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("serverArrivedTimestampNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaClientTransportEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaClientTransportEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  SISchemaClientTransportEventMetadata *v5;
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
    self = -[SISchemaClientTransportEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaClientTransportEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  SISchemaClientTransportEventMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaClientTransportEventMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaClientTransportEventMetadata;
  v5 = -[SISchemaClientTransportEventMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTransmittedTimestampRefId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaClientTransportEventMetadata setEventTransmittedTimestampRefId:](v5, "setEventTransmittedTimestampRefId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTransmittedRelativeToBootTimeTimestampNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaClientTransportEventMetadata setEventTransmittedRelativeToBootTimeTimestampNs:](v5, "setEventTransmittedRelativeToBootTimeTimestampNs:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverArrivedTimestampNs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaClientTransportEventMetadata setServerArrivedTimestampNs:](v5, "setServerArrivedTimestampNs:", objc_msgSend(v9, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivedServerPod"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaClientTransportEventMetadata setArrivedServerPod:](v5, "setArrivedServerPod:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)eventTransmittedTimestampRefId
{
  return self->_eventTransmittedTimestampRefId;
}

- (void)setEventTransmittedTimestampRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)eventTransmittedRelativeToBootTimeTimestampNs
{
  return self->_eventTransmittedRelativeToBootTimeTimestampNs;
}

- (int64_t)serverArrivedTimestampNs
{
  return self->_serverArrivedTimestampNs;
}

- (NSString)arrivedServerPod
{
  return self->_arrivedServerPod;
}

- (void)setArrivedServerPod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasEventTransmittedTimestampRefId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasArrivedServerPod:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivedServerPod, 0);
  objc_storeStrong((id *)&self->_eventTransmittedTimestampRefId, 0);
}

@end
