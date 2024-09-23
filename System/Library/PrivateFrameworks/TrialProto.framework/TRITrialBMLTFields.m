@implementation TRITrialBMLTFields

- (BOOL)hasClientBmltId
{
  return self->_clientBmltId != 0;
}

- (BOOL)hasClientBmltFactorPackSetId
{
  return self->_clientBmltFactorPackSetId != 0;
}

- (void)setClientBmltTargetingRuleGroupOrdinal:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientBmltTargetingRuleGroupOrdinal = a3;
}

- (void)setHasClientBmltTargetingRuleGroupOrdinal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientBmltTargetingRuleGroupOrdinal
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)TRITrialBMLTFields;
  -[TRITrialBMLTFields description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITrialBMLTFields dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientBmltId;
  NSString *clientBmltFactorPackSetId;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientBmltId = self->_clientBmltId;
  if (clientBmltId)
    objc_msgSend(v3, "setObject:forKey:", clientBmltId, CFSTR("client_bmlt_id"));
  clientBmltFactorPackSetId = self->_clientBmltFactorPackSetId;
  if (clientBmltFactorPackSetId)
    objc_msgSend(v4, "setObject:forKey:", clientBmltFactorPackSetId, CFSTR("client_bmlt_factor_pack_set_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_clientBmltTargetingRuleGroupOrdinal);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("client_bmlt_targeting_rule_group_ordinal"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialBMLTFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientBmltId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientBmltFactorPackSetId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientBmltId)
  {
    objc_msgSend(v4, "setClientBmltId:");
    v4 = v5;
  }
  if (self->_clientBmltFactorPackSetId)
  {
    objc_msgSend(v5, "setClientBmltFactorPackSetId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_clientBmltTargetingRuleGroupOrdinal;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientBmltId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_clientBmltFactorPackSetId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_clientBmltTargetingRuleGroupOrdinal;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientBmltId;
  NSString *clientBmltFactorPackSetId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  clientBmltId = self->_clientBmltId;
  if ((unint64_t)clientBmltId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientBmltId, "isEqual:"))
      goto LABEL_10;
  }
  clientBmltFactorPackSetId = self->_clientBmltFactorPackSetId;
  if ((unint64_t)clientBmltFactorPackSetId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientBmltFactorPackSetId, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_clientBmltTargetingRuleGroupOrdinal == *((_DWORD *)v4 + 6))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_clientBmltId, "hash");
  v4 = -[NSString hash](self->_clientBmltFactorPackSetId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_clientBmltTargetingRuleGroupOrdinal;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[TRITrialBMLTFields setClientBmltId:](self, "setClientBmltId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[TRITrialBMLTFields setClientBmltFactorPackSetId:](self, "setClientBmltFactorPackSetId:");
    v4 = v5;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_clientBmltTargetingRuleGroupOrdinal = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)clientBmltId
{
  return self->_clientBmltId;
}

- (void)setClientBmltId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBmltId, a3);
}

- (NSString)clientBmltFactorPackSetId
{
  return self->_clientBmltFactorPackSetId;
}

- (void)setClientBmltFactorPackSetId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBmltFactorPackSetId, a3);
}

- (int)clientBmltTargetingRuleGroupOrdinal
{
  return self->_clientBmltTargetingRuleGroupOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBmltId, 0);
  objc_storeStrong((id *)&self->_clientBmltFactorPackSetId, 0);
}

@end
