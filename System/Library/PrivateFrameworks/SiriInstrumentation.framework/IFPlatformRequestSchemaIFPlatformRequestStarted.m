@implementation IFPlatformRequestSchemaIFPlatformRequestStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIfPlatformRequestTarget:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ifPlatformRequestTarget = a3;
}

- (BOOL)hasIfPlatformRequestTarget
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIfPlatformRequestTarget:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIfPlatformRequestTarget
{
  -[IFPlatformRequestSchemaIFPlatformRequestStarted setIfPlatformRequestTarget:](self, "setIfPlatformRequestTarget:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformRequestSchemaIFPlatformRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int ifPlatformRequestTarget;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (ifPlatformRequestTarget = self->_ifPlatformRequestTarget,
            ifPlatformRequestTarget == objc_msgSend(v4, "ifPlatformRequestTarget")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_ifPlatformRequestTarget;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[IFPlatformRequestSchemaIFPlatformRequestStarted ifPlatformRequestTarget](self, "ifPlatformRequestTarget");
    v5 = CFSTR("IFPLATFORMREQUESTTARGET_UNKNOWN");
    v6 = CFSTR("IFPLATFORMREQUESTTARGET_RESPONSE_GENERATION_SERVICE_HANDLE");
    v7 = CFSTR("IFPLATFORMTARGET_SESSION_COORDINATOR_ACCEPT");
    if (v4 != 601)
      v7 = CFSTR("IFPLATFORMREQUESTTARGET_UNKNOWN");
    if (v4 != 501)
      v6 = v7;
    v8 = CFSTR("IFPLATFORMREQUESTTARGET_FULL_PLANNER_SERVICE_HANDLE");
    v9 = CFSTR("IFPLATFORMREQUESTTARGET_PLAN_RESOLVER_SERVICE_HANDLE");
    if (v4 != 401)
      v9 = CFSTR("IFPLATFORMREQUESTTARGET_UNKNOWN");
    if (v4 != 301)
      v8 = v9;
    if (v4 <= 500)
      v6 = v8;
    v10 = CFSTR("IFPLATFORMREQUESTTARGET_QUERY_DECORATION_SERVICE_HANDLE");
    v11 = CFSTR("IFPLATFORMREQUESTTARGET_PLAN_OVERRIDES_SERVICE_HANDLE");
    if (v4 != 201)
      v11 = CFSTR("IFPLATFORMREQUESTTARGET_UNKNOWN");
    if (v4 != 101)
      v10 = v11;
    if (v4 == 2)
      v5 = CFSTR("IFPLATFORMREQUESTTARGET_STANDARD_PLANNER_RUN");
    if (v4 == 1)
      v5 = CFSTR("IFPLATFORMREQUESTTARGET_STANDARD_PLANNER_MAKE_PLAN");
    if (v4 > 100)
      v5 = v10;
    if (v4 <= 300)
      v12 = v5;
    else
      v12 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ifPlatformRequestTarget"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFPlatformRequestSchemaIFPlatformRequestStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFPlatformRequestSchemaIFPlatformRequestStarted)initWithJSON:(id)a3
{
  void *v4;
  IFPlatformRequestSchemaIFPlatformRequestStarted *v5;
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
    self = -[IFPlatformRequestSchemaIFPlatformRequestStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFPlatformRequestSchemaIFPlatformRequestStarted)initWithDictionary:(id)a3
{
  id v4;
  IFPlatformRequestSchemaIFPlatformRequestStarted *v5;
  void *v6;
  IFPlatformRequestSchemaIFPlatformRequestStarted *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestStarted;
  v5 = -[IFPlatformRequestSchemaIFPlatformRequestStarted init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifPlatformRequestTarget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFPlatformRequestSchemaIFPlatformRequestStarted setIfPlatformRequestTarget:](v5, "setIfPlatformRequestTarget:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)ifPlatformRequestTarget
{
  return self->_ifPlatformRequestTarget;
}

@end
