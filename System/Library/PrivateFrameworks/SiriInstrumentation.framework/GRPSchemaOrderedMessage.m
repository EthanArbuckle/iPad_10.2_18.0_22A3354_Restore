@implementation GRPSchemaOrderedMessage

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
  v9.super_class = (Class)GRPSchemaOrderedMessage;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[GRPSchemaOrderedMessage deleteSiriEventTypeUnion](self, "deleteSiriEventTypeUnion");
  return v5;
}

- (void)setLogicalEventTimestampInNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_logicalEventTimestampInNs = a3;
}

- (BOOL)hasLogicalEventTimestampInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLogicalEventTimestampInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLogicalEventTimestampInNs
{
  -[GRPSchemaOrderedMessage setLogicalEventTimestampInNs:](self, "setLogicalEventTimestampInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSiriEventTypeUnion:(id)a3
{
  unint64_t v3;

  v3 = 100;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_siriEventTypeUnion, a3);
}

- (GRPSchemaSiriEventTypeUnion)siriEventTypeUnion
{
  if (self->_whichEvent_Type == 100)
    return self->_siriEventTypeUnion;
  else
    return (GRPSchemaSiriEventTypeUnion *)0;
}

- (void)deleteSiriEventTypeUnion
{
  GRPSchemaSiriEventTypeUnion *siriEventTypeUnion;

  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    siriEventTypeUnion = self->_siriEventTypeUnion;
    self->_siriEventTypeUnion = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaOrderedMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichEvent_Type;
  int64_t logicalEventTimestampInNs;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichEvent_Type = self->_whichEvent_Type;
    if (whichEvent_Type == objc_msgSend(v4, "whichEvent_Type") && (*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (logicalEventTimestampInNs = self->_logicalEventTimestampInNs,
            logicalEventTimestampInNs == objc_msgSend(v4, "logicalEventTimestampInNs")))
      {
        -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "siriEventTypeUnion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "siriEventTypeUnion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_logicalEventTimestampInNs;
  else
    v2 = 0;
  return -[GRPSchemaSiriEventTypeUnion hash](self->_siriEventTypeUnion, "hash") ^ v2;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[GRPSchemaOrderedMessage logicalEventTimestampInNs](self, "logicalEventTimestampInNs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("logicalEventTimestampInNs"));

  }
  if (self->_siriEventTypeUnion)
  {
    -[GRPSchemaOrderedMessage siriEventTypeUnion](self, "siriEventTypeUnion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("siriEventTypeUnion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("siriEventTypeUnion"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRPSchemaOrderedMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRPSchemaOrderedMessage)initWithJSON:(id)a3
{
  void *v4;
  GRPSchemaOrderedMessage *v5;
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
    self = -[GRPSchemaOrderedMessage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRPSchemaOrderedMessage)initWithDictionary:(id)a3
{
  id v4;
  GRPSchemaOrderedMessage *v5;
  void *v6;
  void *v7;
  GRPSchemaSiriEventTypeUnion *v8;
  GRPSchemaOrderedMessage *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GRPSchemaOrderedMessage;
  v5 = -[GRPSchemaOrderedMessage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logicalEventTimestampInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRPSchemaOrderedMessage setLogicalEventTimestampInNs:](v5, "setLogicalEventTimestampInNs:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriEventTypeUnion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[GRPSchemaSiriEventTypeUnion initWithDictionary:]([GRPSchemaSiriEventTypeUnion alloc], "initWithDictionary:", v7);
      -[GRPSchemaOrderedMessage setSiriEventTypeUnion:](v5, "setSiriEventTypeUnion:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (int64_t)logicalEventTimestampInNs
{
  return self->_logicalEventTimestampInNs;
}

- (BOOL)hasSiriEventTypeUnion
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasSiriEventTypeUnion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriEventTypeUnion, 0);
}

@end
