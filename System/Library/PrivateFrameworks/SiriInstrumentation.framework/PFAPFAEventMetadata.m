@implementation PFAPFAEventMetadata

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
  v9.super_class = (Class)PFAPFAEventMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PFAPFAEventMetadata deleteDeviceDimensions](self, "deleteDeviceDimensions");
  return v5;
}

- (void)setEventTimestampInMsSince1970:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventTimestampInMsSince1970 = a3;
}

- (BOOL)hasEventTimestampInMsSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventTimestampInMsSince1970
{
  -[PFAPFAEventMetadata setEventTimestampInMsSince1970:](self, "setEventTimestampInMsSince1970:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasDeviceDimensions
{
  return self->_deviceDimensions != 0;
}

- (void)deleteDeviceDimensions
{
  -[PFAPFAEventMetadata setDeviceDimensions:](self, "setDeviceDimensions:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PFAPFAEventMetadataReadFrom(self, (uint64_t)a3);
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
  -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t eventTimestampInMsSince1970;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970,
            eventTimestampInMsSince1970 == objc_msgSend(v4, "eventTimestampInMsSince1970")))
      {
        -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deviceDimensions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "deviceDimensions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_eventTimestampInMsSince1970;
  else
    v2 = 0;
  return -[PFAPFADeviceDimensions hash](self->_deviceDimensions, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceDimensions)
  {
    -[PFAPFAEventMetadata deviceDimensions](self, "deviceDimensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceDimensions"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PFAPFAEventMetadata eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventTimestampInMsSince1970"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAPFAEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAPFAEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  PFAPFAEventMetadata *v5;
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
    self = -[PFAPFAEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAPFAEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  PFAPFAEventMetadata *v5;
  void *v6;
  void *v7;
  PFAPFADeviceDimensions *v8;
  PFAPFAEventMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFAPFAEventMetadata;
  v5 = -[PFAPFAEventMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTimestampInMsSince1970"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAPFAEventMetadata setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceDimensions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[PFAPFADeviceDimensions initWithDictionary:]([PFAPFADeviceDimensions alloc], "initWithDictionary:", v7);
      -[PFAPFAEventMetadata setDeviceDimensions:](v5, "setDeviceDimensions:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (PFAPFADeviceDimensions)deviceDimensions
{
  return self->_deviceDimensions;
}

- (void)setDeviceDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDimensions, a3);
}

- (void)setHasDeviceDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDimensions, 0);
}

@end
