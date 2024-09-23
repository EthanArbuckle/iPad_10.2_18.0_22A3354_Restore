@implementation SIRINLUINTERNALParseOverride

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

- (BOOL)enabled
{
  return (*(_BYTE *)&self->_has & 4) == 0 || self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCreationTimestampMsSinceUnixEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationTimestampMsSinceUnixEpoch = a3;
}

- (void)setHasCreationTimestampMsSinceUnixEpoch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationTimestampMsSinceUnixEpoch
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)parserIdentifier
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_parserIdentifier;
  else
    return 1;
}

- (void)setParserIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_parserIdentifier = a3;
}

- (void)setHasParserIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParserIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)parserIdentifierAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E7BB10A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParserIdentifier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_OVERRIDES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_SNLC")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_NLV4")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_CATI")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_SHORTCUTS_EXACT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_UAAP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_PSC")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_LVC")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PARSER_IDENTIFIER_SSU")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasParse
{
  return self->_parse != 0;
}

- (void)clearNluRequestRules
{
  -[NSMutableArray removeAllObjects](self->_nluRequestRules, "removeAllObjects");
}

- (void)addNluRequestRules:(id)a3
{
  id v4;
  NSMutableArray *nluRequestRules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nluRequestRules = self->_nluRequestRules;
  v8 = v4;
  if (!nluRequestRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nluRequestRules;
    self->_nluRequestRules = v6;

    v4 = v8;
    nluRequestRules = self->_nluRequestRules;
  }
  -[NSMutableArray addObject:](nluRequestRules, "addObject:", v4);

}

- (unint64_t)nluRequestRulesCount
{
  return -[NSMutableArray count](self->_nluRequestRules, "count");
}

- (id)nluRequestRulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nluRequestRules, "objectAtIndex:", a3);
}

- (BOOL)hasSerializedParse
{
  return self->_serializedParse != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALParseOverride;
  -[SIRINLUINTERNALParseOverride description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALParseOverride dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idA;
  char has;
  void *v7;
  void *v8;
  uint64_t parserIdentifier;
  __CFString *v10;
  SIRINLUEXTERNALUserParse *parse;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSData *serializedParse;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  idA = self->_idA;
  if (idA)
    objc_msgSend(v3, "setObject:forKey:", idA, CFSTR("id_a"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("enabled"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_creationTimestampMsSinceUnixEpoch);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("creation_timestamp_ms_since_unix_epoch"));

  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_9:
  parserIdentifier = self->_parserIdentifier;
  if (parserIdentifier >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parserIdentifier);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E7BB10A0[parserIdentifier];
  }
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("parser_identifier"));

LABEL_13:
  parse = self->_parse;
  if (parse)
  {
    -[SIRINLUEXTERNALUserParse dictionaryRepresentation](parse, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("parse"));

  }
  if (-[NSMutableArray count](self->_nluRequestRules, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_nluRequestRules, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = self->_nluRequestRules;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("nlu_request_rules"));
  }
  serializedParse = self->_serializedParse;
  if (serializedParse)
    objc_msgSend(v4, "setObject:forKey:", serializedParse, CFSTR("serialized_parse"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALParseOverrideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_idA)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_parse)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_nluRequestRules;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_serializedParse)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_enabled;
    *((_BYTE *)v4 + 60) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = self->_creationTimestampMsSinceUnixEpoch;
  *((_BYTE *)v4 + 60) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 10) = self->_parserIdentifier;
    *((_BYTE *)v4 + 60) |= 2u;
  }
LABEL_7:
  if (self->_parse)
    objc_msgSend(v10, "setParse:");
  if (-[SIRINLUINTERNALParseOverride nluRequestRulesCount](self, "nluRequestRulesCount"))
  {
    objc_msgSend(v10, "clearNluRequestRules");
    v6 = -[SIRINLUINTERNALParseOverride nluRequestRulesCount](self, "nluRequestRulesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SIRINLUINTERNALParseOverride nluRequestRulesAtIndex:](self, "nluRequestRulesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addNluRequestRules:", v9);

      }
    }
  }
  if (self->_serializedParse)
    objc_msgSend(v10, "setSerializedParse:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idA, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_enabled;
    *(_BYTE *)(v5 + 60) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_creationTimestampMsSinceUnixEpoch;
  *(_BYTE *)(v5 + 60) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_parserIdentifier;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
LABEL_5:
  v9 = -[SIRINLUEXTERNALUserParse copyWithZone:](self->_parse, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_nluRequestRules;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addNluRequestRules:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = -[NSData copyWithZone:](self->_serializedParse, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *idA;
  SIRINLUEXTERNALUserParse *parse;
  NSMutableArray *nluRequestRules;
  NSData *serializedParse;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  idA = self->_idA;
  if ((unint64_t)idA | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](idA, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) != 0)
    {
      if (self->_enabled)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_28;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_12;
    }
LABEL_28:
    v9 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
    goto LABEL_28;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_creationTimestampMsSinceUnixEpoch != *((_QWORD *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_parserIdentifier != *((_DWORD *)v4 + 10))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  parse = self->_parse;
  if ((unint64_t)parse | *((_QWORD *)v4 + 4) && !-[SIRINLUEXTERNALUserParse isEqual:](parse, "isEqual:"))
    goto LABEL_28;
  nluRequestRules = self->_nluRequestRules;
  if ((unint64_t)nluRequestRules | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](nluRequestRules, "isEqual:"))
      goto LABEL_28;
  }
  serializedParse = self->_serializedParse;
  if ((unint64_t)serializedParse | *((_QWORD *)v4 + 6))
    v9 = -[NSData isEqual:](serializedParse, "isEqual:");
  else
    v9 = 1;
LABEL_29:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_idA, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = 2654435761 * self->_enabled;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_creationTimestampMsSinceUnixEpoch;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_parserIdentifier;
LABEL_8:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[SIRINLUEXTERNALUserParse hash](self->_parse, "hash");
  v8 = -[NSMutableArray hash](self->_nluRequestRules, "hash");
  return v7 ^ v8 ^ -[NSData hash](self->_serializedParse, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  SIRINLUEXTERNALUserParse *parse;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUINTERNALParseOverride setIdA:](self, "setIdA:");
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_enabled = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_creationTimestampMsSinceUnixEpoch = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_6:
    self->_parserIdentifier = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  parse = self->_parse;
  v7 = *((_QWORD *)v4 + 4);
  if (parse)
  {
    if (v7)
      -[SIRINLUEXTERNALUserParse mergeFrom:](parse, "mergeFrom:");
  }
  else if (v7)
  {
    -[SIRINLUINTERNALParseOverride setParse:](self, "setParse:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SIRINLUINTERNALParseOverride addNluRequestRules:](self, "addNluRequestRules:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if (*((_QWORD *)v4 + 6))
    -[SIRINLUINTERNALParseOverride setSerializedParse:](self, "setSerializedParse:");

}

- (NSString)idA
{
  return self->_idA;
}

- (void)setIdA:(id)a3
{
  objc_storeStrong((id *)&self->_idA, a3);
}

- (unint64_t)creationTimestampMsSinceUnixEpoch
{
  return self->_creationTimestampMsSinceUnixEpoch;
}

- (SIRINLUEXTERNALUserParse)parse
{
  return self->_parse;
}

- (void)setParse:(id)a3
{
  objc_storeStrong((id *)&self->_parse, a3);
}

- (NSMutableArray)nluRequestRules
{
  return self->_nluRequestRules;
}

- (void)setNluRequestRules:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestRules, a3);
}

- (NSData)serializedParse
{
  return self->_serializedParse;
}

- (void)setSerializedParse:(id)a3
{
  objc_storeStrong((id *)&self->_serializedParse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParse, 0);
  objc_storeStrong((id *)&self->_parse, 0);
  objc_storeStrong((id *)&self->_nluRequestRules, 0);
  objc_storeStrong((id *)&self->_idA, 0);
}

+ (Class)nluRequestRulesType
{
  return (Class)objc_opt_class();
}

@end
