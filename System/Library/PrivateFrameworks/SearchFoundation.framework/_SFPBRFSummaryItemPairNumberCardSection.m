@implementation _SFPBRFSummaryItemPairNumberCardSection

- (_SFPBRFSummaryItemPairNumberCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSummaryItemPairNumberCardSection *v5;
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
  _SFPBRFTextProperty *v19;
  void *v20;
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
  uint64_t i;
  _SFPBRFTextProperty *v37;
  void *v38;
  _SFPBRFVisualProperty *v39;
  void *v40;
  _SFPBRFVisualProperty *v41;
  void *v42;
  _SFPBRFVisualProperty *v43;
  void *v44;
  _SFPBRFVisualProperty *v45;
  void *v46;
  _SFPBRFTextProperty *v47;
  void *v48;
  _SFPBRFTextProperty *v49;
  void *v50;
  _SFPBRFTextProperty *v51;
  void *v52;
  _SFPBRFTextProperty *v53;
  void *v54;
  _SFPBButtonItem *v55;
  void *v56;
  _SFPBButtonItem *v57;
  _SFPBRFSummaryItemPairNumberCardSection *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFSummaryItemPairNumberCardSection init](self, "init");
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
      -[_SFPBRFSummaryItemPairNumberCardSection setNumber_1:](v5, "setNumber_1:", v9);

    }
    objc_msgSend(v4, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "number");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFSummaryItemPairNumberCardSection setNumber_2:](v5, "setNumber_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRFTextProperty initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_1:](v5, "setText_1:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBRFTextProperty initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_2:](v5, "setText_2:", v21);

    }
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_SFPBRFTextProperty initWithFacade:](v23, "initWithFacade:", v24);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_3:](v5, "setText_3:", v25);

    }
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBRFTextProperty initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_4:](v5, "setText_4:", v29);

    }
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v4, "text", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v61 != v35)
            objc_enumerationMutation(v32);
          v37 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v34);
    }

    -[_SFPBRFSummaryItemPairNumberCardSection setText_5s:](v5, "setText_5s:", v31);
    objc_msgSend(v4, "thumbnail");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRFVisualProperty initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBRFSummaryItemPairNumberCardSection setThumbnail_1:](v5, "setThumbnail_1:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBRFVisualProperty initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBRFSummaryItemPairNumberCardSection setThumbnail_2:](v5, "setThumbnail_2:", v45);

    }
    objc_msgSend(v4, "text");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_SFPBRFTextProperty initWithFacade:](v47, "initWithFacade:", v48);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_6:](v5, "setText_6:", v49);

    }
    objc_msgSend(v4, "text");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[_SFPBRFTextProperty initWithFacade:](v51, "initWithFacade:", v52);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_7:](v5, "setText_7:", v53);

    }
    objc_msgSend(v4, "button");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_SFPBButtonItem initWithFacade:](v55, "initWithFacade:", v56);
      -[_SFPBRFSummaryItemPairNumberCardSection setButton_1:](v5, "setButton_1:", v57);

    }
    v58 = v5;

  }
  return v5;
}

- (void)setNumber_1:(id)a3
{
  objc_storeStrong((id *)&self->_number_1, a3);
}

- (void)setNumber_2:(id)a3
{
  objc_storeStrong((id *)&self->_number_2, a3);
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
  objc_storeStrong((id *)&self->_text_4, a3);
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

- (void)setThumbnail_1:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_1, a3);
}

- (void)setThumbnail_2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_2, a3);
}

- (void)setText_6:(id)a3
{
  objc_storeStrong((id *)&self->_text_6, a3);
}

- (void)setText_7:(id)a3
{
  objc_storeStrong((id *)&self->_text_7, a3);
}

- (void)setButton_1:(id)a3
{
  objc_storeStrong((id *)&self->_button_1, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemPairNumberCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text_5s](self, "text_5s");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairNumberCardSection button](self, "button");
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
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  BOOL v67;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "number");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text_5s](self, "text_5s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_5s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text_5s](self, "text_5s");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBRFSummaryItemPairNumberCardSection text_5s](self, "text_5s");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_5s");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairNumberCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFSummaryItemPairNumberCardSection button](self, "button");
    v62 = objc_claimAutoreleasedReturnValue();
    if (!v62)
    {

LABEL_65:
      v67 = 1;
      goto LABEL_63;
    }
    v63 = (void *)v62;
    -[_SFPBRFSummaryItemPairNumberCardSection button](self, "button");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if ((v66 & 1) != 0)
      goto LABEL_65;
  }
  else
  {
LABEL_61:

  }
LABEL_62:
  v67 = 0;
LABEL_63:

  return v67;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = -[_SFPBRFTextProperty hash](self->_number_1, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_number_2, "hash") ^ v3;
  v5 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBRFTextProperty hash](self->_text_2, "hash");
  v7 = -[_SFPBRFTextProperty hash](self->_text_3, "hash");
  v8 = v7 ^ -[_SFPBRFTextProperty hash](self->_text_4, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_text_5s, "hash");
  v10 = -[_SFPBRFVisualProperty hash](self->_thumbnail_1, "hash");
  v11 = v10 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail_2, "hash");
  v12 = v11 ^ -[_SFPBRFTextProperty hash](self->_text_6, "hash");
  v13 = v9 ^ v12 ^ -[_SFPBRFTextProperty hash](self->_text_7, "hash");
  return v13 ^ -[_SFPBButtonItem hash](self->_button_1, "hash");
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_button_1)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection button](self, "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("button1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("button1"));

    }
  }
  if (self->_number_1)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("number1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("number1"));

    }
  }
  if (self->_number_2)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection number](self, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("number2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("number2"));

    }
  }
  if (self->_text_1)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("text1"));

    }
  }
  if (self->_text_2)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("text2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("text2"));

    }
  }
  if (self->_text_3)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("text3"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("text3"));

    }
  }
  if (self->_text_4)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("text4"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("text4"));

    }
  }
  if (-[NSArray count](self->_text_5s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v26 = self->_text_5s;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v46);
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
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("text5"));
  }
  if (self->_text_6)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("text6"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("text6"));

    }
  }
  if (self->_text_7)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection text](self, "text");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("text7"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("text7"));

    }
  }
  if (self->_thumbnail_1)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("thumbnail1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("thumbnail1"));

    }
  }
  if (self->_thumbnail_2)
  {
    -[_SFPBRFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("thumbnail2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("thumbnail2"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSummaryItemPairNumberCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSummaryItemPairNumberCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSummaryItemPairNumberCardSection *v5;
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
    self = -[_SFPBRFSummaryItemPairNumberCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSummaryItemPairNumberCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSummaryItemPairNumberCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  uint64_t v8;
  _SFPBRFTextProperty *v9;
  uint64_t v10;
  _SFPBRFTextProperty *v11;
  uint64_t v12;
  _SFPBRFTextProperty *v13;
  uint64_t v14;
  _SFPBRFTextProperty *v15;
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
  _SFPBRFVisualProperty *v27;
  void *v28;
  _SFPBRFVisualProperty *v29;
  void *v30;
  _SFPBRFTextProperty *v31;
  void *v32;
  _SFPBRFTextProperty *v33;
  void *v34;
  _SFPBButtonItem *v35;
  _SFPBRFSummaryItemPairNumberCardSection *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)_SFPBRFSummaryItemPairNumberCardSection;
  v5 = -[_SFPBRFSummaryItemPairNumberCardSection init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("number1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSummaryItemPairNumberCardSection setNumber_1:](v5, "setNumber_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("number2"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFSummaryItemPairNumberCardSection setNumber_2:](v5, "setNumber_2:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v10);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_1:](v5, "setText_1:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v12);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v14);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_3:](v5, "setText_3:", v15);

    }
    v40 = (void *)v14;
    v41 = (void *)v12;
    v42 = (void *)v10;
    v43 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v16);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_4:](v5, "setText_4:", v17);

    }
    v39 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text5"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = v6;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v45;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v45 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v24);
              -[_SFPBRFSummaryItemPairNumberCardSection addText_5:](v5, "addText_5:", v25);

            }
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v21);
      }

      v6 = v38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail1"), v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v26);
      -[_SFPBRFSummaryItemPairNumberCardSection setThumbnail_1:](v5, "setThumbnail_1:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail2"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v28);
      -[_SFPBRFSummaryItemPairNumberCardSection setThumbnail_2:](v5, "setThumbnail_2:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text6"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v30);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_6:](v5, "setText_6:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text7"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v32);
      -[_SFPBRFSummaryItemPairNumberCardSection setText_7:](v5, "setText_7:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button1"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v34);
      -[_SFPBRFSummaryItemPairNumberCardSection setButton_1:](v5, "setButton_1:", v35);

    }
    v36 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)number_1
{
  return self->_number_1;
}

- (_SFPBRFTextProperty)number_2
{
  return self->_number_2;
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

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (NSArray)text_5s
{
  return self->_text_5s;
}

- (void)setText_5s:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_SFPBRFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
}

- (_SFPBRFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (_SFPBRFTextProperty)text_6
{
  return self->_text_6;
}

- (_SFPBRFTextProperty)text_7
{
  return self->_text_7;
}

- (_SFPBButtonItem)button_1
{
  return self->_button_1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_5s, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number_2, 0);
  objc_storeStrong((id *)&self->_number_1, 0);
}

@end
