@implementation _SFPBRFTextElement

- (_SFPBRFTextElement)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTextElement *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBRFFormattedText *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFPBRFShowMoreOnTap *v17;
  void *v18;
  _SFPBRFShowMoreOnTap *v19;
  _SFPBRFTextElement *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFTextElement init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "formatted_text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "formatted_text", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBRFFormattedText initWithFacade:]([_SFPBRFFormattedText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    -[_SFPBRFTextElement setFormatted_texts:](v5, "setFormatted_texts:", v7);
    objc_msgSend(v4, "line_limit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "line_limit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFTextElement setLine_limit:](v5, "setLine_limit:", objc_msgSend(v15, "intValue"));

    }
    objc_msgSend(v4, "show_more_on_tap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBRFShowMoreOnTap alloc];
      objc_msgSend(v4, "show_more_on_tap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBRFShowMoreOnTap initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBRFTextElement setShow_more_on_tap:](v5, "setShow_more_on_tap:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (void)setFormatted_text:(id)a3
{
  NSArray *v4;
  NSArray *formatted_texts;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  formatted_texts = self->_formatted_texts;
  self->_formatted_texts = v4;

}

- (void)clearFormatted_text
{
  -[NSArray removeAllObjects](self->_formatted_texts, "removeAllObjects");
}

- (void)addFormatted_text:(id)a3
{
  id v4;
  NSArray *formatted_texts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  formatted_texts = self->_formatted_texts;
  v8 = v4;
  if (!formatted_texts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_formatted_texts;
    self->_formatted_texts = v6;

    v4 = v8;
    formatted_texts = self->_formatted_texts;
  }
  -[NSArray addObject:](formatted_texts, "addObject:", v4);

}

- (unint64_t)formatted_textCount
{
  return -[NSArray count](self->_formatted_texts, "count");
}

- (id)formatted_textAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_formatted_texts, "objectAtIndexedSubscript:", a3);
}

- (void)setLine_limit:(int)a3
{
  self->_line_limit = a3;
}

- (void)setShow_more_on_tap:(id)a3
{
  objc_storeStrong((id *)&self->_show_more_on_tap, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTextElementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFTextElement formatted_texts](self, "formatted_texts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (-[_SFPBRFTextElement line_limit](self, "line_limit"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFTextElement show_more_on_tap](self, "show_more_on_tap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int line_limit;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[_SFPBRFTextElement formatted_texts](self, "formatted_texts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatted_texts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_12;
  -[_SFPBRFTextElement formatted_texts](self, "formatted_texts");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFTextElement formatted_texts](self, "formatted_texts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formatted_texts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_13;
  }
  else
  {

  }
  line_limit = self->_line_limit;
  if (line_limit != objc_msgSend(v4, "line_limit"))
    goto LABEL_13;
  -[_SFPBRFTextElement show_more_on_tap](self, "show_more_on_tap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "show_more_on_tap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_SFPBRFTextElement show_more_on_tap](self, "show_more_on_tap");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

LABEL_16:
    v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  -[_SFPBRFTextElement show_more_on_tap](self, "show_more_on_tap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "show_more_on_tap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_16;
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_formatted_texts, "hash");
  v4 = 2654435761 * self->_line_limit;
  return v4 ^ v3 ^ -[_SFPBRFShowMoreOnTap hash](self->_show_more_on_tap, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_formatted_texts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_formatted_texts;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("formattedText"));
  }
  if (self->_line_limit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRFTextElement line_limit](self, "line_limit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lineLimit"));

  }
  if (self->_show_more_on_tap)
  {
    -[_SFPBRFTextElement show_more_on_tap](self, "show_more_on_tap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("showMoreOnTap"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("showMoreOnTap"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTextElement dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTextElement)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTextElement *v5;
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
    self = -[_SFPBRFTextElement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTextElement)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTextElement *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _SFPBRFFormattedText *v13;
  _SFPBRFFormattedText *v14;
  void *v15;
  void *v16;
  _SFPBRFShowMoreOnTap *v17;
  _SFPBRFTextElement *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBRFTextElement;
  v5 = -[_SFPBRFTextElement init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formattedText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [_SFPBRFFormattedText alloc];
              v14 = -[_SFPBRFFormattedText initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v20);
              -[_SFPBRFTextElement addFormatted_text:](v5, "addFormatted_text:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lineLimit"), (_QWORD)v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTextElement setLine_limit:](v5, "setLine_limit:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showMoreOnTap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBRFShowMoreOnTap initWithDictionary:]([_SFPBRFShowMoreOnTap alloc], "initWithDictionary:", v16);
      -[_SFPBRFTextElement setShow_more_on_tap:](v5, "setShow_more_on_tap:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (NSArray)formatted_texts
{
  return self->_formatted_texts;
}

- (void)setFormatted_texts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)line_limit
{
  return self->_line_limit;
}

- (_SFPBRFShowMoreOnTap)show_more_on_tap
{
  return self->_show_more_on_tap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_show_more_on_tap, 0);
  objc_storeStrong((id *)&self->_formatted_texts, 0);
}

@end
