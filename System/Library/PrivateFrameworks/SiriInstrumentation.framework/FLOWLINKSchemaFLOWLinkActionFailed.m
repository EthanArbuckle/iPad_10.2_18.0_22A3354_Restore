@implementation FLOWLINKSchemaFLOWLinkActionFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReason
{
  -[FLOWLINKSchemaFLOWLinkActionFailed setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLinkActionFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int reason;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (reason = self->_reason, reason == objc_msgSend(v4, "reason")))
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
    return 2654435761 * self->_reason;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[FLOWLINKSchemaFLOWLinkActionFailed reason](self, "reason");
    v5 = CFSTR("FLOWLINKEXECUTIONERROR_UNKNOWN");
    if (v4 <= 1999)
    {
      v6 = CFSTR("FLOWLINKEXECUTIONERROR_DIALOG_GENERATION_ERROR");
      v7 = CFSTR("FLOWLINKEXECUTIONERROR_TARGET_BUNDLE_ERROR");
      if (v4 != 3)
        v7 = CFSTR("FLOWLINKEXECUTIONERROR_UNKNOWN");
      if (v4 != 2)
        v6 = v7;
      if (v4 == 1)
        v5 = CFSTR("FLOWLINKEXECUTIONERROR_LINK_PLUGIN_ERROR");
      else
        v5 = v6;
    }
    else
    {
      switch(v4)
      {
        case 2000:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_UNKNOWN");
          break;
        case 2001:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_MALFORMED_ACTION");
          break;
        case 2002:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_ACTION_NOT_FOUND");
          break;
        case 2003:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_UNDEFINED_PARAMETER");
          break;
        case 2004:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_UNSUPPORTED_VALUE_TYPE");
          break;
        case 2005:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_NON_OPTIONAL_PARAMETER_IS_NIL");
          break;
        case 2006:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_NO_CONTEXT");
          break;
        case 2007:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_USER_CANCELLED");
          break;
        case 2008:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_UNRESOLVED_PARAMETER");
          break;
        case 2009:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_CUSTOM_DIALOG");
          break;
        case 2010:
          v5 = CFSTR("FLOWLINKEXECUTIONERROR_LNPERFORMACTIONERRORCODE_CLIENT_CANCELLED");
          break;
        default:
          break;
      }
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("reason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWLINKSchemaFLOWLinkActionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWLINKSchemaFLOWLinkActionFailed)initWithJSON:(id)a3
{
  void *v4;
  FLOWLINKSchemaFLOWLinkActionFailed *v5;
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
    self = -[FLOWLINKSchemaFLOWLinkActionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWLINKSchemaFLOWLinkActionFailed)initWithDictionary:(id)a3
{
  id v4;
  FLOWLINKSchemaFLOWLinkActionFailed *v5;
  void *v6;
  FLOWLINKSchemaFLOWLinkActionFailed *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLOWLINKSchemaFLOWLinkActionFailed;
  v5 = -[FLOWLINKSchemaFLOWLinkActionFailed init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWLINKSchemaFLOWLinkActionFailed setReason:](v5, "setReason:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)reason
{
  return self->_reason;
}

@end
