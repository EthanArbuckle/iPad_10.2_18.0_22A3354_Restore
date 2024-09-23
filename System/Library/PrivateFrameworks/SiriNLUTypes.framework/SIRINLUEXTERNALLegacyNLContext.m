@implementation SIRINLUEXTERNALLegacyNLContext

- (void)setDictationPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dictationPrompt = a3;
}

- (void)setHasDictationPrompt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDictationPrompt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStrictPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_strictPrompt = a3;
}

- (void)setHasStrictPrompt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStrictPrompt
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasPreviousDomainName
{
  return self->_previousDomainName != 0;
}

- (void)setListenAfterSpeaking:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_listenAfterSpeaking = a3;
}

- (void)setHasListenAfterSpeaking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasListenAfterSpeaking
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearRenderedTexts
{
  -[NSMutableArray removeAllObjects](self->_renderedTexts, "removeAllObjects");
}

- (void)addRenderedTexts:(id)a3
{
  id v4;
  NSMutableArray *renderedTexts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  renderedTexts = self->_renderedTexts;
  v8 = v4;
  if (!renderedTexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_renderedTexts;
    self->_renderedTexts = v6;

    v4 = v8;
    renderedTexts = self->_renderedTexts;
  }
  -[NSMutableArray addObject:](renderedTexts, "addObject:", v4);

}

- (unint64_t)renderedTextsCount
{
  return -[NSMutableArray count](self->_renderedTexts, "count");
}

- (id)renderedTextsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_renderedTexts, "objectAtIndex:", a3);
}

- (int)legacyContextSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_legacyContextSource;
  else
    return 0;
}

- (void)setLegacyContextSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_legacyContextSource = a3;
}

- (void)setHasLegacyContextSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLegacyContextSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)legacyContextSourceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7BB0F70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLegacyContextSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEGACYCONTEXTSOURCE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEGACYCONTEXTSOURCE_MODALITY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEGACYCONTEXTSOURCE_POMMES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEGACYCONTEXTSOURCE_PROTO_PROMPT_CONTEXT")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearResponseSemanticValues
{
  -[NSMutableArray removeAllObjects](self->_responseSemanticValues, "removeAllObjects");
}

- (void)addResponseSemanticValues:(id)a3
{
  id v4;
  NSMutableArray *responseSemanticValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  responseSemanticValues = self->_responseSemanticValues;
  v8 = v4;
  if (!responseSemanticValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_responseSemanticValues;
    self->_responseSemanticValues = v6;

    v4 = v8;
    responseSemanticValues = self->_responseSemanticValues;
  }
  -[NSMutableArray addObject:](responseSemanticValues, "addObject:", v4);

}

- (unint64_t)responseSemanticValuesCount
{
  return -[NSMutableArray count](self->_responseSemanticValues, "count");
}

- (id)responseSemanticValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_responseSemanticValues, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALLegacyNLContext;
  -[SIRINLUEXTERNALLegacyNLContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALLegacyNLContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *previousDomainName;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t legacyContextSource;
  __CFString *v17;
  NSMutableArray *responseSemanticValues;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dictationPrompt);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dictation_prompt"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_strictPrompt);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("strict_prompt"));

  }
  previousDomainName = self->_previousDomainName;
  if (previousDomainName)
    objc_msgSend(v3, "setObject:forKey:", previousDomainName, CFSTR("previous_domain_name"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_listenAfterSpeaking);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("listen_after_speaking"));

  }
  if (-[NSMutableArray count](self->_renderedTexts, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_renderedTexts, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->_renderedTexts;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rendered_texts"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    legacyContextSource = self->_legacyContextSource;
    if (legacyContextSource >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_legacyContextSource);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E7BB0F70[legacyContextSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("legacy_context_source"));

  }
  responseSemanticValues = self->_responseSemanticValues;
  if (responseSemanticValues)
    objc_msgSend(v3, "setObject:forKey:", responseSemanticValues, CFSTR("response_semantic_values"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALLegacyNLContextReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_previousDomainName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_renderedTexts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_responseSemanticValues;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  _BYTE *v14;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[40] = self->_dictationPrompt;
    v4[44] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[42] = self->_strictPrompt;
    v4[44] |= 8u;
  }
  v14 = v4;
  if (self->_previousDomainName)
  {
    objc_msgSend(v4, "setPreviousDomainName:");
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[41] = self->_listenAfterSpeaking;
    v4[44] |= 4u;
  }
  if (-[SIRINLUEXTERNALLegacyNLContext renderedTextsCount](self, "renderedTextsCount"))
  {
    objc_msgSend(v14, "clearRenderedTexts");
    v6 = -[SIRINLUEXTERNALLegacyNLContext renderedTextsCount](self, "renderedTextsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SIRINLUEXTERNALLegacyNLContext renderedTextsAtIndex:](self, "renderedTextsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addRenderedTexts:", v9);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v14 + 2) = self->_legacyContextSource;
    v14[44] |= 1u;
  }
  if (-[SIRINLUEXTERNALLegacyNLContext responseSemanticValuesCount](self, "responseSemanticValuesCount"))
  {
    objc_msgSend(v14, "clearResponseSemanticValues");
    v10 = -[SIRINLUEXTERNALLegacyNLContext responseSemanticValuesCount](self, "responseSemanticValuesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[SIRINLUEXTERNALLegacyNLContext responseSemanticValuesAtIndex:](self, "responseSemanticValuesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addResponseSemanticValues:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[40] = self->_dictationPrompt;
    v5[44] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[42] = self->_strictPrompt;
    v5[44] |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_previousDomainName, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6[41] = self->_listenAfterSpeaking;
    v6[44] |= 4u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_renderedTexts;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addRenderedTexts:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_legacyContextSource;
    v6[44] |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_responseSemanticValues;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v6, "addResponseSemanticValues:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *previousDomainName;
  NSMutableArray *renderedTexts;
  NSMutableArray *responseSemanticValues;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
      goto LABEL_39;
    if (self->_dictationPrompt)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
      goto LABEL_39;
    if (self->_strictPrompt)
    {
      if (!*((_BYTE *)v4 + 42))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 42))
    {
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_39;
  }
  previousDomainName = self->_previousDomainName;
  if ((unint64_t)previousDomainName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](previousDomainName, "isEqual:"))
      goto LABEL_39;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_39;
    if (self->_listenAfterSpeaking)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_39;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_39;
  }
  renderedTexts = self->_renderedTexts;
  if (!((unint64_t)renderedTexts | *((_QWORD *)v4 + 3)))
    goto LABEL_32;
  if (!-[NSMutableArray isEqual:](renderedTexts, "isEqual:"))
  {
LABEL_39:
    v10 = 0;
    goto LABEL_40;
  }
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
LABEL_32:
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_legacyContextSource != *((_DWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_39;
  }
  responseSemanticValues = self->_responseSemanticValues;
  if ((unint64_t)responseSemanticValues | *((_QWORD *)v4 + 4))
    v10 = -[NSMutableArray isEqual:](responseSemanticValues, "isEqual:");
  else
    v10 = 1;
LABEL_40:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_dictationPrompt;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_strictPrompt;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_previousDomainName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_listenAfterSpeaking;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_renderedTexts, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_legacyContextSource;
  else
    v8 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_responseSemanticValues, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = v4[44];
  if ((v6 & 2) != 0)
  {
    self->_dictationPrompt = v4[40];
    *(_BYTE *)&self->_has |= 2u;
    v6 = v4[44];
  }
  if ((v6 & 8) != 0)
  {
    self->_strictPrompt = v4[42];
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUEXTERNALLegacyNLContext setPreviousDomainName:](self, "setPreviousDomainName:");
  if ((*((_BYTE *)v5 + 44) & 4) != 0)
  {
    self->_listenAfterSpeaking = *((_BYTE *)v5 + 41);
    *(_BYTE *)&self->_has |= 4u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v5 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALLegacyNLContext addRenderedTexts:](self, "addRenderedTexts:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v5 + 44) & 1) != 0)
  {
    self->_legacyContextSource = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v5 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALLegacyNLContext addResponseSemanticValues:](self, "addResponseSemanticValues:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)dictationPrompt
{
  return self->_dictationPrompt;
}

- (BOOL)strictPrompt
{
  return self->_strictPrompt;
}

- (NSString)previousDomainName
{
  return self->_previousDomainName;
}

- (void)setPreviousDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_previousDomainName, a3);
}

- (BOOL)listenAfterSpeaking
{
  return self->_listenAfterSpeaking;
}

- (NSMutableArray)renderedTexts
{
  return self->_renderedTexts;
}

- (void)setRenderedTexts:(id)a3
{
  objc_storeStrong((id *)&self->_renderedTexts, a3);
}

- (NSMutableArray)responseSemanticValues
{
  return self->_responseSemanticValues;
}

- (void)setResponseSemanticValues:(id)a3
{
  objc_storeStrong((id *)&self->_responseSemanticValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSemanticValues, 0);
  objc_storeStrong((id *)&self->_renderedTexts, 0);
  objc_storeStrong((id *)&self->_previousDomainName, 0);
}

+ (Class)renderedTextsType
{
  return (Class)objc_opt_class();
}

+ (Class)responseSemanticValuesType
{
  return (Class)objc_opt_class();
}

@end
