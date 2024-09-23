@implementation _SFPBRFFactItemButtonCardSection

- (_SFPBRFFactItemButtonCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFFactItemButtonCardSection *v5;
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
  _SFPBRFTextProperty *v39;
  void *v40;
  _SFPBRFTextProperty *v41;
  void *v42;
  _SFPBRFVisualProperty *v43;
  void *v44;
  _SFPBRFVisualProperty *v45;
  void *v46;
  _SFPBRFVisualProperty *v47;
  void *v48;
  _SFPBRFVisualProperty *v49;
  _SFPBRFFactItemButtonCardSection *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFFactItemButtonCardSection init](self, "init");
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
      -[_SFPBRFFactItemButtonCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBButtonItem initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFFactItemButtonCardSection setButton_1:](v5, "setButton_1:", v13);

    }
    objc_msgSend(v4, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBButtonItem initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFFactItemButtonCardSection setButton_2:](v5, "setButton_2:", v17);

    }
    objc_msgSend(v4, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBButtonItem initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBRFFactItemButtonCardSection setButton_3:](v5, "setButton_3:", v21);

    }
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_SFPBRFTextProperty initWithFacade:](v23, "initWithFacade:", v24);
      -[_SFPBRFFactItemButtonCardSection setText_2:](v5, "setText_2:", v25);

    }
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBRFTextProperty initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBRFFactItemButtonCardSection setText_3:](v5, "setText_3:", v29);

    }
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v32);
          v37 = -[_SFPBRFTextProperty initWithFacade:]([_SFPBRFTextProperty alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v34);
    }

    -[_SFPBRFFactItemButtonCardSection setText_4s:](v5, "setText_4s:", v31);
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRFTextProperty initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBRFFactItemButtonCardSection setText_5:](v5, "setText_5:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBRFVisualProperty initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBRFFactItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v45);

    }
    objc_msgSend(v4, "thumbnail2");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail2");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_SFPBRFVisualProperty initWithFacade:](v47, "initWithFacade:", v48);
      -[_SFPBRFFactItemButtonCardSection setThumbnail2:](v5, "setThumbnail2:", v49);

    }
    if (objc_msgSend(v4, "hasButtonItemsAreBottom"))
      -[_SFPBRFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", objc_msgSend(v4, "buttonItemsAreBottom"));
    v50 = v5;

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
  objc_storeStrong((id *)&self->_text_5, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setThumbnail2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail2, a3);
}

- (void)setButtonItemsAreBottom:(BOOL)a3
{
  self->_buttonItemsAreBottom = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemButtonCardSectionReadFrom(self, (uint64_t)a3);
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection text_4s](self, "text_4s");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom"))
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
  BOOL v57;
  int buttonItemsAreBottom;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFFactItemButtonCardSection button](self, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFFactItemButtonCardSection button](self, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection button](self, "button");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFFactItemButtonCardSection button](self, "button");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection text_4s](self, "text_4s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_4s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection text_4s](self, "text_4s");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBRFFactItemButtonCardSection text_4s](self, "text_4s");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_4s");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection text](self, "text");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBRFFactItemButtonCardSection thumbnail](self, "thumbnail");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBRFFactItemButtonCardSection thumbnail](self, "thumbnail");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBRFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
    v52 = objc_claimAutoreleasedReturnValue();
    if (!v52)
    {

LABEL_55:
      buttonItemsAreBottom = self->_buttonItemsAreBottom;
      v57 = buttonItemsAreBottom == objc_msgSend(v4, "buttonItemsAreBottom");
      goto LABEL_53;
    }
    v53 = (void *)v52;
    -[_SFPBRFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail2");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (v56)
      goto LABEL_55;
  }
  else
  {
LABEL_51:

  }
LABEL_52:
  v57 = 0;
LABEL_53:

  return v57;
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
  uint64_t v13;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = -[_SFPBButtonItem hash](self->_button_1, "hash");
  v5 = -[_SFPBButtonItem hash](self->_button_2, "hash");
  v6 = -[_SFPBButtonItem hash](self->_button_3, "hash");
  v7 = -[_SFPBRFTextProperty hash](self->_text_2, "hash");
  v8 = -[_SFPBRFTextProperty hash](self->_text_3, "hash");
  v9 = -[NSArray hash](self->_text_4s, "hash");
  v10 = -[_SFPBRFTextProperty hash](self->_text_5, "hash");
  v11 = -[_SFPBRFVisualProperty hash](self->_thumbnail, "hash");
  v12 = -[_SFPBRFVisualProperty hash](self->_thumbnail2, "hash");
  v13 = 2654435761;
  if (!self->_buttonItemsAreBottom)
    v13 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
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
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_buttonItemsAreBottom)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("buttonItemsAreBottom"));

  }
  if (self->_button_1)
  {
    -[_SFPBRFFactItemButtonCardSection button](self, "button");
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
    -[_SFPBRFFactItemButtonCardSection button](self, "button");
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
    -[_SFPBRFFactItemButtonCardSection button](self, "button");
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
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
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
  if (self->_text_2)
  {
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("text2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("text2"));

    }
  }
  if (self->_text_3)
  {
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("text3"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("text3"));

    }
  }
  if (-[NSArray count](self->_text_4s, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = self->_text_4s;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v41);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(v23, "addObject:", v29);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v30);

          }
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("text4"));
  }
  if (self->_text_5)
  {
    -[_SFPBRFFactItemButtonCardSection text](self, "text");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("text5"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("text5"));

    }
  }
  if (self->_thumbnail)
  {
    -[_SFPBRFFactItemButtonCardSection thumbnail](self, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("thumbnail"));

    }
  }
  if (self->_thumbnail2)
  {
    -[_SFPBRFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("thumbnail2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("thumbnail2"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFFactItemButtonCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFFactItemButtonCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFFactItemButtonCardSection *v5;
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
    self = -[_SFPBRFFactItemButtonCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFFactItemButtonCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFFactItemButtonCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  uint64_t v8;
  _SFPBButtonItem *v9;
  uint64_t v10;
  _SFPBButtonItem *v11;
  uint64_t v12;
  _SFPBButtonItem *v13;
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
  _SFPBRFTextProperty *v27;
  void *v28;
  _SFPBRFVisualProperty *v29;
  void *v30;
  _SFPBRFVisualProperty *v31;
  void *v32;
  _SFPBRFFactItemButtonCardSection *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_SFPBRFFactItemButtonCardSection;
  v5 = -[_SFPBRFFactItemButtonCardSection init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFFactItemButtonCardSection setText_1:](v5, "setText_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button1"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v8);
      -[_SFPBRFFactItemButtonCardSection setButton_1:](v5, "setButton_1:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button2"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v10);
      -[_SFPBRFFactItemButtonCardSection setButton_2:](v5, "setButton_2:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button3"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v12);
      -[_SFPBRFFactItemButtonCardSection setButton_3:](v5, "setButton_3:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v14);
      -[_SFPBRFFactItemButtonCardSection setText_2:](v5, "setText_2:", v15);

    }
    v38 = (void *)v12;
    v39 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v16);
      -[_SFPBRFFactItemButtonCardSection setText_3:](v5, "setText_3:", v17);

    }
    v36 = (void *)v16;
    v37 = (void *)v14;
    v40 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text4"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v6;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v42;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v24);
              -[_SFPBRFFactItemButtonCardSection addText_4:](v5, "addText_4:", v25);

            }
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v21);
      }

      v6 = v35;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text5"), v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v26);
      -[_SFPBRFFactItemButtonCardSection setText_5:](v5, "setText_5:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v28);
      -[_SFPBRFFactItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail2"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v30);
      -[_SFPBRFFactItemButtonCardSection setThumbnail2:](v5, "setThumbnail2:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonItemsAreBottom"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", objc_msgSend(v32, "BOOLValue"));
    v33 = v5;

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRFVisualProperty)thumbnail2
{
  return self->_thumbnail2;
}

- (BOOL)buttonItemsAreBottom
{
  return self->_buttonItemsAreBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail2, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
