@implementation _SFPBRFFactItemHeroNumberCardSection

- (_SFPBRFFactItemHeroNumberCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFFactItemHeroNumberCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  _SFPBRFTextProperty *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _SFPBRFTextProperty *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  _SFPBRFTextProperty *v29;
  void *v30;
  _SFPBRFTextProperty *v31;
  void *v32;
  _SFPBRFTextProperty *v33;
  void *v34;
  _SFPBRFTextProperty *v35;
  void *v36;
  _SFPBRFTextProperty *v37;
  _SFPBRFFactItemHeroNumberCardSection *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFFactItemHeroNumberCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "number");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "number");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRFTextProperty initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFFactItemHeroNumberCardSection setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "unit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFFactItemHeroNumberCardSection setUnit:](v5, "setUnit:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v18);
    }

    -[_SFPBRFFactItemHeroNumberCardSection setText_2s:](v5, "setText_2s:", v15);
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "text", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v24);
          v29 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v26);
    }

    -[_SFPBRFFactItemHeroNumberCardSection setText_3s:](v5, "setText_3s:", v23);
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBRFTextProperty initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBRFFactItemHeroNumberCardSection setText_4:](v5, "setText_4:", v33);

    }
    objc_msgSend(v4, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBRFTextProperty initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBRFFactItemHeroNumberCardSection setText_5:](v5, "setText_5:", v37);

    }
    v38 = v5;

  }
  return v5;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (void)setText_2:(id)a3
{
  NSArray *v4;
  NSArray *text_2s;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  text_2s = self->_text_2s;
  self->_text_2s = v4;

}

- (void)clearText_2
{
  -[NSArray removeAllObjects](self->_text_2s, "removeAllObjects");
}

- (void)addText_2:(id)a3
{
  id v4;
  NSArray *text_2s;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  text_2s = self->_text_2s;
  v8 = v4;
  if (!text_2s)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_text_2s;
    self->_text_2s = v6;

    v4 = v8;
    text_2s = self->_text_2s;
  }
  -[NSArray addObject:](text_2s, "addObject:", v4);

}

- (unint64_t)text_2Count
{
  return -[NSArray count](self->_text_2s, "count");
}

- (id)text_2AtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_text_2s, "objectAtIndexedSubscript:", a3);
}

- (void)setText_3:(id)a3
{
  NSArray *v4;
  NSArray *text_3s;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  text_3s = self->_text_3s;
  self->_text_3s = v4;

}

- (void)clearText_3
{
  -[NSArray removeAllObjects](self->_text_3s, "removeAllObjects");
}

- (void)addText_3:(id)a3
{
  id v4;
  NSArray *text_3s;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  text_3s = self->_text_3s;
  v8 = v4;
  if (!text_3s)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_text_3s;
    self->_text_3s = v6;

    v4 = v8;
    text_3s = self->_text_3s;
  }
  -[NSArray addObject:](text_3s, "addObject:", v4);

}

- (unint64_t)text_3Count
{
  return -[NSArray count](self->_text_3s, "count");
}

- (id)text_3AtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_text_3s, "objectAtIndexedSubscript:", a3);
}

- (void)setText_4:(id)a3
{
  objc_storeStrong((id *)&self->_text_4, a3);
}

- (void)setText_5:(id)a3
{
  objc_storeStrong((id *)&self->_text_5, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemHeroNumberCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFFactItemHeroNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemHeroNumberCardSection unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemHeroNumberCardSection text_2s](self, "text_2s");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  -[_SFPBRFFactItemHeroNumberCardSection text_3s](self, "text_3s");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_SFPBRFFactItemHeroNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFFactItemHeroNumberCardSection number](self, "number");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFFactItemHeroNumberCardSection number](self, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFFactItemHeroNumberCardSection unit](self, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFFactItemHeroNumberCardSection unit](self, "unit");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFFactItemHeroNumberCardSection unit](self, "unit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFFactItemHeroNumberCardSection text_2s](self, "text_2s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_2s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFFactItemHeroNumberCardSection text_2s](self, "text_2s");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFFactItemHeroNumberCardSection text_2s](self, "text_2s");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_2s");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFFactItemHeroNumberCardSection text_3s](self, "text_3s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_3s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFFactItemHeroNumberCardSection text_3s](self, "text_3s");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFFactItemHeroNumberCardSection text_3s](self, "text_3s");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_3s");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[_SFPBRFTextProperty hash](self->_number, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_unit, "hash") ^ v3;
  v5 = -[NSArray hash](self->_text_2s, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_text_3s, "hash");
  v7 = -[_SFPBRFTextProperty hash](self->_text_4, "hash");
  return v6 ^ v7 ^ -[_SFPBRFTextProperty hash](self->_text_5, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_number)
  {
    -[_SFPBRFFactItemHeroNumberCardSection number](self, "number");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("number"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("number"));

    }
  }
  if (-[NSArray count](self->_text_2s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = self->_text_2s;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("text2"));
  }
  if (-[NSArray count](self->_text_3s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = self->_text_3s;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("text3"));
  }
  if (self->_text_4)
  {
    -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("text4"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("text4"));

    }
  }
  if (self->_text_5)
  {
    -[_SFPBRFFactItemHeroNumberCardSection text](self, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("text5"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("text5"));

    }
  }
  if (self->_unit)
  {
    -[_SFPBRFFactItemHeroNumberCardSection unit](self, "unit");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("unit"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("unit"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFFactItemHeroNumberCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFFactItemHeroNumberCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFFactItemHeroNumberCardSection *v5;
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
    self = -[_SFPBRFFactItemHeroNumberCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFFactItemHeroNumberCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFFactItemHeroNumberCardSection *v5;
  uint64_t v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _SFPBRFTextProperty *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _SFPBRFTextProperty *v25;
  void *v26;
  _SFPBRFTextProperty *v27;
  void *v28;
  _SFPBRFTextProperty *v29;
  _SFPBRFFactItemHeroNumberCardSection *v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRFFactItemHeroNumberCardSection;
  v5 = -[_SFPBRFFactItemHeroNumberCardSection init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("number"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFFactItemHeroNumberCardSection setNumber:](v5, "setNumber:", v7);

    }
    v34 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFFactItemHeroNumberCardSection setUnit:](v5, "setUnit:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v10;
    v33 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v40;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v40 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v16);
              -[_SFPBRFFactItemHeroNumberCardSection addText_2:](v5, "addText_2:", v17);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v13);
      }

      v10 = v32;
      v8 = v33;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v24);
              -[_SFPBRFFactItemHeroNumberCardSection addText_3:](v5, "addText_3:", v25);

            }
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v21);
      }

      v10 = v32;
      v8 = v33;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v26);
      -[_SFPBRFFactItemHeroNumberCardSection setText_4:](v5, "setText_4:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text5"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v28);
      -[_SFPBRFFactItemHeroNumberCardSection setText_5:](v5, "setText_5:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)number
{
  return self->_number;
}

- (_SFPBRFTextProperty)unit
{
  return self->_unit;
}

- (NSArray)text_2s
{
  return self->_text_2s;
}

- (void)setText_2s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (void)setText_3s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

@end
