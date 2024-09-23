@implementation _SFPBRFSummaryItemImageRightCardSection

- (_SFPBRFSummaryItemImageRightCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSummaryItemImageRightCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _SFPBRFTextProperty *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  _SFPBRFTextProperty *v25;
  void *v26;
  _SFPBRFTextProperty *v27;
  void *v28;
  _SFPBRFTextProperty *v29;
  void *v30;
  _SFPBRFVisualProperty *v31;
  void *v32;
  _SFPBRFVisualProperty *v33;
  void *v34;
  _SFPBRFVisualProperty *v35;
  void *v36;
  _SFPBRFVisualProperty *v37;
  _SFPBRFSummaryItemImageRightCardSection *v38;
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
  v5 = -[_SFPBRFSummaryItemImageRightCardSection init](self, "init");
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
      -[_SFPBRFSummaryItemImageRightCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v11 = 0;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          v17 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v14);
    }

    -[_SFPBRFSummaryItemImageRightCardSection setText_2s:](v5, "setText_2s:", v11);
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "text", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v20);
          v25 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v22);
    }

    -[_SFPBRFSummaryItemImageRightCardSection setText_3s:](v5, "setText_3s:", v19);
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBRFTextProperty initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBRFSummaryItemImageRightCardSection setText_4:](v5, "setText_4:", v29);

    }
    objc_msgSend(v4, "thumbnail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBRFVisualProperty initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBRFSummaryItemImageRightCardSection setThumbnail_1:](v5, "setThumbnail_1:", v33);

    }
    objc_msgSend(v4, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBRFVisualProperty initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBRFSummaryItemImageRightCardSection setThumbnail_2:](v5, "setThumbnail_2:", v37);

    }
    v38 = v5;

  }
  return v5;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
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

- (void)setThumbnail_1:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_1, a3);
}

- (void)setThumbnail_2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_2, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemImageRightCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemImageRightCardSection text_2s](self, "text_2s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  -[_SFPBRFSummaryItemImageRightCardSection text_3s](self, "text_3s");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
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
  -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemImageRightCardSection text_2s](self, "text_2s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_2s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFSummaryItemImageRightCardSection text_2s](self, "text_2s");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSummaryItemImageRightCardSection text_2s](self, "text_2s");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_2s");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemImageRightCardSection text_3s](self, "text_3s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_3s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFSummaryItemImageRightCardSection text_3s](self, "text_3s");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSummaryItemImageRightCardSection text_3s](self, "text_3s");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_3s");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
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
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = -[NSArray hash](self->_text_2s, "hash") ^ v3;
  v5 = -[NSArray hash](self->_text_3s, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBRFTextProperty hash](self->_text_4, "hash");
  v7 = -[_SFPBRFVisualProperty hash](self->_thumbnail_1, "hash");
  return v6 ^ v7 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail_2, "hash");
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
  if (self->_text_1)
  {
    -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
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
    -[_SFPBRFSummaryItemImageRightCardSection text](self, "text");
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
  if (self->_thumbnail_1)
  {
    -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("thumbnail1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("thumbnail1"));

    }
  }
  if (self->_thumbnail_2)
  {
    -[_SFPBRFSummaryItemImageRightCardSection thumbnail](self, "thumbnail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("thumbnail2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("thumbnail2"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSummaryItemImageRightCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSummaryItemImageRightCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSummaryItemImageRightCardSection *v5;
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
    self = -[_SFPBRFSummaryItemImageRightCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSummaryItemImageRightCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSummaryItemImageRightCardSection *v5;
  uint64_t v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFPBRFTextProperty *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _SFPBRFTextProperty *v23;
  void *v24;
  _SFPBRFTextProperty *v25;
  void *v26;
  _SFPBRFVisualProperty *v27;
  void *v28;
  _SFPBRFVisualProperty *v29;
  _SFPBRFSummaryItemImageRightCardSection *v30;
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
  v43.super_class = (Class)_SFPBRFSummaryItemImageRightCardSection;
  v5 = -[_SFPBRFSummaryItemImageRightCardSection init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSummaryItemImageRightCardSection setText_1:](v5, "setText_1:", v7);

    }
    v34 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v40;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v40 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v14);
              -[_SFPBRFSummaryItemImageRightCardSection addText_2:](v5, "addText_2:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v11);
      }

      v8 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"), v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v36;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v36 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v22);
              -[_SFPBRFSummaryItemImageRightCardSection addText_3:](v5, "addText_3:", v23);

            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v19);
      }

      v8 = v33;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v24);
      -[_SFPBRFSummaryItemImageRightCardSection setText_4:](v5, "setText_4:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail1"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v26);
      -[_SFPBRFSummaryItemImageRightCardSection setThumbnail_1:](v5, "setThumbnail_1:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail2"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v28);
      -[_SFPBRFSummaryItemImageRightCardSection setThumbnail_2:](v5, "setThumbnail_2:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (NSArray)text_2s
{
  return self->_text_2s;
}

- (void)setText_2s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (void)setText_3s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (_SFPBRFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
}

- (_SFPBRFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
