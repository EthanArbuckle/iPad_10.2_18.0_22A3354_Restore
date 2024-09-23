@implementation ATXPBRequestForContextualActionSuggestions

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (BOOL)hasOriginatorId
{
  return self->_originatorId != 0;
}

- (BOOL)hasConsumerSubTypeString
{
  return self->_consumerSubTypeString != 0;
}

- (BOOL)hasCaxPredictionContext
{
  return self->_caxPredictionContext != 0;
}

- (void)setMaxSuggestions:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxSuggestions = a3;
}

- (void)setHasMaxSuggestions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxSuggestions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimeout:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeout = a3;
}

- (void)setHasTimeout:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
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
  v8.super_class = (Class)ATXPBRequestForContextualActionSuggestions;
  -[ATXPBRequestForContextualActionSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBRequestForContextualActionSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  NSString *originatorId;
  NSString *consumerSubTypeString;
  NSData *caxPredictionContext;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  originatorId = self->_originatorId;
  if (originatorId)
    objc_msgSend(v4, "setObject:forKey:", originatorId, CFSTR("originatorId"));
  consumerSubTypeString = self->_consumerSubTypeString;
  if (consumerSubTypeString)
    objc_msgSend(v4, "setObject:forKey:", consumerSubTypeString, CFSTR("consumerSubTypeString"));
  caxPredictionContext = self->_caxPredictionContext;
  if (caxPredictionContext)
    objc_msgSend(v4, "setObject:forKey:", caxPredictionContext, CFSTR("caxPredictionContext"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxSuggestions);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("maxSuggestions"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeout);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timeout"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForContextualActionSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_originatorId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_consumerSubTypeString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_caxPredictionContext)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuidString)
  {
    objc_msgSend(v4, "setUuidString:");
    v4 = v6;
  }
  if (self->_originatorId)
  {
    objc_msgSend(v6, "setOriginatorId:");
    v4 = v6;
  }
  if (self->_consumerSubTypeString)
  {
    objc_msgSend(v6, "setConsumerSubTypeString:");
    v4 = v6;
  }
  if (self->_caxPredictionContext)
  {
    objc_msgSend(v6, "setCaxPredictionContext:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_maxSuggestions;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timeout;
    *((_BYTE *)v4 + 56) |= 1u;
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
  uint64_t v12;
  void *v13;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_originatorId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_consumerSubTypeString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSData copyWithZone:](self->_caxPredictionContext, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_maxSuggestions;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timeout;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidString;
  NSString *originatorId;
  NSString *consumerSubTypeString;
  NSData *caxPredictionContext;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_19;
  }
  originatorId = self->_originatorId;
  if ((unint64_t)originatorId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](originatorId, "isEqual:"))
      goto LABEL_19;
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:"))
      goto LABEL_19;
  }
  caxPredictionContext = self->_caxPredictionContext;
  if ((unint64_t)caxPredictionContext | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](caxPredictionContext, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_maxSuggestions != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timeout != *((double *)v4 + 1))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  double timeout;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSString hash](self->_originatorId, "hash");
  v5 = -[NSString hash](self->_consumerSubTypeString, "hash");
  v6 = -[NSData hash](self->_caxPredictionContext, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_maxSuggestions;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  timeout = self->_timeout;
  v9 = -timeout;
  if (timeout >= 0.0)
    v9 = self->_timeout;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[ATXPBRequestForContextualActionSuggestions setUuidString:](self, "setUuidString:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXPBRequestForContextualActionSuggestions setOriginatorId:](self, "setOriginatorId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXPBRequestForContextualActionSuggestions setConsumerSubTypeString:](self, "setConsumerSubTypeString:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXPBRequestForContextualActionSuggestions setCaxPredictionContext:](self, "setCaxPredictionContext:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_maxSuggestions = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_timeout = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (NSString)originatorId
{
  return self->_originatorId;
}

- (void)setOriginatorId:(id)a3
{
  objc_storeStrong((id *)&self->_originatorId, a3);
}

- (NSString)consumerSubTypeString
{
  return self->_consumerSubTypeString;
}

- (void)setConsumerSubTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubTypeString, a3);
}

- (NSData)caxPredictionContext
{
  return self->_caxPredictionContext;
}

- (void)setCaxPredictionContext:(id)a3
{
  objc_storeStrong((id *)&self->_caxPredictionContext, a3);
}

- (int)maxSuggestions
{
  return self->_maxSuggestions;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
  objc_storeStrong((id *)&self->_caxPredictionContext, 0);
}

@end
