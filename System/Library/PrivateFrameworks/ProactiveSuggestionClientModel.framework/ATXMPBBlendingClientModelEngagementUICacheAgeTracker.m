@implementation ATXMPBBlendingClientModelEngagementUICacheAgeTracker

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
    return off_1E57CFD58[a3 - 1];
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

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingClientModelEngagementUICacheAgeTracker;
  -[ATXMPBBlendingClientModelEngagementUICacheAgeTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingClientModelEngagementUICacheAgeTracker dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *consumerSubType;
  NSString *abGroup;

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
      v5 = off_1E57CFD58[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("outcomeType"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingClientModelEngagementUICacheAgeTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_abGroup)
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
    v4[6] = self->_outcomeType;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_outcomeType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *consumerSubType;
  NSString *abGroup;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_outcomeType != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_11;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](abGroup, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_outcomeType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_consumerSubType, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_abGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_outcomeType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelEngagementUICacheAgeTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelEngagementUICacheAgeTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }

}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
