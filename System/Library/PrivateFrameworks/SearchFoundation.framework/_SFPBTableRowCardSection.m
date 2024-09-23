@implementation _SFPBTableRowCardSection

- (_SFPBTableRowCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBTableRowCardSection *v5;
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
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  _SFPBRichText *v31;
  void *v32;
  void *v33;
  void *v34;
  _SFPBTableAlignmentSchema *v35;
  void *v36;
  _SFPBTableAlignmentSchema *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  _SFPBFormattedText *v45;
  void *v46;
  void *v47;
  _SFPBTableRowCardSection *v48;
  _SFPBTableRowCardSection *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBTableRowCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v60 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v10);
    }

    -[_SFPBTableRowCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBTableRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBTableRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBTableRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableRowCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBTableRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBTableRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "richData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v4, "richData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = -[_SFPBRichText initWithFacade:]([_SFPBRichText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v28);
    }

    -[_SFPBTableRowCardSection setRichDatas:](v5, "setRichDatas:", v25);
    objc_msgSend(v4, "tableIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "tableIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v33);

    }
    objc_msgSend(v4, "alignmentSchema");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBTableAlignmentSchema alloc];
      objc_msgSend(v4, "alignmentSchema");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBTableAlignmentSchema initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v37);

    }
    objc_msgSend(v4, "data");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v5;
    if (v38)
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v39 = 0;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v4, "data");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(v40);
          v45 = -[_SFPBFormattedText initWithFacade:]([_SFPBFormattedText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
          if (v45)
            objc_msgSend(v39, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v42);
    }

    v5 = v50;
    -[_SFPBTableRowCardSection setDatas:](v50, "setDatas:", v39);
    if (objc_msgSend(v4, "hasIsSubHeader"))
      -[_SFPBTableRowCardSection setIsSubHeader:](v50, "setIsSubHeader:", objc_msgSend(v4, "isSubHeader"));
    objc_msgSend(v4, "tabGroupIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v4, "tabGroupIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTableRowCardSection setTabGroupIdentifier:](v50, "setTabGroupIdentifier:", v47);

    }
    if (objc_msgSend(v4, "hasReducedRowHeight"))
      -[_SFPBTableRowCardSection setReducedRowHeight:](v50, "setReducedRowHeight:", objc_msgSend(v4, "reducedRowHeight"));
    if (objc_msgSend(v4, "hasVerticalAlign"))
      -[_SFPBTableRowCardSection setVerticalAlign:](v50, "setVerticalAlign:", objc_msgSend(v4, "verticalAlign"));
    if (objc_msgSend(v4, "hasAlignRowsToHeader"))
      -[_SFPBTableRowCardSection setAlignRowsToHeader:](v50, "setAlignRowsToHeader:", objc_msgSend(v4, "alignRowsToHeader"));
    v48 = v50;

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

- (void)setRichData:(id)a3
{
  NSArray *v4;
  NSArray *richDatas;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  richDatas = self->_richDatas;
  self->_richDatas = v4;

}

- (void)clearRichData
{
  -[NSArray removeAllObjects](self->_richDatas, "removeAllObjects");
}

- (void)addRichData:(id)a3
{
  id v4;
  NSArray *richDatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  richDatas = self->_richDatas;
  v8 = v4;
  if (!richDatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_richDatas;
    self->_richDatas = v6;

    v4 = v8;
    richDatas = self->_richDatas;
  }
  -[NSArray addObject:](richDatas, "addObject:", v4);

}

- (unint64_t)richDataCount
{
  return -[NSArray count](self->_richDatas, "count");
}

- (id)richDataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_richDatas, "objectAtIndexedSubscript:", a3);
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
  return _SFPBTableRowCardSectionReadFrom(self, (uint64_t)a3);
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBTableRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  -[_SFPBTableRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBTableRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBTableRowCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTableRowCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTableRowCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBTableRowCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBTableRowCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBTableRowCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBTableRowCardSection richDatas](self, "richDatas");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v16);
  }

  -[_SFPBTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteStringField();

  -[_SFPBTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBTableRowCardSection datas](self, "datas");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v23);
  }

  if (-[_SFPBTableRowCardSection isSubHeader](self, "isSubHeader"))
    PBDataWriterWriteBOOLField();
  -[_SFPBTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteStringField();

  if (-[_SFPBTableRowCardSection reducedRowHeight](self, "reducedRowHeight"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBTableRowCardSection verticalAlign](self, "verticalAlign"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader"))
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
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int isSubHeader;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  BOOL v62;
  int reducedRowHeight;
  int verticalAlign;
  int alignRowsToHeader;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  -[_SFPBTableRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBTableRowCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBTableRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBTableRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBTableRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBTableRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_57;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_57;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_57;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_57;
  -[_SFPBTableRowCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBTableRowCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_57;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_57;
  -[_SFPBTableRowCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBTableRowCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBTableRowCardSection richDatas](self, "richDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection richDatas](self, "richDatas");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBTableRowCardSection richDatas](self, "richDatas");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richDatas");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBTableRowCardSection tableIdentifier](self, "tableIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignmentSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBTableRowCardSection alignmentSchema](self, "alignmentSchema");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignmentSchema");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBTableRowCardSection datas](self, "datas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBTableRowCardSection datas](self, "datas");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_SFPBTableRowCardSection datas](self, "datas");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datas");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_57;
  }
  else
  {

  }
  isSubHeader = self->_isSubHeader;
  if (isSubHeader != objc_msgSend(v4, "isSubHeader"))
    goto LABEL_57;
  -[_SFPBTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_56:

    goto LABEL_57;
  }
  -[_SFPBTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_57;
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
      v62 = alignRowsToHeader == objc_msgSend(v4, "alignRowsToHeader");
      goto LABEL_58;
    }
  }
LABEL_57:
  v62 = 0;
LABEL_58:

  return v62;
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
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;

  v24 = -[NSArray hash](self->_punchoutOptions, "hash");
  v23 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v21 = v4;
  v22 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_type, "hash", v6, v5);
  v8 = 2654435761 * self->_separatorStyle;
  v9 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v10 = -[NSArray hash](self->_richDatas, "hash");
  v11 = -[NSString hash](self->_tableIdentifier, "hash");
  v12 = -[_SFPBTableAlignmentSchema hash](self->_alignmentSchema, "hash");
  v13 = -[NSArray hash](self->_datas, "hash");
  if (self->_isSubHeader)
    v14 = 2654435761;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_tabGroupIdentifier, "hash");
  if (self->_reducedRowHeight)
    v16 = 2654435761;
  else
    v16 = 0;
  if (self->_alignRowsToHeader)
    v17 = 2654435761;
  else
    v17 = 0;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ (2654435761 * self->_verticalAlign) ^ v17;
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
  void *v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alignRowsToHeader)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alignRowsToHeader"));

  }
  if (self->_alignmentSchema)
  {
    -[_SFPBTableRowCardSection alignmentSchema](self, "alignmentSchema");
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
    -[_SFPBTableRowCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableRowCardSection canBeHidden](self, "canBeHidden"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("canBeHidden"));

  }
  if (-[NSArray count](self->_datas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v13 = self->_datas;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "dictionaryRepresentation");
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
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("data"));
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableRowCardSection hasTopPadding](self, "hasTopPadding"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("hasTopPadding"));

  }
  if (self->_isSubHeader)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableRowCardSection isSubHeader](self, "isSubHeader"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isSubHeader"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v24 = self->_punchoutOptions;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v60 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "dictionaryRepresentation");
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
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBTableRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBTableRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("punchoutPickerTitle"));

  }
  if (self->_reducedRowHeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTableRowCardSection reducedRowHeight](self, "reducedRowHeight"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("reducedRowHeight"));

  }
  if (-[NSArray count](self->_richDatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v37 = self->_richDatas;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v56 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v36, "addObject:", v42);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v43);

          }
        }
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      }
      while (v39);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("richData"));
  }
  if (self->_separatorStyle)
  {
    v44 = -[_SFPBTableRowCardSection separatorStyle](self, "separatorStyle");
    if (v44 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = *(&off_1E40421B0 + v44);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("separatorStyle"));

  }
  if (self->_tabGroupIdentifier)
  {
    -[_SFPBTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("tabGroupIdentifier"));

  }
  if (self->_tableIdentifier)
  {
    -[_SFPBTableRowCardSection tableIdentifier](self, "tableIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("tableIdentifier"));

  }
  if (self->_type)
  {
    -[_SFPBTableRowCardSection type](self, "type");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("type"));

  }
  if (self->_verticalAlign)
  {
    v52 = -[_SFPBTableRowCardSection verticalAlign](self, "verticalAlign");
    if ((v52 + 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = *(&off_1E40420E0 + (v52 + 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("verticalAlign"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTableRowCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTableRowCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTableRowCardSection *v5;
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
    self = -[_SFPBTableRowCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTableRowCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTableRowCardSection *v5;
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
  _SFPBColor *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  _SFPBRichText *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _SFPBTableAlignmentSchema *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  _SFPBFormattedText *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _SFPBTableRowCardSection *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)_SFPBTableRowCardSection;
  v5 = -[_SFPBTableRowCardSection init](&v79, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v76 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBTableRowCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
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
      -[_SFPBTableRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBTableRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBTableRowCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBTableRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richData"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v26;
    v58 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v14;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v28 = v26;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v72 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v33);
              -[_SFPBTableRowCardSection addRichData:](v5, "addRichData:", v34);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
        }
        while (v30);
      }

      v14 = v27;
      v16 = v58;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(v35, "copy");
      -[_SFPBTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignmentSchema"));
    v37 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[_SFPBTableAlignmentSchema initWithDictionary:]([_SFPBTableAlignmentSchema alloc], "initWithDictionary:", v37);
      -[_SFPBTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v38);

    }
    v56 = (void *)v37;
    v57 = v35;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = v14;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v40 = v39;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v68;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v68 != v43)
              objc_enumerationMutation(v40);
            v45 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v45);
              -[_SFPBTableRowCardSection addData:](v5, "addData:", v46);

            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
        }
        while (v42);
      }

      v16 = v58;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSubHeader"), v55);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", objc_msgSend(v47, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tabGroupIdentifier"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = (void *)objc_msgSend(v48, "copy");
      -[_SFPBTableRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reducedRowHeight"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", objc_msgSend(v50, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalAlign"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", objc_msgSend(v51, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignRowsToHeader"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTableRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", objc_msgSend(v52, "BOOLValue"));
    v53 = v5;

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

- (NSArray)richDatas
{
  return self->_richDatas;
}

- (void)setRichDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_storeStrong((id *)&self->_richDatas, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
