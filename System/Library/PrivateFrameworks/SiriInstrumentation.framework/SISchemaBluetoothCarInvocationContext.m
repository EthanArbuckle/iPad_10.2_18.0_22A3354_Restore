@implementation SISchemaBluetoothCarInvocationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRoute:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_route = a3;
}

- (BOOL)hasRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRoute
{
  -[SISchemaBluetoothCarInvocationContext setRoute:](self, "setRoute:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaBluetoothCarInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int route;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0 || (route = self->_route, route == objc_msgSend(v4, "route")))
        v6 = 1;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_route;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SISchemaBluetoothCarInvocationContext route](self, "route");
    v5 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_HFP");
    if (v4 == 1)
      v5 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_A2DP");
    if (v4 == 2)
      v6 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_DEVICE_SPEAKER");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("route"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaBluetoothCarInvocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaBluetoothCarInvocationContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaBluetoothCarInvocationContext *v5;
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
    self = -[SISchemaBluetoothCarInvocationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaBluetoothCarInvocationContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaBluetoothCarInvocationContext *v5;
  void *v6;
  SISchemaBluetoothCarInvocationContext *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaBluetoothCarInvocationContext;
  v5 = -[SISchemaBluetoothCarInvocationContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaBluetoothCarInvocationContext setRoute:](v5, "setRoute:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)route
{
  return self->_route;
}

@end
