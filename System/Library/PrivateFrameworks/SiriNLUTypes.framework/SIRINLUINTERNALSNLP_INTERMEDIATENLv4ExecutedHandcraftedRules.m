@implementation SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules

- (BOOL)hasRules
{
  return self->_rules != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules;
  -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *rules;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  rules = self->_rules;
  if (rules)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules dictionaryRepresentation](rules, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rules"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRulesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_rules)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *rules;

  rules = self->_rules;
  if (rules)
    objc_msgSend(a3, "setRules:", rules);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules copyWithZone:](self->_rules, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *rules;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    rules = self->_rules;
    if ((unint64_t)rules | v4[1])
      v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules isEqual:](rules, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules hash](self->_rules, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *rules;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  rules = self->_rules;
  v6 = v4[1];
  if (rules)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules mergeFrom:](rules, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules setRules:](self, "setRules:");
    goto LABEL_6;
  }

}

- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
