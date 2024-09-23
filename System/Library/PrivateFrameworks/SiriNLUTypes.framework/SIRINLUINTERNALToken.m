@implementation SIRINLUINTERNALToken

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setBegin:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_begin = a3;
}

- (void)setHasBegin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBegin
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setEnd:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_end = a3;
}

- (void)setHasEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnd
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsSignificant:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isSignificant = a3;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsSignificant
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsWhitespace:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isWhitespace = a3;
}

- (void)setHasIsWhitespace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsWhitespace
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearCleanValues
{
  -[NSMutableArray removeAllObjects](self->_cleanValues, "removeAllObjects");
}

- (void)addCleanValues:(id)a3
{
  id v4;
  NSMutableArray *cleanValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cleanValues = self->_cleanValues;
  v8 = v4;
  if (!cleanValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_cleanValues;
    self->_cleanValues = v6;

    v4 = v8;
    cleanValues = self->_cleanValues;
  }
  -[NSMutableArray addObject:](cleanValues, "addObject:", v4);

}

- (unint64_t)cleanValuesCount
{
  return -[NSMutableArray count](self->_cleanValues, "count");
}

- (id)cleanValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cleanValues, "objectAtIndex:", a3);
}

- (void)setTokenIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tokenIndex = a3;
}

- (void)setHasTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTokenIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNonWhitespaceTokenIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nonWhitespaceTokenIndex = a3;
}

- (void)setHasNonWhitespaceTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNonWhitespaceTokenIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasCleanValue
{
  return self->_cleanValue != 0;
}

- (void)clearNormalizedValues
{
  -[NSMutableArray removeAllObjects](self->_normalizedValues, "removeAllObjects");
}

- (void)addNormalizedValues:(id)a3
{
  id v4;
  NSMutableArray *normalizedValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  normalizedValues = self->_normalizedValues;
  v8 = v4;
  if (!normalizedValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_normalizedValues;
    self->_normalizedValues = v6;

    v4 = v8;
    normalizedValues = self->_normalizedValues;
  }
  -[NSMutableArray addObject:](normalizedValues, "addObject:", v4);

}

- (unint64_t)normalizedValuesCount
{
  return -[NSMutableArray count](self->_normalizedValues, "count");
}

- (id)normalizedValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_normalizedValues, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALToken;
  -[SIRINLUINTERNALToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *value;
  char has;
  void *v7;
  NSMutableArray *cleanValues;
  char v9;
  void *v10;
  void *v11;
  NSString *cleanValue;
  NSMutableArray *normalizedValues;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKey:", value, CFSTR("value"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_begin);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("begin"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_end);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("end"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSignificant);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("is_significant"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWhitespace);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("is_whitespace"));

  }
LABEL_8:
  cleanValues = self->_cleanValues;
  if (cleanValues)
    objc_msgSend(v4, "setObject:forKey:", cleanValues, CFSTR("clean_values"));
  v9 = (char)self->_has;
  if ((v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_tokenIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("token_index"));

    v9 = (char)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nonWhitespaceTokenIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("non_whitespace_token_index"));

  }
  cleanValue = self->_cleanValue;
  if (cleanValue)
    objc_msgSend(v4, "setObject:forKey:", cleanValue, CFSTR("clean_value"));
  normalizedValues = self->_normalizedValues;
  if (normalizedValues)
    objc_msgSend(v4, "setObject:forKey:", normalizedValues, CFSTR("normalized_values"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTokenReadFrom(self, (uint64_t)a3);
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
  char v11;
  NSMutableArray *v12;
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
  if (self->_value)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_cleanValues;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_cleanValue)
    PBDataWriterWriteStringField();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_normalizedValues;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
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
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    v4 = v15;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_begin;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
LABEL_25:
      *((_BYTE *)v4 + 64) = self->_isSignificant;
      *((_BYTE *)v4 + 68) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 8) = self->_end;
  *((_BYTE *)v4 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_25;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_BYTE *)v4 + 65) = self->_isWhitespace;
    *((_BYTE *)v4 + 68) |= 0x20u;
  }
LABEL_8:
  if (-[SIRINLUINTERNALToken cleanValuesCount](self, "cleanValuesCount"))
  {
    objc_msgSend(v15, "clearCleanValues");
    v6 = -[SIRINLUINTERNALToken cleanValuesCount](self, "cleanValuesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SIRINLUINTERNALToken cleanValuesAtIndex:](self, "cleanValuesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addCleanValues:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v15 + 12) = self->_tokenIndex;
    *((_BYTE *)v15 + 68) |= 8u;
    v10 = (char)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v15 + 9) = self->_nonWhitespaceTokenIndex;
    *((_BYTE *)v15 + 68) |= 4u;
  }
  if (self->_cleanValue)
    objc_msgSend(v15, "setCleanValue:");
  if (-[SIRINLUINTERNALToken normalizedValuesCount](self, "normalizedValuesCount"))
  {
    objc_msgSend(v15, "clearNormalizedValues");
    v11 = -[SIRINLUINTERNALToken normalizedValuesCount](self, "normalizedValuesCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[SIRINLUINTERNALToken normalizedValuesAtIndex:](self, "normalizedValuesAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addNormalizedValues:", v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_begin;
    *(_BYTE *)(v5 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_end;
  *(_BYTE *)(v5 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_27:
  *(_BYTE *)(v5 + 64) = self->_isSignificant;
  *(_BYTE *)(v5 + 68) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 65) = self->_isWhitespace;
    *(_BYTE *)(v5 + 68) |= 0x20u;
  }
LABEL_6:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_cleanValues;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCleanValues:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_tokenIndex;
    *(_BYTE *)(v5 + 68) |= 8u;
    v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_nonWhitespaceTokenIndex;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v16 = -[NSString copyWithZone:](self->_cleanValue, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_normalizedValues;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addNormalizedValues:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *value;
  char has;
  char v7;
  NSMutableArray *cleanValues;
  NSString *cleanValue;
  NSMutableArray *normalizedValues;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](value, "isEqual:"))
      goto LABEL_47;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 68);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_begin != *((_DWORD *)v4 + 2))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_end != *((_DWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0)
      goto LABEL_47;
    if (self->_isSignificant)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0)
      goto LABEL_47;
    if (self->_isWhitespace)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  cleanValues = self->_cleanValues;
  if (!((unint64_t)cleanValues | *((_QWORD *)v4 + 3)))
    goto LABEL_33;
  if (!-[NSMutableArray isEqual:](cleanValues, "isEqual:"))
  {
LABEL_47:
    v11 = 0;
    goto LABEL_48;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 68);
LABEL_33:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_tokenIndex != *((_DWORD *)v4 + 12))
      goto LABEL_47;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_nonWhitespaceTokenIndex != *((_DWORD *)v4 + 9))
      goto LABEL_47;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_47;
  }
  cleanValue = self->_cleanValue;
  if ((unint64_t)cleanValue | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](cleanValue, "isEqual:"))
    goto LABEL_47;
  normalizedValues = self->_normalizedValues;
  if ((unint64_t)normalizedValues | *((_QWORD *)v4 + 5))
    v11 = -[NSMutableArray isEqual:](normalizedValues, "isEqual:");
  else
    v11 = 1;
LABEL_48:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_begin;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_end;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_isSignificant;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isWhitespace;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:
  v8 = -[NSMutableArray hash](self->_cleanValues, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v9 = 2654435761 * self->_tokenIndex;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_12;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_12:
  v10 = 2654435761 * self->_nonWhitespaceTokenIndex;
LABEL_15:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  v12 = v9 ^ v10 ^ -[NSString hash](self->_cleanValue, "hash");
  return v11 ^ v12 ^ -[NSMutableArray hash](self->_normalizedValues, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
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
  if (*((_QWORD *)v4 + 7))
    -[SIRINLUINTERNALToken setValue:](self, "setValue:");
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_begin = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_31;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_end = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_31:
  self->_isSignificant = *((_BYTE *)v4 + 64);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
LABEL_7:
    self->_isWhitespace = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[SIRINLUINTERNALToken addCleanValues:](self, "addCleanValues:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v4 + 68);
  if ((v11 & 8) != 0)
  {
    self->_tokenIndex = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
    v11 = *((_BYTE *)v4 + 68);
  }
  if ((v11 & 4) != 0)
  {
    self->_nonWhitespaceTokenIndex = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUINTERNALToken setCleanValue:](self, "setCleanValue:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 5);
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
        -[SIRINLUINTERNALToken addNormalizedValues:](self, "addNormalizedValues:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int)begin
{
  return self->_begin;
}

- (int)end
{
  return self->_end;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (NSMutableArray)cleanValues
{
  return self->_cleanValues;
}

- (void)setCleanValues:(id)a3
{
  objc_storeStrong((id *)&self->_cleanValues, a3);
}

- (int)tokenIndex
{
  return self->_tokenIndex;
}

- (int)nonWhitespaceTokenIndex
{
  return self->_nonWhitespaceTokenIndex;
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (void)setCleanValue:(id)a3
{
  objc_storeStrong((id *)&self->_cleanValue, a3);
}

- (NSMutableArray)normalizedValues
{
  return self->_normalizedValues;
}

- (void)setNormalizedValues:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_normalizedValues, 0);
  objc_storeStrong((id *)&self->_cleanValues, 0);
  objc_storeStrong((id *)&self->_cleanValue, 0);
}

+ (Class)cleanValuesType
{
  return (Class)objc_opt_class();
}

+ (Class)normalizedValuesType
{
  return (Class)objc_opt_class();
}

@end
