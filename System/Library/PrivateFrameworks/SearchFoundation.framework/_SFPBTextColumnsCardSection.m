@implementation _SFPBTextColumnsCardSection

- (_SFPBTextColumnsCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBTextColumnsCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBPunchout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _SFPBColor *v21;
  void *v22;
  _SFPBColor *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  _SFPBTextColumn *v33;
  _SFPBTextColumnsCardSection *v34;
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
  v4 = a3;
  v5 = -[_SFPBTextColumnsCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v10);
    }

    -[_SFPBTextColumnsCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTextColumnsCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTextColumnsCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBTextColumnsCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBTextColumnsCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBTextColumnsCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTextColumnsCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBTextColumnsCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBTextColumnsCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTextColumnsCardSection setTitle:](v5, "setTitle:", v25);

    }
    if (objc_msgSend(v4, "hasTitleWeight"))
      -[_SFPBTextColumnsCardSection setTitleWeight:](v5, "setTitleWeight:", objc_msgSend(v4, "titleWeight"));
    objc_msgSend(v4, "columns");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "columns", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(v28);
          v33 = -[_SFPBTextColumn initWithFacade:]([_SFPBTextColumn alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v30);
    }

    -[_SFPBTextColumnsCardSection setColumns:](v5, "setColumns:", v27);
    v34 = v5;

  }
  return v5;
}

- (void)setPunchoutOptions:(id)a3
{
  NSArray *v4;
  NSArray *punchoutOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  punchoutOptions = self->_punchoutOptions;
  self->_punchoutOptions = v4;

}

- (void)clearPunchoutOptions
{
  -[NSArray removeAllObjects](self->_punchoutOptions, "removeAllObjects");
}

- (void)addPunchoutOptions:(id)a3
{
  id v4;
  NSArray *punchoutOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  v8 = v4;
  if (!punchoutOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  -[NSArray addObject:](punchoutOptions, "addObject:", v4);

}

- (unint64_t)punchoutOptionsCount
{
  return -[NSArray count](self->_punchoutOptions, "count");
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_punchoutOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setPunchoutPickerTitle:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerTitle = self->_punchoutPickerTitle;
  self->_punchoutPickerTitle = v4;

}

- (void)setPunchoutPickerDismissText:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerDismissText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerDismissText = self->_punchoutPickerDismissText;
  self->_punchoutPickerDismissText = v4;

}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_canBeHidden = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_hasTopPadding = a3;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_hasBottomPadding = a3;
}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  type = self->_type;
  self->_type = v4;

}

- (void)setSeparatorStyle:(int)a3
{
  self->_separatorStyle = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setTitleWeight:(unsigned int)a3
{
  self->_titleWeight = a3;
}

- (void)setColumns:(id)a3
{
  NSArray *v4;
  NSArray *columns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  columns = self->_columns;
  self->_columns = v4;

}

- (void)clearColumns
{
  -[NSArray removeAllObjects](self->_columns, "removeAllObjects");
}

- (void)addColumns:(id)a3
{
  id v4;
  NSArray *columns;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  columns = self->_columns;
  v8 = v4;
  if (!columns)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_columns;
    self->_columns = v6;

    v4 = v8;
    columns = self->_columns;
  }
  -[NSArray addObject:](columns, "addObject:", v4);

}

- (unint64_t)columnsCount
{
  return -[NSArray count](self->_columns, "count");
}

- (id)columnsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTextColumnsCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  -[_SFPBTextColumnsCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  -[_SFPBTextColumnsCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBTextColumnsCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBTextColumnsCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTextColumnsCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTextColumnsCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBTextColumnsCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBTextColumnsCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBTextColumnsCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBTextColumnsCardSection title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  if (-[_SFPBTextColumnsCardSection titleWeight](self, "titleWeight"))
    PBDataWriterWriteUint32Field();
  -[_SFPBTextColumnsCardSection columns](self, "columns");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

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
  int canBeHidden;
  int hasTopPadding;
  int hasBottomPadding;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int separatorStyle;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  unsigned int titleWeight;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  BOOL v47;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[_SFPBTextColumnsCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBTextColumnsCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBTextColumnsCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBTextColumnsCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBTextColumnsCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBTextColumnsCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBTextColumnsCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBTextColumnsCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBTextColumnsCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_42;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_42;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_42;
  -[_SFPBTextColumnsCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBTextColumnsCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBTextColumnsCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_42;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_42;
  -[_SFPBTextColumnsCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBTextColumnsCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBTextColumnsCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_42;
  }
  else
  {

  }
  -[_SFPBTextColumnsCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_SFPBTextColumnsCardSection title](self, "title");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBTextColumnsCardSection title](self, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_42;
  }
  else
  {

  }
  titleWeight = self->_titleWeight;
  if (titleWeight != objc_msgSend(v4, "titleWeight"))
    goto LABEL_42;
  -[_SFPBTextColumnsCardSection columns](self, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  -[_SFPBTextColumnsCardSection columns](self, "columns");
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {

LABEL_45:
    v47 = 1;
    goto LABEL_43;
  }
  v43 = (void *)v42;
  -[_SFPBTextColumnsCardSection columns](self, "columns");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v44, "isEqual:", v45);

  if ((v46 & 1) != 0)
    goto LABEL_45;
LABEL_42:
  v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v14;

  v14 = -[NSArray hash](self->_punchoutOptions, "hash");
  v3 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v4 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasTopPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  if (self->_hasBottomPadding)
    v7 = 2654435761;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_type, "hash");
  v9 = 2654435761 * self->_separatorStyle;
  v10 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v11 = v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ -[NSString hash](self->_title, "hash") ^ (2654435761 * self->_titleWeight);
  return v11 ^ v12 ^ -[NSArray hash](self->_columns, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBTextColumnsCardSection backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundColor"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTextColumnsCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (-[NSArray count](self->_columns, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = self->_columns;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("columns"));
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTextColumnsCardSection hasBottomPadding](self, "hasBottomPadding"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTextColumnsCardSection hasTopPadding](self, "hasTopPadding"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasTopPadding"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = self->_punchoutOptions;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v18, "addObject:", v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBTextColumnsCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBTextColumnsCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v30 = -[_SFPBTextColumnsCardSection separatorStyle](self, "separatorStyle");
    if (v30 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = *(&off_1E40421B0 + v30);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("separatorStyle"));

  }
  if (self->_title)
  {
    -[_SFPBTextColumnsCardSection title](self, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("title"));

  }
  if (self->_titleWeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBTextColumnsCardSection titleWeight](self, "titleWeight"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("titleWeight"));

  }
  if (self->_type)
  {
    -[_SFPBTextColumnsCardSection type](self, "type");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTextColumnsCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTextColumnsCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTextColumnsCardSection *v5;
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
    self = -[_SFPBTextColumnsCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTextColumnsCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTextColumnsCardSection *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _SFPBPunchout *v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  _SFPBColor *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  _SFPBTextColumn *v38;
  _SFPBTextColumnsCardSection *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)_SFPBTextColumnsCardSection;
  v5 = -[_SFPBTextColumnsCardSection init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v56 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBTextColumnsCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBTextColumnsCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBTextColumnsCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnsCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnsCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnsCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBTextColumnsCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnsCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v23;
      v26 = v16;
      v27 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBTextColumnsCardSection setBackgroundColor:](v5, "setBackgroundColor:", v27);

      v16 = v26;
      v23 = v25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SFPBTextColumnsCardSection setTitle:](v5, "setTitle:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleWeight"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTextColumnsCardSection setTitleWeight:](v5, "setTitleWeight:", objc_msgSend(v30, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("columns"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v30;
      v42 = v23;
      v43 = v14;
      v44 = v6;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v52 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = -[_SFPBTextColumn initWithDictionary:]([_SFPBTextColumn alloc], "initWithDictionary:", v37);
              -[_SFPBTextColumnsCardSection addColumns:](v5, "addColumns:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        }
        while (v34);
      }

      v14 = v43;
      v6 = v44;
      v23 = v42;
      v30 = v41;
    }
    v39 = v5;

  }
  return v5;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (NSString)type
{
  return self->_type;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)title
{
  return self->_title;
}

- (unsigned)titleWeight
{
  return self->_titleWeight;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
