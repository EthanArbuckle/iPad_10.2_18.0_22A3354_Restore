@implementation SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata

- (int)prescribedTool
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_prescribedTool;
  else
    return 0;
}

- (void)setPrescribedTool:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_prescribedTool = a3;
}

- (void)setHasPrescribedTool:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrescribedTool
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)prescribedToolAsString:(int)a3
{
  if (a3 < 5)
    return off_1E7BAE818[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrescribedTool:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESCRIBED_TOOL_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESCRIBED_TOOL_GENERATE_RICH_CONTENT_TOOL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESCRIBED_TOOL_GENERATE_RICH_CONTENT_FROM_MEDIA_INTENT_TOOL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESCRIBED_TOOL_GENERATE_IMAGE_INTENT_TOOL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PRESCRIBED_TOOL_GENERATE_KNOWLEDGE_RESPONSE_INTENT_TOOL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)queryType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_queryType;
  else
    return 0;
}

- (void)setQueryType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_queryType = a3;
}

- (void)setHasQueryType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQueryType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)queryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7BAE840[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQueryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY_TYPE_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY_TYPE_IMPLICIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY_TYPE_EXPLICIT")))
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata;
  -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t prescribedTool;
  __CFString *v6;
  uint64_t queryType;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    prescribedTool = self->_prescribedTool;
    if (prescribedTool >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prescribedTool);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E7BAE818[prescribedTool];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("prescribed_tool"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    queryType = self->_queryType;
    if (queryType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_queryType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7BAE840[queryType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("query_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_prescribedTool;
    *((_BYTE *)v4 + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_queryType;
    *((_BYTE *)v4 + 16) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_prescribedTool;
    *((_BYTE *)result + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_queryType;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_prescribedTool != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_queryType != *((_DWORD *)v4 + 3))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_prescribedTool;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_queryType;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) != 0)
  {
    self->_prescribedTool = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_queryType = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

}

@end
