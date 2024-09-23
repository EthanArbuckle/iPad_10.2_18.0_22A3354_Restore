@implementation _SFPBRFTextProperty

- (_SFPBRFTextProperty)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTextProperty *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBRFTextElement *v13;
  _SFPBRFTextProperty *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFTextProperty init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "text_elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "text_elements", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBRFTextElement initWithFacade:]([_SFPBRFTextElement alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[_SFPBRFTextProperty setText_elements:](v5, "setText_elements:", v7);
    if (objc_msgSend(v4, "hasIs_safe_for_logging"))
      -[_SFPBRFTextProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    v14 = v5;

  }
  return v5;
}

- (void)setText_elements:(id)a3
{
  NSArray *v4;
  NSArray *text_elements;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  text_elements = self->_text_elements;
  self->_text_elements = v4;

}

- (void)clearText_elements
{
  -[NSArray removeAllObjects](self->_text_elements, "removeAllObjects");
}

- (void)addText_elements:(id)a3
{
  id v4;
  NSArray *text_elements;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  text_elements = self->_text_elements;
  v8 = v4;
  if (!text_elements)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_text_elements;
    self->_text_elements = v6;

    v4 = v8;
    text_elements = self->_text_elements;
  }
  -[NSArray addObject:](text_elements, "addObject:", v4);

}

- (unint64_t)text_elementsCount
{
  return -[NSArray count](self->_text_elements, "count");
}

- (id)text_elementsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_text_elements, "objectAtIndexedSubscript:", a3);
}

- (void)setIs_safe_for_logging:(BOOL)a3
{
  self->_is_safe_for_logging = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTextPropertyReadFrom(self, (uint64_t)a3);
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
  -[_SFPBRFTextProperty text_elements](self, "text_elements");
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[_SFPBRFTextProperty is_safe_for_logging](self, "is_safe_for_logging"))
    PBDataWriterWriteBOOLField();

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
  BOOL v13;
  int is_safe_for_logging;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBRFTextProperty text_elements](self, "text_elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBRFTextProperty text_elements](self, "text_elements");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        is_safe_for_logging = self->_is_safe_for_logging;
        v13 = is_safe_for_logging == objc_msgSend(v4, "is_safe_for_logging");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBRFTextProperty text_elements](self, "text_elements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "text_elements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_text_elements, "hash");
  v4 = 2654435761;
  if (!self->_is_safe_for_logging)
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_is_safe_for_logging)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFTextProperty is_safe_for_logging](self, "is_safe_for_logging"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isSafeForLogging"));

  }
  if (-[NSArray count](self->_text_elements, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_text_elements;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("textElements"));
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTextProperty dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTextProperty)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTextProperty *v5;
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
    self = -[_SFPBRFTextProperty initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTextProperty)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTextProperty *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _SFPBRFTextElement *v13;
  _SFPBRFTextElement *v14;
  void *v15;
  _SFPBRFTextProperty *v16;
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
  v22.super_class = (Class)_SFPBRFTextProperty;
  v5 = -[_SFPBRFTextProperty init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textElements"));
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
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [_SFPBRFTextElement alloc];
              v14 = -[_SFPBRFTextElement initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v18);
              -[_SFPBRFTextProperty addText_elements:](v5, "addText_elements:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSafeForLogging"), (_QWORD)v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTextProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v15, "BOOLValue"));
    v16 = v5;

  }
  return v5;
}

- (NSArray)text_elements
{
  return self->_text_elements;
}

- (BOOL)is_safe_for_logging
{
  return self->_is_safe_for_logging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_elements, 0);
}

@end
