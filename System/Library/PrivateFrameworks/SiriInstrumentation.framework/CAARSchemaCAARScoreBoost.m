@implementation CAARSchemaCAARScoreBoost

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
  v9.super_class = (Class)CAARSchemaCAARScoreBoost;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[CAARSchemaCAARScoreBoost deleteActionCandidateId](self, "deleteActionCandidateId");
  return v5;
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

- (void)deleteActionCandidateId
{
  -[CAARSchemaCAARScoreBoost setActionCandidateId:](self, "setActionCandidateId:", 0);
}

- (void)setBoost:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_boost = a3;
}

- (BOOL)hasBoost
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBoost:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBoost
{
  -[CAARSchemaCAARScoreBoost setBoost:](self, "setBoost:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)deleteReason
{
  -[CAARSchemaCAARScoreBoost setReason:](self, "setReason:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARScoreBoostReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[CAARSchemaCAARScoreBoost reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double boost;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidateId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    boost = self->_boost;
    objc_msgSend(v4, "boost");
    if (boost != v13)
      goto LABEL_15;
  }
  -[CAARSchemaCAARScoreBoost reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[CAARSchemaCAARScoreBoost reason](self, "reason");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_18:
      v19 = 1;
      goto LABEL_16;
    }
    v15 = (void *)v14;
    -[CAARSchemaCAARScoreBoost reason](self, "reason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reason");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v19 = 0;
LABEL_16:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double boost;
  double v6;
  long double v7;
  double v8;

  v3 = -[SISchemaUUID hash](self->_actionCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    boost = self->_boost;
    v6 = -boost;
    if (boost >= 0.0)
      v6 = self->_boost;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3 ^ -[NSString hash](self->_reason, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionCandidateId)
  {
    -[CAARSchemaCAARScoreBoost actionCandidateId](self, "actionCandidateId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCandidateId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionCandidateId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CAARSchemaCAARScoreBoost boost](self, "boost");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("boost"));

  }
  if (self->_reason)
  {
    -[CAARSchemaCAARScoreBoost reason](self, "reason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("reason"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARScoreBoost dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARScoreBoost)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARScoreBoost *v5;
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
    self = -[CAARSchemaCAARScoreBoost initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARScoreBoost)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARScoreBoost *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  CAARSchemaCAARScoreBoost *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAARSchemaCAARScoreBoost;
  v5 = -[CAARSchemaCAARScoreBoost init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidateId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CAARSchemaCAARScoreBoost setActionCandidateId:](v5, "setActionCandidateId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[CAARSchemaCAARScoreBoost setBoost:](v5, "setBoost:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[CAARSchemaCAARScoreBoost setReason:](v5, "setReason:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (void)setActionCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_actionCandidateId, a3);
}

- (double)boost
{
  return self->_boost;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

@end
