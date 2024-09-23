@implementation ATXPBSpotlightUIEvent

- (BOOL)hasSuggestionUniqueId
{
  return self->_suggestionUniqueId != 0;
}

- (BOOL)hasSuggestionType
{
  return self->_suggestionType != 0;
}

- (BOOL)hasSuggestionSubtype
{
  return self->_suggestionSubtype != 0;
}

- (BOOL)hasSuggestionContext
{
  return self->_suggestionContext != 0;
}

- (void)setEventType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
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
  v8.super_class = (Class)ATXPBSpotlightUIEvent;
  -[ATXPBSpotlightUIEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightUIEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *suggestionUniqueId;
  NSString *suggestionType;
  NSString *suggestionSubtype;
  NSString *suggestionContext;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  suggestionUniqueId = self->_suggestionUniqueId;
  if (suggestionUniqueId)
    objc_msgSend(v3, "setObject:forKey:", suggestionUniqueId, CFSTR("suggestionUniqueId"));
  suggestionType = self->_suggestionType;
  if (suggestionType)
    objc_msgSend(v4, "setObject:forKey:", suggestionType, CFSTR("suggestionType"));
  suggestionSubtype = self->_suggestionSubtype;
  if (suggestionSubtype)
    objc_msgSend(v4, "setObject:forKey:", suggestionSubtype, CFSTR("suggestionSubtype"));
  suggestionContext = self->_suggestionContext;
  if (suggestionContext)
    objc_msgSend(v4, "setObject:forKey:", suggestionContext, CFSTR("suggestionContext"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_eventType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("eventType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_suggestionUniqueId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_suggestionType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_suggestionSubtype)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_suggestionContext)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_suggestionUniqueId)
  {
    objc_msgSend(v4, "setSuggestionUniqueId:");
    v4 = v5;
  }
  if (self->_suggestionType)
  {
    objc_msgSend(v5, "setSuggestionType:");
    v4 = v5;
  }
  if (self->_suggestionSubtype)
  {
    objc_msgSend(v5, "setSuggestionSubtype:");
    v4 = v5;
  }
  if (self->_suggestionContext)
  {
    objc_msgSend(v5, "setSuggestionContext:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_eventType;
    *((_BYTE *)v4 + 48) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_suggestionUniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_suggestionType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_suggestionSubtype, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_suggestionContext, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_eventType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *suggestionUniqueId;
  NSString *suggestionType;
  NSString *suggestionSubtype;
  NSString *suggestionContext;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  suggestionUniqueId = self->_suggestionUniqueId;
  if ((unint64_t)suggestionUniqueId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](suggestionUniqueId, "isEqual:"))
      goto LABEL_14;
  }
  suggestionType = self->_suggestionType;
  if ((unint64_t)suggestionType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](suggestionType, "isEqual:"))
      goto LABEL_14;
  }
  suggestionSubtype = self->_suggestionSubtype;
  if ((unint64_t)suggestionSubtype | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestionSubtype, "isEqual:"))
      goto LABEL_14;
  }
  suggestionContext = self->_suggestionContext;
  if ((unint64_t)suggestionContext | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](suggestionContext, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_eventType == *((_QWORD *)v4 + 1))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_suggestionUniqueId, "hash");
  v4 = -[NSString hash](self->_suggestionType, "hash");
  v5 = -[NSString hash](self->_suggestionSubtype, "hash");
  v6 = -[NSString hash](self->_suggestionContext, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_eventType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[5])
  {
    -[ATXPBSpotlightUIEvent setSuggestionUniqueId:](self, "setSuggestionUniqueId:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[ATXPBSpotlightUIEvent setSuggestionType:](self, "setSuggestionType:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[ATXPBSpotlightUIEvent setSuggestionSubtype:](self, "setSuggestionSubtype:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ATXPBSpotlightUIEvent setSuggestionContext:](self, "setSuggestionContext:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_eventType = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)suggestionUniqueId
{
  return self->_suggestionUniqueId;
}

- (void)setSuggestionUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionUniqueId, a3);
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionType, a3);
}

- (NSString)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (void)setSuggestionSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionSubtype, a3);
}

- (NSString)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setSuggestionContext:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionContext, a3);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUniqueId, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_suggestionSubtype, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
}

@end
