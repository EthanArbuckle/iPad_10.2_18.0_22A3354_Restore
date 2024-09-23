@implementation _SFPBTextColumnSection

- (_SFPBTextColumnSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBTextColumnSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBTextColumnSection *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBTextColumnSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "textLines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "textLines", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[_SFPBTextColumnSection setTextLines:](v5, "setTextLines:", v7);
    if (objc_msgSend(v4, "hasTextNoWrap"))
      -[_SFPBTextColumnSection setTextNoWrap:](v5, "setTextNoWrap:", objc_msgSend(v4, "textNoWrap"));
    if (objc_msgSend(v4, "hasTextWeight"))
      -[_SFPBTextColumnSection setTextWeight:](v5, "setTextWeight:", objc_msgSend(v4, "textWeight"));
    v13 = v5;

  }
  return v5;
}

- (void)setTextLines:(id)a3
{
  NSArray *v4;
  NSArray *textLines;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  textLines = self->_textLines;
  self->_textLines = v4;

}

- (void)clearTextLines
{
  -[NSArray removeAllObjects](self->_textLines, "removeAllObjects");
}

- (void)addTextLines:(id)a3
{
  id v4;
  NSArray *textLines;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  textLines = self->_textLines;
  v8 = v4;
  if (!textLines)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_textLines;
    self->_textLines = v6;

    v4 = v8;
    textLines = self->_textLines;
  }
  -[NSArray addObject:](textLines, "addObject:", v4);

}

- (unint64_t)textLinesCount
{
  return -[NSArray count](self->_textLines, "count");
}

- (id)textLinesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_textLines, "objectAtIndexedSubscript:", a3);
}

- (void)setTextNoWrap:(BOOL)a3
{
  self->_textNoWrap = a3;
}

- (void)setTextWeight:(unsigned int)a3
{
  self->_textWeight = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTextColumnSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBTextColumnSection textLines](self, "textLines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[_SFPBTextColumnSection textNoWrap](self, "textNoWrap"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTextColumnSection textWeight](self, "textWeight"))
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int textNoWrap;
  unsigned int textWeight;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[_SFPBTextColumnSection textLines](self, "textLines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_10;
  }
  -[_SFPBTextColumnSection textLines](self, "textLines");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBTextColumnSection textLines](self, "textLines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textLines");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_10;
  }
  else
  {

  }
  textNoWrap = self->_textNoWrap;
  if (textNoWrap != objc_msgSend(v4, "textNoWrap"))
  {
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  textWeight = self->_textWeight;
  v15 = textWeight == objc_msgSend(v4, "textWeight");
LABEL_11:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_textLines, "hash");
  if (self->_textNoWrap)
    v4 = 2654435761;
  else
    v4 = 0;
  return v4 ^ v3 ^ (2654435761 * self->_textWeight);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_textLines)
  {
    -[_SFPBTextColumnSection textLines](self, "textLines");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("textLines"));

  }
  if (self->_textNoWrap)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTextColumnSection textNoWrap](self, "textNoWrap"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("textNoWrap"));

  }
  if (self->_textWeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBTextColumnSection textWeight](self, "textWeight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("textWeight"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTextColumnSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBTextColumnSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTextColumnSection *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBTextColumnSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTextColumnSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTextColumnSection *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _SFPBTextColumnSection *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBTextColumnSection;
  v5 = -[_SFPBTextColumnSection init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textLines"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v18);
              -[_SFPBTextColumnSection addTextLines:](v5, "addTextLines:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textNoWrap"), (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnSection setTextNoWrap:](v5, "setTextNoWrap:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textWeight"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnSection setTextWeight:](v5, "setTextWeight:", objc_msgSend(v15, "unsignedIntValue"));
    v16 = v5;

  }
  return v5;
}

- (NSArray)textLines
{
  return self->_textLines;
}

- (BOOL)textNoWrap
{
  return self->_textNoWrap;
}

- (unsigned)textWeight
{
  return self->_textWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLines, 0);
}

@end
