@implementation NLRouterSchemaNLRouterHandleEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRoutingDecisionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_routingDecisionType = a3;
}

- (BOOL)hasRoutingDecisionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRoutingDecisionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRoutingDecisionType
{
  -[NLRouterSchemaNLRouterHandleEnded setRoutingDecisionType:](self, "setRoutingDecisionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRoutingDecisionSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_routingDecisionSource = a3;
}

- (BOOL)hasRoutingDecisionSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRoutingDecisionSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRoutingDecisionSource
{
  -[NLRouterSchemaNLRouterHandleEnded setRoutingDecisionSource:](self, "setRoutingDecisionSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setRewrittenUtteranceCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rewrittenUtteranceCount = a3;
}

- (BOOL)hasRewrittenUtteranceCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasRewrittenUtteranceCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteRewrittenUtteranceCount
{
  -[NLRouterSchemaNLRouterHandleEnded setRewrittenUtteranceCount:](self, "setRewrittenUtteranceCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterHandleEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $ACBAFA7921AB266075BCC01DAE056949 has;
  unsigned int v6;
  int routingDecisionType;
  int v8;
  int routingDecisionSource;
  int v10;
  unsigned int rewrittenUtteranceCount;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    routingDecisionType = self->_routingDecisionType;
    if (routingDecisionType != objc_msgSend(v4, "routingDecisionType"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    routingDecisionSource = self->_routingDecisionSource;
    if (routingDecisionSource == objc_msgSend(v4, "routingDecisionSource"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    rewrittenUtteranceCount = self->_rewrittenUtteranceCount;
    if (rewrittenUtteranceCount != objc_msgSend(v4, "rewrittenUtteranceCount"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_routingDecisionType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_routingDecisionSource;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_rewrittenUtteranceCount;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLRouterSchemaNLRouterHandleEnded rewrittenUtteranceCount](self, "rewrittenUtteranceCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rewrittenUtteranceCount"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v6 = -[NLRouterSchemaNLRouterHandleEnded routingDecisionSource](self, "routingDecisionSource") - 1;
  if (v6 > 2)
    v7 = CFSTR("NLROUTERDECISIONSOURCE_UNKNOWN");
  else
    v7 = off_1E563C348[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("routingDecisionSource"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    v8 = -[NLRouterSchemaNLRouterHandleEnded routingDecisionType](self, "routingDecisionType") - 1;
    if (v8 > 4)
      v9 = CFSTR("NLROUTERDECISIONTYPE_UNKNOWN");
    else
      v9 = off_1E563C360[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("routingDecisionType"));
  }
LABEL_14:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLRouterSchemaNLRouterHandleEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLRouterSchemaNLRouterHandleEnded)initWithJSON:(id)a3
{
  void *v4;
  NLRouterSchemaNLRouterHandleEnded *v5;
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
    self = -[NLRouterSchemaNLRouterHandleEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLRouterSchemaNLRouterHandleEnded)initWithDictionary:(id)a3
{
  id v4;
  NLRouterSchemaNLRouterHandleEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  NLRouterSchemaNLRouterHandleEnded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterHandleEnded;
  v5 = -[NLRouterSchemaNLRouterHandleEnded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routingDecisionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLRouterSchemaNLRouterHandleEnded setRoutingDecisionType:](v5, "setRoutingDecisionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routingDecisionSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLRouterSchemaNLRouterHandleEnded setRoutingDecisionSource:](v5, "setRoutingDecisionSource:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rewrittenUtteranceCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLRouterSchemaNLRouterHandleEnded setRewrittenUtteranceCount:](v5, "setRewrittenUtteranceCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (int)routingDecisionType
{
  return self->_routingDecisionType;
}

- (int)routingDecisionSource
{
  return self->_routingDecisionSource;
}

- (unsigned)rewrittenUtteranceCount
{
  return self->_rewrittenUtteranceCount;
}

@end
