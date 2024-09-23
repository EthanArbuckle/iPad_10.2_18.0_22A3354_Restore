@implementation _SFPBTableHeaderRowCardSection

- (_SFPBTableHeaderRowCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBTableHeaderRowCardSection *v5;
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
  _SFPBTableAlignmentSchema *v27;
  void *v28;
  _SFPBTableAlignmentSchema *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  _SFPBFormattedText *v37;
  void *v38;
  void *v39;
  _SFPBTableHeaderRowCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBTableHeaderRowCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v10);
    }

    -[_SFPBTableHeaderRowCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableHeaderRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableHeaderRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBTableHeaderRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBTableHeaderRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBTableHeaderRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableHeaderRowCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBTableHeaderRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBTableHeaderRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "tableIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "tableIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableHeaderRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v25);

    }
    objc_msgSend(v4, "alignmentSchema");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBTableAlignmentSchema alloc];
      objc_msgSend(v4, "alignmentSchema");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBTableAlignmentSchema initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBTableHeaderRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v29);

    }
    objc_msgSend(v4, "data");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "data", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v32);
          v37 = -[_SFPBFormattedText initWithFacade:]([_SFPBFormattedText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v34);
    }

    -[_SFPBTableHeaderRowCardSection setDatas:](v5, "setDatas:", v31);
    if (objc_msgSend(v4, "hasIsSubHeader"))
      -[_SFPBTableHeaderRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", objc_msgSend(v4, "isSubHeader"));
    objc_msgSend(v4, "tabGroupIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "tabGroupIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableHeaderRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v39);

    }
    if (objc_msgSend(v4, "hasReducedRowHeight"))
      -[_SFPBTableHeaderRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", objc_msgSend(v4, "reducedRowHeight"));
    if (objc_msgSend(v4, "hasVerticalAlign"))
      -[_SFPBTableHeaderRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", objc_msgSend(v4, "verticalAlign"));
    if (objc_msgSend(v4, "hasAlignRowsToHeader"))
      -[_SFPBTableHeaderRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", objc_msgSend(v4, "alignRowsToHeader"));
    v40 = v5;

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

- (void)setTableIdentifier:(id)a3
{
  NSString *v4;
  NSString *tableIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tableIdentifier = self->_tableIdentifier;
  self->_tableIdentifier = v4;

}

- (void)setAlignmentSchema:(id)a3
{
  objc_storeStrong((id *)&self->_alignmentSchema, a3);
}

- (void)setData:(id)a3
{
  NSArray *v4;
  NSArray *datas;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  datas = self->_datas;
  self->_datas = v4;

}

- (void)clearData
{
  -[NSArray removeAllObjects](self->_datas, "removeAllObjects");
}

- (void)addData:(id)a3
{
  id v4;
  NSArray *datas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  datas = self->_datas;
  v8 = v4;
  if (!datas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_datas;
    self->_datas = v6;

    v4 = v8;
    datas = self->_datas;
  }
  -[NSArray addObject:](datas, "addObject:", v4);

}

- (unint64_t)dataCount
{
  return -[NSArray count](self->_datas, "count");
}

- (id)dataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_datas, "objectAtIndexedSubscript:", a3);
}

- (void)setIsSubHeader:(BOOL)a3
{
  self->_isSubHeader = a3;
}

- (void)setTabGroupIdentifier:(id)a3
{
  NSString *v4;
  NSString *tabGroupIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tabGroupIdentifier = self->_tabGroupIdentifier;
  self->_tabGroupIdentifier = v4;

}

- (void)setReducedRowHeight:(BOOL)a3
{
  self->_reducedRowHeight = a3;
}

- (void)setVerticalAlign:(int)a3
{
  self->_verticalAlign = a3;
}

- (void)setAlignRowsToHeader:(BOOL)a3
{
  self->_alignRowsToHeader = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTableHeaderRowCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBTableHeaderRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  -[_SFPBTableHeaderRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBTableHeaderRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBTableHeaderRowCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTableHeaderRowCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTableHeaderRowCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBTableHeaderRowCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBTableHeaderRowCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBTableHeaderRowCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBTableHeaderRowCardSection tableIdentifier](self, "tableIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBTableHeaderRowCardSection alignmentSchema](self, "alignmentSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBTableHeaderRowCardSection datas](self, "datas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

  if (-[_SFPBTableHeaderRowCardSection isSubHeader](self, "isSubHeader"))
    PBDataWriterWriteBOOLField();
  -[_SFPBTableHeaderRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteStringField();

  if (-[_SFPBTableHeaderRowCardSection reducedRowHeight](self, "reducedRowHeight"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTableHeaderRowCardSection verticalAlign](self, "verticalAlign"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBTableHeaderRowCardSection alignRowsToHeader](self, "alignRowsToHeader"))
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
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int isSubHeader;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  BOOL v57;
  int reducedRowHeight;
  int verticalAlign;
  int alignRowsToHeader;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[_SFPBTableHeaderRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBTableHeaderRowCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBTableHeaderRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBTableHeaderRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBTableHeaderRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBTableHeaderRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_52;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_52;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_52;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_52;
  -[_SFPBTableHeaderRowCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBTableHeaderRowCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_52;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_52;
  -[_SFPBTableHeaderRowCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBTableHeaderRowCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBTableHeaderRowCardSection tableIdentifier](self, "tableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection tableIdentifier](self, "tableIdentifier");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBTableHeaderRowCardSection tableIdentifier](self, "tableIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBTableHeaderRowCardSection alignmentSchema](self, "alignmentSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignmentSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection alignmentSchema](self, "alignmentSchema");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBTableHeaderRowCardSection alignmentSchema](self, "alignmentSchema");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignmentSchema");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBTableHeaderRowCardSection datas](self, "datas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBTableHeaderRowCardSection datas](self, "datas");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBTableHeaderRowCardSection datas](self, "datas");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datas");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_52;
  }
  else
  {

  }
  isSubHeader = self->_isSubHeader;
  if (isSubHeader != objc_msgSend(v4, "isSubHeader"))
    goto LABEL_52;
  -[_SFPBTableHeaderRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  -[_SFPBTableHeaderRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBTableHeaderRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_52;
  }
  else
  {

  }
  reducedRowHeight = self->_reducedRowHeight;
  if (reducedRowHeight == objc_msgSend(v4, "reducedRowHeight"))
  {
    verticalAlign = self->_verticalAlign;
    if (verticalAlign == objc_msgSend(v4, "verticalAlign"))
    {
      alignRowsToHeader = self->_alignRowsToHeader;
      v57 = alignRowsToHeader == objc_msgSend(v4, "alignRowsToHeader");
      goto LABEL_53;
    }
  }
LABEL_52:
  v57 = 0;
LABEL_53:

  return v57;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;

  v22 = -[NSArray hash](self->_punchoutOptions, "hash");
  v21 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v19 = v4;
  v20 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  v18 = v5;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_type, "hash");
  v8 = 2654435761 * self->_separatorStyle;
  v9 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v10 = -[NSString hash](self->_tableIdentifier, "hash");
  v11 = -[_SFPBTableAlignmentSchema hash](self->_alignmentSchema, "hash");
  v12 = -[NSArray hash](self->_datas, "hash");
  if (self->_isSubHeader)
    v13 = 2654435761;
  else
    v13 = 0;
  v14 = -[NSString hash](self->_tabGroupIdentifier, "hash");
  if (self->_reducedRowHeight)
    v15 = 2654435761;
  else
    v15 = 0;
  if (self->_alignRowsToHeader)
    v16 = 2654435761;
  else
    v16 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ (2654435761
                                                                                              * self->_verticalAlign) ^ v16;
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alignRowsToHeader)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableHeaderRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alignRowsToHeader"));

  }
  if (self->_alignmentSchema)
  {
    -[_SFPBTableHeaderRowCardSection alignmentSchema](self, "alignmentSchema");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alignmentSchema"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("alignmentSchema"));

    }
  }
  if (self->_backgroundColor)
  {
    -[_SFPBTableHeaderRowCardSection backgroundColor](self, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("backgroundColor"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableHeaderRowCardSection canBeHidden](self, "canBeHidden"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("canBeHidden"));

  }
  if (-[NSArray count](self->_datas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v13 = self->_datas;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v52 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("data"));
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableHeaderRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableHeaderRowCardSection hasTopPadding](self, "hasTopPadding"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("hasTopPadding"));

  }
  if (self->_isSubHeader)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableHeaderRowCardSection isSubHeader](self, "isSubHeader"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isSubHeader"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v24 = self->_punchoutOptions;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "dictionaryRepresentation");
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
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBTableHeaderRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBTableHeaderRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("punchoutPickerTitle"));

  }
  if (self->_reducedRowHeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableHeaderRowCardSection reducedRowHeight](self, "reducedRowHeight"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("reducedRowHeight"));

  }
  if (self->_separatorStyle)
  {
    v36 = -[_SFPBTableHeaderRowCardSection separatorStyle](self, "separatorStyle");
    if (v36 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = *(&off_1E40421B0 + v36);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("separatorStyle"));

  }
  if (self->_tabGroupIdentifier)
  {
    -[_SFPBTableHeaderRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("tabGroupIdentifier"));

  }
  if (self->_tableIdentifier)
  {
    -[_SFPBTableHeaderRowCardSection tableIdentifier](self, "tableIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("tableIdentifier"));

  }
  if (self->_type)
  {
    -[_SFPBTableHeaderRowCardSection type](self, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("type"));

  }
  if (self->_verticalAlign)
  {
    v44 = -[_SFPBTableHeaderRowCardSection verticalAlign](self, "verticalAlign");
    if ((v44 + 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = *(&off_1E40420E0 + (v44 + 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("verticalAlign"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTableHeaderRowCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTableHeaderRowCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTableHeaderRowCardSection *v5;
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
    self = -[_SFPBTableHeaderRowCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTableHeaderRowCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTableHeaderRowCardSection *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _SFPBPunchout *v14;
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
  uint64_t v25;
  _SFPBColor *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _SFPBTableAlignmentSchema *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  _SFPBFormattedText *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _SFPBTableHeaderRowCardSection *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)_SFPBTableHeaderRowCardSection;
  v5 = -[_SFPBTableHeaderRowCardSection init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v7 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v62 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v13);
              -[_SFPBTableHeaderRowCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        }
        while (v10);
      }

      v6 = v7;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[_SFPBTableHeaderRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBTableHeaderRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[_SFPBTableHeaderRowCardSection setType:](v5, "setType:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = (void *)v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v25);
      -[_SFPBTableHeaderRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)objc_msgSend(v27, "copy");
      -[_SFPBTableHeaderRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v28);

    }
    v50 = v19;
    v51 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignmentSchema"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[_SFPBTableAlignmentSchema initWithDictionary:]([_SFPBTableAlignmentSchema alloc], "initWithDictionary:", v29);
      -[_SFPBTableHeaderRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v30);

    }
    v48 = (void *)v29;
    v49 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = v15;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v58 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v37);
              -[_SFPBTableHeaderRowCardSection addData:](v5, "addData:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        }
        while (v34);
      }

      v15 = v47;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSubHeader"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", objc_msgSend(v39, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tabGroupIdentifier"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      -[_SFPBTableHeaderRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reducedRowHeight"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", objc_msgSend(v42, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalAlign"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", objc_msgSend(v43, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignRowsToHeader"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableHeaderRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", objc_msgSend(v44, "BOOLValue"));
    v45 = v5;

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

- (NSString)tableIdentifier
{
  return self->_tableIdentifier;
}

- (_SFPBTableAlignmentSchema)alignmentSchema
{
  return self->_alignmentSchema;
}

- (NSArray)datas
{
  return self->_datas;
}

- (void)setDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isSubHeader
{
  return self->_isSubHeader;
}

- (NSString)tabGroupIdentifier
{
  return self->_tabGroupIdentifier;
}

- (BOOL)reducedRowHeight
{
  return self->_reducedRowHeight;
}

- (int)verticalAlign
{
  return self->_verticalAlign;
}

- (BOOL)alignRowsToHeader
{
  return self->_alignRowsToHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_datas, 0);
  objc_storeStrong((id *)&self->_alignmentSchema, 0);
  objc_storeStrong((id *)&self->_tableIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
