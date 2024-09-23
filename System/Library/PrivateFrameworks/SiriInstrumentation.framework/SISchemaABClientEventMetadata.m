@implementation SISchemaABClientEventMetadata

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
  v13.super_class = (Class)SISchemaABClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
  {
    -[SISchemaABClientEventMetadata deleteSiriDeviceId](self, "deleteSiriDeviceId");
    -[SISchemaABClientEventMetadata deleteSpeechId](self, "deleteSpeechId");
  }
  -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaABClientEventMetadata deleteSiriDeviceId](self, "deleteSiriDeviceId");
  -[SISchemaABClientEventMetadata speechId](self, "speechId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaABClientEventMetadata deleteSpeechId](self, "deleteSpeechId");

  return v5;
}

- (BOOL)hasSiriDeviceId
{
  return self->_siriDeviceId != 0;
}

- (void)deleteSiriDeviceId
{
  -[SISchemaABClientEventMetadata setSiriDeviceId:](self, "setSiriDeviceId:", 0);
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteSpeechId
{
  -[SISchemaABClientEventMetadata setSpeechId:](self, "setSpeechId:", 0);
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeIntervalSince1970 = a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTimeIntervalSince1970
{
  -[SISchemaABClientEventMetadata setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaABClientEventMetadata speechId](self, "speechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaABClientEventMetadata speechId](self, "speechId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

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
  BOOL v17;
  double timeIntervalSince1970;
  double v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDeviceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaABClientEventMetadata speechId](self, "speechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SISchemaABClientEventMetadata speechId](self, "speechId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaABClientEventMetadata speechId](self, "speechId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (timeIntervalSince1970 = self->_timeIntervalSince1970,
          objc_msgSend(v4, "timeIntervalSince1970"),
          timeIntervalSince1970 == v20))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double timeIntervalSince1970;
  double v7;
  long double v8;
  double v9;

  v3 = -[SISchemaUUID hash](self->_siriDeviceId, "hash");
  v4 = -[SISchemaUUID hash](self->_speechId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timeIntervalSince1970 = self->_timeIntervalSince1970;
    v7 = -timeIntervalSince1970;
    if (timeIntervalSince1970 >= 0.0)
      v7 = self->_timeIntervalSince1970;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_siriDeviceId)
  {
    -[SISchemaABClientEventMetadata siriDeviceId](self, "siriDeviceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("siriDeviceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("siriDeviceId"));

    }
  }
  if (self->_speechId)
  {
    -[SISchemaABClientEventMetadata speechId](self, "speechId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("speechId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("speechId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaABClientEventMetadata timeIntervalSince1970](self, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timeIntervalSince1970"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaABClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaABClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  SISchemaABClientEventMetadata *v5;
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
    self = -[SISchemaABClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaABClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  SISchemaABClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaABClientEventMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaABClientEventMetadata;
  v5 = -[SISchemaABClientEventMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDeviceId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaABClientEventMetadata setSiriDeviceId:](v5, "setSiriDeviceId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[SISchemaABClientEventMetadata setSpeechId:](v5, "setSpeechId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeIntervalSince1970"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[SISchemaABClientEventMetadata setTimeIntervalSince1970:](v5, "setTimeIntervalSince1970:");
    }
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)siriDeviceId
{
  return self->_siriDeviceId;
}

- (void)setSiriDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_siriDeviceId, a3);
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_speechId, a3);
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setHasSiriDeviceId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSpeechId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_siriDeviceId, 0);
}

@end
