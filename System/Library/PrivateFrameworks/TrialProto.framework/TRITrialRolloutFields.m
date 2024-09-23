@implementation TRITrialRolloutFields

- (BOOL)hasClientRolloutId
{
  return self->_clientRolloutId != 0;
}

- (BOOL)hasClientFactorPackSetId
{
  return self->_clientFactorPackSetId != 0;
}

- (BOOL)hasClientRampId
{
  return self->_clientRampId != 0;
}

- (void)setClientTargetingRuleGroupOrdinal:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientTargetingRuleGroupOrdinal = a3;
}

- (void)setHasClientTargetingRuleGroupOrdinal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientTargetingRuleGroupOrdinal
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
  v8.super_class = (Class)TRITrialRolloutFields;
  -[TRITrialRolloutFields description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITrialRolloutFields dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientRolloutId;
  NSString *clientFactorPackSetId;
  NSString *clientRampId;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientRolloutId = self->_clientRolloutId;
  if (clientRolloutId)
    objc_msgSend(v3, "setObject:forKey:", clientRolloutId, CFSTR("client_rollout_id"));
  clientFactorPackSetId = self->_clientFactorPackSetId;
  if (clientFactorPackSetId)
    objc_msgSend(v4, "setObject:forKey:", clientFactorPackSetId, CFSTR("client_factor_pack_set_id"));
  clientRampId = self->_clientRampId;
  if (clientRampId)
    objc_msgSend(v4, "setObject:forKey:", clientRampId, CFSTR("client_ramp_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_clientTargetingRuleGroupOrdinal);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("client_targeting_rule_group_ordinal"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialRolloutFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientRolloutId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientFactorPackSetId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientRampId)
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
  if (self->_clientRolloutId)
  {
    objc_msgSend(v4, "setClientRolloutId:");
    v4 = v5;
  }
  if (self->_clientFactorPackSetId)
  {
    objc_msgSend(v5, "setClientFactorPackSetId:");
    v4 = v5;
  }
  if (self->_clientRampId)
  {
    objc_msgSend(v5, "setClientRampId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_clientTargetingRuleGroupOrdinal;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientRolloutId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_clientFactorPackSetId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_clientRampId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_clientTargetingRuleGroupOrdinal;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientRolloutId;
  NSString *clientFactorPackSetId;
  NSString *clientRampId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  clientRolloutId = self->_clientRolloutId;
  if ((unint64_t)clientRolloutId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientRolloutId, "isEqual:"))
      goto LABEL_12;
  }
  clientFactorPackSetId = self->_clientFactorPackSetId;
  if ((unint64_t)clientFactorPackSetId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientFactorPackSetId, "isEqual:"))
      goto LABEL_12;
  }
  clientRampId = self->_clientRampId;
  if ((unint64_t)clientRampId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientRampId, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_clientTargetingRuleGroupOrdinal == *((_DWORD *)v4 + 8))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_clientRolloutId, "hash");
  v4 = -[NSString hash](self->_clientFactorPackSetId, "hash");
  v5 = -[NSString hash](self->_clientRampId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_clientTargetingRuleGroupOrdinal;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[TRITrialRolloutFields setClientRolloutId:](self, "setClientRolloutId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[TRITrialRolloutFields setClientFactorPackSetId:](self, "setClientFactorPackSetId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[TRITrialRolloutFields setClientRampId:](self, "setClientRampId:");
    v4 = v5;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_clientTargetingRuleGroupOrdinal = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)clientRolloutId
{
  return self->_clientRolloutId;
}

- (void)setClientRolloutId:(id)a3
{
  objc_storeStrong((id *)&self->_clientRolloutId, a3);
}

- (NSString)clientFactorPackSetId
{
  return self->_clientFactorPackSetId;
}

- (void)setClientFactorPackSetId:(id)a3
{
  objc_storeStrong((id *)&self->_clientFactorPackSetId, a3);
}

- (NSString)clientRampId
{
  return self->_clientRampId;
}

- (void)setClientRampId:(id)a3
{
  objc_storeStrong((id *)&self->_clientRampId, a3);
}

- (int)clientTargetingRuleGroupOrdinal
{
  return self->_clientTargetingRuleGroupOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRolloutId, 0);
  objc_storeStrong((id *)&self->_clientRampId, 0);
  objc_storeStrong((id *)&self->_clientFactorPackSetId, 0);
}

@end
