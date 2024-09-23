@implementation _SFPBStrokeAnimationCardSection

- (_SFPBStrokeAnimationCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBStrokeAnimationCardSection *v5;
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
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  _SFPBStrokeAnimationCardSection *v47;
  __int128 v49;
  __int128 v50;
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
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBStrokeAnimationCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
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
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v10);
    }

    -[_SFPBStrokeAnimationCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBStrokeAnimationCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBStrokeAnimationCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBStrokeAnimationCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBStrokeAnimationCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBStrokeAnimationCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBStrokeAnimationCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBStrokeAnimationCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBStrokeAnimationCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "strokeAnimationRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "strokeAnimationRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBStrokeAnimationCardSection setStrokeAnimationRepresentation:](v5, "setStrokeAnimationRepresentation:", v25);

    }
    objc_msgSend(v4, "strokeNames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v4, "strokeNames");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v58 != v31)
            objc_enumerationMutation(v28);
          if (*(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j))
            objc_msgSend(v27, "addObject:");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v30);
    }

    -[_SFPBStrokeAnimationCardSection setStrokeNames:](v5, "setStrokeNames:", v27);
    objc_msgSend(v4, "characters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v34 = 0;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v4, "characters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v35);
          if (*(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k))
            objc_msgSend(v34, "addObject:");
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v37);
    }

    -[_SFPBStrokeAnimationCardSection setCharacters:](v5, "setCharacters:", v34);
    objc_msgSend(v4, "pronunciations");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v41 = 0;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v4, "pronunciations", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v50;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(v42);
          if (*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m))
            objc_msgSend(v41, "addObject:");
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      }
      while (v44);
    }

    -[_SFPBStrokeAnimationCardSection setPronunciations:](v5, "setPronunciations:", v41);
    v47 = v5;

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

- (void)setStrokeAnimationRepresentation:(id)a3
{
  NSString *v4;
  NSString *strokeAnimationRepresentation;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  strokeAnimationRepresentation = self->_strokeAnimationRepresentation;
  self->_strokeAnimationRepresentation = v4;

}

- (void)setStrokeNames:(id)a3
{
  NSArray *v4;
  NSArray *strokeNames;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  strokeNames = self->_strokeNames;
  self->_strokeNames = v4;

}

- (void)clearStrokeNames
{
  -[NSArray removeAllObjects](self->_strokeNames, "removeAllObjects");
}

- (void)addStrokeNames:(id)a3
{
  id v4;
  NSArray *strokeNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  strokeNames = self->_strokeNames;
  v8 = v4;
  if (!strokeNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_strokeNames;
    self->_strokeNames = v6;

    v4 = v8;
    strokeNames = self->_strokeNames;
  }
  -[NSArray addObject:](strokeNames, "addObject:", v4);

}

- (unint64_t)strokeNamesCount
{
  return -[NSArray count](self->_strokeNames, "count");
}

- (id)strokeNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_strokeNames, "objectAtIndexedSubscript:", a3);
}

- (void)setCharacters:(id)a3
{
  NSArray *v4;
  NSArray *characters;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  characters = self->_characters;
  self->_characters = v4;

}

- (void)clearCharacters
{
  -[NSArray removeAllObjects](self->_characters, "removeAllObjects");
}

- (void)addCharacters:(id)a3
{
  id v4;
  NSArray *characters;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  characters = self->_characters;
  v8 = v4;
  if (!characters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_characters;
    self->_characters = v6;

    v4 = v8;
    characters = self->_characters;
  }
  -[NSArray addObject:](characters, "addObject:", v4);

}

- (unint64_t)charactersCount
{
  return -[NSArray count](self->_characters, "count");
}

- (id)charactersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_characters, "objectAtIndexedSubscript:", a3);
}

- (void)setPronunciations:(id)a3
{
  NSArray *v4;
  NSArray *pronunciations;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  pronunciations = self->_pronunciations;
  self->_pronunciations = v4;

}

- (void)clearPronunciations
{
  -[NSArray removeAllObjects](self->_pronunciations, "removeAllObjects");
}

- (void)addPronunciations:(id)a3
{
  id v4;
  NSArray *pronunciations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  pronunciations = self->_pronunciations;
  v8 = v4;
  if (!pronunciations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pronunciations;
    self->_pronunciations = v6;

    v4 = v8;
    pronunciations = self->_pronunciations;
  }
  -[NSArray addObject:](pronunciations, "addObject:", v4);

}

- (unint64_t)pronunciationsCount
{
  return -[NSArray count](self->_pronunciations, "count");
}

- (id)pronunciationsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_pronunciations, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStrokeAnimationCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBStrokeAnimationCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v7);
  }

  -[_SFPBStrokeAnimationCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBStrokeAnimationCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBStrokeAnimationCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBStrokeAnimationCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBStrokeAnimationCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBStrokeAnimationCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBStrokeAnimationCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBStrokeAnimationCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBStrokeAnimationCardSection strokeNames](self, "strokeNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v17);
  }

  -[_SFPBStrokeAnimationCardSection characters](self, "characters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v22);
  }

  -[_SFPBStrokeAnimationCardSection pronunciations](self, "pronunciations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v27);
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
  char v55;
  BOOL v56;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  -[_SFPBStrokeAnimationCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBStrokeAnimationCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_51;
  }
  else
  {

  }
  -[_SFPBStrokeAnimationCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBStrokeAnimationCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_51;
  }
  else
  {

  }
  -[_SFPBStrokeAnimationCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBStrokeAnimationCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_51;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_51;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_51;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_51;
  -[_SFPBStrokeAnimationCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBStrokeAnimationCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_51;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_51;
  -[_SFPBStrokeAnimationCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBStrokeAnimationCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_51;
  }
  else
  {

  }
  -[_SFPBStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeAnimationRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokeAnimationRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_51;
  }
  else
  {

  }
  -[_SFPBStrokeAnimationCardSection strokeNames](self, "strokeNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection strokeNames](self, "strokeNames");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBStrokeAnimationCardSection strokeNames](self, "strokeNames");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokeNames");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_51;
  }
  else
  {

  }
  -[_SFPBStrokeAnimationCardSection characters](self, "characters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_SFPBStrokeAnimationCardSection characters](self, "characters");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBStrokeAnimationCardSection characters](self, "characters");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characters");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_51;
  }
  else
  {

  }
  -[_SFPBStrokeAnimationCardSection pronunciations](self, "pronunciations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pronunciations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_50:

    goto LABEL_51;
  }
  -[_SFPBStrokeAnimationCardSection pronunciations](self, "pronunciations");
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v51)
  {

LABEL_54:
    v56 = 1;
    goto LABEL_52;
  }
  v52 = (void *)v51;
  -[_SFPBStrokeAnimationCardSection pronunciations](self, "pronunciations");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pronunciations");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v53, "isEqual:", v54);

  if ((v55 & 1) != 0)
    goto LABEL_54;
LABEL_51:
  v56 = 0;
LABEL_52:

  return v56;
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
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;

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
  v11 = v10 ^ -[NSString hash](self->_strokeAnimationRepresentation, "hash");
  v12 = v11 ^ -[NSArray hash](self->_strokeNames, "hash");
  v13 = v12 ^ -[NSArray hash](self->_characters, "hash");
  return v9 ^ v13 ^ -[NSArray hash](self->_pronunciations, "hash");
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBStrokeAnimationCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBStrokeAnimationCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_characters)
  {
    -[_SFPBStrokeAnimationCardSection characters](self, "characters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("characters"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBStrokeAnimationCardSection hasBottomPadding](self, "hasBottomPadding"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBStrokeAnimationCardSection hasTopPadding](self, "hasTopPadding"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasTopPadding"));

  }
  if (self->_pronunciations)
  {
    -[_SFPBStrokeAnimationCardSection pronunciations](self, "pronunciations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("pronunciations"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = self->_punchoutOptions;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v14, "addObject:", v20);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBStrokeAnimationCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBStrokeAnimationCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v26 = -[_SFPBStrokeAnimationCardSection separatorStyle](self, "separatorStyle");
    if (v26 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = *(&off_1E40421B0 + v26);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("separatorStyle"));

  }
  if (self->_strokeAnimationRepresentation)
  {
    -[_SFPBStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("strokeAnimationRepresentation"));

  }
  if (self->_strokeNames)
  {
    -[_SFPBStrokeAnimationCardSection strokeNames](self, "strokeNames");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("strokeNames"));

  }
  if (self->_type)
  {
    -[_SFPBStrokeAnimationCardSection type](self, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBStrokeAnimationCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBStrokeAnimationCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBStrokeAnimationCardSection *v5;
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
    self = -[_SFPBStrokeAnimationCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBStrokeAnimationCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBStrokeAnimationCardSection *v5;
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
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  _SFPBStrokeAnimationCardSection *v53;
  id v55;
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
  __int128 v66;
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
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)_SFPBStrokeAnimationCardSection;
  v5 = -[_SFPBStrokeAnimationCardSection init](&v82, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v79 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBStrokeAnimationCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
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
      -[_SFPBStrokeAnimationCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBStrokeAnimationCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStrokeAnimationCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStrokeAnimationCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStrokeAnimationCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBStrokeAnimationCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStrokeAnimationCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    v59 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBStrokeAnimationCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    v57 = (void *)v24;
    v58 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("strokeAnimationRepresentation"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBStrokeAnimationCardSection setStrokeAnimationRepresentation:](v5, "setStrokeAnimationRepresentation:", v27);

    }
    v56 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("strokeNames"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v75 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = (void *)objc_msgSend(v34, "copy");
              -[_SFPBStrokeAnimationCardSection addStrokeNames:](v5, "addStrokeNames:", v35);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
        }
        while (v31);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characters"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v4;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v38 = v36;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v71 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = (void *)objc_msgSend(v43, "copy");
              -[_SFPBStrokeAnimationCardSection addCharacters:](v5, "addCharacters:", v44);

            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
        }
        while (v40);
      }

      v4 = v37;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pronunciations"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = v4;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v46 = v45;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v67;
        do
        {
          for (m = 0; m != v48; ++m)
          {
            if (*(_QWORD *)v67 != v49)
              objc_enumerationMutation(v46);
            v51 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v52 = (void *)objc_msgSend(v51, "copy");
              -[_SFPBStrokeAnimationCardSection addPronunciations:](v5, "addPronunciations:", v52);

            }
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
        }
        while (v48);
      }

      v4 = v55;
    }
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

- (NSString)strokeAnimationRepresentation
{
  return self->_strokeAnimationRepresentation;
}

- (NSArray)strokeNames
{
  return self->_strokeNames;
}

- (NSArray)characters
{
  return self->_characters;
}

- (NSArray)pronunciations
{
  return self->_pronunciations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_characters, 0);
  objc_storeStrong((id *)&self->_strokeNames, 0);
  objc_storeStrong((id *)&self->_strokeAnimationRepresentation, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
