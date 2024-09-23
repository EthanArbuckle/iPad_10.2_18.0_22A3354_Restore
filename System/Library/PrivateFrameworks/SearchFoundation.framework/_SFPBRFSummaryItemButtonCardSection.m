@implementation _SFPBRFSummaryItemButtonCardSection

- (_SFPBRFSummaryItemButtonCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSummaryItemButtonCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBButtonItem *v11;
  void *v12;
  _SFPBButtonItem *v13;
  void *v14;
  _SFPBButtonItem *v15;
  void *v16;
  _SFPBButtonItem *v17;
  void *v18;
  _SFPBButtonItem *v19;
  void *v20;
  _SFPBButtonItem *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
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
  _SFPBRFTextProperty *v39;
  void *v40;
  _SFPBRFTextProperty *v41;
  void *v42;
  _SFPBRFVisualProperty *v43;
  void *v44;
  _SFPBRFVisualProperty *v45;
  _SFPBRFSummaryItemButtonCardSection *v46;
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
  v5 = -[_SFPBRFSummaryItemButtonCardSection init](self, "init");
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
      -[_SFPBRFSummaryItemButtonCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBButtonItem initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFSummaryItemButtonCardSection setButton_1:](v5, "setButton_1:", v13);

    }
    objc_msgSend(v4, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBButtonItem initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFSummaryItemButtonCardSection setButton_2:](v5, "setButton_2:", v17);

    }
    objc_msgSend(v4, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBButtonItem initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBRFSummaryItemButtonCardSection setButton_3:](v5, "setButton_3:", v21);

    }
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v24);
          v29 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v26);
    }

    -[_SFPBRFSummaryItemButtonCardSection setText_2s:](v5, "setText_2s:", v23);
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "text", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          v37 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v34);
    }

    -[_SFPBRFSummaryItemButtonCardSection setText_3s:](v5, "setText_3s:", v31);
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRFTextProperty initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBRFSummaryItemButtonCardSection setText_4:](v5, "setText_4:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBRFVisualProperty initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBRFSummaryItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v45);

    }
    if (objc_msgSend(v4, "hasButtonItemsAreTrailing"))
      -[_SFPBRFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", objc_msgSend(v4, "buttonItemsAreTrailing"));
    v46 = v5;

  }
  return v5;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (void)setButton_1:(id)a3
{
  objc_storeStrong((id *)&self->_button_1, a3);
}

- (void)setButton_2:(id)a3
{
  objc_storeStrong((id *)&self->_button_2, a3);
}

- (void)setButton_3:(id)a3
{
  objc_storeStrong((id *)&self->_button_3, a3);
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

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  self->_buttonItemsAreTrailing = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemButtonCardSection text_2s](self, "text_2s");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  -[_SFPBRFSummaryItemButtonCardSection text_3s](self, "text_3s");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"))
    PBDataWriterWriteBOOLField();

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
  int v46;
  BOOL v47;
  int buttonItemsAreTrailing;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemButtonCardSection text_2s](self, "text_2s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_2s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection text_2s](self, "text_2s");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFSummaryItemButtonCardSection text_2s](self, "text_2s");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_2s");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemButtonCardSection text_3s](self, "text_3s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_3s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection text_3s](self, "text_3s");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFSummaryItemButtonCardSection text_3s](self, "text_3s");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_3s");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
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
  -[_SFPBRFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

LABEL_45:
      buttonItemsAreTrailing = self->_buttonItemsAreTrailing;
      v47 = buttonItemsAreTrailing == objc_msgSend(v4, "buttonItemsAreTrailing");
      goto LABEL_43;
    }
    v43 = (void *)v42;
    -[_SFPBRFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (v46)
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
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = -[_SFPBButtonItem hash](self->_button_1, "hash");
  v5 = -[_SFPBButtonItem hash](self->_button_2, "hash");
  v6 = -[_SFPBButtonItem hash](self->_button_3, "hash");
  v7 = -[NSArray hash](self->_text_2s, "hash");
  v8 = -[NSArray hash](self->_text_3s, "hash");
  v9 = -[_SFPBRFTextProperty hash](self->_text_4, "hash");
  v10 = -[_SFPBRFVisualProperty hash](self->_thumbnail, "hash");
  v11 = 2654435761;
  if (!self->_buttonItemsAreTrailing)
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_buttonItemsAreTrailing)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("buttonItemsAreTrailing"));

  }
  if (self->_button_1)
  {
    -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("button1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("button1"));

    }
  }
  if (self->_button_2)
  {
    -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("button2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("button2"));

    }
  }
  if (self->_button_3)
  {
    -[_SFPBRFSummaryItemButtonCardSection button](self, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("button3"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("button3"));

    }
  }
  if (self->_text_1)
  {
    -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("text1"));

    }
  }
  if (-[NSArray count](self->_text_2s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v18 = self->_text_2s;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("text2"));
  }
  if (-[NSArray count](self->_text_3s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v26 = self->_text_3s;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v40);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v25, "addObject:", v31);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v32);

          }
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("text3"));
  }
  if (self->_text_4)
  {
    -[_SFPBRFSummaryItemButtonCardSection text](self, "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("text4"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("text4"));

    }
  }
  if (self->_thumbnail)
  {
    -[_SFPBRFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("thumbnail"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSummaryItemButtonCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSummaryItemButtonCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSummaryItemButtonCardSection *v5;
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
    self = -[_SFPBRFSummaryItemButtonCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSummaryItemButtonCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSummaryItemButtonCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  uint64_t v8;
  _SFPBButtonItem *v9;
  uint64_t v10;
  _SFPBButtonItem *v11;
  uint64_t v12;
  _SFPBButtonItem *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _SFPBRFTextProperty *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _SFPBRFTextProperty *v29;
  void *v30;
  _SFPBRFTextProperty *v31;
  void *v32;
  _SFPBRFVisualProperty *v33;
  void *v34;
  _SFPBRFSummaryItemButtonCardSection *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_SFPBRFSummaryItemButtonCardSection;
  v5 = -[_SFPBRFSummaryItemButtonCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSummaryItemButtonCardSection setText_1:](v5, "setText_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button1"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v8);
      -[_SFPBRFSummaryItemButtonCardSection setButton_1:](v5, "setButton_1:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button2"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v10);
      -[_SFPBRFSummaryItemButtonCardSection setButton_2:](v5, "setButton_2:", v11);

    }
    v39 = (void *)v10;
    v40 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button3"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v12);
      -[_SFPBRFSummaryItemButtonCardSection setButton_3:](v5, "setButton_3:", v13);

    }
    v38 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = v6;
    v37 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v47;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v47 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v20);
              -[_SFPBRFSummaryItemButtonCardSection addText_2:](v5, "addText_2:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v17);
      }

      v6 = v41;
      v14 = v37;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v43;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v27);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v28);
              -[_SFPBRFSummaryItemButtonCardSection addText_3:](v5, "addText_3:", v29);

            }
            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        }
        while (v25);
      }

      v6 = v41;
      v14 = v37;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v30);
      -[_SFPBRFSummaryItemButtonCardSection setText_4:](v5, "setText_4:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v32);
      -[_SFPBRFSummaryItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonItemsAreTrailing"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", objc_msgSend(v34, "BOOLValue"));
    v35 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBButtonItem)button_1
{
  return self->_button_1;
}

- (_SFPBButtonItem)button_2
{
  return self->_button_2;
}

- (_SFPBButtonItem)button_3
{
  return self->_button_3;
}

- (NSArray)text_2s
{
  return self->_text_2s;
}

- (void)setText_2s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (void)setText_3s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
