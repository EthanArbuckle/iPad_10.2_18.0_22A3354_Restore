@implementation ATXPBRequestForSuggestions

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
  v8.super_class = (Class)ATXPBRequestForSuggestions;
  -[ATXPBRequestForSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBRequestForSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v8;

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeout);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timeout"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_originatorId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_consumerSubTypeString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidString)
  {
    objc_msgSend(v4, "setUuidString:");
    v4 = v5;
  }
  if (self->_originatorId)
  {
    objc_msgSend(v5, "setOriginatorId:");
    v4 = v5;
  }
  if (self->_consumerSubTypeString)
  {
    objc_msgSend(v5, "setConsumerSubTypeString:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timeout;
    *((_BYTE *)v4 + 40) |= 1u;
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
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_originatorId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_consumerSubTypeString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timeout;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidString;
  NSString *originatorId;
  NSString *consumerSubTypeString;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_12;
  }
  originatorId = self->_originatorId;
  if ((unint64_t)originatorId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](originatorId, "isEqual:"))
      goto LABEL_12;
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_timeout == *((double *)v4 + 1))
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
  unint64_t v6;
  double timeout;
  double v8;
  long double v9;
  double v10;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSString hash](self->_originatorId, "hash");
  v5 = -[NSString hash](self->_consumerSubTypeString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timeout = self->_timeout;
    v8 = -timeout;
    if (timeout >= 0.0)
      v8 = self->_timeout;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXPBRequestForSuggestions setUuidString:](self, "setUuidString:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXPBRequestForSuggestions setOriginatorId:](self, "setOriginatorId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXPBRequestForSuggestions setConsumerSubTypeString:](self, "setConsumerSubTypeString:");
    v4 = v5;
  }
  if (((_BYTE)v4[5] & 1) != 0)
  {
    self->_timeout = v4[1];
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

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
}

@end
