@implementation ATXMPBBlendingClientModelEngagementClientCacheAgeTracker

- (int)outcomeType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_outcomeType;
  else
    return 1;
}

- (void)setOutcomeType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_outcomeType = a3;
}

- (void)setHasOutcomeType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutcomeType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)outcomeTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E57CF9B8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOutcomeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Conversion")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rejection")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Abandon")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingClientModelEngagementClientCacheAgeTracker;
  -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *clientModelId;
  NSString *consumerSubType;
  NSString *clientModelABGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_outcomeType - 1;
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_outcomeType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57CF9B8[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("outcomeType"));

  }
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v3, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup)
    objc_msgSend(v3, "setObject:forKey:", clientModelABGroup, CFSTR("clientModelABGroup"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingClientModelEngagementClientCacheAgeTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_outcomeType;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v5 = v4;
  if (self->_clientModelId)
  {
    objc_msgSend(v4, "setClientModelId:");
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v5, "setClientModelABGroup:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_outcomeType;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_clientModelABGroup, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientModelId;
  NSString *consumerSubType;
  NSString *clientModelABGroup;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_outcomeType != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](clientModelId, "isEqual:"))
  {
    goto LABEL_13;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
      goto LABEL_13;
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_outcomeType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_clientModelId, "hash") ^ v3;
  v5 = -[NSString hash](self->_consumerSubType, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_clientModelABGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_outcomeType = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker setClientModelId:](self, "setClientModelId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    v4 = v5;
  }

}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelABGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
}

@end
