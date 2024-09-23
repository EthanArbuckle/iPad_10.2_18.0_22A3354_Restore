@implementation ORCHSchemaORCHNLRouterBridgeFailed

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
  v9.super_class = (Class)ORCHSchemaORCHNLRouterBridgeFailed;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ORCHSchemaORCHNLRouterBridgeFailed deleteRoutingDecision](self, "deleteRoutingDecision");
  return v5;
}

- (void)setErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorDomain = a3;
}

- (BOOL)hasErrorDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorDomain
{
  -[ORCHSchemaORCHNLRouterBridgeFailed setErrorDomain:](self, "setErrorDomain:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteErrorCode
{
  -[ORCHSchemaORCHNLRouterBridgeFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasRoutingDecision
{
  return self->_routingDecision != 0;
}

- (void)deleteRoutingDecision
{
  -[ORCHSchemaORCHNLRouterBridgeFailed setRoutingDecision:](self, "setRoutingDecision:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHNLRouterBridgeFailedReadFrom(self, (uint64_t)a3);
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
  -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $EEF5D83BDC1038D82D17C816D898FA8B has;
  unsigned int v6;
  int errorDomain;
  int v8;
  int errorCode;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    errorDomain = self->_errorDomain;
    if (errorDomain != objc_msgSend(v4, "errorDomain"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (errorCode = self->_errorCode, errorCode == objc_msgSend(v4, "errorCode")))
    {
      -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "routingDecision");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "routingDecision");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_errorDomain;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[ORCHSchemaORCHNLRouterBridgeRoutingDecision hash](self->_routingDecision, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ -[ORCHSchemaORCHNLRouterBridgeRoutingDecision hash](self->_routingDecision, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ORCHSchemaORCHNLRouterBridgeFailed errorCode](self, "errorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if (-[ORCHSchemaORCHNLRouterBridgeFailed errorDomain](self, "errorDomain") == 1)
      v6 = CFSTR("ORCHNLROUTEBRIDGERERRORDOMAIN_NL_ROUTER_CLIENT");
    else
      v6 = CFSTR("ORCHNLROUTERBRIDGEERRORDOMAIN_UNKNOWN");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));
  }
  if (self->_routingDecision)
  {
    -[ORCHSchemaORCHNLRouterBridgeFailed routingDecision](self, "routingDecision");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("routingDecision"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("routingDecision"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHNLRouterBridgeFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHNLRouterBridgeFailed)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHNLRouterBridgeFailed *v5;
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
    self = -[ORCHSchemaORCHNLRouterBridgeFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHNLRouterBridgeFailed)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHNLRouterBridgeFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHNLRouterBridgeRoutingDecision *v9;
  ORCHSchemaORCHNLRouterBridgeFailed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHNLRouterBridgeFailed;
  v5 = -[ORCHSchemaORCHNLRouterBridgeFailed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHNLRouterBridgeFailed setErrorDomain:](v5, "setErrorDomain:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHNLRouterBridgeFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routingDecision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHNLRouterBridgeRoutingDecision initWithDictionary:]([ORCHSchemaORCHNLRouterBridgeRoutingDecision alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHNLRouterBridgeFailed setRoutingDecision:](v5, "setRoutingDecision:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (ORCHSchemaORCHNLRouterBridgeRoutingDecision)routingDecision
{
  return self->_routingDecision;
}

- (void)setRoutingDecision:(id)a3
{
  objc_storeStrong((id *)&self->_routingDecision, a3);
}

- (void)setHasRoutingDecision:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingDecision, 0);
}

@end
