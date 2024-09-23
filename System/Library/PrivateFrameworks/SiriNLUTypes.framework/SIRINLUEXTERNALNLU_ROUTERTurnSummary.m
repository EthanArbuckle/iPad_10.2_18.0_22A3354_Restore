@implementation SIRINLUEXTERNALNLU_ROUTERTurnSummary

- (BOOL)hasExecutedQuery
{
  return self->_executedQuery != 0;
}

- (BOOL)hasResponseText
{
  return self->_responseText != 0;
}

- (int)executionSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_executionSource;
  else
    return 0;
}

- (void)setExecutionSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_executionSource = a3;
}

- (void)setHasExecutionSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExecutionSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)executionSourceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7BB1EB0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExecutionSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXECUTION_SOURCE_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXECUTION_SOURCE_SIRI_X")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXECUTION_SOURCE_PLANNER")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERTurnSummary;
  -[SIRINLUEXTERNALNLU_ROUTERTurnSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERTurnSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *executedQuery;
  NSString *responseText;
  uint64_t executionSource;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  executedQuery = self->_executedQuery;
  if (executedQuery)
    objc_msgSend(v3, "setObject:forKey:", executedQuery, CFSTR("executed_query"));
  responseText = self->_responseText;
  if (responseText)
    objc_msgSend(v4, "setObject:forKey:", responseText, CFSTR("response_text"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    executionSource = self->_executionSource;
    if (executionSource >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_executionSource);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7BB1EB0[executionSource];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("execution_source"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERTurnSummaryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_executedQuery)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_responseText)
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
  if (self->_executedQuery)
  {
    objc_msgSend(v4, "setExecutedQuery:");
    v4 = v5;
  }
  if (self->_responseText)
  {
    objc_msgSend(v5, "setResponseText:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_executionSource;
    *((_BYTE *)v4 + 32) |= 1u;
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
  v6 = -[NSString copyWithZone:](self->_executedQuery, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_responseText, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_executionSource;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *executedQuery;
  NSString *responseText;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  executedQuery = self->_executedQuery;
  if ((unint64_t)executedQuery | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](executedQuery, "isEqual:"))
      goto LABEL_10;
  }
  responseText = self->_responseText;
  if ((unint64_t)responseText | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](responseText, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_executionSource == *((_DWORD *)v4 + 4))
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

  v3 = -[NSString hash](self->_executedQuery, "hash");
  v4 = -[NSString hash](self->_responseText, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_executionSource;
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
  if (*((_QWORD *)v4 + 1))
  {
    -[SIRINLUEXTERNALNLU_ROUTERTurnSummary setExecutedQuery:](self, "setExecutedQuery:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SIRINLUEXTERNALNLU_ROUTERTurnSummary setResponseText:](self, "setResponseText:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_executionSource = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)executedQuery
{
  return self->_executedQuery;
}

- (void)setExecutedQuery:(id)a3
{
  objc_storeStrong((id *)&self->_executedQuery, a3);
}

- (NSString)responseText
{
  return self->_responseText;
}

- (void)setResponseText:(id)a3
{
  objc_storeStrong((id *)&self->_responseText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_executedQuery, 0);
}

@end
