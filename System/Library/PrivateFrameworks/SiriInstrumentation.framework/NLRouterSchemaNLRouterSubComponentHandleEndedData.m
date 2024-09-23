@implementation NLRouterSchemaNLRouterSubComponentHandleEndedData

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
  v9.super_class = (Class)NLRouterSchemaNLRouterSubComponentHandleEndedData;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NLRouterSchemaNLRouterSubComponentHandleEndedData deleteHeuristicsHandleEndedData](self, "deleteHeuristicsHandleEndedData");
  return v5;
}

- (BOOL)hasHeuristicsHandleEndedData
{
  return self->_heuristicsHandleEndedData != 0;
}

- (void)deleteHeuristicsHandleEndedData
{
  -[NLRouterSchemaNLRouterSubComponentHandleEndedData setHeuristicsHandleEndedData:](self, "setHeuristicsHandleEndedData:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterSubComponentHandleEndedDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heuristicsHandleEndedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "heuristicsHandleEndedData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NLRouterSchemaHeuristicsHandleEndedData hash](self->_heuristicsHandleEndedData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_heuristicsHandleEndedData)
  {
    -[NLRouterSchemaNLRouterSubComponentHandleEndedData heuristicsHandleEndedData](self, "heuristicsHandleEndedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("heuristicsHandleEndedData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("heuristicsHandleEndedData"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLRouterSchemaNLRouterSubComponentHandleEndedData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLRouterSchemaNLRouterSubComponentHandleEndedData)initWithJSON:(id)a3
{
  void *v4;
  NLRouterSchemaNLRouterSubComponentHandleEndedData *v5;
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
    self = -[NLRouterSchemaNLRouterSubComponentHandleEndedData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLRouterSchemaNLRouterSubComponentHandleEndedData)initWithDictionary:(id)a3
{
  id v4;
  NLRouterSchemaNLRouterSubComponentHandleEndedData *v5;
  void *v6;
  NLRouterSchemaHeuristicsHandleEndedData *v7;
  NLRouterSchemaNLRouterSubComponentHandleEndedData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLRouterSchemaNLRouterSubComponentHandleEndedData;
  v5 = -[NLRouterSchemaNLRouterSubComponentHandleEndedData init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heuristicsHandleEndedData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLRouterSchemaHeuristicsHandleEndedData initWithDictionary:]([NLRouterSchemaHeuristicsHandleEndedData alloc], "initWithDictionary:", v6);
      -[NLRouterSchemaNLRouterSubComponentHandleEndedData setHeuristicsHandleEndedData:](v5, "setHeuristicsHandleEndedData:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NLRouterSchemaHeuristicsHandleEndedData)heuristicsHandleEndedData
{
  return self->_heuristicsHandleEndedData;
}

- (void)setHeuristicsHandleEndedData:(id)a3
{
  objc_storeStrong((id *)&self->_heuristicsHandleEndedData, a3);
}

- (void)setHasHeuristicsHandleEndedData:(BOOL)a3
{
  self->_hasHeuristicsHandleEndedData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristicsHandleEndedData, 0);
}

@end
