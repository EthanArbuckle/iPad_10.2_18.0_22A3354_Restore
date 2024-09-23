@implementation _SFPBRFSummaryItemShortNumberCardSection

- (_SFPBRFSummaryItemShortNumberCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSummaryItemShortNumberCardSection *v5;
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
  _SFPBRFTextProperty *v35;
  void *v36;
  _SFPBRFTextProperty *v37;
  void *v38;
  _SFPBRFTextProperty *v39;
  void *v40;
  _SFPBRFTextProperty *v41;
  void *v42;
  _SFPBRFVisualProperty *v43;
  void *v44;
  _SFPBRFVisualProperty *v45;
  _SFPBRFSummaryItemShortNumberCardSection *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFSummaryItemShortNumberCardSection init](self, "init");
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
      -[_SFPBRFSummaryItemShortNumberCardSection setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRFTextProperty initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_1:](v5, "setText_1:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v53 != v23)
            objc_enumerationMutation(v20);
          v25 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v22);
    }

    -[_SFPBRFSummaryItemShortNumberCardSection setText_3s:](v5, "setText_3s:", v19);
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "text", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v28);
          v33 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v30);
    }

    -[_SFPBRFSummaryItemShortNumberCardSection setText_4s:](v5, "setText_4s:", v27);
    objc_msgSend(v4, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBRFTextProperty initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_5:](v5, "setText_5:", v37);

    }
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRFTextProperty initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_6:](v5, "setText_6:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBRFVisualProperty initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBRFSummaryItemShortNumberCardSection setThumbnail:](v5, "setThumbnail:", v45);

    }
    v46 = v5;

  }
  return v5;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (void)setText_2:(id)a3
{
  objc_storeStrong((id *)&self->_text_2, a3);
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
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
  objc_storeStrong((id *)&self->_text_5, a3);
}

- (void)setText_6:(id)a3
{
  objc_storeStrong((id *)&self->_text_6, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemShortNumberCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFSummaryItemShortNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemShortNumberCardSection text_3s](self, "text_3s");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  -[_SFPBRFSummaryItemShortNumberCardSection text_4s](self, "text_4s");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
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
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  BOOL v47;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[_SFPBRFSummaryItemShortNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection number](self, "number");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSummaryItemShortNumberCardSection number](self, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection text_3s](self, "text_3s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_3s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection text_3s](self, "text_3s");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFSummaryItemShortNumberCardSection text_3s](self, "text_3s");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_3s");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection text_4s](self, "text_4s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_4s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection text_4s](self, "text_4s");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFSummaryItemShortNumberCardSection text_4s](self, "text_4s");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_4s");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

LABEL_45:
      v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    -[_SFPBRFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if ((v46 & 1) != 0)
      goto LABEL_45;
  }
  else
  {
LABEL_41:

  }
LABEL_42:
  v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[_SFPBRFTextProperty hash](self->_number, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_text_2, "hash") ^ v3;
  v5 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_text_3s, "hash");
  v7 = -[NSArray hash](self->_text_4s, "hash");
  v8 = v7 ^ -[_SFPBRFTextProperty hash](self->_text_5, "hash");
  v9 = v6 ^ v8 ^ -[_SFPBRFTextProperty hash](self->_text_6, "hash");
  return v9 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail, "hash");
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
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_number)
  {
    -[_SFPBRFSummaryItemShortNumberCardSection number](self, "number");
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
  if (self->_text_1)
  {
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("text1"));

    }
  }
  if (self->_text_2)
  {
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("text2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("text2"));

    }
  }
  if (-[NSArray count](self->_text_3s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = self->_text_3s;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation");
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
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("text3"));
  }
  if (-[NSArray count](self->_text_4s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v22 = self->_text_4s;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v39);
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
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("text4"));
  }
  if (self->_text_5)
  {
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("text5"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("text5"));

    }
  }
  if (self->_text_6)
  {
    -[_SFPBRFSummaryItemShortNumberCardSection text](self, "text");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("text6"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("text6"));

    }
  }
  if (self->_thumbnail)
  {
    -[_SFPBRFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("thumbnail"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSummaryItemShortNumberCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSummaryItemShortNumberCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSummaryItemShortNumberCardSection *v5;
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
    self = -[_SFPBRFSummaryItemShortNumberCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSummaryItemShortNumberCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSummaryItemShortNumberCardSection *v5;
  uint64_t v6;
  _SFPBRFTextProperty *v7;
  uint64_t v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _SFPBRFTextProperty *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _SFPBRFTextProperty *v27;
  void *v28;
  _SFPBRFTextProperty *v29;
  void *v30;
  _SFPBRFTextProperty *v31;
  void *v32;
  _SFPBRFVisualProperty *v33;
  _SFPBRFSummaryItemShortNumberCardSection *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBRFSummaryItemShortNumberCardSection;
  v5 = -[_SFPBRFSummaryItemShortNumberCardSection init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("number"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSummaryItemShortNumberCardSection setNumber:](v5, "setNumber:", v7);

      v4 = v40;
    }
    v39 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_2:](v5, "setText_2:", v9);

    }
    v38 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v10);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_1:](v5, "setText_1:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v46;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v46 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v18);
              -[_SFPBRFSummaryItemShortNumberCardSection addText_3:](v5, "addText_3:", v19);

            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v15);
      }

      v4 = v40;
      v10 = v36;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"), v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v42;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v42 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v25);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v26);
              -[_SFPBRFSummaryItemShortNumberCardSection addText_4:](v5, "addText_4:", v27);

            }
            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v23);
      }

      v4 = v40;
      v10 = v37;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text5"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v28);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_5:](v5, "setText_5:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text6"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v30);
      -[_SFPBRFSummaryItemShortNumberCardSection setText_6:](v5, "setText_6:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v32);
      -[_SFPBRFSummaryItemShortNumberCardSection setThumbnail:](v5, "setThumbnail:", v33);

    }
    v34 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)number
{
  return self->_number;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (void)setText_3s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)text_4s
{
  return self->_text_4s;
}

- (void)setText_4s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (_SFPBRFTextProperty)text_6
{
  return self->_text_6;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

@end
