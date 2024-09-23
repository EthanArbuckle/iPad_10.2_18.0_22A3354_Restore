@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance

- (BOOL)hasUtteranceId
{
  return self->_utteranceId != 0;
}

- (BOOL)hasRewriteUtterance
{
  return self->_rewriteUtterance != 0;
}

- (int)routingDecision
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_routingDecision;
  else
    return 0;
}

- (void)setRoutingDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_routingDecision = a3;
}

- (void)setHasRoutingDecision:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRoutingDecision
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)routingDecisionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7BB1030[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRoutingDecision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_ROUTING_DECISION_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_ROUTING_DECISION_SIRI_X")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_ROUTING_DECISION_PLANNER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_ROUTING_DECISION_GEN_AI")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance;
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *utteranceId;
  void *v5;
  NSString *rewriteUtterance;
  uint64_t routingDecision;
  __CFString *v8;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  utteranceId = self->_utteranceId;
  if (utteranceId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](utteranceId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("utterance_id"));

  }
  rewriteUtterance = self->_rewriteUtterance;
  if (rewriteUtterance)
    objc_msgSend(v3, "setObject:forKey:", rewriteUtterance, CFSTR("rewrite_utterance"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    routingDecision = self->_routingDecision;
    if (routingDecision >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_routingDecision);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7BB1030[routingDecision];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("routing_decision"));

  }
  correctionOutcome = self->_correctionOutcome;
  if (correctionOutcome)
  {
    -[SIRINLUEXTERNALCorrectionOutcome dictionaryRepresentation](correctionOutcome, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("correction_outcome"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtteranceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_utteranceId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rewriteUtterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_correctionOutcome)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_utteranceId)
  {
    objc_msgSend(v4, "setUtteranceId:");
    v4 = v5;
  }
  if (self->_rewriteUtterance)
  {
    objc_msgSend(v5, "setRewriteUtterance:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_routingDecision;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_correctionOutcome)
  {
    objc_msgSend(v5, "setCorrectionOutcome:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_utteranceId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_rewriteUtterance, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_routingDecision;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v10 = -[SIRINLUEXTERNALCorrectionOutcome copyWithZone:](self->_correctionOutcome, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *utteranceId;
  NSString *rewriteUtterance;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  utteranceId = self->_utteranceId;
  if ((unint64_t)utteranceId | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](utteranceId, "isEqual:"))
      goto LABEL_13;
  }
  rewriteUtterance = self->_rewriteUtterance;
  if ((unint64_t)rewriteUtterance | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](rewriteUtterance, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_routingDecision != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  correctionOutcome = self->_correctionOutcome;
  if ((unint64_t)correctionOutcome | *((_QWORD *)v4 + 1))
    v8 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcome, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_utteranceId, "hash");
  v4 = -[NSString hash](self->_rewriteUtterance, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_routingDecision;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[SIRINLUEXTERNALCorrectionOutcome hash](self->_correctionOutcome, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *utteranceId;
  uint64_t v6;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  uint64_t v8;
  id v9;

  v4 = a3;
  utteranceId = self->_utteranceId;
  v6 = *((_QWORD *)v4 + 4);
  v9 = v4;
  if (utteranceId)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALUUID mergeFrom:](utteranceId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance setUtteranceId:](self, "setUtteranceId:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 2))
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance setRewriteUtterance:](self, "setRewriteUtterance:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_routingDecision = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  correctionOutcome = self->_correctionOutcome;
  v8 = *((_QWORD *)v4 + 1);
  if (correctionOutcome)
  {
    if (v8)
    {
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcome, "mergeFrom:");
LABEL_16:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance setCorrectionOutcome:](self, "setCorrectionOutcome:");
    goto LABEL_16;
  }

}

- (SIRINLUEXTERNALUUID)utteranceId
{
  return self->_utteranceId;
}

- (void)setUtteranceId:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceId, a3);
}

- (NSString)rewriteUtterance
{
  return self->_rewriteUtterance;
}

- (void)setRewriteUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_rewriteUtterance, a3);
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setCorrectionOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_correctionOutcome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceId, 0);
  objc_storeStrong((id *)&self->_rewriteUtterance, 0);
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
}

@end
