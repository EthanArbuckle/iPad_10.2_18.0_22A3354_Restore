@implementation _SFPBRFSummaryItemAlignedTextCardSection

- (_SFPBRFSummaryItemAlignedTextCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSummaryItemAlignedTextCardSection *v5;
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
  _SFPBRFTextProperty *v23;
  void *v24;
  _SFPBRFTextProperty *v25;
  void *v26;
  _SFPBRFTextProperty *v27;
  void *v28;
  _SFPBRFTextProperty *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  _SFPBRFTextProperty *v37;
  void *v38;
  _SFPBRFVisualProperty *v39;
  void *v40;
  _SFPBRFVisualProperty *v41;
  _SFPBRFSummaryItemAlignedTextCardSection *v42;
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
  v5 = -[_SFPBRFSummaryItemAlignedTextCardSection init](self, "init");
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
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v49 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v18);
    }

    -[_SFPBRFSummaryItemAlignedTextCardSection setText_3s:](v5, "setText_3s:", v15);
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_SFPBRFTextProperty initWithFacade:](v23, "initWithFacade:", v24);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_4:](v5, "setText_4:", v25);

    }
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBRFTextProperty initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_5:](v5, "setText_5:", v29);

    }
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "text", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(v32);
          v37 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v34);
    }

    -[_SFPBRFSummaryItemAlignedTextCardSection setText_6s:](v5, "setText_6s:", v31);
    objc_msgSend(v4, "thumbnail");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRFVisualProperty initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBRFSummaryItemAlignedTextCardSection setThumbnail:](v5, "setThumbnail:", v41);

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

- (void)setText_6:(id)a3
{
  NSArray *v4;
  NSArray *text_6s;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  text_6s = self->_text_6s;
  self->_text_6s = v4;

}

- (void)clearText_6
{
  -[NSArray removeAllObjects](self->_text_6s, "removeAllObjects");
}

- (void)addText_6:(id)a3
{
  id v4;
  NSArray *text_6s;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  text_6s = self->_text_6s;
  v8 = v4;
  if (!text_6s)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_text_6s;
    self->_text_6s = v6;

    v4 = v8;
    text_6s = self->_text_6s;
  }
  -[NSArray addObject:](text_6s, "addObject:", v4);

}

- (unint64_t)text_6Count
{
  return -[NSArray count](self->_text_6s, "count");
}

- (id)text_6AtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_text_6s, "objectAtIndexedSubscript:", a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemAlignedTextCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemAlignedTextCardSection text_3s](self, "text_3s");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemAlignedTextCardSection text_6s](self, "text_6s");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  -[_SFPBRFSummaryItemAlignedTextCardSection thumbnail](self, "thumbnail");
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
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
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
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
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
  -[_SFPBRFSummaryItemAlignedTextCardSection text_3s](self, "text_3s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_3s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFSummaryItemAlignedTextCardSection text_3s](self, "text_3s");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSummaryItemAlignedTextCardSection text_3s](self, "text_3s");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_3s");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemAlignedTextCardSection text_6s](self, "text_6s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_6s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFSummaryItemAlignedTextCardSection text_6s](self, "text_6s");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFSummaryItemAlignedTextCardSection text_6s](self, "text_6s");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_6s");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemAlignedTextCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFSummaryItemAlignedTextCardSection thumbnail](self, "thumbnail");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[_SFPBRFSummaryItemAlignedTextCardSection thumbnail](self, "thumbnail");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
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
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_text_2, "hash") ^ v3;
  v5 = -[NSArray hash](self->_text_3s, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBRFTextProperty hash](self->_text_4, "hash");
  v7 = -[_SFPBRFTextProperty hash](self->_text_5, "hash");
  v8 = v7 ^ -[NSArray hash](self->_text_6s, "hash");
  return v6 ^ v8 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail, "hash");
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
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
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
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
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
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
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
  if (-[NSArray count](self->_text_3s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = self->_text_3s;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("text3"));
  }
  if (self->_text_4)
  {
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("text4"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("text4"));

    }
  }
  if (self->_text_5)
  {
    -[_SFPBRFSummaryItemAlignedTextCardSection text](self, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("text5"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("text5"));

    }
  }
  if (-[NSArray count](self->_text_6s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = self->_text_6s;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v36);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v24, "addObject:", v30);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v31);

          }
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("text6"));
  }
  if (self->_thumbnail)
  {
    -[_SFPBRFSummaryItemAlignedTextCardSection thumbnail](self, "thumbnail");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("thumbnail"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSummaryItemAlignedTextCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSummaryItemAlignedTextCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSummaryItemAlignedTextCardSection *v5;
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
    self = -[_SFPBRFSummaryItemAlignedTextCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSummaryItemAlignedTextCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSummaryItemAlignedTextCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  _SFPBRFTextProperty *v17;
  void *v18;
  _SFPBRFTextProperty *v19;
  uint64_t v20;
  _SFPBRFTextProperty *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  _SFPBRFTextProperty *v29;
  void *v30;
  _SFPBRFVisualProperty *v31;
  _SFPBRFSummaryItemAlignedTextCardSection *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_SFPBRFSummaryItemAlignedTextCardSection;
  v5 = -[_SFPBRFSummaryItemAlignedTextCardSection init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_1:](v5, "setText_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_2:](v5, "setText_2:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v8;
    v38 = v6;
    v36 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v16);
              -[_SFPBRFSummaryItemAlignedTextCardSection addText_3:](v5, "addText_3:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v13);
      }

      v8 = v37;
      v10 = v36;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v18);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_4:](v5, "setText_4:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text5"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v20);
      -[_SFPBRFSummaryItemAlignedTextCardSection setText_5:](v5, "setText_5:", v21);

    }
    v35 = (void *)v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text6"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v18;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v40 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v28);
              -[_SFPBRFSummaryItemAlignedTextCardSection addText_6:](v5, "addText_6:", v29);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v25);
      }

      v8 = v37;
      v6 = v38;
      v10 = v36;
      v18 = v34;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v30);
      -[_SFPBRFSummaryItemAlignedTextCardSection setThumbnail:](v5, "setThumbnail:", v31);

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

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (NSArray)text_6s
{
  return self->_text_6s;
}

- (void)setText_6s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6s, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
