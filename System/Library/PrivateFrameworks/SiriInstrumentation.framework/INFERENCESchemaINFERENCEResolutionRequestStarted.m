@implementation INFERENCESchemaINFERENCEResolutionRequestStarted

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
  v9.super_class = (Class)INFERENCESchemaINFERENCEResolutionRequestStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCEResolutionRequestStarted deleteResolverConfig](self, "deleteResolverConfig");
  return v5;
}

- (void)setSlotType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_slotType = a3;
}

- (BOOL)hasSlotType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSlotType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSlotType
{
  -[INFERENCESchemaINFERENCEResolutionRequestStarted setSlotType:](self, "setSlotType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasResolverConfig
{
  return self->_resolverConfig != 0;
}

- (void)deleteResolverConfig
{
  -[INFERENCESchemaINFERENCEResolutionRequestStarted setResolverConfig:](self, "setResolverConfig:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEResolutionRequestStartedReadFrom(self, (uint64_t)a3);
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
  -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int slotType;
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
        || (slotType = self->_slotType, slotType == objc_msgSend(v4, "slotType")))
      {
        -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "resolverConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "resolverConfig");
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
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_slotType;
  else
    v2 = 0;
  return -[INFERENCESchemaINFERENCEResolverConfig hash](self->_resolverConfig, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resolverConfig)
  {
    -[INFERENCESchemaINFERENCEResolutionRequestStarted resolverConfig](self, "resolverConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resolverConfig"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("resolverConfig"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[INFERENCESchemaINFERENCEResolutionRequestStarted slotType](self, "slotType") - 1;
    if (v7 > 3)
      v8 = CFSTR("INFERENCESLOTTYPE_UNKNOWN");
    else
      v8 = off_1E562FD58[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("slotType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEResolutionRequestStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEResolutionRequestStarted)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEResolutionRequestStarted *v5;
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
    self = -[INFERENCESchemaINFERENCEResolutionRequestStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEResolutionRequestStarted)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEResolutionRequestStarted *v5;
  void *v6;
  void *v7;
  INFERENCESchemaINFERENCEResolverConfig *v8;
  INFERENCESchemaINFERENCEResolutionRequestStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INFERENCESchemaINFERENCEResolutionRequestStarted;
  v5 = -[INFERENCESchemaINFERENCEResolutionRequestStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slotType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEResolutionRequestStarted setSlotType:](v5, "setSlotType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[INFERENCESchemaINFERENCEResolverConfig initWithDictionary:]([INFERENCESchemaINFERENCEResolverConfig alloc], "initWithDictionary:", v7);
      -[INFERENCESchemaINFERENCEResolutionRequestStarted setResolverConfig:](v5, "setResolverConfig:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)slotType
{
  return self->_slotType;
}

- (INFERENCESchemaINFERENCEResolverConfig)resolverConfig
{
  return self->_resolverConfig;
}

- (void)setResolverConfig:(id)a3
{
  objc_storeStrong((id *)&self->_resolverConfig, a3);
}

- (void)setHasResolverConfig:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolverConfig, 0);
}

@end
