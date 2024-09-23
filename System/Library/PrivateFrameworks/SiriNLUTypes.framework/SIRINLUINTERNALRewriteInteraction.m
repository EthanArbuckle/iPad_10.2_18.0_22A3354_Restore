@implementation SIRINLUINTERNALRewriteInteraction

- (void)clearOriginalUtterances
{
  -[NSMutableArray removeAllObjects](self->_originalUtterances, "removeAllObjects");
}

- (void)addOriginalUtterances:(id)a3
{
  id v4;
  NSMutableArray *originalUtterances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  originalUtterances = self->_originalUtterances;
  v8 = v4;
  if (!originalUtterances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_originalUtterances;
    self->_originalUtterances = v6;

    v4 = v8;
    originalUtterances = self->_originalUtterances;
  }
  -[NSMutableArray addObject:](originalUtterances, "addObject:", v4);

}

- (unint64_t)originalUtterancesCount
{
  return -[NSMutableArray count](self->_originalUtterances, "count");
}

- (id)originalUtterancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_originalUtterances, "objectAtIndex:", a3);
}

- (void)clearSiriResponses
{
  -[NSMutableArray removeAllObjects](self->_siriResponses, "removeAllObjects");
}

- (void)addSiriResponse:(id)a3
{
  id v4;
  NSMutableArray *siriResponses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  siriResponses = self->_siriResponses;
  v8 = v4;
  if (!siriResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_siriResponses;
    self->_siriResponses = v6;

    v4 = v8;
    siriResponses = self->_siriResponses;
  }
  -[NSMutableArray addObject:](siriResponses, "addObject:", v4);

}

- (unint64_t)siriResponsesCount
{
  return -[NSMutableArray count](self->_siriResponses, "count");
}

- (id)siriResponseAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_siriResponses, "objectAtIndex:", a3);
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setTap2edit:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tap2edit = a3;
}

- (void)setHasTap2edit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTap2edit
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestamp
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
  v8.super_class = (Class)SIRINLUINTERNALRewriteInteraction;
  -[SIRINLUINTERNALRewriteInteraction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALRewriteInteraction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSString *locale;
  char has;
  void *v20;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_originalUtterances, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_originalUtterances, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = self->_originalUtterances;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("original_utterances"));
  }
  if (-[NSMutableArray count](self->_siriResponses, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_siriResponses, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = self->_siriResponses;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("siri_response"));
  }
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tap2edit);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("tap2edit"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startTimestamp);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("start_timestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALRewriteInteractionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
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
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_originalUtterances;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_siriResponses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  if (self->_locale)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char has;
  id v13;

  v13 = a3;
  if (-[SIRINLUINTERNALRewriteInteraction originalUtterancesCount](self, "originalUtterancesCount"))
  {
    objc_msgSend(v13, "clearOriginalUtterances");
    v4 = -[SIRINLUINTERNALRewriteInteraction originalUtterancesCount](self, "originalUtterancesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALRewriteInteraction originalUtterancesAtIndex:](self, "originalUtterancesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addOriginalUtterances:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALRewriteInteraction siriResponsesCount](self, "siriResponsesCount"))
  {
    objc_msgSend(v13, "clearSiriResponses");
    v8 = -[SIRINLUINTERNALRewriteInteraction siriResponsesCount](self, "siriResponsesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALRewriteInteraction siriResponseAtIndex:](self, "siriResponseAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSiriResponse:", v11);

      }
    }
  }
  if (self->_locale)
    objc_msgSend(v13, "setLocale:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v13 + 40) = self->_tap2edit;
    *((_BYTE *)v13 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v13 + 1) = self->_startTimestamp;
    *((_BYTE *)v13 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_originalUtterances;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOriginalUtterances:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = self->_siriResponses;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addSiriResponse:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_tap2edit;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_startTimestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *originalUtterances;
  NSMutableArray *siriResponses;
  NSString *locale;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  originalUtterances = self->_originalUtterances;
  if ((unint64_t)originalUtterances | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](originalUtterances, "isEqual:"))
      goto LABEL_20;
  }
  siriResponses = self->_siriResponses;
  if ((unint64_t)siriResponses | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](siriResponses, "isEqual:"))
      goto LABEL_20;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_tap2edit)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_20;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_16;
    }
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_20;
LABEL_16:
  v8 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_startTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_20;
    v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSMutableArray hash](self->_originalUtterances, "hash");
  v4 = -[NSMutableArray hash](self->_siriResponses, "hash");
  v5 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_tap2edit;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761u * self->_startTimestamp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
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
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[SIRINLUINTERNALRewriteInteraction addOriginalUtterances:](self, "addOriginalUtterances:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[SIRINLUINTERNALRewriteInteraction addSiriResponse:](self, "addSiriResponse:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 2))
    -[SIRINLUINTERNALRewriteInteraction setLocale:](self, "setLocale:");
  v15 = *((_BYTE *)v4 + 44);
  if ((v15 & 2) != 0)
  {
    self->_tap2edit = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
    v15 = *((_BYTE *)v4 + 44);
  }
  if ((v15 & 1) != 0)
  {
    self->_startTimestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSMutableArray)originalUtterances
{
  return self->_originalUtterances;
}

- (void)setOriginalUtterances:(id)a3
{
  objc_storeStrong((id *)&self->_originalUtterances, a3);
}

- (NSMutableArray)siriResponses
{
  return self->_siriResponses;
}

- (void)setSiriResponses:(id)a3
{
  objc_storeStrong((id *)&self->_siriResponses, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)tap2edit
{
  return self->_tap2edit;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriResponses, 0);
  objc_storeStrong((id *)&self->_originalUtterances, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (Class)originalUtterancesType
{
  return (Class)objc_opt_class();
}

+ (Class)siriResponseType
{
  return (Class)objc_opt_class();
}

@end
