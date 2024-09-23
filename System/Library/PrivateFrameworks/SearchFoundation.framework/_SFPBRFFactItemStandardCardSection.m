@implementation _SFPBRFFactItemStandardCardSection

- (_SFPBRFFactItemStandardCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFFactItemStandardCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  _SFPBRFTextProperty *v13;
  void *v14;
  _SFPBRFTextProperty *v15;
  void *v16;
  _SFPBRFTextProperty *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  _SFPBRFTextProperty *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  _SFPBRFTextProperty *v33;
  void *v34;
  _SFPBRFVisualProperty *v35;
  void *v36;
  _SFPBRFVisualProperty *v37;
  void *v38;
  _SFPBRFVisualProperty *v39;
  void *v40;
  _SFPBRFVisualProperty *v41;
  _SFPBRFFactItemStandardCardSection *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFFactItemStandardCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRFTextProperty initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFFactItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFFactItemStandardCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRFTextProperty initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFFactItemStandardCardSection setText_3:](v5, "setText_3:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          v25 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v22);
    }

    -[_SFPBRFFactItemStandardCardSection setText_4s:](v5, "setText_4s:", v19);
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "text", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          v33 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v30);
    }

    -[_SFPBRFFactItemStandardCardSection setText_5s:](v5, "setText_5s:", v27);
    objc_msgSend(v4, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBRFVisualProperty initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBRFFactItemStandardCardSection setThumbnail:](v5, "setThumbnail:", v37);

    }
    objc_msgSend(v4, "thumbnail2");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail2");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRFVisualProperty initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBRFFactItemStandardCardSection setThumbnail2:](v5, "setThumbnail2:", v41);

    }
    v42 = v5;

  }
  return v5;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (void)setText_2:(id)a3
{
  objc_storeStrong((id *)&self->_text_2, a3);
}

- (void)setText_3:(id)a3
{
  objc_storeStrong((id *)&self->_text_3, a3);
}

- (void)setText_4:(id)a3
{
  NSArray *v4;
  NSArray *text_4s;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  text_4s = self->_text_4s;
  self->_text_4s = v4;

}

- (void)clearText_4
{
  -[NSArray removeAllObjects](self->_text_4s, "removeAllObjects");
}

- (void)addText_4:(id)a3
{
  id v4;
  NSArray *text_4s;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  text_4s = self->_text_4s;
  v8 = v4;
  if (!text_4s)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_text_4s;
    self->_text_4s = v6;

    v4 = v8;
    text_4s = self->_text_4s;
  }
  -[NSArray addObject:](text_4s, "addObject:", v4);

}

- (unint64_t)text_4Count
{
  return -[NSArray count](self->_text_4s, "count");
}

- (id)text_4AtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_text_4s, "objectAtIndexedSubscript:", a3);
}

- (void)setText_5:(id)a3
{
  NSArray *v4;
  NSArray *text_5s;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  text_5s = self->_text_5s;
  self->_text_5s = v4;

}

- (void)clearText_5
{
  -[NSArray removeAllObjects](self->_text_5s, "removeAllObjects");
}

- (void)addText_5:(id)a3
{
  id v4;
  NSArray *text_5s;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  text_5s = self->_text_5s;
  v8 = v4;
  if (!text_5s)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_text_5s;
    self->_text_5s = v6;

    v4 = v8;
    text_5s = self->_text_5s;
  }
  -[NSArray addObject:](text_5s, "addObject:", v4);

}

- (unint64_t)text_5Count
{
  return -[NSArray count](self->_text_5s, "count");
}

- (id)text_5AtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_text_5s, "objectAtIndexedSubscript:", a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setThumbnail2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail2, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemStandardCardSection text_4s](self, "text_4s");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  -[_SFPBRFFactItemStandardCardSection text_5s](self, "text_5s");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  -[_SFPBRFFactItemStandardCardSection thumbnail](self, "thumbnail");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemStandardCardSection thumbnail2](self, "thumbnail2");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
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
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFFactItemStandardCardSection text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFFactItemStandardCardSection text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFFactItemStandardCardSection text](self, "text");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFFactItemStandardCardSection text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFFactItemStandardCardSection text_4s](self, "text_4s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_4s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFFactItemStandardCardSection text_4s](self, "text_4s");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFFactItemStandardCardSection text_4s](self, "text_4s");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_4s");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFFactItemStandardCardSection text_5s](self, "text_5s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_5s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFFactItemStandardCardSection text_5s](self, "text_5s");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFFactItemStandardCardSection text_5s](self, "text_5s");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_5s");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFFactItemStandardCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFFactItemStandardCardSection thumbnail](self, "thumbnail");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFFactItemStandardCardSection thumbnail](self, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFFactItemStandardCardSection thumbnail2](self, "thumbnail2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFFactItemStandardCardSection thumbnail2](self, "thumbnail2");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[_SFPBRFFactItemStandardCardSection thumbnail2](self, "thumbnail2");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail2");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_text_2, "hash") ^ v3;
  v5 = -[_SFPBRFTextProperty hash](self->_text_3, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_text_4s, "hash");
  v7 = -[NSArray hash](self->_text_5s, "hash");
  v8 = v7 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail, "hash");
  return v6 ^ v8 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail2, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_text_1)
  {
    -[_SFPBRFFactItemStandardCardSection text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("text1"));

    }
  }
  if (self->_text_2)
  {
    -[_SFPBRFFactItemStandardCardSection text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("text2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("text2"));

    }
  }
  if (self->_text_3)
  {
    -[_SFPBRFFactItemStandardCardSection text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("text3"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("text3"));

    }
  }
  if (-[NSArray count](self->_text_4s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v14 = self->_text_4s;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("text4"));
  }
  if (-[NSArray count](self->_text_5s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v22 = self->_text_5s;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v36);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v21, "addObject:", v27);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("text5"));
  }
  if (self->_thumbnail)
  {
    -[_SFPBRFFactItemStandardCardSection thumbnail](self, "thumbnail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("thumbnail"));

    }
  }
  if (self->_thumbnail2)
  {
    -[_SFPBRFFactItemStandardCardSection thumbnail2](self, "thumbnail2");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("thumbnail2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("thumbnail2"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFFactItemStandardCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFFactItemStandardCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFFactItemStandardCardSection *v5;
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
    self = -[_SFPBRFFactItemStandardCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFFactItemStandardCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFFactItemStandardCardSection *v5;
  uint64_t v6;
  _SFPBRFTextProperty *v7;
  uint64_t v8;
  _SFPBRFTextProperty *v9;
  uint64_t v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  _SFPBRFTextProperty *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  _SFPBRFTextProperty *v27;
  void *v28;
  _SFPBRFVisualProperty *v29;
  void *v30;
  _SFPBRFVisualProperty *v31;
  _SFPBRFFactItemStandardCardSection *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_SFPBRFFactItemStandardCardSection;
  v5 = -[_SFPBRFFactItemStandardCardSection init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFFactItemStandardCardSection setText_1:](v5, "setText_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFFactItemStandardCardSection setText_2:](v5, "setText_2:", v9);

    }
    v36 = (void *)v8;
    v37 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v10);
      -[_SFPBRFFactItemStandardCardSection setText_3:](v5, "setText_3:", v11);

    }
    v35 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v43 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v18);
              -[_SFPBRFFactItemStandardCardSection addText_4:](v5, "addText_4:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v15);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text5"), v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v26);
              -[_SFPBRFFactItemStandardCardSection addText_5:](v5, "addText_5:", v27);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v23);
      }

      v12 = v34;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v28);
      -[_SFPBRFFactItemStandardCardSection setThumbnail:](v5, "setThumbnail:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail2"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v30);
      -[_SFPBRFFactItemStandardCardSection setThumbnail2:](v5, "setThumbnail2:", v31);

    }
    v32 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_3
{
  return self->_text_3;
}

- (NSArray)text_4s
{
  return self->_text_4s;
}

- (void)setText_4s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)text_5s
{
  return self->_text_5s;
}

- (void)setText_5s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRFVisualProperty)thumbnail2
{
  return self->_thumbnail2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail2, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_5s, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
