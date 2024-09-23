@implementation _SFPBLeadingTrailingCardSection

- (_SFPBLeadingTrailingCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBLeadingTrailingCardSection *v5;
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
  _SFPBCardSection *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  _SFPBCardSection *v39;
  _SFPBGraphicalFloat *v40;
  _SFPBGraphicalFloat *v41;
  _SFPBLeadingTrailingCardSection *v42;
  _SFPBLeadingTrailingCardSection *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBLeadingTrailingCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v10);
    }

    -[_SFPBLeadingTrailingCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBLeadingTrailingCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBLeadingTrailingCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBLeadingTrailingCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBLeadingTrailingCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBLeadingTrailingCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBLeadingTrailingCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBLeadingTrailingCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBLeadingTrailingCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "leadingCardSections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v4, "leadingCardSections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v50 != v29)
            objc_enumerationMutation(v26);
          v31 = -[_SFPBCardSection initWithFacade:]([_SFPBCardSection alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v28);
    }

    -[_SFPBLeadingTrailingCardSection setLeadingCardSections:](v5, "setLeadingCardSections:", v25);
    objc_msgSend(v4, "trailingCardSections");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v5;
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v4, "trailingCardSections");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(v34);
          v39 = -[_SFPBCardSection initWithFacade:]([_SFPBCardSection alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v36);
    }

    v5 = v44;
    -[_SFPBLeadingTrailingCardSection setTrailingCardSections:](v44, "setTrailingCardSections:", v33);
    if (objc_msgSend(v4, "hasLeadingToTrailingRatio"))
    {
      v40 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "leadingToTrailingRatio");
      v41 = -[_SFPBGraphicalFloat initWithCGFloat:](v40, "initWithCGFloat:");
      -[_SFPBLeadingTrailingCardSection setLeadingToTrailingRatio:](v44, "setLeadingToTrailingRatio:", v41);

    }
    v42 = v44;

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

- (void)setLeadingCardSections:(id)a3
{
  NSArray *v4;
  NSArray *leadingCardSections;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  leadingCardSections = self->_leadingCardSections;
  self->_leadingCardSections = v4;

}

- (void)clearLeadingCardSections
{
  -[NSArray removeAllObjects](self->_leadingCardSections, "removeAllObjects");
}

- (void)addLeadingCardSections:(id)a3
{
  id v4;
  NSArray *leadingCardSections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  leadingCardSections = self->_leadingCardSections;
  v8 = v4;
  if (!leadingCardSections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_leadingCardSections;
    self->_leadingCardSections = v6;

    v4 = v8;
    leadingCardSections = self->_leadingCardSections;
  }
  -[NSArray addObject:](leadingCardSections, "addObject:", v4);

}

- (unint64_t)leadingCardSectionsCount
{
  return -[NSArray count](self->_leadingCardSections, "count");
}

- (id)leadingCardSectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_leadingCardSections, "objectAtIndexedSubscript:", a3);
}

- (void)setTrailingCardSections:(id)a3
{
  NSArray *v4;
  NSArray *trailingCardSections;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  trailingCardSections = self->_trailingCardSections;
  self->_trailingCardSections = v4;

}

- (void)clearTrailingCardSections
{
  -[NSArray removeAllObjects](self->_trailingCardSections, "removeAllObjects");
}

- (void)addTrailingCardSections:(id)a3
{
  id v4;
  NSArray *trailingCardSections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  trailingCardSections = self->_trailingCardSections;
  v8 = v4;
  if (!trailingCardSections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trailingCardSections;
    self->_trailingCardSections = v6;

    v4 = v8;
    trailingCardSections = self->_trailingCardSections;
  }
  -[NSArray addObject:](trailingCardSections, "addObject:", v4);

}

- (unint64_t)trailingCardSectionsCount
{
  return -[NSArray count](self->_trailingCardSections, "count");
}

- (id)trailingCardSectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_trailingCardSections, "objectAtIndexedSubscript:", a3);
}

- (void)setLeadingToTrailingRatio:(id)a3
{
  objc_storeStrong((id *)&self->_leadingToTrailingRatio, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLeadingTrailingCardSectionReadFrom(self, (uint64_t)a3);
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBLeadingTrailingCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  -[_SFPBLeadingTrailingCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBLeadingTrailingCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBLeadingTrailingCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBLeadingTrailingCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBLeadingTrailingCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBLeadingTrailingCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBLeadingTrailingCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBLeadingTrailingCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }

  -[_SFPBLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }

  -[_SFPBLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
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
  char v50;
  BOOL v51;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  -[_SFPBLeadingTrailingCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBLeadingTrailingCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_46;
  }
  else
  {

  }
  -[_SFPBLeadingTrailingCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBLeadingTrailingCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_46;
  }
  else
  {

  }
  -[_SFPBLeadingTrailingCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBLeadingTrailingCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_46;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_46;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_46;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_46;
  -[_SFPBLeadingTrailingCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBLeadingTrailingCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_46;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_46;
  -[_SFPBLeadingTrailingCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBLeadingTrailingCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_46;
  }
  else
  {

  }
  -[_SFPBLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingCardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingCardSections");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_46;
  }
  else
  {

  }
  -[_SFPBLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingCardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_SFPBLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingCardSections");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_46;
  }
  else
  {

  }
  -[_SFPBLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingToTrailingRatio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  -[_SFPBLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
  v46 = objc_claimAutoreleasedReturnValue();
  if (!v46)
  {

LABEL_49:
    v51 = 1;
    goto LABEL_47;
  }
  v47 = (void *)v46;
  -[_SFPBLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingToTrailingRatio");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "isEqual:", v49);

  if ((v50 & 1) != 0)
    goto LABEL_49;
LABEL_46:
  v51 = 0;
LABEL_47:

  return v51;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[NSArray hash](self->_punchoutOptions, "hash");
  v4 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v5 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v6 = 2654435761;
  else
    v6 = 0;
  if (self->_hasTopPadding)
    v7 = 2654435761;
  else
    v7 = 0;
  if (self->_hasBottomPadding)
    v8 = 2654435761;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_type, "hash") ^ (2654435761 * self->_separatorStyle);
  v10 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v11 = v10 ^ -[NSArray hash](self->_leadingCardSections, "hash");
  v12 = v11 ^ -[NSArray hash](self->_trailingCardSections, "hash");
  return v9 ^ v12 ^ -[_SFPBGraphicalFloat hash](self->_leadingToTrailingRatio, "hash");
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
  uint64_t v33;
  void *v34;
  void *v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBLeadingTrailingCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBLeadingTrailingCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBLeadingTrailingCardSection hasBottomPadding](self, "hasBottomPadding"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBLeadingTrailingCardSection hasTopPadding](self, "hasTopPadding"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasTopPadding"));

  }
  if (-[NSArray count](self->_leadingCardSections, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v11 = self->_leadingCardSections;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "dictionaryRepresentation");
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
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("leadingCardSections"));
  }
  if (self->_leadingToTrailingRatio)
  {
    -[_SFPBLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("leadingToTrailingRatio"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("leadingToTrailingRatio"));

    }
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v22 = self->_punchoutOptions;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v51 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "dictionaryRepresentation");
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
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBLeadingTrailingCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBLeadingTrailingCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v33 = -[_SFPBLeadingTrailingCardSection separatorStyle](self, "separatorStyle");
    if (v33 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = *(&off_1E40421B0 + v33);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("separatorStyle"));

  }
  if (-[NSArray count](self->_trailingCardSections, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = self->_trailingCardSections;
    v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v47 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "dictionaryRepresentation");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            objc_msgSend(v35, "addObject:", v41);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v42);

          }
        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v38);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("trailingCardSections"));
  }
  if (self->_type)
  {
    -[_SFPBLeadingTrailingCardSection type](self, "type");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBLeadingTrailingCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBLeadingTrailingCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBLeadingTrailingCardSection *v5;
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
    self = -[_SFPBLeadingTrailingCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBLeadingTrailingCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBLeadingTrailingCardSection *v5;
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
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  _SFPBCardSection *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  _SFPBCardSection *v41;
  void *v42;
  _SFPBGraphicalFloat *v43;
  _SFPBLeadingTrailingCardSection *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)_SFPBLeadingTrailingCardSection;
  v5 = -[_SFPBLeadingTrailingCardSection init](&v68, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v65 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBLeadingTrailingCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
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
      -[_SFPBLeadingTrailingCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    v51 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBLeadingTrailingCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    v50 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBLeadingTrailingCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBLeadingTrailingCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBLeadingTrailingCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBLeadingTrailingCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBLeadingTrailingCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBLeadingTrailingCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    v47 = (void *)v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingCardSections"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v26;
    v48 = v23;
    v49 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v61 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v33 = -[_SFPBCardSection initWithDictionary:]([_SFPBCardSection alloc], "initWithDictionary:", v32);
              -[_SFPBLeadingTrailingCardSection addLeadingCardSections:](v5, "addLeadingCardSections:", v33);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        }
        while (v29);
      }

      v23 = v48;
      v18 = v49;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingCardSections"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v6;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v35 = v34;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v57 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = -[_SFPBCardSection initWithDictionary:]([_SFPBCardSection alloc], "initWithDictionary:", v40);
              -[_SFPBLeadingTrailingCardSection addTrailingCardSections:](v5, "addTrailingCardSections:", v41);

            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        }
        while (v37);
      }

      v6 = v46;
      v23 = v48;
      v18 = v49;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingToTrailingRatio"), v46);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v42);
      -[_SFPBLeadingTrailingCardSection setLeadingToTrailingRatio:](v5, "setLeadingToTrailingRatio:", v43);

    }
    v44 = v5;

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

- (NSArray)leadingCardSections
{
  return self->_leadingCardSections;
}

- (NSArray)trailingCardSections
{
  return self->_trailingCardSections;
}

- (_SFPBGraphicalFloat)leadingToTrailingRatio
{
  return self->_leadingToTrailingRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingToTrailingRatio, 0);
  objc_storeStrong((id *)&self->_trailingCardSections, 0);
  objc_storeStrong((id *)&self->_leadingCardSections, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
